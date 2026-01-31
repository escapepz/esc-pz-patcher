package zombie.iso;

import java.io.File;
import java.io.IOException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Stack;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.zip.CRC32;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import zombie.ChunkMapFilenames;
import zombie.GameWindow;
import zombie.SystemDisabler;
import zombie.characters.IsoPlayer;
import zombie.core.Core;
import zombie.core.ThreadGroups;
import zombie.core.Translator;
import zombie.core.network.ByteBufferWriter;
import zombie.core.raknet.UdpConnection;
import zombie.debug.DebugLog;
import zombie.debug.DebugOptions;
import zombie.debug.DebugType;
import zombie.erosion.categories.ErosionCategory;
import zombie.gameStates.GameLoadingState;
import zombie.iso.ChunkSaveWorker;
import zombie.iso.IsoChunk;
import zombie.iso.IsoChunkMap;
import zombie.iso.IsoGridSquare;
import zombie.iso.IsoObject;
import zombie.iso.IsoWorld;
import zombie.iso.WorldStreamer;
import zombie.network.ChunkChecksum;
import zombie.network.GameClient;
import zombie.network.GameServer;
import zombie.network.MPStatistics;
import zombie.network.PacketTypes;
import zombie.savefile.PlayerDB;
import zombie.vehicles.VehiclesDB2;

/*
 * Exception performing whole class analysis ignored.
 */
public final class WorldStreamer {
    static {
        DebugLog.log((String)("PATCHED: WorldStreamer"));
    }
    static final ChunkComparator comp = new ChunkComparator();
    private static final int CRF_CANCEL = 1;
    private static final int CRF_CANCEL_SENT = 2;
    private static final int CRF_DELETE = 4;
    private static final int CRF_TIMEOUT = 8;
    private static final int CRF_RECEIVED = 16;
    private static final int BLOCK_SIZE = 1024;
    public static WorldStreamer instance = new WorldStreamer();
    private final ConcurrentLinkedQueue<IsoChunk> jobQueue = new ConcurrentLinkedQueue();
    private final Stack<IsoChunk> jobList = new Stack();
    private final ConcurrentLinkedQueue<IsoChunk> chunkRequests0 = new ConcurrentLinkedQueue();
    private final ArrayList<IsoChunk> chunkRequests1 = new ArrayList();
    private final ArrayList<ChunkRequest> pendingRequests = new ArrayList();
    private final ArrayList<ChunkRequest> pendingRequests1 = new ArrayList();
    private final ConcurrentLinkedQueue<ChunkRequest> sentRequests = new ConcurrentLinkedQueue();
    private final CRC32 crc32 = new CRC32();
    private final ConcurrentLinkedQueue<ByteBuffer> freeBuffers = new ConcurrentLinkedQueue();
    private final ConcurrentLinkedQueue<ChunkRequest> waitingToSendQ = new ConcurrentLinkedQueue();
    private final ArrayList<ChunkRequest> tempRequests = new ArrayList();
    private final Inflater decompressor = new Inflater();
    private final byte[] readBuf = new byte[1024];
    private final ConcurrentLinkedQueue<ChunkRequest> waitingToCancelQ = new ConcurrentLinkedQueue();
    public Thread worldStreamer;
    public boolean bFinished = false;
    private IsoChunk chunkHeadMain;
    private int requestNumber;
    private boolean bCompare = false;
    private boolean NetworkFileDebug;
    private ByteBuffer inMemoryZip;
    private boolean requestingLargeArea = false;
    private volatile int largeAreaDownloads;
    private ByteBuffer bb1 = ByteBuffer.allocate(5120);
    private ByteBuffer bb2 = ByteBuffer.allocate(5120);

    private int bufferSize(int n) {
        return (n + 1024 - 1) / 1024 * 1024;
    }

    private ByteBuffer ensureCapacity(ByteBuffer byteBuffer, int n) {
        if (byteBuffer == null) {
            return ByteBuffer.allocate(this.bufferSize(n));
        }
        if (byteBuffer.capacity() < n) {
            ByteBuffer byteBuffer2 = ByteBuffer.allocate(this.bufferSize(n));
            return byteBuffer2.put(byteBuffer.array(), 0, byteBuffer.position());
        }
        return byteBuffer;
    }

    private ByteBuffer getByteBuffer(int n) {
        ByteBuffer byteBuffer = this.freeBuffers.poll();
        if (byteBuffer == null) {
            return ByteBuffer.allocate(this.bufferSize(n));
        }
        byteBuffer.clear();
        return this.ensureCapacity(byteBuffer, n);
    }

    private void releaseBuffer(ByteBuffer byteBuffer) {
        this.freeBuffers.add(byteBuffer);
    }

