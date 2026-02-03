.inner public static {
    name: ProfileArea,
    inner: zombie/GameProfiler$ProfileArea,
    outer: zombie/GameProfiler
}
.inner public static {
    name: UpdateFlags,
    inner: zombie/vehicles/BaseVehicle$UpdateFlags,
    outer: zombie/vehicles/BaseVehicle
}
.inner public static final enum {
    name: JobType,
    inner: zombie/iso/IsoChunk$JobType,
    outer: zombie/iso/IsoChunk
}
.inner public static final {
    name: RenderTiles,
    inner: zombie/debug/options/Terrain$RenderTiles,
    outer: zombie/debug/options/Terrain
}
.inner public static final {
    name: FrameState,
    inner: zombie/iso/IsoCamera$FrameState,
    outer: zombie/iso/IsoCamera
}
.inner public static final {
    name: Lookup,
    inner: java/lang/invoke/MethodHandles$Lookup,
    outer: java/lang/invoke/MethodHandles
}
.sourcefile "IsoChunkMap.java"
.visible-annotation zombie/UsedFromLua {}
.super java/lang/Object
.class public final super zombie/iso/IsoChunkMap {

    .field public static final LEVELS I {value: 64}
    .field public static final GROUND_LEVEL I {value: 32}
    .field public static final TOP_LEVEL I {value: 31}
    .field public static final BOTTOM_LEVEL I {value: -32}
    .field public static final OLD_CHUNKS_PER_WIDTH I {value: 10}
    .field public static final CHUNKS_PER_WIDTH I {value: 8}
    .field public static final CHUNK_SIZE_IN_SQUARES I {value: 8}
    .signature "Ljava/util/HashMap<Ljava/lang/Integer;Lzombie/iso/IsoChunk;>;"
    .field public static final SharedChunks Ljava/util/HashMap; 
    .field public static mpWorldXa I 
    .field public static mpWorldYa I 
    .field public static mpWorldZa I 
    .field public static worldXa I 
    .field public static worldYa I 
    .field public static worldZa I 
    .field public static final SWorldX [I 
    .field public static final SWorldY [I 
    .signature "Ljava/util/concurrent/ConcurrentLinkedQueue<Lzombie/iso/IsoChunk;>;"
    .field public static final chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue; 
    .field public static final bSettingChunk Ljava/util/concurrent/locks/ReentrantLock; 
    .field private static final START_CHUNK_GRID_WIDTH I {value: 13}
    .field public static chunkGridWidth I 
    .field public static chunkWidthInTiles I 
    .field private static dynamicChunkGridWidth I {value: -1}
    .field private static final inf Lzombie/core/textures/ColorInfo; 
    .signature "Ljava/util/ArrayList<Ljava/util/ArrayList<Lzombie/iso/IsoFloorBloodSplat;>;>;"
    .field private static final splatByType Ljava/util/ArrayList; 
    .field public playerId I 
    .field public ignore Z 
    .field public worldX I 
    .field public worldY I 
    .signature "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .field public final filenameServerRequests Ljava/util/ArrayList; 
    .field protected chunksSwapB [Lzombie/iso/IsoChunk; 
    .field protected chunksSwapA [Lzombie/iso/IsoChunk; 
    .field readBufferA Z 
    .field xMinTiles I 
    .field yMinTiles I 
    .field xMaxTiles I 
    .field yMaxTiles I 
    .field private final cell Lzombie/iso/IsoCell; 
    .field private final checkVehiclesFrequency Lzombie/core/utils/UpdateLimit; 
    .field private final hotSaveFrequency Lzombie/core/utils/UpdateLimit; 
    .field public maxHeight I 
    .field public minHeight I 
    .field public static final ppp_update Lzombie/core/profiling/PerformanceProfileProbe; 
    .field static final synthetic $assertionsDisabled Z 

    .method public <init> (Lzombie/iso/IsoCell;)V {
        parameters: { this, cell },
        code: {
        A: 
            line 87
            aload this
            invokespecial java/lang/Object.<init> ()V
        B: 
            line 64
            aload this
            getstatic zombie/iso/IsoChunkMap.worldXa I
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            putfield zombie/iso/IsoChunkMap.worldX I
        C: 
            line 65
            aload this
            getstatic zombie/iso/IsoChunkMap.worldYa I
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            putfield zombie/iso/IsoChunkMap.worldY I
        D: 
            line 66
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoChunkMap.filenameServerRequests Ljava/util/ArrayList;
        E: 
            line 69
            aload this
            iconst_1 
            putfield zombie/iso/IsoChunkMap.readBufferA Z
        F: 
            line 70
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        G: 
            line 71
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        H: 
            line 72
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        I: 
            line 73
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        J: 
            line 75
            aload this
            new zombie/core/utils/UpdateLimit
            dup 
            ldc 3000L
            invokespecial zombie/core/utils/UpdateLimit.<init> (J)V
            putfield zombie/iso/IsoChunkMap.checkVehiclesFrequency Lzombie/core/utils/UpdateLimit;
        K: 
            line 76
            aload this
            new zombie/core/utils/UpdateLimit
            dup 
            ldc 1000L
            invokespecial zombie/core/utils/UpdateLimit.<init> (J)V
            putfield zombie/iso/IsoChunkMap.hotSaveFrequency Lzombie/core/utils/UpdateLimit;
        L: 
            line 88
            aload this
            aload cell
            putfield zombie/iso/IsoChunkMap.cell Lzombie/iso/IsoCell;
        M: 
            line 89
            getstatic zombie/iso/WorldReuserThread.instance Lzombie/iso/WorldReuserThread;
            iconst_0 
            putfield zombie/iso/WorldReuserThread.finished Z
        N: 
            line 90
            aload this
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            imul 
            anewarray zombie/iso/IsoChunk
            putfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
        O: 
            line 91
            aload this
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            imul 
            anewarray zombie/iso/IsoChunk
            putfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
        P: 
            line 92
            return 
        Q: 
        }
    }

    .method public static CalcChunkWidth ()V {
        code: {
        A: 
            line 95
            getstatic zombie/iso/IsoChunkMap.dynamicChunkGridWidth I
            iconst_m1 
            if_icmpeq SKIP_DYNAMIC
        // If dynamicChunkGridWidth is set (not -1), use it
            getstatic zombie/iso/IsoChunkMap.dynamicChunkGridWidth I
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 8
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
            return 
        SKIP_DYNAMIC: 
            // Otherwise check debug options
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.worldChunkMap13x13 Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq E
        B: 
            line 96
            bipush 13
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        C: 
            line 97
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 8
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
        D: 
            line 98
            return 
        E: 
            line 100
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.worldChunkMap11x11 Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq I
        F: 
            line 101
            bipush 11
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        G: 
            line 102
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 8
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
        H: 
            line 103
            return 
        I: 
            line 105
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.worldChunkMap9x9 Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq M
        J: 
            line 106
            bipush 9
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        K: 
            line 107
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 8
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
        L: 
            line 108
            return 
        M: 
            line 110
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.worldChunkMap7x7 Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq Q
        N: 
            line 111
            bipush 7
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        O: 
            line 112
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 8
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
        P: 
            line 113
            return 
        Q: 
            line 115
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.worldChunkMap5x5 Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq U
        R: 
            line 116
            iconst_5 
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        S: 
            line 117
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 8
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
        T: 
            line 118
            return 
        U: 
            line 121
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.getScreenWidth ()I
            i2f 
            ldc 1920F
            fdiv 
            fstore delx
        V: 
            line 122
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.getScreenHeight ()I
            i2f 
            ldc 1080F
            fdiv 
            fstore dely
        W: 
            line 123
            fload delx
            fload dely
            invokestatic java/lang/Math.max (FF)F
            fstore del
        X: 
            line 124
            fload del
            fconst_1 
            fcmpl 
            ifle Z
        Y: 
            line 125
            fconst_1 
            fstore del
        Z: 
            line 127
            ldc 13F
            fload del
            fmul 
            f2d 
            ldc 1.5D
            dmul 
            d2i 
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        AA: 
            line 128
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iconst_2 
            imul 
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpne AC
        AB: 
            line 129
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            iadd 
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        AC: 
            line 132
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 19
            invokestatic zombie/core/math/PZMath.min (II)I
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        AD: 
            line 134
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            bipush 8
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
        AE: 
            line 135
            return 
        AF: 
        }
        }

        .method public static setDynamicChunkGridWidth (I)V {
            parameters: { width },
            code: {
            A: 
                iload width
                putstatic zombie/iso/IsoChunkMap.dynamicChunkGridWidth I
            B: 
                return 
            C: 
            }
        }

        .method public static getDynamicChunkGridWidth ()I {
        code: {
        A: 
           getstatic zombie/iso/IsoChunkMap.dynamicChunkGridWidth I
           ireturn 
        B: 
        }
        }

        .method public static resetDynamicChunkGridWidth ()V {
            code: {
            A: 
                iconst_m1 
                putstatic zombie/iso/IsoChunkMap.dynamicChunkGridWidth I
            B: 
                return 
            C: 
            }
        }

        .method public static setWorldStartPos (II)V {
        parameters: { x, y },
        code: {
        A: 
            line 138
            getstatic zombie/iso/IsoChunkMap.SWorldX [I
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            iload x
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            iastore 
        B: 
            line 139
            getstatic zombie/iso/IsoChunkMap.SWorldY [I
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            iload y
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            iastore 
        C: 
            line 140
            return 
        D: 
        }
    }

    .method public Dispose ()V {
        parameters: { this },
        code: {
        A: 
            line 143
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.clear ()V
        B: 
            line 144
            aload this
            aconst_null 
            putfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
        C: 
            line 145
            aload this
            aconst_null 
            putfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
        D: 
            line 146
            return 
        E: 
        }
    }

    .method public setInitialPos (II)V {
        parameters: { this, wx, wy },
        code: {
        A: 
            line 149
            aload this
            iload wx
            putfield zombie/iso/IsoChunkMap.worldX I
        B: 
            line 150
            aload this
            iload wy
            putfield zombie/iso/IsoChunkMap.worldY I
        C: 
            line 151
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        D: 
            line 152
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        E: 
            line 153
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        F: 
            line 154
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        G: 
            line 155
            return 
        H: 
        }
    }

    .method public processAllLoadGridSquare ()V {
        parameters: { this },
        exceptions: { 
            { D, M, R, * }, 
            { O, P, R, * }, 
            { R, S, R, * }
         },
        code: {
        A: 
            line 158
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        B: 
            aload chunk
            ifnull V
        C: 
            line 159
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.lock ()V
        D: 
            // try-start:   range=[D-M] handler=R:* 
            line 161
            iconst_0 
            istore loaded
        E: 
            line 162
            iconst_0 
            istore n
        F: 
            iload n
            getstatic zombie/characters/IsoPlayer.numPlayers I
            if_icmpge K
        G: 
            line 163
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iload n
            aaload 
            astore cm
        H: 
            line 164
            aload cm
            getfield zombie/iso/IsoChunkMap.ignore Z
            ifne J
            aload cm
            aload chunk
            iconst_0 
            invokevirtual zombie/iso/IsoChunkMap.setChunkDirect (Lzombie/iso/IsoChunk;Z)Z
            ifeq J
        I: 
            line 165
            iconst_1 
            istore loaded
        J: 
            line 162
            iinc n 1
            goto F
        K: 
            line 168
            iload loaded
            ifne O
        L: 
            line 169
            getstatic zombie/iso/WorldReuserThread.instance Lzombie/iso/WorldReuserThread;
            aload chunk
            invokevirtual zombie/iso/WorldReuserThread.addReuseChunk (Lzombie/iso/IsoChunk;)V
        M: 
            // try-end:     range=[D-M] handler=R:* 
            line 174
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        N: 
            line 170
            goto U
        O: 
            // try-start:   range=[O-P] handler=R:* 
            line 172
            aload chunk
            invokevirtual zombie/iso/IsoChunk.doLoadGridsquare ()V
        P: 
            // try-end:     range=[O-P] handler=R:* 
            line 174
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        Q: 
            line 175
            goto U
        R: 
            // try-handler: range=[D-M] handler=R:* 
            // try-handler: range=[O-P] handler=R:* 
            // try-start:   range=[R-S] handler=R:* 
            // try-handler: range=[R-S] handler=R:* 
            line 174
            astore v5
        S: 
            // try-end:     range=[R-S] handler=R:* 
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        T: 
            line 175
            aload v5
            athrow 
        U: 
            line 158
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
            goto B
        V: 
            line 177
            return 
        W: 
        }
    }

    .method public update ()V {
        parameters: { this },
        exceptions: { 
            { B, C, D, Ljava/lang/Throwable; }, 
            { E, F, G, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 182
            getstatic zombie/iso/IsoChunkMap.ppp_update Lzombie/core/profiling/PerformanceProfileProbe;
            invokevirtual zombie/core/profiling/PerformanceProfileProbe.profile ()Lzombie/core/profiling/AbstractPerformanceProfileProbe;
            astore ignored
        B: 
            // try-start:   range=[B-C] handler=D:java/lang/Throwable 
            line 183
            aload this
            invokevirtual zombie/iso/IsoChunkMap.updateInternal ()V
        C: 
            // try-end:     range=[B-C] handler=D:java/lang/Throwable 
            line 184
            aload ignored
            ifnull I
            aload ignored
            invokevirtual zombie/core/profiling/AbstractPerformanceProfileProbe.close ()V
            goto I
        D: 
            // try-handler: range=[B-C] handler=D:java/lang/Throwable 
            line 182
            astore v2
            aload ignored
            ifnull H
        E: 
            // try-start:   range=[E-F] handler=G:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/core/profiling/AbstractPerformanceProfileProbe.close ()V
        F: 
            // try-end:     range=[E-F] handler=G:java/lang/Throwable 
            goto H
        G: 
            // try-handler: range=[E-F] handler=G:java/lang/Throwable 
            astore v3
            aload v2
            aload v3
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        H: 
            aload v2
            athrow 
        I: 
            line 185
            return 
        J: 
        }
    }

    .method private updateInternal ()V {
        parameters: { this },
        exceptions: { 
            { V, X, Y, Ljava/lang/Throwable; }, 
            { Z, AA, AB, Ljava/lang/Throwable; }, 
            { U, AK, AM, * }, 
            { AM, AN, AM, * }
         },
        code: {
        A: 
            line 189
            iconst_0 
            istore bChanged
        B: 
            line 190
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.size ()I
            istore count
        C: 
            line 191
            iload count
            ifeq E
        D: 
            line 192
            iconst_1 
            iload count
            iconst_3 
            imul 
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            idiv 
            iadd 
            istore count
        E: 
            line 194
            iload count
            ifle AW
        F: 
            line 195
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        G: 
            line 197
            aload chunk
            ifnull AV
        H: 
            line 198
            iconst_0 
            istore loaded
        I: 
            line 199
            iconst_0 
            istore n
        J: 
            iload n
            getstatic zombie/characters/IsoPlayer.numPlayers I
            if_icmpge O
        K: 
            line 200
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iload n
            aaload 
            astore cm
        L: 
            line 201
            aload cm
            getfield zombie/iso/IsoChunkMap.ignore Z
            ifne N
            aload cm
            aload chunk
            iconst_0 
            invokevirtual zombie/iso/IsoChunkMap.setChunkDirect (Lzombie/iso/IsoChunk;Z)Z
            ifeq N
        M: 
            line 202
            iconst_1 
            istore loaded
        N: 
            line 199
            iinc n 1
            goto J
        O: 
            line 205
            iload loaded
            ifne S
        P: 
            line 206
            getstatic zombie/iso/WorldReuserThread.instance Lzombie/iso/WorldReuserThread;
            aload chunk
            invokevirtual zombie/iso/WorldReuserThread.addReuseChunk (Lzombie/iso/IsoChunk;)V
        Q: 
            line 207
            iinc count -1
        R: 
            line 208
            goto E
        S: 
            line 210
            aload chunk
            iconst_1 
            putfield zombie/iso/IsoChunk.loaded Z
        T: 
            line 212
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.lock ()V
        U: 
            // try-start:   range=[U-AK] handler=AM:* 
            line 215
            invokestatic zombie/GameProfiler.getInstance ()Lzombie/GameProfiler;
            ldc "IsoChunk.doLoadGridsquare"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        V: 
            // try-start:   range=[V-X] handler=Y:java/lang/Throwable 
            line 216
            aload chunk
            invokevirtual zombie/iso/IsoChunk.doLoadGridsquare ()V
        W: 
            line 217
            iconst_1 
            istore bChanged
        X: 
            // try-end:     range=[V-X] handler=Y:java/lang/Throwable 
            line 218
            aload ignored
            ifnull AD
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto AD
        Y: 
            // try-handler: range=[V-X] handler=Y:java/lang/Throwable 
            line 215
            astore v6
            aload ignored
            ifnull AC
        Z: 
            // try-start:   range=[Z-AA] handler=AB:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        AA: 
            // try-end:     range=[Z-AA] handler=AB:java/lang/Throwable 
            goto AC
        AB: 
            // try-handler: range=[Z-AA] handler=AB:java/lang/Throwable 
            astore v7
            aload v6
            aload v7
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AC: 
            aload v6
            athrow 
        AD: 
            line 220
            getstatic zombie/network/GameClient.client Z
            ifeq AK
        AE: 
            line 221
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokestatic zombie/vehicles/VehicleCache.vehicleGet (II)Ljava/util/List;
            astore vehicles
        AF: 
            line 222
            aload vehicles
            ifnull AK
        AG: 
            line 223
            aload vehicles
            invokeinterface java/util/List.iterator ()Ljava/util/Iterator;
            astore v6
        AH: 
            aload v6
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq AK
            aload v6
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/vehicles/VehicleCache
            astore vehicle
        AI: 
            line 224
            getstatic zombie/vehicles/VehicleManager.instance Lzombie/vehicles/VehicleManager;
            aload vehicle
            getfield zombie/vehicles/VehicleCache.id S
            iconst_1 
            invokevirtual zombie/vehicles/VehicleManager.sendVehicleRequest (SS)V
        AJ: 
            line 225
            goto AH
        AK: 
            // try-end:     range=[U-AK] handler=AM:* 
            line 229
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        AL: 
            line 230
            goto AP
        AM: 
            // try-handler: range=[U-AK] handler=AM:* 
            // try-start:   range=[AM-AN] handler=AM:* 
            // try-handler: range=[AM-AN] handler=AM:* 
            line 229
            astore v8
        AN: 
            // try-end:     range=[AM-AN] handler=AM:* 
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        AO: 
            line 230
            aload v8
            athrow 
        AP: 
            line 233
            iconst_0 
            istore i
        AQ: 
            iload i
            getstatic zombie/characters/IsoPlayer.numPlayers I
            if_icmpge AV
        AR: 
            line 234
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iload i
            aaload 
            astore player
        AS: 
            line 235
            aload player
            ifnull AU
        AT: 
            line 236
            aload player
            ldc 20F
            putfield zombie/characters/IsoPlayer.dirtyRecalcGridStackTime F
        AU: 
            line 233
            iinc i 1
            goto AQ
        AV: 
            line 240
            iinc count -1
            goto E
        AW: 
            line 243
            iload bChanged
            ifeq AY
        AX: 
            line 244
            aload this
            invokevirtual zombie/iso/IsoChunkMap.calculateZExtentsForChunkMap ()V
        AY: 
            line 247
            aload this
            getfield zombie/iso/IsoChunkMap.hotSaveFrequency Lzombie/core/utils/UpdateLimit;
            invokevirtual zombie/core/utils/UpdateLimit.Check ()Z
            ifeq BM
        AZ: 
            line 248
            iconst_0 
            istore y
        BA: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge BM
        BB: 
            line 249
            iconst_0 
            istore x
        BC: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge BL
        BD: 
            line 250
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore chunk
        BE: 
            line 251
            aload chunk
            ifnull BK
        BF: 
            line 252
            aload chunk
            invokevirtual zombie/iso/IsoChunk.update ()V
        BG: 
            line 254
            getstatic zombie/network/GameClient.client Z
            ifne BK
            getstatic zombie/network/GameServer.server Z
            ifne BK
            aload chunk
            getfield zombie/iso/IsoChunk.requiresHotSave Z
            ifeq BK
        BH: 
            line 255
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            getfield zombie/iso/ChunkSaveWorker.toSaveQueue Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.size ()I
            bipush 10
            if_icmpge BK
        BI: 
            line 256
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload chunk
            invokevirtual zombie/iso/ChunkSaveWorker.AddHotSave (Lzombie/iso/IsoChunk;)V
        BJ: 
            line 257
            aload chunk
            iconst_0 
            putfield zombie/iso/IsoChunk.requiresHotSave Z
        BK: 
            line 249
            iinc x 1
            goto BC
        BL: 
            line 248
            iinc y 1
            goto BA
        BM: 
            line 265
            aload this
            getfield zombie/iso/IsoChunkMap.checkVehiclesFrequency Lzombie/core/utils/UpdateLimit;
            invokevirtual zombie/core/utils/UpdateLimit.Check ()Z
            ifeq BP
        BN: 
            line 266
            getstatic zombie/network/GameClient.client Z
            ifeq BP
        BO: 
            line 267
            aload this
            invokevirtual zombie/iso/IsoChunkMap.checkVehicles ()V
        BP: 
            line 270
            return 
        BQ: 
        }
    }

    .method private checkVehicles ()V {
        parameters: { this },
        code: {
        A: 
            line 273
            iconst_0 
            istore y
        B: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge X
        C: 
            line 274
            iconst_0 
            istore x
        D: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge W
        E: 
            line 275
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore chunk
        F: 
            line 276
            aload chunk
            ifnull V
            aload chunk
            getfield zombie/iso/IsoChunk.loaded Z
            ifeq V
        G: 
            line 277
            aload chunk
            getfield zombie/iso/IsoChunk.wx I
            aload chunk
            getfield zombie/iso/IsoChunk.wy I
            invokestatic zombie/vehicles/VehicleCache.vehicleGet (II)Ljava/util/List;
            astore vehicles
        H: 
            line 278
            aload vehicles
            ifnull V
            aload chunk
            getfield zombie/iso/IsoChunk.vehicles Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            aload vehicles
            invokeinterface java/util/List.size ()I
            if_icmpeq V
        I: 
            line 279
            iconst_0 
            istore i
        J: 
            iload i
            aload vehicles
            invokeinterface java/util/List.size ()I
            if_icmpge V
        K: 
            line 280
            aload vehicles
            iload i
            invokeinterface java/util/List.get (I)Ljava/lang/Object;
            checkcast zombie/vehicles/VehicleCache
            getfield zombie/vehicles/VehicleCache.id S
            istore id
        L: 
            line 281
            iconst_0 
            istore hasID
        M: 
            line 282
            iconst_0 
            istore k
        N: 
            iload k
            aload chunk
            getfield zombie/iso/IsoChunk.vehicles Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge S
        O: 
            line 283
            aload chunk
            getfield zombie/iso/IsoChunk.vehicles Ljava/util/ArrayList;
            iload k
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/vehicles/BaseVehicle
            invokevirtual zombie/vehicles/BaseVehicle.getId ()S
            iload id
            if_icmpne R
        P: 
            line 284
            iconst_1 
            istore hasID
        Q: 
            line 285
            goto S
        R: 
            line 282
            iinc k 1
            goto N
        S: 
            line 288
            iload hasID
            ifne U
            getstatic zombie/vehicles/VehicleManager.instance Lzombie/vehicles/VehicleManager;
            iload id
            invokevirtual zombie/vehicles/VehicleManager.getVehicleByID (S)Lzombie/vehicles/BaseVehicle;
            ifnonnull U
        T: 
            line 289
            getstatic zombie/vehicles/VehicleManager.instance Lzombie/vehicles/VehicleManager;
            iload id
            iconst_1 
            invokevirtual zombie/vehicles/VehicleManager.sendVehicleRequest (SS)V
        U: 
            line 279
            iinc i 1
            goto J
        V: 
            line 274
            iinc x 1
            goto D
        W: 
            line 273
            iinc y 1
            goto B
        X: 
            line 296
            return 
        Y: 
        }
    }

    .method public checkIntegrity ()V {
        parameters: { this },
        exceptions: { 
            { Q, R, S, Ljava/lang/InterruptedException; }
         },
        code: {
        A: 
            line 299
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        B: 
            line 301
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMinTiles ()I
            istore x
        C: 
            iload x
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMaxTiles ()I
            if_icmpge X
        D: 
            line 302
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMinTiles ()I
            istore y
        E: 
            iload y
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMaxTiles ()I
            if_icmpge W
        F: 
            line 303
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            iload x
            iload y
            iconst_0 
            invokevirtual zombie/iso/IsoCell.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore grid
        G: 
            line 305
            aload grid
            ifnull V
            aload grid
            invokevirtual zombie/iso/IsoGridSquare.getX ()I
            iload x
            if_icmpne H
            aload grid
            invokevirtual zombie/iso/IsoGridSquare.getY ()I
            iload y
            if_icmpeq V
        H: 
            line 306
            iload x
            bipush 8
            idiv 
            istore cx
        I: 
            line 307
            iload y
            bipush 8
            idiv 
            istore cy
        J: 
            line 308
            iload cx
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMin ()I
            isub 
            istore cx
        K: 
            line 309
            iload cy
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMin ()I
            isub 
            istore cy
        L: 
            line 310
            aconst_null 
            astore ch
        M: 
            line 312
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore ch
        N: 
            line 313
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        O: 
            line 315
            getstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
            aload ch
            iload x
            bipush 8
            idiv 
            iload y
            bipush 8
            idiv 
            iconst_0 
            invokevirtual zombie/iso/WorldStreamer.addJob (Lzombie/iso/IsoChunk;IIZ)V
        P: 
            line 317
            aload ch
            getfield zombie/iso/IsoChunk.loaded Z
            ifne V
        Q: 
            // try-start:   range=[Q-R] handler=S:java/lang/InterruptedException 
            line 319
            ldc 13L
            invokestatic java/lang/Thread.sleep (J)V
        R: 
            // try-end:     range=[Q-R] handler=S:java/lang/InterruptedException 
            line 322
            goto P
        S: 
            // try-handler: range=[Q-R] handler=S:java/lang/InterruptedException 
            line 320
            astore e
        T: 
            line 321
            aload e
            invokevirtual java/lang/InterruptedException.printStackTrace ()V
        U: 
            line 322
            goto P
        V: 
            line 302
            iinc y 1
            goto E
        W: 
            line 301
            iinc x 1
            goto C
        X: 
            line 327
            return 
        Y: 
        }
    }

    .method public checkIntegrityThread ()V {
        parameters: { this },
        code: {
        A: 
            line 330
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        B: 
            line 331
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMinTiles ()I
            istore x
        C: 
            iload x
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMaxTiles ()I
            if_icmpge R
        D: 
            line 332
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMinTiles ()I
            istore y
        E: 
            iload y
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMaxTiles ()I
            if_icmpge Q
        F: 
            line 333
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            iload x
            iload y
            iconst_0 
            invokevirtual zombie/iso/IsoCell.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore grid
        G: 
            line 335
            aload grid
            ifnull O
            aload grid
            invokevirtual zombie/iso/IsoGridSquare.getX ()I
            iload x
            if_icmpne H
            aload grid
            invokevirtual zombie/iso/IsoGridSquare.getY ()I
            iload y
            if_icmpeq O
        H: 
            line 336
            iload x
            bipush 8
            idiv 
            istore cx
        I: 
            line 337
            iload y
            bipush 8
            idiv 
            istore cy
        J: 
            line 338
            iload cx
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMin ()I
            isub 
            istore cx
        K: 
            line 339
            iload cy
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMin ()I
            isub 
            istore cy
        L: 
            line 340
            new zombie/iso/IsoChunk
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore ch
        M: 
            line 341
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        N: 
            line 342
            getstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
            aload ch
            iload x
            iload y
            iload x
            bipush 8
            idiv 
            iload y
            bipush 8
            idiv 
            invokevirtual zombie/iso/WorldStreamer.addJobInstant (Lzombie/iso/IsoChunk;IIII)V
        O: 
            line 344
            aload grid
            ifnull P
        P: 
            line 332
            iinc y 1
            goto E
        Q: 
            line 331
            iinc x 1
            goto C
        R: 
            line 348
            return 
        S: 
        }
    }

    .method public LoadChunk (IIII)V {
        parameters: { this, wx, wy, x, y },
        code: {
        A: 
            line 351
            aconst_null 
            astore chunk
        B: 
            line 352
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.containsKey (Ljava/lang/Object;)Z
            ifeq G
        C: 
            line 353
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        D: 
            line 354
            aload chunk
            invokevirtual zombie/iso/IsoChunk.setCache ()V
        E: 
            line 355
            aload this
            iload x
            iload y
            aload chunk
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        F: 
            line 356
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
            goto N
        G: 
            line 358
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        H: 
            line 359
            aload chunk
            ifnonnull J
        I: 
            line 360
            new zombie/iso/IsoChunk
            dup 
            aload this
            getfield zombie/iso/IsoChunkMap.cell Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunk
        J: 
            line 362
            aload chunk
            invokevirtual zombie/iso/IsoChunk.assignLoadID ()V
        K: 
            line 363
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            aload chunk
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        L: 
            line 364
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        M: 
            line 365
            getstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
            aload chunk
            iload wx
            iload wy
            iconst_0 
            invokevirtual zombie/iso/WorldStreamer.addJob (Lzombie/iso/IsoChunk;IIZ)V
        N: 
            line 367
            return 
        O: 
        }
    }

    .method public LoadChunkForLater (IIII)Lzombie/iso/IsoChunk; {
        parameters: { this, wx, wy, x, y },
        code: {
        A: 
            line 370
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getMetaGrid ()Lzombie/iso/IsoMetaGrid;
            iload wx
            iload wy
            invokevirtual zombie/iso/IsoMetaGrid.isValidChunk (II)Z
            ifne C
        B: 
            line 371
            aconst_null 
            areturn 
        C: 
            line 374
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.containsKey (Ljava/lang/Object;)Z
            ifeq K
        D: 
            line 375
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        E: 
            line 376
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne H
        F: 
            line 377
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        G: 
            line 378
            aload chunk
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/iso/IsoChunk.checkLightingLater_OnePlayer_AllLevels (I)V
        H: 
            line 380
            aload chunk
            getfield zombie/iso/IsoChunk.loaded Z
            ifne J
        I: 
            line 381
            aload chunk
            areturn 
        J: 
            line 383
            aload this
            iload x
            iload y
            aload chunk
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
            goto R
        K: 
            line 385
            getstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/concurrent/ConcurrentLinkedQueue.poll ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        L: 
            line 386
            aload chunk
            ifnonnull N
        M: 
            line 387
            new zombie/iso/IsoChunk
            dup 
            aload this
            getfield zombie/iso/IsoChunkMap.cell Lzombie/iso/IsoCell;
            invokespecial zombie/iso/IsoChunk.<init> (Lzombie/iso/IsoCell;)V
            astore chunk
        N: 
            line 389
            aload chunk
            invokevirtual zombie/iso/IsoChunk.assignLoadID ()V
        O: 
            line 390
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            aload chunk
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        P: 
            line 391
            aload chunk
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        Q: 
            line 392
            getstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
            aload chunk
            iload wx
            iload wy
            iconst_1 
            invokevirtual zombie/iso/WorldStreamer.addJob (Lzombie/iso/IsoChunk;IIZ)V
        R: 
            line 394
            aload chunk
            areturn 
        S: 
        }
    }

    .method public getChunkForGridSquare (II)Lzombie/iso/IsoChunk; {
        parameters: { this, worldSquareX, worldSquareY },
        code: {
        A: 
            line 398
            aload this
            iload worldSquareX
            invokevirtual zombie/iso/IsoChunkMap.worldSquareToChunkMapSquareX (I)I
            istore chunkMapSquareX
        B: 
            line 399
            aload this
            iload worldSquareY
            invokevirtual zombie/iso/IsoChunkMap.worldSquareToChunkMapSquareY (I)I
            istore chunkMapSquareY
        C: 
            line 400
            aload this
            iload chunkMapSquareX
            invokevirtual zombie/iso/IsoChunkMap.isChunkMapSquareOutOfRangeXY (I)Z
            ifne D
            aload this
            iload chunkMapSquareY
            invokevirtual zombie/iso/IsoChunkMap.isChunkMapSquareOutOfRangeXY (I)Z
            ifeq E
        D: 
            line 401
            aconst_null 
            areturn 
        E: 
            line 404
            iload chunkMapSquareX
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkX
        F: 
            line 405
            iload chunkMapSquareY
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkY
        G: 
            line 406
            aload this
            iload chunkMapChunkX
            iload chunkMapChunkY
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            areturn 
        H: 
        }
    }

    .method public getChunkCurrent (II)Lzombie/iso/IsoChunk; {
        parameters: { this, x, y },
        code: {
        A: 
            line 410
            iload x
            iflt B
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge B
            iload y
            iflt B
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmplt C
        B: 
            line 411
            aconst_null 
            areturn 
        C: 
            line 414
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifne E
        D: 
            line 415
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload y
            imul 
            iload x
            iadd 
            aaload 
            areturn 
        E: 
            line 418
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload y
            imul 
            iload x
            iadd 
            aaload 
            areturn 
        F: 
        }
    }

    .method public setGridSquare (Lzombie/iso/IsoGridSquare;III)V {
        parameters: { this, square, worldSquareX, worldSquareY, worldSquareZ },
        code: {
        A: 
            line 422
            getstatic zombie/iso/IsoChunkMap.$assertionsDisabled Z
            ifne C
            aload square
            ifnull C
            aload square
            getfield zombie/iso/IsoGridSquare.x I
            iload worldSquareX
            if_icmpne B
            aload square
            getfield zombie/iso/IsoGridSquare.y I
            iload worldSquareY
            if_icmpne B
            aload square
            getfield zombie/iso/IsoGridSquare.z I
            iload worldSquareZ
            if_icmpeq C
        B: 
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        C: 
            line 424
            aload this
            iload worldSquareX
            invokevirtual zombie/iso/IsoChunkMap.worldSquareToChunkMapSquareX (I)I
            istore chunkMapSquareX
        D: 
            line 425
            aload this
            iload worldSquareY
            invokevirtual zombie/iso/IsoChunkMap.worldSquareToChunkMapSquareY (I)I
            istore chunkMapSquareY
        E: 
            line 427
            getstatic zombie/network/GameServer.server Z
            ifne G
            aload this
            iload chunkMapSquareX
            invokevirtual zombie/iso/IsoChunkMap.isChunkMapSquareOutOfRangeXY (I)Z
            ifne F
            aload this
            iload chunkMapSquareY
            invokevirtual zombie/iso/IsoChunkMap.isChunkMapSquareOutOfRangeXY (I)Z
            ifne F
            aload this
            iload worldSquareZ
            invokevirtual zombie/iso/IsoChunkMap.isWorldSquareOutOfRangeZ (I)Z
            ifeq G
        F: 
            line 428
            return 
        G: 
            line 433
            getstatic zombie/network/GameServer.server Z
            ifeq L
        H: 
            line 434
            iload worldSquareX
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkX
        I: 
            line 435
            iload worldSquareY
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkY
        J: 
            line 436
            getstatic zombie/network/ServerMap.instance Lzombie/network/ServerMap;
            iload chunkMapChunkX
            iload chunkMapChunkY
            invokevirtual zombie/network/ServerMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore c
        K: 
            line 437
            goto O
        L: 
            line 438
            iload chunkMapSquareX
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkX
        M: 
            line 439
            iload chunkMapSquareY
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkY
        N: 
            line 440
            aload this
            iload chunkMapChunkX
            iload chunkMapChunkY
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore c
        O: 
            line 443
            aload c
            ifnonnull Q
        P: 
            line 444
            return 
        Q: 
            line 447
            aload c
            aload this
            iload chunkMapSquareX
            invokevirtual zombie/iso/IsoChunkMap.chunkMapSquareToChunkSquareXY (I)I
            aload this
            iload chunkMapSquareY
            invokevirtual zombie/iso/IsoChunkMap.chunkMapSquareToChunkSquareXY (I)I
            iload worldSquareZ
            aload square
            invokevirtual zombie/iso/IsoChunk.setSquare (IIILzombie/iso/IsoGridSquare;)V
        R: 
            line 448
            return 
        S: 
        }
    }

    .method public getGridSquare (III)Lzombie/iso/IsoGridSquare; {
        parameters: { this, worldSquareX, worldSquareY, worldSquareZ },
        code: {
        A: 
            line 451
            aload this
            iload worldSquareX
            invokevirtual zombie/iso/IsoChunkMap.worldSquareToChunkMapSquareX (I)I
            istore chunkMapSquareX
        B: 
            line 452
            aload this
            iload worldSquareY
            invokevirtual zombie/iso/IsoChunkMap.worldSquareToChunkMapSquareY (I)I
            istore chunkMapSquareY
        C: 
            line 454
            aload this
            iload chunkMapSquareX
            iload chunkMapSquareY
            iload worldSquareZ
            invokevirtual zombie/iso/IsoChunkMap.getGridSquareDirect (III)Lzombie/iso/IsoGridSquare;
            areturn 
        D: 
        }
    }

    .method public getGridSquareDirect (III)Lzombie/iso/IsoGridSquare; {
        parameters: { this, chunkMapSquareX, chunkMapSquareY, worldSquareZ },
        code: {
        A: 
            line 458
            aload this
            iload chunkMapSquareX
            invokevirtual zombie/iso/IsoChunkMap.isChunkMapSquareOutOfRangeXY (I)Z
            ifne B
            aload this
            iload chunkMapSquareY
            invokevirtual zombie/iso/IsoChunkMap.isChunkMapSquareOutOfRangeXY (I)Z
            ifne B
            aload this
            iload worldSquareZ
            invokevirtual zombie/iso/IsoChunkMap.isWorldSquareOutOfRangeZ (I)Z
            ifeq C
        B: 
            line 459
            aconst_null 
            areturn 
        C: 
            line 462
            iload chunkMapSquareX
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkX
        D: 
            line 463
            iload chunkMapSquareY
            invokestatic zombie/iso/IsoChunkMap.chunkMapSquareToChunkMapChunkXY (I)I
            istore chunkMapChunkY
        E: 
            line 464
            aload this
            iload chunkMapChunkX
            iload chunkMapChunkY
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore c
        F: 
            line 465
            aload c
            ifnonnull H
        G: 
            line 466
            aconst_null 
            areturn 
        H: 
            line 468
            aload c
            getfield zombie/iso/IsoChunk.loaded Z
            ifne J
        I: 
            line 469
            aconst_null 
            areturn 
        J: 
            line 472
            aload this
            iload chunkMapSquareX
            invokevirtual zombie/iso/IsoChunkMap.chunkMapSquareToChunkSquareXY (I)I
            istore chunkSquareX
        K: 
            line 473
            aload this
            iload chunkMapSquareY
            invokevirtual zombie/iso/IsoChunkMap.chunkMapSquareToChunkSquareXY (I)I
            istore chunkSquareY
        L: 
            line 474
            aload c
            iload chunkSquareX
            iload chunkSquareY
            iload worldSquareZ
            invokevirtual zombie/iso/IsoChunk.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            areturn 
        M: 
        }
    }

    .method private chunkMapSquareToChunkSquareXY (I)I {
        parameters: { this, chunkMapSquareXY },
        code: {
        A: 
            line 478
            iload chunkMapSquareXY
            bipush 8
            irem 
            ireturn 
        B: 
        }
    }

    .method private static chunkMapSquareToChunkMapChunkXY (I)I {
        parameters: { chunkMapSquareXY },
        code: {
        A: 
            line 482
            iload chunkMapSquareXY
            bipush 8
            idiv 
            ireturn 
        B: 
        }
    }

    .method private isChunkMapSquareOutOfRangeXY (I)Z {
        parameters: { this, chunkMapSquareXY },
        code: {
        A: 
            line 486
            iload chunkMapSquareXY
            iflt B
            iload chunkMapSquareXY
            aload this
            invokevirtual zombie/iso/IsoChunkMap.getWidthInTiles ()I
            if_icmplt C
        B: 
            iconst_1 
            goto D
        C: 
            iconst_0 
        D: 
            ireturn 
        E: 
        }
    }

    .method private isWorldSquareOutOfRangeZ (I)Z {
        parameters: { this, tileZ },
        code: {
        A: 
            line 490
            iload tileZ
            bipush -32
            if_icmplt B
            iload tileZ
            bipush 31
            if_icmple C
        B: 
            iconst_1 
            goto D
        C: 
            iconst_0 
        D: 
            ireturn 
        E: 
        }
    }

    .method private worldSquareToChunkMapSquareX (I)I {
        parameters: { this, worldSquareX },
        code: {
        A: 
            line 494
            iload worldSquareX
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            bipush 8
            imul 
            isub 
            ireturn 
        B: 
        }
    }

    .method private worldSquareToChunkMapSquareY (I)I {
        parameters: { this, worldSquareY },
        code: {
        A: 
            line 498
            iload worldSquareY
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            bipush 8
            imul 
            isub 
            ireturn 
        B: 
        }
    }

    .method public getChunk (II)Lzombie/iso/IsoChunk; {
        parameters: { this, chunkMapChunkX, chunkMapChunkY },
        code: {
        A: 
            line 502
            iload chunkMapChunkX
            iflt B
            iload chunkMapChunkX
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge B
            iload chunkMapChunkY
            iflt B
            iload chunkMapChunkY
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmplt C
        B: 
            line 503
            aconst_null 
            areturn 
        C: 
            line 506
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifeq E
        D: 
            line 507
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload chunkMapChunkY
            imul 
            iload chunkMapChunkX
            iadd 
            aaload 
            areturn 
        E: 
            line 510
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload chunkMapChunkY
            imul 
            iload chunkMapChunkX
            iadd 
            aaload 
            areturn 
        F: 
        }
    }

    .method public getChunks ()[Lzombie/iso/IsoChunk; {
        parameters: { this },
        code: {
        A: 
            line 514
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifeq B
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            goto C
        B: 
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
        C: 
            areturn 
        D: 
        }
    }

    .method private setChunk (IILzombie/iso/IsoChunk;)V {
        parameters: { this, x, y, c },
        code: {
        A: 
            line 518
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifne C
        B: 
            line 519
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload y
            imul 
            iload x
            iadd 
            aload c
            aastore 
            goto D
        C: 
            line 521
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload y
            imul 
            iload x
            iadd 
            aload c
            aastore 
        D: 
            line 523
            return 
        E: 
        }
    }

    .method public setChunkDirect (Lzombie/iso/IsoChunk;Z)Z {
        parameters: { this, c, bRequireLock },
        exceptions: { 
            { T, AE, AG, * }, 
            { AG, AH, AG, * }
         },
        code: {
        A: 
            line 526
            invokestatic java/lang/System.nanoTime ()J
            lstore start
        B: 
            line 527
            iload bRequireLock
            ifeq D
        C: 
            line 528
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.lock ()V
        D: 
            line 530
            invokestatic java/lang/System.nanoTime ()J
            lstore start2
        E: 
            line 532
            aload c
            getfield zombie/iso/IsoChunk.wx I
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            isub 
            istore x
        F: 
            line 533
            aload c
            getfield zombie/iso/IsoChunk.wy I
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            isub 
            istore y
        G: 
            line 534
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            istore x
        H: 
            line 535
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            istore y
        I: 
            line 536
            aload c
            getfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
            getstatic zombie/iso/IsoChunk$JobType.Convert Lzombie/iso/IsoChunk$JobType;
            if_acmpne L
        J: 
            line 537
            iconst_0 
            istore x
        K: 
            line 538
            iconst_0 
            istore y
        L: 
            line 540
            aload c
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne M
            iload x
            iflt M
            iload y
            iflt M
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge M
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmplt T
        M: 
            line 542
            aload c
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq Q
        N: 
            line 543
            aload c
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        O: 
            line 544
            aload c
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq Q
        P: 
            line 545
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload c
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload c
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        Q: 
            line 549
            iload bRequireLock
            ifeq S
        R: 
            line 550
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        S: 
            line 552
            iconst_0 
            ireturn 
        T: 
            // try-start:   range=[T-AE] handler=AG:* 
            line 556
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifeq V
        U: 
            line 557
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload y
            imul 
            iload x
            iadd 
            aload c
            aastore 
            goto W
        V: 
            line 559
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iload y
            imul 
            iload x
            iadd 
            aload c
            aastore 
        W: 
            line 562
            aload c
            iconst_1 
            putfield zombie/iso/IsoChunk.loaded Z
        X: 
            line 564
            aload c
            getfield zombie/iso/IsoChunk.jobType Lzombie/iso/IsoChunk$JobType;
            getstatic zombie/iso/IsoChunk$JobType.None Lzombie/iso/IsoChunk$JobType;
            if_acmpne AA
        Y: 
            line 565
            aload c
            invokevirtual zombie/iso/IsoChunk.setCache ()V
        Z: 
            line 566
            aload c
            invokevirtual zombie/iso/IsoChunk.updateBuildings ()V
        AA: 
            line 569
            invokestatic java/lang/System.nanoTime ()J
            lload start2
            lsub 
            l2d 
            ldc 1000000D
            ddiv 
            dstore duration1
        AB: 
            line 570
            invokestatic java/lang/System.nanoTime ()J
            lload start
            lsub 
            l2d 
            ldc 1000000D
            ddiv 
            dstore duration2
        AC: 
            line 571
            getstatic zombie/iso/LightingThread.debugLockTime Z
            ifeq AE
            dload duration2
            ldc 10D
            dcmpl 
            ifle AE
        AD: 
            line 572
            dload duration1
            dload duration2
            invokedynamic makeConcatWithConstants (DD)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "setChunkDirect time \u0001/\u0001 ms" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        AE: 
            // try-end:     range=[T-AE] handler=AG:* 
            line 575
            iload bRequireLock
            ifeq AK
        AF: 
            line 576
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
            goto AK
        AG: 
            // try-handler: range=[T-AE] handler=AG:* 
            // try-start:   range=[AG-AH] handler=AG:* 
            // try-handler: range=[AG-AH] handler=AG:* 
            line 575
            astore v13
        AH: 
            // try-end:     range=[AG-AH] handler=AG:* 
            iload bRequireLock
            ifeq AJ
        AI: 
            line 576
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        AJ: 
            line 578
            aload v13
            athrow 
        AK: 
            line 579
            iconst_1 
            ireturn 
        AL: 
        }
    }

    .method public drawDebugChunkMap ()V {
        parameters: { this },
        code: {
        A: 
            line 583
            bipush 64
            istore x
        B: 
            line 584
            iconst_0 
            istore y
        C: 
            line 585
            iconst_0 
            istore n
        D: 
            iload n
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge R
        E: 
            line 586
            iconst_0 
            istore y
        F: 
            line 587
            iconst_0 
            istore m
        G: 
            iload m
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge P
        H: 
            line 588
            iinc y 64
        I: 
            line 589
            aload this
            iload n
            iload m
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore ch
        J: 
            line 590
            aload ch
            ifnonnull L
        K: 
            line 591
            goto O
        L: 
            line 593
            aload ch
            iconst_0 
            iconst_0 
            iconst_0 
            invokevirtual zombie/iso/IsoChunk.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore gr
        M: 
            line 594
            aload gr
            ifnonnull O
        N: 
            line 595
            getstatic zombie/ui/TextManager.instance Lzombie/ui/TextManager;
            iload x
            i2d 
            iload y
            i2d 
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            invokedynamic makeConcatWithConstants (II)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "wx:\u0001 wy:\u0001" }
            invokevirtual zombie/ui/TextManager.DrawString (DDLjava/lang/String;)V
        O: 
            line 587
            iinc m 1
            goto G
        P: 
            line 598
            iinc x 128
        Q: 
            line 585
            iinc n 1
            goto D
        R: 
            line 600
            return 
        S: 
        }
    }

    .method private LoadLeft ()V {
        parameters: { this },
        code: {
        A: 
            line 603
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        B: 
            line 604
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        C: 
            line 605
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        D: 
            line 606
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        E: 
            line 608
            aload this
            invokevirtual zombie/iso/IsoChunkMap.Left ()V
        F: 
            line 609
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/core/physics/WorldSimulation.scrollGroundLeft (I)V
        G: 
            line 611
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        H: 
            line 612
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        I: 
            line 613
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        J: 
            line 614
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        K: 
            line 617
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            ineg 
            istore y
        L: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            if_icmpgt O
        M: 
            line 618
            aload this
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            iload y
            iadd 
            iconst_0 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            invokevirtual zombie/iso/IsoChunkMap.LoadChunkForLater (IIII)Lzombie/iso/IsoChunk;
            pop 
        N: 
            line 617
            iinc y 1
            goto L
        O: 
            line 620
            aload this
            invokevirtual zombie/iso/IsoChunkMap.SwapChunkBuffers ()V
        P: 
            line 622
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        Q: 
            line 623
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        R: 
            line 624
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        S: 
            line 625
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        T: 
            line 627
            aload this
            invokevirtual zombie/iso/IsoChunkMap.UpdateCellCache ()V
        U: 
            line 629
            getstatic zombie/iso/LightingThread.instance Lzombie/iso/LightingThread;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/iso/LightingThread.scrollLeft (I)V
        V: 
            line 630
            return 
        W: 
        }
    }

    .method public SwapChunkBuffers ()V {
        parameters: { this },
        code: {
        A: 
            line 633
            iconst_0 
            istore n
        B: 
            iload n
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            imul 
            if_icmpge G
        C: 
            line 634
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifeq E
        D: 
            line 635
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload n
            aconst_null 
            aastore 
            goto F
        E: 
            line 637
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload n
            aconst_null 
            aastore 
        F: 
            line 633
            iinc n 1
            goto B
        G: 
            line 640
            aload this
            aload this
            iconst_m1 
            dup_x1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        H: 
            line 641
            aload this
            aload this
            iconst_m1 
            dup_x1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        I: 
            line 643
            aload this
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifne J
            iconst_1 
            goto K
        J: 
            iconst_0 
        K: 
            putfield zombie/iso/IsoChunkMap.readBufferA Z
        L: 
            line 644
            return 
        M: 
        }
    }

    .method private setChunk (ILzombie/iso/IsoChunk;)V {
        parameters: { this, n, c },
        code: {
        A: 
            line 647
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifne C
        B: 
            line 648
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload n
            aload c
            aastore 
            goto D
        C: 
            line 650
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload n
            aload c
            aastore 
        D: 
            line 652
            return 
        E: 
        }
    }

    .method private getChunk (I)Lzombie/iso/IsoChunk; {
        parameters: { this, n },
        code: {
        A: 
            line 655
            aload this
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifeq C
        B: 
            line 656
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            areturn 
        C: 
            line 658
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            areturn 
        D: 
        }
    }

    .method private LoadRight ()V {
        parameters: { this },
        code: {
        A: 
            line 663
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        B: 
            line 664
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        C: 
            line 665
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        D: 
            line 666
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        E: 
            line 668
            aload this
            invokevirtual zombie/iso/IsoChunkMap.Right ()V
        F: 
            line 669
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/core/physics/WorldSimulation.scrollGroundRight (I)V
        G: 
            line 671
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        H: 
            line 672
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        I: 
            line 673
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        J: 
            line 674
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        K: 
            line 676
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            ineg 
            istore y
        L: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            if_icmpgt O
        M: 
            line 677
            aload this
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            iload y
            iadd 
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            invokevirtual zombie/iso/IsoChunkMap.LoadChunkForLater (IIII)Lzombie/iso/IsoChunk;
            pop 
        N: 
            line 676
            iinc y 1
            goto L
        O: 
            line 681
            aload this
            invokevirtual zombie/iso/IsoChunkMap.SwapChunkBuffers ()V
        P: 
            line 682
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        Q: 
            line 683
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        R: 
            line 684
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        S: 
            line 685
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        T: 
            line 686
            aload this
            invokevirtual zombie/iso/IsoChunkMap.UpdateCellCache ()V
        U: 
            line 687
            getstatic zombie/iso/LightingThread.instance Lzombie/iso/LightingThread;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/iso/LightingThread.scrollRight (I)V
        V: 
            line 688
            return 
        W: 
        }
    }

    .method private LoadUp ()V {
        parameters: { this },
        code: {
        A: 
            line 691
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        B: 
            line 692
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        C: 
            line 693
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        D: 
            line 694
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        E: 
            line 696
            aload this
            invokevirtual zombie/iso/IsoChunkMap.Up ()V
        F: 
            line 697
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/core/physics/WorldSimulation.scrollGroundUp (I)V
        G: 
            line 699
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        H: 
            line 700
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        I: 
            line 701
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        J: 
            line 702
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        K: 
            line 704
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            ineg 
            istore x
        L: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            if_icmpgt O
        M: 
            line 705
            aload this
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            iload x
            iadd 
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            iconst_0 
            invokevirtual zombie/iso/IsoChunkMap.LoadChunkForLater (IIII)Lzombie/iso/IsoChunk;
            pop 
        N: 
            line 704
            iinc x 1
            goto L
        O: 
            line 707
            aload this
            invokevirtual zombie/iso/IsoChunkMap.SwapChunkBuffers ()V
        P: 
            line 708
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        Q: 
            line 709
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        R: 
            line 710
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        S: 
            line 711
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        T: 
            line 713
            aload this
            invokevirtual zombie/iso/IsoChunkMap.UpdateCellCache ()V
        U: 
            line 714
            getstatic zombie/iso/LightingThread.instance Lzombie/iso/LightingThread;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/iso/LightingThread.scrollUp (I)V
        V: 
            line 715
            return 
        W: 
        }
    }

    .method private LoadDown ()V {
        parameters: { this },
        code: {
        A: 
            line 718
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        B: 
            line 719
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        C: 
            line 720
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        D: 
            line 721
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        E: 
            line 723
            aload this
            invokevirtual zombie/iso/IsoChunkMap.Down ()V
        F: 
            line 724
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/core/physics/WorldSimulation.scrollGroundDown (I)V
        G: 
            line 726
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        H: 
            line 727
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        I: 
            line 728
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        J: 
            line 729
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        K: 
            line 731
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            ineg 
            istore x
        L: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            if_icmpgt O
        M: 
            line 732
            aload this
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            iload x
            iadd 
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            invokevirtual zombie/iso/IsoChunkMap.LoadChunkForLater (IIII)Lzombie/iso/IsoChunk;
            pop 
        N: 
            line 731
            iinc x 1
            goto L
        O: 
            line 736
            aload this
            invokevirtual zombie/iso/IsoChunkMap.SwapChunkBuffers ()V
        P: 
            line 737
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        Q: 
            line 738
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        R: 
            line 739
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        S: 
            line 740
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        T: 
            line 741
            aload this
            invokevirtual zombie/iso/IsoChunkMap.UpdateCellCache ()V
        U: 
            line 742
            getstatic zombie/iso/LightingThread.instance Lzombie/iso/LightingThread;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/iso/LightingThread.scrollDown (I)V
        V: 
            line 743
            return 
        W: 
        }
    }

    .method private UpdateCellCache ()V {
        parameters: { this },
        code: {
        A: 
            line 747
            return 
        B: 
        }
    }

    .method private Up ()V {
        parameters: { this },
        code: {
        A: 
            line 762
            iconst_0 
            istore x
        B: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge Z
        C: 
            line 763
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            istore y
        D: 
            iload y
            ifle X
        E: 
            line 764
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore ch
        F: 
            line 766
            aload ch
            ifnonnull P
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            if_icmpne P
        G: 
            line 767
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload x
            iadd 
            istore wx
        H: 
            line 768
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload y
            iadd 
            istore wy
        I: 
            line 769
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore ch
        J: 
            line 770
            aload ch
            ifnull P
        K: 
            line 771
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq O
        L: 
            line 772
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        M: 
            line 773
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq O
        N: 
            line 774
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        O: 
            line 777
            aconst_null 
            astore ch
        P: 
            line 781
            aload ch
            ifnull V
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            if_icmpne V
        Q: 
            line 782
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        R: 
            line 783
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq V
        S: 
            line 784
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        T: 
            line 785
            aload ch
            invokevirtual zombie/iso/IsoChunk.removeFromWorld ()V
        U: 
            line 786
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload ch
            invokevirtual zombie/iso/ChunkSaveWorker.Add (Lzombie/iso/IsoChunk;)V
        V: 
            line 790
            aload this
            iload x
            iload y
            aload this
            iload x
            iload y
            iconst_1 
            isub 
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        W: 
            line 763
            iinc y -1
            goto D
        X: 
            line 793
            aload this
            iload x
            iconst_0 
            aconst_null 
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        Y: 
            line 762
            iinc x 1
            goto B
        Z: 
            line 795
            aload this
            dup 
            getfield zombie/iso/IsoChunkMap.worldY I
            iconst_1 
            isub 
            putfield zombie/iso/IsoChunkMap.worldY I
        AA: 
            line 796
            return 
        AB: 
        }
    }

    .method private Down ()V {
        parameters: { this },
        code: {
        A: 
            line 799
            iconst_0 
            istore x
        B: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge Z
        C: 
            line 800
            iconst_0 
            istore y
        D: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            if_icmpge X
        E: 
            line 801
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore ch
        F: 
            line 803
            aload ch
            ifnonnull P
            iload y
            ifne P
        G: 
            line 804
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload x
            iadd 
            istore wx
        H: 
            line 805
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload y
            iadd 
            istore wy
        I: 
            line 806
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore ch
        J: 
            line 807
            aload ch
            ifnull P
        K: 
            line 808
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq O
        L: 
            line 809
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        M: 
            line 810
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq O
        N: 
            line 811
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        O: 
            line 814
            aconst_null 
            astore ch
        P: 
            line 818
            aload ch
            ifnull V
            iload y
            ifne V
        Q: 
            line 819
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        R: 
            line 820
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq V
        S: 
            line 821
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        T: 
            line 822
            aload ch
            invokevirtual zombie/iso/IsoChunk.removeFromWorld ()V
        U: 
            line 823
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload ch
            invokevirtual zombie/iso/ChunkSaveWorker.Add (Lzombie/iso/IsoChunk;)V
        V: 
            line 827
            aload this
            iload x
            iload y
            aload this
            iload x
            iload y
            iconst_1 
            iadd 
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        W: 
            line 800
            iinc y 1
            goto D
        X: 
            line 830
            aload this
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            aconst_null 
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        Y: 
            line 799
            iinc x 1
            goto B
        Z: 
            line 832
            aload this
            dup 
            getfield zombie/iso/IsoChunkMap.worldY I
            iconst_1 
            iadd 
            putfield zombie/iso/IsoChunkMap.worldY I
        AA: 
            line 833
            return 
        AB: 
        }
    }

    .method private Left ()V {
        parameters: { this },
        code: {
        A: 
            line 836
            iconst_0 
            istore y
        B: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge Z
        C: 
            line 837
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            istore x
        D: 
            iload x
            ifle X
        E: 
            line 838
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore ch
        F: 
            line 840
            aload ch
            ifnonnull P
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            if_icmpne P
        G: 
            line 841
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload x
            iadd 
            istore wx
        H: 
            line 842
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload y
            iadd 
            istore wy
        I: 
            line 843
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore ch
        J: 
            line 844
            aload ch
            ifnull P
        K: 
            line 845
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq O
        L: 
            line 846
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        M: 
            line 847
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq O
        N: 
            line 848
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        O: 
            line 851
            aconst_null 
            astore ch
        P: 
            line 855
            aload ch
            ifnull V
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            if_icmpne V
        Q: 
            line 856
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        R: 
            line 857
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq V
        S: 
            line 858
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        T: 
            line 859
            aload ch
            invokevirtual zombie/iso/IsoChunk.removeFromWorld ()V
        U: 
            line 860
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload ch
            invokevirtual zombie/iso/ChunkSaveWorker.Add (Lzombie/iso/IsoChunk;)V
        V: 
            line 864
            aload this
            iload x
            iload y
            aload this
            iload x
            iconst_1 
            isub 
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        W: 
            line 837
            iinc x -1
            goto D
        X: 
            line 867
            aload this
            iconst_0 
            iload y
            aconst_null 
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        Y: 
            line 836
            iinc y 1
            goto B
        Z: 
            line 869
            aload this
            dup 
            getfield zombie/iso/IsoChunkMap.worldX I
            iconst_1 
            isub 
            putfield zombie/iso/IsoChunkMap.worldX I
        AA: 
            line 870
            return 
        AB: 
        }
    }

    .method private Right ()V {
        parameters: { this },
        code: {
        A: 
            line 873
            iconst_0 
            istore y
        B: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge Z
        C: 
            line 874
            iconst_0 
            istore x
        D: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            if_icmpge X
        E: 
            line 875
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore ch
        F: 
            line 877
            aload ch
            ifnonnull P
            iload x
            ifne P
        G: 
            line 878
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload x
            iadd 
            istore wx
        H: 
            line 879
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload y
            iadd 
            istore wy
        I: 
            line 880
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            iload wx
            bipush 16
            ishl 
            iload wy
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore ch
        J: 
            line 881
            aload ch
            ifnull P
        K: 
            line 882
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq O
        L: 
            line 883
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        M: 
            line 884
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq O
        N: 
            line 885
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        O: 
            line 889
            aconst_null 
            astore ch
        P: 
            line 893
            aload ch
            ifnull V
            iload x
            ifne V
        Q: 
            line 894
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        R: 
            line 895
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq V
        S: 
            line 896
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        T: 
            line 897
            aload ch
            invokevirtual zombie/iso/IsoChunk.removeFromWorld ()V
        U: 
            line 898
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload ch
            invokevirtual zombie/iso/ChunkSaveWorker.Add (Lzombie/iso/IsoChunk;)V
        V: 
            line 902
            aload this
            iload x
            iload y
            aload this
            iload x
            iconst_1 
            iadd 
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        W: 
            line 874
            iinc x 1
            goto D
        X: 
            line 904
            aload this
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_1 
            isub 
            iload y
            aconst_null 
            invokevirtual zombie/iso/IsoChunkMap.setChunk (IILzombie/iso/IsoChunk;)V
        Y: 
            line 873
            iinc y 1
            goto B
        Z: 
            line 906
            aload this
            dup 
            getfield zombie/iso/IsoChunkMap.worldX I
            iconst_1 
            iadd 
            putfield zombie/iso/IsoChunkMap.worldX I
        AA: 
            line 907
            return 
        AB: 
        }
    }

    .method public getWorldXMin ()I {
        parameters: { this },
        code: {
        A: 
            line 910
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            ireturn 
        B: 
        }
    }

    .method public getWorldYMin ()I {
        parameters: { this },
        code: {
        A: 
            line 914
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            ireturn 
        B: 
        }
    }

    .method public ProcessChunkPos (Lzombie/characters/IsoGameCharacter;)V {
        parameters: { this, chr },
        exceptions: { 
            { U, BH, BK, * }, 
            { BK, BL, BK, * }
         },
        code: {
        A: 
            line 918
            aload chr
            invokevirtual zombie/characters/IsoGameCharacter.getX ()F
            fstore x1
        B: 
            line 919
            aload chr
            invokevirtual zombie/characters/IsoGameCharacter.getY ()F
            fstore y1
        C: 
            line 920
            aload chr
            invokevirtual zombie/characters/IsoGameCharacter.getZ ()F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            istore z
        D: 
            line 923
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            ifnull L
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.getVehicle ()Lzombie/vehicles/BaseVehicle;
            ifnull L
        E: 
            line 924
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            astore p
        F: 
            line 925
            aload p
            invokevirtual zombie/characters/IsoPlayer.getVehicle ()Lzombie/vehicles/BaseVehicle;
            astore v
        G: 
            line 926
            aload v
            invokevirtual zombie/vehicles/BaseVehicle.getCurrentSpeedKmHour ()F
            ldc 5F
            fdiv 
            fstore s
        H: 
            line 927
            aload p
            invokevirtual zombie/characters/IsoPlayer.isDriving ()Z
            ifne J
        I: 
            line 928
            fload s
            fconst_2 
            fmul 
            ldc 20F
            invokestatic java/lang/Math.min (FF)F
            fstore s
        J: 
            line 930
            fload x1
            aload p
            invokevirtual zombie/characters/IsoPlayer.getForwardDirectionX ()F
            fload s
            fmul 
            invokestatic java/lang/Math.round (F)I
            i2f 
            fadd 
            fstore x1
        K: 
            line 931
            fload y1
            aload p
            invokevirtual zombie/characters/IsoPlayer.getForwardDirectionY ()F
            fload s
            fmul 
            invokestatic java/lang/Math.round (F)I
            i2f 
            fadd 
            fstore y1
        L: 
            line 934
            fload x1
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            istore x
        M: 
            line 935
            fload y1
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            istore y
        N: 
            line 936
            iload x
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            if_icmpne P
            iload y
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            if_icmpne P
        O: 
            line 937
            return 
        P: 
            line 940
            invokestatic java/lang/System.nanoTime ()J
            lstore start
        Q: 
            line 941
            dconst_0 
            dstore duration1
        R: 
            line 942
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.lock ()V
        S: 
            line 944
            invokestatic java/lang/System.nanoTime ()J
            lstore start2
        T: 
            line 945
            iconst_0 
            istore changed
        U: 
            // try-start:   range=[U-BH] handler=BK:* 
            line 947
            iload x
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            isub 
            invokestatic java/lang/Math.abs (I)I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge V
            iload y
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            isub 
            invokestatic java/lang/Math.abs (I)I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmplt AX
        V: 
            line 949
            getstatic zombie/iso/LightingJNI.init Z
            ifeq X
        W: 
            line 950
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            invokestatic zombie/iso/LightingJNI.teleport (III)V
        X: 
            line 952
            aload this
            invokevirtual zombie/iso/IsoChunkMap.Unload ()V
        Y: 
            line 953
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            aaload 
            astore player
        Z: 
            line 954
            aload player
            invokevirtual zombie/characters/IsoPlayer.removeFromSquare ()V
        AA: 
            line 955
            aload player
            aconst_null 
            putfield zombie/characters/IsoPlayer.square Lzombie/iso/IsoGridSquare;
        AB: 
            line 956
            aload this
            iload x
            putfield zombie/iso/IsoChunkMap.worldX I
        AC: 
            line 957
            aload this
            iload y
            putfield zombie/iso/IsoChunkMap.worldY I
        AD: 
            line 958
            getstatic zombie/network/GameServer.server Z
            ifne AF
        AE: 
            line 959
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/core/physics/WorldSimulation.activateChunkMap (I)V
        AF: 
            line 961
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            istore minwx
        AG: 
            line 962
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            isub 
            istore minwy
        AH: 
            line 963
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            istore maxwx
        AI: 
            line 964
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            iconst_2 
            idiv 
            iadd 
            istore maxwy
        AJ: 
            line 965
            iload minwx
            istore xx
        AK: 
            iload xx
            iload maxwx
            if_icmpgt AQ
        AL: 
            line 966
            iload minwy
            istore yy
        AM: 
            iload yy
            iload maxwy
            if_icmpgt AP
        AN: 
            line 967
            aload this
            iload xx
            iload yy
            iload xx
            iload minwx
            isub 
            iload yy
            iload minwy
            isub 
            invokevirtual zombie/iso/IsoChunkMap.LoadChunkForLater (IIII)Lzombie/iso/IsoChunk;
            pop 
        AO: 
            line 966
            iinc yy 1
            goto AM
        AP: 
            line 965
            iinc xx 1
            goto AK
        AQ: 
            line 970
            aload this
            invokevirtual zombie/iso/IsoChunkMap.SwapChunkBuffers ()V
        AR: 
            line 971
            aload this
            invokevirtual zombie/iso/IsoChunkMap.UpdateCellCache ()V
        AS: 
            line 972
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            astore cell
        AT: 
            line 973
            aload cell
            invokevirtual zombie/iso/IsoCell.getObjectList ()Ljava/util/ArrayList;
            aload player
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne AV
            aload cell
            invokevirtual zombie/iso/IsoCell.getAddList ()Ljava/util/ArrayList;
            aload player
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne AV
        AU: 
            line 974
            aload cell
            invokevirtual zombie/iso/IsoCell.getAddList ()Ljava/util/ArrayList;
            aload player
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AV: 
            line 976
            iconst_1 
            istore changed
        AW: 
            line 977
            goto BH
        AX: 
            iload x
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            if_icmpeq BC
        AY: 
            line 978
            iload x
            aload this
            getfield zombie/iso/IsoChunkMap.worldX I
            if_icmpge BA
        AZ: 
            line 979
            aload this
            invokevirtual zombie/iso/IsoChunkMap.LoadLeft ()V
            goto BB
        BA: 
            line 981
            aload this
            invokevirtual zombie/iso/IsoChunkMap.LoadRight ()V
        BB: 
            line 984
            iconst_1 
            istore changed
            goto BH
        BC: 
            line 985
            iload y
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            if_icmpeq BH
        BD: 
            line 986
            iload y
            aload this
            getfield zombie/iso/IsoChunkMap.worldY I
            if_icmpge BF
        BE: 
            line 987
            aload this
            invokevirtual zombie/iso/IsoChunkMap.LoadUp ()V
            goto BG
        BF: 
            line 989
            aload this
            invokevirtual zombie/iso/IsoChunkMap.LoadDown ()V
        BG: 
            line 991
            iconst_1 
            istore changed
        BH: 
            // try-end:     range=[U-BH] handler=BK:* 
            line 994
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        BI: 
            line 996
            iload changed
            ifeq BP
        BJ: 
            line 997
            aload this
            invokevirtual zombie/iso/IsoChunkMap.calculateZExtentsForChunkMap ()V
            goto BP
        BK: 
            // try-handler: range=[U-BH] handler=BK:* 
            // try-start:   range=[BK-BL] handler=BK:* 
            // try-handler: range=[BK-BL] handler=BK:* 
            line 994
            astore v21
        BL: 
            // try-end:     range=[BK-BL] handler=BK:* 
            getstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
            invokevirtual java/util/concurrent/locks/ReentrantLock.unlock ()V
        BM: 
            line 996
            iload changed
            ifeq BO
        BN: 
            line 997
            aload this
            invokevirtual zombie/iso/IsoChunkMap.calculateZExtentsForChunkMap ()V
        BO: 
            line 999
            aload v21
            athrow 
        BP: 
            line 1001
            invokestatic java/lang/System.nanoTime ()J
            lload start2
            lsub 
            l2d 
            ldc 1000000D
            ddiv 
            dstore duration1
        BQ: 
            line 1002
            invokestatic java/lang/System.nanoTime ()J
            lload start
            lsub 
            l2d 
            ldc 1000000D
            ddiv 
            dstore duration2
        BR: 
            line 1003
            getstatic zombie/iso/LightingThread.debugLockTime Z
            ifeq BT
            dload duration2
            ldc 10D
            dcmpl 
            ifle BT
        BS: 
            line 1004
            dload duration1
            dload duration2
            invokedynamic makeConcatWithConstants (DD)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "ProcessChunkPos time \u0001/\u0001 ms" }
            invokestatic zombie/debug/DebugLog.log (Ljava/lang/String;)V
        BT: 
            line 1006
            return 
        BU: 
        }
    }

    .method public calculateZExtentsForChunkMap ()V {
        parameters: { this },
        code: {
        A: 
            line 1009
            iconst_0 
            istore max
        B: 
            line 1010
            iconst_0 
            istore min
        C: 
            line 1011
            iconst_0 
            istore xx
        D: 
            iload xx
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            arraylength 
            if_icmpge M
        E: 
            line 1012
            iconst_0 
            istore yy
        F: 
            iload yy
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            arraylength 
            if_icmpge L
        G: 
            line 1013
            aload this
            iload xx
            iload yy
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore c
        H: 
            line 1015
            aload c
            ifnull K
        I: 
            line 1016
            aload c
            getfield zombie/iso/IsoChunk.maxLevel I
            iload max
            invokestatic java/lang/Math.max (II)I
            istore max
        J: 
            line 1017
            iload min
            aload c
            getfield zombie/iso/IsoChunk.minLevel I
            invokestatic java/lang/Math.min (II)I
            istore min
        K: 
            line 1012
            iinc yy 1
            goto F
        L: 
            line 1011
            iinc xx 1
            goto D
        M: 
            line 1022
            aload this
            iload max
            putfield zombie/iso/IsoChunkMap.maxHeight I
        N: 
            line 1023
            aload this
            iload min
            putfield zombie/iso/IsoChunkMap.minHeight I
        O: 
            line 1024
            return 
        P: 
        }
    }

    .method public getRoom (I)Lzombie/iso/areas/IsoRoom; {
        parameters: { this, iD },
        code: {
        A: 
            line 1027
            aconst_null 
            areturn 
        B: 
        }
    }

    .method public getWidthInTiles ()I {
        parameters: { this },
        code: {
        A: 
            line 1031
            getstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
            ireturn 
        B: 
        }
    }

    .method public getWorldXMinTiles ()I {
        parameters: { this },
        code: {
        A: 
            line 1035
            aload this
            getfield zombie/iso/IsoChunkMap.xMinTiles I
            iconst_m1 
            if_icmpeq C
        B: 
            line 1036
            aload this
            getfield zombie/iso/IsoChunkMap.xMinTiles I
            ireturn 
        C: 
            line 1038
            aload this
            aload this
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMin ()I
            bipush 8
            imul 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        D: 
            line 1039
            aload this
            getfield zombie/iso/IsoChunkMap.xMinTiles I
            ireturn 
        E: 
        }
    }

    .method public getWorldYMinTiles ()I {
        parameters: { this },
        code: {
        A: 
            line 1043
            aload this
            getfield zombie/iso/IsoChunkMap.yMinTiles I
            iconst_m1 
            if_icmpeq C
        B: 
            line 1044
            aload this
            getfield zombie/iso/IsoChunkMap.yMinTiles I
            ireturn 
        C: 
            line 1046
            aload this
            aload this
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMin ()I
            bipush 8
            imul 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        D: 
            line 1047
            aload this
            getfield zombie/iso/IsoChunkMap.yMinTiles I
            ireturn 
        E: 
        }
    }

    .method public getWorldXMaxTiles ()I {
        parameters: { this },
        code: {
        A: 
            line 1051
            aload this
            getfield zombie/iso/IsoChunkMap.xMaxTiles I
            iconst_m1 
            if_icmpeq C
        B: 
            line 1052
            aload this
            getfield zombie/iso/IsoChunkMap.xMaxTiles I
            ireturn 
        C: 
            line 1054
            aload this
            aload this
            invokevirtual zombie/iso/IsoChunkMap.getWorldXMin ()I
            bipush 8
            imul 
            aload this
            invokevirtual zombie/iso/IsoChunkMap.getWidthInTiles ()I
            iadd 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        D: 
            line 1055
            aload this
            getfield zombie/iso/IsoChunkMap.xMaxTiles I
            ireturn 
        E: 
        }
    }

    .method public getWorldYMaxTiles ()I {
        parameters: { this },
        code: {
        A: 
            line 1059
            aload this
            getfield zombie/iso/IsoChunkMap.yMaxTiles I
            iconst_m1 
            if_icmpeq C
        B: 
            line 1060
            aload this
            getfield zombie/iso/IsoChunkMap.yMaxTiles I
            ireturn 
        C: 
            line 1062
            aload this
            aload this
            invokevirtual zombie/iso/IsoChunkMap.getWorldYMin ()I
            bipush 8
            imul 
            aload this
            invokevirtual zombie/iso/IsoChunkMap.getWidthInTiles ()I
            iadd 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        D: 
            line 1063
            aload this
            getfield zombie/iso/IsoChunkMap.yMaxTiles I
            ireturn 
        E: 
        }
    }

    .method public Save ()V {
        parameters: { this },
        exceptions: { 
            { I, J, K, Ljava/io/IOException; }
         },
        code: {
        A: 
            line 1067
            getstatic zombie/network/GameServer.server Z
            ifeq C
        B: 
            line 1068
            return 
        C: 
            line 1071
            iconst_0 
            istore x
        D: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge O
        E: 
            line 1072
            iconst_0 
            istore y
        F: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge N
        G: 
            line 1073
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore c
        H: 
            line 1074
            aload c
            ifnull M
        I: 
            // try-start:   range=[I-J] handler=K:java/io/IOException 
            line 1076
            aload c
            iconst_1 
            invokevirtual zombie/iso/IsoChunk.Save (Z)V
        J: 
            // try-end:     range=[I-J] handler=K:java/io/IOException 
            line 1079
            goto M
        K: 
            // try-handler: range=[I-J] handler=K:java/io/IOException 
            line 1077
            astore e
        L: 
            line 1078
            aload e
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        M: 
            line 1072
            iinc y 1
            goto F
        N: 
            line 1071
            iinc x 1
            goto D
        O: 
            line 1083
            return 
        P: 
        }
    }

    .method public renderBloodForChunks (I)V {
        parameters: { this, zza },
        code: {
        A: 
            line 1086
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.terrain Lzombie/debug/options/Terrain;
            getfield zombie/debug/options/Terrain.renderTiles Lzombie/debug/options/Terrain$RenderTiles;
            getfield zombie/debug/options/Terrain$RenderTiles.bloodDecals Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifne C
        B: 
            line 1087
            return 
        C: 
            line 1090
            iload zza
            i2f 
            invokestatic zombie/iso/IsoCamera.getCameraCharacterZ ()F
            fcmpl 
            ifle E
        D: 
            line 1092
            return 
        E: 
            line 1095
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.getOptionBloodDecals ()I
            istore OptionBloodDecals
        F: 
            line 1096
            iload OptionBloodDecals
            ifne H
        G: 
            line 1097
            return 
        H: 
            line 1100
            invokestatic zombie/GameTime.getInstance ()Lzombie/GameTime;
            invokevirtual zombie/GameTime.getWorldAgeHours ()D
            d2f 
            fstore worldAge
        I: 
            line 1102
            getstatic zombie/iso/IsoCamera.frameState Lzombie/iso/IsoCamera$FrameState;
            getfield zombie/iso/IsoCamera$FrameState.playerIndex I
            istore playerIndex
        J: 
            line 1104
            iconst_0 
            istore n
        K: 
            iload n
            getstatic zombie/iso/IsoFloorBloodSplat.FLOOR_BLOOD_TYPES [Ljava/lang/String;
            arraylength 
            if_icmpge N
        L: 
            line 1105
            getstatic zombie/iso/IsoChunkMap.splatByType Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast java/util/ArrayList
            invokevirtual java/util/ArrayList.clear ()V
        M: 
            line 1104
            iinc n 1
            goto K
        N: 
            line 1108
            iconst_0 
            istore x
        O: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge AP
        P: 
            line 1109
            iconst_0 
            istore y
        Q: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge AO
        R: 
            line 1110
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore ch
        S: 
            line 1111
            aload ch
            ifnonnull U
        T: 
            line 1112
            goto AN
        U: 
            line 1115
            iconst_0 
            istore n
        V: 
            iload n
            aload ch
            getfield zombie/iso/IsoChunk.floorBloodSplatsFade Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AD
        W: 
            line 1116
            aload ch
            getfield zombie/iso/IsoChunk.floorBloodSplatsFade Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoFloorBloodSplat
            astore b
        X: 
            line 1117
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.index I
            iconst_1 
            if_icmplt Z
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.index I
            bipush 10
            if_icmpgt Z
            getstatic zombie/iso/IsoChunk.renderByIndex [[B
            iload OptionBloodDecals
            iconst_1 
            isub 
            aaload 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.index I
            iconst_1 
            isub 
            baload 
            ifne Z
        Y: 
            line 1118
            goto AC
        Z: 
            line 1120
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.z F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            iload zza
            if_icmpne AC
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            iflt AC
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            getstatic zombie/iso/IsoFloorBloodSplat.FLOOR_BLOOD_TYPES [Ljava/lang/String;
            arraylength 
            if_icmpge AC
        AA: 
            line 1121
            aload b
            aload ch
            putfield zombie/iso/IsoFloorBloodSplat.chunk Lzombie/iso/IsoChunk;
        AB: 
            line 1122
            getstatic zombie/iso/IsoChunkMap.splatByType Ljava/util/ArrayList;
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload b
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AC: 
            line 1115
            iinc n 1
            goto V
        AD: 
            line 1125
            aload ch
            getfield zombie/iso/IsoChunk.floorBloodSplats Lzombie/core/utils/BoundedQueue;
            invokevirtual zombie/core/utils/BoundedQueue.isEmpty ()Z
            ifne AN
        AE: 
            line 1126
            iconst_0 
            istore n
        AF: 
            iload n
            aload ch
            getfield zombie/iso/IsoChunk.floorBloodSplats Lzombie/core/utils/BoundedQueue;
            invokevirtual zombie/core/utils/BoundedQueue.size ()I
            if_icmpge AN
        AG: 
            line 1127
            aload ch
            getfield zombie/iso/IsoChunk.floorBloodSplats Lzombie/core/utils/BoundedQueue;
            iload n
            invokevirtual zombie/core/utils/BoundedQueue.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoFloorBloodSplat
            astore b
        AH: 
            line 1128
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.index I
            iconst_1 
            if_icmplt AJ
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.index I
            bipush 10
            if_icmpgt AJ
            getstatic zombie/iso/IsoChunk.renderByIndex [[B
            iload OptionBloodDecals
            iconst_1 
            isub 
            aaload 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.index I
            iconst_1 
            isub 
            baload 
            ifne AJ
        AI: 
            line 1129
            goto AM
        AJ: 
            line 1131
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.z F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            iload zza
            if_icmpne AM
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            iflt AM
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            getstatic zombie/iso/IsoFloorBloodSplat.FLOOR_BLOOD_TYPES [Ljava/lang/String;
            arraylength 
            if_icmpge AM
        AK: 
            line 1132
            aload b
            aload ch
            putfield zombie/iso/IsoFloorBloodSplat.chunk Lzombie/iso/IsoChunk;
        AL: 
            line 1133
            getstatic zombie/iso/IsoChunkMap.splatByType Ljava/util/ArrayList;
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload b
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AM: 
            line 1126
            iinc n 1
            goto AF
        AN: 
            line 1109
            iinc y 1
            goto Q
        AO: 
            line 1108
            iinc x 1
            goto O
        AP: 
            line 1139
            iconst_0 
            istore n
        AQ: 
            iload n
            getstatic zombie/iso/IsoChunkMap.splatByType Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge DS
        AR: 
            line 1140
            getstatic zombie/iso/IsoChunkMap.splatByType Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast java/util/ArrayList
            astore splats
        AS: 
            line 1141
            aload splats
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq AU
        AT: 
            line 1142
            goto DR
        AU: 
            line 1144
            getstatic zombie/iso/IsoFloorBloodSplat.FLOOR_BLOOD_TYPES [Ljava/lang/String;
            iload n
            aaload 
            astore type
        AV: 
            line 1145
            aconst_null 
            astore use
        AW: 
            line 1146
            getstatic zombie/iso/IsoFloorBloodSplat.spriteMap Ljava/util/HashMap;
            aload type
            invokevirtual java/util/HashMap.containsKey (Ljava/lang/Object;)Z
            ifne BC
        AX: 
            line 1147
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            invokestatic zombie/iso/sprite/IsoSprite.CreateSprite (Lzombie/iso/sprite/IsoSpriteManager;)Lzombie/iso/sprite/IsoSprite;
            astore sp
        AY: 
            line 1148
            aload sp
            aload type
            aload type
            aload type
            aload type
            invokevirtual zombie/iso/sprite/IsoSprite.LoadFramesPageSimple (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
        AZ: 
            line 1149
            getstatic zombie/iso/IsoFloorBloodSplat.spriteMap Ljava/util/HashMap;
            aload type
            aload sp
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        BA: 
            line 1150
            aload sp
            astore use
        BB: 
            line 1151
            goto BD
        BC: 
            line 1152
            getstatic zombie/iso/IsoFloorBloodSplat.spriteMap Ljava/util/HashMap;
            aload type
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore use
        BD: 
            line 1154
            iconst_0 
            istore i
        BE: 
            iload i
            aload splats
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge DR
        BF: 
            line 1155
            aload splats
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoFloorBloodSplat
            astore b
        BG: 
            line 1156
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            fconst_1 
            putfield zombie/core/textures/ColorInfo.r F
        BH: 
            line 1157
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            fconst_1 
            putfield zombie/core/textures/ColorInfo.g F
        BI: 
            line 1158
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            fconst_1 
            putfield zombie/core/textures/ColorInfo.b F
        BJ: 
            line 1159
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            ldc 0.2700000107F
            putfield zombie/core/textures/ColorInfo.a F
        BK: 
            line 1160
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.x F
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.y F
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.x F
            fdiv 
            fadd 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            iconst_1 
            iadd 
            i2f 
            fmul 
            fstore aa
        BL: 
            line 1161
            fload aa
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.x F
            fmul 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.y F
            fdiv 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.type I
            iconst_1 
            iadd 
            i2f 
            fmul 
            fload aa
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.y F
            fadd 
            fdiv 
            fstore bb
        BM: 
            line 1162
            fload bb
            fload aa
            fmul 
            fload bb
            fmul 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.x F
            fmul 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.y F
            fconst_2 
            fadd 
            fdiv 
            fstore cc
        BN: 
            line 1163
            fload aa
            ldc 42367.54296875F
            fmul 
            fstore aa
        BO: 
            line 1164
            fload bb
            ldc 6367.123046875F
            fmul 
            fstore bb
        BP: 
            line 1165
            fload cc
            ldc 23367.1328125F
            fmul 
            fstore cc
        BQ: 
            line 1167
            fload aa
            ldc 1000F
            frem 
            fstore aa
        BR: 
            line 1168
            fload bb
            ldc 1000F
            frem 
            fstore bb
        BS: 
            line 1169
            fload cc
            ldc 1000F
            frem 
            fstore cc
        BT: 
            line 1170
            fload aa
            ldc 1000F
            fdiv 
            fstore aa
        BU: 
            line 1171
            fload bb
            ldc 1000F
            fdiv 
            fstore bb
        BV: 
            line 1172
            fload cc
            ldc 1000F
            fdiv 
            fstore cc
        BW: 
            line 1173
            fload aa
            ldc 0.25F
            fcmpl 
            ifle BY
        BX: 
            line 1174
            ldc 0.25F
            fstore aa
        BY: 
            line 1177
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.r F
            fload aa
            fconst_2 
            fmul 
            fsub 
            putfield zombie/core/textures/ColorInfo.r F
        BZ: 
            line 1178
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.g F
            fload aa
            fconst_2 
            fmul 
            fsub 
            putfield zombie/core/textures/ColorInfo.g F
        CA: 
            line 1179
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.b F
            fload aa
            fconst_2 
            fmul 
            fsub 
            putfield zombie/core/textures/ColorInfo.b F
        CB: 
            line 1180
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.r F
            fload bb
            ldc 3F
            fdiv 
            fadd 
            putfield zombie/core/textures/ColorInfo.r F
        CC: 
            line 1181
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.g F
            fload cc
            ldc 3F
            fdiv 
            fsub 
            putfield zombie/core/textures/ColorInfo.g F
        CD: 
            line 1182
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.b F
            fload cc
            ldc 3F
            fdiv 
            fsub 
            putfield zombie/core/textures/ColorInfo.b F
        CE: 
            line 1184
            fload worldAge
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.worldAge F
            fsub 
            fstore deltaAge
        CF: 
            line 1185
            fload deltaAge
            fconst_0 
            fcmpl 
            iflt CM
            fload deltaAge
            ldc 72F
            fcmpg 
            ifge CM
        CG: 
            line 1186
            fconst_1 
            fload deltaAge
            ldc 72F
            fdiv 
            fsub 
            fstore f
        CH: 
            line 1187
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.r F
            ldc 0.200000003F
            fload f
            ldc 0.8000000119F
            fmul 
            fadd 
            fmul 
            putfield zombie/core/textures/ColorInfo.r F
        CI: 
            line 1188
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.g F
            ldc 0.200000003F
            fload f
            ldc 0.8000000119F
            fmul 
            fadd 
            fmul 
            putfield zombie/core/textures/ColorInfo.g F
        CJ: 
            line 1189
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.b F
            ldc 0.200000003F
            fload f
            ldc 0.8000000119F
            fmul 
            fadd 
            fmul 
            putfield zombie/core/textures/ColorInfo.b F
        CK: 
            line 1190
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.a F
            ldc 0.25F
            fload f
            ldc 0.75F
            fmul 
            fadd 
            fmul 
            putfield zombie/core/textures/ColorInfo.a F
        CL: 
            line 1191
            goto CQ
        CM: 
            line 1192
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.r F
            ldc 0.200000003F
            fmul 
            putfield zombie/core/textures/ColorInfo.r F
        CN: 
            line 1193
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.g F
            ldc 0.200000003F
            fmul 
            putfield zombie/core/textures/ColorInfo.g F
        CO: 
            line 1194
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.b F
            ldc 0.200000003F
            fmul 
            putfield zombie/core/textures/ColorInfo.b F
        CP: 
            line 1195
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.a F
            ldc 0.25F
            fmul 
            putfield zombie/core/textures/ColorInfo.a F
        CQ: 
            line 1198
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.fade I
            ifle CU
        CR: 
            line 1199
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.a F
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.fade I
            i2f 
            invokestatic zombie/core/PerformanceSettings.getLockFPS ()I
            i2f 
            ldc 5F
            fmul 
            fdiv 
            fmul 
            putfield zombie/core/textures/ColorInfo.a F
        CS: 
            line 1200
            aload b
            dup 
            getfield zombie/iso/IsoFloorBloodSplat.fade I
            iconst_1 
            isub 
            dup_x1 
            putfield zombie/iso/IsoFloorBloodSplat.fade I
            ifne CU
        CT: 
            line 1201
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.floorBloodSplatsFade Ljava/util/ArrayList;
            aload b
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        CU: 
            line 1205
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.chunk Lzombie/iso/IsoChunk;
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.x F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.y F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.z F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            invokevirtual zombie/iso/IsoChunk.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore square
        CV: 
            line 1206
            aload square
            ifnull DP
        CW: 
            line 1207
            aload square
            iconst_0 
            iload playerIndex
            invokevirtual zombie/iso/IsoGridSquare.getVertLight (II)I
            istore L0
        CX: 
            line 1208
            aload square
            iconst_1 
            iload playerIndex
            invokevirtual zombie/iso/IsoGridSquare.getVertLight (II)I
            istore L1
        CY: 
            line 1209
            aload square
            iconst_2 
            iload playerIndex
            invokevirtual zombie/iso/IsoGridSquare.getVertLight (II)I
            istore L2
        CZ: 
            line 1210
            aload square
            iconst_3 
            iload playerIndex
            invokevirtual zombie/iso/IsoGridSquare.getVertLight (II)I
            istore L3
        DA: 
            line 1211
            iload L0
            invokestatic zombie/core/Color.getRedChannelFromABGR (I)F
            fstore r0
        DB: 
            line 1212
            iload L0
            invokestatic zombie/core/Color.getGreenChannelFromABGR (I)F
            fstore g0
        DC: 
            line 1213
            iload L0
            invokestatic zombie/core/Color.getBlueChannelFromABGR (I)F
            fstore b0
        DD: 
            line 1214
            iload L1
            invokestatic zombie/core/Color.getRedChannelFromABGR (I)F
            fstore r1
        DE: 
            line 1215
            iload L1
            invokestatic zombie/core/Color.getGreenChannelFromABGR (I)F
            fstore g1
        DF: 
            line 1216
            iload L1
            invokestatic zombie/core/Color.getBlueChannelFromABGR (I)F
            fstore b1
        DG: 
            line 1217
            iload L2
            invokestatic zombie/core/Color.getRedChannelFromABGR (I)F
            fstore r2
        DH: 
            line 1218
            iload L2
            invokestatic zombie/core/Color.getGreenChannelFromABGR (I)F
            fstore g2
        DI: 
            line 1219
            iload L2
            invokestatic zombie/core/Color.getBlueChannelFromABGR (I)F
            fstore b2
        DJ: 
            line 1220
            iload L3
            invokestatic zombie/core/Color.getRedChannelFromABGR (I)F
            fstore r3
        DK: 
            line 1221
            iload L3
            invokestatic zombie/core/Color.getGreenChannelFromABGR (I)F
            fstore g3
        DL: 
            line 1222
            iload L3
            invokestatic zombie/core/Color.getBlueChannelFromABGR (I)F
            fstore b3
        DM: 
            line 1223
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.r F
            fload r0
            fload r1
            fadd 
            fload r2
            fadd 
            fload r3
            fadd 
            ldc 4F
            fdiv 
            fmul 
            putfield zombie/core/textures/ColorInfo.r F
        DN: 
            line 1224
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.g F
            fload g0
            fload g1
            fadd 
            fload g2
            fadd 
            fload g3
            fadd 
            ldc 4F
            fdiv 
            fmul 
            putfield zombie/core/textures/ColorInfo.g F
        DO: 
            line 1225
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            dup 
            getfield zombie/core/textures/ColorInfo.b F
            fload b0
            fload b1
            fadd 
            fload b2
            fadd 
            fload b3
            fadd 
            ldc 4F
            fdiv 
            fmul 
            putfield zombie/core/textures/ColorInfo.b F
        DP: 
            line 1228
            aload use
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wx I
            bipush 8
            imul 
            i2f 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.x F
            fadd 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.chunk Lzombie/iso/IsoChunk;
            getfield zombie/iso/IsoChunk.wy I
            bipush 8
            imul 
            i2f 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.y F
            fadd 
            aload b
            getfield zombie/iso/IsoFloorBloodSplat.z F
            getstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
            invokevirtual zombie/iso/sprite/IsoSprite.renderBloodSplat (FFFLzombie/core/textures/ColorInfo;)V
        DQ: 
            line 1154
            iinc i 1
            goto BE
        DR: 
            line 1139
            iinc n 1
            goto AQ
        DS: 
            line 1231
            return 
        DT: 
        }
    }

    .method public copy (Lzombie/iso/IsoChunkMap;)V {
        parameters: { this, from },
        code: {
        A: 
            line 1234
            aload this
            astore to
        B: 
            line 1235
            aload to
            aload from
            getfield zombie/iso/IsoChunkMap.worldX I
            putfield zombie/iso/IsoChunkMap.worldX I
        C: 
            line 1236
            aload to
            aload from
            getfield zombie/iso/IsoChunkMap.worldY I
            putfield zombie/iso/IsoChunkMap.worldY I
        D: 
            line 1237
            aload to
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        E: 
            line 1238
            aload to
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        F: 
            line 1239
            aload to
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        G: 
            line 1240
            aload to
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        H: 
            line 1242
            iconst_0 
            istore n
        I: 
            iload n
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            imul 
            if_icmpge S
        J: 
            line 1243
            aload to
            aload from
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            putfield zombie/iso/IsoChunkMap.readBufferA Z
        K: 
            line 1245
            aload to
            getfield zombie/iso/IsoChunkMap.readBufferA Z
            ifeq O
        L: 
            line 1246
            aload from
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            ifnull R
        M: 
            line 1247
            aload from
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload to
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        N: 
            line 1248
            aload to
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload n
            aload from
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            aastore 
            goto R
        O: 
            line 1251
            aload from
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            ifnull R
        P: 
            line 1252
            aload from
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload to
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        Q: 
            line 1253
            aload to
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload n
            aload from
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload n
            aaload 
            aastore 
        R: 
            line 1242
            iinc n 1
            goto I
        S: 
            line 1257
            return 
        T: 
        }
    }

    .method public Unload ()V {
        parameters: { this },
        code: {
        A: 
            line 1260
            iconst_0 
            istore y
        B: 
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge Q
        C: 
            line 1261
            iconst_0 
            istore x
        D: 
            iload x
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            if_icmpge P
        E: 
            line 1262
            aload this
            iload x
            iload y
            invokevirtual zombie/iso/IsoChunkMap.getChunk (II)Lzombie/iso/IsoChunk;
            astore ch
        F: 
            line 1263
            aload ch
            ifnull O
        G: 
            line 1264
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq M
        H: 
            line 1265
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            aload this
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        I: 
            line 1266
            aload ch
            getfield zombie/iso/IsoChunk.refs Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq M
        J: 
            line 1267
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            aload ch
            getfield zombie/iso/IsoChunk.wx I
            bipush 16
            ishl 
            aload ch
            getfield zombie/iso/IsoChunk.wy I
            iadd 
            invokestatic java/lang/Integer.valueOf (I)Ljava/lang/Integer;
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        K: 
            line 1268
            aload ch
            invokevirtual zombie/iso/IsoChunk.removeFromWorld ()V
        L: 
            line 1269
            getstatic zombie/iso/ChunkSaveWorker.instance Lzombie/iso/ChunkSaveWorker;
            aload ch
            invokevirtual zombie/iso/ChunkSaveWorker.Add (Lzombie/iso/IsoChunk;)V
        M: 
            line 1272
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapA [Lzombie/iso/IsoChunk;
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            imul 
            iload x
            iadd 
            aconst_null 
            aastore 
        N: 
            line 1273
            aload this
            getfield zombie/iso/IsoChunkMap.chunksSwapB [Lzombie/iso/IsoChunk;
            iload y
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            imul 
            iload x
            iadd 
            aconst_null 
            aastore 
        O: 
            line 1261
            iinc x 1
            goto D
        P: 
            line 1260
            iinc y 1
            goto B
        Q: 
            line 1277
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/core/physics/WorldSimulation.deactivateChunkMap (I)V
        R: 
            line 1278
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMinTiles I
        S: 
            line 1279
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.xMaxTiles I
        T: 
            line 1280
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMinTiles I
        U: 
            line 1281
            aload this
            iconst_m1 
            putfield zombie/iso/IsoChunkMap.yMaxTiles I
        V: 
            line 1283
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            ifnull X
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            ifnull X
        W: 
            line 1284
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            aload this
            getfield zombie/iso/IsoChunkMap.playerId I
            invokevirtual zombie/iso/IsoCell.clearCacheGridSquare (I)V
        X: 
            line 1286
            return 
        Y: 
        }
    }

    .method public static isGridSquareOutOfRangeZ (I)Z {
        parameters: { tileZ },
        code: {
        A: 
            line 1290
            iload tileZ
            bipush -32
            if_icmplt B
            iload tileZ
            bipush 31
            if_icmple C
        B: 
            iconst_1 
            goto D
        C: 
            iconst_0 
        D: 
            ireturn 
        E: 
        }
    }

    .method static <clinit> ()V {
        code: {
        A: 
            line 37
            ldc Lzombie/iso/IsoChunkMap;
            invokevirtual java/lang/Class.desiredAssertionStatus ()Z
            ifne B
            iconst_1 
            goto C
        B: 
            iconst_0 
        C: 
            putstatic zombie/iso/IsoChunkMap.$assertionsDisabled Z
        D: 
            line 46
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            putstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
        E: 
            line 50
            sipush 11702
            putstatic zombie/iso/IsoChunkMap.worldXa I
        F: 
            line 51
            sipush 6896
            putstatic zombie/iso/IsoChunkMap.worldYa I
        G: 
            line 53
            iconst_4 
            newarray int
            putstatic zombie/iso/IsoChunkMap.SWorldX [I
        H: 
            line 54
            iconst_4 
            newarray int
            putstatic zombie/iso/IsoChunkMap.SWorldY [I
        I: 
            line 55
            new java/util/concurrent/ConcurrentLinkedQueue
            dup 
            invokespecial java/util/concurrent/ConcurrentLinkedQueue.<init> ()V
            putstatic zombie/iso/IsoChunkMap.chunkStore Ljava/util/concurrent/ConcurrentLinkedQueue;
        J: 
            line 56
            new java/util/concurrent/locks/ReentrantLock
            dup 
            iconst_1 
            invokespecial java/util/concurrent/locks/ReentrantLock.<init> (Z)V
            putstatic zombie/iso/IsoChunkMap.bSettingChunk Ljava/util/concurrent/locks/ReentrantLock;
        K: 
            line 58
            bipush 13
            putstatic zombie/iso/IsoChunkMap.chunkGridWidth I
        L: 
            line 59
            bipush 8
            getstatic zombie/iso/IsoChunkMap.chunkGridWidth I
            imul 
            putstatic zombie/iso/IsoChunkMap.chunkWidthInTiles I
        M: 
            line 60
            new zombie/core/textures/ColorInfo
            dup 
            invokespecial zombie/core/textures/ColorInfo.<init> ()V
            putstatic zombie/iso/IsoChunkMap.inf Lzombie/core/textures/ColorInfo;
        N: 
            line 61
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putstatic zombie/iso/IsoChunkMap.splatByType Ljava/util/ArrayList;
        O: 
            line 79
            iconst_0 
            istore i
        P: 
            iload i
            getstatic zombie/iso/IsoFloorBloodSplat.FLOOR_BLOOD_TYPES [Ljava/lang/String;
            arraylength 
            if_icmpge S
        Q: 
            line 80
            getstatic zombie/iso/IsoChunkMap.splatByType Ljava/util/ArrayList;
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        R: 
            line 79
            iinc i 1
            goto P
        S: 
            line 179
            new zombie/core/profiling/PerformanceProfileProbe
            dup 
            ldc "IsoChunkMap.update"
            invokespecial zombie/core/profiling/PerformanceProfileProbe.<init> (Ljava/lang/String;)V
            putstatic zombie/iso/IsoChunkMap.ppp_update Lzombie/core/profiling/PerformanceProfileProbe;
            return 
        T: 
        }
    }

}
