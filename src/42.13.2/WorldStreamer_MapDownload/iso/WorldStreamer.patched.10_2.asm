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
    .field static final synthetic $assertionsDisabled Z 

    .method public <init> ()V {
        parameters: { this },
        code: {
        A: 
            line 43
            aload this
            invokespecial java/lang/Object.<init> ()V
        B: 
            line 52
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
        C: 
            line 53
            aload this
            new java/util/Stack
            dup 
            invokespecial java/util/Stack.<init> ()V
            putfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
        D: 
            line 54
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
        E: 
            line 55
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
        F: 
            line 56
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
        G: 
            line 57
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
        H: 
            line 58
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
        I: 
            line 60
            aload this
            new java/util/zip/CRC32
            dup 
            invokespecial java/util/zip/CRC32.<init> ()V
            putfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
        J: 
            line 61
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.freeBuffers Ljava/util/concurrent/ConcurrentLinkedQueue;
        K: 
            line 62
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
        L: 
            line 63
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
        M: 
            line 64
            aload this
            new java/util/zip/Inflater
            dup 
            invokespecial java/util/zip/Inflater.<init> ()V
            putfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
        N: 
            line 65
            aload this
            sipush 1024
            newarray byte
            putfield zombie/iso/WorldStreamer.readBuf [B
        O: 
            line 66
            aload this
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
        P: 
            line 77
            aload this
            sipush 5120
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            putfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
        Q: 
            line 78
            aload this
            sipush 5120
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            putfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            return 
        R: 
        }
    }

    .method private bufferSize (I)I {
        parameters: { this, size },
        code: {
        A: 
            line 81
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
            line 85
            aload bb
            ifnonnull C
        B: 
            line 86
            aload this
            iload capacity
            invokevirtual zombie/iso/WorldStreamer.bufferSize (I)I
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            areturn 
        C: 
            line 88
            aload bb
            invokevirtual java/nio/ByteBuffer.capacity ()I
            iload capacity
            if_icmpge F
        D: 
            line 89
            aload this
            iload capacity
            invokevirtual zombie/iso/WorldStreamer.bufferSize (I)I
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            astore newBB
        E: 
            line 90
            aload newBB
            aload bb
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            aload bb
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/nio/ByteBuffer.put ([BII)Ljava/nio/ByteBuffer;
            areturn 
        F: 
            line 92
            aload bb
            areturn 
        G: 
        }
    }

    .method private getByteBuffer (I)Ljava/nio/ByteBuffer; {
        parameters: { this, capacity },
        code: {
        A: 
            line 96
            aload this
            getfield zombie/iso/WorldStreamer.freeBuffers Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast java/nio/ByteBuffer
            astore bb
        B: 
            line 97
            aload bb
            ifnonnull D
        C: 
            line 98
            aload this
            iload capacity
            invokevirtual zombie/iso/WorldStreamer.bufferSize (I)I
            invokestatic java/nio/ByteBuffer.allocate (I)Ljava/nio/ByteBuffer;
            areturn 
        D: 
            line 100
            aload bb
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        E: 
            line 101
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
            line 105
            aload this
            getfield zombie/iso/WorldStreamer.freeBuffers Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload bb
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        B: 
            line 106
            return 
        C: 
        }
    }

    .method private sendRequests ()V {
        parameters: { this },
        code: {
        A: 
            line 109
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq C
        B: 
            line 110
            return 
        C: 
            line 113
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq E
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            bipush 20
            if_icmple E
        D: 
            line 114
            return 
        E: 
            line 117
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore time
        F: 
            line 122
            aconst_null 
            astore head
            aconst_null 
            astore tail
        G: 
            line 125
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            iconst_1 
            isub 
            istore i
        H: 
            iload i
            iflt Y
        I: 
            line 126
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        J: 
            line 127
            invokestatic zombie/iso/WorldStreamer$ChunkRequest.alloc ()Lzombie/iso/WorldStreamer$ChunkRequest;
            astore request
        K: 
            line 128
            aload request
            aload chunk
            putfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
        L: 
            line 129
            aload request
            aload this
            dup 
            getfield zombie/iso/WorldStreamer.requestNumber I
            dup_x1 
            iconst_1 
            iadd 
            putfield zombie/iso/WorldStreamer.requestNumber I
            putfield zombie/iso/WorldStreamer$ChunkRequest.requestNumber I
        M: 
            line 130
            aload request
            lload time
            putfield zombie/iso/WorldStreamer$ChunkRequest.time J
        N: 
            line 131
            aload request
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokestatic zombie/network/ChunkChecksum.getChecksum (II)J
            putfield zombie/iso/WorldStreamer$ChunkRequest.crc J
        O: 
            line 133
            aload head
            ifnonnull Q
        P: 
            line 134
            aload request
            astore head
            goto R
        Q: 
            line 136
            aload tail
            aload request
            putfield zombie/iso/WorldStreamer$ChunkRequest.next Lzombie/iso/WorldStreamer$ChunkRequest;
        R: 
            line 138
            aload request
            aconst_null 
            putfield zombie/iso/WorldStreamer$ChunkRequest.next Lzombie/iso/WorldStreamer$ChunkRequest;
        S: 
            line 139
            aload request
            astore tail
        T: 
            line 141
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        U: 
            line 143
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        V: 
            line 144
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq X
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            bipush 40
            if_icmplt X
        W: 
            line 145
            goto Y
        X: 
            line 125
            iinc i -1
            goto H
        Y: 
            line 149
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload head
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        Z: 
            line 150
            return 
        AA: 
        }
    }

    .method public updateMain ()V {
        parameters: { this },
        code: {
        A: 
            line 153
            getstatic zombie/network/GameClient.connection Lzombie/core/raknet/UdpConnection;
            astore connection
        B: 
            line 157
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            ifnull E
        C: 
            line 158
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 159
            aload this
            aconst_null 
            putfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
        E: 
            line 164
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        F: 
            line 165
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        G: 
            aload request
            ifnull P
        H: 
            line 166
            aload request
            ifnull O
        I: 
            line 167
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.next Lzombie/iso/WorldStreamer$ChunkRequest;
            astore next
        J: 
            line 169
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq L
        K: 
            line 171
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            goto M
        L: 
            line 173
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        M: 
            line 175
            aload next
            astore request
        N: 
            line 176
            goto H
        O: 
            line 165
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto G
        P: 
            line 179
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne X
        Q: 
            line 180
            new zombie/network/packets/RequestZipListPacket
            dup 
            invokespecial zombie/network/packets/RequestZipListPacket.<init> ()V
            astore packet
        R: 
            line 181
            aload packet
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual zombie/network/packets/RequestZipListPacket.set (Ljava/util/ArrayList;)V
        S: 
            line 182
            aload connection
            invokevirtual zombie/core/raknet/UdpConnection.startPacket ()Lzombie/core/network/ByteBufferWriter;
            astore b
        T: 
            line 183
            getstatic zombie/network/PacketTypes$PacketType.RequestZipList Lzombie/network/PacketTypes$PacketType;
            aload b
            invokevirtual zombie/network/PacketTypes$PacketType.doPacket (Lzombie/core/network/ByteBufferWriter;)V
        U: 
            line 184
            aload packet
            aload b
            invokevirtual zombie/network/packets/RequestZipListPacket.write (Lzombie/core/network/ByteBufferWriter;)V
        V: 
            line 185
            getstatic zombie/network/PacketTypes$PacketType.RequestZipList Lzombie/network/PacketTypes$PacketType;
            aload connection
            invokevirtual zombie/network/PacketTypes$PacketType.send (Lzombie/core/raknet/UdpConnection;)V
        W: 
            line 187
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.addAll (Ljava/util/Collection;)Z
            pop 
        X: 
            line 191
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        Y: 
            line 192
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        Z: 
            aload request
            ifnull AC
        AA: 
            line 198
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AB: 
            line 192
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto Z
        AC: 
            line 201
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne AJ
        AD: 
            line 202
            new zombie/network/packets/NotRequiredInZipPacket
            dup 
            invokespecial zombie/network/packets/NotRequiredInZipPacket.<init> ()V
            astore packet2
        AE: 
            line 203
            aload packet2
            aload this
            getfield zombie/iso/WorldStreamer.tempRequests Ljava/util/ArrayList;
            invokevirtual zombie/network/packets/NotRequiredInZipPacket.set (Ljava/util/ArrayList;)V
        AF: 
            line 204
            aload connection
            invokevirtual zombie/core/raknet/UdpConnection.startPacket ()Lzombie/core/network/ByteBufferWriter;
            astore b
        AG: 
            line 205
            getstatic zombie/network/PacketTypes$PacketType.NotRequiredInZip Lzombie/network/PacketTypes$PacketType;
            aload b
            invokevirtual zombie/network/PacketTypes$PacketType.doPacket (Lzombie/core/network/ByteBufferWriter;)V
        AH: 
            line 206
            aload packet2
            aload b
            invokevirtual zombie/network/packets/NotRequiredInZipPacket.write (Lzombie/core/network/ByteBufferWriter;)V
        AI: 
            line 207
            getstatic zombie/network/PacketTypes$PacketType.NotRequiredInZip Lzombie/network/PacketTypes$PacketType;
            aload connection
            invokevirtual zombie/network/PacketTypes$PacketType.send (Lzombie/core/raknet/UdpConnection;)V
        AJ: 
            line 209
            return 
        AK: 
        }
    }

    .method private loadReceivedChunks ()V {
        parameters: { this },
        exceptions: { 
            { Z, AA, AB, Ljava/util/zip/DataFormatException; }
         },
        code: {
        A: 
            line 217
            iconst_0 
            istore debug
        B: 
            line 218
            iconst_0 
            istore nReceived
        C: 
            line 219
            iconst_0 
            istore nCancel
        D: 
            line 221
            iconst_0 
            istore i
        E: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge BG
        F: 
            line 222
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        G: 
            line 225
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            iand 
            ifne I
        H: 
            line 226
            goto BF
        I: 
            line 237
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq K
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsMain I
            iconst_2 
            iand 
            ifne K
        J: 
            line 238
            goto BF
        K: 
            line 241
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            iinc i -1
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        L: 
            line 243
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/ChunkSaveWorker.Update (Lzombie/iso/IsoChunk;)V
        M: 
            line 245
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            iconst_4 
            iand 
            ifeq V
        N: 
            line 246
            getstatic zombie/ChunkMapFilenames.instance Lzombie/ChunkMapFilenames;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/ChunkMapFilenames.getFilename (II)Ljava/io/File;
            astore file
        O: 
            line 247
            aload file
            invokevirtual java/io/File.exists ()Z
            ifeq V
        P: 
            line 248
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq T
        Q: 
            line 249
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload file
        R: 
            line 250
            invokevirtual java/io/File.getAbsolutePath ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "deleting \u0001 because it doesn\'t exist on the server" }
        S: 
            line 249
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        T: 
            line 252
            aload file
            invokevirtual java/io/File.delete ()Z
            pop 
        U: 
            line 253
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            lconst_0 
            invokestatic zombie/network/ChunkChecksum.setChecksum (IIJ)V
        V: 
            line 257
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq W
            aconst_null 
            goto X
        W: 
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
        X: 
            astore requestBB
        Y: 
            line 258
            aload requestBB
            ifnull AJ
        Z: 
            // try-start:   range=[Z-AA] handler=AB:java/util/zip/DataFormatException 
            line 260
            aload this
            aload requestBB
            invokevirtual zombie/iso/WorldStreamer.decompress (Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
            astore requestBB
        AA: 
            // try-end:     range=[Z-AA] handler=AB:java/util/zip/DataFormatException 
            line 265
            goto AF
        AB: 
            // try-handler: range=[Z-AA] handler=AB:java/util/zip/DataFormatException 
            line 261
            astore e
        AC: 
            line 262
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "WorldStreamer.loadReceivedChunks: Error while the chunk (\u0001, \u0001) was decompressing" }
            invokevirtual zombie/debug/DebugLogStream.error (Ljava/lang/Object;)V
        AD: 
            line 263
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AE: 
            line 264
            goto BF
        AF: 
            line 268
            aload this
            getfield zombie/iso/WorldStreamer.compare Z
            ifeq AJ
        AG: 
            line 269
            getstatic zombie/ChunkMapFilenames.instance Lzombie/ChunkMapFilenames;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/ChunkMapFilenames.getFilename (II)Ljava/io/File;
            astore file
        AH: 
            line 270
            aload file
            invokevirtual java/io/File.exists ()Z
            ifeq AJ
        AI: 
            line 271
            aload this
            aload request
            aload requestBB
            aload file
            invokevirtual zombie/iso/WorldStreamer.compare (Lzombie/iso/WorldStreamer$ChunkRequest;Ljava/nio/ByteBuffer;Ljava/io/File;)V
        AJ: 
            line 276
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            bipush 8
            iand 
            ifeq AK
            goto BC
        AK: 
            line 278
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifne AL
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq AZ
        AL: 
            line 280
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq AP
        AM: 
            line 281
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            aload requestBB
            ifnull AN
            iconst_1 
            goto AO
        AN: 
            iconst_0 
        AO: 
            invokedynamic makeConcatWithConstants (IIZ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001 refs.isEmpty() SafeWrite=\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        AP: 
            line 283
            aload requestBB
            ifnull AW
        AQ: 
            line 284
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokestatic zombie/network/ChunkChecksum.getChecksumIfExists (II)J
            lstore crc
        AR: 
            line 285
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.reset ()V
        AS: 
            line 286
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            aload requestBB
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            aload requestBB
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/util/zip/CRC32.update ([BII)V
        AT: 
            line 287
            lload crc
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.getValue ()J
            lcmp 
            ifne AU
            goto AW
        AU: 
            line 289
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
        AV: 
            line 290
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            aload requestBB
            invokestatic zombie/iso/IsoChunk.SafeWrite (IILjava/nio/ByteBuffer;)V
        AW: 
            line 293
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        AX: 
            line 294
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne AY
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq AY
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        AY: 
            line 295
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
            goto BC
        AZ: 
            line 297
            aload requestBB
            ifnull BB
        BA: 
            line 298
            aload requestBB
            iconst_0 
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        BB: 
            line 300
            aload this
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            aload requestBB
            invokevirtual zombie/iso/WorldStreamer.DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        BC: 
            line 303
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            ifnull BE
        BD: 
            line 304
            aload this
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            invokevirtual zombie/iso/WorldStreamer.releaseBuffer (Ljava/nio/ByteBuffer;)V
        BE: 
            line 306
            aload request
            invokestatic zombie/iso/WorldStreamer$ChunkRequest.release (Lzombie/iso/WorldStreamer$ChunkRequest;)V
        BF: 
            line 221
            iinc i 1
            goto E
        BG: 
            line 314
            return 
        BH: 
        }
    }

    .method private decompress (Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer; {
        parameters: { this, bb },
        code: {
        A: 
            line 317
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            invokevirtual java/util/zip/Inflater.reset ()V
        B: 
            line 318
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            aload bb
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            aload bb
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/util/zip/Inflater.setInput ([BII)V
        C: 
            line 319
            iconst_0 
            istore position
        D: 
            line 320
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            ifnull F
        E: 
            line 321
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        F: 
            line 323
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            invokevirtual java/util/zip/Inflater.finished ()Z
            ifne O
        G: 
            line 324
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            aload this
            getfield zombie/iso/WorldStreamer.readBuf [B
            invokevirtual java/util/zip/Inflater.inflate ([B)I
            istore count
        H: 
            line 325
            iload count
            ifeq L
        I: 
            line 326
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
            line 327
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.readBuf [B
            iconst_0 
            iload count
            invokevirtual java/nio/ByteBuffer.put ([BII)Ljava/nio/ByteBuffer;
            pop 
        K: 
            line 328
            iload position
            iload count
            iadd 
            istore position
            goto N
        L: 
            line 329
            aload this
            getfield zombie/iso/WorldStreamer.decompressor Ljava/util/zip/Inflater;
            invokevirtual java/util/zip/Inflater.finished ()Z
            ifne N
        M: 
            line 330
            new java/util/zip/DataFormatException
            dup 
            invokespecial java/util/zip/DataFormatException.<init> ()V
            athrow 
        N: 
            line 332
            goto F
        O: 
            line 333
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.inMemoryZip Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.position ()I
            invokevirtual java/nio/ByteBuffer.limit (I)Ljava/nio/ByteBuffer;
            pop 
        P: 
            line 334
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
            line 338
            getstatic zombie/network/GameClient.client Z
            ifeq R
            getstatic zombie/SystemDisabler.doWorldSyncEnable Z
            ifne R
        B: 
            line 339
            aload this
            getstatic zombie/debug/DebugType.NetworkFileDebug Lzombie/debug/DebugType;
            invokevirtual zombie/debug/DebugType.isEnabled ()Z
            putfield zombie/iso/WorldStreamer.networkFileDebug Z
        C: 
            line 342
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        D: 
            aload chunk
            ifnull K
        E: 
            line 343
            aload chunk
            ifnull J
        F: 
            line 344
            aload chunk
            getfield zombie/iso/IsoChunk.next Lzombie/iso/IsoChunk;
            astore next
        G: 
            line 345
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            aload chunk
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        H: 
            line 346
            aload next
            astore chunk
        I: 
            line 347
            goto E
        J: 
            line 342
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
            goto D
        K: 
            line 350
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne O
        L: 
            line 352
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokevirtual zombie/iso/WorldStreamer$ChunkComparator.init ()V
        M: 
            line 353
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokestatic java/util/Collections.sort (Ljava/util/List;Ljava/util/Comparator;)V
        N: 
            line 354
            aload this
            invokevirtual zombie/iso/WorldStreamer.sendRequests ()V
        O: 
            line 357
            aload this
            invokevirtual zombie/iso/WorldStreamer.loadReceivedChunks ()V
        P: 
            line 358
            aload this
            invokevirtual zombie/iso/WorldStreamer.cancelOutOfBoundsRequests ()V
        Q: 
            line 359
            aload this
            invokevirtual zombie/iso/WorldStreamer.resendTimedOutRequests ()V
        R: 
            line 363
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        S: 
            aload chunk
            ifnull Y
        T: 
            line 364
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            aload chunk
            invokevirtual java/util/Stack.contains (Ljava/lang/Object;)Z
            ifeq W
        U: 
            line 365
            ldc "Ignoring duplicate chunk added to WorldStreamer.jobList"
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        V: 
            line 366
            goto X
        W: 
            line 368
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            aload chunk
            invokevirtual java/util/Stack.add (Ljava/lang/Object;)Z
            pop 
        X: 
            line 363
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
            goto S
        Y: 
            line 371
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.isEmpty ()Z
            ifne BA
        Z: 
            line 373
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.size ()I
            iconst_1 
            isub 
            istore i
        AA: 
            iload i
            iflt AI
        AB: 
            line 374
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            iload i
            invokevirtual java/util/Stack.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        AC: 
            line 375
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq AH
        AD: 
            line 376
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            iload i
            invokevirtual java/util/Stack.remove (I)Ljava/lang/Object;
            pop 
        AE: 
            line 377
            aload chunk
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        AF: 
            line 378
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne AG
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq AG
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        AG: 
            line 379
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        AH: 
            line 373
            iinc i -1
            goto AA
        AI: 
            line 383
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.isEmpty ()Z
            ifne AJ
            iconst_1 
            goto AK
        AJ: 
            iconst_0 
        AK: 
            istore busy
        AL: 
            line 385
            aconst_null 
            astore chunk
        AM: 
            line 386
            iload busy
            ifeq AQ
        AN: 
            line 388
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokevirtual zombie/iso/WorldStreamer$ChunkComparator.init ()V
        AO: 
            line 389
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            getstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
            invokestatic java/util/Collections.sort (Ljava/util/List;Ljava/util/Comparator;)V
        AP: 
            line 392
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.size ()I
            iconst_1 
            isub 
            invokevirtual java/util/Stack.remove (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        AQ: 
            line 395
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload chunk
            invokevirtual zombie/iso/ChunkSaveWorker.Update (Lzombie/iso/IsoChunk;)V
        AR: 
            line 397
            aload chunk
            ifnull AX
        AS: 
            line 399
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq AW
        AT: 
            line 400
            aload chunk
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        AU: 
            line 401
            getstatic zombie/iso/WorldStreamer.$assertionsDisabled Z
            ifne AV
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.contains (Ljava/lang/Object;)Z
            ifeq AV
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        AV: 
            line 402
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
            goto AX
        AW: 
            line 404
            aload this
            aload chunk
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        AX: 
            line 408
            iload busy
            ifne AY
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            getfield zombie/iso/ChunkSaveWorker.saving Z
            ifeq AZ
        AY: 
            line 409
            return 
        AZ: 
            line 411
            goto BH
        BA: 
            line 412
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aconst_null 
            invokevirtual zombie/iso/ChunkSaveWorker.Update (Lzombie/iso/IsoChunk;)V
        BB: 
            line 413
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            getfield zombie/iso/ChunkSaveWorker.saving Z
            ifeq BD
        BC: 
            line 414
            return 
        BD: 
            line 416
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne BG
        BE: 
            line 417
            ldc 20L
            invokestatic java/lang/Thread.sleep (J)V
        BF: 
            line 418
            return 
        BG: 
            line 420
            ldc 140L
            invokestatic java/lang/Thread.sleep (J)V
        BH: 
            line 423
            getstatic zombie/network/GameClient.client Z
            ifne BK
            getstatic zombie/GameWindow.loadedAsClient Z
            ifne BK
        BI: 
            line 424
            invokestatic zombie/savefile/PlayerDB.isAvailable ()Z
            ifeq BK
        BJ: 
            line 425
            invokestatic zombie/savefile/PlayerDB.getInstance ()Lzombie/savefile/PlayerDB;
            invokevirtual zombie/savefile/PlayerDB.updateWorldStreamer ()V
        BK: 
            line 428
            getstatic zombie/vehicles/VehiclesDB2.instance Lzombie/vehicles/VehiclesDB2;
            invokevirtual zombie/vehicles/VehiclesDB2.updateWorldStreamer ()V
        BL: 
            line 430
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            ifnull BN
        BM: 
            line 431
            ldc 140L
            invokestatic java/lang/Thread.sleep (J)V
            goto BO
        BN: 
            line 433
            lconst_0 
            invokestatic java/lang/Thread.sleep (J)V
        BO: 
            line 435
            return 
        BP: 
        }
    }

    .method public create ()V {
        parameters: { this },
        code: {
        A: 
            line 438
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            ifnull C
        B: 
            line 439
            return 
        C: 
            line 441
            getstatic zombie/network/GameServer.server Z
            ifeq E
        D: 
            line 442
            return 
        E: 
            line 445
            aload this
            iconst_0 
            putfield zombie/iso/WorldStreamer.finished Z
        F: 
            line 446
            aload this
            new java/lang/Thread
            dup 
            getstatic zombie/core/ThreadGroups.Workers Ljava/lang/ThreadGroup;
            aload this
            invokedynamic run (Lzombie/iso/WorldStreamer;)Ljava/lang/Runnable; LambdaMetafactory.metafactory { ()V, { invokevirtual, zombie/iso/WorldStreamer.lambda$create$0, ()V }, ()V }
            invokespecial java/lang/Thread.<init> (Ljava/lang/ThreadGroup;Ljava/lang/Runnable;)V
            putfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
        G: 
            line 459
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            iconst_5 
            invokevirtual java/lang/Thread.setPriority (I)V
        H: 
            line 460
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            iconst_1 
            invokevirtual java/lang/Thread.setDaemon (Z)V
        I: 
            line 461
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            ldc "World Streamer"
            invokevirtual java/lang/Thread.setName (Ljava/lang/String;)V
        J: 
            line 462
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            invokedynamic uncaughtException ()Ljava/lang/Thread$UncaughtExceptionHandler; LambdaMetafactory.metafactory { (Ljava/lang/Thread;Ljava/lang/Throwable;)V, { invokestatic, zombie/GameWindow.uncaughtException, (Ljava/lang/Thread;Ljava/lang/Throwable;)V }, (Ljava/lang/Thread;Ljava/lang/Throwable;)V }
            invokevirtual java/lang/Thread.setUncaughtExceptionHandler (Ljava/lang/Thread$UncaughtExceptionHandler;)V
        K: 
            line 463
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            invokevirtual java/lang/Thread.start ()V
        L: 
            line 464
            return 
        M: 
        }
    }

    .method public addJob (Lzombie/iso/IsoChunk;IIZ)V {
        parameters: { this, chunk, wx, wy, bDoServerRequest },
        code: {
        A: 
            line 467
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 468
            return 
        C: 
            line 471
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        D: 
            line 472
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        E: 
            line 474
            getstatic zombie/network/GameClient.client Z
            ifeq I
            getstatic zombie/SystemDisabler.doWorldSyncEnable Z
            ifne I
            iload bDoServerRequest
            ifeq I
        F: 
            line 476
            aload chunk
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            putfield zombie/iso/IsoChunk.next Lzombie/iso/IsoChunk;
        G: 
            line 477
            aload this
            aload chunk
            putfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
        H: 
            line 478
            return 
        I: 
            line 481
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
            line 482
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
            line 484
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        L: 
            line 485
            return 
        M: 
        }
    }

    .method public DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V {
        parameters: { this, chunk, fromServer },
        code: {
        A: 
            line 488
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 489
            return 
        C: 
            line 492
            aload this
            aload chunk
            aload fromServer
            invokevirtual zombie/iso/WorldStreamer.DoChunkAlways (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        D: 
            line 493
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
            line 496
            getstatic zombie/core/Core.debug Z
            ifeq E
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.worldStreamerSlowLoad Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq E
        B: 
            // try-start:   range=[B-C] handler=D:java/lang/InterruptedException 
            line 498
            ldc 50L
            invokestatic java/lang/Thread.sleep (J)V
        C: 
            // try-end:     range=[B-C] handler=D:java/lang/InterruptedException 
            line 500
            goto E
        D: 
            // try-handler: range=[B-C] handler=D:java/lang/InterruptedException 
            line 499
            astore v3
        E: 
            line 503
            aload chunk
            ifnonnull G
        F: 
            line 504
            return 
        G: 
            // try-start:   range=[G-L] handler=P:java/lang/Exception 
            line 508
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            aload fromServer
            invokevirtual zombie/iso/IsoChunk.LoadOrCreate (IILjava/nio/ByteBuffer;)Z
            ifne M
        H: 
            line 509
            getstatic zombie/network/GameClient.client Z
            ifeq J
        I: 
            line 510
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            lconst_0 
            invokestatic zombie/network/ChunkChecksum.setChecksum (IIJ)V
        J: 
            line 512
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.Blam (II)V
        K: 
            line 513
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.LoadBrandNew (II)Z
            ifne M
        L: 
            // try-end:     range=[G-L] handler=P:java/lang/Exception 
            line 514
            return 
        M: 
            // try-start:   range=[M-O] handler=P:java/lang/Exception 
            line 517
            aload fromServer
            ifnonnull O
        N: 
            line 518
            getstatic zombie/vehicles/VehiclesDB2.instance Lzombie/vehicles/VehiclesDB2;
            aload chunk
            invokevirtual zombie/vehicles/VehiclesDB2.loadChunk (Lzombie/iso/IsoChunk;)V
        O: 
            // try-end:     range=[M-O] handler=P:java/lang/Exception 
            line 530
            goto X
        P: 
            // try-handler: range=[G-L] handler=P:java/lang/Exception 
            // try-handler: range=[M-O] handler=P:java/lang/Exception 
            line 520
            astore ex
        Q: 
            line 521
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Exception thrown while trying to load chunk: \u0001, \u0001" }
            invokevirtual zombie/debug/DebugLogStream.error (Ljava/lang/Object;)V
        R: 
            line 522
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        S: 
            line 523
            getstatic zombie/network/GameClient.client Z
            ifeq U
        T: 
            line 524
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            lconst_0 
            invokestatic zombie/network/ChunkChecksum.setChecksum (IIJ)V
        U: 
            line 526
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.Blam (II)V
        V: 
            line 527
            aload chunk
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokevirtual zombie/iso/IsoChunk.LoadBrandNew (II)Z
            ifne X
        W: 
            line 528
            return 
        X: 
            line 532
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
            line 535
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne AA
        Z: 
            line 536
            aload chunk
            invokevirtual zombie/iso/IsoChunk.loadInWorldStreamerThread ()V
        AA: 
            // try-end:     range=[Y-AA] handler=AB:java/lang/Exception 
            line 540
            goto AD
        AB: 
            // try-handler: range=[Y-AA] handler=AB:java/lang/Exception 
            line 538
            astore ex
        AC: 
            line 539
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        AD: 
            line 541
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
            goto AG
        AE: 
            line 543
            aload chunk
            invokevirtual zombie/iso/IsoChunk.doLoadGridsquare ()V
        AF: 
            line 544
            aload chunk
            iconst_1 
            putfield zombie/iso/IsoChunk.loaded Z
        AG: 
            line 546
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
            line 549
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 550
            return 
        C: 
            line 553
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        D: 
            line 554
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        E: 
            // try-start:   range=[E-F] handler=G:java/lang/Exception 
            line 557
            aload this
            aload chunk
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunkAlways (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        F: 
            // try-end:     range=[E-F] handler=G:java/lang/Exception 
            line 560
            goto I
        G: 
            // try-handler: range=[E-F] handler=G:java/lang/Exception 
            line 558
            astore e
        H: 
            line 559
            aload e
            invokevirtual java/lang/Exception.printStackTrace ()V
        I: 
            line 561
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
            line 564
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 565
            return 
        C: 
            line 568
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        D: 
            line 569
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        E: 
            line 570
            aload chunk
            getstatic zombie/iso/IsoChunk$JobType.Convert Lzombie/iso/IsoChunk$JobType;
            putfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
        F: 
            // try-start:   range=[F-G] handler=H:java/lang/Exception 
            line 573
            aload this
            aload chunk
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunk (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        G: 
            // try-end:     range=[F-G] handler=H:java/lang/Exception 
            line 576
            goto J
        H: 
            // try-handler: range=[F-G] handler=H:java/lang/Exception 
            line 574
            astore e
        I: 
            line 575
            aload e
            invokevirtual java/lang/Exception.printStackTrace ()V
        J: 
            line 577
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
            line 580
            aload chunk
            iload wx
            putfield zombie/iso/IsoChunk.wx I
        B: 
            line 581
            aload chunk
            iload wy
            putfield zombie/iso/IsoChunk.wy I
        C: 
            line 582
            aload chunk
            getstatic zombie/iso/IsoChunk$JobType.SoftReset Lzombie/iso/IsoChunk$JobType;
            putfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
        D: 
            // try-start:   range=[D-E] handler=F:java/lang/Exception 
            line 585
            aload this
            aload chunk
            aconst_null 
            invokevirtual zombie/iso/WorldStreamer.DoChunkAlways (Lzombie/iso/IsoChunk;Ljava/nio/ByteBuffer;)V
        E: 
            // try-end:     range=[D-E] handler=F:java/lang/Exception 
            line 588
            goto H
        F: 
            // try-handler: range=[D-E] handler=F:java/lang/Exception 
            line 586
            astore e
        G: 
            line 587
            aload e
            invokevirtual java/lang/Exception.printStackTrace ()V
        H: 
            line 589
            return 
        I: 
        }
    }

    .method public isBusy ()Z {
        parameters: { this },
        code: {
        A: 
            line 593
            getstatic zombie/network/GameClient.client Z
            ifeq D
        B: 
            line 594
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests0 Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq C
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq C
            aload this
            getfield zombie/iso/WorldStreamer.chunkHeadMain Lzombie/iso/IsoChunk;
            ifnonnull C
            aload this
            getfield zombie/iso/WorldStreamer.waitingToSendQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq C
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq C
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq C
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq C
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne D
        C: 
            line 595
            iconst_1 
            ireturn 
        D: 
            line 599
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.isEmpty ()Z
            ifeq E
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.isEmpty ()Z
            ifne F
        E: 
            iconst_1 
            goto G
        F: 
            iconst_0 
        G: 
            ireturn 
        H: 
        }
    }

    .method public stop ()V {
        parameters: { this },
        code: {
        A: 
            line 603
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 1"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        B: 
            line 604
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            ifnonnull D
        C: 
            line 605
            return 
        D: 
            line 607
            aload this
            iconst_1 
            putfield zombie/iso/WorldStreamer.finished Z
        E: 
            line 608
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 2"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        F: 
            line 609
            aload this
            getfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
            invokevirtual java/lang/Thread.isAlive ()Z
            ifeq H
        G: 
            line 610
            invokestatic zombie/MainThread.busyWait ()V
            goto F
        H: 
            line 612
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 3"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        I: 
            line 613
            aload this
            aconst_null 
            putfield zombie/iso/WorldStreamer.worldStreamer Ljava/lang/Thread;
        J: 
            line 614
            aload this
            getfield zombie/iso/WorldStreamer.jobList Ljava/util/Stack;
            invokevirtual java/util/Stack.clear ()V
        K: 
            line 615
            aload this
            getfield zombie/iso/WorldStreamer.jobQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.clear ()V
        L: 
            line 616
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 4"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        M: 
            line 617
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            invokevirtual zombie/iso/ChunkSaveWorker.SaveNow ()V
        N: 
            line 618
            invokestatic zombie/network/ChunkChecksum.Reset ()V
        O: 
            line 619
            getstatic zombie/debug/DebugType.ExitDebug Lzombie/debug/DebugType;
            ldc "WorldStreamer.stop 5"
            invokevirtual zombie/debug/DebugType.debugln (Ljava/lang/Object;)V
        P: 
            line 620
            return 
        Q: 
        }
    }

    .method public quit ()V {
        parameters: { this },
        code: {
        A: 
            line 623
            aload this
            invokevirtual zombie/iso/WorldStreamer.stop ()V
        B: 
            line 624
            return 
        C: 
        }
    }

    .method public requestLargeAreaZip (III)V {
        parameters: { this, wx, wy, range },
        exceptions: { 
            { AR, AS, AT, Ljava/lang/InterruptedException; }
         },
        code: {
        A: 
            line 629
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
            line 631
            aload this
            iconst_1 
            putfield zombie/iso/WorldStreamer.requestingLargeArea Z
        C: 
            line 632
            aload this
            iconst_0 
            putfield zombie/iso/WorldStreamer.largeAreaDownloads I
        D: 
            line 634
            ldc "IGUI_MP_RequestMapData"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        E: 
            line 636
            iconst_0 
            istore numRequests
        F: 
            line 638
            iload wx
            iload range
            isub 
            istore minX
        G: 
            line 639
            iload wy
            iload range
            isub 
            istore minY
        H: 
            line 640
            iload wx
            iload range
            iadd 
            istore maxX
        I: 
            line 641
            iload wy
            iload range
            iadd 
            istore maxY
        J: 
            line 642
            iload minY
            istore y
        K: 
            iload y
            iload maxY
            if_icmpgt W
        L: 
            line 643
            iload minX
            istore x
        M: 
            iload x
            iload maxX
            if_icmpgt V
        N: 
            line 644
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            iload x
            iload y
            invokevirtual zombie/iso/IsoMetaGrid.isValidChunk (II)Z
            ifne P
        O: 
            line 645
            goto U
        P: 
            line 647
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        Q: 
            line 648
            aload chunk
            ifnonnull S
        R: 
            line 649
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunk
        S: 
            line 652
            aload this
            aload chunk
            iload x
            iload y
            iconst_1 
            invokevirtual zombie/iso/WorldStreamer.addJob (Lzombie/iso/IsoChunk;IIZ)V
        T: 
            line 654
            iinc numRequests 1
        U: 
            line 643
            iinc x 1
            goto M
        V: 
            line 642
            iinc y 1
            goto K
        W: 
            line 658
            iload numRequests
            invokedynamic makeConcatWithConstants (I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "PATCH: Requested \u0001 chunks from the server. With 10 minutes time-out." }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        X: 
            line 660
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore start
        Y: 
            line 661
            lload start
            lstore received
        Z: 
            line 662
            iconst_0 
            istore seconds
        AA: 
            line 663
            iconst_0 
            istore downloads
            iconst_0 
            istore retryCount
        AB: 
            line 665
            aload this
            invokevirtual zombie/iso/WorldStreamer.isBusy ()Z
            ifeq AV
        AC: 
            line 666
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore now
        AD: 
            line 667
            lload now
            lload received
            lsub 
            ldc 60000L
            lcmp 
            ifle AG
            iload retryCount
            bipush 10
            if_icmpge AE
            iinc retryCount 1
            lload now
            lstore received
            ldc "Map download from server timed out, retrying..."
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
            goto AG
        AE: 
            line 668
            iconst_1 
            putstatic zombie/gameStates/GameLoadingState.mapDownloadFailed Z
        AF: 
            line 669
            new java/io/IOException
            dup 
            ldc "map download from server timed out"
            invokespecial java/io/IOException.<init> (Ljava/lang/String;)V
            athrow 
        AG: 
            line 671
            aload this
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            istore largeAreaDownloads
        AH: 
            line 672
            ldc "IGUI_MP_DownloadedMapData"
            iload largeAreaDownloads
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            iload numRequests
        AI: 
            line 673
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
        AJ: 
            line 672
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        AK: 
            line 675
            lload now
            lload start
            lsub 
            lstore elapsed
        AL: 
            line 676
            lload elapsed
            ldc 1000L
            ldiv 
            iload seconds
            i2l 
            lcmp 
            ifle AO
        AM: 
            line 677
            iload largeAreaDownloads
            iload numRequests
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Received \u0001 / \u0001 chunks" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AN: 
            line 678
            lload elapsed
            ldc 1000L
            ldiv 
            l2i 
            istore seconds
        AO: 
            line 680
            iload downloads
            iload largeAreaDownloads
            if_icmpge AR
        AP: 
            line 681
            lload now
            lstore received
        AQ: 
            line 682
            iload largeAreaDownloads
            istore downloads
        AR: 
            // try-start:   range=[AR-AS] handler=AT:java/lang/InterruptedException 
            line 685
            ldc 100L
            invokestatic java/lang/Thread.sleep (J)V
        AS: 
            // try-end:     range=[AR-AS] handler=AT:java/lang/InterruptedException 
            line 687
            goto AU
        AT: 
            // try-handler: range=[AR-AS] handler=AT:java/lang/InterruptedException 
            line 686
            astore v20
        AU: 
            line 688
            goto AB
        AV: 
            line 690
            aload this
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            iload numRequests
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Received \u0001 / \u0001 chunks" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AW: 
            line 692
            aload this
            iconst_0 
            putfield zombie/iso/WorldStreamer.requestingLargeArea Z
        AX: 
            line 693
            return 
        AY: 
        }
    }

    .method private cancelOutOfBoundsRequests ()V {
        parameters: { this },
        code: {
        A: 
            line 696
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq C
        B: 
            line 697
            return 
        C: 
            line 703
            iconst_0 
            istore i
        D: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge L
        E: 
            line 704
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        F: 
            line 705
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq H
        G: 
            line 706
            goto K
        H: 
            line 708
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq K
        I: 
            line 709
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
        J: 
            line 710
            aload this
            getfield zombie/iso/WorldStreamer.waitingToCancelQ Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload request
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        K: 
            line 703
            iinc i 1
            goto D
        L: 
            line 713
            return 
        M: 
        }
    }

    .method private resendTimedOutRequests ()V {
        parameters: { this },
        code: {
        A: 
            line 716
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore time
        B: 
            line 717
            iconst_0 
            istore i
        C: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge N
        D: 
            line 718
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests1 Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        E: 
            line 719
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq G
        F: 
            line 720
            goto M
        G: 
            line 722
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.time J
            ldc 8000L
            ladd 
            lload time
            lcmp 
            ifge M
        H: 
            line 723
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq J
        I: 
            line 724
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "chunk request timed out \u0001,\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        J: 
            line 726
            aload this
            getfield zombie/iso/WorldStreamer.chunkRequests1 Ljava/util/ArrayList;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        K: 
            line 727
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            bipush 9
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
        L: 
            line 730
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsMain I
            iconst_2 
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsMain I
        M: 
            line 717
            iinc i 1
            goto C
        N: 
            line 733
            return 
        O: 
        }
    }

    .method public receiveChunkPart (Ljava/nio/ByteBuffer;)V {
        parameters: { this, bb },
        code: {
        A: 
            line 737
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        B: 
            aload request
            ifnull E
        C: 
            line 738
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 737
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto B
        E: 
            line 740
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore requestNumber
        F: 
            line 741
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore numChunks
        G: 
            line 742
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore chunkIndex
        H: 
            line 743
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore fileSize
        I: 
            line 744
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore offset
        J: 
            line 745
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore count
        K: 
            line 746
            iconst_0 
            istore i
        L: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AH
        M: 
            line 747
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        N: 
            line 750
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq R
        O: 
            line 751
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            iinc i -1
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        P: 
            line 752
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        Q: 
            line 753
            goto AG
        R: 
            line 755
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.requestNumber I
            iload requestNumber
            if_icmpne AG
        S: 
            line 756
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            ifnonnull U
        T: 
            line 757
            aload request
            aload this
            iload fileSize
            invokevirtual zombie/iso/WorldStreamer.getByteBuffer (I)Ljava/nio/ByteBuffer;
            putfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
        U: 
            line 759
            aload bb
            invokevirtual java/nio/ByteBuffer.array ()[B
            aload bb
            invokevirtual java/nio/ByteBuffer.position ()I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.array ()[B
            iload offset
            iload count
            invokestatic java/lang/System.arraycopy (Ljava/lang/Object;ILjava/lang/Object;II)V
        V: 
            line 760
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.partsReceived [Z
            ifnonnull X
        W: 
            line 761
            aload request
            iload numChunks
            newarray boolean
            putfield zombie/iso/WorldStreamer$ChunkRequest.partsReceived [Z
        X: 
            line 763
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.partsReceived [Z
            iload chunkIndex
            iconst_1 
            bastore 
        Y: 
            line 764
            aload request
            invokevirtual zombie/iso/WorldStreamer$ChunkRequest.isReceived ()Z
            ifeq AH
        Z: 
            line 765
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq AB
        AA: 
            line 766
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "received all parts for \u0001,\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        AB: 
            line 768
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.bb Ljava/nio/ByteBuffer;
            iload fileSize
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        AC: 
            line 769
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        AD: 
            line 770
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        AE: 
            line 771
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq AH
        AF: 
            line 772
            aload this
            dup 
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            iconst_1 
            iadd 
            putfield zombie/iso/WorldStreamer.largeAreaDownloads I
            goto AH
        AG: 
            line 746
            iinc i 1
            goto L
        AH: 
            line 778
            return 
        AI: 
        }
    }

    .method public receiveNotRequired (Ljava/nio/ByteBuffer;)V {
        parameters: { this, bb },
        code: {
        A: 
            line 782
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        B: 
            aload request
            ifnull E
        C: 
            line 783
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            aload request
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 782
            aload this
            getfield zombie/iso/WorldStreamer.sentRequests Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
            goto B
        E: 
            line 785
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore count
        F: 
            line 786
            iconst_0 
            istore n
        G: 
            iload n
            iload count
            if_icmpge AF
        H: 
            line 787
            aload bb
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore requestNumber
        I: 
            line 788
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
            line 789
            iconst_0 
            istore i
        M: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AE
        N: 
            line 790
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/WorldStreamer$ChunkRequest
            astore request
        O: 
            line 793
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsWs I
            iconst_1 
            iand 
            ifeq S
        P: 
            line 794
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            iinc i -1
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        Q: 
            line 795
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        R: 
            line 796
            goto AD
        S: 
            line 798
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.requestNumber I
            iload requestNumber
            if_icmpne AD
        T: 
            line 799
            aload this
            getfield zombie/iso/WorldStreamer.networkFileDebug Z
            ifeq X
        U: 
            line 800
            getstatic zombie/debug/DebugLog.NetworkFileDebug Lzombie/debug/DebugLogStream;
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            aload request
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
            line 803
            iload sameOnServer
            ifne Z
        Y: 
            line 804
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            iconst_4 
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        Z: 
            line 806
            aload this
            getfield zombie/iso/WorldStreamer.pendingRequests Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        AA: 
            line 807
            aload request
            dup 
            getfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
            bipush 16
            ior 
            putfield zombie/iso/WorldStreamer$ChunkRequest.flagsUdp I
        AB: 
            line 808
            aload this
            getfield zombie/iso/WorldStreamer.requestingLargeArea Z
            ifeq AE
        AC: 
            line 809
            aload this
            dup 
            getfield zombie/iso/WorldStreamer.largeAreaDownloads I
            iconst_1 
            iadd 
            putfield zombie/iso/WorldStreamer.largeAreaDownloads I
            goto AE
        AD: 
            line 789
            iinc i 1
            goto M
        AE: 
            line 786
            iinc n 1
            goto G
        AF: 
            line 815
            return 
        AG: 
        }
    }

    .method private compare (Lzombie/iso/WorldStreamer$ChunkRequest;Ljava/nio/ByteBuffer;Ljava/io/File;)V {
        parameters: { this, request, requestBB, file },
        code: {
        A: 
            line 819
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunkDownloaded
        B: 
            line 820
            aload chunkDownloaded
            ifnonnull D
        C: 
            line 821
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunkDownloaded
        D: 
            line 823
            aload chunkDownloaded
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            putfield zombie/iso/IsoChunk.wx I
        E: 
            line 824
            aload chunkDownloaded
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            putfield zombie/iso/IsoChunk.wy I
        F: 
            line 826
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunkOnDisk
        G: 
            line 827
            aload chunkOnDisk
            ifnonnull I
        H: 
            line 828
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunkOnDisk
        I: 
            line 830
            aload chunkOnDisk
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            putfield zombie/iso/IsoChunk.wx I
        J: 
            line 831
            aload chunkOnDisk
            aload request
            getfield zombie/iso/WorldStreamer$ChunkRequest.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            putfield zombie/iso/IsoChunk.wy I
        K: 
            line 833
            aload requestBB
            invokevirtual java/nio/ByteBuffer.position ()I
            istore position
        L: 
            line 834
            aload requestBB
            iconst_0 
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        M: 
            line 835
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
            line 836
            aload requestBB
            iload position
            invokevirtual java/nio/ByteBuffer.position (I)Ljava/nio/ByteBuffer;
            pop 
        O: 
            line 838
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            invokevirtual java/util/zip/CRC32.reset ()V
        P: 
            line 839
            aload this
            getfield zombie/iso/WorldStreamer.crc32 Ljava/util/zip/CRC32;
            aload requestBB
            invokevirtual java/nio/ByteBuffer.array ()[B
            iconst_0 
            iload position
            invokevirtual java/util/zip/CRC32.update ([BII)V
        Q: 
            line 841
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
            line 843
            aload chunkOnDisk
            invokevirtual zombie/iso/IsoChunk.LoadFromDisk ()V
        S: 
            line 845
            iload position
            aload file
            invokevirtual java/io/File.length ()J
            invokedynamic makeConcatWithConstants (IJ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "downloaded size=\u0001 on-disk size=\u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        T: 
            line 846
            aload this
            aload chunkDownloaded
            aload chunkOnDisk
            invokevirtual zombie/iso/WorldStreamer.compareChunks (Lzombie/iso/IsoChunk;Lzombie/iso/IsoChunk;)V
        U: 
            line 848
            aload chunkDownloaded
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        V: 
            line 849
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
            line 850
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunkDownloaded
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        X: 
            line 852
            aload chunkOnDisk
            invokevirtual zombie/iso/IsoChunk.resetForStore ()V
        Y: 
            line 853
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
            line 854
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            aload chunkOnDisk
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.add (Ljava/lang/Object;)Z
            pop 
        AA: 
            line 864
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
            line 868
            aload chunk1
            getfield zombie/iso/IsoChunk.wx I
            aload chunk1
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "comparing \u0001,\u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        B: 
            // try-start:   range=[B-N] handler=O:java/lang/Exception 
            line 870
            aload this
            aload chunk1
            aload chunk2
            invokevirtual zombie/iso/WorldStreamer.compareErosion (Lzombie/iso/IsoChunk;Lzombie/iso/IsoChunk;)V
        C: 
            line 871
            aload chunk1
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            aload chunk2
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            if_icmpeq E
        D: 
            line 872
            aload chunk1
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            aload chunk2
            getfield zombie/iso/IsoChunk.lootRespawnHour I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "lootRespawnHour \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        E: 
            line 874
            iconst_0 
            istore y
        F: 
            iload y
            bipush 8
            if_icmpge N
        G: 
            line 875
            iconst_0 
            istore x
        H: 
            iload x
            bipush 8
            if_icmpge M
        I: 
            line 876
            aload chunk1
            iload x
            iload y
            iconst_0 
            invokevirtual zombie/iso/IsoChunk.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq1
        J: 
            line 877
            aload chunk2
            iload x
            iload y
            iconst_0 
            invokevirtual zombie/iso/IsoChunk.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq2
        K: 
            line 878
            aload this
            aload sq1
            aload sq2
            invokevirtual zombie/iso/WorldStreamer.compareSquares (Lzombie/iso/IsoGridSquare;Lzombie/iso/IsoGridSquare;)V
        L: 
            line 875
            iinc x 1
            goto H
        M: 
            line 874
            iinc y 1
            goto F
        N: 
            // try-end:     range=[B-N] handler=O:java/lang/Exception 
            line 883
            goto Q
        O: 
            // try-handler: range=[B-N] handler=O:java/lang/Exception 
            line 881
            astore ex
        P: 
            line 882
            aload ex
            invokevirtual java/lang/Exception.printStackTrace ()V
        Q: 
            line 884
            return 
        R: 
        }
    }

    .method private compareErosion (Lzombie/iso/IsoChunk;Lzombie/iso/IsoChunk;)V {
        parameters: { this, chunk1, chunk2 },
        code: {
        A: 
            line 888
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            if_icmpeq C
        B: 
            line 889
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.init Z
            invokedynamic makeConcatWithConstants (ZZ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "init \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        C: 
            line 891
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            if_icmpeq E
        D: 
            line 892
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.eTickStamp I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "eTickStamp \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        E: 
            line 894
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            fcmpl 
            ifeq G
        F: 
            line 895
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.moisture F
            invokedynamic makeConcatWithConstants (FF)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "moisture \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        G: 
            line 897
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            fcmpl 
            ifeq I
        H: 
            line 898
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.minerals F
            invokedynamic makeConcatWithConstants (FF)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "minerals \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        I: 
            line 900
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            if_icmpeq K
        J: 
            line 901
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.epoch I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "epoch \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        K: 
            line 903
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            if_icmpeq M
        L: 
            line 904
            aload chunk1
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            aload chunk2
            invokevirtual zombie/iso/IsoChunk.getErosionData ()Lzombie/erosion/ErosionData$Chunk;
            getfield zombie/erosion/ErosionData$Chunk.soil I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "soil \u0001 != \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        M: 
            line 906
            return 
        N: 
        }
    }

    .method private compareSquares (Lzombie/iso/IsoGridSquare;Lzombie/iso/IsoGridSquare;)V {
        parameters: { this, sq1, sq2 },
        exceptions: { 
            { E, BC, BD, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 910
            aload sq1
            ifnull B
            aload sq2
            ifnonnull E
        B: 
            line 911
            aload sq1
            ifnonnull C
            aload sq2
            ifnull D
        C: 
            line 912
            ldc "one square is null, the other isn\'t"
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        D: 
            line 914
            return 
        E: 
            // try-start:   range=[E-BC] handler=BD:java/lang/Exception 
            line 917
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        F: 
            line 918
            aload sq1
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            aconst_null 
            invokevirtual zombie/iso/IsoGridSquare.save (Ljava/nio/ByteBuffer;Ljava/io/ObjectOutputStream;)V
        G: 
            line 919
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        H: 
            line 920
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        I: 
            line 921
            aload sq2
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            aconst_null 
            invokevirtual zombie/iso/IsoGridSquare.save (Ljava/nio/ByteBuffer;Ljava/io/ObjectOutputStream;)V
        J: 
            line 922
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        K: 
            line 923
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.compareTo (Ljava/nio/ByteBuffer;)I
            ifeq BC
        L: 
            line 924
            iconst_1 
            istore seasonMatch
        M: 
            line 925
            iconst_m1 
            istore j
        N: 
            line 926
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.limit ()I
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.limit ()I
            if_icmpne AA
        O: 
            line 927
            iconst_0 
            istore i
        P: 
            iload i
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.limit ()I
            if_icmpge U
        Q: 
            line 928
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            iload i
            invokevirtual java/nio/ByteBuffer.get (I)B
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            iload i
            invokevirtual java/nio/ByteBuffer.get (I)B
            if_icmpeq T
        R: 
            line 929
            iload i
            istore j
        S: 
            line 930
            goto U
        T: 
            line 927
            iinc i 1
            goto P
        U: 
            line 933
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
            line 934
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
            if_icmpeq Z
        X: 
            line 935
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
            line 936
            iconst_0 
            istore seasonMatch
        Z: 
            line 933
            iinc r 1
            goto V
        AA: 
            line 940
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
            line 942
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            aload sq2
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpne AV
        AC: 
            line 943
            iconst_0 
            istore i
        AD: 
            iload i
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpge AU
        AE: 
            line 944
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            iload i
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoObject
            astore obj1
        AF: 
            line 945
            aload sq2
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            iload i
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoObject
            astore obj2
        AG: 
            line 946
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        AH: 
            line 947
            aload obj1
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual zombie/iso/IsoObject.save (Ljava/nio/ByteBuffer;)V
        AI: 
            line 948
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        AJ: 
            line 949
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        AK: 
            line 950
            aload obj2
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual zombie/iso/IsoObject.save (Ljava/nio/ByteBuffer;)V
        AL: 
            line 951
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.flip ()Ljava/nio/ByteBuffer;
            pop 
        AM: 
            line 952
            aload this
            getfield zombie/iso/WorldStreamer.bb1 Ljava/nio/ByteBuffer;
            aload this
            getfield zombie/iso/WorldStreamer.bb2 Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.compareTo (Ljava/nio/ByteBuffer;)I
            ifeq AT
        AN: 
            line 953
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
            line 954
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
            line 943
            iinc i 1
            goto AD
        AU: 
            goto BC
        AV: 
            line 958
            iconst_0 
            istore i
        AW: 
            iload i
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpge BC
        AX: 
            line 959
            aload sq1
            invokevirtual zombie/iso/IsoGridSquare.getObjects ()Lzombie/util/list/PZArrayList;
            iload i
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoObject
            astore obj
        AY: 
            line 960
            aload obj
            invokevirtual java/lang/Object.getClass ()Ljava/lang/Class;
            invokevirtual java/lang/Class.getName ()Ljava/lang/String;
            aload obj
            invokevirtual zombie/iso/IsoObject.getName ()Ljava/lang/String;
            aload obj
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            ifnonnull AZ
            ldc "no sprite"
            goto BA
        AZ: 
            aload obj
            getfield zombie/iso/IsoObject.sprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
        BA: 
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "  \u0001 \u0001 \u0001" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        BB: 
            line 958
            iinc i 1
            goto AW
        BC: 
            // try-end:     range=[E-BC] handler=BD:java/lang/Exception 
            line 966
            goto BF
        BD: 
            // try-handler: range=[E-BC] handler=BD:java/lang/Exception 
            line 964
            astore ex
        BE: 
            line 965
            aload ex
            invokevirtual java/lang/Exception.printStackTrace ()V
        BF: 
            line 967
            return 
        BG: 
        }
    }

    .method private synthetic lambda$create$0 ()V {
        parameters: { this },
        exceptions: { 
            { B, C, D, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 449
            aload this
            getfield zombie/iso/WorldStreamer.finished Z
            ifne G
        B: 
            // try-start:   range=[B-C] handler=D:java/lang/Throwable 
            line 451
            aload this
            invokevirtual zombie/iso/WorldStreamer.threadLoop ()V
        C: 
            // try-end:     range=[B-C] handler=D:java/lang/Throwable 
            line 454
            goto A
        D: 
            // try-handler: range=[B-C] handler=D:java/lang/Throwable 
            line 452
            astore e
        E: 
            line 453
            aload e
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        F: 
            line 454
            goto A
        G: 
            line 456
            return 
        H: 
        }
    }

    .method static <clinit> ()V {
        code: {
        A: 
            line 43
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
            line 44
            new zombie/iso/WorldStreamer$ChunkComparator
            dup 
            invokespecial zombie/iso/WorldStreamer$ChunkComparator.<init> ()V
            putstatic zombie/iso/WorldStreamer.comp Lzombie/iso/WorldStreamer$ChunkComparator;
        E: 
            line 51
            new zombie/iso/WorldStreamer
            dup 
            invokespecial zombie/iso/WorldStreamer.<init> ()V
            putstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
            return 
        F: 
        }
    }

}