    private void sendRequests() throws IOException {
        if (this.chunkRequests1.isEmpty()) {
            return;
        }
        if (this.requestingLargeArea && this.pendingRequests1.size() > 20) {
            return;
        }
        long l = System.currentTimeMillis();
        ChunkRequest chunkRequest = null;
        ChunkRequest chunkRequest2 = null;
        for (int i = this.chunkRequests1.size() - 1; i >= 0; --i) {
            IsoChunk isoChunk = this.chunkRequests1.get(i);
            ChunkRequest chunkRequest3 = ChunkRequest.alloc();
            chunkRequest3.chunk = isoChunk;
            ++this.requestNumber;
            chunkRequest3.requestNumber = chunkRequest3.requestNumber;
            chunkRequest3.time = l;
            chunkRequest3.crc = ChunkChecksum.getChecksum((int)isoChunk.wx, (int)isoChunk.wy);
            if (chunkRequest == null) {
                chunkRequest = chunkRequest3;
            } else {
                chunkRequest2.next = chunkRequest3;
            }
            chunkRequest3.next = null;
            chunkRequest2 = chunkRequest3;
            this.pendingRequests1.add(chunkRequest3);
            this.chunkRequests1.remove(i);
            if (this.requestingLargeArea && this.pendingRequests1.size() >= 40) break;
        }
        this.waitingToSendQ.add(chunkRequest);
    }

    public void updateMain() {
        ChunkRequest chunkRequest;
        UdpConnection udpConnection = GameClient.connection;
        if (this.chunkHeadMain != null) {
            this.chunkRequests0.add(this.chunkHeadMain);
            this.chunkHeadMain = null;
        }
        this.tempRequests.clear();
        ChunkRequest chunkRequest2 = this.waitingToSendQ.poll();
        while (chunkRequest2 != null) {
            while (chunkRequest2 != null) {
                ChunkRequest chunkRequest3 = chunkRequest2.next;
                if ((chunkRequest2.flagsWS & 1) != 0) {
                    chunkRequest2.flagsUDP |= 0x10;
                } else {
                    this.tempRequests.add(chunkRequest2);
                }
                chunkRequest2 = chunkRequest3;
            }
            chunkRequest2 = this.waitingToSendQ.poll();
        }
        if (!this.tempRequests.isEmpty()) {
            int n;
            chunkRequest2 = udpConnection.startPacket();
            PacketTypes.PacketType.RequestZipList.doPacket((ByteBufferWriter)chunkRequest2);
            chunkRequest2.putInt(this.tempRequests.size());
            for (n = 0; n < this.tempRequests.size(); ++n) {
                chunkRequest = this.tempRequests.get(n);
                chunkRequest2.putInt(chunkRequest.requestNumber);
                chunkRequest2.putInt(chunkRequest.chunk.wx);
                chunkRequest2.putInt(chunkRequest.chunk.wy);
                chunkRequest2.putLong(chunkRequest.crc);
                if (!this.NetworkFileDebug) continue;
                DebugLog.log((DebugType)DebugType.NetworkFileDebug, (String)("requested " + chunkRequest.chunk.wx + "," + chunkRequest.chunk.wy + " crc=" + chunkRequest.crc));
            }
            PacketTypes.PacketType.RequestZipList.send(udpConnection);
            for (n = 0; n < this.tempRequests.size(); ++n) {
                chunkRequest = this.tempRequests.get(n);
                this.sentRequests.add(chunkRequest);
            }
        }
        this.tempRequests.clear();
        chunkRequest2 = this.waitingToCancelQ.poll();
        while (chunkRequest2 != null) {
            this.tempRequests.add(chunkRequest2);
            chunkRequest2 = this.waitingToCancelQ.poll();
        }
        if (!this.tempRequests.isEmpty()) {
            chunkRequest2 = udpConnection.startPacket();
            PacketTypes.PacketType.NotRequiredInZip.doPacket((ByteBufferWriter)chunkRequest2);
            try {
                chunkRequest2.putInt(this.tempRequests.size());
                for (int i = 0; i < this.tempRequests.size(); ++i) {
                    chunkRequest = this.tempRequests.get(i);
                    if (this.NetworkFileDebug) {
                        DebugLog.log((DebugType)DebugType.NetworkFileDebug, (String)("cancelled " + chunkRequest.chunk.wx + "," + chunkRequest.chunk.wy));
                    }
                    chunkRequest2.putInt(chunkRequest.requestNumber);
                    chunkRequest.flagsMain |= 2;
                }
                PacketTypes.PacketType.NotRequiredInZip.send(udpConnection);
            }
            catch (Exception exception) {
                exception.printStackTrace();
                udpConnection.cancelPacket();
            }
        }
    }

    public void getStatistics() {
        MPStatistics.countChunkRequests((int)this.sentRequests.size(), (int)this.chunkRequests0.size(), (int)this.chunkRequests1.size(), (int)this.pendingRequests.size(), (int)this.pendingRequests1.size());
    }

