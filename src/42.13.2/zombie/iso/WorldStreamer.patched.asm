.inner public static final {
    name: ChunkRequest,
    inner: zombie/iso/WorldStreamer$ChunkRequest,
    outer: zombie/iso/WorldStreamer
}
.inner public static final enum {
    name: PacketType,
    inner: zombie/network/PacketTypes$PacketType,
    outer: zombie/network/PacketTypes
}
.inner private static {
    name: ChunkComparator,
    inner: zombie/iso/WorldStreamer$ChunkComparator,
    outer: zombie/iso/WorldStreamer
}
.inner public static interface abstract {
    name: UncaughtExceptionHandler,
    inner: java/lang/Thread$UncaughtExceptionHandler,
    outer: java/lang/Thread
}
.inner public static final enum {
    name: JobType,
    inner: zombie/iso/IsoChunk$JobType,
    outer: zombie/iso/IsoChunk
}
.inner public static {
    name: Chunk,
    inner: zombie/erosion/ErosionData$Chunk,
    outer: zombie/erosion/ErosionData
}
.inner public static final {
    name: Square,
    inner: zombie/erosion/ErosionData$Square,
    outer: zombie/erosion/ErosionData
}
.inner public static {
    name: Data,
    inner: zombie/erosion/categories/ErosionCategory$Data,
    outer: zombie/erosion/categories/ErosionCategory
}
.inner public static final {
    name: Lookup,
    inner: java/lang/invoke/MethodHandles$Lookup,
    outer: java/lang/invoke/MethodHandles
}
.sourcefile "WorldStreamer.java"
.nest-member zombie/iso/WorldStreamer$ChunkComparator 
.nest-member zombie/iso/WorldStreamer$ChunkRequest 
.super java/lang/Object
.class public final super zombie/iso/WorldStreamer {

    .field static final comp Lzombie/iso/WorldStreamer$ChunkComparator; 
    .field private static final CRF_CANCEL I {value: 1}
    .field public static final CRF_CANCEL_SENT I {value: 2}
    .field private static final CRF_DELETE I {value: 4}
    .field private static final CRF_TIMEOUT I {value: 8}
    .field private static final CRF_RECEIVED I {value: 16}
    .field private static final BLOCK_SIZE I {value: 1024}
    .field public static instance Lzombie/iso/WorldStreamer; 
    .signature "Ljava/util/concurrent/ConcurrentLinkedQueue<Lzombie/iso/IsoChunk;>;"
    .field private final jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue; 
    .signature "Ljava/util/Stack<Lzombie/iso/IsoChunk;>;"
    .field private final jobList Ljava/util/Stack; 
    .signature "Ljava/util/concurrent/ConcurrentLinkedQueue<Lzombie/iso/IsoChunk;>;"
    .field private final chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue; 
    .signature "Ljava/util/ArrayList<Lzombie/iso/IsoChunk;>;"
    .field private final chunkRequests1 Ljava/util/ArrayList; 
    .signature "Ljava/util/ArrayList<Lzombie/iso/WorldStreamer$ChunkRequest;>;"
    .field private final pendingRequests Ljava/util/ArrayList; 
    .signature "Ljava/util/ArrayList<Lzombie/iso/WorldStreamer$ChunkRequest;>;"
    .field private final pendingRequests1 Ljava/util/ArrayList; 
    .signature "Ljava/util/concurrent/ConcurrentLinkedQueue<Lzombie/iso/WorldStreamer$ChunkRequest;>;"
    .field private final sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue; 
    .field private final crc32 Ljava/util/zip/CRC32; 
    .signature "Ljava/util/concurrent/ConcurrentLinkedQueue<Ljava/nio/ByteBuffer;>;"
    .field private final freeBuffers Ljava/util/concurrent/ConcurrentLinkedQueue; 
    .signature "Ljava/util/concurrent/ConcurrentLinkedQueue<Lzombie/iso/WorldStreamer$ChunkRequest;>;"
    .field private final waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue; 
    .signature "Ljava/util/ArrayList<Lzombie/iso/WorldStreamer$ChunkRequest;>;"
    .field private final tempRequests Ljava/util/ArrayList; 
    .field private final decompressor Ljava/util/zip/Inflater; 
    .field private final readBuf [B 
    .signature "Ljava/util/concurrent/ConcurrentLinkedQueue<Lzombie/iso/WorldStreamer$ChunkRequest;>;"
    .field private final waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue; 
    .field public worldStreamer Ljava/lang/Thread; 
    .field public finished Z 
    .field private chunkHeadMain Lzombie/iso/IsoChunk; 
    .field private requestNumber I 
    .field private compare Z 
    .field private networkFileDebug Z 
    .field private inMemoryZip Ljava/nio/ByteBuffer; 
    .field private requestingLargeArea Z 
    .field private volatile largeAreaDownloads I 
    .field private final bb1 Ljava/nio/ByteBuffer; 
    .field private final bb2 Ljava/nio/ByteBuffer; 
    .field private static bLoggedPatch Z 
    .field static final synthetic $assertionsDisabled Z 

    .method public <init> ()V {
        parameters: { this },
        code: {
        A: 
            line 48
            aload this
            invokespecial java/lang/Object.<init> ()V
        B: 
            line 57
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
        C: 
            line 58
            aload this
            new java/util/Stack
            dup 
            invokespecial java/util/Stack.<init> ()V
            putfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
        D: 
            line 59
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
        E: 
            line 60
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
        F: 
            line 61
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
        G: 
            line 62
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
        H: 
            line 63
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
        I: 
            line 64
            aload this
            new java/util/zip/CRC32
            dup 
            invokespecial java/util/zip/CRC32.<init> ()V
            putfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
        J: 
            line 65
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.freeBuffers Ljava/util/concurrent/ConcurrentLinkedQueue;
        K: 
            line 66
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
        L: 
            line 67
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
        M: 
            line 68
            aload this
            new java/util/zip/Inflater
            dup 
            invokespecial java/util/zip/Inflater.<init> ()V
            putfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
        N: 
            line 69
            aload this
            sipush 1024
            newarray byte
            putfield zombie/iso/WorldStreamer.readBuf [B
        O: 
            line 70
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
        P: 
            line 80
            aload this
            sipush 5120
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            putfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
        Q: 
            line 81
            aload this
            sipush 5120
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            putfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
        R: 
            line 82
            return 
        S: 
        }
    }

    .method private bufferSize (I)I {
        parameters: { this, size },
        code: {
        A: 
            line 85
            iload size
            sipush 1024
            iadd 
            iconst_1 
            isub 
            sipush 1024
            idiv 
            sipush 1024
            imul 
            ireturn 
        B: 
        }
    }

    .method private ensureCapacity (Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer; {
        parameters: { this, bb, capacity },
        code: {
        A: 
            line 89
            aload bb
            ifnonnull C
        B: 
            line 90
            aload this
            iload capacity
            invokevirtual zombie/iso/WorldStreamer.bufferSize (I)I
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            areturn 
        C: 
            line 92
            aload bb
            invokevirtual java/nio/ByteBuffer.capacity ()I
            iload capacity
            if_icmpge F
        D: 
            line 93
            aload this
            iload capacity
            invokevirtual zombie/iso/WorldStreamer.bufferSize (I)I
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            astore newBB
        E: 
            line 94
            aload newBB
            aload bb
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            aload bb
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/nio/ByteBuffer.put ([BII)Ljava/nio/ByteBuffer;
            areturn 
        F: 
            line 96
            aload bb
            areturn 
        G: 
        }
    }

    .method private getByteBuffer (I)Ljava/nio/ByteBuffer; {
        parameters: { this, capacity },
        code: {
        A: 
            line 100
            aload this
            getfield zombie/iso/WorldStreamer.freeBuffers Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast java/nio/ByteBuffer
            astore bb
        B: 
            line 101
            aload bb
            ifnonnull D
        C: 
            line 102
            aload this
            iload capacity
            invokevirtual zombie/iso/WorldStreamer.bufferSize (I)I
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            areturn 
        D: 
            line 104
            aload bb
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        E: 
            line 105
            aload this
            aload bb
            iload capacity
            invokevirtual zombie/iso/WorldStreamer.ensureCapacity (Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;
            areturn 
        F: 
        }
    }

    .method private releaseBuffer (Ljava/nio/ByteBuffer;)V {
        parameters: { this, bb },
        code: {
        A: 
            line 109
            aload this
            getfield zombie/iso/WorldStreamer.freeBuffers Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload bb
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        B: 
            line 110
            return 
        C: 
        }
    }

    .method private sendRequests ()V {
        parameters: { this },
        code: {
        A: 
            line 113
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq C
        B: 
            line 114
            return 
        C: 
            line 116
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq E
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            bipush 20
            if_icmple E
        D: 
            line 117
            return 
        E: 
            line 119
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore time
        F: 
            line 120
            aconst_null 
            astore head
        G: 
            line 121
            aconst_null 
            astore tail
        H: 
            line 122
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            iconst_1 
            isub 
            istore i
        I: 
            iload i
            iflt Z
        J: 
            line 123
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        K: 
            line 124
            invokestatic zombie/iso/WorldStreamer$ChunkRequest.alloc ()Lzombie/iso/WorldStreamer$ChunkRequest;
            astore request
        L: 
            line 125
            aload request
            aload chunk
            putfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
        M: 
            line 126
            aload this
            dup 
            getfield zombie/iso/WorldStreamer.requestNumber I
            iconst_1 
            iadd 
            putfield zombie/iso/WorldStreamer.requestNumber I
        N: 
            line 127
            aload request
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.requestNumber I
            putfield zombie/iso/WorldStreamer$ChunkRequest.requestNumber I
        O: 
            line 128
            aload request
            lload time
            putfield zombie/iso/WorldStreamer$ChunkRequest.time J
        P: 
            line 129
            aload request
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokestatic zombie/network/ChunkChecksum.getChecksum (II)J
            putfield zombie/iso/WorldStreamer$ChunkRequest.crc J
        Q: 
            line 130
            aload head
            ifnonnull S
        R: 
            line 131
            aload request
            astore head
            goto T
        S: 
            line 133
            aload tail
            aload request
            putfield zombie/iso/WorldStreamer$ChunkRequest.next Lzombie/iso/WorldStreamer$ChunkRequest;
        T: 
            line 135
            aload request
            aconst_null 
            putfield zombie/iso/WorldStreamer$ChunkRequest.next Lzombie/iso/WorldStreamer$ChunkRequest;
        U: 
            line 136
            aload request
            astore tail
        V: 
            line 137
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        W: 
            line 138
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        X: 
            line 139
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq Y
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            bipush 40
            if_icmplt Y
            goto Z
        Y: 
            line 122
            iinc i -1
            goto I
        Z: 
            line 141
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload head
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        AA: 
            line 142
            return 
        AB: 
        }
    }

    .method public updateMain ()V {
        parameters: { this },
        code: {
        A: 
            line 147
            getstatic zombie/network/GameClient.connection Lzombie/core/raknet/UdpConnection;
            astore connection
        B: 
            line 148
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            ifnull E
        C: 
            line 149
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 150
            aload this
            aconst_null 
            putfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
        E: 
            line 152
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        F: 
            line 153
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        G: 
            line 154
            aload request
            ifnull P
        H: 
            line 155
            aload request
            ifnull O
        I: 
            line 156
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.next Lzombie/iso/WorldStreamer$ChunkRequest;
            astore next
        J: 
            line 157
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq L
        K: 
            line 158
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            goto M
        L: 
            line 160
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        M: 
            line 162
            aload next
            astore request
        N: 
            line 163
            goto H
        O: 
            line 164
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto G
        P: 
            line 166
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne X
        Q: 
            line 167
            new zombie/network/packets/RequestZipListPacket
            dup 
            invokespecial zombie/network/packets/RequestZipListPacket.<init> ()V
            astore packet
        R: 
            line 168
            aload packet
            checkcast zombie/network/packets/RequestZipListPacket
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual zombie/network/packets/RequestZipListPacket.set (Ljava/util/ArrayList;)V
        S: 
            line 169
            aload connection
            invokevirtual zombie/core/raknet/UdpConnection.startPacket ()Lzombie/core/network/ByteBufferWriter;
            astore b
        T: 
            line 170
            getstatic zombie/network/PacketTypes$PacketType.RequestZipList Lzombie/network/PacketTypes$PacketType;
            aload b
            invokevirtual zombie/network/PacketTypes$PacketType.doPacket (Lzombie/core/network/ByteBufferWriter;)V
        U: 
            line 171
            aload packet
            checkcast zombie/network/packets/RequestZipListPacket
            aload b
            invokevirtual zombie/network/packets/RequestZipListPacket.write (Lzombie/core/network/ByteBufferWriter;)V
        V: 
            line 172
            getstatic zombie/network/PacketTypes$PacketType.RequestZipList Lzombie/network/PacketTypes$PacketType;
            aload connection
            invokevirtual zombie/network/PacketTypes$PacketType.send (Lzombie/core/raknet/UdpConnection;)V
        W: 
            line 173
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.addAll (Ljava/util/Collection;)Z
            pop 
        X: 
            line 175
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        Y: 
            line 176
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        Z: 
            line 177
            aload request
            ifnull AC
        AA: 
            line 178
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AB: 
            line 179
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto Z
        AC: 
            line 181
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne AJ
        AD: 
            line 182
            new zombie/network/packets/NotRequiredInZipPacket
            dup 
            invokespecial zombie/network/packets/NotRequiredInZipPacket.<init> ()V
            astore packet
        AE: 
            line 183
            aload packet
            checkcast zombie/network/packets/NotRequiredInZipPacket
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual zombie/network/packets/NotRequiredInZipPacket.set (Ljava/util/ArrayList;)V
        AF: 
            line 184
            aload connection
            invokevirtual zombie/core/raknet/UdpConnection.startPacket ()Lzombie/core/network/ByteBufferWriter;
            astore b
        AG: 
            line 185
            getstatic zombie/network/PacketTypes$PacketType.NotRequiredInZip Lzombie/network/PacketTypes$PacketType;
            aload b
            invokevirtual zombie/network/PacketTypes$PacketType.doPacket (Lzombie/core/network/ByteBufferWriter;)V
        AH: 
            line 186
            aload packet
            checkcast zombie/network/packets/NotRequiredInZipPacket
            aload b
            invokevirtual zombie/network/packets/NotRequiredInZipPacket.write (Lzombie/core/network/ByteBufferWriter;)V
        AI: 
            line 187
            getstatic zombie/network/PacketTypes$PacketType.NotRequiredInZip Lzombie/network/PacketTypes$PacketType;
            aload connection
            invokevirtual zombie/network/PacketTypes$PacketType.send (Lzombie/core/raknet/UdpConnection;)V
        AJ: 
            line 189
            return 
        AK: 
        }
    }

    .method private loadReceivedChunks ()V {
        parameters: { this },
        exceptions: { 
            { U, V, W, Ljava/util/zip/DataFormatException; }
         },
        code: {
        A: 
            line 192
            iconst_0 
            istore debug
        B: 
            line 193
            iconst_0 
            istore nReceived
        C: 
            line 194
            iconst_0 
            istore nCancel
        D: 
            line 195
            iconst_0 
            istore i
        E: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge BA
        F: 
            line 198
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        G: 
            line 199
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            iand 
            ifeq AZ
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq H
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsMain I
            iconst_2 
            iand 
            ifne H
            goto AZ
        H: 
            line 200
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            iinc i -1
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        I: 
            line 201
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/ChunkSaveWorker.Update (Lzombie/iso/IsoChunk;)V
        J: 
            line 202
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            iconst_4 
            iand 
            ifeq P
            getstatic zombie/ChunkMapFilenames.instance Lzombie/ChunkMapFilenames;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/ChunkMapFilenames.getFilename (II)Ljava/io/File;
            dup 
            astore file
        K: 
            invokevirtual java/io/File.exists ()Z
            ifeq P
        L: 
            line 203
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq N
        M: 
            line 204
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload file
            invokevirtual java/io/File.getAbsolutePath ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "deleting \u0001 because it doesn\'t exist on the server" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        N: 
            line 206
            aload file
            invokevirtual java/io/File.delete ()Z
            pop 
        O: 
            line 207
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            lconst_0 
            invokestatic zombie/network/ChunkChecksum.setChecksum (IIJ)V
        P: 
            line 209
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq Q
            aconst_null 
            goto R
        Q: 
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
        R: 
            dup 
            astore requestBB
        S: 
            astore byteBuffer
        T: 
            line 210
            aload requestBB
            ifnull AD
        U: 
            // try-start:   range=[U-V] handler=W:java/util/zip/DataFormatException 
            line 213
            aload this
            aload requestBB
            invokevirtual zombie/iso/WorldStreamer.decompress (Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
            astore requestBB
        V: 
            // try-end:     range=[U-V] handler=W:java/util/zip/DataFormatException 
            line 219
            goto AA
        W: 
            // try-handler: range=[U-V] handler=W:java/util/zip/DataFormatException 
            line 215
            astore e
        X: 
            line 216
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "WorldStreamer.loadReceivedChunks: Error while the chunk (\u0001, \u0001) was decompressing" }
            invokevirtual zombie/debug/DebugLogStream.error (Ljava/lang/Object;)V
        Y: 
            line 217
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        Z: 
            line 218
            goto AZ
        AA: 
            line 220
            aload this
            getfield zombie/iso/WorldStreamer.compare Z
            ifeq AD
            getstatic zombie/ChunkMapFilenames.instance Lzombie/ChunkMapFilenames;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/ChunkMapFilenames.getFilename (II)Ljava/io/File;
            dup 
            astore file2
        AB: 
            invokevirtual java/io/File.exists ()Z
            ifeq AD
        AC: 
            line 221
            aload this
            aload request
            aload requestBB
            aload file2
            invokevirtual zombie/iso/WorldStreamer.compare (Lzombie/iso/WorldStreamer$ChunkRequest;Ljava/nio/ByteBuffer;Ljava/io/File;)V
        AD: 
            line 224
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            bipush 8
            iand 
            ifne AW
        AE: 
            line 225
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifne AF
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq AT
        AF: 
            line 226
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq AJ
        AG: 
            line 227
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            aload requestBB
            ifnull AH
            iconst_1 
            goto AI
        AH: 
            iconst_0 
        AI: 
            invokedynamic makeConcatWithConstants (IIZ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001 refs.isEmpty() SafeWrite=\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        AJ: 
            line 229
            aload requestBB
            ifnull AQ
        AK: 
            line 230
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokestatic zombie/network/ChunkChecksum.getChecksumIfExists (II)J
            lstore crc
        AL: 
            line 231
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.reset ()V
        AM: 
            line 232
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            aload requestBB
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            aload requestBB
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/util/zip/CRC32.update ([BII)V
        AN: 
            line 233
            lload crc
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.getValue ()J
            lcmp 
            ifeq AQ
        AO: 
            line 234
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.getValue ()J
            invokestatic zombie/network/ChunkChecksum.setChecksum (IIJ)V
        AP: 
            line 235
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            aload requestBB
            invokestatic zombie/iso/IsoChunk.SafeWrite (IILjava/nio/ByteBuffer;)V
        AQ: 
            line 238
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        AR: 
            line 239
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne AS
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq AS
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        AS: 
            line 240
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
            goto AW
        AT: 
            line 242
            aload requestBB
            ifnull AV
        AU: 
            line 243
            aload requestBB
            iconst_0 
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        AV: 
            line 245
            aload this
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            aload requestBB
            invokevirtual zombie/iso/WorldStreamer.DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        AW: 
            line 248
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            ifnull AY
        AX: 
            line 249
            aload this
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            invokevirtual zombie/iso/WorldStreamer.releaseBuffer (Ljava/nio/ByteBuffer;)V
        AY: 
            line 251
            aload request
            invokestatic zombie/iso/WorldStreamer$ChunkRequest.release (Lzombie/iso/WorldStreamer$ChunkRequest;)V
        AZ: 
            line 195
            iinc i 1
            goto E
        BA: 
            line 253
            return 
        BB: 
        }
    }

    .method private decompress (Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer; {
        parameters: { this, bb },
        code: {
        A: 
            line 256
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            invokevirtual java/util/zip/Inflater.reset ()V
        B: 
            line 257
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            aload bb
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            aload bb
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/util/zip/Inflater.setInput ([BII)V
        C: 
            line 258
            iconst_0 
            istore position
        D: 
            line 259
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            ifnull F
        E: 
            line 260
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        F: 
            line 262
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            invokevirtual java/util/zip/Inflater.finished ()Z
            ifne O
        G: 
            line 263
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            aload this
            getfield zombie/iso/WorldStreamer.readBuf [B
            invokevirtual java/util/zip/Inflater.inflate ([B)I
            istore count
        H: 
            line 264
            iload count
            ifeq M
        I: 
            line 265
            aload this
            aload this
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            iload position
            iload count
            iadd 
            invokevirtual zombie/iso/WorldStreamer.ensureCapacity (Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;
            putfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
        J: 
            line 266
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.readBuf [B
            iconst_0 
            iload count
            invokevirtual java/nio/ByteBuffer.put ([BII)Ljava/nio/ByteBuffer;
            pop 
        K: 
            line 267
            iload position
            iload count
            iadd 
            istore position
        L: 
            line 268
            goto F
        M: 
            line 270
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            invokevirtual java/util/zip/Inflater.finished ()Z
            ifeq N
            goto F
        N: 
            line 271
            new java/util/zip/DataFormatException
            dup 
            invokespecial java/util/zip/DataFormatException.<init> ()V
            athrow 
        O: 
            line 273
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/nio/ByteBuffer.limit (I)Ljava/nio/ByteBuffer;
            pop 
        P: 
            line 274
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            areturn 
        Q: 
        }
    }

    .method private threadLoop ()V {
        parameters: { this },
        code: {
        A: 
            line 279
            getstatic zombie/network/GameClient.client Z
            ifeq R
            getstatic zombie/SystemDisabler.doWorldSyncEnable Z
            ifne R
        B: 
            line 280
            aload this
            getstatic zombie/debug/DebugType.NetworkFileDebug Lzombie/debug/DebugType;
            invokevirtual zombie/debug/DebugType.isEnabled ()Z
            putfield zombie/iso/WorldStreamer.networkFileDebug Z
        C: 
            line 281
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        D: 
            line 282
            aload chunk
            ifnull K
        E: 
            line 283
            aload chunk
            ifnull J
        F: 
            line 284
            aload chunk
            getfield zombie/iso/IsoChunk.next Lzombie/iso/IsoChunk;
            astore next
        G: 
            line 285
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            aload chunk
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        H: 
            line 286
            aload next
            astore chunk
        I: 
            line 287
            goto E
        J: 
            line 288
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
            goto D
        K: 
            line 290
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne O
        L: 
            line 291
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokevirtual zombie/iso/WorldStreamer$ChunkComparator.init ()V
        M: 
            line 292
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokestatic java/util/Collections.sort (Ljava/util/List;Ljava/util/Comparator;)V
        N: 
            line 293
            aload this
            invokevirtual zombie/iso/WorldStreamer.sendRequests ()V
        O: 
            line 295
            aload this
            invokevirtual zombie/iso/WorldStreamer.loadReceivedChunks ()V
        P: 
            line 296
            aload this
            invokevirtual zombie/iso/WorldStreamer.cancelOutOfBoundsRequests ()V
        Q: 
            line 297
            aload this
            invokevirtual zombie/iso/WorldStreamer.resendTimedOutRequests ()V
        R: 
            line 299
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        S: 
            line 300
            aload chunk
            ifnull X
        T: 
            line 301
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            aload chunk
            invokevirtual java/util/Stack.contains (Ljava/lang/Object;)Z
            ifeq V
        U: 
            line 302
            ldc "Ignoring duplicate chunk added to WorldStreamer.jobList"
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
            goto W
        V: 
            line 304
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            aload chunk
            invokevirtual java/util/Stack.add (Ljava/lang/Object;)Z
            pop 
        W: 
            line 306
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
            goto S
        X: 
            line 308
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.isEmpty ()Z
            ifne AZ
        Y: 
            line 310
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.size ()I
            iconst_1 
            isub 
            istore i
        Z: 
            iload i
            iflt AH
        AA: 
            line 311
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            iload i
            invokevirtual java/util/Stack.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk2
        AB: 
            line 312
            aload chunk2
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne AC
            goto AG
        AC: 
            line 313
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            iload i
            invokevirtual java/util/Stack.remove (I)Ljava/lang/Object;
            pop 
        AD: 
            line 314
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        AE: 
            line 315
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne AF
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk2
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq AF
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        AF: 
            line 316
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk2
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        AG: 
            line 310
            iinc i -1
            goto Z
        AH: 
            line 318
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.isEmpty ()Z
            ifne AI
            iconst_1 
            goto AJ
        AI: 
            iconst_0 
        AJ: 
            istore busy
        AK: 
            line 319
            aconst_null 
            astore chunk2
        AL: 
            line 320
            iload busy
            ifeq AP
        AM: 
            line 321
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokevirtual zombie/iso/WorldStreamer$ChunkComparator.init ()V
        AN: 
            line 322
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokestatic java/util/Collections.sort (Ljava/util/List;Ljava/util/Comparator;)V
        AO: 
            line 323
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.size ()I
            iconst_1 
            isub 
            invokevirtual java/util/Stack.remove (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk2
        AP: 
            line 325
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload chunk2
            invokevirtual zombie/iso/ChunkSaveWorker.Update (Lzombie/iso/IsoChunk;)V
        AQ: 
            line 326
            aload chunk2
            ifnull AW
        AR: 
            line 327
            aload chunk2
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq AV
        AS: 
            line 328
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        AT: 
            line 329
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne AU
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk2
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq AU
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        AU: 
            line 330
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk2
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
            goto AW
        AV: 
            line 332
            aload this
            aload chunk2
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        AW: 
            line 335
            iload busy
            ifne AX
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            getfield zombie/iso/ChunkSaveWorker.saving Z
            ifeq AY
        AX: 
            line 336
            return 
        AY: 
            line 338
            goto BG
        AZ: 
            line 339
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aconst_null 
            invokevirtual zombie/iso/ChunkSaveWorker.Update (Lzombie/iso/IsoChunk;)V
        BA: 
            line 340
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            getfield zombie/iso/ChunkSaveWorker.saving Z
            ifeq BC
        BB: 
            line 341
            return 
        BC: 
            line 343
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne BF
        BD: 
            line 344
            ldc 20L
            invokestatic java/lang/Thread.sleep (J)V
        BE: 
            line 345
            return 
        BF: 
            line 347
            ldc 140L
            invokestatic java/lang/Thread.sleep (J)V
        BG: 
            line 349
            getstatic zombie/network/GameClient.client Z
            ifne BI
            getstatic zombie/GameWindow.loadedAsClient Z
            ifne BI
            invokestatic zombie/savefile/PlayerDB.isAvailable ()Z
            ifeq BI
        BH: 
            line 350
            invokestatic zombie/savefile/PlayerDB.getInstance ()Lzombie/savefile/PlayerDB;
            invokevirtual zombie/savefile/PlayerDB.updateWorldStreamer ()V
        BI: 
            line 352
            getstatic zombie/vehicles/VehiclesDB2.instance Lzombie/vehicles/VehiclesDB2;
            invokevirtual zombie/vehicles/VehiclesDB2.updateWorldStreamer ()V
        BJ: 
            line 353
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            ifnull BL
        BK: 
            line 354
            ldc 140L
            invokestatic java/lang/Thread.sleep (J)V
            goto BM
        BL: 
            line 356
            lconst_0 
            invokestatic java/lang/Thread.sleep (J)V
        BM: 
            line 358
            return 
        BN: 
        }
    }

    .method public create ()V {
        parameters: { this },
        code: {
        A: 
            line 361
            getstatic zombie/iso/WorldStreamer.bLoggedPatch Z
            ifne D
        B: 
            line 362
            ldc "PATCH: WorldStreamer"
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        C: 
            line 363
            iconst_1 
            putstatic zombie/iso/WorldStreamer.bLoggedPatch Z
        D: 
            line 365
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            ifnull F
        E: 
            line 366
            return 
        F: 
            line 368
            getstatic zombie/network/GameServer.server Z
            ifeq H
        G: 
            line 369
            return 
        H: 
            line 371
            aload this
            iconst_0 
            putfield zombie/iso/WorldStreamer.finished Z
        I: 
            line 372
            aload this
            new java/lang/Thread
            dup 
            getstatic zombie/core/ThreadGroups.Workers Ljava/lang/ThreadGroup;
            aload this
            invokedynamic run (Lzombie/iso/WorldStreamer;)Ljava/lang/Runnable; LambdaMetafactory.metafactory { ()V, { invokevirtual, zombie/iso/WorldStreamer.lambda$create$0, ()V }, ()V }
            invokespecial java/lang/Thread.<init> (Ljava/lang/ThreadGroup;Ljava/lang/Runnable;)V
            putfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
        J: 
            line 382
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            iconst_5 
            invokevirtual java/lang/Thread.setPriority (I)V
        K: 
            line 383
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            iconst_1 
            invokevirtual java/lang/Thread.setDaemon (Z)V
        L: 
            line 384
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            ldc "World Streamer"
            invokevirtual java/lang/Thread.setName (Ljava/lang/String;)V
        M: 
            line 385
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            invokedynamic uncaughtException ()Ljava/lang/Thread$UncaughtExceptionHandler; LambdaMetafactory.metafactory { (Ljava/lang/Thread;Ljava/lang/Throwable;)V, { invokestatic, zombie/GameWindow.uncaughtException, (Ljava/lang/Thread;Ljava/lang/Throwable;)V }, (Ljava/lang/Thread;Ljava/lang/Throwable;)V }
            invokevirtual java/lang/Thread.setUncaughtExceptionHandler (Ljava/lang/Thread$UncaughtExceptionHandler;)V
        N: 
            line 386
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            invokevirtual java/lang/Thread.start ()V
        O: 
            line 387
            return 
        P: 
        }
    }

    .method public addJob (Lzombie/iso/IsoChunk;IIZ)V {
        parameters: { this, chunk, wx, wy, bDoServerRequest },
        code: {
        A: 
            line 390
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 391
            return 
        C: 
            line 393
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        D: 
            line 394
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        E: 
            line 395
            getstatic zombie/network/GameClient.client Z
            ifeq I
            getstatic zombie/SystemDisabler.doWorldSyncEnable Z
            ifne I
            iload bDoServerRequest
            ifeq I
        F: 
            line 396
            aload chunk
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            putfield zombie/iso/IsoChunk.next Lzombie/iso/IsoChunk;
        G: 
            line 397
            aload this
            aload chunk
            putfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
        H: 
            line 398
            return 
        I: 
            line 400
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne J
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq J
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        J: 
            line 401
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne K
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            aload chunk
            invokevirtual java/util/Stack.contains (Ljava/lang/Object;)Z
            ifeq K
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        K: 
            line 402
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        L: 
            line 403
            return 
        M: 
        }
    }

    .method public DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V {
        parameters: { this, chunk, fromServer },
        code: {
        A: 
            line 406
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 407
            return 
        C: 
            line 409
            aload this
            aload chunk
            aload fromServer
            invokevirtual zombie/iso/WorldStreamer.DoChunkAlways (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        D: 
            line 410
            return 
        E: 
        }
    }

    .method public DoChunkAlways (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V {
        parameters: { this, chunk, fromServer },
        exceptions: { 
            { B, C, D, Ljava/lang/InterruptedException; }, 
            { G, L, P, Ljava/lang/Exception; }, 
            { M, O, P, Ljava/lang/Exception; }, 
            { Y, AA, AB, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 414
            getstatic zombie/core/Core.debug Z
            ifeq E
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.worldStreamerSlowLoad Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq E
        B: 
            // try-start:   range=[B-C] handler=D:java/lang/InterruptedException 
            line 416
            ldc 50L
            invokestatic java/lang/Thread.sleep (J)V
        C: 
            // try-end:     range=[B-C] handler=D:java/lang/InterruptedException 
            line 420
            goto E
        D: 
            // try-handler: range=[B-C] handler=D:java/lang/InterruptedException 
            line 418
            astore v3
        E: 
            line 422
            aload chunk
            ifnonnull G
        F: 
            line 423
            return 
        G: 
            // try-start:   range=[G-L] handler=P:java/lang/Exception 
            line 426
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            aload fromServer
            invokevirtual zombie/iso/IsoChunk.LoadOrCreate (IILjava/nio/ByteBuffer;)Z
            ifne M
        H: 
            line 427
            getstatic zombie/network/GameClient.client Z
            ifeq J
        I: 
            line 428
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            lconst_0 
            invokestatic zombie/network/ChunkChecksum.setChecksum (IIJ)V
        J: 
            line 430
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.Blam (II)V
        K: 
            line 431
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.LoadBrandNew (II)Z
            ifne M
        L: 
            // try-end:     range=[G-L] handler=P:java/lang/Exception 
            line 432
            return 
        M: 
            // try-start:   range=[M-O] handler=P:java/lang/Exception 
            line 435
            aload fromServer
            ifnonnull O
        N: 
            line 436
            getstatic zombie/vehicles/VehiclesDB2.instance Lzombie/vehicles/VehiclesDB2;
            aload chunk
            invokevirtual zombie/vehicles/VehiclesDB2.loadChunk (Lzombie/iso/IsoChunk;)V
        O: 
            // try-end:     range=[M-O] handler=P:java/lang/Exception 
            line 448
            goto X
        P: 
            // try-handler: range=[G-L] handler=P:java/lang/Exception 
            // try-handler: range=[M-O] handler=P:java/lang/Exception 
            line 439
            astore ex
        Q: 
            line 440
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Exception thrown while trying to load chunk: \u0001, \u0001" }
            invokevirtual zombie/debug/DebugLogStream.error (Ljava/lang/Object;)V
        R: 
            line 441
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        S: 
            line 442
            getstatic zombie/network/GameClient.client Z
            ifeq U
        T: 
            line 443
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            lconst_0 
            invokestatic zombie/network/ChunkChecksum.setChecksum (IIJ)V
        U: 
            line 445
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.Blam (II)V
        V: 
            line 446
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.LoadBrandNew (II)Z
            ifeq W
            goto X
        W: 
            line 447
            return 
        X: 
            line 450
            aload chunk
            getfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
            getstatic zombie/iso/IsoChunk$JobType.Convert Lzombie/iso/IsoChunk$JobType;
            if_acmpeq AE
            aload chunk
            getfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
            getstatic zombie/iso/IsoChunk$JobType.SoftReset Lzombie/iso/IsoChunk$JobType;
            if_acmpeq AE
        Y: 
            // try-start:   range=[Y-AA] handler=AB:java/lang/Exception 
            line 452
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne AA
        Z: 
            line 453
            aload chunk
            invokevirtual zombie/iso/IsoChunk.loadInWorldStreamerThread ()V
        AA: 
            // try-end:     range=[Y-AA] handler=AB:java/lang/Exception 
            line 458
            goto AD
        AB: 
            // try-handler: range=[Y-AA] handler=AB:java/lang/Exception 
            line 456
            astore ex
        AC: 
            line 457
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        AD: 
            line 459
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
            goto AG
        AE: 
            line 461
            aload chunk
            invokevirtual zombie/iso/IsoChunk.doLoadGridsquare ()V
        AF: 
            line 462
            aload chunk
            iconst_1 
            putfield zombie/iso/IsoChunk.loaded Z
        AG: 
            line 464
            return 
        AH: 
        }
    }

    .method public addJobInstant (Lzombie/iso/IsoChunk;IIII)V {
        parameters: { this, chunk, x, y, wx, wy },
        exceptions: { 
            { E, F, G, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 467
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 468
            return 
        C: 
            line 470
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        D: 
            line 471
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        E: 
            // try-start:   range=[E-F] handler=G:java/lang/Exception 
            line 473
            aload this
            aload chunk
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunkAlways (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        F: 
            // try-end:     range=[E-F] handler=G:java/lang/Exception 
            line 477
            goto I
        G: 
            // try-handler: range=[E-F] handler=G:java/lang/Exception 
            line 475
            astore e
        H: 
            line 476
            aload e
            invokevirtual java/lang/Exception.printStackTrace ()V
        I: 
            line 478
            return 
        J: 
        }
    }

    .method public addJobConvert (Lzombie/iso/IsoChunk;IIII)V {
        parameters: { this, chunk, x, y, wx, wy },
        exceptions: { 
            { F, G, H, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 481
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 482
            return 
        C: 
            line 484
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        D: 
            line 485
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        E: 
            line 486
            aload chunk
            getstatic zombie/iso/IsoChunk$JobType.Convert Lzombie/iso/IsoChunk$JobType;
            putfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
        F: 
            // try-start:   range=[F-G] handler=H:java/lang/Exception 
            line 488
            aload this
            aload chunk
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        G: 
            // try-end:     range=[F-G] handler=H:java/lang/Exception 
            line 492
            goto J
        H: 
            // try-handler: range=[F-G] handler=H:java/lang/Exception 
            line 490
            astore e
        I: 
            line 491
            aload e
            invokevirtual java/lang/Exception.printStackTrace ()V
        J: 
            line 493
            return 
        K: 
        }
    }

    .method public addJobWipe (Lzombie/iso/IsoChunk;IIII)V {
        parameters: { this, chunk, x, y, wx, wy },
        exceptions: { 
            { D, E, F, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 496
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        B: 
            line 497
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        C: 
            line 498
            aload chunk
            getstatic zombie/iso/IsoChunk$JobType.SoftReset Lzombie/iso/IsoChunk$JobType;
            putfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
        D: 
            // try-start:   range=[D-E] handler=F:java/lang/Exception 
            line 500
            aload this
            aload chunk
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunkAlways (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        E: 
            // try-end:     range=[D-E] handler=F:java/lang/Exception 
            line 504
            goto H
        F: 
            // try-handler: range=[D-E] handler=F:java/lang/Exception 
            line 502
            astore e
        G: 
            line 503
            aload e
            invokevirtual java/lang/Exception.printStackTrace ()V
        H: 
            line 505
            return 
        I: 
        }
    }

    .method public isBusy ()Z {
        parameters: { this },
        code: {
        A: 
            line 508
            getstatic zombie/network/GameClient.client Z
            ifeq C
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq B
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq B
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            ifnonnull B
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq B
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq B
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq B
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq B
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne C
        B: 
            line 509
            iconst_1 
            ireturn 
        C: 
            line 511
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq D
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.isEmpty ()Z
            ifne E
        D: 
            iconst_1 
            goto F
        E: 
            iconst_0 
        F: 
            ireturn 
        G: 
        }
    }

    .method public stop ()V {
        parameters: { this },
        code: {
        A: 
            line 515
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 1"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        B: 
            line 516
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            ifnonnull D
        C: 
            line 517
            return 
        D: 
            line 519
            aload this
            iconst_1 
            putfield zombie/iso/WorldStreamer.finished Z
        E: 
            line 520
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 2"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        F: 
            line 521
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            invokevirtual java/lang/Thread.isAlive ()Z
            ifeq H
        G: 
            line 522
            invokestatic zombie/MainThread.busyWait ()V
            goto F
        H: 
            line 524
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 3"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        I: 
            line 525
            aload this
            aconst_null 
            putfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
        J: 
            line 526
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.clear ()V
        K: 
            line 527
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.clear ()V
        L: 
            line 528
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 4"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        M: 
            line 529
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            invokevirtual zombie/iso/ChunkSaveWorker.SaveNow ()V
        N: 
            line 530
            invokestatic zombie/network/ChunkChecksum.Reset ()V
        O: 
            line 531
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 5"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        P: 
            line 532
            return 
        Q: 
        }
    }

    .method public quit ()V {
        parameters: { this },
        code: {
        A: 
            line 535
            aload this
            invokevirtual zombie/iso/WorldStreamer.stop ()V
        B: 
            line 536
            return 
        C: 
        }
    }

    .method public requestLargeAreaZip (III)V {
        parameters: { this, wx, wy, range },
        exceptions: { 
            { AL, AM, AN, Ljava/lang/InterruptedException; }, 
            { AZ, BA, BB, Ljava/lang/InterruptedException; }
         },
        code: {
        A: 
            line 540
            getstatic zombie/network/PacketTypes$PacketType.RequestLargeAreaZip Lzombie/network/PacketTypes$PacketType;
            iconst_2 
            anewarray java/lang/Object
            dup 
            iconst_0 
            iload wx
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            aastore 
            dup 
            iconst_1 
            iload wy
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            aastore 
            invokestaticinterface zombie/network/packets/INetworkPacket.send (Lzombie/network/PacketTypes$PacketType;[Ljava/lang/Object;)V
        B: 
            line 541
            aload this
            iconst_1 
            putfield zombie/iso/WorldStreamer.requestingLargeArea Z
        C: 
            line 542
            aload this
            iconst_0 
            putfield zombie/iso/WorldStreamer.largeAreaDownloads I
        D: 
            line 543
            ldc "IGUI_MP_RequestMapData"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        E: 
            line 544
            iconst_0 
            istore numRequests
        F: 
            line 545
            iload wx
            iload range
            isub 
            istore minX
        G: 
            line 546
            iload wy
            iload range
            isub 
            istore minY
        H: 
            line 547
            iload wx
            iload range
            iadd 
            istore maxX
        I: 
            line 548
            iload wy
            iload range
            iadd 
            istore maxY
        J: 
            line 549
            iload minY
            istore y
        K: 
            iload y
            iload maxY
            if_icmpgt V
        L: 
            line 550
            iload minX
            istore x
        M: 
            iload x
            iload maxX
            if_icmpgt U
        N: 
            line 551
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            iload x
            iload y
            invokevirtual zombie/iso/IsoMetaGrid.isValidChunk (II)Z
            ifne O
            goto T
        O: 
            line 552
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        P: 
            line 553
            aload chunk
            ifnonnull R
        Q: 
            line 554
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunk
        R: 
            line 556
            aload this
            aload chunk
            iload x
            iload y
            iconst_1 
            invokevirtual zombie/iso/WorldStreamer.addJob (Lzombie/iso/IsoChunk;IIZ)V
        S: 
            line 557
            iinc numRequests 1
        T: 
            line 550
            iinc x 1
            goto M
        U: 
            line 549
            iinc y 1
            goto K
        V: 
            line 560
            iload numRequests
            invokedynamic makeConcatWithConstants (I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Requested \u0001 chunks from the server" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        W: 
            line 561
            invokestatic java/lang/System.currentTimeMillis ()J
            dup2 
            lstore start
        X: 
            lstore received
        Y: 
            line 562
            iconst_0 
            istore seconds
        Z: 
            line 563
            iconst_0 
            istore downloads
        AA: 
            line 564
            iconst_0 
            istore retryCount
        AB: 
            line 565
            bipush 10
            istore MAX_RETRIES
        AC: 
            line 566
            aload this
            invokevirtual zombie/iso/WorldStreamer.isBusy ()Z
            ifeq BD
        AD: 
            line 567
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore now
        AE: 
            line 568
            lload now
            lload received
            lsub 
            ldc 60000L
            lcmp 
            ifle AP
        AF: 
            line 569
            iinc retryCount 1
        AG: 
            line 570
            iload retryCount
            invokedynamic makeConcatWithConstants (I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "map download timeout: retry \u0001/10" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AH: 
            line 571
            iload retryCount
            bipush 10
            if_icmplt AK
        AI: 
            line 572
            iconst_1 
            putstatic zombie/gameStates/GameLoadingState.mapDownloadFailed Z
        AJ: 
            line 573
            new java/io/IOException
            dup 
            ldc "map download from server timed out after 10 retries"
            invokespecial java/io/IOException.<init> (Ljava/lang/String;)V
            athrow 
        AK: 
            line 575
            getstatic zombie/network/PacketTypes$PacketType.RequestLargeAreaZip Lzombie/network/PacketTypes$PacketType;
            iconst_2 
            anewarray java/lang/Object
            dup 
            iconst_0 
            iload wx
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            aastore 
            dup 
            iconst_1 
            iload wy
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            aastore 
            invokestaticinterface zombie/network/packets/INetworkPacket.send (Lzombie/network/PacketTypes$PacketType;[Ljava/lang/Object;)V
        AL: 
            // try-start:   range=[AL-AM] handler=AN:java/lang/InterruptedException 
            line 577
            ldc 50L
            iload retryCount
            i2l 
            lmul 
            invokestatic java/lang/Thread.sleep (J)V
        AM: 
            // try-end:     range=[AL-AM] handler=AN:java/lang/InterruptedException 
            line 579
            goto AO
        AN: 
            // try-handler: range=[AL-AM] handler=AN:java/lang/InterruptedException 
            astore v19
        AO: 
            line 580
            lload now
            lstore received
        AP: 
            line 582
            aload this
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            istore largeAreaDownloads
        AQ: 
            line 583
            ldc "IGUI_MP_DownloadedMapData"
            iload largeAreaDownloads
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            iload numRequests
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        AR: 
            line 584
            lload now
            lload start
            lsub 
            lstore elapsed
        AS: 
            line 585
            lload elapsed
            ldc 1000L
            ldiv 
            iload seconds
            i2l 
            lcmp 
            ifle AV
        AT: 
            line 586
            iload largeAreaDownloads
            iload numRequests
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Received \u0001 / \u0001 chunks" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AU: 
            line 587
            lload elapsed
            ldc 1000L
            ldiv 
            l2i 
            istore seconds
        AV: 
            line 589
            iload downloads
            iload largeAreaDownloads
            if_icmpge AZ
        AW: 
            line 590
            lload now
            lstore received
        AX: 
            line 591
            iload largeAreaDownloads
            istore downloads
        AY: 
            line 592
            iconst_0 
            istore retryCount
        AZ: 
            // try-start:   range=[AZ-BA] handler=BB:java/lang/InterruptedException 
            line 595
            ldc 100L
            invokestatic java/lang/Thread.sleep (J)V
        BA: 
            // try-end:     range=[AZ-BA] handler=BB:java/lang/InterruptedException 
            line 597
            goto BC
        BB: 
            // try-handler: range=[AZ-BA] handler=BB:java/lang/InterruptedException 
            astore v22
        BC: 
            line 598
            goto AC
        BD: 
            line 599
            aload this
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            iload numRequests
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Received \u0001 / \u0001 chunks" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        BE: 
            line 600
            aload this
            iconst_0 
            putfield zombie/iso/WorldStreamer.requestingLargeArea Z
        BF: 
            line 601
            return 
        BG: 
        }
    }

    .method private cancelOutOfBoundsRequests ()V {
        parameters: { this },
        code: {
        A: 
            line 604
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq C
        B: 
            line 605
            return 
        C: 
            line 607
            iconst_0 
            istore i
        D: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge J
        E: 
            line 608
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        F: 
            line 609
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifne I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne G
            goto I
        G: 
            line 610
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
        H: 
            line 611
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload request
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        I: 
            line 607
            iinc i 1
            goto D
        J: 
            line 613
            return 
        K: 
        }
    }

    .method private resendTimedOutRequests ()V {
        parameters: { this },
        code: {
        A: 
            line 616
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore time
        B: 
            line 617
            iconst_0 
            istore i
        C: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge L
        D: 
            line 618
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        E: 
            line 619
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifne K
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.time J
            ldc 8000L
            ladd 
            lload time
            lcmp 
            iflt F
            goto K
        F: 
            line 620
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq H
        G: 
            line 621
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "chunk request timed out \u0001,\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        H: 
            line 623
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        I: 
            line 624
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            bipush 9
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
        J: 
            line 625
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsMain I
            iconst_2 
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsMain I
        K: 
            line 617
            iinc i 1
            goto C
        L: 
            line 627
            return 
        M: 
        }
    }

    .method public receiveChunkPart (Ljava/nio/ByteBuffer;)V {
        parameters: { this, bb },
        code: {
        A: 
            line 630
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        B: 
            line 631
            aload request
            ifnull E
        C: 
            line 632
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 633
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto B
        E: 
            line 635
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore requestNumber
        F: 
            line 636
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore numChunks
        G: 
            line 637
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore chunkIndex
        H: 
            line 638
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore fileSize
        I: 
            line 639
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore offset
        J: 
            line 640
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore count
        K: 
            line 641
            iconst_0 
            istore i
        L: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AI
        M: 
            line 642
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request2
        N: 
            line 643
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq R
        O: 
            line 644
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            iinc i -1
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        P: 
            line 645
            aload request2
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        Q: 
            line 646
            goto AH
        R: 
            line 648
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.requestNumber I
            iload requestNumber
            if_icmpeq S
            goto AH
        S: 
            line 649
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            ifnonnull U
        T: 
            line 650
            aload request2
            aload this
            iload fileSize
            invokevirtual zombie/iso/WorldStreamer.getByteBuffer (I)Ljava/nio/ByteBuffer;
            putfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
        U: 
            line 652
            aload bb
            invokevirtual java/nio/ByteBuffer.array ()[B
            aload bb
            invokevirtual java/nio/ByteBuffer.position ()I
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.array ()[B
            iload offset
            iload count
            invokestatic java/lang/System.arraycopy (Ljava/lang/Object;ILjava/lang/Object;II)V
        V: 
            line 653
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.partsReceived [Z
            ifnonnull X
        W: 
            line 654
            aload request2
            iload numChunks
            newarray boolean
            putfield zombie/iso/WorldStreamer$ChunkRequest.partsReceived [Z
        X: 
            line 656
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.partsReceived [Z
            iload chunkIndex
            iconst_1 
            bastore 
        Y: 
            line 657
            aload request2
            invokevirtual zombie/iso/WorldStreamer$ChunkRequest.isReceived ()Z
            ifne Z
            goto AI
        Z: 
            line 658
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq AB
        AA: 
            line 659
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "received all parts for \u0001,\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        AB: 
            line 661
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            iload fileSize
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        AC: 
            line 662
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        AD: 
            line 663
            aload request2
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        AE: 
            line 664
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifne AF
            goto AI
        AF: 
            line 665
            aload this
            dup 
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            iconst_1 
            iadd 
            putfield zombie/iso/WorldStreamer.largeAreaDownloads I
        AG: 
            line 666
            goto AI
        AH: 
            line 641
            iinc i 1
            goto L
        AI: 
            line 668
            return 
        AJ: 
        }
    }

    .method public receiveNotRequired (Ljava/nio/ByteBuffer;)V {
        parameters: { this, bb },
        code: {
        A: 
            line 671
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        B: 
            line 672
            aload request
            ifnull E
        C: 
            line 673
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 674
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto B
        E: 
            line 676
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore count
        F: 
            line 677
            iconst_0 
            istore n
        G: 
            iload n
            iload count
            if_icmpge AG
        H: 
            line 678
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore requestNumber
        I: 
            line 679
            aload bb
            invokevirtual java/nio/ByteBuffer.get ()B
            iconst_1 
            if_icmpne J
            iconst_1 
            goto K
        J: 
            iconst_0 
        K: 
            istore sameOnServer
        L: 
            line 680
            iconst_0 
            istore i
        M: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AF
        N: 
            line 681
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request2
        O: 
            line 682
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq S
        P: 
            line 683
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            iinc i -1
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        Q: 
            line 684
            aload request2
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        R: 
            line 685
            goto AE
        S: 
            line 687
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.requestNumber I
            iload requestNumber
            if_icmpeq T
            goto AE
        T: 
            line 688
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq X
        U: 
            line 689
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request2
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            iload sameOnServer
            ifne V
            iconst_1 
            goto W
        V: 
            iconst_0 
        W: 
            invokedynamic makeConcatWithConstants (IIZ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "NotRequiredInZip \u0001,\u0001 delete=\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        X: 
            line 691
            iload sameOnServer
            ifne Z
        Y: 
            line 692
            aload request2
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            iconst_4 
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        Z: 
            line 694
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        AA: 
            line 695
            aload request2
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        AB: 
            line 696
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifne AC
            goto AF
        AC: 
            line 697
            aload this
            dup 
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            iconst_1 
            iadd 
            putfield zombie/iso/WorldStreamer.largeAreaDownloads I
        AD: 
            line 698
            goto AF
        AE: 
            line 680
            iinc i 1
            goto M
        AF: 
            line 677
            iinc n 1
            goto G
        AG: 
            line 701
            return 
        AH: 
        }
    }

    .method private compare (Lzombie/iso/WorldStreamer$ChunkRequest;Ljava/nio/ByteBuffer;Ljava/io/File;)V {
        parameters: { this, request, requestBB, file },
        code: {
        A: 
            line 704
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunkDownloaded
        B: 
            line 705
            aload chunkDownloaded
            ifnonnull D
        C: 
            line 706
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunkDownloaded
        D: 
            line 708
            aload chunkDownloaded
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            putfield zombie/iso/IsoChunk.wx I
        E: 
            line 709
            aload chunkDownloaded
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            putfield zombie/iso/IsoChunk.wy I
        F: 
            line 710
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunkOnDisk
        G: 
            line 711
            aload chunkOnDisk
            ifnonnull I
        H: 
            line 712
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunkOnDisk
        I: 
            line 714
            aload chunkOnDisk
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            putfield zombie/iso/IsoChunk.wx I
        J: 
            line 715
            aload chunkOnDisk
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            putfield zombie/iso/IsoChunk.wy I
        K: 
            line 716
            aload requestBB
            invokevirtual java/nio/ByteBuffer.position ()I
            istore position
        L: 
            line 717
            aload requestBB
            iconst_0 
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        M: 
            line 718
            aload chunkDownloaded
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            aload requestBB
            invokevirtual zombie/iso/IsoChunk.LoadFromBuffer (IILjava/nio/ByteBuffer;)Z
            pop 
        N: 
            line 719
            aload requestBB
            iload position
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        O: 
            line 720
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.reset ()V
        P: 
            line 721
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            aload requestBB
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            iload position
            invokevirtual java/util/zip/CRC32.update ([BII)V
        Q: 
            line 722
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.getValue ()J
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokestatic zombie/network/ChunkChecksum.getChecksumIfExists (II)J
            invokedynamic makeConcatWithConstants (JJ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "downloaded crc=\u0001 on-disk crc=\u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        R: 
            line 723
            aload chunkOnDisk
            invokevirtual zombie/iso/IsoChunk.LoadFromDisk ()V
        S: 
            line 724
            iload position
            aload file
            invokevirtual java/io/File.length ()J
            invokedynamic makeConcatWithConstants (IJ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "downloaded size=\u0001 on-disk size=\u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        T: 
            line 725
            aload this
            aload chunkDownloaded
            aload chunkOnDisk
            invokevirtual zombie/iso/WorldStreamer.compareChunks (Lzombie/iso/IsoChunk;Lzombie/iso/IsoChunk;)V
        U: 
            line 726
            aload chunkDownloaded
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        V: 
            line 727
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne W
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunkDownloaded
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq W
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        W: 
            line 728
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunkDownloaded
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        X: 
            line 729
            aload chunkOnDisk
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        Y: 
            line 730
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne Z
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunkOnDisk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq Z
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        Z: 
            line 731
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunkOnDisk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        AA: 
            line 732
            return 
        AB: 
        }
    }

    .method private compareChunks (Lzombie/iso/IsoChunk;Lzombie/iso/IsoChunk;)V {
        parameters: { this, chunk1, chunk2 },
        exceptions: { 
            { B, N, O, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 735
            aload chunk1
            getfield zombie/iso/IsoChunk.wx I
            aload chunk1
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "comparing \u0001,\u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        B: 
            // try-start:   range=[B-N] handler=O:java/lang/Exception 
            line 737
            aload this
            aload chunk1
            aload chunk2
            invokevirtual zombie/iso/WorldStreamer.compareErosion (Lzombie/iso/IsoChunk;Lzombie/iso/IsoChunk;)V
        C: 
            line 738
            aload chunk1
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            aload chunk2
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            if_icmpeq E
        D: 
            line 739
            aload chunk1
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            aload chunk2
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "lootRespawnHour \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        E: 
            line 741
            iconst_0 
            istore y
        F: 
            iload y
            bipush 8
            if_icmpge N
        G: 
            line 742
            iconst_0 
            istore x
        H: 
            iload x
            bipush 8
            if_icmpge M
        I: 
            line 743
            aload chunk1
            iload x
            iload y
            iconst_0 
            invokevirtual zombie/iso/IsoChunk.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq1
        J: 
            line 744
            aload chunk2
            iload x
            iload y
            iconst_0 
            invokevirtual zombie/iso/IsoChunk.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq2
        K: 
            line 745
            aload this
            aload sq1
            aload sq2
            invokevirtual zombie/iso/WorldStreamer.compareSquares (Lzombie/iso/IsoGridSquare;Lzombie/iso/IsoGridSquare;)V
        L: 
            line 742
            iinc x 1
            goto H
        M: 
            line 741
            iinc y 1
            goto F
        N: 
            // try-end:     range=[B-N] handler=O:java/lang/Exception 
            line 751
            goto Q
        O: 
            // try-handler: range=[B-N] handler=O:java/lang/Exception 
            line 749
            astore ex
        P: 
            line 750
            aload ex
            invokevirtual java/lang/Exception.printStackTrace ()V
        Q: 
            line 752
            return 
        R: 
        }
    }

    .method private compareErosion (Lzombie/iso/IsoChunk;Lzombie/iso/IsoChunk;)V {
        parameters: { this, chunk1, chunk2 },
        code: {
        A: 
            line 755
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            if_icmpeq C
        B: 
            line 756
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            invokedynamic makeConcatWithConstants (ZZ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "init \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        C: 
            line 758
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            if_icmpeq E
        D: 
            line 759
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "eTickStamp \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        E: 
            line 761
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            fcmpl 
            ifeq G
        F: 
            line 762
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            invokedynamic makeConcatWithConstants (FF)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "moisture \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        G: 
            line 764
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            fcmpl 
            ifeq I
        H: 
            line 765
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            invokedynamic makeConcatWithConstants (FF)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "minerals \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        I: 
            line 767
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            if_icmpeq K
        J: 
            line 768
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "epoch \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        K: 
            line 770
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            if_icmpeq M
        L: 
            line 771
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "soil \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        M: 
            line 773
            return 
        N: 
        }
    }

    .method private compareSquares (Lzombie/iso/IsoGridSquare;Lzombie/iso/IsoGridSquare;)V {
        parameters: { this, sq1, sq2 },
        exceptions: { 
            { E, BB, BC, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 776
            aload sq1
            ifnull B
            aload sq2
            ifnonnull E
        B: 
            line 777
            aload sq1
            ifnonnull C
            aload sq2
            ifnull D
        C: 
            line 778
            ldc "one square is null, the other isn\'t"
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        D: 
            line 780
            return 
        E: 
            // try-start:   range=[E-BB] handler=BC:java/lang/Exception 
            line 783
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        F: 
            line 784
            aload sq1
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            aconst_null 
            invokevirtual zombie/iso/IsoGridSquare.save (Ljava/nio/ByteBuffer;Ljava/io/ObjectOutputStream;)V
        G: 
            line 785
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        H: 
            line 786
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        I: 
            line 787
            aload sq2
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            aconst_null 
            invokevirtual zombie/iso/IsoGridSquare.save (Ljava/nio/ByteBuffer;Ljava/io/ObjectOutputStream;)V
        J: 
            line 788
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        K: 
            line 789
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.compareTo (Ljava/nio/ByteBuffer;)I
            ifeq BB
        L: 
            line 791
            iconst_1 
            istore seasonMatch
        M: 
            line 792
            iconst_m1 
            istore j
        N: 
            line 793
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.limit ()I
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.limit ()I
            if_icmpne AA
        O: 
            line 794
            iconst_0 
            istore i
        P: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.limit ()I
            if_icmpge U
        Q: 
            line 795
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            iload i
            invokevirtual java/nio/ByteBuffer.get (I)B
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            iload i
            invokevirtual java/nio/ByteBuffer.get (I)B
            if_icmpne R
            goto T
        R: 
            line 796
            iload i
            istore j
        S: 
            line 797
            goto U
        T: 
            line 794
            iinc i 1
            goto P
        U: 
            line 799
            iconst_0 
            istore r
        V: 
            iload r
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getErosionData ()Lzombie/erosion/ErosionData$Square;
            getfield zombie/erosion/ErosionData$Square.regions Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AA
        W: 
            line 800
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getErosionData ()Lzombie/erosion/ErosionData$Square;
            getfield zombie/erosion/ErosionData$Square.regions Ljava/util/ArrayList;
            iload r
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/erosion/categories/ErosionCategory$Data
            getfield zombie/erosion/categories/ErosionCategory$Data.dispSeason I
            aload sq2
            invokevirtual zombie/iso/IsoGridSquare.getErosionData ()Lzombie/erosion/ErosionData$Square;
            getfield zombie/erosion/ErosionData$Square.regions Ljava/util/ArrayList;
            iload r
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/erosion/categories/ErosionCategory$Data
            getfield zombie/erosion/categories/ErosionCategory$Data.dispSeason I
            if_icmpne X
            goto Z
        X: 
            line 801
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getErosionData ()Lzombie/erosion/ErosionData$Square;
            getfield zombie/erosion/ErosionData$Square.regions Ljava/util/ArrayList;
            iload r
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/erosion/categories/ErosionCategory$Data
            getfield zombie/erosion/categories/ErosionCategory$Data.dispSeason I
            aload sq2
            invokevirtual zombie/iso/IsoGridSquare.getErosionData ()Lzombie/erosion/ErosionData$Square;
            getfield zombie/erosion/ErosionData$Square.regions Ljava/util/ArrayList;
            iload r
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/erosion/categories/ErosionCategory$Data
            getfield zombie/erosion/categories/ErosionCategory$Data.dispSeason I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "season1=\u0001 season2=\u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        Y: 
            line 802
            iconst_0 
            istore seasonMatch
        Z: 
            line 799
            iinc r 1
            goto V
        AA: 
            line 805
            aload sq1
            getfield zombie/iso/IsoGridSquare.x I
            aload sq1
            getfield zombie/iso/IsoGridSquare.y I
            iload j
            iload seasonMatch
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getErosionData ()Lzombie/erosion/ErosionData$Square;
            getfield zombie/erosion/ErosionData$Square.regions Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            invokedynamic makeConcatWithConstants (IIIZI)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "square \u0001,\u0001 mismatch at \u0001 seasonMatch=\u0001 #regions=\u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AB: 
            line 806
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            aload sq2
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpne AU
        AC: 
            line 807
            iconst_0 
            istore i
        AD: 
            iload i
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpge BB
        AE: 
            line 808
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            iload i
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoObject
            astore obj1
        AF: 
            line 809
            aload sq2
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            iload i
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoObject
            astore obj2
        AG: 
            line 810
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        AH: 
            line 811
            aload obj1
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual zombie/iso/IsoObject.save (Ljava/nio/ByteBuffer;)V
        AI: 
            line 812
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        AJ: 
            line 813
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        AK: 
            line 814
            aload obj2
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual zombie/iso/IsoObject.save (Ljava/nio/ByteBuffer;)V
        AL: 
            line 815
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        AM: 
            line 816
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.compareTo (Ljava/nio/ByteBuffer;)I
            ifne AN
            goto AT
        AN: 
            line 817
            aload obj1
            invokevirtual java/lang/Object.getClass ()Ljava/lang/Class;
            invokevirtual java/lang/Class.getName ()Ljava/lang/String;
            aload obj1
            invokevirtual zombie/iso/IsoObject.getName ()Ljava/lang/String;
            aload obj1
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            ifnonnull AO
            ldc "no sprite"
            goto AP
        AO: 
            aload obj1
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
        AP: 
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "  1: \u0001 \u0001 \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AQ: 
            line 818
            aload obj2
            invokevirtual java/lang/Object.getClass ()Ljava/lang/Class;
            invokevirtual java/lang/Class.getName ()Ljava/lang/String;
            aload obj2
            invokevirtual zombie/iso/IsoObject.getName ()Ljava/lang/String;
            aload obj2
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            ifnonnull AR
            ldc "no sprite"
            goto AS
        AR: 
            aload obj2
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
        AS: 
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "  2: \u0001 \u0001 \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AT: 
            line 807
            iinc i 1
            goto AD
        AU: 
            line 821
            iconst_0 
            istore i
        AV: 
            iload i
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpge BB
        AW: 
            line 822
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            iload i
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoObject
            astore obj
        AX: 
            line 823
            aload obj
            invokevirtual java/lang/Object.getClass ()Ljava/lang/Class;
            invokevirtual java/lang/Class.getName ()Ljava/lang/String;
            aload obj
            invokevirtual zombie/iso/IsoObject.getName ()Ljava/lang/String;
            aload obj
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            ifnonnull AY
            ldc "no sprite"
            goto AZ
        AY: 
            aload obj
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
        AZ: 
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "  \u0001 \u0001 \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        BA: 
            line 821
            iinc i 1
            goto AV
        BB: 
            // try-end:     range=[E-BB] handler=BC:java/lang/Exception 
            line 830
            goto BE
        BC: 
            // try-handler: range=[E-BB] handler=BC:java/lang/Exception 
            line 828
            astore ex
        BD: 
            line 829
            aload ex
            invokevirtual java/lang/Exception.printStackTrace ()V
        BE: 
            line 831
            return 
        BF: 
        }
    }

    .method private synthetic lambda$create$0 ()V {
        parameters: { this },
        exceptions: { 
            { B, C, D, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 373
            aload this
            getfield zombie/iso/WorldStreamer.finished Z
            ifne G
        B: 
            // try-start:   range=[B-C] handler=D:java/lang/Throwable 
            line 375
            aload this
            invokevirtual zombie/iso/WorldStreamer.threadLoop ()V
        C: 
            // try-end:     range=[B-C] handler=D:java/lang/Throwable 
            line 379
            goto A
        D: 
            // try-handler: range=[B-C] handler=D:java/lang/Throwable 
            line 377
            astore e
        E: 
            line 378
            aload e
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        F: 
            line 379
            goto A
        G: 
            line 381
            return 
        H: 
        }
    }

    .method static <clinit> ()V {
        code: {
        A: 
            line 48
            ldc Lzombie/iso/WorldStreamer;
            invokevirtual java/lang/Class.desiredAssertionStatus ()Z
            ifne B
            iconst_1 
            goto C
        B: 
            iconst_0 
        C: 
            putstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
        D: 
            line 49
            new zombie/iso/WorldStreamer$ChunkComparator
            dup 
            invokespecial zombie/iso/WorldStreamer$ChunkComparator.<init> ()V
            putstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
        E: 
            line 56
            new zombie/iso/WorldStreamer
            dup 
            invokespecial zombie/iso/WorldStreamer.<init> ()V
            putstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
        F: 
            line 82
            iconst_0 
            putstatic zombie/iso/WorldStreamer.bLoggedPatch Z
            return 
        G: 
        }
    }

}