    private void loadReceivedChunks() throws DataFormatException, IOException {
        boolean bl = false;
        int n = 0;
        int n2 = 0;
        for (int i = 0; i < this.pendingRequests1.size(); ++i) {
            Comparable<ByteBuffer> comparable;
            ChunkRequest chunkRequest = this.pendingRequests1.get(i);
            if ((chunkRequest.flagsUDP & 0x10) == 0) continue;
            if (bl) {
                ++n;
                if ((chunkRequest.flagsWS & 1) != 0) {
                    ++n2;
                }
            }
            if ((chunkRequest.flagsWS & 1) != 0 && (chunkRequest.flagsMain & 2) == 0) continue;
            this.pendingRequests1.remove(i--);
            ChunkSaveWorker.instance.Update(chunkRequest.chunk);
            if ((chunkRequest.flagsUDP & 4) != 0 && ((File)(comparable = ChunkMapFilenames.instance.getFilename(chunkRequest.chunk.wx, chunkRequest.chunk.wy))).exists()) {
                if (this.NetworkFileDebug) {
                    DebugLog.log((DebugType)DebugType.NetworkFileDebug, (String)("deleting map_" + chunkRequest.chunk.wx + "_" + chunkRequest.chunk.wy + ".bin because it doesn't exist on the server"));
                }
                ((File)comparable).delete();
                ChunkChecksum.setChecksum((int)chunkRequest.chunk.wx, (int)chunkRequest.chunk.wy, (long)0L);
            }
            Comparable<ByteBuffer> comparable2 = comparable = (chunkRequest.flagsWS & 1) != 0 ? null : chunkRequest.bb;
            if (comparable != null) {
                File file;
                try {
                    comparable = this.decompress((ByteBuffer)comparable);
                }
                catch (DataFormatException dataFormatException) {
                    DebugLog.General.error((Object)("WorldStreamer.loadReceivedChunks: Error while the chunk (" + chunkRequest.chunk.wx + ", " + chunkRequest.chunk.wy + ") was decompressing"));
                    this.chunkRequests1.add(chunkRequest.chunk);
                    continue;
                }
                if (this.bCompare && (file = ChunkMapFilenames.instance.getFilename(chunkRequest.chunk.wx, chunkRequest.chunk.wy)).exists()) {
                    this.compare(chunkRequest, (ByteBuffer)comparable, file);
                }
            }
            if ((chunkRequest.flagsWS & 8) == 0) {
                if ((chunkRequest.flagsWS & 1) != 0 || chunkRequest.chunk.refs.isEmpty()) {
                    if (this.NetworkFileDebug) {
                        DebugLog.log((DebugType)DebugType.NetworkFileDebug, (String)(chunkRequest.chunk.wx + "_" + chunkRequest.chunk.wy + " refs.isEmpty() SafeWrite=" + (comparable != null)));
                    }
                    if (comparable != null) {
                        long l = ChunkChecksum.getChecksumIfExists((int)chunkRequest.chunk.wx, (int)chunkRequest.chunk.wy);
                        this.crc32.reset();
                        this.crc32.update(((ByteBuffer)comparable).array(), 0, ((Buffer)((Object)comparable)).position());
                        if (l != this.crc32.getValue()) {
                            ChunkChecksum.setChecksum((int)chunkRequest.chunk.wx, (int)chunkRequest.chunk.wy, (long)this.crc32.getValue());
                            IsoChunk.SafeWrite((String)"map_", (int)chunkRequest.chunk.wx, (int)chunkRequest.chunk.wy, comparable);
                        }
                    }
                    chunkRequest.chunk.resetForStore();
                    assert (!IsoChunkMap.chunkStore.contains(chunkRequest.chunk));
                    IsoChunkMap.chunkStore.add(chunkRequest.chunk);
                } else {
                    if (comparable != null) {
                        ((ByteBuffer)comparable).position(0);
                    }
                    this.DoChunk(chunkRequest.chunk, (ByteBuffer)comparable);
                }
            }
            if (chunkRequest.bb != null) {
                this.releaseBuffer(chunkRequest.bb);
            }
            ChunkRequest.release((ChunkRequest)chunkRequest);
        }
        if (bl && (n != 0 || n2 != 0 || !this.pendingRequests1.isEmpty())) {
            DebugLog.log((String)("nReceived=" + n + " nCancel=" + n2 + " nPending=" + this.pendingRequests1.size()));
        }
    }

    private ByteBuffer decompress(ByteBuffer byteBuffer) throws DataFormatException {
        this.decompressor.reset();
        this.decompressor.setInput(byteBuffer.array(), 0, byteBuffer.position());
        int n = 0;
        if (this.inMemoryZip != null) {
            this.inMemoryZip.clear();
        }
        while (!this.decompressor.finished()) {
            int n2 = this.decompressor.inflate(this.readBuf);
            if (n2 != 0) {
                this.inMemoryZip = this.ensureCapacity(this.inMemoryZip, n + n2);
                this.inMemoryZip.put(this.readBuf, 0, n2);
                n += n2;
                continue;
            }
            if (this.decompressor.finished()) continue;
            throw new DataFormatException();
        }
        this.inMemoryZip.limit(this.inMemoryZip.position());
        return this.inMemoryZip;
    }

    private void threadLoop() throws DataFormatException, InterruptedException, IOException {
        IsoChunk isoChunk;
        IsoChunk isoChunk2;
        if (GameClient.bClient && !SystemDisabler.doWorldSyncEnable) {
            this.NetworkFileDebug = DebugType.Do((DebugType)DebugType.NetworkFileDebug);
            isoChunk2 = this.chunkRequests0.poll();
            while (isoChunk2 != null) {
                while (isoChunk2 != null) {
                    isoChunk = isoChunk2.next;
                    this.chunkRequests1.add(isoChunk2);
                    isoChunk2 = isoChunk;
                }
                isoChunk2 = this.chunkRequests0.poll();
            }
            if (!this.chunkRequests1.isEmpty()) {
                comp.init();
                Collections.sort(this.chunkRequests1, comp);
                this.sendRequests();
            }
            this.loadReceivedChunks();
            this.cancelOutOfBoundsRequests();
            this.resendTimedOutRequests();
        }
        isoChunk2 = this.jobQueue.poll();
        while (isoChunk2 != null) {
            if (this.jobList.contains(isoChunk2)) {
                DebugLog.log((String)"Ignoring duplicate chunk added to WorldStreamer.jobList");
            } else {
                this.jobList.add(isoChunk2);
            }
            isoChunk2 = this.jobQueue.poll();
        }
        if (!this.jobList.isEmpty()) {
            int n;
            for (n = this.jobList.size() - 1; n >= 0; --n) {
                isoChunk = (IsoChunk)this.jobList.get(n);
                if (!isoChunk.refs.isEmpty()) continue;
                this.jobList.remove(n);
                isoChunk.resetForStore();
                assert (!IsoChunkMap.chunkStore.contains(isoChunk));
                IsoChunkMap.chunkStore.add(isoChunk);
            }
            n = !this.jobList.isEmpty() ? 1 : 0;
            isoChunk = null;
            if (n != 0) {
                comp.init();
                Collections.sort(this.jobList, comp);
                isoChunk = (IsoChunk)this.jobList.remove(this.jobList.size() - 1);
            }
            ChunkSaveWorker.instance.Update(isoChunk);
            if (isoChunk != null) {
                if (isoChunk.refs.isEmpty()) {
                    isoChunk.resetForStore();
                    assert (!IsoChunkMap.chunkStore.contains(isoChunk));
                    IsoChunkMap.chunkStore.add(isoChunk);
                } else {
                    this.DoChunk(isoChunk, null);
                }
            }
            if (n != 0 || ChunkSaveWorker.instance.bSaving) {
                return;
            }
        } else {
            ChunkSaveWorker.instance.Update(null);
            if (ChunkSaveWorker.instance.bSaving) {
                return;
            }
            if (!this.pendingRequests1.isEmpty()) {
                Thread.sleep(20L);
                return;
            }
            Thread.sleep(140L);
        }
        if (!GameClient.bClient && !GameWindow.bLoadedAsClient && PlayerDB.isAvailable()) {
            PlayerDB.getInstance().updateWorldStreamer();
        }
        VehiclesDB2.instance.updateWorldStreamer();
        if (IsoPlayer.getInstance() != null) {
            Thread.sleep(140L);
        } else {
            Thread.sleep(0L);
        }
    }

    public void create() {
        if (this.worldStreamer != null) {
            return;
        }
        if (GameServer.bServer) {
            return;
        }
        this.bFinished = false;
        this.worldStreamer = new Thread(ThreadGroups.Workers, () -> {
            while (!this.bFinished) {
                try {
                    this.threadLoop();
                }
                catch (Exception exception) {
                    exception.printStackTrace();
                }
            }
        });
        this.worldStreamer.setPriority(5);
        this.worldStreamer.setDaemon(true);
        this.worldStreamer.setName("World Streamer");
        this.worldStreamer.setUncaughtExceptionHandler(GameWindow::uncaughtException);
        this.worldStreamer.start();
    }

    public void addJob(IsoChunk isoChunk, int n, int n2, boolean bl) {
        if (GameServer.bServer) {
            return;
        }
        isoChunk.wx = n;
        isoChunk.wy = n2;
        if (GameClient.bClient && !SystemDisabler.doWorldSyncEnable && bl) {
            isoChunk.next = this.chunkHeadMain;
            this.chunkHeadMain = isoChunk;
            return;
        }
        assert (!this.jobQueue.contains(isoChunk));
        assert (!this.jobList.contains(isoChunk));
        this.jobQueue.add(isoChunk);
    }

    public void DoChunk(IsoChunk isoChunk, ByteBuffer byteBuffer) {
        if (GameServer.bServer) {
            return;
        }
        this.DoChunkAlways(isoChunk, byteBuffer);
    }

    public void DoChunkAlways(IsoChunk isoChunk, ByteBuffer byteBuffer) {
        block16: {
            if (Core.bDebug && DebugOptions.instance.WorldStreamerSlowLoad.getValue()) {
                try {
                    Thread.sleep(50L);
                }
                catch (InterruptedException interruptedException) {
                    // empty catch block
                }
            }
            if (isoChunk == null) {
                return;
            }
            try {
                if (!isoChunk.LoadOrCreate(isoChunk.wx, isoChunk.wy, byteBuffer)) {
                    if (GameClient.bClient) {
                        ChunkChecksum.setChecksum((int)isoChunk.wx, (int)isoChunk.wy, (long)0L);
                    }
                    isoChunk.Blam(isoChunk.wx, isoChunk.wy);
                    if (!isoChunk.LoadBrandNew(isoChunk.wx, isoChunk.wy)) {
                        return;
                    }
                }
                if (byteBuffer == null) {
                    VehiclesDB2.instance.loadChunk(isoChunk);
                }
            }
            catch (Exception exception) {
                DebugLog.General.error((Object)("Exception thrown while trying to load chunk: " + isoChunk.wx + ", " + isoChunk.wy));
                exception.printStackTrace();
                if (GameClient.bClient) {
                    ChunkChecksum.setChecksum((int)isoChunk.wx, (int)isoChunk.wy, (long)0L);
                }
                isoChunk.Blam(isoChunk.wx, isoChunk.wy);
                if (isoChunk.LoadBrandNew(isoChunk.wx, isoChunk.wy)) break block16;
                return;
            }
        }
        if (isoChunk.jobType != IsoChunk.JobType.Convert && isoChunk.jobType != IsoChunk.JobType.SoftReset) {
            try {
                if (!isoChunk.refs.isEmpty()) {
                    isoChunk.loadInWorldStreamerThread();
                }
            }
            catch (Exception exception) {
                exception.printStackTrace();
            }
            IsoChunk.loadGridSquare.add(isoChunk);
        } else {
            isoChunk.doLoadGridsquare();
            isoChunk.bLoaded = true;
        }
    }

    public void addJobInstant(IsoChunk isoChunk, int n, int n2, int n3, int n4) {
        if (GameServer.bServer) {
            return;
        }
        isoChunk.wx = n3;
        isoChunk.wy = n4;
        try {
            this.DoChunkAlways(isoChunk, null);
        }
        catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public void addJobConvert(IsoChunk isoChunk, int n, int n2, int n3, int n4) {
        if (GameServer.bServer) {
            return;
        }
        isoChunk.wx = n3;
        isoChunk.wy = n4;
        isoChunk.jobType = IsoChunk.JobType.Convert;
        try {
            this.DoChunk(isoChunk, null);
        }
        catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public void addJobWipe(IsoChunk isoChunk, int n, int n2, int n3, int n4) {
        isoChunk.wx = n3;
        isoChunk.wy = n4;
        isoChunk.jobType = IsoChunk.JobType.SoftReset;
        try {
            this.DoChunkAlways(isoChunk, null);
        }
        catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public boolean isBusy() {
        if (!(!GameClient.bClient || this.chunkRequests0.isEmpty() && this.chunkRequests1.isEmpty() && this.chunkHeadMain == null && this.waitingToSendQ.isEmpty() && this.waitingToCancelQ.isEmpty() && this.sentRequests.isEmpty() && this.pendingRequests.isEmpty() && this.pendingRequests1.isEmpty())) {
            return true;
        }
        return !this.jobQueue.isEmpty() || !this.jobList.isEmpty();
    }

    public void stop() {
        DebugLog.log((String)"EXITDEBUG: WorldStreamer.stop 1");
        if (this.worldStreamer == null) {
            return;
        }
        this.bFinished = true;
        DebugLog.log((String)"EXITDEBUG: WorldStreamer.stop 2");
        while (this.worldStreamer.isAlive()) {
        }
        DebugLog.log((String)"EXITDEBUG: WorldStreamer.stop 3");
        this.worldStreamer = null;
        this.jobList.clear();
        this.jobQueue.clear();
        DebugLog.log((String)"EXITDEBUG: WorldStreamer.stop 4");
        ChunkSaveWorker.instance.SaveNow();
        ChunkChecksum.Reset();
        DebugLog.log((String)"EXITDEBUG: WorldStreamer.stop 5");
    }

    public void quit() {
        this.stop();
    }

    public void requestLargeAreaZip(int n, int n2, int n3) throws IOException {
        long l;
        ByteBufferWriter byteBufferWriter = GameClient.connection.startPacket();
        PacketTypes.PacketType.RequestLargeAreaZip.doPacket(byteBufferWriter);
        byteBufferWriter.putInt(n);
        byteBufferWriter.putInt(n2);
        byteBufferWriter.putInt(IsoChunkMap.ChunkGridWidth);
        PacketTypes.PacketType.RequestLargeAreaZip.send(GameClient.connection);
        this.requestingLargeArea = true;
        this.largeAreaDownloads = 0;
        GameLoadingState.GameLoadingString = Translator.getText((String)"IGUI_MP_RequestMapData");
        int n4 = 0;
        int n5 = n - n3;
        int n6 = n2 - n3;
        int n7 = n + n3;
        int n8 = n2 + n3;
        for (int i = n6; i <= n8; ++i) {
            for (int j = n5; j <= n7; ++j) {
                if (!IsoWorld.instance.MetaGrid.isValidChunk(j, i)) continue;
                IsoChunk isoChunk = (IsoChunk)IsoChunkMap.chunkStore.poll();
                if (isoChunk == null) {
                    isoChunk = new IsoChunk(IsoWorld.instance.CurrentCell);
                } else {
                    MPStatistics.decreaseStoredChunk();
                }
                this.addJob(isoChunk, j, i, true);
                ++n4;
            }
        }
        DebugLog.log((String)("Requested " + n4 + " chunks from the server"));
        long l2 = l = System.currentTimeMillis();
        int n9 = 0;
        int n10 = 0;
        while (this.isBusy()) {
            long l3 = System.currentTimeMillis();
            if (l3 - l2 > 60000L) {
                DebugLog.log((String)("map download from server timed out"));
            }
            if (l3 - l2 > 600000L) { 
                DebugLog.log((String)("map download timed out after 10 minutes"));
            }
            int n11 = this.largeAreaDownloads;
            GameLoadingState.GameLoadingString = Translator.getText((String)"IGUI_MP_DownloadedMapData", (Object)n11, (Object)n4);
            long l4 = l3 - l;
            if (l4 / 1000L > (long)n9) {
                DebugLog.log((String)("Received " + n11 + " / " + n4 + " chunks"));
                n9 = (int)(l4 / 1000L);
            }
            if (n10 < n11) {
                l2 = l3;
                n10 = n11;
            }
            try {
                Thread.sleep(100L);
            }
            catch (InterruptedException interruptedException) {}
        }
        DebugLog.log((String)("Received " + this.largeAreaDownloads + " / " + n4 + " chunks"));
        this.requestingLargeArea = false;
    }

    private void cancelOutOfBoundsRequests() {
        if (this.requestingLargeArea) {
            return;
        }
        for (int i = 0; i < this.pendingRequests1.size(); ++i) {
            ChunkRequest chunkRequest = this.pendingRequests1.get(i);
            if ((chunkRequest.flagsWS & 1) != 0 || !chunkRequest.chunk.refs.isEmpty()) continue;
            chunkRequest.flagsWS |= 1;
            this.waitingToCancelQ.add(chunkRequest);
        }
    }

    private void resendTimedOutRequests() {
        long l = System.currentTimeMillis();
        for (int i = 0; i < this.pendingRequests1.size(); ++i) {
            ChunkRequest chunkRequest = this.pendingRequests1.get(i);
            if ((chunkRequest.flagsWS & 1) != 0 || chunkRequest.time + 8000L >= l) continue;
            if (this.NetworkFileDebug) {
                DebugLog.log((DebugType)DebugType.NetworkFileDebug, (String)("chunk request timed out " + chunkRequest.chunk.wx + "," + chunkRequest.chunk.wy));
            }
            this.chunkRequests1.add(chunkRequest.chunk);
            chunkRequest.flagsWS |= 9;
            chunkRequest.flagsMain |= 2;
        }
    }

    public void receiveChunkPart(ByteBuffer byteBuffer) {
        ChunkRequest chunkRequest = this.sentRequests.poll();
        while (chunkRequest != null) {
            this.pendingRequests.add(chunkRequest);
            chunkRequest = this.sentRequests.poll();
        }
        int n = byteBuffer.getInt();
        int n2 = byteBuffer.getInt();
        int n3 = byteBuffer.getInt();
        int n4 = byteBuffer.getInt();
        int n5 = byteBuffer.getInt();
        int n6 = byteBuffer.getInt();
        for (int i = 0; i < this.pendingRequests.size(); ++i) {
            ChunkRequest chunkRequest2 = this.pendingRequests.get(i);
            if ((chunkRequest2.flagsWS & 1) != 0) {
                this.pendingRequests.remove(i--);
                chunkRequest2.flagsUDP |= 0x10;
                continue;
            }
            if (chunkRequest2.requestNumber != n) continue;
            if (chunkRequest2.bb == null) {
                chunkRequest2.bb = this.getByteBuffer(n4);
            }
            System.arraycopy(byteBuffer.array(), byteBuffer.position(), chunkRequest2.bb.array(), n5, n6);
            if (chunkRequest2.partsReceived == null) {
                chunkRequest2.partsReceived = new boolean[n2];
            }
            chunkRequest2.partsReceived[n3] = true;
            if (!chunkRequest2.isReceived()) break;
            if (this.NetworkFileDebug) {
                DebugLog.log((DebugType)DebugType.NetworkFileDebug, (String)("received all parts for " + chunkRequest2.chunk.wx + "," + chunkRequest2.chunk.wy));
            }
            chunkRequest2.bb.position(n4);
            this.pendingRequests.remove(i);
            chunkRequest2.flagsUDP |= 0x10;
            if (!this.requestingLargeArea) break;
            ++this.largeAreaDownloads;
            break;
        }
    }

    public void receiveNotRequired(ByteBuffer byteBuffer) {
        ChunkRequest chunkRequest = this.sentRequests.poll();
        while (chunkRequest != null) {
            this.pendingRequests.add(chunkRequest);
            chunkRequest = this.sentRequests.poll();
        }
        int n = byteBuffer.getInt();
        block1: for (int i = 0; i < n; ++i) {
            int n2 = byteBuffer.getInt();
            boolean bl = byteBuffer.get() == 1;
            for (int j = 0; j < this.pendingRequests.size(); ++j) {
                ChunkRequest chunkRequest2 = this.pendingRequests.get(j);
                if ((chunkRequest2.flagsWS & 1) != 0) {
                    this.pendingRequests.remove(j--);
                    chunkRequest2.flagsUDP |= 0x10;
                    continue;
                }
                if (chunkRequest2.requestNumber != n2) continue;
                if (this.NetworkFileDebug) {
                    DebugLog.log((DebugType)DebugType.NetworkFileDebug, (String)("NotRequiredInZip " + chunkRequest2.chunk.wx + "," + chunkRequest2.chunk.wy + " delete=" + !bl));
                }
                if (!bl) {
                    chunkRequest2.flagsUDP |= 4;
                }
                this.pendingRequests.remove(j);
                chunkRequest2.flagsUDP |= 0x10;
                if (!this.requestingLargeArea) continue block1;
                ++this.largeAreaDownloads;
                continue block1;
            }
        }
    }

    private void compare(ChunkRequest chunkRequest, ByteBuffer byteBuffer, File file) throws IOException {
        IsoChunk isoChunk = (IsoChunk)IsoChunkMap.chunkStore.poll();
        if (isoChunk == null) {
            isoChunk = new IsoChunk(IsoWorld.instance.getCell());
        } else {
            MPStatistics.decreaseStoredChunk();
        }
        isoChunk.wx = chunkRequest.chunk.wx;
        isoChunk.wy = chunkRequest.chunk.wy;
        IsoChunk isoChunk2 = (IsoChunk)IsoChunkMap.chunkStore.poll();
        if (isoChunk2 == null) {
            isoChunk2 = new IsoChunk(IsoWorld.instance.getCell());
        } else {
            MPStatistics.decreaseStoredChunk();
        }
        isoChunk2.wx = chunkRequest.chunk.wx;
        isoChunk2.wy = chunkRequest.chunk.wy;
        int n = byteBuffer.position();
        byteBuffer.position(0);
        isoChunk.LoadFromBuffer(chunkRequest.chunk.wx, chunkRequest.chunk.wy, byteBuffer);
        byteBuffer.position(n);
        this.crc32.reset();
        this.crc32.update(byteBuffer.array(), 0, n);
        DebugLog.log((String)("downloaded crc=" + this.crc32.getValue() + " on-disk crc=" + ChunkChecksum.getChecksumIfExists((int)chunkRequest.chunk.wx, (int)chunkRequest.chunk.wy)));
        isoChunk2.LoadFromDisk();
        DebugLog.log((String)("downloaded size=" + n + " on-disk size=" + file.length()));
        this.compareChunks(isoChunk, isoChunk2);
        isoChunk.resetForStore();
        assert (!IsoChunkMap.chunkStore.contains(isoChunk));
        IsoChunkMap.chunkStore.add(isoChunk);
        isoChunk2.resetForStore();
        assert (!IsoChunkMap.chunkStore.contains(isoChunk2));
        IsoChunkMap.chunkStore.add(isoChunk2);
    }

    private void compareChunks(IsoChunk isoChunk, IsoChunk isoChunk2) {
        DebugLog.log((String)("comparing " + isoChunk.wx + "," + isoChunk.wy));
        try {
            this.compareErosion(isoChunk, isoChunk2);
            if (isoChunk.lootRespawnHour != isoChunk2.lootRespawnHour) {
                DebugLog.log((String)("lootRespawnHour " + isoChunk.lootRespawnHour + " != " + isoChunk2.lootRespawnHour));
            }
            for (int i = 0; i < 10; ++i) {
                for (int j = 0; j < 10; ++j) {
                    IsoGridSquare isoGridSquare = isoChunk.getGridSquare(j, i, 0);
                    IsoGridSquare isoGridSquare2 = isoChunk2.getGridSquare(j, i, 0);
                    this.compareSquares(isoGridSquare, isoGridSquare2);
                }
            }
        }
        catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    private void compareErosion(IsoChunk isoChunk, IsoChunk isoChunk2) {
        if (isoChunk.getErosionData().init != isoChunk2.getErosionData().init) {
            DebugLog.log((String)("init " + isoChunk.getErosionData().init + " != " + isoChunk2.getErosionData().init));
        }
        if (isoChunk.getErosionData().eTickStamp != isoChunk2.getErosionData().eTickStamp) {
            DebugLog.log((String)("eTickStamp " + isoChunk.getErosionData().eTickStamp + " != " + isoChunk2.getErosionData().eTickStamp));
        }
        if (isoChunk.getErosionData().moisture != isoChunk2.getErosionData().moisture) {
            DebugLog.log((String)("moisture " + isoChunk.getErosionData().moisture + " != " + isoChunk2.getErosionData().moisture));
        }
        if (isoChunk.getErosionData().minerals != isoChunk2.getErosionData().minerals) {
            DebugLog.log((String)("minerals " + isoChunk.getErosionData().minerals + " != " + isoChunk2.getErosionData().minerals));
        }
        if (isoChunk.getErosionData().epoch != isoChunk2.getErosionData().epoch) {
            DebugLog.log((String)("epoch " + isoChunk.getErosionData().epoch + " != " + isoChunk2.getErosionData().epoch));
        }
        if (isoChunk.getErosionData().soil != isoChunk2.getErosionData().soil) {
            DebugLog.log((String)("soil " + isoChunk.getErosionData().soil + " != " + isoChunk2.getErosionData().soil));
        }
    }

    private void compareSquares(IsoGridSquare isoGridSquare, IsoGridSquare isoGridSquare2) {
        if (isoGridSquare == null || isoGridSquare2 == null) {
            if (isoGridSquare != null || isoGridSquare2 != null) {
                DebugLog.log((String)"one square is null, the other isn't");
            }
            return;
        }
        try {
            this.bb1.clear();
            isoGridSquare.save(this.bb1, null);
            this.bb1.flip();
            this.bb2.clear();
            isoGridSquare2.save(this.bb2, null);
            this.bb2.flip();
            if (this.bb1.compareTo(this.bb2) != 0) {
                int n;
                boolean bl = true;
                int n2 = -1;
                if (this.bb1.limit() == this.bb2.limit()) {
                    for (n = 0; n < this.bb1.limit(); ++n) {
                        if (this.bb1.get(n) == this.bb2.get(n)) continue;
                        n2 = n;
                        break;
                    }
                    for (n = 0; n < isoGridSquare.getErosionData().regions.size(); ++n) {
                        if (((ErosionCategory.Data)isoGridSquare.getErosionData().regions.get((int)n)).dispSeason == ((ErosionCategory.Data)isoGridSquare2.getErosionData().regions.get((int)n)).dispSeason) continue;
                        DebugLog.log((String)("season1=" + ((ErosionCategory.Data)isoGridSquare.getErosionData().regions.get((int)n)).dispSeason + " season2=" + ((ErosionCategory.Data)isoGridSquare2.getErosionData().regions.get((int)n)).dispSeason));
                        bl = false;
                    }
                }
                DebugLog.log((String)("square " + isoGridSquare.x + "," + isoGridSquare.y + " mismatch at " + n2 + " seasonMatch=" + bl + " #regions=" + isoGridSquare.getErosionData().regions.size()));
                if (isoGridSquare.getObjects().size() == isoGridSquare2.getObjects().size()) {
                    for (n = 0; n < isoGridSquare.getObjects().size(); ++n) {
                        IsoObject isoObject = (IsoObject)isoGridSquare.getObjects().get(n);
                        IsoObject isoObject2 = (IsoObject)isoGridSquare2.getObjects().get(n);
                        this.bb1.clear();
                        isoObject.save(this.bb1);
                        this.bb1.flip();
                        this.bb2.clear();
                        isoObject2.save(this.bb2);
                        this.bb2.flip();
                        if (this.bb1.compareTo(this.bb2) == 0) continue;
                        DebugLog.log((String)("  1: " + isoObject.getClass().getName() + " " + isoObject.getName() + " " + (isoObject.sprite == null ? "no sprite" : isoObject.sprite.name)));
                        DebugLog.log((String)("  2: " + isoObject2.getClass().getName() + " " + isoObject2.getName() + " " + (isoObject2.sprite == null ? "no sprite" : isoObject2.sprite.name)));
                    }
                } else {
                    for (n = 0; n < isoGridSquare.getObjects().size(); ++n) {
                        IsoObject isoObject = (IsoObject)isoGridSquare.getObjects().get(n);
                        DebugLog.log((String)("  " + isoObject.getClass().getName() + " " + isoObject.getName() + " " + (isoObject.sprite == null ? "no sprite" : isoObject.sprite.name)));
                    }
                }
            }
        }
        catch (Exception exception) {
            exception.printStackTrace();
        }
    }
}
