.inner public static interface abstract {
    name: IPredicatedDataPacketFileWatcherCallback,
    inner: zombie/PredicatedFileWatcher$IPredicatedDataPacketFileWatcherCallback,
    outer: zombie/PredicatedFileWatcher
}
.inner public static interface abstract {
    name: Entry,
    inner: java/util/Map$Entry,
    outer: java/util/Map
}
.inner public static final {
    name: Level,
    inner: zombie/iso/sprite/SpriteGridParseData$Level,
    outer: zombie/iso/sprite/SpriteGridParseData
}
.inner public static {
    name: GlobalObject,
    inner: zombie/Lua/LuaManager$GlobalObject,
    outer: zombie/Lua/LuaManager
}
.inner public static final enum {
    name: Result,
    inner: zombie/iso/worldgen/WorldGenParams$Result,
    outer: zombie/iso/worldgen/WorldGenParams
}
.inner public static {
    name: StringServerOption,
    inner: zombie/network/ServerOptions$StringServerOption,
    outer: zombie/network/ServerOptions
}
.inner public static {
    name: BooleanServerOption,
    inner: zombie/network/ServerOptions$BooleanServerOption,
    outer: zombie/network/ServerOptions
}
.inner public static final {
    name: Comparer,
    inner: zombie/network/NetChecksum$Comparer,
    outer: zombie/network/NetChecksum
}
.inner private static {
    name: CompScoreToPlayer,
    inner: zombie/iso/IsoWorld$CompScoreToPlayer,
    outer: zombie/iso/IsoWorld
}
.inner public static {
    name: ModelSlot,
    inner: zombie/core/skinnedmodel/ModelManager$ModelSlot,
    outer: zombie/core/skinnedmodel/ModelManager
}
.inner private static {
    name: s_performance,
    inner: zombie/iso/IsoWorld$s_performance,
    outer: zombie/iso/IsoWorld
}
.inner public static final {
    name: FrameState,
    inner: zombie/iso/IsoCamera$FrameState,
    outer: zombie/iso/IsoCamera
}
.inner public static {
    name: ProfileArea,
    inner: zombie/GameProfiler$ProfileArea,
    outer: zombie/GameProfiler
}
.inner public static {
    name: EnumSandboxOption,
    inner: zombie/SandboxOptions$EnumSandboxOption,
    outer: zombie/SandboxOptions
}
.inner public {
    name: Frame,
    inner: zombie/iso/IsoWorld$Frame,
    outer: zombie/iso/IsoWorld
}
.inner public static {
    name: MetaCell,
    inner: zombie/iso/IsoWorld$MetaCell,
    outer: zombie/iso/IsoWorld
}
.inner private static {
    name: CompDistToPlayer,
    inner: zombie/iso/IsoWorld$CompDistToPlayer,
    outer: zombie/iso/IsoWorld
}
.inner public static final {
    name: Lookup,
    inner: java/lang/invoke/MethodHandles$Lookup,
    outer: java/lang/invoke/MethodHandles
}
.sourcefile "IsoWorld.java"
.nest-member zombie/iso/IsoWorld$s_performance 
.nest-member zombie/iso/IsoWorld$Frame 
.nest-member zombie/iso/IsoWorld$MetaCell 
.nest-member zombie/iso/IsoWorld$CompScoreToPlayer 
.nest-member zombie/iso/IsoWorld$CompDistToPlayer 
.visible-annotation zombie/UsedFromLua {}
.super java/lang/Object
.class public final super zombie/iso/IsoWorld {

    .field private weather Ljava/lang/String; 
    .field public final metaGrid Lzombie/iso/IsoMetaGrid; 
    .signature "Ljava/util/ArrayList<Lzombie/randomizedWorld/randomizedBuilding/RandomizedBuildingBase;>;"
    .field private final randomizedBuildingList Ljava/util/ArrayList; 
    .signature "Ljava/util/ArrayList<Lzombie/randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase;>;"
    .field private final randomizedZoneList Ljava/util/ArrayList; 
    .signature "Ljava/util/ArrayList<Lzombie/randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase;>;"
    .field private final randomizedVehicleStoryList Ljava/util/ArrayList; 
    .field private final rbBasic Lzombie/randomizedWorld/randomizedBuilding/RandomizedBuildingBase; 
    .field private final randomizedWorldBase Lzombie/randomizedWorld/RandomizedWorldBase; 
    .signature "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/util/UUID;>;>;"
    .field private final spawnedZombieZone Ljava/util/HashMap; 
    .signature "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .field private final allTiles Ljava/util/HashMap; 
    .signature "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .field private final tileImages Ljava/util/ArrayList; 
    .field private flashIsoCursorA F 
    .field private flashIsoCursorInc Z 
    .field public sky Lzombie/iso/sprite/SkyBox; 
    .field private static setAnimationRecordingTriggerWatcher Lzombie/PredicatedFileWatcher; 
    .field private static animationRecorderActive Z 
    .field private static animationRecorderDiscard Z 
    .field private timeSinceLastSurvivorInHorde I 
    .field private frameNo I 
    .field public final helicopter Lzombie/iso/Helicopter; 
    .field private hydroPowerOn Z 
    .signature "Ljava/util/ArrayList<Lzombie/characters/IsoGameCharacter;>;"
    .field public final characters Ljava/util/ArrayList; 
    .signature "Ljava/util/ArrayDeque<Lzombie/audio/BaseSoundEmitter;>;"
    .field private final freeEmitters Ljava/util/ArrayDeque; 
    .signature "Ljava/util/ArrayList<Lzombie/audio/BaseSoundEmitter;>;"
    .field private final currentEmitters Ljava/util/ArrayList; 
    .signature "Ljava/util/HashMap<Lzombie/audio/BaseSoundEmitter;Lzombie/iso/IsoObject;>;"
    .field private final emitterOwners Ljava/util/HashMap; 
    .field public x I 
    .field public y I 
    .field public currentCell Lzombie/iso/IsoCell; 
    .field public static instance Lzombie/iso/IsoWorld; 
    .field public totalSurvivorsDead I 
    .field public totalSurvivorNights I 
    .field public survivorSurvivalRecord I 
    .signature "Ljava/util/HashMap<Ljava/lang/Integer;Lzombie/characters/SurvivorDesc;>;"
    .field public survivorDescriptors Ljava/util/HashMap; 
    .signature "Ljava/util/ArrayList<Lzombie/util/AddCoopPlayer;>;"
    .field public addCoopPlayers Ljava/util/ArrayList; 
    .field private static final compScoreToPlayer Lzombie/iso/IsoWorld$CompScoreToPlayer; 
    .field public static mapPath Ljava/lang/String; 
    .field public static mapUseJar Z 
    .field private final loaded Z {value: 0}
    .signature "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .field public static final PropertyValueMap Ljava/util/HashMap; 
    .field private static worldX I 
    .field private static worldY I 
    .field private luaDesc Lzombie/characters/SurvivorDesc; 
    .signature "Ljava/util/List<Lzombie/scripting/objects/CharacterTrait;>;"
    .field private luatraits Ljava/util/List; 
    .field private luaPosX I 
    .field private luaPosY I 
    .field private luaPosZ I 
    .field private spawnRegionName Ljava/lang/String; 
    .field public static final WorldVersion I {value: 241}
    .field public static final WorldVersion_PreviouslyMoved I {value: 196}
    .field public static final WorldVersion_DesignationZone I {value: 197}
    .field public static final WorldVersion_PlayerExtraInfoFlags I {value: 198}
    .field public static final WorldVersion_ObjectID I {value: 199}
    .field public static final WorldVersion_CraftUpdateFoundations I {value: 200}
    .field public static final WorldVersion_AlarmDecay I {value: 201}
    .field public static final WorldVersion_FishingCheat I {value: 202}
    .field public static final WorldVersion_CharacterVoiceType I {value: 203}
    .field public static final WorldVersion_AnimalHutch I {value: 204}
    .field public static final WorldVersion_AlarmClock I {value: 205}
    .field public static final WorldVersion_VariableHeight I {value: 206}
    .field public static final WorldVersion_EnableWorldgen I {value: 207}
    .field public static final WorldVersion_CharacterVoiceOptions I {value: 208}
    .field public static final WorldVersion_ChunksWorldGeneratedBoolean I {value: 209}
    .field public static final WorldVersion_ChunksWorldModifiedBoolean I {value: 210}
    .field public static final WorldVersion_CharacterDiscomfort I {value: 211}
    .field public static final WorldVersion_HutchAndVehicleAnimalFormat I {value: 212}
    .field public static final WorldVersion_IsoCompostHealthValues I {value: 213}
    .field public static final WorldVersion_ChunksAttachmentsState I {value: 214}
    .field public static final WorldVersion_ZoneIDisUUID I {value: 215}
    .field public static final WorldVersion_SafeHouseHitPoints I {value: 216}
    .field public static final WorldVersion_FastMoveCheat I {value: 217}
    .field public static final WorldVersion_SquareSeen I {value: 218}
    .field public static final WorldVersion_TrapExplosionDuration I {value: 219}
    .field public static final WorldVersion_InventoryItemUsesInteger I {value: 220}
    .field public static final WorldVersion_ChunksAttachmentsPartial I {value: 221}
    .field public static final WorldVersion_PrintMediaRottingCorpsesBodyDamage I {value: 222}
    .field public static final WorldVersion_SafeHouseCreatedTimeAndLocation I {value: 223}
    .field public static final WorldVersion_Stats_Idleness I {value: 224}
    .field public static final WorldVersion_AnimalRottingTexture I {value: 225}
    .field public static final WorldVersion_LearnedRecipes I {value: 226}
    .field public static final WorldVersion_BodyDamageSavePoulticeValues I {value: 227}
    .field public static final WorldVersion_PlayerSaveCraftingHistory I {value: 228}
    .field public static final WorldVersion_VehicleAlarm I {value: 229}
    .field public static final WorldVersion_RecipesAndAmmoCheats I {value: 230}
    .field public static final WorldVersion_SavePlayerCheats I {value: 231}
    .field public static final WorldVersion_ItemWorldRotationFloats I {value: 232}
    .field public static final WorldVersion_MetaEntityOutsideAware I {value: 233}
    .field public static final WorldVersion_VisitedFileVersion I {value: 234}
    .field public static final WorldVersion_VariableCraftInputCounts I {value: 235}
    .field public static final WorldVersion_AnimalPetTime I {value: 236}
    .field public static final WorldVersion_RootLocale I {value: 237}
    .field public static final WorldVersion_CraftLogicParallelCrafting I {value: 238}
    .field public static final WorldVersion_PlayerAutoDrink I {value: 239}
    .field public static final WorldVersion_42_13 I {value: 240}
    .field public static final WorldVersion_PlayerInsulation I {value: 241}
    .field public static savedWorldVersion I 
    .field private drawWorld Z 
    .signature "Lzombie/util/list/PZArrayList<Lzombie/characters/IsoZombie;>;"
    .field private final zombieWithModel Lzombie/util/list/PZArrayList; 
    .signature "Lzombie/util/list/PZArrayList<Lzombie/characters/IsoZombie;>;"
    .field private final zombieWithoutModel Lzombie/util/list/PZArrayList; 
    .field private final timSort Lzombie/entity/util/TimSort; 
    .signature "Ljava/util/ArrayList<Lzombie/characters/animals/IsoAnimal;>;"
    .field private final animalWithModel Ljava/util/ArrayList; 
    .signature "Ljava/util/ArrayList<Lzombie/characters/animals/IsoAnimal;>;"
    .field private final animalWithoutModel Ljava/util/ArrayList; 
    .field private final coneTempo1 Lzombie/iso/Vector2; 
    .field private final coneTempo2 Lzombie/iso/Vector2; 
    .field private final coneTempo3 Lzombie/iso/Vector2; 
    .field public static noZombies Z 
    .field public static totalWorldVersion I 
    .field public static saveoffsetx I 
    .field public static saveoffsety I 
    .field public doChunkMapUpdate Z 
    .field private emitterUpdateMs J 
    .field public emitterUpdate Z 
    .field private updateSafehousePlayers I 
    .signature "Ljava/util/concurrent/CompletableFuture<Ljava/lang/Void;>;"
    .field public static animationThread Ljava/util/concurrent/CompletableFuture; 
    .field private rules Lzombie/iso/worldgen/rules/Rules; 
    .field private wgChunk Lzombie/iso/worldgen/WorldGenChunk; 
    .field private blending Lzombie/iso/worldgen/blending/Blending; 
    .field private attachmentsHandler Lzombie/iso/worldgen/attachments/AttachmentsHandler; 
    .field private zoneGenerator Lzombie/iso/worldgen/zones/ZoneGenerator; 
    .field private biomeMap Lzombie/iso/worldgen/maps/BiomeMap; 
    .signature "Ljava/util/List<Lzombie/iso/worldgen/zombie/ZombieVoronoi;>;"
    .field private zombieVoronois Ljava/util/List; 
    .field static final synthetic $assertionsDisabled Z 
    .field private static defaultMaxRenderCount I {value: 510}
    .field private MaxRenderCount S {value: 510}

    .method public setMaxRenderCount (I)V {
        parameters: { this, var1 },
        code: {
        A: 
            aload this
            iload var1
            i2s 
            putfield zombie/iso/IsoWorld.MaxRenderCount S
            return 
        B: 
        }
    }

    .method public getMaxRenderCount ()I {
        parameters: { this },
        code: {
        A: 
            aload this
            getfield zombie/iso/IsoWorld.MaxRenderCount S
            ireturn 
        B: 
        }
    }

    .visible-annotation zombie/UsedFromLua {}
    .method public static setDefaultMaxRenderCount (I)V {
        parameters: { count },
        code: {
        A: 
            iload count
            putstatic zombie/iso/IsoWorld.defaultMaxRenderCount I
        B: 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            ifnull C
        // instance != null, apply immediately
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            iload count
            invokevirtual zombie/iso/IsoWorld.setMaxRenderCount (I)V
        C: 
            return 
        D: 
        }
    }

    .visible-annotation zombie/UsedFromLua {}
    .method public static getDefaultMaxRenderCount ()I {
        code: {
        A: 
            getstatic zombie/iso/IsoWorld.defaultMaxRenderCount I
            ireturn 
        B: 
        }
    }

    .method public getMetaGrid ()Lzombie/iso/IsoMetaGrid; {
        parameters: { this },
        code: {
        A: 
            line 310
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            areturn 
        B: 
        }
    }

    .method public registerZone (Ljava/lang/String;Ljava/lang/String;IIIII)Lzombie/iso/zones/Zone; {
        parameters: { this, name, type, x, y, z, width, height },
        code: {
        A: 
            line 320
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            aload name
            aload type
            iload x
            iload y
            iload z
            iload width
            iload height
            invokevirtual zombie/iso/IsoMetaGrid.registerZone (Ljava/lang/String;Ljava/lang/String;IIIII)Lzombie/iso/zones/Zone;
            areturn 
        B: 
        }
    }

    .visible-annotation java/lang/Deprecated {}
    .method public registerZoneNoOverlap (Ljava/lang/String;Ljava/lang/String;IIIII)Lzombie/iso/zones/Zone; {
        parameters: { this, name, type, x, y, z, width, height },
        code: {
        A: 
            line 326
            aload this
            aload name
            aload type
            iload x
            iload y
            iload z
            iload width
            iload height
            invokevirtual zombie/iso/IsoWorld.registerZone (Ljava/lang/String;Ljava/lang/String;IIIII)Lzombie/iso/zones/Zone;
            areturn 
        B: 
        }
    }

    .method public removeZonesForLotDirectory (Ljava/lang/String;)V {
        parameters: { this, lotDir },
        code: {
        A: 
            line 330
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            aload lotDir
            invokevirtual zombie/iso/IsoMetaGrid.removeZonesForLotDirectory (Ljava/lang/String;)V
        B: 
            line 331
            return 
        C: 
        }
    }

    .method public getFreeEmitter ()Lzombie/audio/BaseSoundEmitter; {
        parameters: { this },
        code: {
        A: 
            line 339
            aload this
            getfield zombie/iso/IsoWorld.freeEmitters Ljava/util/ArrayDeque;
            invokevirtual java/util/ArrayDeque.isEmpty ()Z
            ifeq E
        B: 
            line 340
            getstatic zombie/core/Core.soundDisabled Z
            ifeq C
            new zombie/audio/DummySoundEmitter
            dup 
            invokespecial zombie/audio/DummySoundEmitter.<init> ()V
            goto D
        C: 
            new fmod/fmod/FMODSoundEmitter
            dup 
            invokespecial fmod/fmod/FMODSoundEmitter.<init> ()V
        D: 
            astore e
            goto F
        E: 
            line 342
            aload this
            getfield zombie/iso/IsoWorld.freeEmitters Ljava/util/ArrayDeque;
            invokevirtual java/util/ArrayDeque.pop ()Ljava/lang/Object;
            checkcast zombie/audio/BaseSoundEmitter
            astore e
        F: 
            line 344
            aload this
            getfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
            aload e
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        G: 
            line 345
            aload e
            areturn 
        H: 
        }
    }

    .method public getFreeEmitter (FFF)Lzombie/audio/BaseSoundEmitter; {
        parameters: { this, x, y, z },
        code: {
        A: 
            line 349
            aload this
            invokevirtual zombie/iso/IsoWorld.getFreeEmitter ()Lzombie/audio/BaseSoundEmitter;
            astore e
        B: 
            line 350
            aload e
            fload x
            fload y
            fload z
            invokevirtual zombie/audio/BaseSoundEmitter.setPos (FFF)V
        C: 
            line 351
            aload e
            areturn 
        D: 
        }
    }

    .method public takeOwnershipOfEmitter (Lzombie/audio/BaseSoundEmitter;)V {
        parameters: { this, emitter },
        code: {
        A: 
            line 355
            aload this
            getfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
            aload emitter
            invokevirtual java/util/ArrayList.remove (Ljava/lang/Object;)Z
            pop 
        B: 
            line 356
            return 
        C: 
        }
    }

    .method public setEmitterOwner (Lzombie/audio/BaseSoundEmitter;Lzombie/iso/IsoObject;)V {
        parameters: { this, emitter, object },
        code: {
        A: 
            line 359
            aload emitter
            ifnull B
            aload object
            ifnonnull C
        B: 
            line 360
            return 
        C: 
            line 362
            aload this
            getfield zombie/iso/IsoWorld.emitterOwners Ljava/util/HashMap;
            aload emitter
            invokevirtual java/util/HashMap.containsKey (Ljava/lang/Object;)Z
            ifeq E
        D: 
            line 363
            return 
        E: 
            line 365
            aload this
            getfield zombie/iso/IsoWorld.emitterOwners Ljava/util/HashMap;
            aload emitter
            aload object
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        F: 
            line 366
            return 
        G: 
        }
    }

    .method public returnOwnershipOfEmitter (Lzombie/audio/BaseSoundEmitter;)V {
        parameters: { this, emitter },
        code: {
        A: 
            line 369
            aload emitter
            ifnonnull C
        B: 
            line 370
            return 
        C: 
            line 372
            aload this
            getfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
            aload emitter
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne D
            aload this
            getfield zombie/iso/IsoWorld.freeEmitters Ljava/util/ArrayDeque;
            aload emitter
            invokevirtual java/util/ArrayDeque.contains (Ljava/lang/Object;)Z
            ifeq E
        D: 
            line 373
            return 
        E: 
            line 375
            aload emitter
            invokevirtual zombie/audio/BaseSoundEmitter.isEmpty ()Z
            ifeq I
        F: 
            line 376
            aload emitter
            instanceof fmod/fmod/FMODSoundEmitter
            ifeq H
            aload emitter
            checkcast fmod/fmod/FMODSoundEmitter
            astore fmodSoundEmitter
        G: 
            line 377
            aload fmodSoundEmitter
            invokevirtual fmod/fmod/FMODSoundEmitter.clearParameters ()V
        H: 
            line 379
            aload this
            getfield zombie/iso/IsoWorld.freeEmitters Ljava/util/ArrayDeque;
            aload emitter
            invokevirtual java/util/ArrayDeque.add (Ljava/lang/Object;)Z
            pop 
            goto J
        I: 
            line 381
            aload this
            getfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
            aload emitter
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        J: 
            line 383
            return 
        K: 
        }
    }

    .method public registerVehiclesZone (Ljava/lang/String;Ljava/lang/String;IIIIILse/krka/kahlua/vm/KahluaTable;)Lzombie/iso/zones/Zone; {
        parameters: { this, name, type, x, y, z, width, height, properties },
        code: {
        A: 
            line 386
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            aload name
            aload type
            iload x
            iload y
            iload z
            iload width
            iload height
            aload properties
            invokevirtual zombie/iso/IsoMetaGrid.registerVehiclesZone (Ljava/lang/String;Ljava/lang/String;IIIIILse/krka/kahlua/vm/KahluaTable;)Lzombie/iso/zones/Zone;
            areturn 
        B: 
        }
    }

    .method public registerMannequinZone (Ljava/lang/String;Ljava/lang/String;IIIIILse/krka/kahlua/vm/KahluaTable;)Lzombie/iso/zones/Zone; {
        parameters: { this, name, type, x, y, z, width, height, properties },
        code: {
        A: 
            line 390
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            aload name
            aload type
            iload x
            iload y
            iload z
            iload width
            iload height
            aload properties
            invokevirtual zombie/iso/IsoMetaGrid.registerMannequinZone (Ljava/lang/String;Ljava/lang/String;IIIIILse/krka/kahlua/vm/KahluaTable;)Lzombie/iso/zones/Zone;
            areturn 
        B: 
        }
    }

    .method public registerRoomTone (Ljava/lang/String;Ljava/lang/String;IIIIILse/krka/kahlua/vm/KahluaTable;)V {
        parameters: { this, name, type, x, y, z, width, height, properties },
        code: {
        A: 
            line 394
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            aload name
            aload type
            iload x
            iload y
            iload z
            iload width
            iload height
            aload properties
            invokevirtual zombie/iso/IsoMetaGrid.registerRoomTone (Ljava/lang/String;Ljava/lang/String;IIIIILse/krka/kahlua/vm/KahluaTable;)V
        B: 
            line 395
            return 
        C: 
        }
    }

    .method public registerSpawnOrigin (IIIILse/krka/kahlua/vm/KahluaTable;)V {
        parameters: { this, x, y, width, height, properties },
        code: {
        A: 
            line 398
            getstatic zombie/popman/ZombiePopulationManager.instance Lzombie/popman/ZombiePopulationManager;
            iload x
            iload y
            iload width
            iload height
            aload properties
            invokevirtual zombie/popman/ZombiePopulationManager.registerSpawnOrigin (IIIILse/krka/kahlua/vm/KahluaTable;)V
        B: 
            line 399
            return 
        C: 
        }
    }

    .method public registerWaterFlow (FFFF)V {
        parameters: { this, x, y, flow, speed },
        code: {
        A: 
            line 402
            fload x
            fload y
            fload flow
            fload speed
            invokestatic zombie/iso/IsoWaterFlow.addFlow (FFFF)V
        B: 
            line 403
            return 
        C: 
        }
    }

    .method public registerWaterZone (FFFFFF)V {
        parameters: { this, x1, y1, x2, y2, shore, water_ground },
        code: {
        A: 
            line 406
            fload x1
            fload y1
            fload x2
            fload y2
            fload shore
            fload water_ground
            invokestatic zombie/iso/IsoWaterFlow.addZone (FFFFFF)V
        B: 
            line 407
            return 
        C: 
        }
    }

    .method public checkVehiclesZones ()V {
        parameters: { this },
        code: {
        A: 
            line 410
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/IsoMetaGrid.checkVehiclesZones ()V
        B: 
            line 411
            return 
        C: 
        }
    }

    .method public setGameMode (Ljava/lang/String;)V {
        parameters: { this, mode },
        code: {
        A: 
            line 414
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            aload mode
            invokevirtual zombie/core/Core.setGameMode (Ljava/lang/String;)V
        B: 
            line 415
            ldc "LastStand"
            aload mode
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            putstatic zombie/core/Core.lastStand Z
        C: 
            line 416
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            iconst_0 
            invokevirtual zombie/core/Core.setChallenge (Z)V
        D: 
            line 417
            aconst_null 
            putstatic zombie/core/Core.challengeId Ljava/lang/String;
        E: 
            line 418
            return 
        F: 
        }
    }

    .method public getGameMode ()Ljava/lang/String; {
        parameters: { this },
        code: {
        A: 
            line 421
            getstatic zombie/core/Core.gameMode Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public setPreset (Ljava/lang/String;)V {
        parameters: { this, mode },
        code: {
        A: 
            line 425
            aload mode
            putstatic zombie/core/Core.preset Ljava/lang/String;
        B: 
            line 426
            return 
        C: 
        }
    }

    .method public getPreset ()Ljava/lang/String; {
        parameters: { this },
        code: {
        A: 
            line 429
            getstatic zombie/core/Core.preset Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public setWorld (Ljava/lang/String;)V {
        parameters: { this, world },
        code: {
        A: 
            line 433
            aload world
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            putstatic zombie/core/Core.gameSaveWorld Ljava/lang/String;
        B: 
            line 434
            return 
        C: 
        }
    }

    .method public setMap (Ljava/lang/String;)V {
        parameters: { this, world },
        code: {
        A: 
            line 437
            aload world
            putstatic zombie/core/Core.gameMap Ljava/lang/String;
        B: 
            line 438
            return 
        C: 
        }
    }

    .method public getMap ()Ljava/lang/String; {
        parameters: { this },
        code: {
        A: 
            line 441
            getstatic zombie/core/Core.gameMap Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public renderTerrain ()V {
        parameters: { this },
        code: {
        A: 
            line 458
            return 
        B: 
        }
    }

    .method public getFrameNo ()I {
        parameters: { this },
        code: {
        A: 
            line 461
            aload this
            getfield zombie/iso/IsoWorld.frameNo I
            ireturn 
        B: 
        }
    }

    .method public <init> ()V {
        parameters: { this },
        code: {
        A: 
            line 524
            aload this
            invokespecial java/lang/Object.<init> ()V
        B: 
            line 286
            aload this
            ldc "sunny"
            putfield zombie/iso/IsoWorld.weather Ljava/lang/String;
        C: 
            line 287
            aload this
            new zombie/iso/IsoMetaGrid
            dup 
            invokespecial zombie/iso/IsoMetaGrid.<init> ()V
            putfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
        D: 
            line 288
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
        E: 
            line 289
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
        F: 
            line 290
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
        G: 
            line 291
            aload this
            new zombie/randomizedWorld/randomizedBuilding/RBBasic
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBBasic.<init> ()V
            putfield zombie/iso/IsoWorld.rbBasic Lzombie/randomizedWorld/randomizedBuilding/RandomizedBuildingBase;
        H: 
            line 292
            aload this
            new zombie/randomizedWorld/RandomizedWorldBase
            dup 
            invokespecial zombie/randomizedWorld/RandomizedWorldBase.<init> ()V
            putfield zombie/iso/IsoWorld.randomizedWorldBase Lzombie/randomizedWorld/RandomizedWorldBase;
        I: 
            line 293
            aload this
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            putfield zombie/iso/IsoWorld.spawnedZombieZone Ljava/util/HashMap;
        J: 
            line 294
            aload this
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            putfield zombie/iso/IsoWorld.allTiles Ljava/util/HashMap;
        K: 
            line 295
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.tileImages Ljava/util/ArrayList;
        L: 
            line 296
            aload this
            fconst_1 
            putfield zombie/iso/IsoWorld.flashIsoCursorA F
        M: 
            line 305
            aload this
            sipush 4000
            putfield zombie/iso/IsoWorld.timeSinceLastSurvivorInHorde I
        N: 
            line 313
            aload this
            new zombie/iso/Helicopter
            dup 
            invokespecial zombie/iso/Helicopter.<init> ()V
            putfield zombie/iso/IsoWorld.helicopter Lzombie/iso/Helicopter;
        O: 
            line 317
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.characters Ljava/util/ArrayList;
        P: 
            line 333
            aload this
            new java/util/ArrayDeque
            dup 
            invokespecial java/util/ArrayDeque.<init> ()V
            putfield zombie/iso/IsoWorld.freeEmitters Ljava/util/ArrayDeque;
        Q: 
            line 334
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
        R: 
            line 335
            aload this
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            putfield zombie/iso/IsoWorld.emitterOwners Ljava/util/HashMap;
        S: 
            line 444
            aload this
            bipush 50
            putfield zombie/iso/IsoWorld.x I
        T: 
            line 445
            aload this
            bipush 50
            putfield zombie/iso/IsoWorld.y I
        U: 
            line 454
            aload this
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            putfield zombie/iso/IsoWorld.survivorDescriptors Ljava/util/HashMap;
        V: 
            line 455
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.addCoopPlayers Ljava/util/ArrayList;
        W: 
            line 561
            aload this
            iconst_0 
            putfield zombie/iso/IsoWorld.loaded Z
        X: 
            line 1631
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.luatraits Ljava/util/List;
        Y: 
            line 1633
            aload this
            iconst_m1 
            putfield zombie/iso/IsoWorld.luaPosX I
        Z: 
            line 1634
            aload this
            iconst_m1 
            putfield zombie/iso/IsoWorld.luaPosY I
        AA: 
            line 1635
            aload this
            iconst_m1 
            putfield zombie/iso/IsoWorld.luaPosZ I
        AB: 
            line 1636
            aload this
            ldc ""
            putfield zombie/iso/IsoWorld.spawnRegionName Ljava/lang/String;
        AC: 
            line 2802
            aload this
            iconst_1 
            putfield zombie/iso/IsoWorld.drawWorld Z
        AD: 
            line 2803
            aload this
            new zombie/util/list/PZArrayList
            dup 
            ldc Lzombie/characters/IsoZombie;
            sipush 128
            invokespecial zombie/util/list/PZArrayList.<init> (Ljava/lang/Class;I)V
            putfield zombie/iso/IsoWorld.zombieWithModel Lzombie/util/list/PZArrayList;
        AE: 
            line 2804
            aload this
            new zombie/util/list/PZArrayList
            dup 
            ldc Lzombie/characters/IsoZombie;
            sipush 128
            invokespecial zombie/util/list/PZArrayList.<init> (Ljava/lang/Class;I)V
            putfield zombie/iso/IsoWorld.zombieWithoutModel Lzombie/util/list/PZArrayList;
        AF: 
            line 2805
            aload this
            new zombie/entity/util/TimSort
            dup 
            invokespecial zombie/entity/util/TimSort.<init> ()V
            putfield zombie/iso/IsoWorld.timSort Lzombie/entity/util/TimSort;
        AG: 
            line 2904
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.animalWithModel Ljava/util/ArrayList;
        AH: 
            line 2905
            aload this
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            putfield zombie/iso/IsoWorld.animalWithoutModel Ljava/util/ArrayList;
        AI: 
            line 3055
            aload this
            new zombie/iso/Vector2
            dup 
            invokespecial zombie/iso/Vector2.<init> ()V
            putfield zombie/iso/IsoWorld.coneTempo1 Lzombie/iso/Vector2;
        AJ: 
            line 3056
            aload this
            new zombie/iso/Vector2
            dup 
            invokespecial zombie/iso/Vector2.<init> ()V
            putfield zombie/iso/IsoWorld.coneTempo2 Lzombie/iso/Vector2;
        AK: 
            line 3057
            aload this
            new zombie/iso/Vector2
            dup 
            invokespecial zombie/iso/Vector2.<init> ()V
            putfield zombie/iso/IsoWorld.coneTempo3 Lzombie/iso/Vector2;
        AL: 
            line 3261
            aload this
            iconst_1 
            putfield zombie/iso/IsoWorld.doChunkMapUpdate Z
        AM: 
            line 3266
            aload this
            sipush 200
            putfield zombie/iso/IsoWorld.updateSafehousePlayers I
        AN: 
            line 525
            return 
        AO: 
        }
    }

    .method private static initMessaging ()V {
        code: {
        A: 
            line 528
            getstatic zombie/iso/IsoWorld.setAnimationRecordingTriggerWatcher Lzombie/PredicatedFileWatcher;
            ifnonnull D
        B: 
            line 529
            new zombie/PredicatedFileWatcher
            dup 
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            ldc "Trigger_AnimationRecorder.xml"
            invokevirtual zombie/ZomboidFileSystem.getMessagingDirSub (Ljava/lang/String;)Ljava/lang/String;
            ldc Lzombie/characters/TriggerSetAnimationRecorderFile;
            invokedynamic call ()Lzombie/PredicatedFileWatcher$IPredicatedDataPacketFileWatcherCallback; LambdaMetafactory.metafactory { (Ljava/lang/Object;)V, { invokestatic, zombie/iso/IsoWorld.onTrigger_setAnimationRecorderTriggerFile, (Lzombie/characters/TriggerSetAnimationRecorderFile;)V }, (Lzombie/characters/TriggerSetAnimationRecorderFile;)V }
            invokespecial zombie/PredicatedFileWatcher.<init> (Ljava/lang/String;Ljava/lang/Class;Lzombie/PredicatedFileWatcher$IPredicatedDataPacketFileWatcherCallback;)V
            putstatic zombie/iso/IsoWorld.setAnimationRecordingTriggerWatcher Lzombie/PredicatedFileWatcher;
        C: 
            line 530
            getstatic zombie/DebugFileWatcher.instance Lzombie/DebugFileWatcher;
            getstatic zombie/iso/IsoWorld.setAnimationRecordingTriggerWatcher Lzombie/PredicatedFileWatcher;
            invokevirtual zombie/DebugFileWatcher.add (Lzombie/PredicatedFileWatcher;)V
        D: 
            line 532
            return 
        E: 
        }
    }

    .method private static onTrigger_setAnimationRecorderTriggerFile (Lzombie/characters/TriggerSetAnimationRecorderFile;)V {
        parameters: { triggerXml },
        code: {
        A: 
            line 535
            aload triggerXml
            getfield zombie/characters/TriggerSetAnimationRecorderFile.isRecording Z
            putstatic zombie/iso/IsoWorld.animationRecorderActive Z
        B: 
            line 536
            aload triggerXml
            getfield zombie/characters/TriggerSetAnimationRecorderFile.discard Z
            putstatic zombie/iso/IsoWorld.animationRecorderDiscard Z
        C: 
            line 537
            return 
        D: 
        }
    }

    .method public static isAnimRecorderActive ()Z {
        code: {
        A: 
            line 540
            getstatic zombie/iso/IsoWorld.animationRecorderActive Z
            ireturn 
        B: 
        }
    }

    .method public static isAnimRecorderDiscardTriggered ()Z {
        code: {
        A: 
            line 544
            getstatic zombie/iso/IsoWorld.animationRecorderDiscard Z
            ireturn 
        B: 
        }
    }

    .method public CreateRandomSurvivor (Lzombie/characters/SurvivorDesc;Lzombie/iso/IsoGridSquare;Lzombie/characters/IsoPlayer;)Lzombie/characters/IsoSurvivor; {
        parameters: { this, desc, sq, player },
        code: {
        A: 
            line 548
            aconst_null 
            areturn 
        B: 
        }
    }

    .method public CreateSwarm (IIIII)V {
        parameters: { this, num, x1, y1, x2, y2 },
        code: {
        A: 
            line 552
            return 
        B: 
        }
    }

    .method public ForceKillAllZombies ()V {
        parameters: { this },
        code: {
        A: 
            line 558
            invokestatic zombie/GameTime.getInstance ()Lzombie/GameTime;
            sipush 1000
            invokevirtual zombie/GameTime.RemoveZombiesIndiscriminate (I)V
        B: 
            line 559
            return 
        C: 
        }
    }

    .method public static readInt (Ljava/io/RandomAccessFile;)I {
        parameters: { in },
        code: {
        A: 
            line 564
            aload in
            invokevirtual java/io/RandomAccessFile.read ()I
            istore ch1
        B: 
            line 565
            aload in
            invokevirtual java/io/RandomAccessFile.read ()I
            istore ch2
        C: 
            line 566
            aload in
            invokevirtual java/io/RandomAccessFile.read ()I
            istore ch3
        D: 
            line 567
            aload in
            invokevirtual java/io/RandomAccessFile.read ()I
            istore ch4
        E: 
            line 568
            iload ch1
            iload ch2
            ior 
            iload ch3
            ior 
            iload ch4
            ior 
            ifge G
        F: 
            line 569
            new java/io/EOFException
            dup 
            invokespecial java/io/EOFException.<init> ()V
            athrow 
        G: 
            line 571
            iload ch1
            iconst_0 
            ishl 
            iload ch2
            bipush 8
            ishl 
            iadd 
            iload ch3
            bipush 16
            ishl 
            iadd 
            iload ch4
            bipush 24
            ishl 
            iadd 
            ireturn 
        H: 
        }
    }

    .method public static readString (Ljava/io/RandomAccessFile;)Ljava/lang/String; {
        parameters: { in },
        code: {
        A: 
            line 575
            aload in
            invokevirtual java/io/RandomAccessFile.readLine ()Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public static readInt (Ljava/io/InputStream;)I {
        parameters: { in },
        code: {
        A: 
            line 579
            aload in
            invokevirtual java/io/InputStream.read ()I
            istore ch1
        B: 
            line 580
            aload in
            invokevirtual java/io/InputStream.read ()I
            istore ch2
        C: 
            line 581
            aload in
            invokevirtual java/io/InputStream.read ()I
            istore ch3
        D: 
            line 582
            aload in
            invokevirtual java/io/InputStream.read ()I
            istore ch4
        E: 
            line 583
            iload ch1
            iload ch2
            ior 
            iload ch3
            ior 
            iload ch4
            ior 
            ifge G
        F: 
            line 584
            new java/io/EOFException
            dup 
            invokespecial java/io/EOFException.<init> ()V
            athrow 
        G: 
            line 586
            iload ch1
            iconst_0 
            ishl 
            iload ch2
            bipush 8
            ishl 
            iadd 
            iload ch3
            bipush 16
            ishl 
            iadd 
            iload ch4
            bipush 24
            ishl 
            iadd 
            ireturn 
        H: 
        }
    }

    .method public static readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String; {
        parameters: { in, input },
        code: {
        A: 
            line 590
            aload input
            iconst_0 
            invokevirtual java/lang/StringBuilder.setLength (I)V
        B: 
            line 591
            iconst_m1 
            istore c
        C: 
            line 592
            iconst_0 
            istore eol
        D: 
            line 594
            iload eol
            ifne K
        E: 
            line 595
            aload in
            invokevirtual java/io/InputStream.read ()I
            dup 
            istore c
            lookupswitch {
                -1: F,
                10: F,
                13: H,
                default: I
            }
        F: 
            line 598
            iconst_1 
            istore eol
        G: 
            line 599
            goto D
        H: 
            line 601
            new java/lang/IllegalStateException
            dup 
            ldc "\u000D\u000A unsupported"
            invokespecial java/lang/IllegalStateException.<init> (Ljava/lang/String;)V
            athrow 
        I: 
            line 603
            aload input
            iload c
            i2c 
            invokevirtual java/lang/StringBuilder.append (C)Ljava/lang/StringBuilder;
            pop 
        J: 
            line 604
            goto D
        K: 
            line 607
            iload c
            iconst_m1 
            if_icmpne M
            aload input
            invokevirtual java/lang/StringBuilder.isEmpty ()Z
            ifeq M
        L: 
            line 608
            aconst_null 
            areturn 
        M: 
            line 610
            aload input
            invokevirtual java/lang/StringBuilder.toString ()Ljava/lang/String;
            areturn 
        N: 
        }
    }

    .method public LoadTileDefinitions (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V {
        parameters: { this, sprMan, filename, fileNumber },
        exceptions: { 
            { E, TS, TT, Ljava/lang/Throwable; }, 
            { TU, TV, TW, Ljava/lang/Throwable; }, 
            { D, TY, TZ, Ljava/lang/Throwable; }, 
            { UA, UB, UC, Ljava/lang/Throwable; }, 
            { C, UE, UF, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 614
            getstatic zombie/debug/DebugLog.DetailedInfo Lzombie/debug/DebugLogStream;
            aload filename
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "tiledef: loading \u0001" }
            invokevirtual zombie/debug/DebugLogStream.trace (Ljava/lang/Object;)V
        B: 
            line 616
            aload filename
            ldc ".patch.tiles"
            invokevirtual java/lang/String.endsWith (Ljava/lang/String;)Z
            istore bPatch
        C: 
            // try-start:   range=[C-UE] handler=UF:java/lang/Exception 
            line 618
            new java/io/FileInputStream
            dup 
            aload filename
            invokespecial java/io/FileInputStream.<init> (Ljava/lang/String;)V
            astore fis
        D: 
            // try-start:   range=[D-TY] handler=TZ:java/lang/Throwable 
            new java/io/BufferedInputStream
            dup 
            aload fis
            invokespecial java/io/BufferedInputStream.<init> (Ljava/io/InputStream;)V
            astore in
        E: 
            // try-start:   range=[E-TS] handler=TT:java/lang/Throwable 
            line 619
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore TDEF
        F: 
            line 621
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore version
        G: 
            line 622
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore numTilesheets
        H: 
            line 624
            new zombie/util/SharedStrings
            dup 
            invokespecial zombie/util/SharedStrings.<init> ()V
            astore sharedStrings
        I: 
            line 625
            new java/lang/StringBuilder
            dup 
            invokespecial java/lang/StringBuilder.<init> ()V
            astore stringBuilder
        J: 
            line 627
            iconst_0 
            istore saveMovableStatsToFile
        K: 
            line 628
            iconst_0 
            istore dumpCustomNameToStdout
        L: 
            line 629
            getstatic zombie/core/Core.debug Z
            ifeq M
            invokestatic zombie/core/Translator.getLanguage ()Lzombie/core/Language;
            invokestatic zombie/core/Translator.getDefaultLanguage ()Lzombie/core/Language;
            if_acmpne M
            iconst_1 
            goto N
        M: 
            iconst_0 
        N: 
            istore dumpUntranslatedCustomNameToStdout
        O: 
            line 630
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            astore buffer
        P: 
            line 631
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            astore groupMap
        Q: 
            line 633
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            astore faceMap
        R: 
            line 634
            iconst_4 
            anewarray java/lang/String
            dup 
            iconst_0 
            ldc "N"
            aastore 
            dup 
            iconst_1 
            ldc "E"
            aastore 
            dup 
            iconst_2 
            ldc "S"
            aastore 
            dup 
            iconst_3 
            ldc "W"
            aastore 
            astore faceNames
        S: 
            line 635
            iconst_0 
            istore i
        T: 
            iload i
            aload faceNames
            arraylength 
            if_icmpge W
        U: 
            line 636
            aload faceMap
            aload faceNames
            iload i
            aaload 
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            invokeinterface java/util/Map.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        V: 
            line 635
            iinc i 1
            goto T
        W: 
            line 638
            new zombie/iso/sprite/SpriteGridParseData
            dup 
            invokespecial zombie/iso/sprite/SpriteGridParseData.<init> ()V
            astore spriteGridParseData
        X: 
            line 639
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            astore uniqueMovables
        Y: 
            line 640
            iconst_0 
            istore movableSpriteCount
        Z: 
            line 641
            iconst_0 
            istore movableOneSpriteCount
        AA: 
            line 642
            iconst_0 
            istore movablesSingleCount
        AB: 
            line 643
            iconst_0 
            istore movablesMultiCount
        AC: 
            line 644
            new java/util/HashSet
            dup 
            invokespecial java/util/HashSet.<init> ()V
            astore customNames
        AD: 
            line 646
            iconst_0 
            istore n
        AE: 
            iload n
            iload numTilesheets
            if_icmpge TG
        AF: 
            line 647
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore str
        AG: 
            line 648
            aload str
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            astore name
        AH: 
            line 649
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore imageName
        AI: 
            line 651
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore wTiles
        AJ: 
            line 652
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore hTiles
        AK: 
            line 654
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore tilesetNumber
        AL: 
            line 656
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore nTiles
        AM: 
            line 658
            iconst_0 
            istore m
        AN: 
            iload m
            iload nTiles
            if_icmpge LM
        AO: 
            line 660
            iload bPatch
            ifeq AS
        AP: 
            line 661
            aload sprMan
            getfield zombie/iso/sprite/IsoSpriteManager.namedMap Ljava/util/HashMap;
            aload name
            iload m
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore spr
        AQ: 
            line 662
            aload spr
            ifnonnull AV
        AR: 
            line 663
            goto LL
        AS: 
            line 665
            iload fileNumber
            iconst_2 
            if_icmpge AU
        AT: 
            line 667
            aload sprMan
            aload name
            iload m
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            iload fileNumber
            bipush 100
            imul 
            sipush 1000
            imul 
            sipush 10000
            iadd 
            iload tilesetNumber
            sipush 1000
            imul 
            iadd 
            iload m
            iadd 
            invokevirtual zombie/iso/sprite/IsoSpriteManager.AddSprite (Ljava/lang/String;I)Lzombie/iso/sprite/IsoSprite;
            astore spr
            goto AV
        AU: 
            line 669
            aload sprMan
            aload name
            iload m
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            iload fileNumber
            sipush 512
            imul 
            sipush 512
            imul 
            iload tilesetNumber
            sipush 512
            imul 
            iadd 
            iload m
            iadd 
            invokevirtual zombie/iso/sprite/IsoSpriteManager.AddSprite (Ljava/lang/String;I)Lzombie/iso/sprite/IsoSprite;
            astore spr
        AV: 
            line 673
            getstatic zombie/core/Core.debug Z
            ifeq BC
        AW: 
            line 674
            aload this
            getfield zombie/iso/IsoWorld.allTiles Ljava/util/HashMap;
            aload name
            invokevirtual java/util/HashMap.containsKey (Ljava/lang/Object;)Z
            ifeq AZ
        AX: 
            line 675
            iload bPatch
            ifne BC
        AY: 
            line 676
            aload this
            getfield zombie/iso/IsoWorld.allTiles Ljava/util/HashMap;
            aload name
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload name
            iload m
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
            goto BC
        AZ: 
            line 679
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            astore newMap
        BA: 
            line 680
            aload newMap
            aload name
            iload m
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BB: 
            line 681
            aload this
            getfield zombie/iso/IsoWorld.allTiles Ljava/util/HashMap;
            aload name
            aload newMap
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        BC: 
            line 685
            aload buffer
            aload spr
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BD: 
            line 686
            iload bPatch
            ifne BH
        BE: 
            line 687
            aload spr
            aload name
            iload m
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            invokevirtual zombie/iso/sprite/IsoSprite.setName (Ljava/lang/String;)V
        BF: 
            line 688
            aload spr
            aload name
            putfield zombie/iso/sprite/IsoSprite.tilesetName Ljava/lang/String;
        BG: 
            line 689
            aload spr
            iload m
            putfield zombie/iso/sprite/IsoSprite.tileSheetIndex I
        BH: 
            line 692
            aload spr
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
            ldc "damaged"
            invokevirtual java/lang/String.contains (Ljava/lang/CharSequence;)Z
            ifne BI
            aload spr
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
            ldc "trash_"
            invokevirtual java/lang/String.contains (Ljava/lang/CharSequence;)Z
            ifeq BK
        BI: 
            line 694
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.attachedFloor Z
        BJ: 
            line 695
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "attachedFloor"
            ldc "true"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        BK: 
            line 698
            aload spr
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
            ldc "f_bushes"
            invokevirtual java/lang/String.startsWith (Ljava/lang/String;)Z
            ifeq BN
            iload m
            bipush 31
            if_icmpgt BN
        BL: 
            line 699
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.isBush Z
        BM: 
            line 700
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.attachedFloor Z
        BN: 
            line 703
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore nProps
        BO: 
            line 704
            iconst_0 
            istore l
        BP: 
            iload l
            iload nProps
            if_icmpge LA
        BQ: 
            line 705
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore str
        BR: 
            line 706
            aload str
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            astore prop
        BS: 
            line 707
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore str
        BT: 
            line 708
            aload str
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            astore val
        BU: 
            line 709
            aload prop
            invokestatic zombie/iso/SpriteDetails/IsoObjectType.FromString (Ljava/lang/String;)Lzombie/iso/SpriteDetails/IsoObjectType;
            astore type
        BV: 
            line 710
            aload type
            getstatic zombie/iso/SpriteDetails/IsoObjectType.MAX Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpeq CD
        BW: 
            line 712
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getType ()Lzombie/iso/SpriteDetails/IsoObjectType;
            getstatic zombie/iso/SpriteDetails/IsoObjectType.doorW Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpeq BX
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getType ()Lzombie/iso/SpriteDetails/IsoObjectType;
            getstatic zombie/iso/SpriteDetails/IsoObjectType.doorN Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpne BY
        BX: 
            aload type
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpne BY
            goto BZ
        BY: 
            line 714
            aload spr
            aload type
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        BZ: 
            line 718
            aload type
            getstatic zombie/iso/SpriteDetails/IsoObjectType.doorW Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpne CB
        CA: 
            line 719
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.doorW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto EO
        CB: 
            line 720
            aload type
            getstatic zombie/iso/SpriteDetails/IsoObjectType.doorN Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpne EO
        CC: 
            line 721
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.doorN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto EO
        CD: 
            line 724
            aload sharedStrings
            aload prop
            invokevirtual zombie/util/SharedStrings.get (Ljava/lang/String;)Ljava/lang/String;
            astore prop
        CE: 
            line 725
            aload prop
            ldc "firerequirement"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CG
        CF: 
            line 726
            aload spr
            aload val
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            putfield zombie/iso/sprite/IsoSprite.firerequirement I
            goto EO
        CG: 
            line 727
            aload prop
            ldc "fireRequirement"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CI
        CH: 
            line 728
            aload spr
            aload val
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            putfield zombie/iso/sprite/IsoSprite.firerequirement I
            goto EO
        CI: 
            line 729
            aload prop
            ldc "BurntTile"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CK
        CJ: 
            line 730
            aload spr
            aload val
            putfield zombie/iso/sprite/IsoSprite.burntTile Ljava/lang/String;
            goto EO
        CK: 
            line 731
            aload prop
            ldc "ForceAmbient"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CN
        CL: 
            line 732
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.forceAmbient Z
        CM: 
            line 733
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        CN: 
            line 734
            aload prop
            ldc "solidfloor"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CQ
        CO: 
            line 735
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.solidfloor Z
        CP: 
            line 736
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        CQ: 
            line 737
            aload prop
            ldc "canBeRemoved"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CT
        CR: 
            line 738
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.canBeRemoved Z
        CS: 
            line 739
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        CT: 
            line 740
            aload prop
            ldc "attachedFloor"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CW
        CU: 
            line 741
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.attachedFloor Z
        CV: 
            line 742
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        CW: 
            line 743
            aload prop
            ldc "cutW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq CZ
        CX: 
            line 744
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        CY: 
            line 745
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        CZ: 
            line 746
            aload prop
            ldc "cutN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DC
        DA: 
            line 747
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
        DB: 
            line 748
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        DC: 
            line 749
            aload prop
            ldc "solid"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DF
        DD: 
            line 750
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.solid Z
        DE: 
            line 751
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        DF: 
            line 752
            aload prop
            ldc "solidtrans"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DI
        DG: 
            line 753
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.solidTrans Z
        DH: 
            line 754
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        DI: 
            line 755
            aload prop
            ldc "invisible"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DL
        DJ: 
            line 756
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.invisible Z
        DK: 
            line 757
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        DL: 
            line 758
            aload prop
            ldc "alwaysDraw"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DO
        DM: 
            line 759
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.alwaysDraw Z
        DN: 
            line 760
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        DO: 
            line 761
            aload prop
            ldc "forceRender"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DR
        DP: 
            line 762
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.forceRender Z
        DQ: 
            line 763
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        DR: 
            line 764
            ldc "FloorHeight"
            aload prop
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DW
        DS: 
            line 765
            ldc "OneThird"
            aload val
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DU
        DT: 
            line 766
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.FloorHeightOneThird Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto EO
        DU: 
            line 767
            ldc "TwoThirds"
            aload val
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq EO
        DV: 
            line 768
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.FloorHeightTwoThirds Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto EO
        DW: 
            line 770
            aload prop
            ldc "MoveWithWind"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq DZ
        DX: 
            line 771
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.moveWithWind Z
        DY: 
            line 772
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        DZ: 
            line 773
            aload prop
            ldc "WindType"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq EC
        EA: 
            line 774
            aload spr
            aload val
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            putfield zombie/iso/sprite/IsoSprite.windType I
        EB: 
            line 775
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        EC: 
            line 776
            aload prop
            ldc "RenderLayer"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq EI
        ED: 
            line 777
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        EE: 
            line 778
            ldc "Default"
            aload val
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq EG
        EF: 
            line 779
            aload spr
            iconst_0 
            putfield zombie/iso/sprite/IsoSprite.renderLayer B
            goto EO
        EG: 
            line 780
            ldc "Floor"
            aload val
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq EO
        EH: 
            line 781
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.renderLayer B
            goto EO
        EI: 
            line 783
            aload prop
            ldc "TreatAsWallOrder"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq EL
        EJ: 
            line 784
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.treatAsWallOrder Z
        EK: 
            line 785
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
            goto EO
        EL: 
            line 787
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        EM: 
            line 790
            ldc "WindowN"
            aload prop
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifne EN
            ldc "WindowW"
            aload prop
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq EO
        EN: 
            line 791
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
        EO: 
            line 795
            aload type
            getstatic zombie/iso/SpriteDetails/IsoObjectType.tree Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpne FE
        EP: 
            line 796
            aload spr
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
            ldc "e_riverbirch_1_1"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq ER
        EQ: 
            line 797
            ldc "1"
            astore val
        ER: 
            line 799
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "tree"
            aload val
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        ES: 
            line 800
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.solid Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.unset (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        ET: 
            line 801
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.blocksight Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        EU: 
            line 803
            aload val
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore size
        EV: 
            line 804
            aload name
            ldc "vegetation_trees"
            invokevirtual java/lang/String.startsWith (Ljava/lang/String;)Z
            ifeq EX
        EW: 
            line 805
            iconst_4 
            istore size
        EX: 
            line 807
            iload size
            iconst_1 
            if_icmpge EZ
        EY: 
            line 808
            iconst_1 
            istore size
        EZ: 
            line 810
            iload size
            iconst_4 
            if_icmple FB
        FA: 
            line 811
            iconst_4 
            istore size
        FB: 
            line 813
            iload size
            iconst_1 
            if_icmpeq FC
            iload size
            iconst_2 
            if_icmpne FD
        FC: 
            line 814
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.blocksight Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.unset (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FD: 
            line 816
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "MaterialType"
            ldc "Wood_Solid"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        FE: 
            line 818
            aload prop
            ldc "interior"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq FG
            aload val
            ldc "false"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq FG
        FF: 
            line 819
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.exterior Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FG: 
            line 821
            aload prop
            ldc "HoppableN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq FK
        FH: 
            line 822
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FI: 
            line 823
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.canPathN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FJ: 
            line 824
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FK: 
            line 826
            aload prop
            ldc "HoppableW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq FO
        FL: 
            line 827
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FM: 
            line 828
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.canPathW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FN: 
            line 829
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FO: 
            line 831
            aload prop
            ldc "WallN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq FU
        FP: 
            line 832
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FQ: 
            line 833
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        FR: 
            line 834
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        FS: 
            line 835
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
        FT: 
            line 837
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WallN"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
        FU: 
            line 839
            aload prop
            ldc "CantClimb"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq FW
        FV: 
            line 840
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.CantClimb Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto KX
        FW: 
            line 841
            aload prop
            ldc "container"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq FY
        FX: 
            line 842
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload prop
            aload val
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        FY: 
            line 843
            aload prop
            ldc "WallNTrans"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq GF
        FZ: 
            line 844
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GA: 
            line 845
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GB: 
            line 846
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GC: 
            line 847
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        GD: 
            line 848
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
        GE: 
            line 850
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WallNTrans"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        GF: 
            line 851
            aload prop
            ldc "WallW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq GL
        GG: 
            line 852
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GH: 
            line 853
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GI: 
            line 854
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        GJ: 
            line 855
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        GK: 
            line 857
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WallW"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        GL: 
            line 858
            aload prop
            ldc "windowN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq GP
        GM: 
            line 859
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WindowN"
            ldc "WindowN"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        GN: 
            line 860
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GO: 
            line 862
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WindowN"
            ldc "WindowN"
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        GP: 
            line 863
            aload prop
            ldc "windowW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq GT
        GQ: 
            line 864
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WindowW"
            ldc "WindowW"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        GR: 
            line 865
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GS: 
            line 867
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WindowW"
            ldc "WindowW"
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        GT: 
            line 868
            aload prop
            ldc "cutW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq GW
        GU: 
            line 869
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GV: 
            line 870
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
            goto KX
        GW: 
            line 871
            aload prop
            ldc "cutN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq GZ
        GX: 
            line 872
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        GY: 
            line 873
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
            goto KX
        GZ: 
            line 874
            aload prop
            ldc "WallWTrans"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq HG
        HA: 
            line 875
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HB: 
            line 876
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HC: 
            line 877
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HD: 
            line 878
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        HE: 
            line 879
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        HF: 
            line 881
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WallWTrans"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        HG: 
            line 882
            aload prop
            ldc "DoorWallN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq HK
        HH: 
            line 883
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HI: 
            line 884
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
        HJ: 
            line 886
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "DoorWallN"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        HK: 
            line 887
            aload prop
            ldc "DoorWallNTrans"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq HP
        HL: 
            line 888
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HM: 
            line 889
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HN: 
            line 890
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
        HO: 
            line 892
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "DoorWallNTrans"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        HP: 
            line 893
            aload prop
            ldc "DoorWallW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq HT
        HQ: 
            line 894
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HR: 
            line 895
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        HS: 
            line 897
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "DoorWallW"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        HT: 
            line 898
            aload prop
            ldc "DoorWallWTrans"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq HY
        HU: 
            line 899
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HV: 
            line 900
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        HW: 
            line 901
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        HX: 
            line 903
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "DoorWallWTrans"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        HY: 
            line 904
            aload prop
            ldc "WallNW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq IH
        HZ: 
            line 905
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IA: 
            line 906
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IB: 
            line 907
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IC: 
            line 908
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        ID: 
            line 909
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        IE: 
            line 910
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        IF: 
            line 911
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
        IG: 
            line 913
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WallNW"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        IH: 
            line 914
            aload prop
            ldc "WallNWTrans"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq IS
        II: 
            line 915
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IJ: 
            line 916
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IK: 
            line 917
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IL: 
            line 918
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IM: 
            line 919
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IN: 
            line 920
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IO: 
            line 921
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        IP: 
            line 922
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        IQ: 
            line 923
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
        IR: 
            line 925
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WallNWTrans"
            ldc ""
            iconst_0 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;Z)V
            goto KX
        IS: 
            line 926
            aload prop
            ldc "WallSE"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq IX
        IT: 
            line 927
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IU: 
            line 928
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.WallSE Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IV: 
            line 929
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "WallSE"
            ldc "WallSE"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        IW: 
            line 930
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
            goto KX
        IX: 
            line 931
            aload prop
            ldc "WindowW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq JI
        IY: 
            line 932
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.canPathW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        IZ: 
            line 933
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JA: 
            line 934
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JB: 
            line 935
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JC: 
            line 936
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.windowFW Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        JD: 
            line 937
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.HoppableW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.has (Lzombie/iso/SpriteDetails/IsoFlagType;)Z
            ifeq JH
        JE: 
            line 938
            getstatic zombie/core/Core.debug Z
            ifeq JG
        JF: 
            line 939
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getName ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "ERROR: WindowW sprite shouldn\'t have HoppableW (\u0001)" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        JG: 
            line 941
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.HoppableW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.unset (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JH: 
            line 943
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
            goto KX
        JI: 
            line 944
            aload prop
            ldc "WindowN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq JT
        JJ: 
            line 945
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.canPathN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JK: 
            line 946
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JL: 
            line 947
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JM: 
            line 948
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JN: 
            line 949
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.windowFN Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        JO: 
            line 950
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.HoppableN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.has (Lzombie/iso/SpriteDetails/IsoFlagType;)Z
            ifeq JS
        JP: 
            line 951
            getstatic zombie/core/Core.debug Z
            ifeq JR
        JQ: 
            line 952
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getName ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "ERROR: WindowN sprite shouldn\'t have HoppableN (\u0001)" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        JR: 
            line 954
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.HoppableN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.unset (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JS: 
            line 956
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
            goto KX
        JT: 
            line 957
            aload prop
            ldc "UnbreakableWindowW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq KB
        JU: 
            line 958
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.canPathW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JV: 
            line 959
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JW: 
            line 960
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JX: 
            line 961
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JY: 
            line 962
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        JZ: 
            line 963
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        KA: 
            line 964
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
            goto KX
        KB: 
            line 965
            aload prop
            ldc "UnbreakableWindowN"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq KJ
        KC: 
            line 966
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.canPathN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KD: 
            line 967
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KE: 
            line 968
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KF: 
            line 969
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KG: 
            line 970
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KH: 
            line 971
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        KI: 
            line 972
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
            goto KX
        KJ: 
            line 973
            aload prop
            ldc "UnbreakableWindowNW"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq KT
        KK: 
            line 974
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KL: 
            line 975
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.transparentN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KM: 
            line 976
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KN: 
            line 977
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KO: 
            line 978
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.collideW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KP: 
            line 979
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.cutW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KQ: 
            line 980
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.wall Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        KR: 
            line 981
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutW Z
        KS: 
            line 982
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.cutN Z
            goto KX
        KT: 
            line 983
            ldc "NoWallLighting"
            aload prop
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq KV
        KU: 
            line 984
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.NoWallLighting Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto KX
        KV: 
            line 985
            ldc "ForceAmbient"
            aload prop
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq KX
        KW: 
            line 986
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.ForceAmbient Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        KX: 
            line 988
            aload prop
            ldc "name"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq KZ
        KY: 
            line 989
            aload spr
            aload val
            invokevirtual zombie/iso/sprite/IsoSprite.setParentObjectName (Ljava/lang/String;)V
        KZ: 
            line 704
            iinc l 1
            goto BP
        LA: 
            line 993
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightR"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifne LB
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightG"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifne LB
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightB"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq LH
        LB: 
            line 995
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightR"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifne LD
        LC: 
            line 996
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightR"
            ldc "0"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        LD: 
            line 998
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightG"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifne LF
        LE: 
            line 999
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightG"
            ldc "0"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        LF: 
            line 1001
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightB"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifne LH
        LG: 
            line 1002
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "lightB"
            ldc "0"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        LH: 
            line 1005
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            invokevirtual zombie/core/properties/PropertyContainer.CreateKeySet ()V
        LI: 
            line 1006
            getstatic zombie/core/Core.debug Z
            ifeq LL
        LJ: 
            line 1007
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SmashedTileOffset"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq LL
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "GlassRemovedOffset"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifne LL
        LK: 
            line 1008
            getstatic zombie/debug/DebugLog.Sprite Lzombie/debug/DebugLogStream;
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getName ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Window sprite has SmashedTileOffset but no GlassRemovedOffset (\u0001)" }
            invokevirtual zombie/debug/DebugLogStream.error (Ljava/lang/Object;)V
        LL: 
            line 658
            iinc m 1
            goto AN
        LM: 
            line 1013
            aload this
            aload name
            aload buffer
            invokevirtual zombie/iso/IsoWorld.setOpenDoorProperties (Ljava/lang/String;Ljava/util/ArrayList;)V
        LN: 
            line 1016
            aload groupMap
            invokeinterface java/util/Map.clear ()V
        LO: 
            line 1017
            aload buffer
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v34
        LP: 
            aload v34
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq MU
            aload v34
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore spr
        LQ: 
            line 1018
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "StopCar"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq LS
        LR: 
            line 1019
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.isMoveAbleObject Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        LS: 
            line 1021
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "IsMoveAble"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq MK
        LT: 
            line 1022
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq LU
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            ldc ""
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq LW
        LU: 
            line 1023
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "[IMPORTANT] MOVABLES: Object has no custom name defined: sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        LV: 
            line 1024
            goto LP
        LW: 
            line 1026
            iinc movableSpriteCount 1
        LX: 
            line 1028
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "GroupName"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq ME
        LY: 
            line 1029
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "GroupName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001 \u0001" }
            astore group
        LZ: 
            line 1030
            aload groupMap
            aload group
            invokeinterface java/util/Map.containsKey (Ljava/lang/Object;)Z
            ifne MB
        MA: 
            line 1031
            aload groupMap
            aload group
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            invokeinterface java/util/Map.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        MB: 
            line 1034
            aload groupMap
            aload group
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload spr
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        MC: 
            line 1036
            aload customNames
            aload group
            invokevirtual java/util/HashSet.add (Ljava/lang/Object;)Z
            pop 
        MD: 
            line 1037
            goto MT
        ME: 
            line 1038
            aload uniqueMovables
            aload name
            invokeinterface java/util/Map.containsKey (Ljava/lang/Object;)Z
            ifne MG
        MF: 
            line 1039
            aload uniqueMovables
            aload name
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            invokeinterface java/util/Map.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        MG: 
            line 1042
            aload uniqueMovables
            aload name
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne MI
        MH: 
            line 1043
            aload uniqueMovables
            aload name
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        MI: 
            line 1045
            iinc movableOneSpriteCount 1
        MJ: 
            line 1047
            aload customNames
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            invokevirtual java/util/HashSet.add (Ljava/lang/Object;)Z
            pop 
            goto MT
        MK: 
            line 1051
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridPos"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq MT
        ML: 
            line 1052
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            invokestatic zombie/util/StringUtils.isNullOrWhitespace (Ljava/lang/String;)Z
            ifeq MO
        MM: 
            line 1053
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "[IMPORTANT] MOVABLES: Object has no custom name defined: sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        MN: 
            line 1054
            goto LP
        MO: 
            line 1056
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "GroupName"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq MT
        MP: 
            line 1057
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "GroupName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "CustomName"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001 \u0001" }
            astore group
        MQ: 
            line 1058
            aload groupMap
            aload group
            invokeinterface java/util/Map.containsKey (Ljava/lang/Object;)Z
            ifne MS
        MR: 
            line 1059
            aload groupMap
            aload group
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            invokeinterface java/util/Map.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        MS: 
            line 1061
            aload groupMap
            aload group
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload spr
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        MT: 
            line 1064
            goto LP
        MU: 
            line 1066
            aload groupMap
            invokeinterface java/util/Map.entrySet ()Ljava/util/Set;
            invokeinterface java/util/Set.iterator ()Ljava/util/Iterator;
            astore v34
        MV: 
            aload v34
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq TE
            aload v34
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast java/util/Map$Entry
            astore entry
        MW: 
            line 1067
            aload entry
            invokeinterface java/util/Map$Entry.getKey ()Ljava/lang/Object;
            checkcast java/lang/String
            astore fullgroup
        MX: 
            line 1069
            aload uniqueMovables
            aload name
            invokeinterface java/util/Map.containsKey (Ljava/lang/Object;)Z
            ifne MZ
        MY: 
            line 1070
            aload uniqueMovables
            aload name
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            invokeinterface java/util/Map.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        MZ: 
            line 1073
            aload uniqueMovables
            aload name
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload fullgroup
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne NB
        NA: 
            line 1074
            aload uniqueMovables
            aload name
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload fullgroup
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        NB: 
            line 1077
            aload entry
            invokeinterface java/util/Map$Entry.getValue ()Ljava/lang/Object;
            checkcast java/util/ArrayList
            astore members
        NC: 
            line 1079
            aload members
            invokevirtual java/util/ArrayList.size ()I
            iconst_1 
            if_icmpne NE
        ND: 
            line 1080
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Object has only one face defined for group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        NE: 
            line 1082
            aload members
            invokevirtual java/util/ArrayList.size ()I
            iconst_3 
            if_icmpne NG
        NF: 
            line 1083
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Object only has 3 sprites, _might_ have a error in settings, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        NG: 
            line 1087
            aload faceNames
            astore v38
            aload v38
            arraylength 
            istore i39
            iconst_0 
            istore i40
        NH: 
            iload i40
            iload i39
            if_icmpge NK
            aload v38
            iload i40
            aaload 
            astore faceName
        NI: 
            line 1088
            aload faceMap
            aload faceName
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            invokevirtual java/util/ArrayList.clear ()V
        NJ: 
            line 1087
            iinc i40 1
            goto NH
        NK: 
            line 1091
            aload members
            iconst_0 
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridPos"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq NL
            aload members
            iconst_0 
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridPos"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            ldc "None"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifne NL
            iconst_1 
            goto NM
        NL: 
            iconst_0 
        NM: 
            istore isSpriteGrid
        NN: 
            line 1092
            iconst_1 
            istore isValid
        NO: 
            line 1093
            aload members
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v40
        NP: 
            aload v40
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq OT
            aload v40
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore current
        NQ: 
            line 1094
            aload current
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridPos"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq NR
            aload current
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridPos"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            ldc "None"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifne NR
            iconst_1 
            goto NS
        NR: 
            iconst_0 
        NS: 
            istore testIsSpriteGrid
        NT: 
            line 1095
            iload isSpriteGrid
            iload testIsSpriteGrid
            if_icmpeq NX
        NU: 
            line 1096
            iconst_0 
            istore isValid
        NV: 
            line 1097
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Difference in SpriteGrid settings for members of group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        NW: 
            line 1098
            goto OT
        NX: 
            line 1100
            aload current
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "Facing"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifne NZ
        NY: 
            line 1101
            iconst_0 
            istore isValid
            goto OP
        NZ: 
            line 1103
            aload current
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "Facing"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            astore v43
            iconst_m1 
            istore i44
            aload v43
            invokevirtual java/lang/String.hashCode ()I
            lookupswitch {
                69: OB,
                78: OA,
                83: OC,
                87: OD,
                default: OE
            }
        OA: 
            aload v43
            ldc "N"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq OE
            iconst_0 
            istore i44
            goto OE
        OB: 
            aload v43
            ldc "E"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq OE
            iconst_1 
            istore i44
            goto OE
        OC: 
            aload v43
            ldc "S"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq OE
            iconst_2 
            istore i44
            goto OE
        OD: 
            aload v43
            ldc "W"
            invokevirtual java/lang/String.equals (Ljava/lang/Object;)Z
            ifeq OE
            iconst_3 
            istore i44
        OE: 
            iload i44
            tableswitch {
                min: 0,
                max: 4,
                cases: { OF, OH, OJ, OL },
                default: ON
            }
        OF: 
            line 1105
            aload faceMap
            ldc "N"
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload current
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        OG: 
            line 1106
            goto OP
        OH: 
            line 1108
            aload faceMap
            ldc "E"
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload current
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        OI: 
            line 1109
            goto OP
        OJ: 
            line 1111
            aload faceMap
            ldc "S"
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload current
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        OK: 
            line 1112
            goto OP
        OL: 
            line 1114
            aload faceMap
            ldc "W"
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            aload current
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        OM: 
            line 1115
            goto OP
        ON: 
            line 1117
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload current
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "Facing"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Invalid face (\u0001) for group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        OO: 
            line 1118
            iconst_0 
            istore isValid
        OP: 
            line 1122
            iload isValid
            ifne OS
        OQ: 
            line 1123
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Not all members have a valid face defined for group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        OR: 
            line 1124
            goto OT
        OS: 
            line 1126
            goto NP
        OT: 
            line 1127
            iload isValid
            ifne OV
        OU: 
            line 1128
            goto MV
        OV: 
            line 1131
            iload isSpriteGrid
            ifne PS
        OW: 
            line 1132
            aload members
            invokevirtual java/util/ArrayList.size ()I
            iconst_4 
            if_icmple OZ
        OX: 
            line 1133
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Object has too many faces defined for group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        OY: 
            line 1134
            goto MV
        OZ: 
            line 1137
            aload faceNames
            astore v40
            aload v40
            arraylength 
            istore i41
            iconst_0 
            istore i42
        PA: 
            iload i42
            iload i41
            if_icmpge PF
            aload v40
            iload i42
            aaload 
            astore faceName
        PB: 
            line 1138
            aload faceMap
            aload faceName
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            invokevirtual java/util/ArrayList.size ()I
            iconst_1 
            if_icmple PE
        PC: 
            line 1139
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload faceName
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: \u0001 face defined more than once for group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        PD: 
            line 1140
            iconst_0 
            istore isValid
        PE: 
            line 1137
            iinc i42 1
            goto PA
        PF: 
            line 1143
            iload isValid
            ifne PH
        PG: 
            line 1144
            goto MV
        PH: 
            line 1147
            iinc movablesSingleCount 1
        PI: 
            line 1148
            aload members
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v40
        PJ: 
            aload v40
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq PR
            aload v40
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore current
        PK: 
            line 1149
            aload faceNames
            astore v42
            aload v42
            arraylength 
            istore i43
            iconst_0 
            istore i44
        PL: 
            iload i44
            iload i43
            if_icmpge PQ
            aload v42
            iload i44
            aaload 
            astore faceName
        PM: 
            line 1150
            aload faceMap
            aload faceName
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            astore direction
        PN: 
            line 1151
            aload direction
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifne PP
            aload direction
            iconst_0 
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            aload current
            if_acmpeq PP
        PO: 
            line 1152
            aload current
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload faceName
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001offset" }
            aload buffer
            aload direction
            iconst_0 
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            invokevirtual java/util/ArrayList.indexOf (Ljava/lang/Object;)I
            aload buffer
            aload current
            invokevirtual java/util/ArrayList.indexOf (Ljava/lang/Object;)I
            isub 
            invokestatic java/lang/Integer.toString (I)Ljava/lang/String;
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        PP: 
            line 1149
            iinc i44 1
            goto PL
        PQ: 
            line 1155
            goto PJ
        PR: 
            goto TD
        PS: 
            line 1157
            iconst_0 
            istore sprCount
        PT: 
            line 1158
            aload faceNames
            arraylength 
            anewarray zombie/iso/sprite/IsoSpriteGrid
            astore grids
        PU: 
            line 1160
            iconst_0 
            istore i
        PV: 
            iload i
            aload faceNames
            arraylength 
            if_icmpge SI
        PW: 
            line 1161
            aload faceMap
            aload faceNames
            iload i
            aaload 
            invokeinterface java/util/Map.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            astore direction
        PX: 
            line 1162
            aload direction
            invokevirtual java/util/ArrayList.isEmpty ()Z
            ifeq PZ
        PY: 
            line 1163
            goto SH
        PZ: 
            line 1165
            iload sprCount
            ifne QB
        QA: 
            line 1166
            aload direction
            invokevirtual java/util/ArrayList.size ()I
            istore sprCount
        QB: 
            line 1168
            iload sprCount
            aload direction
            invokevirtual java/util/ArrayList.size ()I
            if_icmpeq QF
        QC: 
            line 1169
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Sprite count mismatch for multi sprite movable, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        QD: 
            line 1170
            iconst_0 
            istore isValid
        QE: 
            line 1171
            goto SI
        QF: 
            line 1173
            aload spriteGridParseData
            invokevirtual zombie/iso/sprite/SpriteGridParseData.clear ()V
        QG: 
            line 1174
            aload direction
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v44
        QH: 
            aload v44
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq RK
            aload v44
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore mem
        QI: 
            line 1175
            aload mem
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridPos"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            astore pos
        QJ: 
            line 1176
            aload pos
            ldc ","
            invokevirtual java/lang/String.split (Ljava/lang/String;)[Ljava/lang/String;
            astore parts
        QK: 
            line 1177
            aload parts
            arraylength 
            iconst_2 
            if_icmplt QL
            aload parts
            arraylength 
            iconst_3 
            if_icmple QO
        QL: 
            line 1178
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: SpriteGrid position error for multi sprite movable, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        QM: 
            line 1179
            iconst_0 
            istore isValid
        QN: 
            line 1180
            goto RK
        QO: 
            line 1182
            aload parts
            iconst_0 
            aaload 
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore x
        QP: 
            line 1183
            aload parts
            iconst_1 
            aaload 
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore y
        QQ: 
            line 1184
            iconst_0 
            istore spriteGridZ
        QR: 
            line 1185
            aload parts
            arraylength 
            iconst_3 
            if_icmpne QT
        QS: 
            line 1186
            aload parts
            iconst_2 
            aaload 
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore spriteGridZ
        QT: 
            line 1188
            aload mem
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridLevel"
            invokevirtual zombie/core/properties/PropertyContainer.has (Ljava/lang/String;)Z
            ifeq QZ
        QU: 
            line 1189
            aload mem
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "SpriteGridLevel"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore spriteGridZ
        QV: 
            line 1190
            iload spriteGridZ
            ifge QZ
        QW: 
            line 1191
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: invalid SpriteGirdLevel for multi sprite movable, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        QX: 
            line 1192
            iconst_0 
            istore isValid
        QY: 
            line 1193
            goto RK
        QZ: 
            line 1196
            aload spriteGridParseData
            iload spriteGridZ
            invokevirtual zombie/iso/sprite/SpriteGridParseData.getOrCreateLevel (I)Lzombie/iso/sprite/SpriteGridParseData$Level;
            astore levelData
        RA: 
            line 1197
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.xyToSprite Ljava/util/HashMap;
            aload pos
            invokevirtual java/util/HashMap.containsKey (Ljava/lang/Object;)Z
            ifne RC
        RB: 
            line 1198
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.xyToSprite Ljava/util/HashMap;
            aload pos
            aload mem
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
            goto RF
        RC: 
            line 1200
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload pos
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: double SpriteGrid position (\u0001) for multi sprite movable, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        RD: 
            line 1201
            iconst_0 
            istore isValid
        RE: 
            line 1202
            goto RK
        RF: 
            line 1204
            aload levelData
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.width I
            iload x
            iconst_1 
            iadd 
            invokestatic zombie/core/math/PZMath.max (II)I
            putfield zombie/iso/sprite/SpriteGridParseData$Level.width I
        RG: 
            line 1205
            aload levelData
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.height I
            iload y
            iconst_1 
            iadd 
            invokestatic zombie/core/math/PZMath.max (II)I
            putfield zombie/iso/sprite/SpriteGridParseData$Level.height I
        RH: 
            line 1206
            aload spriteGridParseData
            aload spriteGridParseData
            getfield zombie/iso/sprite/SpriteGridParseData.width I
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.width I
            invokestatic zombie/core/math/PZMath.max (II)I
            putfield zombie/iso/sprite/SpriteGridParseData.width I
        RI: 
            line 1207
            aload spriteGridParseData
            aload spriteGridParseData
            getfield zombie/iso/sprite/SpriteGridParseData.height I
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.height I
            invokestatic zombie/core/math/PZMath.max (II)I
            putfield zombie/iso/sprite/SpriteGridParseData.height I
        RJ: 
            line 1208
            goto QH
        RK: 
            line 1209
            iload isValid
            ifne RM
        RL: 
            line 1210
            goto SI
        RM: 
            line 1212
            aload spriteGridParseData
            invokevirtual zombie/iso/sprite/SpriteGridParseData.isValid ()Z
            ifne RQ
        RN: 
            line 1213
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: SpriteGrid dimensions error for multi sprite movable, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        RO: 
            line 1214
            iconst_0 
            istore isValid
        RP: 
            line 1215
            goto SI
        RQ: 
            line 1218
            aload grids
            iload i
            new zombie/iso/sprite/IsoSpriteGrid
            dup 
            aload spriteGridParseData
            getfield zombie/iso/sprite/SpriteGridParseData.width I
            aload spriteGridParseData
            getfield zombie/iso/sprite/SpriteGridParseData.height I
            aload spriteGridParseData
            getfield zombie/iso/sprite/SpriteGridParseData.levels Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            invokespecial zombie/iso/sprite/IsoSpriteGrid.<init> (III)V
            aastore 
        RR: 
            line 1219
            aload spriteGridParseData
            getfield zombie/iso/sprite/SpriteGridParseData.levels Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v44
        RS: 
            aload v44
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq SD
            aload v44
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/iso/sprite/SpriteGridParseData$Level
            astore levelData
        RT: 
            line 1220
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.xyToSprite Ljava/util/HashMap;
            invokevirtual java/util/HashMap.entrySet ()Ljava/util/Set;
            invokeinterface java/util/Set.iterator ()Ljava/util/Iterator;
            astore v46
        RU: 
            aload v46
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq SC
            aload v46
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast java/util/Map$Entry
            astore entry1
        RV: 
            line 1221
            aload entry1
            invokeinterface java/util/Map$Entry.getKey ()Ljava/lang/Object;
            checkcast java/lang/String
            astore pos
        RW: 
            line 1222
            aload entry1
            invokeinterface java/util/Map$Entry.getValue ()Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore sprite
        RX: 
            line 1223
            aload pos
            ldc ","
            invokevirtual java/lang/String.split (Ljava/lang/String;)[Ljava/lang/String;
            astore parts
        RY: 
            line 1224
            aload parts
            iconst_0 
            aaload 
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore x
        RZ: 
            line 1225
            aload parts
            iconst_1 
            aaload 
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore y
        SA: 
            line 1226
            aload grids
            iload i
            aaload 
            iload x
            iload y
            aload levelData
            getfield zombie/iso/sprite/SpriteGridParseData$Level.z I
            aload sprite
            invokevirtual zombie/iso/sprite/IsoSpriteGrid.setSprite (IIILzombie/iso/sprite/IsoSprite;)V
        SB: 
            line 1227
            goto RU
        SC: 
            line 1228
            goto RS
        SD: 
            line 1230
            aload grids
            iload i
            aaload 
            invokevirtual zombie/iso/sprite/IsoSpriteGrid.validate ()Z
            ifne SH
        SE: 
            line 1231
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: SpriteGrid didn\'t validate for multi sprite movable, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        SF: 
            line 1232
            iconst_0 
            istore isValid
        SG: 
            line 1233
            goto SI
        SH: 
            line 1160
            iinc i 1
            goto PV
        SI: 
            line 1236
            iload isValid
            ifeq SJ
            iload sprCount
            ifne SL
        SJ: 
            line 1237
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            aload fullgroup
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "MOVABLES: Error in multi sprite movable, group: (\u0001) sheet = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        SK: 
            line 1238
            goto MV
        SL: 
            line 1241
            iinc movablesMultiCount 1
        SM: 
            line 1243
            iconst_0 
            istore i
        SN: 
            iload i
            aload faceNames
            arraylength 
            if_icmpge TD
        SO: 
            line 1244
            aload grids
            iload i
            aaload 
            astore grid
        SP: 
            line 1245
            aload grid
            ifnull TC
        SQ: 
            line 1246
            aload grid
            invokevirtual zombie/iso/sprite/IsoSpriteGrid.getSprites ()[Lzombie/iso/sprite/IsoSprite;
            astore v44
            aload v44
            arraylength 
            istore i45
            iconst_0 
            istore i46
        SR: 
            iload i46
            iload i45
            if_icmpge TC
            aload v44
            iload i46
            aaload 
            astore member
        SS: 
            line 1247
            aload member
            ifnonnull SU
        ST: 
            line 1248
            goto TB
        SU: 
            line 1250
            aload member
            aload grid
            invokevirtual zombie/iso/sprite/IsoSprite.setSpriteGrid (Lzombie/iso/sprite/IsoSpriteGrid;)V
        SV: 
            line 1251
            iconst_0 
            istore j
        SW: 
            iload j
            aload faceNames
            arraylength 
            if_icmpge TB
        SX: 
            line 1252
            iload j
            iload i
            if_icmpeq TA
            aload grids
            iload j
            aaload 
            ifnull TA
        SY: 
            line 1253
            aload grids
            iload j
            aaload 
            invokevirtual zombie/iso/sprite/IsoSpriteGrid.getAnchorSprite ()Lzombie/iso/sprite/IsoSprite;
            astore anchorSprite
        SZ: 
            line 1254
            aload member
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload faceNames
            iload j
            aaload 
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001offset" }
            aload anchorSprite
            getfield zombie/iso/sprite/IsoSprite.tileSheetIndex I
            aload member
            getfield zombie/iso/sprite/IsoSprite.tileSheetIndex I
            isub 
            invokestatic java/lang/Integer.toString (I)Ljava/lang/String;
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        TA: 
            line 1251
            iinc j 1
            goto SW
        TB: 
            line 1246
            iinc i46 1
            goto SR
        TC: 
            line 1243
            iinc i 1
            goto SN
        TD: 
            line 1261
            goto MV
        TE: 
            line 1262
            aload buffer
            invokevirtual java/util/ArrayList.clear ()V
        TF: 
            line 646
            iinc n 1
            goto AE
        TG: 
            line 1273
            iload dumpUntranslatedCustomNameToStdout
            ifeq TS
        TH: 
            line 1274
            new java/util/ArrayList
            dup 
            aload customNames
            invokespecial java/util/ArrayList.<init> (Ljava/util/Collection;)V
            astore customNamesSorted
        TI: 
            line 1275
            aload customNamesSorted
            invokestatic java/util/Collections.sort (Ljava/util/List;)V
        TJ: 
            line 1276
            new java/lang/StringBuilder
            dup 
            invokespecial java/lang/StringBuilder.<init> ()V
            astore sb
        TK: 
            line 1277
            aload customNamesSorted
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v28
        TL: 
            aload v28
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq TP
            aload v28
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast java/lang/String
            astore customName
        TM: 
            line 1278
            aload customName
            invokestatic zombie/core/Translator.getMoveableDisplayNameOrNull (Ljava/lang/String;)Ljava/lang/String;
            ifnonnull TO
        TN: 
            line 1279
            aload sb
            aload customName
            ldc " "
            ldc "_"
            invokevirtual java/lang/String.replaceAll (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            ldc "-"
            ldc "_"
            invokevirtual java/lang/String.replaceAll (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            ldc "\'"
            ldc ""
            invokevirtual java/lang/String.replaceAll (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            ldc "\\."
            ldc ""
            invokevirtual java/lang/String.replaceAll (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            aload customName
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001 = \"\u0001\",\u000A" }
            invokevirtual java/lang/StringBuilder.append (Ljava/lang/String;)Ljava/lang/StringBuilder;
            pop 
        TO: 
            line 1281
            goto TL
        TP: 
            line 1282
            aload sb
            invokevirtual java/lang/StringBuilder.toString ()Ljava/lang/String;
            astore str
        TQ: 
            line 1283
            aload str
            invokevirtual java/lang/String.isEmpty ()Z
            ifne TS
            getstatic zombie/core/Core.debug Z
            ifeq TS
        TR: 
            line 1284
            getstatic zombie/debug/DebugLog.Translation Lzombie/debug/DebugLogStream;
            aload str
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Missing translations in Moveables_EN.txt:\u000A\u0001" }
            invokevirtual zombie/debug/DebugLogStream.debugln (Ljava/lang/Object;)V
        TS: 
            // try-end:     range=[E-TS] handler=TT:java/lang/Throwable 
            line 1294
            aload in
            invokevirtual java/io/BufferedInputStream.close ()V
            goto TY
        TT: 
            // try-handler: range=[E-TS] handler=TT:java/lang/Throwable 
            line 618
            astore v7
        TU: 
            // try-start:   range=[TU-TV] handler=TW:java/lang/Throwable 
            aload in
            invokevirtual java/io/BufferedInputStream.close ()V
        TV: 
            // try-end:     range=[TU-TV] handler=TW:java/lang/Throwable 
            goto TX
        TW: 
            // try-handler: range=[TU-TV] handler=TW:java/lang/Throwable 
            astore v8
            aload v7
            aload v8
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        TX: 
            aload v7
            athrow 
        TY: 
            // try-end:     range=[D-TY] handler=TZ:java/lang/Throwable 
            line 1294
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
            goto UE
        TZ: 
            // try-handler: range=[D-TY] handler=TZ:java/lang/Throwable 
            line 618
            astore v6
        UA: 
            // try-start:   range=[UA-UB] handler=UC:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        UB: 
            // try-end:     range=[UA-UB] handler=UC:java/lang/Throwable 
            goto UD
        UC: 
            // try-handler: range=[UA-UB] handler=UC:java/lang/Throwable 
            astore v7
            aload v6
            aload v7
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        UD: 
            aload v6
            athrow 
        UE: 
            // try-end:     range=[C-UE] handler=UF:java/lang/Exception 
            line 1296
            goto UH
        UF: 
            // try-handler: range=[C-UE] handler=UF:java/lang/Exception 
            line 1294
            astore ex
        UG: 
            line 1295
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        UH: 
            line 1297
            return 
        UI: 
        }
    }

    .method private GenerateTilePropertyLookupTables ()V {
        parameters: { this },
        code: {
        A: 
            line 1302
            getstatic zombie/core/TilePropertyAliasMap.instance Lzombie/core/TilePropertyAliasMap;
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            invokevirtual zombie/core/TilePropertyAliasMap.Generate (Ljava/util/HashMap;)V
        B: 
            line 1303
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            invokevirtual java/util/HashMap.clear ()V
        C: 
            line 1304
            return 
        D: 
        }
    }

    .method public LoadTileDefinitionsPropertyStrings (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V {
        parameters: { this, sprMan, filename, fileNumber },
        exceptions: { 
            { G, AQ, AR, Ljava/lang/Throwable; }, 
            { AS, AT, AU, Ljava/lang/Throwable; }, 
            { F, AW, AX, Ljava/lang/Throwable; }, 
            { AY, AZ, BA, Ljava/lang/Throwable; }, 
            { E, BC, BD, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 1307
            getstatic zombie/debug/DebugLog.DetailedInfo Lzombie/debug/DebugLogStream;
            aload filename
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "tiledef: loading \u0001" }
            invokevirtual zombie/debug/DebugLogStream.trace (Ljava/lang/Object;)V
        B: 
            line 1308
            getstatic zombie/network/GameServer.server Z
            ifne E
        C: 
            line 1309
            invokestatic java/lang/Thread.yield ()V
        D: 
            line 1310
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.DoFrameReady ()V
        E: 
            // try-start:   range=[E-BC] handler=BD:java/lang/Exception 
            line 1313
            new java/io/FileInputStream
            dup 
            aload filename
            invokespecial java/io/FileInputStream.<init> (Ljava/lang/String;)V
            astore fis
        F: 
            // try-start:   range=[F-AW] handler=AX:java/lang/Throwable 
            new java/io/BufferedInputStream
            dup 
            aload fis
            invokespecial java/io/BufferedInputStream.<init> (Ljava/io/InputStream;)V
            astore in
        G: 
            // try-start:   range=[G-AQ] handler=AR:java/lang/Throwable 
            line 1314
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore TDEF
        H: 
            line 1315
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore version
        I: 
            line 1316
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore numTilesheets
        J: 
            line 1318
            new zombie/util/SharedStrings
            dup 
            invokespecial zombie/util/SharedStrings.<init> ()V
            astore sharedStrings
        K: 
            line 1319
            new java/lang/StringBuilder
            dup 
            invokespecial java/lang/StringBuilder.<init> ()V
            astore stringBuilder
        L: 
            line 1321
            iconst_0 
            istore n
        M: 
            iload n
            iload numTilesheets
            if_icmpge AQ
        N: 
            line 1328
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore str
        O: 
            line 1329
            aload str
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            astore name
        P: 
            line 1330
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore imageName
        Q: 
            line 1332
            aload this
            getfield zombie/iso/IsoWorld.tileImages Ljava/util/ArrayList;
            aload imageName
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        R: 
            line 1334
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore wTiles
        S: 
            line 1335
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore hTiles
        T: 
            line 1336
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore tilesetNumber
        U: 
            line 1337
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore nTiles
        V: 
            line 1339
            iconst_0 
            istore m
        W: 
            iload m
            iload nTiles
            if_icmpge AP
        X: 
            line 1340
            aload in
            invokestatic zombie/iso/IsoWorld.readInt (Ljava/io/InputStream;)I
            istore nProps
        Y: 
            line 1341
            iconst_0 
            istore l
        Z: 
            iload l
            iload nProps
            if_icmpge AO
        AA: 
            line 1342
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore str
        AB: 
            line 1343
            aload str
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            astore prop
        AC: 
            line 1344
            aload in
            aload stringBuilder
            invokestatic zombie/iso/IsoWorld.readString (Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/String;
            astore str
        AD: 
            line 1345
            aload str
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            astore val
        AE: 
            line 1346
            aload prop
            invokestatic zombie/iso/SpriteDetails/IsoObjectType.FromString (Ljava/lang/String;)Lzombie/iso/SpriteDetails/IsoObjectType;
            astore type
        AF: 
            line 1347
            aload sharedStrings
            aload prop
            invokevirtual zombie/util/SharedStrings.get (Ljava/lang/String;)Ljava/lang/String;
            astore prop
        AG: 
            line 1349
            aconst_null 
            astore values
        AH: 
            line 1350
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            aload prop
            invokevirtual java/util/HashMap.containsKey (Ljava/lang/Object;)Z
            ifeq AJ
        AI: 
            line 1351
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            aload prop
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            astore values
            goto AL
        AJ: 
            line 1353
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            astore values
        AK: 
            line 1354
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            aload prop
            aload values
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        AL: 
            line 1357
            aload values
            aload val
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne AN
        AM: 
            line 1358
            aload values
            aload val
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AN: 
            line 1341
            iinc l 1
            goto Z
        AO: 
            line 1339
            iinc m 1
            goto W
        AP: 
            line 1321
            iinc n 1
            goto M
        AQ: 
            // try-end:     range=[G-AQ] handler=AR:java/lang/Throwable 
            line 1363
            aload in
            invokevirtual java/io/BufferedInputStream.close ()V
            goto AW
        AR: 
            // try-handler: range=[G-AQ] handler=AR:java/lang/Throwable 
            line 1313
            astore v6
        AS: 
            // try-start:   range=[AS-AT] handler=AU:java/lang/Throwable 
            aload in
            invokevirtual java/io/BufferedInputStream.close ()V
        AT: 
            // try-end:     range=[AS-AT] handler=AU:java/lang/Throwable 
            goto AV
        AU: 
            // try-handler: range=[AS-AT] handler=AU:java/lang/Throwable 
            astore v7
            aload v6
            aload v7
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AV: 
            aload v6
            athrow 
        AW: 
            // try-end:     range=[F-AW] handler=AX:java/lang/Throwable 
            line 1363
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
            goto BC
        AX: 
            // try-handler: range=[F-AW] handler=AX:java/lang/Throwable 
            line 1313
            astore v5
        AY: 
            // try-start:   range=[AY-AZ] handler=BA:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        AZ: 
            // try-end:     range=[AY-AZ] handler=BA:java/lang/Throwable 
            goto BB
        BA: 
            // try-handler: range=[AY-AZ] handler=BA:java/lang/Throwable 
            astore v6
            aload v5
            aload v6
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        BB: 
            aload v5
            athrow 
        BC: 
            // try-end:     range=[E-BC] handler=BD:java/lang/Exception 
            line 1365
            goto BF
        BD: 
            // try-handler: range=[E-BC] handler=BD:java/lang/Exception 
            line 1363
            astore ex
        BE: 
            line 1364
            ldc Lzombie/GameWindow;
            invokevirtual java/lang/Class.getName ()Ljava/lang/String;
            invokestatic java/util/logging/Logger.getLogger (Ljava/lang/String;)Ljava/util/logging/Logger;
            getstatic java/util/logging/Level.SEVERE Ljava/util/logging/Level;
            aconst_null 
            aload ex
            invokevirtual java/util/logging/Logger.log (Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
        BF: 
            line 1366
            return 
        BG: 
        }
    }

    .method private SetCustomPropertyValues ()V {
        parameters: { this },
        code: {
        A: 
            line 1371
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "WindowN"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "WindowN"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        B: 
            line 1372
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "WindowW"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "WindowW"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        C: 
            line 1373
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "DoorWallN"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "DoorWallN"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 1374
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "DoorWallW"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "DoorWallW"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        E: 
            line 1375
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "WallSE"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "WallSE"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        F: 
            line 1378
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            astore offsets
        G: 
            line 1379
            bipush -96
            istore i
        H: 
            iload i
            bipush 96
            if_icmpgt L
        I: 
            line 1380
            iload i
            invokestatic java/lang/Integer.toString (I)Ljava/lang/String;
            astore str
        J: 
            line 1381
            aload offsets
            aload str
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        K: 
            line 1379
            iinc i 1
            goto H
        L: 
            line 1383
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "Noffset"
            aload offsets
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        M: 
            line 1384
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "Soffset"
            aload offsets
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        N: 
            line 1385
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "Woffset"
            aload offsets
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        O: 
            line 1386
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "Eoffset"
            aload offsets
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        P: 
            line 1389
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "tree"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "5"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        Q: 
            line 1390
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "tree"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "6"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        R: 
            line 1393
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "lightR"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "0"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        S: 
            line 1394
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "lightG"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "0"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        T: 
            line 1395
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "lightB"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            ldc "0"
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        U: 
            line 1398
            iconst_0 
            istore i
        V: 
            iload i
            bipush 96
            if_icmpgt AE
        W: 
            line 1399
            iload i
            invokestatic java/lang/String.valueOf (I)Ljava/lang/String;
            astore value
        X: 
            line 1400
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "ItemHeight"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            astore values
        Y: 
            line 1401
            aload values
            aload value
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne AA
        Z: 
            line 1402
            aload values
            aload value
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AA: 
            line 1404
            getstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
            ldc "Surface"
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            astore values
        AB: 
            line 1405
            aload values
            aload value
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne AD
        AC: 
            line 1406
            aload values
            aload value
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AD: 
            line 1398
            iinc i 1
            goto V
        AE: 
            line 1409
            return 
        AF: 
        }
    }

    .signature "(Ljava/lang/String;Ljava/util/ArrayList<Lzombie/iso/sprite/IsoSprite;>;)V"
    .method private setOpenDoorProperties (Ljava/lang/String;Ljava/util/ArrayList;)V {
        parameters: { this, tilesheetName, sprites },
        code: {
        A: 
            line 1412
            iconst_0 
            istore i
        B: 
            iload i
            aload sprites
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge Z
        C: 
            line 1413
            aload sprites
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore spr
        D: 
            line 1414
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getType ()Lzombie/iso/SpriteDetails/IsoObjectType;
            getstatic zombie/iso/SpriteDetails/IsoObjectType.doorN Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpeq F
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getType ()Lzombie/iso/SpriteDetails/IsoObjectType;
            getstatic zombie/iso/SpriteDetails/IsoObjectType.doorW Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpeq F
        E: 
            line 1415
            goto Y
        F: 
            line 1417
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.open Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.has (Lzombie/iso/SpriteDetails/IsoFlagType;)Z
            ifeq H
        G: 
            line 1418
            goto Y
        H: 
            line 1420
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "DoubleDoor"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            astore DoubleDoor
        I: 
            line 1421
            aload DoubleDoor
            ifnull M
        J: 
            line 1422
            aload DoubleDoor
            iconst_m1 
            invokestatic zombie/core/math/PZMath.tryParseInt (Ljava/lang/String;I)I
            istore index
        K: 
            line 1423
            iload index
            iconst_5 
            if_icmplt Y
        L: 
            line 1424
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.open Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto Y
        M: 
            line 1428
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "GarageDoor"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            astore GarageDoor
        N: 
            line 1429
            aload GarageDoor
            ifnull R
        O: 
            line 1430
            aload GarageDoor
            iconst_m1 
            invokestatic zombie/core/math/PZMath.tryParseInt (Ljava/lang/String;I)I
            istore index
        P: 
            line 1431
            iload index
            iconst_4 
            if_icmplt Y
        Q: 
            line 1432
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.open Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto Y
        R: 
            line 1438
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            getfield zombie/iso/sprite/IsoSpriteManager.namedMap Ljava/util/HashMap;
            aload tilesheetName
            aload spr
            getfield zombie/iso/sprite/IsoSprite.tileSheetIndex I
            iconst_2 
            iadd 
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore openSprite
        S: 
            line 1439
            aload openSprite
            ifnull Y
        T: 
            line 1440
            aload openSprite
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getType ()Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        U: 
            line 1441
            aload openSprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getType ()Lzombie/iso/SpriteDetails/IsoObjectType;
            getstatic zombie/iso/SpriteDetails/IsoObjectType.doorN Lzombie/iso/SpriteDetails/IsoObjectType;
            if_acmpne V
            getstatic zombie/iso/SpriteDetails/IsoFlagType.doorN Lzombie/iso/SpriteDetails/IsoFlagType;
            goto W
        V: 
            getstatic zombie/iso/SpriteDetails/IsoFlagType.doorW Lzombie/iso/SpriteDetails/IsoFlagType;
        W: 
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        X: 
            line 1442
            aload openSprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.open Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        Y: 
            line 1412
            iinc i 1
            goto B
        Z: 
            line 1445
            return 
        AA: 
        }
    }

    .signature "(Ljava/util/Map<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;IIIII)V"
    .method private saveMovableStats (Ljava/util/Map;IIIII)V {
        parameters: { this, names, num, onesprites, singles, multies, totalsprites },
        exceptions: { 
            { E, U, V, Ljava/lang/Throwable; }, 
            { W, X, Y, Ljava/lang/Throwable; }, 
            { D, AA, AB, Ljava/lang/Exception; }
         },
        code: {
        A: 
            line 1448
            new java/io/File
            dup 
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            invokevirtual zombie/ZomboidFileSystem.getCacheDir ()Ljava/lang/String;
            invokespecial java/io/File.<init> (Ljava/lang/String;)V
            astore path
        B: 
            line 1449
            aload path
            invokevirtual java/io/File.exists ()Z
            ifeq AD
            aload path
            invokevirtual java/io/File.isDirectory ()Z
            ifeq AD
        C: 
            line 1450
            new java/io/File
            dup 
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            invokevirtual zombie/ZomboidFileSystem.getCacheDir ()Ljava/lang/String;
            getstatic java/io/File.separator Ljava/lang/String;
            iload num
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001\u0001movables_stats_\u0001.txt" }
            invokespecial java/io/File.<init> (Ljava/lang/String;)V
            astore f
        D: 
            // try-start:   range=[D-AA] handler=AB:java/lang/Exception 
            line 1452
            new java/io/FileWriter
            dup 
            aload f
            iconst_0 
            invokespecial java/io/FileWriter.<init> (Ljava/io/File;Z)V
            astore w
        E: 
            // try-start:   range=[E-U] handler=V:java/lang/Throwable 
            line 1453
            aload w
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "### Movable objects ###\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        F: 
            line 1454
            aload w
            iload onesprites
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (ILjava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Single Face: \u0001\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        G: 
            line 1455
            aload w
            iload singles
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (ILjava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Multi Face: \u0001\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        H: 
            line 1456
            aload w
            iload multies
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (ILjava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Multi Face & Multi Sprite: \u0001\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        I: 
            line 1457
            aload w
            iload onesprites
            iload singles
            iadd 
            iload multies
            iadd 
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (ILjava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Total objects : \u0001\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        J: 
            line 1458
            aload w
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { " \u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        K: 
            line 1459
            aload w
            iload totalsprites
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (ILjava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "Total sprites : \u0001\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        L: 
            line 1460
            aload w
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { " \u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        M: 
            line 1462
            aload names
            invokeinterface java/util/Map.entrySet ()Ljava/util/Set;
            invokeinterface java/util/Set.iterator ()Ljava/util/Iterator;
            astore v10
        N: 
            aload v10
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq U
            aload v10
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast java/util/Map$Entry
            astore entry
        O: 
            line 1463
            aload w
            aload entry
            invokeinterface java/util/Map$Entry.getKey ()Ljava/lang/Object;
            checkcast java/lang/String
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        P: 
            line 1464
            aload entry
            invokeinterface java/util/Map$Entry.getValue ()Ljava/lang/Object;
            checkcast java/util/ArrayList
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v12
        Q: 
            aload v12
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq T
            aload v12
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast java/lang/String
            astore name
        R: 
            line 1465
            aload w
            aload name
            invokestatic java/lang/System.lineSeparator ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0009\u0001\u0001" }
            invokevirtual java/io/FileWriter.write (Ljava/lang/String;)V
        S: 
            line 1466
            goto Q
        T: 
            line 1467
            goto N
        U: 
            // try-end:     range=[E-U] handler=V:java/lang/Throwable 
            line 1468
            aload w
            invokevirtual java/io/FileWriter.close ()V
            goto AA
        V: 
            // try-handler: range=[E-U] handler=V:java/lang/Throwable 
            line 1452
            astore v10
        W: 
            // try-start:   range=[W-X] handler=Y:java/lang/Throwable 
            aload w
            invokevirtual java/io/FileWriter.close ()V
        X: 
            // try-end:     range=[W-X] handler=Y:java/lang/Throwable 
            goto Z
        Y: 
            // try-handler: range=[W-X] handler=Y:java/lang/Throwable 
            astore v11
            aload v10
            aload v11
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        Z: 
            aload v10
            athrow 
        AA: 
            // try-end:     range=[D-AA] handler=AB:java/lang/Exception 
            line 1470
            goto AD
        AB: 
            // try-handler: range=[D-AA] handler=AB:java/lang/Exception 
            line 1468
            astore ex
        AC: 
            line 1469
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        AD: 
            line 1472
            return 
        AE: 
        }
    }

    .method private addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V {
        parameters: { this, sprMan, fileNumber, name, tilesetNumber, rows, windType },
        code: {
        A: 
            line 1475
            iconst_2 
            istore columns
        B: 
            line 1476
            iconst_0 
            istore row
        C: 
            iload row
            iload rows
            if_icmpge W
        D: 
            line 1477
            iconst_0 
            istore col
        E: 
            iload col
            iconst_2 
            if_icmpge V
        F: 
            line 1478
            aload name
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "e_\u0001JUMBO_1" }
            astore tilesetName
        G: 
            line 1479
            iload row
            iconst_2 
            imul 
            iload col
            iadd 
            istore tileNum
        H: 
            line 1480
            aload sprMan
            aload tilesetName
            iload tileNum
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            iload fileNumber
            sipush 512
            imul 
            sipush 512
            imul 
            iload tilesetNumber
            sipush 512
            imul 
            iadd 
            iload tileNum
            iadd 
            invokevirtual zombie/iso/sprite/IsoSpriteManager.AddSprite (Ljava/lang/String;I)Lzombie/iso/sprite/IsoSprite;
            astore spr
        I: 
            line 1481
            getstatic zombie/iso/IsoWorld.$assertionsDisabled Z
            ifne J
            getstatic zombie/network/GameServer.server Z
            ifne J
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.hasNoTextures ()Z
            ifeq J
            new java/lang/AssertionError
            dup 
            invokespecial java/lang/AssertionError.<init> ()V
            athrow 
        J: 
            line 1482
            aload spr
            aload tilesetName
            iload tileNum
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_\u0001" }
            invokevirtual zombie/iso/sprite/IsoSprite.setName (Ljava/lang/String;)V
        K: 
            line 1483
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.tree Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        L: 
            line 1484
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "tree"
            iload col
            ifne M
            ldc "5"
            goto N
        M: 
            ldc "6"
        N: 
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        O: 
            line 1485
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.solid Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.unset (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        P: 
            line 1486
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.blocksight Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        Q: 
            line 1487
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "MaterialType"
            ldc "Wood_Solid"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        R: 
            line 1488
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            invokevirtual zombie/core/properties/PropertyContainer.CreateKeySet ()V
        S: 
            line 1489
            aload spr
            iconst_1 
            putfield zombie/iso/sprite/IsoSprite.moveWithWind Z
        T: 
            line 1490
            aload spr
            iload windType
            putfield zombie/iso/sprite/IsoSprite.windType I
        U: 
            line 1477
            iinc col 1
            goto E
        V: 
            line 1476
            iinc row 1
            goto C
        W: 
            line 1493
            return 
        X: 
        }
    }

    .method private JumboTreeDefinitions (Lzombie/iso/sprite/IsoSpriteManager;I)V {
        parameters: { this, sprMan, fileNumber },
        code: {
        A: 
            line 1497
            iconst_2 
            istore EVERGREEN
        B: 
            line 1498
            bipush 6
            istore SEASONAL
        C: 
            line 1499
            iconst_1 
            istore ELASTIC
            iconst_2 
            istore BENDY
            iconst_3 
            istore STERN
        D: 
            line 1502
            aload this
            aload sprMan
            iload fileNumber
            ldc "americanholly"
            iconst_1 
            iconst_2 
            iconst_3 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        E: 
            line 1503
            aload this
            aload sprMan
            iload fileNumber
            ldc "americanlinden"
            iconst_2 
            bipush 6
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        F: 
            line 1504
            aload this
            aload sprMan
            iload fileNumber
            ldc "canadianhemlock"
            iconst_3 
            iconst_2 
            iconst_3 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        G: 
            line 1505
            aload this
            aload sprMan
            iload fileNumber
            ldc "carolinasilverbell"
            iconst_4 
            bipush 6
            iconst_1 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        H: 
            line 1506
            aload this
            aload sprMan
            iload fileNumber
            ldc "cockspurhawthorn"
            iconst_5 
            bipush 6
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        I: 
            line 1507
            aload this
            aload sprMan
            iload fileNumber
            ldc "dogwood"
            bipush 6
            bipush 6
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        J: 
            line 1508
            aload this
            aload sprMan
            iload fileNumber
            ldc "easternredbud"
            bipush 7
            bipush 6
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        K: 
            line 1509
            aload this
            aload sprMan
            iload fileNumber
            ldc "redmaple"
            bipush 8
            bipush 6
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        L: 
            line 1510
            aload this
            aload sprMan
            iload fileNumber
            ldc "riverbirch"
            bipush 9
            bipush 6
            iconst_1 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        M: 
            line 1511
            aload this
            aload sprMan
            iload fileNumber
            ldc "virginiapine"
            bipush 10
            iconst_2 
            iconst_1 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        N: 
            line 1512
            aload this
            aload sprMan
            iload fileNumber
            ldc "yellowwood"
            bipush 11
            bipush 6
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.addJumboTreeTileset (Lzombie/iso/sprite/IsoSpriteManager;ILjava/lang/String;III)V
        O: 
            line 1514
            bipush 12
            istore tilesetNumber
        P: 
            line 1515
            iconst_0 
            istore tileNum
        Q: 
            line 1516
            aload sprMan
            ldc "jumbo_tree_01_0"
            iload fileNumber
            sipush 512
            imul 
            sipush 512
            imul 
            sipush 6144
            iadd 
            iconst_0 
            iadd 
            invokevirtual zombie/iso/sprite/IsoSpriteManager.AddSprite (Ljava/lang/String;I)Lzombie/iso/sprite/IsoSprite;
            astore spr
        R: 
            line 1517
            aload spr
            ldc "jumbo_tree_01_0"
            invokevirtual zombie/iso/sprite/IsoSprite.setName (Ljava/lang/String;)V
        S: 
            line 1518
            aload spr
            getstatic zombie/iso/SpriteDetails/IsoObjectType.tree Lzombie/iso/SpriteDetails/IsoObjectType;
            invokevirtual zombie/iso/sprite/IsoSprite.setType (Lzombie/iso/SpriteDetails/IsoObjectType;)V
        T: 
            line 1519
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            ldc "tree"
            ldc "4"
            invokevirtual zombie/core/properties/PropertyContainer.set (Ljava/lang/String;Ljava/lang/String;)V
        U: 
            line 1520
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.solid Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.unset (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        V: 
            line 1521
            aload spr
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.blocksight Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        W: 
            line 1522
            return 
        X: 
        }
    }

    .method private loadedTileDefinitions ()V {
        parameters: { this },
        code: {
        A: 
            line 1525
            getstatic zombie/iso/CellLoader.glassRemovedWindowSpriteMap Ljava/util/HashMap;
            invokevirtual java/util/HashMap.clear ()V
        B: 
            line 1526
            getstatic zombie/iso/CellLoader.smashedWindowSpriteMap Ljava/util/HashMap;
            invokevirtual java/util/HashMap.clear ()V
        C: 
            line 1528
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            getfield zombie/iso/sprite/IsoSpriteManager.namedMap Ljava/util/HashMap;
            invokevirtual java/util/HashMap.values ()Ljava/util/Collection;
            invokeinterface java/util/Collection.iterator ()Ljava/util/Iterator;
            astore v1
        D: 
            aload v1
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq AB
            aload v1
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore sprite
        E: 
            line 1529
            aload sprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            astore props
        F: 
            line 1530
            aload props
            getstatic zombie/iso/SpriteDetails/IsoFlagType.windowW Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.has (Lzombie/iso/SpriteDetails/IsoFlagType;)Z
            ifne G
            aload props
            getstatic zombie/iso/SpriteDetails/IsoFlagType.windowN Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.has (Lzombie/iso/SpriteDetails/IsoFlagType;)Z
            ifeq U
        G: 
            line 1531
            aload props
            ldc "GlassRemovedOffset"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            astore val
        H: 
            line 1532
            aload val
            ifnull N
        I: 
            line 1533
            aload val
            iconst_0 
            invokestatic zombie/core/math/PZMath.tryParseInt (Ljava/lang/String;I)I
            istore offset
        J: 
            line 1534
            iload offset
            ifeq N
        K: 
            line 1537
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            aload sprite
            iload offset
            invokestatic zombie/iso/sprite/IsoSprite.getSprite (Lzombie/iso/sprite/IsoSpriteManager;Lzombie/iso/sprite/IsoSprite;I)Lzombie/iso/sprite/IsoSprite;
            astore sprite2
        L: 
            line 1538
            aload sprite2
            ifnull N
        M: 
            line 1539
            getstatic zombie/iso/CellLoader.glassRemovedWindowSpriteMap Ljava/util/HashMap;
            aload sprite2
            aload sprite
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        N: 
            line 1543
            aload props
            ldc "SmashedTileOffset"
            invokevirtual zombie/core/properties/PropertyContainer.get (Ljava/lang/String;)Ljava/lang/String;
            astore val
        O: 
            line 1544
            aload val
            ifnull U
        P: 
            line 1545
            aload val
            iconst_0 
            invokestatic zombie/core/math/PZMath.tryParseInt (Ljava/lang/String;I)I
            istore offset
        Q: 
            line 1546
            iload offset
            ifeq U
        R: 
            line 1549
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            aload sprite
            iload offset
            invokestatic zombie/iso/sprite/IsoSprite.getSprite (Lzombie/iso/sprite/IsoSpriteManager;Lzombie/iso/sprite/IsoSprite;I)Lzombie/iso/sprite/IsoSprite;
            astore sprite2
        S: 
            line 1550
            aload sprite2
            ifnull U
        T: 
            line 1551
            getstatic zombie/iso/CellLoader.smashedWindowSpriteMap Ljava/util/HashMap;
            aload sprite2
            aload sprite
            invokevirtual java/util/HashMap.put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            pop 
        U: 
            line 1556
            aload sprite
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
            ifnull W
            aload sprite
            getfield zombie/iso/sprite/IsoSprite.name Ljava/lang/String;
            ldc "fixtures_railings_01"
            invokevirtual java/lang/String.startsWith (Ljava/lang/String;)Z
            ifeq W
        V: 
            line 1557
            aload sprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.NeverCutaway Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        W: 
            line 1561
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            getfield zombie/iso/sprite/IsoSpriteManager.namedMap Ljava/util/HashMap;
            aload sprite
            getfield zombie/iso/sprite/IsoSprite.tilesetName Ljava/lang/String;
            aload sprite
            getfield zombie/iso/sprite/IsoSprite.tileSheetIndex I
            invokedynamic makeConcatWithConstants (Ljava/lang/String;I)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "\u0001_on_\u0001" }
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/sprite/IsoSprite
            astore sprite1
        X: 
            line 1562
            aload sprite1
            ifnull Y
            aload sprite1
            invokevirtual zombie/iso/sprite/IsoSprite.hasNoTextures ()Z
            ifeq Z
        Y: 
            line 1563
            aload sprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.HasLightOnSprite Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.unset (Lzombie/iso/SpriteDetails/IsoFlagType;)V
            goto AA
        Z: 
            line 1565
            aload sprite
            invokevirtual zombie/iso/sprite/IsoSprite.getProperties ()Lzombie/core/properties/PropertyContainer;
            getstatic zombie/iso/SpriteDetails/IsoFlagType.HasLightOnSprite Lzombie/iso/SpriteDetails/IsoFlagType;
            invokevirtual zombie/core/properties/PropertyContainer.set (Lzombie/iso/SpriteDetails/IsoFlagType;)V
        AA: 
            line 1568
            goto D
        AB: 
            line 1569
            invokestatic zombie/spriteModel/SpriteModelManager.getInstance ()Lzombie/spriteModel/SpriteModelManager;
            invokevirtual zombie/spriteModel/SpriteModelManager.loadedTileDefinitions ()V
        AC: 
            line 1570
            invokestatic zombie/tileDepth/TileDepthTextureManager.getInstance ()Lzombie/tileDepth/TileDepthTextureManager;
            invokevirtual zombie/tileDepth/TileDepthTextureManager.loadedTileDefinitions ()V
        AD: 
            line 1571
            invokestatic zombie/tileDepth/TileGeometryManager.getInstance ()Lzombie/tileDepth/TileGeometryManager;
            invokevirtual zombie/tileDepth/TileGeometryManager.loadedTileDefinitions ()V
        AE: 
            line 1572
            aload this
            invokevirtual zombie/iso/IsoWorld.getAttachmentsHandler ()Lzombie/iso/worldgen/attachments/AttachmentsHandler;
            invokevirtual zombie/iso/worldgen/attachments/AttachmentsHandler.loadAttachments ()V
        AF: 
            line 1573
            return 
        AG: 
        }
    }

    .method public LoadPlayerForInfo ()Z {
        parameters: { this },
        exceptions: { 
            { J, AA, AO, * }, 
            { AB, AN, AO, * }, 
            { AO, AP, AO, * }
         },
        code: {
        A: 
            line 1576
            getstatic zombie/network/GameClient.client Z
            ifeq C
        B: 
            line 1577
            invokestatic zombie/savefile/ClientPlayerDB.getInstance ()Lzombie/savefile/ClientPlayerDB;
            iconst_1 
            invokevirtual zombie/savefile/ClientPlayerDB.loadNetworkPlayerInfo (I)Z
            ireturn 
        C: 
            line 1580
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            ldc "map_p.bin"
            invokevirtual zombie/ZomboidFileSystem.getFileInCurrentSave (Ljava/lang/String;)Ljava/io/File;
            astore inFile
        D: 
            line 1581
            aload inFile
            invokevirtual java/io/File.exists ()Z
            ifne G
        E: 
            line 1582
            invokestatic zombie/savefile/PlayerDB.getInstance ()Lzombie/savefile/PlayerDB;
            invokevirtual zombie/savefile/PlayerDB.importPlayersFromVehiclesDB ()V
        F: 
            line 1583
            invokestatic zombie/savefile/PlayerDB.getInstance ()Lzombie/savefile/PlayerDB;
            iconst_1 
            invokevirtual zombie/savefile/PlayerDB.loadLocalPlayerInfo (I)Z
            ireturn 
        G: 
            line 1586
            new java/io/FileInputStream
            dup 
            aload inFile
            invokespecial java/io/FileInputStream.<init> (Ljava/io/File;)V
            astore inStream
        H: 
            line 1587
            new java/io/BufferedInputStream
            dup 
            aload inStream
            invokespecial java/io/BufferedInputStream.<init> (Ljava/io/InputStream;)V
            astore input
        I: 
            line 1588
            getstatic zombie/iso/SliceY.SliceBufferLock Ljava/lang/Object;
            dup 
            astore v4
            monitorenter 
        J: 
            // try-start:   range=[J-AA] handler=AO:* 
            line 1589
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        K: 
            line 1590
            aload input
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.array ()[B
            invokevirtual java/io/BufferedInputStream.read ([B)I
            istore numBytes
        L: 
            line 1591
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            iload numBytes
            invokevirtual java/nio/ByteBuffer.limit (I)Ljava/nio/ByteBuffer;
            pop 
        M: 
            line 1592
            aload input
            invokevirtual java/io/BufferedInputStream.close ()V
        N: 
            line 1594
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.get ()B
            istore b1
        O: 
            line 1595
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.get ()B
            istore b2
        P: 
            line 1596
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.get ()B
            istore b3
        Q: 
            line 1597
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.get ()B
            istore b4
        R: 
            line 1598
            iconst_m1 
            istore WorldVersion
        S: 
            line 1599
            iload b1
            bipush 80
            if_icmpne U
            iload b2
            bipush 76
            if_icmpne U
            iload b3
            bipush 89
            if_icmpne U
            iload b4
            bipush 82
            if_icmpne U
        T: 
            line 1600
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore WorldVersion
            goto V
        U: 
            line 1602
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.rewind ()Ljava/nio/ByteBuffer;
            pop 
        V: 
            line 1606
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokestatic zombie/GameWindow.ReadString (Ljava/nio/ByteBuffer;)Ljava/lang/String;
            astore serverPlayerID
        W: 
            line 1607
            getstatic zombie/network/GameClient.client Z
            ifeq AB
            aload serverPlayerID
            invokestatic zombie/characters/IsoPlayer.isServerPlayerIDValid (Ljava/lang/String;)Z
            ifne AB
        X: 
            line 1608
            ldc "IGUI_MP_ServerPlayerIDMismatch"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        Y: 
            line 1609
            iconst_1 
            putstatic zombie/gameStates/GameLoadingState.playerWrongIP Z
        Z: 
            line 1610
            iconst_0 
            aload v4
            monitorexit 
        AA: 
            // try-end:     range=[J-AA] handler=AO:* 
            ireturn 
        AB: 
            // try-start:   range=[AB-AN] handler=AO:* 
            line 1613
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.getInt ()I
            putstatic zombie/iso/IsoWorld.worldX I
        AC: 
            line 1614
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.getInt ()I
            putstatic zombie/iso/IsoWorld.worldY I
        AD: 
            line 1615
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.getInt ()I
            putstatic zombie/iso/IsoChunkMap.worldXa I
        AE: 
            line 1616
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.getInt ()I
            putstatic zombie/iso/IsoChunkMap.worldYa I
        AF: 
            line 1617
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.getInt ()I
            putstatic zombie/iso/IsoChunkMap.worldZa I
        AG: 
            line 1618
            getstatic zombie/iso/IsoChunkMap.worldXa I
            sipush 256
            getstatic zombie/iso/IsoWorld.saveoffsetx I
            imul 
            iadd 
            putstatic zombie/iso/IsoChunkMap.worldXa I
        AH: 
            line 1619
            getstatic zombie/iso/IsoChunkMap.worldYa I
            sipush 256
            getstatic zombie/iso/IsoWorld.saveoffsety I
            imul 
            iadd 
            putstatic zombie/iso/IsoChunkMap.worldYa I
        AI: 
            line 1620
            getstatic zombie/iso/IsoChunkMap.SWorldX [I
            iconst_0 
            getstatic zombie/iso/IsoWorld.worldX I
            iastore 
        AJ: 
            line 1621
            getstatic zombie/iso/IsoChunkMap.SWorldY [I
            iconst_0 
            getstatic zombie/iso/IsoWorld.worldY I
            iastore 
        AK: 
            line 1622
            getstatic zombie/iso/IsoChunkMap.SWorldX [I
            iconst_0 
            dup2 
            iaload 
            bipush 32
            getstatic zombie/iso/IsoWorld.saveoffsetx I
            imul 
            iadd 
            iastore 
        AL: 
            line 1623
            getstatic zombie/iso/IsoChunkMap.SWorldY [I
            iconst_0 
            dup2 
            iaload 
            bipush 32
            getstatic zombie/iso/IsoWorld.saveoffsety I
            imul 
            iadd 
            iastore 
        AM: 
            line 1624
            aload v4
            monitorexit 
        AN: 
            // try-end:     range=[AB-AN] handler=AO:* 
            goto AQ
        AO: 
            // try-handler: range=[J-AA] handler=AO:* 
            // try-handler: range=[AB-AN] handler=AO:* 
            // try-start:   range=[AO-AP] handler=AO:* 
            // try-handler: range=[AO-AP] handler=AO:* 
            astore v12
            aload v4
            monitorexit 
        AP: 
            // try-end:     range=[AO-AP] handler=AO:* 
            aload v12
            athrow 
        AQ: 
            line 1625
            iconst_1 
            ireturn 
        AR: 
        }
    }

    .method public init ()V {
        parameters: { this },
        exceptions: { 
            { DI, DN, DO, Ljava/lang/Throwable; }, 
            { DP, DQ, DR, Ljava/lang/Throwable; }, 
            { DH, DT, DU, Ljava/lang/Throwable; }, 
            { DV, DW, DX, Ljava/lang/Throwable; }, 
            { DG, DZ, EA, Ljava/io/FileNotFoundException; }, 
            { EF, EH, EI, Ljava/lang/Throwable; }, 
            { EJ, EK, EL, Ljava/lang/Throwable; }, 
            { EE, EN, EO, Ljava/lang/Throwable; }, 
            { EP, EQ, ER, Ljava/lang/Throwable; }, 
            { ED, ET, EU, Ljava/io/FileNotFoundException; }, 
            { FA, FH, FI, * }, 
            { FI, FJ, FI, * }, 
            { EZ, FK, FL, Ljava/lang/Throwable; }, 
            { FM, FN, FO, Ljava/lang/Throwable; }, 
            { EY, FQ, FR, Ljava/lang/Throwable; }, 
            { FS, FT, FU, Ljava/lang/Throwable; }, 
            { EX, FW, FX, Ljava/io/FileNotFoundException; }, 
            { HD, HJ, HY, Ljava/lang/Exception; }, 
            { HK, HP, HY, Ljava/lang/Exception; }, 
            { HQ, HX, HY, Ljava/lang/Exception; }, 
            { JH, JI, JJ, Ljava/lang/Exception; }, 
            { NE, NH, NI, Ljava/lang/NumberFormatException; }, 
            { QD, QE, QF, Ljava/lang/InterruptedException; }, 
            { RC, RF, RI, Ljava/lang/InterruptedException; }, 
            { RG, RH, RI, Ljava/lang/InterruptedException; }, 
            { SO, TE, TF, Ljava/lang/NumberFormatException; }
         },
        code: {
        A: 
            line 1906
            getstatic zombie/core/Core.tutorial Z
            ifne CR
        B: 
            line 1907
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBSafehouse
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBSafehouse.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        C: 
            line 1908
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBBurnt
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBBurnt.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        D: 
            line 1909
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBOther
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBOther.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        E: 
            line 1910
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBLooted
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBLooted.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        F: 
            line 1911
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBBurntFireman
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBBurntFireman.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        G: 
            line 1912
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBBurntCorpse
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBBurntCorpse.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        H: 
            line 1913
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBShopLooted
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBShopLooted.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        I: 
            line 1914
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBKateAndBaldspot
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBKateAndBaldspot.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        J: 
            line 1915
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBStripclub
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBStripclub.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        K: 
            line 1916
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBSchool
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBSchool.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        L: 
            line 1917
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBSpiffo
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBSpiffo.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        M: 
            line 1918
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBPizzaWhirled
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBPizzaWhirled.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        N: 
            line 1919
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBPileOCrepe
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBPileOCrepe.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        O: 
            line 1920
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBCafe
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBCafe.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        P: 
            line 1921
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBBar
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBBar.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        Q: 
            line 1922
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBOffice
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBOffice.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        R: 
            line 1923
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBHairSalon
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBHairSalon.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        S: 
            line 1924
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBClinic
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBClinic.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        T: 
            line 1925
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBGunstoreSiege
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBGunstoreSiege.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        U: 
            line 1926
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBPoliceSiege
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBPoliceSiege.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        V: 
            line 1927
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBHeatBreakAfternoon
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBHeatBreakAfternoon.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        W: 
            line 1928
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBTrashed
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBTrashed.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        X: 
            line 1929
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBBarn
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBBarn.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        Y: 
            line 1930
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBDorm
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBDorm.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        Z: 
            line 1931
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBNolans
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBNolans.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AA: 
            line 1932
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBJackieJaye
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBJackieJaye.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AB: 
            line 1933
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBJoanHartford
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBJoanHartford.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AC: 
            line 1934
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBMayorWestPoint
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBMayorWestPoint.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AD: 
            line 1935
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBTwiggy
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBTwiggy.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AE: 
            line 1936
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedBuilding/RBWoodcraft
            dup 
            invokespecial zombie/randomizedWorld/randomizedBuilding/RBWoodcraft.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AF: 
            line 1938
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSUtilityVehicle
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSUtilityVehicle.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AG: 
            line 1939
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSConstructionSite
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSConstructionSite.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AH: 
            line 1940
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSBurntCar
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSBurntCar.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AI: 
            line 1941
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSPoliceBlockadeShooting
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSPoliceBlockadeShooting.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AJ: 
            line 1942
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSPoliceBlockade
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSPoliceBlockade.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AK: 
            line 1943
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSCarCrash
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSCarCrash.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AL: 
            line 1944
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSAmbulanceCrash
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSAmbulanceCrash.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AM: 
            line 1945
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSCarCrashCorpse
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSCarCrashCorpse.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AN: 
            line 1946
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSChangingTire
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSChangingTire.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AO: 
            line 1947
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSFlippedCrash
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSFlippedCrash.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AP: 
            line 1948
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSBanditRoad
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSBanditRoad.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AQ: 
            line 1949
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSTrailerCrash
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSTrailerCrash.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AR: 
            line 1950
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSCrashHorde
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSCrashHorde.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AS: 
            line 1951
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSCarCrashDeer
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSCarCrashDeer.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AT: 
            line 1952
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSDeadEnd
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSDeadEnd.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AU: 
            line 1953
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSRegionalProfessionVehicle
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSRegionalProfessionVehicle.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AV: 
            line 1954
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSRoadKill
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSRoadKill.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AW: 
            line 1955
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSRoadKillSmall
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSRoadKillSmall.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AX: 
            line 1956
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSAnimalOnRoad
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSAnimalOnRoad.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AY: 
            line 1957
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSHerdOnRoad
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSHerdOnRoad.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AZ: 
            line 1958
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSAnimalTrailerOnRoad
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSAnimalTrailerOnRoad.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BA: 
            line 1959
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSRichJerk
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSRichJerk.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BB: 
            line 1960
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedVehicleStory/RVSPlonkies
            dup 
            invokespecial zombie/randomizedWorld/randomizedVehicleStory/RVSPlonkies.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BC: 
            line 1962
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSAttachedAnimal
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSAttachedAnimal.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BD: 
            line 1963
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSBBQParty
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSBBQParty.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BE: 
            line 1964
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSBaseball
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSBaseball.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BF: 
            line 1965
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSBeachParty
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSBeachParty.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BG: 
            line 1966
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSBurntWreck
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSBurntWreck.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BH: 
            line 1967
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSBuryingCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSBuryingCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BI: 
            line 1968
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSCampsite
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSCampsite.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BJ: 
            line 1969
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSCharcoalBurner
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSCharcoalBurner.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BK: 
            line 1970
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSDean
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSDean.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BL: 
            line 1971
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSDuke
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSDuke.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BM: 
            line 1972
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSEscapedAnimal
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSEscapedAnimal.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BN: 
            line 1973
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSEscapedHerd
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSEscapedHerd.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BO: 
            line 1974
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSFishingTrip
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSFishingTrip.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BP: 
            line 1975
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSForestCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSForestCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BQ: 
            line 1976
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSForestCampEaten
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSForestCampEaten.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BR: 
            line 1977
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSFrankHemingway
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSFrankHemingway.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BS: 
            line 1978
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSHermitCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSHermitCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BT: 
            line 1979
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSHillbillyHoedown
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSHillbillyHoedown.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BU: 
            line 1980
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSHogWild
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSHogWild.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BV: 
            line 1981
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSHunterCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSHunterCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BW: 
            line 1982
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZJackieJaye
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZJackieJaye.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BX: 
            line 1983
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSKirstyKormick
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSKirstyKormick.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BY: 
            line 1984
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSMurderScene
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSMurderScene.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        BZ: 
            line 1985
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSMusicFest
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSMusicFest.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CA: 
            line 1986
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSMusicFestStage
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSMusicFestStage.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CB: 
            line 1987
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSNastyMattress
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSNastyMattress.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CC: 
            line 1988
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSOccultActivity
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSOccultActivity.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CD: 
            line 1989
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSOldFirepit
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSOldFirepit.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CE: 
            line 1990
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSOldShelter
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSOldShelter.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CF: 
            line 1991
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSOrphanedFawn
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSOrphanedFawn.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CG: 
            line 1992
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSRangerSmith
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSRangerSmith.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CH: 
            line 1993
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSRockerParty
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSRockerParty.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CI: 
            line 1994
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSSadCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSSadCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CJ: 
            line 1995
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSSexyTime
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSSexyTime.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CK: 
            line 1996
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSSirTwiggy
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSSirTwiggy.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CL: 
            line 1997
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSSurvivalistCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSSurvivalistCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CM: 
            line 1998
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSTragicPicnic
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSTragicPicnic.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CN: 
            line 1999
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSTrapperCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSTrapperCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CO: 
            line 2000
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSVanCamp
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSVanCamp.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CP: 
            line 2001
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSWasteDump
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSWasteDump.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CQ: 
            line 2002
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            new zombie/randomizedWorld/randomizedZoneStory/RZSWaterPump
            dup 
            invokespecial zombie/randomizedWorld/randomizedZoneStory/RZSWaterPump.<init> ()V
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        CR: 
            line 2005
            invokestatic zombie/randomizedWorld/randomizedBuilding/RBBasic.getUniqueRDSSpawned ()Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        CS: 
            line 2007
            getstatic zombie/network/GameClient.client Z
            ifne CT
            getstatic zombie/network/GameServer.server Z
            ifeq CU
        CT: 
            line 2008
            new zombie/network/BodyDamageSync
            dup 
            invokespecial zombie/network/BodyDamageSync.<init> ()V
            putstatic zombie/network/BodyDamageSync.instance Lzombie/network/BodyDamageSync;
            goto CV
        CU: 
            line 2010
            aconst_null 
            putstatic zombie/network/BodyDamageSync.instance Lzombie/network/BodyDamageSync;
        CV: 
            line 2013
            getstatic zombie/network/GameServer.server Z
            ifeq DD
        CW: 
            line 2014
            getstatic zombie/network/GameServer.serverName Ljava/lang/String;
            putstatic zombie/core/Core.gameSaveWorld Ljava/lang/String;
        CX: 
            line 2016
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            invokevirtual zombie/ZomboidFileSystem.getCurrentSaveDir ()Ljava/lang/String;
            astore saveFolder
        CY: 
            line 2017
            new java/io/File
            dup 
            aload saveFolder
            invokespecial java/io/File.<init> (Ljava/lang/String;)V
            astore file
        CZ: 
            line 2018
            aload file
            invokevirtual java/io/File.exists ()Z
            ifne DC
        DA: 
            line 2019
            ldc 10000000
            invokestatic zombie/core/random/Rand.Next (I)I
            putstatic zombie/network/GameServer.resetId I
        DB: 
            line 2020
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            ldc "ResetID"
            getstatic zombie/network/GameServer.resetId I
            invokestatic java/lang/String.valueOf (I)Ljava/lang/String;
            invokevirtual zombie/network/ServerOptions.putSaveOption (Ljava/lang/String;Ljava/lang/String;)V
        DC: 
            line 2022
            getstatic zombie/core/Core.gameSaveWorld Ljava/lang/String;
            invokestatic zombie/Lua/LuaManager$GlobalObject.createWorld (Ljava/lang/String;)V
        DD: 
            line 2025
            aload this
            invokevirtual zombie/iso/IsoWorld.readWorldVersion ()I
            putstatic zombie/iso/IsoWorld.savedWorldVersion I
        DE: 
            line 2028
            getstatic zombie/network/GameServer.server Z
            ifne EB
        DF: 
            line 2029
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            ldc "map_ver.bin"
            invokevirtual zombie/ZomboidFileSystem.getFileInCurrentSave (Ljava/lang/String;)Ljava/io/File;
            astore inFile
        DG: 
            // try-start:   range=[DG-DZ] handler=EA:java/io/FileNotFoundException 
            line 2030
            new java/io/FileInputStream
            dup 
            aload inFile
            invokespecial java/io/FileInputStream.<init> (Ljava/io/File;)V
            astore fis
        DH: 
            // try-start:   range=[DH-DT] handler=DU:java/lang/Throwable 
            new java/io/DataInputStream
            dup 
            aload fis
            invokespecial java/io/DataInputStream.<init> (Ljava/io/InputStream;)V
            astore input
        DI: 
            // try-start:   range=[DI-DN] handler=DO:java/lang/Throwable 
            line 2031
            aload input
            invokevirtual java/io/DataInputStream.readInt ()I
            istore WorldVersion
        DJ: 
            line 2032
            aload input
            invokestatic zombie/GameWindow.ReadString (Ljava/io/DataInputStream;)Ljava/lang/String;
            astore mapDir
        DK: 
            line 2033
            getstatic zombie/network/GameClient.client Z
            ifne DM
        DL: 
            line 2034
            aload mapDir
            putstatic zombie/core/Core.gameMap Ljava/lang/String;
        DM: 
            line 2036
            aload this
            aload input
            invokestatic zombie/GameWindow.ReadString (Ljava/io/DataInputStream;)Ljava/lang/String;
            invokevirtual zombie/iso/IsoWorld.setDifficulty (Ljava/lang/String;)V
        DN: 
            // try-end:     range=[DI-DN] handler=DO:java/lang/Throwable 
            line 2037
            aload input
            invokevirtual java/io/DataInputStream.close ()V
            goto DT
        DO: 
            // try-handler: range=[DI-DN] handler=DO:java/lang/Throwable 
            line 2030
            astore v4
        DP: 
            // try-start:   range=[DP-DQ] handler=DR:java/lang/Throwable 
            aload input
            invokevirtual java/io/DataInputStream.close ()V
        DQ: 
            // try-end:     range=[DP-DQ] handler=DR:java/lang/Throwable 
            goto DS
        DR: 
            // try-handler: range=[DP-DQ] handler=DR:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        DS: 
            aload v4
            athrow 
        DT: 
            // try-end:     range=[DH-DT] handler=DU:java/lang/Throwable 
            line 2037
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
            goto DZ
        DU: 
            // try-handler: range=[DH-DT] handler=DU:java/lang/Throwable 
            line 2030
            astore v3
        DV: 
            // try-start:   range=[DV-DW] handler=DX:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        DW: 
            // try-end:     range=[DV-DW] handler=DX:java/lang/Throwable 
            goto DY
        DX: 
            // try-handler: range=[DV-DW] handler=DX:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        DY: 
            aload v3
            athrow 
        DZ: 
            // try-end:     range=[DG-DZ] handler=EA:java/io/FileNotFoundException 
            line 2038
            goto EB
        EA: 
            // try-handler: range=[DG-DZ] handler=EA:java/io/FileNotFoundException 
            line 2037
            astore v2
        EB: 
            line 2041
            getstatic zombie/network/GameClient.client Z
            ifne EV
        EC: 
            line 2042
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            ldc "id_manager_data.bin"
            invokevirtual zombie/ZomboidFileSystem.getFileInCurrentSave (Ljava/lang/String;)Ljava/io/File;
            astore inFile
        ED: 
            // try-start:   range=[ED-ET] handler=EU:java/io/FileNotFoundException 
            line 2043
            new java/io/FileInputStream
            dup 
            aload inFile
            invokespecial java/io/FileInputStream.<init> (Ljava/io/File;)V
            astore fis
        EE: 
            // try-start:   range=[EE-EN] handler=EO:java/lang/Throwable 
            new java/io/DataInputStream
            dup 
            aload fis
            invokespecial java/io/DataInputStream.<init> (Ljava/io/InputStream;)V
            astore input
        EF: 
            // try-start:   range=[EF-EH] handler=EI:java/lang/Throwable 
            line 2044
            aload input
            invokevirtual java/io/DataInputStream.readInt ()I
            istore WorldVersion
        EG: 
            line 2045
            invokestatic zombie/network/id/ObjectIDManager.getInstance ()Lzombie/network/id/ObjectIDManager;
            aload input
            iload WorldVersion
            invokevirtual zombie/network/id/ObjectIDManager.load (Ljava/io/DataInputStream;I)V
        EH: 
            // try-end:     range=[EF-EH] handler=EI:java/lang/Throwable 
            line 2046
            aload input
            invokevirtual java/io/DataInputStream.close ()V
            goto EN
        EI: 
            // try-handler: range=[EF-EH] handler=EI:java/lang/Throwable 
            line 2043
            astore v4
        EJ: 
            // try-start:   range=[EJ-EK] handler=EL:java/lang/Throwable 
            aload input
            invokevirtual java/io/DataInputStream.close ()V
        EK: 
            // try-end:     range=[EJ-EK] handler=EL:java/lang/Throwable 
            goto EM
        EL: 
            // try-handler: range=[EJ-EK] handler=EL:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        EM: 
            aload v4
            athrow 
        EN: 
            // try-end:     range=[EE-EN] handler=EO:java/lang/Throwable 
            line 2046
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
            goto ET
        EO: 
            // try-handler: range=[EE-EN] handler=EO:java/lang/Throwable 
            line 2043
            astore v3
        EP: 
            // try-start:   range=[EP-EQ] handler=ER:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        EQ: 
            // try-end:     range=[EP-EQ] handler=ER:java/lang/Throwable 
            goto ES
        ER: 
            // try-handler: range=[EP-EQ] handler=ER:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        ES: 
            aload v3
            athrow 
        ET: 
            // try-end:     range=[ED-ET] handler=EU:java/io/FileNotFoundException 
            line 2047
            goto EV
        EU: 
            // try-handler: range=[ED-ET] handler=EU:java/io/FileNotFoundException 
            line 2046
            astore v2
        EV: 
            line 2050
            getstatic zombie/network/GameClient.client Z
            ifne FY
        EW: 
            line 2051
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            ldc "important_area_data.bin"
            invokevirtual zombie/ZomboidFileSystem.getFileInCurrentSave (Ljava/lang/String;)Ljava/io/File;
            astore inFile
        EX: 
            // try-start:   range=[EX-FW] handler=FX:java/io/FileNotFoundException 
            line 2052
            new java/io/FileInputStream
            dup 
            aload inFile
            invokespecial java/io/FileInputStream.<init> (Ljava/io/File;)V
            astore fis
        EY: 
            // try-start:   range=[EY-FQ] handler=FR:java/lang/Throwable 
            new java/io/BufferedInputStream
            dup 
            aload fis
            invokespecial java/io/BufferedInputStream.<init> (Ljava/io/InputStream;)V
            astore input2
        EZ: 
            // try-start:   range=[EZ-FK] handler=FL:java/lang/Throwable 
            line 2053
            getstatic zombie/iso/SliceY.SliceBufferLock Ljava/lang/Object;
            dup 
            astore v4
            monitorenter 
        FA: 
            // try-start:   range=[FA-FH] handler=FI:* 
            line 2054
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.clear ()Ljava/nio/ByteBuffer;
            pop 
        FB: 
            line 2055
            aload input2
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.array ()[B
            invokevirtual java/io/BufferedInputStream.read ([B)I
            istore numBytes
        FC: 
            line 2056
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            iload numBytes
            invokevirtual java/nio/ByteBuffer.limit (I)Ljava/nio/ByteBuffer;
            pop 
        FD: 
            line 2057
            aload input2
            invokevirtual java/io/BufferedInputStream.close ()V
        FE: 
            line 2059
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            invokevirtual java/nio/ByteBuffer.getInt ()I
            istore WorldVersion
        FF: 
            line 2060
            invokestatic zombie/core/ImportantAreaManager.getInstance ()Lzombie/core/ImportantAreaManager;
            getstatic zombie/iso/SliceY.SliceBuffer Ljava/nio/ByteBuffer;
            iload WorldVersion
            invokevirtual zombie/core/ImportantAreaManager.load (Ljava/nio/ByteBuffer;I)V
        FG: 
            line 2061
            aload v4
            monitorexit 
        FH: 
            // try-end:     range=[FA-FH] handler=FI:* 
            goto FK
        FI: 
            // try-handler: range=[FA-FH] handler=FI:* 
            // try-start:   range=[FI-FJ] handler=FI:* 
            // try-handler: range=[FI-FJ] handler=FI:* 
            astore v7
            aload v4
            monitorexit 
        FJ: 
            // try-end:     range=[FI-FJ] handler=FI:* 
            aload v7
            athrow 
        FK: 
            // try-end:     range=[EZ-FK] handler=FL:java/lang/Throwable 
            line 2062
            aload input2
            invokevirtual java/io/BufferedInputStream.close ()V
            goto FQ
        FL: 
            // try-handler: range=[EZ-FK] handler=FL:java/lang/Throwable 
            line 2052
            astore v4
        FM: 
            // try-start:   range=[FM-FN] handler=FO:java/lang/Throwable 
            aload input2
            invokevirtual java/io/BufferedInputStream.close ()V
        FN: 
            // try-end:     range=[FM-FN] handler=FO:java/lang/Throwable 
            goto FP
        FO: 
            // try-handler: range=[FM-FN] handler=FO:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        FP: 
            aload v4
            athrow 
        FQ: 
            // try-end:     range=[EY-FQ] handler=FR:java/lang/Throwable 
            line 2062
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
            goto FW
        FR: 
            // try-handler: range=[EY-FQ] handler=FR:java/lang/Throwable 
            line 2052
            astore v3
        FS: 
            // try-start:   range=[FS-FT] handler=FU:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        FT: 
            // try-end:     range=[FS-FT] handler=FU:java/lang/Throwable 
            goto FV
        FU: 
            // try-handler: range=[FS-FT] handler=FU:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        FV: 
            aload v3
            athrow 
        FW: 
            // try-end:     range=[EX-FW] handler=FX:java/io/FileNotFoundException 
            line 2063
            goto FY
        FX: 
            // try-handler: range=[EX-FW] handler=FX:java/io/FileNotFoundException 
            line 2062
            astore v2
        FY: 
            line 2066
            getstatic zombie/iso/worldgen/WorldGenParams.INSTANCE Lzombie/iso/worldgen/WorldGenParams;
            invokevirtual zombie/iso/worldgen/WorldGenParams.load ()Lzombie/iso/worldgen/WorldGenParams$Result;
            astore wgLoadResult
        FZ: 
            line 2068
            aload wgLoadResult
            getstatic zombie/iso/worldgen/WorldGenParams$Result.CLIENT Lzombie/iso/worldgen/WorldGenParams$Result;
            if_acmpeq GA
            aload wgLoadResult
            getstatic zombie/iso/worldgen/WorldGenParams$Result.NOT_PRESENT Lzombie/iso/worldgen/WorldGenParams$Result;
            if_acmpne GF
            getstatic zombie/network/GameServer.server Z
            ifeq GF
        GA: 
            line 2069
            getstatic zombie/iso/worldgen/WorldGenParams.INSTANCE Lzombie/iso/worldgen/WorldGenParams;
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.seed Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            invokevirtual zombie/iso/worldgen/WorldGenParams.setSeedString (Ljava/lang/String;)V
        GB: 
            line 2070
            getstatic zombie/iso/worldgen/WorldGenParams.INSTANCE Lzombie/iso/worldgen/WorldGenParams;
            sipush -250
            invokevirtual zombie/iso/worldgen/WorldGenParams.setMinXCell (I)V
        GC: 
            line 2071
            getstatic zombie/iso/worldgen/WorldGenParams.INSTANCE Lzombie/iso/worldgen/WorldGenParams;
            sipush 250
            invokevirtual zombie/iso/worldgen/WorldGenParams.setMaxXCell (I)V
        GD: 
            line 2072
            getstatic zombie/iso/worldgen/WorldGenParams.INSTANCE Lzombie/iso/worldgen/WorldGenParams;
            sipush -250
            invokevirtual zombie/iso/worldgen/WorldGenParams.setMinYCell (I)V
        GE: 
            line 2073
            getstatic zombie/iso/worldgen/WorldGenParams.INSTANCE Lzombie/iso/worldgen/WorldGenParams;
            sipush 250
            invokevirtual zombie/iso/worldgen/WorldGenParams.setMaxYCell (I)V
        GF: 
            line 2076
            getstatic zombie/network/GameServer.server Z
            ifeq GG
            getstatic zombie/network/GameServer.softReset Z
            ifeq GG
            goto GH
        GG: 
            line 2079
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/IsoMetaGrid.CreateStep1 ()V
        GH: 
            line 2083
            ldc "OnPreDistributionMerge"
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;)V
        GI: 
            line 2084
            ldc "OnDistributionMerge"
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;)V
        GJ: 
            line 2085
            ldc "OnPostDistributionMerge"
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;)V
        GK: 
            line 2087
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "VehiclesDB2.init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        GL: 
            line 2088
            getstatic zombie/vehicles/VehiclesDB2.instance Lzombie/vehicles/VehiclesDB2;
            invokevirtual zombie/vehicles/VehiclesDB2.init ()V
        GM: 
            line 2089
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "VehiclesDB2.init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        GN: 
            line 2091
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "triggerEvent OnInitWorld"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        GO: 
            line 2092
            ldc "OnInitWorld"
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;)V
        GP: 
            line 2094
            getstatic zombie/network/GameClient.client Z
            ifne GT
        GQ: 
            line 2095
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "SandboxOptions.load() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        GR: 
            line 2096
            getstatic zombie/SandboxOptions.instance Lzombie/SandboxOptions;
            invokevirtual zombie/SandboxOptions.load ()V
        GS: 
            line 2097
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "SandboxOptions.load() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        GT: 
            line 2100
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ItemPickerJava.Parse() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        GU: 
            line 2101
            invokestatic zombie/inventory/ItemPickerJava.Parse ()V
        GV: 
            line 2102
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ItemPickerJava.Parse() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        GW: 
            line 2104
            aload this
            invokestatic zombie/SandboxOptions.getInstance ()Lzombie/SandboxOptions;
            invokevirtual zombie/SandboxOptions.doesPowerGridExist ()Z
            putfield zombie/iso/IsoWorld.hydroPowerOn Z
        GX: 
            line 2106
            invokestatic zombie/ZomboidGlobals.toLua ()V
        GY: 
            line 2108
            invokestatic zombie/inventory/ItemPickerJava.InitSandboxLootSettings ()V
        GZ: 
            line 2110
            aload this
            getfield zombie/iso/IsoWorld.survivorDescriptors Ljava/util/HashMap;
            invokevirtual java/util/HashMap.clear ()V
        HA: 
            line 2112
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            invokevirtual zombie/iso/sprite/IsoSpriteManager.Dispose ()V
        HB: 
            line 2114
            getstatic zombie/network/GameClient.client Z
            ifeq IB
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.doLuaChecksum Lzombie/network/ServerOptions$BooleanServerOption;
            invokevirtual zombie/network/ServerOptions$BooleanServerOption.getValue ()Z
            ifeq IB
        HC: 
            line 2115
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "client: DoLuaChecksum start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        HD: 
            // try-start:   range=[HD-HJ] handler=HY:java/lang/Exception 
            line 2117
            getstatic zombie/network/NetChecksum.comparer Lzombie/network/NetChecksum$Comparer;
            invokevirtual zombie/network/NetChecksum$Comparer.beginCompare ()V
        HE: 
            line 2118
            ldc "IGUI_MP_Checksum"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        HF: 
            line 2119
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore start
        HG: 
            line 2120
            lload start
            lstore prevSecond
        HH: 
            line 2121
            getstatic zombie/network/GameClient.checksumValid Z
            ifne HX
        HI: 
            line 2122
            getstatic zombie/GameWindow.serverDisconnected Z
            ifeq HK
        HJ: 
            // try-end:     range=[HD-HJ] handler=HY:java/lang/Exception 
            line 2123
            return 
        HK: 
            // try-start:   range=[HK-HP] handler=HY:java/lang/Exception 
            line 2125
            invokestatic java/lang/System.currentTimeMillis ()J
            lload start
            ldc 8000L
            ladd 
            lcmp 
            ifle HQ
        HL: 
            line 2126
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            ldc "checksum: timed out waiting for the server to respond"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        HM: 
            line 2127
            getstatic zombie/network/GameClient.connection Lzombie/core/raknet/UdpConnection;
            ldc "world-timeout-response"
            invokevirtual zombie/core/raknet/UdpConnection.forceDisconnect (Ljava/lang/String;)V
        HN: 
            line 2128
            iconst_1 
            putstatic zombie/GameWindow.serverDisconnected Z
        HO: 
            line 2129
            ldc "UI_GameLoad_TimedOut"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/GameWindow.kickReason Ljava/lang/String;
        HP: 
            // try-end:     range=[HK-HP] handler=HY:java/lang/Exception 
            line 2130
            return 
        HQ: 
            // try-start:   range=[HQ-HX] handler=HY:java/lang/Exception 
            line 2132
            invokestatic java/lang/System.currentTimeMillis ()J
            lload prevSecond
            ldc 1000L
            ladd 
            lcmp 
            ifle HT
        HR: 
            line 2133
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            ldc "checksum: waited one second"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        HS: 
            line 2134
            lload prevSecond
            ldc 1000L
            ladd 
            lstore prevSecond
        HT: 
            line 2136
            getstatic zombie/network/NetChecksum.comparer Lzombie/network/NetChecksum$Comparer;
            invokevirtual zombie/network/NetChecksum$Comparer.update ()V
        HU: 
            line 2137
            getstatic zombie/network/GameClient.checksumValid Z
            ifeq HW
        HV: 
            line 2138
            goto HX
        HW: 
            line 2140
            ldc 100L
            invokestatic java/lang/Thread.sleep (J)V
            goto HH
        HX: 
            // try-end:     range=[HQ-HX] handler=HY:java/lang/Exception 
            line 2144
            goto IA
        HY: 
            // try-handler: range=[HD-HJ] handler=HY:java/lang/Exception 
            // try-handler: range=[HK-HP] handler=HY:java/lang/Exception 
            // try-handler: range=[HQ-HX] handler=HY:java/lang/Exception 
            line 2142
            astore e
        HZ: 
            line 2143
            aload e
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        IA: 
            line 2145
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "client: DoLuaChecksum end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        IB: 
            line 2148
            ldc "IGUI_MP_LoadTileDef"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        IC: 
            line 2150
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            astore spriteManager
        ID: 
            line 2152
            aload this
            getfield zombie/iso/IsoWorld.tileImages Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        IE: 
            line 2154
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "LoadTileDefinitions start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        IF: 
            line 2155
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            astore zfs
        IG: 
            line 2156
            aload this
            aload spriteManager
            aload zfs
            ldc "newtiledefinitions.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_1 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitionsPropertyStrings (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IH: 
            line 2157
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_erosion.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitionsPropertyStrings (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        II: 
            line 2158
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_overlays.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_4 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitionsPropertyStrings (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IJ: 
            line 2159
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_b42chunkcaching.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_5 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitionsPropertyStrings (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IK: 
            line 2160
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_noiseworks.patch.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_m1 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitionsPropertyStrings (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IL: 
            line 2161
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            invokevirtual zombie/ZomboidFileSystem.loadModTileDefPropertyStrings ()V
        IM: 
            line 2162
            aload this
            invokevirtual zombie/iso/IsoWorld.SetCustomPropertyValues ()V
        IN: 
            line 2164
            aload this
            invokevirtual zombie/iso/IsoWorld.GenerateTilePropertyLookupTables ()V
        IO: 
            line 2166
            aload this
            aload spriteManager
            aload zfs
            ldc "newtiledefinitions.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_1 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitions (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IP: 
            line 2167
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_erosion.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_2 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitions (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IQ: 
            line 2168
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_overlays.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_4 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitions (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IR: 
            line 2169
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_b42chunkcaching.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_5 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitions (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IS: 
            line 2170
            aload this
            aload spriteManager
            aload zfs
            ldc "tiledefinitions_noiseworks.patch.tiles"
            invokevirtual zombie/ZomboidFileSystem.getMediaPath (Ljava/lang/String;)Ljava/lang/String;
            iconst_m1 
            invokevirtual zombie/iso/IsoWorld.LoadTileDefinitions (Lzombie/iso/sprite/IsoSpriteManager;Ljava/lang/String;I)V
        IT: 
            line 2171
            aload this
            aload spriteManager
            bipush 6
            invokevirtual zombie/iso/IsoWorld.JumboTreeDefinitions (Lzombie/iso/sprite/IsoSpriteManager;I)V
        IU: 
            line 2173
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            invokevirtual zombie/ZomboidFileSystem.loadModTileDefs ()V
        IV: 
            line 2174
            ldc ""
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        IW: 
            line 2175
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "LoadTileDefinitions end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        IX: 
            line 2177
            aload spriteManager
            ldc "media/ui/missing-tile.png"
            invokevirtual zombie/iso/sprite/IsoSpriteManager.AddSprite (Ljava/lang/String;)Lzombie/iso/sprite/IsoSprite;
            pop 
        IY: 
            line 2179
            getstatic zombie/scripting/ScriptManager.instance Lzombie/scripting/ScriptManager;
            invokevirtual zombie/scripting/ScriptManager.PostTileDefinitions ()V
        IZ: 
            line 2181
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "triggerEvent OnLoadedTileDefinitions"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        JA: 
            line 2182
            ldc "OnLoadedTileDefinitions"
            aload spriteManager
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;Ljava/lang/Object;)V
        JB: 
            line 2184
            aload this
            invokevirtual zombie/iso/IsoWorld.loadedTileDefinitions ()V
        JC: 
            line 2187
            invokestatic zombie/characters/animals/AnimalDefinitions.getAnimalDefs ()Ljava/util/HashMap;
            pop 
        JD: 
            line 2189
            getstatic zombie/network/GameServer.server Z
            ifeq JH
            getstatic zombie/network/GameServer.softReset Z
            ifeq JH
        JE: 
            line 2190
            invokestatic zombie/iso/areas/isoregion/IsoRegions.init ()V
        JF: 
            line 2191
            invokestatic zombie/iso/BentFences.init ()V
        JG: 
            line 2193
            getstatic zombie/iso/WorldConverter.instance Lzombie/iso/WorldConverter;
            invokevirtual zombie/iso/WorldConverter.softreset ()V
        JH: 
            // try-start:   range=[JH-JI] handler=JJ:java/lang/Exception 
            line 2196
            invokestatic zombie/iso/weather/fx/WeatherFxMask.init ()V
        JI: 
            // try-end:     range=[JH-JI] handler=JJ:java/lang/Exception 
            line 2199
            goto JL
        JJ: 
            // try-handler: range=[JH-JI] handler=JJ:java/lang/Exception 
            line 2197
            astore e
        JK: 
            line 2198
            aload e
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        JL: 
            line 2201
            invokestatic zombie/text/templating/TemplateText.Initialize ()V
        JM: 
            line 2202
            invokestatic zombie/iso/areas/isoregion/IsoRegions.init ()V
        JN: 
            line 2203
            invokestatic zombie/iso/BentFences.init ()V
        JO: 
            line 2204
            invokestatic zombie/iso/objects/ObjectRenderEffects.init ()V
        JP: 
            line 2206
            getstatic zombie/iso/WorldConverter.instance Lzombie/iso/WorldConverter;
            getstatic zombie/core/Core.gameSaveWorld Ljava/lang/String;
            aload spriteManager
            invokevirtual zombie/iso/WorldConverter.convert (Ljava/lang/String;Lzombie/iso/sprite/IsoSpriteManager;)V
        JQ: 
            line 2207
            getstatic zombie/gameStates/GameLoadingState.worldVersionError Z
            ifeq JS
        JR: 
            line 2208
            return 
        JS: 
            line 2212
            getstatic zombie/SandboxOptions.instance Lzombie/SandboxOptions;
            invokevirtual zombie/SandboxOptions.handleOldZombiesFile2 ()V
        JT: 
            line 2214
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "GameTime.init() and load() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        JU: 
            line 2215
            invokestatic zombie/GameTime.getInstance ()Lzombie/GameTime;
            invokevirtual zombie/GameTime.init ()V
        JV: 
            line 2216
            invokestatic zombie/GameTime.getInstance ()Lzombie/GameTime;
            invokevirtual zombie/GameTime.load ()V
        JW: 
            line 2217
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "GameTime.init() and load() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        JX: 
            line 2219
            invokestatic zombie/iso/weather/fog/ImprovedFog.init ()V
        JY: 
            line 2221
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ZomboidRadio.Init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        JZ: 
            line 2222
            invokestatic zombie/radio/ZomboidRadio.getInstance ()Lzombie/radio/ZomboidRadio;
            getstatic zombie/iso/IsoWorld.savedWorldVersion I
            invokevirtual zombie/radio/ZomboidRadio.Init (I)V
        KA: 
            line 2223
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ZomboidRadio.Init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KB: 
            line 2225
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "GlobalModData.init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KC: 
            line 2226
            getstatic zombie/world/moddata/GlobalModData.instance Lzombie/world/moddata/GlobalModData;
            invokevirtual zombie/world/moddata/GlobalModData.init ()V
        KD: 
            line 2227
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "GlobalModData.init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KE: 
            line 2229
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "InstanceTracker.load() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KF: 
            line 2230
            invokestatic zombie/iso/InstanceTracker.load ()V
        KG: 
            line 2231
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "InstanceTracker.load() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KH: 
            line 2233
            getstatic zombie/network/GameServer.server Z
            ifeq KJ
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.getPoisonousBerry ()Ljava/lang/String;
            ifnonnull KJ
        KI: 
            line 2234
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.initPoisonousBerry ()V
        KJ: 
            line 2237
            getstatic zombie/network/GameServer.server Z
            ifeq KL
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.getPoisonousMushroom ()Ljava/lang/String;
            ifnonnull KL
        KK: 
            line 2238
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.initPoisonousMushroom ()V
        KL: 
            line 2241
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ErosionGlobals.Boot() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KM: 
            line 2242
            aload spriteManager
            invokestatic zombie/erosion/ErosionGlobals.Boot (Lzombie/iso/sprite/IsoSpriteManager;)V
        KN: 
            line 2243
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ErosionGlobals.Boot() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KO: 
            line 2245
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "WorldDictionary.init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KP: 
            line 2246
            invokestatic zombie/world/WorldDictionary.init ()V
        KQ: 
            line 2247
            getstatic zombie/scripting/ScriptManager.instance Lzombie/scripting/ScriptManager;
            invokevirtual zombie/scripting/ScriptManager.PostWorldDictionaryInit ()V
        KR: 
            line 2248
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "WorldDictionary.init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KS: 
            line 2250
            invokestatic zombie/iso/FishSchoolManager.getInstance ()Lzombie/iso/FishSchoolManager;
            invokevirtual zombie/iso/FishSchoolManager.init ()V
        KT: 
            line 2252
            getstatic zombie/iso/WorldMarkers.instance Lzombie/iso/WorldMarkers;
            invokevirtual zombie/iso/WorldMarkers.init ()V
        KU: 
            line 2254
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "GameEntityManager.Init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KV: 
            line 2255
            getstatic zombie/iso/IsoWorld.savedWorldVersion I
            invokestatic zombie/entity/GameEntityManager.Init (I)V
        KW: 
            line 2256
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "GameEntityManager.Init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        KX: 
            line 2258
            getstatic zombie/network/GameServer.server Z
            ifeq KZ
        KY: 
            line 2259
            invokestatic zombie/SharedDescriptors.initSharedDescriptors ()V
        KZ: 
            line 2262
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "PersistentOutfits.init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        LA: 
            line 2263
            getstatic zombie/PersistentOutfits.instance Lzombie/PersistentOutfits;
            invokevirtual zombie/PersistentOutfits.init ()V
        LB: 
            line 2264
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "PersistentOutfits.init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        LC: 
            line 2266
            getstatic zombie/VirtualZombieManager.instance Lzombie/VirtualZombieManager;
            invokevirtual zombie/VirtualZombieManager.init ()V
        LD: 
            line 2267
            getstatic zombie/vehicles/VehicleIDMap.instance Lzombie/vehicles/VehicleIDMap;
            invokevirtual zombie/vehicles/VehicleIDMap.Reset ()V
        LE: 
            line 2268
            new zombie/vehicles/VehicleManager
            dup 
            invokespecial zombie/vehicles/VehicleManager.<init> ()V
            putstatic zombie/vehicles/VehicleManager.instance Lzombie/vehicles/VehicleManager;
        LF: 
            line 2270
            ldc "IGUI_MP_InitMap"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        LG: 
            line 2272
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/IsoMetaGrid.CreateStep2 ()V
        LH: 
            line 2273
            invokestatic zombie/iso/weather/ClimateManager.getInstance ()Lzombie/iso/weather/ClimateManager;
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/weather/ClimateManager.init (Lzombie/iso/IsoMetaGrid;)V
        LI: 
            line 2274
            invokestatic zombie/iso/areas/SafeHouse.init ()V
        LJ: 
            line 2276
            getstatic zombie/network/GameClient.client Z
            ifne LL
        LK: 
            line 2277
            invokestatic zombie/core/stash/StashSystem.init ()V
        LL: 
            line 2280
            invokestatic zombie/basements/Basements.getInstance ()Lzombie/basements/Basements;
            invokevirtual zombie/basements/Basements.beforeOnLoadMapZones ()V
        LM: 
            line 2283
            ldc "OnLoadMapZones"
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;)V
        LN: 
            line 2285
            getstatic zombie/network/GameClient.client Z
            ifne LW
        LO: 
            line 2286
            invokestatic zombie/basements/Basements.getInstance ()Lzombie/basements/Basements;
            invokevirtual zombie/basements/Basements.beforeLoadMetaGrid ()V
        LP: 
            line 2287
            invokestatic zombie/buildingRooms/BuildingRoomsEditor.getInstance ()Lzombie/buildingRooms/BuildingRoomsEditor;
            invokevirtual zombie/buildingRooms/BuildingRoomsEditor.load ()V
        LQ: 
            line 2288
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/IsoMetaGrid.load ()V
        LR: 
            line 2289
            invokestatic zombie/basements/Basements.getInstance ()Lzombie/basements/Basements;
            invokevirtual zombie/basements/Basements.afterLoadMetaGrid ()V
        LS: 
            line 2290
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            ldc "map_zone.bin"
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            dup 
            invokestatic java/util/Objects.requireNonNull (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
            invokedynamic accept (Lzombie/iso/IsoMetaGrid;)Ljava/util/function/BiConsumer; LambdaMetafactory.metafactory { (Ljava/lang/Object;Ljava/lang/Object;)V, { invokevirtual, zombie/iso/IsoMetaGrid.loadZone, (Ljava/nio/ByteBuffer;I)V }, (Ljava/nio/ByteBuffer;Ljava/lang/Integer;)V }
            invokevirtual zombie/iso/IsoMetaGrid.load (Ljava/lang/String;Ljava/util/function/BiConsumer;)V
        LT: 
            line 2291
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            ldc "metagrid"
            ldc "metacell_(-?[0-9]+)_(-?[0-9]+)\\.bin"
            invokedynamic accept ()Lzombie/util/lambda/QuadConsumer; LambdaMetafactory.metafactory { (Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V, { invokevirtual, zombie/iso/IsoMetaCell.load, (Lzombie/iso/IsoMetaGrid;Ljava/nio/ByteBuffer;I)V }, (Lzombie/iso/IsoMetaCell;Lzombie/iso/IsoMetaGrid;Ljava/nio/ByteBuffer;Ljava/lang/Integer;)V }
            invokevirtual zombie/iso/IsoMetaGrid.loadCells (Ljava/lang/String;Ljava/lang/String;Lzombie/util/lambda/QuadConsumer;)V
        LU: 
            line 2292
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            ldc "map_animals.bin"
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            dup 
            invokestatic java/util/Objects.requireNonNull (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
            invokedynamic accept (Lzombie/iso/IsoMetaGrid;)Ljava/util/function/BiConsumer; LambdaMetafactory.metafactory { (Ljava/lang/Object;Ljava/lang/Object;)V, { invokevirtual, zombie/iso/IsoMetaGrid.loadAnimalZones, (Ljava/nio/ByteBuffer;I)V }, (Ljava/nio/ByteBuffer;Ljava/lang/Integer;)V }
            invokevirtual zombie/iso/IsoMetaGrid.load (Ljava/lang/String;Ljava/util/function/BiConsumer;)V
        LV: 
            line 2293
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/IsoMetaGrid.processZones ()V
            goto LX
        LW: 
            line 2295
            invokestatic zombie/basements/Basements.getInstance ()Lzombie/basements/Basements;
            invokevirtual zombie/basements/Basements.beforeLoadMetaGrid ()V
        LX: 
            line 2298
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "triggerEvent OnLoadedMapZones"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        LY: 
            line 2299
            ldc "OnLoadedMapZones"
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;)V
        LZ: 
            line 2301
            getstatic zombie/network/GameServer.server Z
            ifeq MB
        MA: 
            line 2302
            getstatic zombie/network/ServerMap.instance Lzombie/network/ServerMap;
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/network/ServerMap.init (Lzombie/iso/IsoMetaGrid;)V
        MB: 
            line 2305
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ItemConfigurator.Preprocess() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        MC: 
            line 2306
            invokestatic zombie/inventory/ItemConfigurator.Preprocess ()V
        MD: 
            line 2307
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ItemConfigurator.Preprocess() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        ME: 
            line 2309
            iconst_0 
            istore bLoadCharacter
        MF: 
            line 2311
            iconst_0 
            istore isPlayerAlive
        MG: 
            line 2312
            getstatic zombie/network/GameClient.client Z
            ifeq MJ
        MH: 
            line 2313
            invokestatic zombie/savefile/ClientPlayerDB.getInstance ()Lzombie/savefile/ClientPlayerDB;
            invokevirtual zombie/savefile/ClientPlayerDB.clientLoadNetworkPlayer ()Z
            ifeq MK
            invokestatic zombie/savefile/ClientPlayerDB.getInstance ()Lzombie/savefile/ClientPlayerDB;
            invokevirtual zombie/savefile/ClientPlayerDB.isAliveMainNetworkPlayer ()Z
            ifeq MK
        MI: 
            line 2314
            iconst_1 
            istore isPlayerAlive
            goto MK
        MJ: 
            line 2317
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            invokevirtual zombie/ZomboidFileSystem.getCurrentSaveDir ()Ljava/lang/String;
            iconst_1 
            invokestatic zombie/savefile/PlayerDBHelper.isPlayerAlive (Ljava/lang/String;I)Z
            istore isPlayerAlive
        MK: 
            line 2320
            getstatic zombie/network/GameServer.server Z
            ifeq MM
        ML: 
            line 2321
            iconst_1 
            invokestatic zombie/savefile/ServerPlayerDB.setAllow (Z)V
        MM: 
            line 2323
            getstatic zombie/network/GameClient.client Z
            ifne MO
            getstatic zombie/network/GameServer.server Z
            ifne MO
        MN: 
            line 2324
            iconst_1 
            invokestatic zombie/savefile/PlayerDB.setAllow (Z)V
        MO: 
            line 2327
            iconst_0 
            istore WorldXA
        MP: 
            line 2328
            iconst_0 
            istore WorldYA
        MQ: 
            line 2329
            iconst_0 
            istore WorldZA
        MR: 
            line 2331
            iload isPlayerAlive
            ifeq NA
        MS: 
            line 2332
            iconst_1 
            istore bLoadCharacter
        MT: 
            line 2333
            aload this
            invokevirtual zombie/iso/IsoWorld.LoadPlayerForInfo ()Z
            ifne MV
        MU: 
            line 2334
            return 
        MV: 
            line 2336
            getstatic zombie/iso/IsoChunkMap.SWorldX [I
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            iaload 
            putstatic zombie/iso/IsoWorld.worldX I
        MW: 
            line 2337
            getstatic zombie/iso/IsoChunkMap.SWorldY [I
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            iaload 
            putstatic zombie/iso/IsoWorld.worldY I
        MX: 
            line 2339
            getstatic zombie/iso/IsoChunkMap.worldXa I
            istore WorldXA
        MY: 
            line 2340
            getstatic zombie/iso/IsoChunkMap.worldYa I
            istore WorldYA
        MZ: 
            line 2341
            getstatic zombie/iso/IsoChunkMap.worldZa I
            istore WorldZA
            goto OJ
        NA: 
            line 2343
            iconst_0 
            istore bLoadCharacter
        NB: 
            line 2345
            getstatic zombie/network/GameClient.client Z
            ifeq NP
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            invokevirtual java/lang/String.isEmpty ()Z
            ifne NP
        NC: 
            line 2346
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            ldc ","
            invokevirtual java/lang/String.split (Ljava/lang/String;)[Ljava/lang/String;
            astore spawnPoint
        ND: 
            line 2347
            aload spawnPoint
            arraylength 
            iconst_3 
            if_icmpne NO
        NE: 
            // try-start:   range=[NE-NH] handler=NI:java/lang/NumberFormatException 
            line 2349
            aload spawnPoint
            iconst_0 
            aaload 
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            putstatic zombie/iso/IsoChunkMap.mpWorldXa I
        NF: 
            line 2350
            aload spawnPoint
            iconst_1 
            aaload 
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            putstatic zombie/iso/IsoChunkMap.mpWorldYa I
        NG: 
            line 2351
            aload spawnPoint
            iconst_2 
            aaload 
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            putstatic zombie/iso/IsoChunkMap.mpWorldZa I
        NH: 
            // try-end:     range=[NE-NH] handler=NI:java/lang/NumberFormatException 
            line 2357
            goto NP
        NI: 
            // try-handler: range=[NE-NH] handler=NI:java/lang/NumberFormatException 
            line 2352
            astore ex
        NJ: 
            line 2353
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "ERROR: SpawnPoint must be x,y,z, got \"\u0001\"" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        NK: 
            line 2354
            iconst_0 
            putstatic zombie/iso/IsoChunkMap.mpWorldXa I
        NL: 
            line 2355
            iconst_0 
            putstatic zombie/iso/IsoChunkMap.mpWorldYa I
        NM: 
            line 2356
            iconst_0 
            putstatic zombie/iso/IsoChunkMap.mpWorldZa I
        NN: 
            line 2357
            goto NP
        NO: 
            line 2359
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "ERROR: SpawnPoint must be x,y,z, got \"\u0001\"" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        NP: 
            line 2363
            getstatic zombie/network/GameClient.client Z
            ifeq NQ
            getstatic zombie/iso/IsoChunkMap.mpWorldXa I
            ifne OE
            getstatic zombie/iso/IsoChunkMap.mpWorldYa I
            ifne OE
        NQ: 
            line 2364
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaPosX ()I
            putstatic zombie/iso/IsoChunkMap.worldXa I
        NR: 
            line 2365
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaPosY ()I
            putstatic zombie/iso/IsoChunkMap.worldYa I
        NS: 
            line 2366
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaPosZ ()I
            putstatic zombie/iso/IsoChunkMap.worldZa I
        NT: 
            line 2367
            getstatic zombie/network/GameClient.client Z
            ifeq OC
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.safehouseAllowRespawn Lzombie/network/ServerOptions$BooleanServerOption;
            invokevirtual zombie/network/ServerOptions$BooleanServerOption.getValue ()Z
            ifeq OC
        NU: 
            line 2368
            iconst_0 
            istore i
        NV: 
            iload i
            invokestatic zombie/iso/areas/SafeHouse.getSafehouseList ()Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge OC
        NW: 
            line 2369
            invokestatic zombie/iso/areas/SafeHouse.getSafehouseList ()Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/areas/SafeHouse
            astore safe
        NX: 
            line 2370
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getPlayers ()Ljava/util/ArrayList;
            getstatic zombie/network/GameClient.username Ljava/lang/String;
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq OB
            aload safe
            getstatic zombie/network/GameClient.username Ljava/lang/String;
            invokevirtual zombie/iso/areas/SafeHouse.isRespawnInSafehouse (Ljava/lang/String;)Z
            ifeq OB
        NY: 
            line 2371
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getX ()I
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getH ()I
            iconst_2 
            idiv 
            iadd 
            putstatic zombie/iso/IsoChunkMap.worldXa I
        NZ: 
            line 2372
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getY ()I
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getW ()I
            iconst_2 
            idiv 
            iadd 
            putstatic zombie/iso/IsoChunkMap.worldYa I
        OA: 
            line 2373
            iconst_0 
            putstatic zombie/iso/IsoChunkMap.worldZa I
        OB: 
            line 2368
            iinc i 1
            goto NV
        OC: 
            line 2378
            getstatic zombie/iso/IsoChunkMap.worldXa I
            i2f 
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            putstatic zombie/iso/IsoWorld.worldX I
        OD: 
            line 2379
            getstatic zombie/iso/IsoChunkMap.worldYa I
            i2f 
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            putstatic zombie/iso/IsoWorld.worldY I
            goto OJ
        OE: 
            line 2381
            getstatic zombie/iso/IsoChunkMap.mpWorldXa I
            putstatic zombie/iso/IsoChunkMap.worldXa I
        OF: 
            line 2382
            getstatic zombie/iso/IsoChunkMap.mpWorldYa I
            putstatic zombie/iso/IsoChunkMap.worldYa I
        OG: 
            line 2383
            getstatic zombie/iso/IsoChunkMap.mpWorldZa I
            putstatic zombie/iso/IsoChunkMap.worldZa I
        OH: 
            line 2384
            getstatic zombie/iso/IsoChunkMap.worldXa I
            i2f 
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            putstatic zombie/iso/IsoWorld.worldX I
        OI: 
            line 2385
            getstatic zombie/iso/IsoChunkMap.worldYa I
            i2f 
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            putstatic zombie/iso/IsoWorld.worldY I
        OJ: 
            line 2398
            getstatic zombie/Lua/LuaManager.env Lse/krka/kahlua/vm/KahluaTable;
            ldc "selectedDebugScenario"
            invokeinterface se/krka/kahlua/vm/KahluaTable.rawget (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast se/krka/kahlua/vm/KahluaTable
            astore selectedDebugScenario
        OK: 
            line 2399
            aload selectedDebugScenario
            ifnull OU
        OL: 
            line 2400
            aload selectedDebugScenario
            ldc "startLoc"
            invokeinterface se/krka/kahlua/vm/KahluaTable.rawget (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast se/krka/kahlua/vm/KahluaTable
            astore loc
        OM: 
            line 2402
            aload loc
            ldc "x"
            invokeinterface se/krka/kahlua/vm/KahluaTable.rawget (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/lang/Double
            invokevirtual java/lang/Double.intValue ()I
            istore x
        ON: 
            line 2403
            aload loc
            ldc "y"
            invokeinterface se/krka/kahlua/vm/KahluaTable.rawget (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/lang/Double
            invokevirtual java/lang/Double.intValue ()I
            istore y
        OO: 
            line 2404
            aload loc
            ldc "z"
            invokeinterface se/krka/kahlua/vm/KahluaTable.rawget (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/lang/Double
            invokevirtual java/lang/Double.intValue ()I
            istore z
        OP: 
            line 2405
            iload x
            putstatic zombie/iso/IsoChunkMap.worldXa I
        OQ: 
            line 2406
            iload y
            putstatic zombie/iso/IsoChunkMap.worldYa I
        OR: 
            line 2407
            iload z
            putstatic zombie/iso/IsoChunkMap.worldZa I
        OS: 
            line 2409
            getstatic zombie/iso/IsoChunkMap.worldXa I
            i2f 
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            putstatic zombie/iso/IsoWorld.worldX I
        OT: 
            line 2410
            getstatic zombie/iso/IsoChunkMap.worldYa I
            i2f 
            ldc 8F
            fdiv 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            putstatic zombie/iso/IsoWorld.worldY I
        OU: 
            line 2414
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "MapCollisionData.init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        OV: 
            line 2415
            getstatic zombie/MapCollisionData.instance Lzombie/MapCollisionData;
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getMetaGrid ()Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/MapCollisionData.init (Lzombie/iso/IsoMetaGrid;)V
        OW: 
            line 2416
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "MapCollisionData.init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        OX: 
            line 2418
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "AnimalPopulationManager.init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        OY: 
            line 2419
            invokestatic zombie/characters/animals/AnimalPopulationManager.getInstance ()Lzombie/characters/animals/AnimalPopulationManager;
            aload this
            invokevirtual zombie/iso/IsoWorld.getMetaGrid ()Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/characters/animals/AnimalPopulationManager.init (Lzombie/iso/IsoMetaGrid;)V
        OZ: 
            line 2420
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "AnimalPopulationManager.init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PA: 
            line 2422
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ZombiePopulationManager.init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PB: 
            line 2423
            getstatic zombie/popman/ZombiePopulationManager.instance Lzombie/popman/ZombiePopulationManager;
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getMetaGrid ()Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/popman/ZombiePopulationManager.init (Lzombie/iso/IsoMetaGrid;)V
        PC: 
            line 2424
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "ZombiePopulationManager.init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PD: 
            line 2426
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "Pathfind init() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PE: 
            line 2427
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.pathfindUseNativeCode Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            putstatic zombie/pathfind/nativeCode/PathfindNative.useNativeCode Z
        PF: 
            line 2428
            getstatic zombie/pathfind/nativeCode/PathfindNative.useNativeCode Z
            ifeq PH
        PG: 
            line 2429
            getstatic zombie/pathfind/nativeCode/PathfindNative.instance Lzombie/pathfind/nativeCode/PathfindNative;
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getMetaGrid ()Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/pathfind/nativeCode/PathfindNative.init (Lzombie/iso/IsoMetaGrid;)V
            goto PI
        PH: 
            line 2431
            getstatic zombie/pathfind/PolygonalMap2.instance Lzombie/pathfind/PolygonalMap2;
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getMetaGrid ()Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/pathfind/PolygonalMap2.init (Lzombie/iso/IsoMetaGrid;)V
        PI: 
            line 2433
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "Pathfind init() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PJ: 
            line 2435
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            invokevirtual zombie/iso/IsoWorld.getMetaGrid ()Lzombie/iso/IsoMetaGrid;
            invokestatic zombie/globalObjects/GlobalObjectLookup.init (Lzombie/iso/IsoMetaGrid;)V
        PK: 
            line 2436
            getstatic zombie/network/GameServer.server Z
            ifne PM
        PL: 
            line 2437
            getstatic zombie/iso/SpawnPoints.instance Lzombie/iso/SpawnPoints;
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/SpawnPoints.initSinglePlayer (Lzombie/iso/IsoMetaGrid;)V
        PM: 
            line 2440
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "WorldStreamer.create() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PN: 
            line 2441
            getstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
            invokevirtual zombie/iso/WorldStreamer.create ()V
        PO: 
            line 2442
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "WorldStreamer.create() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PP: 
            line 2444
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "CellLoader.LoadCellBinaryChunk start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PQ: 
            line 2445
            aload this
            aload spriteManager
            getstatic zombie/iso/IsoWorld.worldX I
            getstatic zombie/iso/IsoWorld.worldY I
            invokestatic zombie/iso/CellLoader.LoadCellBinaryChunk (Lzombie/iso/sprite/IsoSpriteManager;II)Lzombie/iso/IsoCell;
            putfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
        PR: 
            line 2446
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "CellLoader.LoadCellBinaryChunk start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PS: 
            line 2448
            invokestatic zombie/iso/weather/ClimateManager.getInstance ()Lzombie/iso/weather/ClimateManager;
            invokevirtual zombie/iso/weather/ClimateManager.postCellLoadSetSnow ()V
        PT: 
            line 2449
            ldc "IGUI_MP_LoadWorld"
            invokestatic zombie/core/Translator.getText (Ljava/lang/String;)Ljava/lang/String;
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        PU: 
            line 2450
            getstatic zombie/MapCollisionData.instance Lzombie/MapCollisionData;
            invokevirtual zombie/MapCollisionData.start ()V
        PV: 
            line 2452
            getstatic zombie/network/GameServer.server Z
            ifne PZ
        PW: 
            line 2453
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "MapItem.LoadWorldMap() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PX: 
            line 2454
            invokestatic zombie/inventory/types/MapItem.LoadWorldMap ()V
        PY: 
            line 2455
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "MapItem.LoadWorldMap() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        PZ: 
            line 2458
            getstatic zombie/network/GameClient.client Z
            ifeq QB
        QA: 
            line 2459
            getstatic zombie/worldMap/network/WorldMapClient.instance Lzombie/worldMap/network/WorldMapClient;
            invokevirtual zombie/worldMap/network/WorldMapClient.worldMapLoaded ()V
        QB: 
            line 2462
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "WorldStreamer.isBusy() loop start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        QC: 
            line 2463
            getstatic zombie/iso/WorldStreamer.instance Lzombie/iso/WorldStreamer;
            invokevirtual zombie/iso/WorldStreamer.isBusy ()Z
            ifeq QH
        QD: 
            // try-start:   range=[QD-QE] handler=QF:java/lang/InterruptedException 
            line 2465
            ldc 100L
            invokestatic java/lang/Thread.sleep (J)V
        QE: 
            // try-end:     range=[QD-QE] handler=QF:java/lang/InterruptedException 
            line 2467
            goto QC
        QF: 
            // try-handler: range=[QD-QE] handler=QF:java/lang/InterruptedException 
            line 2466
            astore v9
        QG: 
            line 2467
            goto QC
        QH: 
            line 2469
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "WorldStreamer.isBusy() loop end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        QI: 
            line 2473
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            astore loaded
        QJ: 
            line 2474
            aload loaded
            getstatic zombie/iso/IsoChunk.loadGridSquare Ljava/util/concurrent/ConcurrentLinkedQueue;
            invokevirtual java/util/ArrayList.addAll (Ljava/util/Collection;)Z
            pop 
        QK: 
            line 2475
            aload loaded
            invokevirtual java/util/ArrayList.iterator ()Ljava/util/Iterator;
            astore v10
        QL: 
            aload v10
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq QO
            aload v10
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/iso/IsoChunk
            astore chunk
        QM: 
            line 2476
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            aload chunk
            iconst_0 
            invokevirtual zombie/iso/IsoChunkMap.setChunkDirect (Lzombie/iso/IsoChunk;Z)Z
            pop 
        QN: 
            line 2477
            goto QL
        QO: 
            line 2479
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            iconst_0 
            aaload 
            invokevirtual zombie/iso/IsoChunkMap.calculateZExtentsForChunkMap ()V
        QP: 
            line 2481
            iconst_1 
            putstatic zombie/iso/IsoChunk.doServerRequests Z
        QQ: 
            line 2483
            iload bLoadCharacter
            ifeq QV
            getstatic zombie/SystemDisabler.doPlayerCreation Z
            ifeq QV
        QR: 
            line 2484
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getstatic zombie/iso/IsoWorld.savedWorldVersion I
            invokevirtual zombie/iso/IsoCell.LoadPlayer (I)Z
            pop 
        QS: 
            line 2486
            getstatic zombie/network/GameClient.client Z
            ifeq QU
        QT: 
            line 2487
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            getstatic zombie/network/GameClient.username Ljava/lang/String;
            invokevirtual zombie/characters/IsoPlayer.setUsername (Ljava/lang/String;)V
        QU: 
            line 2489
            invokestatic zombie/radio/ZomboidRadio.getInstance ()Lzombie/radio/ZomboidRadio;
            invokevirtual zombie/radio/ZomboidRadio.getRecordedMedia ()Lzombie/radio/media/RecordedMedia;
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/radio/media/RecordedMedia.handleLegacyListenedLines (Lzombie/characters/IsoPlayer;)V
            goto VF
        QV: 
            line 2490
            getstatic zombie/network/GameClient.client Z
            ifeq SE
        QW: 
            line 2491
            invokestatic zombie/radio/ZomboidRadio.getInstance ()Lzombie/radio/ZomboidRadio;
            invokevirtual zombie/radio/ZomboidRadio.getRecordedMedia ()Lzombie/radio/media/RecordedMedia;
            aconst_null 
            invokevirtual zombie/radio/media/RecordedMedia.handleLegacyListenedLines (Lzombie/characters/IsoPlayer;)V
        QX: 
            line 2492
            getstatic zombie/Lua/LuaManager.thread Lse/krka/kahlua/vm/KahluaThread;
            getstatic zombie/GameWindow.gameThread Ljava/lang/Thread;
            putfield se/krka/kahlua/vm/KahluaThread.debugOwnerThread Ljava/lang/Thread;
        QY: 
            line 2493
            getstatic zombie/Lua/LuaManager.debugthread Lse/krka/kahlua/vm/KahluaThread;
            getstatic zombie/GameWindow.gameThread Ljava/lang/Thread;
            putfield se/krka/kahlua/vm/KahluaThread.debugOwnerThread Ljava/lang/Thread;
        QZ: 
            line 2494
            iconst_0 
            invokestatic zombie/network/GameClient.sendCreatePlayer (B)V
        RA: 
            line 2495
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore currentTime
        RB: 
            line 2496
            iconst_0 
            istore playerLoaded
        RC: 
            // try-start:   range=[RC-RF] handler=RI:java/lang/InterruptedException 
            line 2499
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iconst_0 
            aaload 
            ifnull RE
        RD: 
            line 2500
            iconst_1 
            istore playerLoaded
        RE: 
            line 2502
            invokestatic java/lang/System.currentTimeMillis ()J
            lload currentTime
            lsub 
            ldc 30000L
            lcmp 
            ifgt RF
            iload playerLoaded
            ifeq RG
        RF: 
            // try-end:     range=[RC-RF] handler=RI:java/lang/InterruptedException 
            line 2503
            goto RK
        RG: 
            // try-start:   range=[RG-RH] handler=RI:java/lang/InterruptedException 
            line 2505
            ldc 100L
            invokestatic java/lang/Thread.sleep (J)V
        RH: 
            // try-end:     range=[RG-RH] handler=RI:java/lang/InterruptedException 
            line 2507
            goto RC
        RI: 
            // try-handler: range=[RC-RF] handler=RI:java/lang/InterruptedException 
            // try-handler: range=[RG-RH] handler=RI:java/lang/InterruptedException 
            line 2506
            astore v13
        RJ: 
            line 2507
            goto RC
        RK: 
            line 2509
            getstatic zombie/Lua/LuaManager.thread Lse/krka/kahlua/vm/KahluaThread;
            getstatic zombie/gameStates/GameLoadingState.loader Ljava/lang/Thread;
            putfield se/krka/kahlua/vm/KahluaThread.debugOwnerThread Ljava/lang/Thread;
        RL: 
            line 2510
            getstatic zombie/Lua/LuaManager.debugthread Lse/krka/kahlua/vm/KahluaThread;
            getstatic zombie/gameStates/GameLoadingState.loader Ljava/lang/Thread;
            putfield se/krka/kahlua/vm/KahluaThread.debugOwnerThread Ljava/lang/Thread;
        RM: 
            line 2511
            iload playerLoaded
            ifeq SC
        RN: 
            line 2512
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iconst_0 
            aaload 
            astore playerObj
        RO: 
            line 2513
            aload playerObj
            invokevirtual zombie/characters/IsoPlayer.getXi ()I
            putstatic zombie/iso/IsoChunkMap.worldXa I
        RP: 
            line 2514
            aload playerObj
            invokevirtual zombie/characters/IsoPlayer.getYi ()I
            putstatic zombie/iso/IsoChunkMap.worldYa I
        RQ: 
            line 2515
            aload playerObj
            invokevirtual zombie/characters/IsoPlayer.getZi ()I
            putstatic zombie/iso/IsoChunkMap.worldZa I
        RR: 
            line 2516
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getstatic zombie/iso/IsoChunkMap.worldXa I
            getstatic zombie/iso/IsoChunkMap.worldYa I
            getstatic zombie/iso/IsoChunkMap.worldZa I
            invokevirtual zombie/iso/IsoCell.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq
        RS: 
            line 2517
            aload sq
            ifnull RX
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            ifnull RX
        RT: 
            line 2518
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            getfield zombie/iso/areas/IsoRoom.def Lzombie/iso/RoomDef;
            iconst_1 
            invokevirtual zombie/iso/RoomDef.setExplored (Z)V
        RU: 
            line 2519
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            getfield zombie/iso/areas/IsoRoom.building Lzombie/iso/areas/IsoBuilding;
            iconst_1 
            invokevirtual zombie/iso/areas/IsoBuilding.setAllExplored (Z)V
        RV: 
            line 2520
            getstatic zombie/network/GameServer.server Z
            ifne RX
            getstatic zombie/network/GameClient.client Z
            ifne RX
        RW: 
            line 2521
            getstatic zombie/popman/ZombiePopulationManager.instance Lzombie/popman/ZombiePopulationManager;
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getX ()I
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getY ()I
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getZ ()I
            invokevirtual zombie/popman/ZombiePopulationManager.playerSpawnedAt (III)V
        RX: 
            line 2525
            getstatic zombie/network/GameClient.client Z
            ifne SA
        RY: 
            line 2526
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.initPoisonousBerry ()V
        RZ: 
            line 2527
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.initPoisonousMushroom ()V
        SA: 
            line 2529
            ldc "OnNewGame"
            aload playerObj
            aload sq
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
        SB: 
            line 2530
            goto SD
        SC: 
            line 2531
            new java/lang/RuntimeException
            dup 
            ldc "Character can\'t be created"
            invokespecial java/lang/RuntimeException.<init> (Ljava/lang/String;)V
            athrow 
        SD: 
            line 2533
            goto VF
        SE: 
            line 2534
            invokestatic zombie/radio/ZomboidRadio.getInstance ()Lzombie/radio/ZomboidRadio;
            invokevirtual zombie/radio/ZomboidRadio.getRecordedMedia ()Lzombie/radio/media/RecordedMedia;
            aconst_null 
            invokevirtual zombie/radio/media/RecordedMedia.handleLegacyListenedLines (Lzombie/characters/IsoPlayer;)V
        SF: 
            line 2535
            aconst_null 
            astore sq
        SG: 
            line 2537
            getstatic zombie/characters/IsoPlayer.numPlayers I
            ifne SI
        SH: 
            line 2538
            iconst_1 
            putstatic zombie/characters/IsoPlayer.numPlayers I
        SI: 
            line 2541
            getstatic zombie/iso/IsoChunkMap.worldXa I
            istore XA
        SJ: 
            line 2542
            getstatic zombie/iso/IsoChunkMap.worldYa I
            istore YA
        SK: 
            line 2543
            getstatic zombie/iso/IsoChunkMap.worldZa I
            istore ZA
        SL: 
            line 2546
            getstatic zombie/network/GameClient.client Z
            ifeq TJ
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            invokevirtual java/lang/String.isEmpty ()Z
            ifne TJ
        SM: 
            line 2547
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            ldc ","
            invokevirtual java/lang/String.split (Ljava/lang/String;)[Ljava/lang/String;
            astore spawnPoint
        SN: 
            line 2548
            aload spawnPoint
            arraylength 
            iconst_3 
            if_icmpne TI
        SO: 
            // try-start:   range=[SO-TE] handler=TF:java/lang/NumberFormatException 
            line 2550
            aload spawnPoint
            iconst_1 
            aaload 
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore YAb
        SP: 
            line 2551
            aload spawnPoint
            iconst_0 
            aaload 
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore XAb
        SQ: 
            line 2552
            aload spawnPoint
            iconst_2 
            aaload 
            invokevirtual java/lang/String.trim ()Ljava/lang/String;
            invokestatic java/lang/Integer.parseInt (Ljava/lang/String;)I
            istore ZAb
        SR: 
            line 2553
            getstatic zombie/network/GameClient.client Z
            ifeq TA
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.safehouseAllowRespawn Lzombie/network/ServerOptions$BooleanServerOption;
            invokevirtual zombie/network/ServerOptions$BooleanServerOption.getValue ()Z
            ifeq TA
        SS: 
            line 2554
            iconst_0 
            istore i
        ST: 
            iload i
            invokestatic zombie/iso/areas/SafeHouse.getSafehouseList ()Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge TA
        SU: 
            line 2555
            invokestatic zombie/iso/areas/SafeHouse.getSafehouseList ()Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/areas/SafeHouse
            astore safe
        SV: 
            line 2556
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getPlayers ()Ljava/util/ArrayList;
            getstatic zombie/network/GameClient.username Ljava/lang/String;
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifeq SZ
            aload safe
            getstatic zombie/network/GameClient.username Ljava/lang/String;
            invokevirtual zombie/iso/areas/SafeHouse.isRespawnInSafehouse (Ljava/lang/String;)Z
            ifeq SZ
        SW: 
            line 2557
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getX ()I
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getH ()I
            iconst_2 
            idiv 
            iadd 
            istore XAb
        SX: 
            line 2558
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getY ()I
            aload safe
            invokevirtual zombie/iso/areas/SafeHouse.getW ()I
            iconst_2 
            idiv 
            iadd 
            istore YAb
        SY: 
            line 2559
            iconst_0 
            istore ZAb
        SZ: 
            line 2554
            iinc i 1
            goto ST
        TA: 
            line 2563
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            iload XAb
            iload YAb
            iload ZAb
            invokevirtual zombie/iso/IsoCell.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            ifnull TE
        TB: 
            line 2564
            iload XAb
            istore XA
        TC: 
            line 2565
            iload YAb
            istore YA
        TD: 
            line 2566
            iload ZAb
            istore ZA
        TE: 
            // try-end:     range=[SO-TE] handler=TF:java/lang/NumberFormatException 
            line 2570
            goto TJ
        TF: 
            // try-handler: range=[SO-TE] handler=TF:java/lang/NumberFormatException 
            line 2568
            astore ex
        TG: 
            line 2569
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "ERROR: SpawnPoint must be x,y,z, got \"\u0001\"" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        TH: 
            line 2570
            goto TJ
        TI: 
            line 2572
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.spawnPoint Lzombie/network/ServerOptions$StringServerOption;
            invokevirtual zombie/network/ServerOptions$StringServerOption.getValue ()Ljava/lang/String;
            invokedynamic makeConcatWithConstants (Ljava/lang/String;)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "ERROR: SpawnPoint must be x,y,z, got \"\u0001\"" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        TJ: 
            line 2575
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            iload XA
            iload YA
            iload ZA
            invokevirtual zombie/iso/IsoCell.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq
        TK: 
            line 2577
            getstatic zombie/SystemDisabler.doPlayerCreation Z
            ifeq VF
            getstatic zombie/network/GameServer.server Z
            ifne VF
        TL: 
            line 2578
            aload sq
            ifnull TQ
            aload sq
            iconst_0 
            invokevirtual zombie/iso/IsoGridSquare.isFree (Z)Z
            ifeq TQ
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            ifnull TQ
        TM: 
            line 2579
            aload sq
            astore last
        TN: 
            line 2580
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            invokevirtual zombie/iso/areas/IsoRoom.getFreeTile ()Lzombie/iso/IsoGridSquare;
            astore sq
        TO: 
            line 2581
            aload sq
            ifnonnull TQ
        TP: 
            line 2582
            aload last
            astore sq
        TQ: 
            line 2586
            aconst_null 
            astore player
        TR: 
            line 2587
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaPlayerDesc ()Lzombie/characters/SurvivorDesc;
            ifnull UK
        TS: 
            line 2588
            getstatic zombie/network/GameClient.client Z
            ifeq TZ
            getstatic zombie/network/ServerOptions.instance Lzombie/network/ServerOptions;
            getfield zombie/network/ServerOptions.safehouseAllowRespawn Lzombie/network/ServerOptions$BooleanServerOption;
            invokevirtual zombie/network/ServerOptions$BooleanServerOption.getValue ()Z
            ifeq TZ
        TT: 
            line 2589
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getstatic zombie/iso/IsoChunkMap.worldXa I
            getstatic zombie/iso/IsoChunkMap.worldYa I
            getstatic zombie/iso/IsoChunkMap.worldZa I
            invokevirtual zombie/iso/IsoCell.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq
        TU: 
            line 2591
            aload sq
            ifnull TZ
            aload sq
            iconst_0 
            invokevirtual zombie/iso/IsoGridSquare.isFree (Z)Z
            ifeq TZ
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            ifnull TZ
        TV: 
            line 2592
            aload sq
            astore last
        TW: 
            line 2593
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            invokevirtual zombie/iso/areas/IsoRoom.getFreeTile ()Lzombie/iso/IsoGridSquare;
            astore sq
        TX: 
            line 2594
            aload sq
            ifnonnull TZ
        TY: 
            line 2595
            aload last
            astore sq
        TZ: 
            line 2600
            aload sq
            ifnonnull UB
        UA: 
            line 2601
            new java/lang/RuntimeException
            dup 
            iload XA
            iload YA
            iload ZA
            invokedynamic makeConcatWithConstants (III)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "can\'t create player at x,y,z=\u0001,\u0001,\u0001 because the square is null" }
            invokespecial java/lang/RuntimeException.<init> (Ljava/lang/String;)V
            athrow 
        UB: 
            line 2603
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            invokevirtual zombie/core/physics/WorldSimulation.create ()V
        UC: 
            line 2604
            new zombie/characters/IsoPlayer
            dup 
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaPlayerDesc ()Lzombie/characters/SurvivorDesc;
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getX ()I
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getY ()I
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getZ ()I
            invokespecial zombie/characters/IsoPlayer.<init> (Lzombie/iso/IsoCell;Lzombie/characters/SurvivorDesc;III)V
            astore player
        UD: 
            line 2606
            getstatic zombie/network/GameClient.client Z
            ifeq UF
        UE: 
            line 2607
            aload player
            getstatic zombie/network/GameClient.username Ljava/lang/String;
            invokevirtual zombie/characters/IsoPlayer.setUsername (Ljava/lang/String;)V
        UF: 
            line 2609
            aload player
            getstatic zombie/iso/IsoDirections.SE Lzombie/iso/IsoDirections;
            invokevirtual zombie/characters/IsoPlayer.setDir (Lzombie/iso/IsoDirections;)V
        UG: 
            line 2610
            aload player
            iconst_1 
            putfield zombie/characters/IsoPlayer.sqlId I
        UH: 
            line 2611
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iconst_0 
            aload player
            aastore 
        UI: 
            line 2612
            aload player
            invokestatic zombie/characters/IsoPlayer.setInstance (Lzombie/characters/IsoPlayer;)V
        UJ: 
            line 2613
            aload player
            invokestatic zombie/iso/IsoCamera.setCameraCharacter (Lzombie/characters/IsoGameCharacter;)Z
            pop 
        UK: 
            line 2615
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            astore playerObj
        UL: 
            line 2616
            aload playerObj
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaTraits ()Ljava/util/List;
            invokevirtual zombie/characters/IsoPlayer.applyTraits (Ljava/util/List;)V
        UM: 
            line 2617
            aload playerObj
            invokevirtual zombie/characters/IsoPlayer.getDescriptor ()Lzombie/characters/SurvivorDesc;
            invokevirtual zombie/characters/SurvivorDesc.getCharacterProfession ()Lzombie/scripting/objects/CharacterProfession;
            invokestatic zombie/characters/professions/CharacterProfessionDefinition.getCharacterProfessionDefinition (Lzombie/scripting/objects/CharacterProfession;)Lzombie/characters/professions/CharacterProfessionDefinition;
            astore characterProfessionDefinition
        UN: 
            line 2618
            aload characterProfessionDefinition
            invokevirtual zombie/characters/professions/CharacterProfessionDefinition.hasGrantedRecipes ()Z
            ifeq UP
        UO: 
            line 2619
            aload playerObj
            invokevirtual zombie/characters/IsoPlayer.getKnownRecipes ()Ljava/util/List;
            aload characterProfessionDefinition
            invokevirtual zombie/characters/professions/CharacterProfessionDefinition.getGrantedRecipes ()Ljava/util/ArrayList;
            invokeinterface java/util/List.addAll (Ljava/util/Collection;)Z
            pop 
        UP: 
            line 2621
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaTraits ()Ljava/util/List;
            invokeinterface java/util/List.iterator ()Ljava/util/Iterator;
            astore v17
        UQ: 
            aload v17
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq UV
            aload v17
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast zombie/scripting/objects/CharacterTrait
            astore characterTrait
        UR: 
            line 2622
            aload characterTrait
            invokestatic zombie/characters/traits/CharacterTraitDefinition.getCharacterTraitDefinition (Lzombie/scripting/objects/CharacterTrait;)Lzombie/characters/traits/CharacterTraitDefinition;
            astore characterTraitDefinition
        US: 
            line 2623
            aload characterTraitDefinition
            invokevirtual zombie/characters/traits/CharacterTraitDefinition.hasGrantedRecipes ()Z
            ifeq UU
        UT: 
            line 2624
            aload playerObj
            invokevirtual zombie/characters/IsoPlayer.getKnownRecipes ()Ljava/util/List;
            aload characterTraitDefinition
            invokevirtual zombie/characters/traits/CharacterTraitDefinition.getGrantedRecipes ()Ljava/util/ArrayList;
            invokeinterface java/util/List.addAll (Ljava/util/Collection;)Z
            pop 
        UU: 
            line 2626
            goto UQ
        UV: 
            line 2628
            aload sq
            ifnull VB
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            ifnull VB
        UW: 
            line 2629
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            getfield zombie/iso/areas/IsoRoom.def Lzombie/iso/RoomDef;
            iconst_1 
            invokevirtual zombie/iso/RoomDef.setExplored (Z)V
        UX: 
            line 2630
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            getfield zombie/iso/areas/IsoRoom.building Lzombie/iso/areas/IsoBuilding;
            iconst_1 
            invokevirtual zombie/iso/areas/IsoBuilding.setAllExplored (Z)V
        UY: 
            line 2631
            aload this
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getRoom ()Lzombie/iso/areas/IsoRoom;
            invokevirtual zombie/iso/areas/IsoRoom.getBuilding ()Lzombie/iso/areas/IsoBuilding;
            invokevirtual zombie/iso/IsoWorld.setBasementAllExplored (Lzombie/iso/areas/IsoBuilding;)V
        UZ: 
            line 2632
            getstatic zombie/network/GameServer.server Z
            ifne VB
            getstatic zombie/network/GameClient.client Z
            ifne VB
        VA: 
            line 2633
            getstatic zombie/popman/ZombiePopulationManager.instance Lzombie/popman/ZombiePopulationManager;
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getX ()I
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getY ()I
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.getZ ()I
            invokevirtual zombie/popman/ZombiePopulationManager.playerSpawnedAt (III)V
        VB: 
            line 2637
            getstatic zombie/network/GameClient.client Z
            ifne VE
        VC: 
            line 2638
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.initPoisonousBerry ()V
        VD: 
            line 2639
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.initPoisonousMushroom ()V
        VE: 
            line 2641
            ldc "OnNewGame"
            aload player
            aload sq
            invokestatic zombie/Lua/LuaEventManager.triggerEvent (Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
        VF: 
            line 2644
            invokestatic zombie/savefile/PlayerDB.isAllow ()Z
            ifeq VH
        VG: 
            line 2645
            invokestatic zombie/savefile/PlayerDB.getInstance ()Lzombie/savefile/PlayerDB;
            iconst_1 
            putfield zombie/savefile/PlayerDB.canSavePlayers Z
        VH: 
            line 2650
            getstatic zombie/ui/TutorialManager.instance Lzombie/ui/TutorialManager;
            iconst_0 
            putfield zombie/ui/TutorialManager.activeControlZombies Z
        VI: 
            line 2652
            getstatic zombie/ReanimatedPlayers.instance Lzombie/ReanimatedPlayers;
            invokevirtual zombie/ReanimatedPlayers.loadReanimatedPlayers ()V
        VJ: 
            line 2654
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            ifnull VZ
        VK: 
            line 2655
            getstatic zombie/network/GameClient.client Z
            ifeq VV
        VL: 
            line 2657
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.getX ()F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            istore x
        VM: 
            line 2658
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.getY ()F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            istore y
        VN: 
            line 2659
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.getZ ()F
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            istore z
        VO: 
            line 2660
            iload z
            ifle VV
        VP: 
            line 2661
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            iload x
            iload y
            iload z
            i2f 
            invokestatic zombie/core/math/PZMath.fastfloor (F)I
            invokevirtual zombie/iso/IsoCell.getGridSquare (III)Lzombie/iso/IsoGridSquare;
            astore sq
        VQ: 
            line 2662
            aload sq
            ifnull VS
            aload sq
            invokevirtual zombie/iso/IsoGridSquare.TreatAsSolidFloor ()Z
            ifeq VS
        VR: 
            line 2663
            goto VV
        VS: 
            line 2665
            iinc z -1
        VT: 
            line 2666
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            iload z
            i2f 
            invokevirtual zombie/characters/IsoPlayer.setZ (F)F
            pop 
        VU: 
            line 2667
            goto VO
        VV: 
            line 2669
            getstatic zombie/scripting/ScriptManager.instance Lzombie/scripting/ScriptManager;
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/scripting/ScriptManager.checkAutoLearn (Lzombie/characters/IsoGameCharacter;)V
        VW: 
            line 2670
            getstatic zombie/scripting/ScriptManager.instance Lzombie/scripting/ScriptManager;
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/scripting/ScriptManager.checkMetaRecipes (Lzombie/characters/IsoGameCharacter;)V
        VX: 
            line 2671
            getstatic zombie/scripting/ScriptManager.instance Lzombie/scripting/ScriptManager;
            invokevirtual zombie/scripting/ScriptManager.VerifyAllCraftRecipesAreLearnable ()V
        VY: 
            line 2673
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.setCurrentSquareFromPosition ()V
        VZ: 
            line 2677
            aload this
            invokevirtual zombie/iso/IsoWorld.PopulateCellWithSurvivors ()V
        WA: 
            line 2680
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iconst_0 
            aaload 
            ifnull WC
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getObjectList ()Ljava/util/ArrayList;
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iconst_0 
            aaload 
            invokevirtual java/util/ArrayList.contains (Ljava/lang/Object;)Z
            ifne WC
        WB: 
            line 2681
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getObjectList ()Ljava/util/ArrayList;
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iconst_0 
            aaload 
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        WC: 
            line 2684
            getstatic zombie/iso/LightingThread.instance Lzombie/iso/LightingThread;
            invokevirtual zombie/iso/LightingThread.create ()V
        WD: 
            line 2686
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "MetaTracker.load() start"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        WE: 
            line 2687
            invokestatic zombie/iso/MetaTracker.load ()V
        WF: 
            line 2688
            getstatic zombie/debug/DebugLog.General Lzombie/debug/DebugLogStream;
            ldc "MetaTracker.load() end"
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        WG: 
            line 2689
            invokestatic zombie/statistics/StatisticsManager.getInstance ()Lzombie/statistics/StatisticsManager;
            invokevirtual zombie/statistics/StatisticsManager.load ()V
        WH: 
            line 2691
            ldc ""
            putstatic zombie/gameStates/GameLoadingState.gameLoadingString Ljava/lang/String;
        WI: 
            line 2693
            invokestatic zombie/iso/IsoWorld.initMessaging ()V
        WJ: 
            line 2695
            invokestatic zombie/world/WorldDictionary.onWorldLoaded ()V
        WK: 
            line 2697
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.initWeatherFx ()Z
            pop 
        WL: 
            line 2702
            getstatic zombie/scripting/ScriptManager.instance Lzombie/scripting/ScriptManager;
            getstatic zombie/core/Core.debug Z
            ifne WM
            iconst_1 
            goto WN
        WM: 
            iconst_0 
        WN: 
            invokevirtual zombie/scripting/ScriptManager.hasLoadErrors (Z)Z
            ifne WO
            invokestatic zombie/entity/components/spriteconfig/SpriteConfigManager.HasLoadErrors ()Z
            ifeq WS
        WO: 
            line 2703
            getstatic zombie/debug/DebugLog.Moveable Lzombie/debug/DebugLogStream;
            getstatic zombie/scripting/ScriptManager.instance Lzombie/scripting/ScriptManager;
            getstatic zombie/core/Core.debug Z
            ifne WP
            iconst_1 
            goto WQ
        WP: 
            iconst_0 
        WQ: 
            invokevirtual zombie/scripting/ScriptManager.hasLoadErrors (Z)Z
            invokestatic zombie/entity/components/spriteconfig/SpriteConfigManager.HasLoadErrors ()Z
            invokedynamic makeConcatWithConstants (ZZ)Ljava/lang/String; { invokestatic, java/lang/invoke/StringConcatFactory.makeConcatWithConstants, (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite; } { "script error = \u0001, sprite error = \u0001" }
            invokevirtual zombie/debug/DebugLogStream.println (Ljava/lang/String;)V
        WR: 
            line 2704
            new zombie/world/WorldDictionaryException
            dup 
            ldc "World loading could not proceed, there are script load errors. (Actual error may be printed earlier in log)"
            invokespecial zombie/world/WorldDictionaryException.<init> (Ljava/lang/String;)V
            athrow 
        WS: 
            line 2706
            return 
        WT: 
        }
    }

    .method private setBasementAllExplored (Lzombie/iso/areas/IsoBuilding;)V {
        parameters: { this, spawnBuilding },
        code: {
        A: 
            line 2709
            aload spawnBuilding
            invokevirtual zombie/iso/areas/IsoBuilding.getDef ()Lzombie/iso/BuildingDef;
            astore spawnBuildingDef
        B: 
            line 2710
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            astore buildingDefs
        C: 
            line 2711
            getstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            aload spawnBuildingDef
            invokevirtual zombie/iso/BuildingDef.getX ()I
            aload spawnBuildingDef
            invokevirtual zombie/iso/BuildingDef.getY ()I
            aload spawnBuildingDef
            invokevirtual zombie/iso/BuildingDef.getW ()I
            aload spawnBuildingDef
            invokevirtual zombie/iso/BuildingDef.getH ()I
            aload buildingDefs
            invokevirtual zombie/iso/IsoMetaGrid.getBuildingsIntersecting (IIIILjava/util/ArrayList;)V
        D: 
            line 2712
            iconst_0 
            istore i
        E: 
            iload i
            aload buildingDefs
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge J
        F: 
            line 2713
            aload buildingDefs
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/BuildingDef
            astore candidateDef
        G: 
            line 2714
            aload candidateDef
            invokevirtual zombie/iso/BuildingDef.getMinLevel ()I
            ifge I
        H: 
            line 2715
            aload candidateDef
            iconst_1 
            invokevirtual zombie/iso/BuildingDef.setAllExplored (Z)V
        I: 
            line 2712
            iinc i 1
            goto E
        J: 
            line 2718
            return 
        K: 
        }
    }

    .method readWorldVersion ()I {
        parameters: { this },
        exceptions: { 
            { E, K, O, Ljava/lang/Throwable; }, 
            { P, Q, R, Ljava/lang/Throwable; }, 
            { D, L, U, Ljava/lang/Throwable; }, 
            { N, T, U, Ljava/lang/Throwable; }, 
            { V, W, X, Ljava/lang/Throwable; }, 
            { C, M, AA, Ljava/io/FileNotFoundException; }, 
            { N, Z, AA, Ljava/io/FileNotFoundException; }, 
            { C, M, AC, Ljava/io/IOException; }, 
            { N, Z, AC, Ljava/io/IOException; }, 
            { AI, AJ, AM, Ljava/lang/Throwable; }, 
            { AN, AO, AP, Ljava/lang/Throwable; }, 
            { AH, AK, AR, Ljava/lang/Throwable; }, 
            { AM, AR, AR, Ljava/lang/Throwable; }, 
            { AS, AT, AU, Ljava/lang/Throwable; }, 
            { AG, AL, AW, Ljava/io/FileNotFoundException; }, 
            { AM, AW, AW, Ljava/io/FileNotFoundException; }, 
            { AG, AL, AY, Ljava/io/IOException; }, 
            { AM, AW, AY, Ljava/io/IOException; }
         },
        code: {
        A: 
            line 2722
            getstatic zombie/network/GameServer.server Z
            ifeq AF
        B: 
            line 2723
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            ldc "map_t.bin"
            invokevirtual zombie/ZomboidFileSystem.getFileInCurrentSave (Ljava/lang/String;)Ljava/io/File;
            astore file
        C: 
            // try-start:   range=[C-M] handler=AA:java/io/FileNotFoundException 
            // try-start:   range=[C-M] handler=AC:java/io/IOException 
            line 2724
            new java/io/FileInputStream
            dup 
            aload file
            invokespecial java/io/FileInputStream.<init> (Ljava/io/File;)V
            astore fis
        D: 
            // try-start:   range=[D-L] handler=U:java/lang/Throwable 
            new java/io/DataInputStream
            dup 
            aload fis
            invokespecial java/io/DataInputStream.<init> (Ljava/io/InputStream;)V
            astore dis
        E: 
            // try-start:   range=[E-K] handler=O:java/lang/Throwable 
            line 2725
            aload dis
            invokevirtual java/io/DataInputStream.readByte ()B
            istore b1
        F: 
            line 2726
            aload dis
            invokevirtual java/io/DataInputStream.readByte ()B
            istore b2
        G: 
            line 2727
            aload dis
            invokevirtual java/io/DataInputStream.readByte ()B
            istore b3
        H: 
            line 2728
            aload dis
            invokevirtual java/io/DataInputStream.readByte ()B
            istore b4
        I: 
            line 2729
            iload b1
            bipush 71
            if_icmpne N
            iload b2
            bipush 77
            if_icmpne N
            iload b3
            bipush 84
            if_icmpne N
            iload b4
            bipush 77
            if_icmpne N
        J: 
            line 2730
            aload dis
            invokevirtual java/io/DataInputStream.readInt ()I
            istore i8
        K: 
            // try-end:     range=[E-K] handler=O:java/lang/Throwable 
            line 2732
            aload dis
            invokevirtual java/io/DataInputStream.close ()V
        L: 
            // try-end:     range=[D-L] handler=U:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        M: 
            // try-end:     range=[C-M] handler=AA:java/io/FileNotFoundException 
            // try-end:     range=[C-M] handler=AC:java/io/IOException 
            line 2730
            iload i8
            ireturn 
        N: 
            // try-start:   range=[N-T] handler=U:java/lang/Throwable 
            // try-start:   range=[N-Z] handler=AA:java/io/FileNotFoundException 
            // try-start:   range=[N-Z] handler=AC:java/io/IOException 
            line 2732
            aload dis
            invokevirtual java/io/DataInputStream.close ()V
            goto T
        O: 
            // try-handler: range=[E-K] handler=O:java/lang/Throwable 
            line 2724
            astore v4
        P: 
            // try-start:   range=[P-Q] handler=R:java/lang/Throwable 
            aload dis
            invokevirtual java/io/DataInputStream.close ()V
        Q: 
            // try-end:     range=[P-Q] handler=R:java/lang/Throwable 
            goto S
        R: 
            // try-handler: range=[P-Q] handler=R:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        S: 
            aload v4
            athrow 
        T: 
            // try-end:     range=[N-T] handler=U:java/lang/Throwable 
            line 2732
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
            goto Z
        U: 
            // try-handler: range=[D-L] handler=U:java/lang/Throwable 
            // try-handler: range=[N-T] handler=U:java/lang/Throwable 
            line 2724
            astore v3
        V: 
            // try-start:   range=[V-W] handler=X:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        W: 
            // try-end:     range=[V-W] handler=X:java/lang/Throwable 
            goto Y
        X: 
            // try-handler: range=[V-W] handler=X:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        Y: 
            aload v3
            athrow 
        Z: 
            // try-end:     range=[N-Z] handler=AA:java/io/FileNotFoundException 
            // try-end:     range=[N-Z] handler=AC:java/io/IOException 
            line 2735
            goto AE
        AA: 
            // try-handler: range=[C-M] handler=AA:java/io/FileNotFoundException 
            // try-handler: range=[N-Z] handler=AA:java/io/FileNotFoundException 
            line 2732
            astore v2
        AB: 
            line 2735
            goto AE
        AC: 
            // try-handler: range=[C-M] handler=AC:java/io/IOException 
            // try-handler: range=[N-Z] handler=AC:java/io/IOException 
            line 2733
            astore ex
        AD: 
            line 2734
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        AE: 
            line 2736
            iconst_m1 
            ireturn 
        AF: 
            line 2739
            getstatic zombie/ZomboidFileSystem.instance Lzombie/ZomboidFileSystem;
            ldc "map_ver.bin"
            invokevirtual zombie/ZomboidFileSystem.getFileInCurrentSave (Ljava/lang/String;)Ljava/io/File;
            astore file
        AG: 
            // try-start:   range=[AG-AL] handler=AW:java/io/FileNotFoundException 
            // try-start:   range=[AG-AL] handler=AY:java/io/IOException 
            line 2740
            new java/io/FileInputStream
            dup 
            aload file
            invokespecial java/io/FileInputStream.<init> (Ljava/io/File;)V
            astore fis
        AH: 
            // try-start:   range=[AH-AK] handler=AR:java/lang/Throwable 
            new java/io/DataInputStream
            dup 
            aload fis
            invokespecial java/io/DataInputStream.<init> (Ljava/io/InputStream;)V
            astore dis
        AI: 
            // try-start:   range=[AI-AJ] handler=AM:java/lang/Throwable 
            line 2741
            aload dis
            invokevirtual java/io/DataInputStream.readInt ()I
            istore i4
        AJ: 
            // try-end:     range=[AI-AJ] handler=AM:java/lang/Throwable 
            line 2742
            aload dis
            invokevirtual java/io/DataInputStream.close ()V
        AK: 
            // try-end:     range=[AH-AK] handler=AR:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        AL: 
            // try-end:     range=[AG-AL] handler=AW:java/io/FileNotFoundException 
            // try-end:     range=[AG-AL] handler=AY:java/io/IOException 
            line 2741
            iload i4
            ireturn 
        AM: 
            // try-handler: range=[AI-AJ] handler=AM:java/lang/Throwable 
            // try-start:   range=[AM-AR] handler=AR:java/lang/Throwable 
            // try-start:   range=[AM-AW] handler=AW:java/io/FileNotFoundException 
            // try-start:   range=[AM-AW] handler=AY:java/io/IOException 
            line 2740
            astore v4
        AN: 
            // try-start:   range=[AN-AO] handler=AP:java/lang/Throwable 
            aload dis
            invokevirtual java/io/DataInputStream.close ()V
        AO: 
            // try-end:     range=[AN-AO] handler=AP:java/lang/Throwable 
            goto AQ
        AP: 
            // try-handler: range=[AN-AO] handler=AP:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AQ: 
            aload v4
            athrow 
        AR: 
            // try-handler: range=[AH-AK] handler=AR:java/lang/Throwable 
            // try-end:     range=[AM-AR] handler=AR:java/lang/Throwable 
            // try-handler: range=[AM-AR] handler=AR:java/lang/Throwable 
            astore v3
        AS: 
            // try-start:   range=[AS-AT] handler=AU:java/lang/Throwable 
            aload fis
            invokevirtual java/io/FileInputStream.close ()V
        AT: 
            // try-end:     range=[AS-AT] handler=AU:java/lang/Throwable 
            goto AV
        AU: 
            // try-handler: range=[AS-AT] handler=AU:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AV: 
            aload v3
            athrow 
        AW: 
            // try-handler: range=[AG-AL] handler=AW:java/io/FileNotFoundException 
            // try-end:     range=[AM-AW] handler=AW:java/io/FileNotFoundException 
            // try-handler: range=[AM-AW] handler=AW:java/io/FileNotFoundException 
            // try-end:     range=[AM-AW] handler=AY:java/io/IOException 
            line 2742
            astore v2
        AX: 
            line 2745
            goto BA
        AY: 
            // try-handler: range=[AG-AL] handler=AY:java/io/IOException 
            // try-handler: range=[AM-AW] handler=AY:java/io/IOException 
            line 2743
            astore ex
        AZ: 
            line 2744
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        BA: 
            line 2746
            iconst_m1 
            ireturn 
        BB: 
        }
    }

    .signature "()Ljava/util/List<Lzombie/scripting/objects/CharacterTrait;>;"
    .method public getLuaTraits ()Ljava/util/List; {
        parameters: { this },
        code: {
        A: 
            line 2750
            aload this
            getfield zombie/iso/IsoWorld.luatraits Ljava/util/List;
            areturn 
        B: 
        }
    }

    .method public addLuaTrait (Lzombie/scripting/objects/CharacterTrait;)V {
        parameters: { this, trait },
        code: {
        A: 
            line 2754
            aload this
            invokevirtual zombie/iso/IsoWorld.getLuaTraits ()Ljava/util/List;
            aload trait
            invokeinterface java/util/List.add (Ljava/lang/Object;)Z
            pop 
        B: 
            line 2755
            return 
        C: 
        }
    }

    .method public getLuaPlayerDesc ()Lzombie/characters/SurvivorDesc; {
        parameters: { this },
        code: {
        A: 
            line 2758
            aload this
            getfield zombie/iso/IsoWorld.luaDesc Lzombie/characters/SurvivorDesc;
            areturn 
        B: 
        }
    }

    .method public setLuaPlayerDesc (Lzombie/characters/SurvivorDesc;)V {
        parameters: { this, desc },
        code: {
        A: 
            line 2762
            aload this
            aload desc
            putfield zombie/iso/IsoWorld.luaDesc Lzombie/characters/SurvivorDesc;
        B: 
            line 2763
            return 
        C: 
        }
    }

    .method public KillCell ()V {
        parameters: { this },
        code: {
        A: 
            line 2766
            aload this
            getfield zombie/iso/IsoWorld.helicopter Lzombie/iso/Helicopter;
            invokevirtual zombie/iso/Helicopter.deactivate ()V
        B: 
            line 2768
            getstatic zombie/CollisionManager.instance Lzombie/CollisionManager;
            getfield zombie/CollisionManager.contactMap Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        C: 
            line 2769
            invokestatic zombie/network/id/ObjectIDManager.getInstance ()Lzombie/network/id/ObjectIDManager;
            invokevirtual zombie/network/id/ObjectIDManager.clear ()V
        D: 
            line 2770
            getstatic zombie/FliesSound.instance Lzombie/FliesSound;
            invokevirtual zombie/FliesSound.Reset ()V
        E: 
            line 2771
            getstatic zombie/iso/IsoObjectPicker.Instance Lzombie/iso/IsoObjectPicker;
            invokevirtual zombie/iso/IsoObjectPicker.Init ()V
        F: 
            line 2772
            getstatic zombie/iso/IsoChunkMap.SharedChunks Ljava/util/HashMap;
            invokevirtual java/util/HashMap.clear ()V
        G: 
            line 2773
            getstatic zombie/SoundManager.instance Lzombie/BaseSoundManager;
            invokevirtual zombie/BaseSoundManager.StopMusic ()V
        H: 
            line 2774
            getstatic zombie/WorldSoundManager.instance Lzombie/WorldSoundManager;
            invokevirtual zombie/WorldSoundManager.KillCell ()V
        I: 
            line 2775
            getstatic zombie/ai/ZombieGroupManager.instance Lzombie/ai/ZombieGroupManager;
            invokevirtual zombie/ai/ZombieGroupManager.Reset ()V
        J: 
            line 2776
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.Dispose ()V
        K: 
            line 2777
            getstatic zombie/iso/sprite/IsoSpriteManager.instance Lzombie/iso/sprite/IsoSpriteManager;
            invokevirtual zombie/iso/sprite/IsoSpriteManager.Dispose ()V
        L: 
            line 2778
            aload this
            aconst_null 
            putfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
        M: 
            line 2779
            invokestatic zombie/iso/IsoLot.Dispose ()V
        N: 
            line 2781
            invokestatic zombie/characters/IsoGameCharacter.getSurvivorMap ()Ljava/util/HashMap;
            invokevirtual java/util/HashMap.clear ()V
        O: 
            line 2782
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            aconst_null 
            invokevirtual zombie/characters/IsoPlayer.setCurrent (Lzombie/iso/IsoGridSquare;)V
        P: 
            line 2783
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            aconst_null 
            invokevirtual zombie/characters/IsoPlayer.setLast (Lzombie/iso/IsoGridSquare;)V
        Q: 
            line 2784
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            aconst_null 
            putfield zombie/characters/IsoPlayer.square Lzombie/iso/IsoGridSquare;
        R: 
            line 2785
            invokestatic zombie/iso/objects/RainManager.reset ()V
        S: 
            line 2786
            invokestatic zombie/iso/objects/IsoFireManager.Reset ()V
        T: 
            line 2787
            invokestatic zombie/audio/ObjectAmbientEmitters.Reset ()V
        U: 
            line 2788
            invokestatic zombie/characters/AnimalVocalsManager.Reset ()V
        V: 
            line 2789
            invokestatic zombie/characters/ZombieVocalsManager.Reset ()V
        W: 
            line 2790
            invokestatic zombie/iso/IsoWaterFlow.Reset ()V
        X: 
            line 2791
            invokestatic zombie/buildingRooms/BuildingRoomsEditor.Reset ()V
        Y: 
            line 2792
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/IsoMetaGrid.Dispose ()V
        Z: 
            line 2793
            aload this
            getfield zombie/iso/IsoWorld.biomeMap Lzombie/iso/worldgen/maps/BiomeMap;
            invokevirtual zombie/iso/worldgen/maps/BiomeMap.Dispose ()V
        AA: 
            line 2794
            iconst_0 
            putstatic zombie/iso/areas/IsoBuilding.idCount I
        AB: 
            line 2795
            new zombie/iso/IsoWorld
            dup 
            invokespecial zombie/iso/IsoWorld.<init> ()V
            putstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
        AC: 
            line 2796
            return 
        AD: 
        }
    }

    .method public setDrawWorld (Z)V {
        parameters: { this, b },
        code: {
        A: 
            line 2799
            aload this
            iload b
            putfield zombie/iso/IsoWorld.drawWorld Z
        B: 
            line 2800
            return 
        C: 
        }
    }

    .method public sceneCullZombies ()V {
        parameters: { this },
        code: {
        A: 
            line 2808
            aload this
            getfield zombie/iso/IsoWorld.zombieWithModel Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.clear ()V
        B: 
            line 2809
            aload this
            getfield zombie/iso/IsoWorld.zombieWithoutModel Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.clear ()V
        C: 
            line 2811
            iconst_0 
            istore n
        D: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getZombieList ()Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AC
        E: 
            line 2812
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getZombieList ()Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/characters/IsoZombie
            astore z
        F: 
            line 2813
            iconst_0 
            istore withModel
        G: 
            line 2814
            iconst_0 
            istore pn
        H: 
            iload pn
            getstatic zombie/characters/IsoPlayer.numPlayers I
            if_icmpge W
        I: 
            line 2815
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iload pn
            aaload 
            astore player
        J: 
            line 2816
            aload player
            ifnonnull L
        K: 
            line 2817
            goto V
        L: 
            line 2819
            aload z
            getfield zombie/characters/IsoZombie.current Lzombie/iso/IsoGridSquare;
            ifnonnull N
        M: 
            line 2820
            goto V
        N: 
            line 2822
            aload z
            iload pn
            invokevirtual zombie/characters/IsoZombie.getScreenProperX (I)I
            i2f 
            fstore screenX
        O: 
            line 2823
            aload z
            iload pn
            invokevirtual zombie/characters/IsoZombie.getScreenProperY (I)I
            i2f 
            fstore screenY
        P: 
            line 2824
            fload screenX
            ldc -100F
            fcmpg 
            iflt V
            fload screenY
            ldc -100F
            fcmpg 
            iflt V
            fload screenX
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            iload pn
            invokevirtual zombie/core/Core.getOffscreenWidth (I)I
            bipush 100
            iadd 
            i2f 
            fcmpl 
            ifgt V
            fload screenY
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            iload pn
            invokevirtual zombie/core/Core.getOffscreenHeight (I)I
            bipush 100
            iadd 
            i2f 
            fcmpl 
            ifle R
        Q: 
            line 2825
            goto V
        R: 
            line 2827
            aload z
            iload pn
            invokevirtual zombie/characters/IsoZombie.getAlpha (I)F
            fconst_0 
            fcmpl 
            ifeq S
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.def Lzombie/iso/sprite/IsoSpriteInstance;
            getfield zombie/iso/sprite/IsoSpriteInstance.alpha F
            fconst_0 
            fcmpl 
            ifne T
        S: 
            aload z
            getfield zombie/characters/IsoZombie.current Lzombie/iso/IsoGridSquare;
            iload pn
            invokevirtual zombie/iso/IsoGridSquare.isCouldSee (I)Z
            ifne T
            aload z
            aload player
            invokevirtual zombie/characters/IsoZombie.couldSeeHeadSquare (Lzombie/characters/IsoPlayer;)Z
            ifeq V
        T: 
            line 2828
            iconst_1 
            istore withModel
        U: 
            line 2829
            goto W
        V: 
            line 2814
            iinc pn 1
            goto H
        W: 
            line 2832
            iload withModel
            ifeq Y
            aload z
            invokestatic zombie/ai/states/FakeDeadZombieState.instance ()Lzombie/ai/states/FakeDeadZombieState;
            invokevirtual zombie/characters/IsoZombie.isCurrentState (Lzombie/ai/State;)Z
            ifeq Y
        X: 
            line 2833
            iconst_0 
            istore withModel
        Y: 
            line 2835
            iload withModel
            ifeq AA
        Z: 
            line 2836
            aload this
            getfield zombie/iso/IsoWorld.zombieWithModel Lzombie/util/list/PZArrayList;
            aload z
            invokevirtual zombie/util/list/PZArrayList.add (Ljava/lang/Object;)Z
            pop 
            goto AB
        AA: 
            line 2838
            aload this
            getfield zombie/iso/IsoWorld.zombieWithoutModel Lzombie/util/list/PZArrayList;
            aload z
            invokevirtual zombie/util/list/PZArrayList.add (Ljava/lang/Object;)Z
            pop 
        AB: 
            line 2811
            iinc n 1
            goto D
        AC: 
            line 2842
            aload this
            getfield zombie/iso/IsoWorld.timSort Lzombie/entity/util/TimSort;
            aload this
            getfield zombie/iso/IsoWorld.zombieWithModel Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.getElements ()[Ljava/lang/Object;
            getstatic zombie/iso/IsoWorld.compScoreToPlayer Lzombie/iso/IsoWorld$CompScoreToPlayer;
            iconst_0 
            aload this
            getfield zombie/iso/IsoWorld.zombieWithModel Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            invokevirtual zombie/entity/util/TimSort.doSort ([Ljava/lang/Object;Ljava/util/Comparator;II)V
        AD: 
            line 2844
            iconst_0 
            istore c
        AE: 
            line 2845
            iconst_0 
            istore count
        AF: 
            line 2846
            iconst_0 
            istore tcount
        AG: 
            line 2847
            sipush 510
            istore tcountMax
        AH: 
            line 2849
            iconst_0 
            putstatic zombie/core/PerformanceSettings.animationSkip I
        AI: 
            line 2850
            iconst_0 
            istore n
        AJ: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.zombieWithModel Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpge BN
        AK: 
            line 2851
            aload this
            getfield zombie/iso/IsoWorld.zombieWithModel Lzombie/util/list/PZArrayList;
            iload n
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/characters/IsoZombie
            astore z
        AL: 
            line 2852
            iload tcount
            aload this
            invokevirtual zombie/iso/IsoWorld.getMaxRenderCount ()I
            if_icmpge BJ
        AM: 
            line 2853
            aload z
            getfield zombie/characters/IsoZombie.ghost Z
            ifeq AO
        AN: 
            line 2854
            goto BM
        AO: 
            line 2857
            iinc count 1
        AP: 
            line 2858
            iinc tcount 1
        AQ: 
            line 2859
            aload z
            iconst_0 
            invokevirtual zombie/characters/IsoZombie.setSceneCulled (Z)V
        AR: 
            line 2860
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            ifnonnull AT
        AS: 
            line 2861
            goto BM
        AT: 
            line 2864
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.modelSlot Lzombie/core/skinnedmodel/ModelManager$ModelSlot;
            ifnonnull AV
        AU: 
            line 2865
            goto BM
        AV: 
            line 2867
            iload count
            getstatic zombie/core/PerformanceSettings.zombieAnimationSpeedFalloffCount I
            if_icmple AY
        AW: 
            line 2868
            iinc c 1
        AX: 
            line 2869
            iconst_0 
            istore count
        AY: 
            line 2871
            iload tcount
            getstatic zombie/core/PerformanceSettings.zombieBonusFullspeedFalloff I
            if_icmpge BB
        AZ: 
            line 2872
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.modelSlot Lzombie/core/skinnedmodel/ModelManager$ModelSlot;
            getfield zombie/core/skinnedmodel/ModelManager$ModelSlot.model Lzombie/core/skinnedmodel/model/ModelInstance;
            iload count
            getstatic zombie/core/PerformanceSettings.zombieBonusFullspeedFalloff I
            idiv 
            invokevirtual zombie/core/skinnedmodel/model/ModelInstance.setInstanceSkip (I)V
        BA: 
            line 2873
            iconst_0 
            istore count
            goto BC
        BB: 
            line 2875
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.modelSlot Lzombie/core/skinnedmodel/ModelManager$ModelSlot;
            getfield zombie/core/skinnedmodel/ModelManager$ModelSlot.model Lzombie/core/skinnedmodel/model/ModelInstance;
            iload c
            getstatic zombie/core/PerformanceSettings.animationSkip I
            iadd 
            invokevirtual zombie/core/skinnedmodel/model/ModelInstance.setInstanceSkip (I)V
        BC: 
            line 2878
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.modelSlot Lzombie/core/skinnedmodel/ModelManager$ModelSlot;
            getfield zombie/core/skinnedmodel/ModelManager$ModelSlot.model Lzombie/core/skinnedmodel/model/ModelInstance;
            getfield zombie/core/skinnedmodel/model/ModelInstance.animPlayer Lzombie/core/skinnedmodel/animation/AnimationPlayer;
            ifnull BM
        BD: 
            line 2879
            iload tcount
            getstatic zombie/core/PerformanceSettings.numberZombiesBlended I
            if_icmpge BI
        BE: 
            line 2880
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.modelSlot Lzombie/core/skinnedmodel/ModelManager$ModelSlot;
            getfield zombie/core/skinnedmodel/ModelManager$ModelSlot.model Lzombie/core/skinnedmodel/model/ModelInstance;
            getfield zombie/core/skinnedmodel/model/ModelInstance.animPlayer Lzombie/core/skinnedmodel/animation/AnimationPlayer;
            aload z
            iconst_0 
            invokevirtual zombie/characters/IsoZombie.isAlphaAndTargetZero (I)Z
            ifeq BF
            aload z
            iconst_1 
            invokevirtual zombie/characters/IsoZombie.isAlphaAndTargetZero (I)Z
            ifeq BF
            aload z
            iconst_2 
            invokevirtual zombie/characters/IsoZombie.isAlphaAndTargetZero (I)Z
            ifeq BF
            aload z
            iconst_3 
            invokevirtual zombie/characters/IsoZombie.isAlphaAndTargetZero (I)Z
            ifne BG
        BF: 
            iconst_1 
            goto BH
        BG: 
            iconst_0 
        BH: 
            putfield zombie/core/skinnedmodel/animation/AnimationPlayer.doBlending Z
            goto BM
        BI: 
            line 2882
            aload z
            getfield zombie/characters/IsoZombie.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.modelSlot Lzombie/core/skinnedmodel/ModelManager$ModelSlot;
            getfield zombie/core/skinnedmodel/ModelManager$ModelSlot.model Lzombie/core/skinnedmodel/model/ModelInstance;
            getfield zombie/core/skinnedmodel/model/ModelInstance.animPlayer Lzombie/core/skinnedmodel/animation/AnimationPlayer;
            iconst_0 
            putfield zombie/core/skinnedmodel/animation/AnimationPlayer.doBlending Z
            goto BM
        BJ: 
            line 2886
            aload z
            iconst_1 
            invokevirtual zombie/characters/IsoZombie.setSceneCulled (Z)V
        BK: 
            line 2887
            aload z
            invokevirtual zombie/characters/IsoZombie.hasAnimationPlayer ()Z
            ifeq BM
        BL: 
            line 2888
            aload z
            invokevirtual zombie/characters/IsoZombie.getAnimationPlayer ()Lzombie/core/skinnedmodel/animation/AnimationPlayer;
            iconst_0 
            putfield zombie/core/skinnedmodel/animation/AnimationPlayer.doBlending Z
        BM: 
            line 2850
            iinc n 1
            goto AJ
        BN: 
            line 2893
            iconst_0 
            istore n
        BO: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.zombieWithoutModel Lzombie/util/list/PZArrayList;
            invokevirtual zombie/util/list/PZArrayList.size ()I
            if_icmpge BV
        BP: 
            line 2894
            aload this
            getfield zombie/iso/IsoWorld.zombieWithoutModel Lzombie/util/list/PZArrayList;
            iload n
            invokevirtual zombie/util/list/PZArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/characters/IsoZombie
            astore z
        BQ: 
            line 2895
            aload z
            invokevirtual zombie/characters/IsoZombie.hasActiveModel ()Z
            ifeq BS
        BR: 
            line 2896
            aload z
            iconst_1 
            invokevirtual zombie/characters/IsoZombie.setSceneCulled (Z)V
        BS: 
            line 2898
            aload z
            invokevirtual zombie/characters/IsoZombie.hasAnimationPlayer ()Z
            ifeq BU
        BT: 
            line 2899
            aload z
            invokevirtual zombie/characters/IsoZombie.getAnimationPlayer ()Lzombie/core/skinnedmodel/animation/AnimationPlayer;
            iconst_0 
            putfield zombie/core/skinnedmodel/animation/AnimationPlayer.doBlending Z
        BU: 
            line 2893
            iinc n 1
            goto BO
        BV: 
            line 2902
            return 
        BW: 
        }
    }

    .method public sceneCullAnimals ()V {
        parameters: { this },
        code: {
        A: 
            line 2908
            aload this
            getfield zombie/iso/IsoWorld.animalWithModel Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        B: 
            line 2909
            aload this
            getfield zombie/iso/IsoWorld.animalWithoutModel Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.clear ()V
        C: 
            line 2911
            iconst_0 
            istore n
        D: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getObjectList ()Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AD
        E: 
            line 2912
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getObjectList ()Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/IsoMovingObject
            astore mo
        F: 
            line 2913
            aload mo
            instanceof zombie/characters/animals/IsoAnimal
            ifeq AC
            aload mo
            checkcast zombie/characters/animals/IsoAnimal
            astore animal
        G: 
            line 2916
            iconst_0 
            istore withModel
        H: 
            line 2917
            iconst_0 
            istore pn
        I: 
            iload pn
            getstatic zombie/characters/IsoPlayer.numPlayers I
            if_icmpge X
        J: 
            line 2918
            getstatic zombie/characters/IsoPlayer.players [Lzombie/characters/IsoPlayer;
            iload pn
            aaload 
            astore player
        K: 
            line 2919
            aload player
            ifnonnull M
        L: 
            line 2920
            goto W
        M: 
            line 2922
            aload animal
            getfield zombie/characters/animals/IsoAnimal.current Lzombie/iso/IsoGridSquare;
            ifnonnull O
        N: 
            line 2923
            goto W
        O: 
            line 2925
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getX ()F
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getY ()F
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getZ ()F
            iconst_0 
            invokestatic zombie/iso/IsoUtils.XToScreen (FFFI)F
            getstatic zombie/iso/IsoCamera.cameras [Lzombie/iso/PlayerCamera;
            iload pn
            aaload 
            invokevirtual zombie/iso/PlayerCamera.getOffX ()F
            fsub 
            f2i 
            i2f 
            fstore screenX
        P: 
            line 2926
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getX ()F
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getY ()F
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getZ ()F
            iconst_0 
            invokestatic zombie/iso/IsoUtils.YToScreen (FFFI)F
            getstatic zombie/iso/IsoCamera.cameras [Lzombie/iso/PlayerCamera;
            iload pn
            aaload 
            invokevirtual zombie/iso/PlayerCamera.getOffY ()F
            fsub 
            f2i 
            i2f 
            fstore screenY
        Q: 
            line 2927
            fload screenX
            ldc -100F
            fcmpg 
            iflt W
            fload screenY
            ldc -100F
            fcmpg 
            iflt W
            fload screenX
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            iload pn
            invokevirtual zombie/core/Core.getOffscreenWidth (I)I
            bipush 100
            iadd 
            i2f 
            fcmpl 
            ifgt W
            fload screenY
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            iload pn
            invokevirtual zombie/core/Core.getOffscreenHeight (I)I
            bipush 100
            iadd 
            i2f 
            fcmpl 
            ifle S
        R: 
            line 2928
            goto W
        S: 
            line 2930
            aload animal
            iload pn
            invokevirtual zombie/characters/animals/IsoAnimal.getAlpha (I)F
            fconst_0 
            fcmpl 
            ifeq T
            aload animal
            getfield zombie/characters/animals/IsoAnimal.legsSprite Lzombie/iso/sprite/IsoSprite;
            getfield zombie/iso/sprite/IsoSprite.def Lzombie/iso/sprite/IsoSpriteInstance;
            getfield zombie/iso/sprite/IsoSpriteInstance.alpha F
            fconst_0 
            fcmpl 
            ifne U
        T: 
            aload animal
            getfield zombie/characters/animals/IsoAnimal.current Lzombie/iso/IsoGridSquare;
            iload pn
            invokevirtual zombie/iso/IsoGridSquare.isCouldSee (I)Z
            ifeq W
        U: 
            line 2931
            iconst_1 
            istore withModel
        V: 
            line 2932
            goto X
        W: 
            line 2917
            iinc pn 1
            goto I
        X: 
            line 2935
            iload withModel
            ifeq Z
            aload animal
            invokestatic zombie/ai/states/FakeDeadZombieState.instance ()Lzombie/ai/states/FakeDeadZombieState;
            invokevirtual zombie/characters/animals/IsoAnimal.isCurrentState (Lzombie/ai/State;)Z
            ifeq Z
        Y: 
            line 2936
            iconst_0 
            istore withModel
        Z: 
            line 2938
            iload withModel
            ifeq AB
        AA: 
            line 2939
            aload this
            getfield zombie/iso/IsoWorld.animalWithModel Ljava/util/ArrayList;
            aload animal
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
            goto AC
        AB: 
            line 2941
            aload this
            getfield zombie/iso/IsoWorld.animalWithoutModel Ljava/util/ArrayList;
            aload animal
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
        AC: 
            line 2911
            iinc n 1
            goto D
        AD: 
            line 2945
            iconst_0 
            istore n
        AE: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.animalWithModel Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AK
        AF: 
            line 2946
            aload this
            getfield zombie/iso/IsoWorld.animalWithModel Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/characters/animals/IsoAnimal
            astore animal
        AG: 
            line 2947
            aload animal
            iconst_0 
            invokevirtual zombie/characters/animals/IsoAnimal.setSceneCulled (Z)V
        AH: 
            line 2948
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.hasAnimationPlayer ()Z
            ifeq AJ
        AI: 
            line 2949
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getAnimationPlayer ()Lzombie/core/skinnedmodel/animation/AnimationPlayer;
            iconst_1 
            putfield zombie/core/skinnedmodel/animation/AnimationPlayer.doBlending Z
        AJ: 
            line 2945
            iinc n 1
            goto AE
        AK: 
            line 2953
            iconst_0 
            istore n
        AL: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.animalWithoutModel Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AS
        AM: 
            line 2954
            aload this
            getfield zombie/iso/IsoWorld.animalWithoutModel Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/characters/animals/IsoAnimal
            astore animal
        AN: 
            line 2955
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.hasActiveModel ()Z
            ifeq AP
        AO: 
            line 2956
            aload animal
            iconst_1 
            invokevirtual zombie/characters/animals/IsoAnimal.setSceneCulled (Z)V
        AP: 
            line 2958
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.hasAnimationPlayer ()Z
            ifeq AR
        AQ: 
            line 2959
            aload animal
            invokevirtual zombie/characters/animals/IsoAnimal.getAnimationPlayer ()Lzombie/core/skinnedmodel/animation/AnimationPlayer;
            iconst_0 
            putfield zombie/core/skinnedmodel/animation/AnimationPlayer.doBlending Z
        AR: 
            line 2953
            iinc n 1
            goto AL
        AS: 
            line 2962
            return 
        AT: 
        }
    }

    .method public render ()V {
        parameters: { this },
        exceptions: { 
            { B, C, D, Ljava/lang/Throwable; }, 
            { E, F, G, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 2965
            getstatic zombie/iso/IsoWorld$s_performance.isoWorldRender Lzombie/core/profiling/PerformanceProfileProbe;
            invokevirtual zombie/core/profiling/PerformanceProfileProbe.profile ()Lzombie/core/profiling/AbstractPerformanceProfileProbe;
            astore ignored
        B: 
            // try-start:   range=[B-C] handler=D:java/lang/Throwable 
            line 2966
            aload this
            invokevirtual zombie/iso/IsoWorld.renderInternal ()V
        C: 
            // try-end:     range=[B-C] handler=D:java/lang/Throwable 
            line 2967
            aload ignored
            ifnull I
            aload ignored
            invokevirtual zombie/core/profiling/AbstractPerformanceProfileProbe.close ()V
            goto I
        D: 
            // try-handler: range=[B-C] handler=D:java/lang/Throwable 
            line 2965
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
            line 2968
            return 
        J: 
        }
    }

    .method private renderInternal ()V {
        parameters: { this },
        exceptions: { 
            { K, M, N, Ljava/lang/Throwable; }, 
            { O, P, Q, Ljava/lang/Throwable; }, 
            { J, S, T, Ljava/lang/Throwable; }, 
            { AD, AE, AF, Ljava/lang/Throwable; }, 
            { AG, AH, AI, Ljava/lang/Throwable; }, 
            { AP, AQ, AR, Ljava/lang/Throwable; }, 
            { AS, AT, AU, Ljava/lang/Throwable; }, 
            { AX, AY, AZ, Ljava/lang/Throwable; }, 
            { BA, BB, BC, Ljava/lang/Throwable; }, 
            { BN, BO, BP, Ljava/lang/Throwable; }, 
            { BQ, BR, BS, Ljava/lang/Throwable; }, 
            { V, BU, BV, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 2971
            aload this
            getfield zombie/iso/IsoWorld.drawWorld Z
            ifne C
        B: 
            line 2972
            return 
        C: 
            line 2975
            invokestatic zombie/iso/IsoCamera.getCameraCharacter ()Lzombie/characters/IsoGameCharacter;
            astore isoGameCharacter
        D: 
            line 2976
            aload isoGameCharacter
            ifnonnull F
        E: 
            line 2977
            return 
        F: 
            line 2980
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            iconst_0 
            aload isoGameCharacter
            invokevirtual zombie/characters/IsoGameCharacter.getX ()F
            invokevirtual zombie/core/SpriteRenderer.doCoreIntParam (IF)V
        G: 
            line 2981
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            iconst_1 
            aload isoGameCharacter
            invokevirtual zombie/characters/IsoGameCharacter.getY ()F
            invokevirtual zombie/core/SpriteRenderer.doCoreIntParam (IF)V
        H: 
            line 2982
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            iconst_2 
            getstatic zombie/iso/IsoCamera.frameState Lzombie/iso/IsoCamera$FrameState;
            getfield zombie/iso/IsoCamera$FrameState.camCharacterZ F
            invokevirtual zombie/core/SpriteRenderer.doCoreIntParam (IF)V
        I: 
            line 2984
            invokestatic zombie/GameProfiler.getInstance ()Lzombie/GameProfiler;
            astore profiler
        J: 
            // try-start:   range=[J-S] handler=T:java/lang/Throwable 
            line 2985
            aload profiler
            ldc "Cull"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        K: 
            // try-start:   range=[K-M] handler=N:java/lang/Throwable 
            line 2986
            aload this
            invokevirtual zombie/iso/IsoWorld.sceneCullZombies ()V
        L: 
            line 2987
            aload this
            invokevirtual zombie/iso/IsoWorld.sceneCullAnimals ()V
        M: 
            // try-end:     range=[K-M] handler=N:java/lang/Throwable 
            line 2988
            aload ignored
            ifnull S
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto S
        N: 
            // try-handler: range=[K-M] handler=N:java/lang/Throwable 
            line 2985
            astore v4
            aload ignored
            ifnull R
        O: 
            // try-start:   range=[O-P] handler=Q:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        P: 
            // try-end:     range=[O-P] handler=Q:java/lang/Throwable 
            goto R
        Q: 
            // try-handler: range=[O-P] handler=Q:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        R: 
            aload v4
            athrow 
        S: 
            // try-end:     range=[J-S] handler=T:java/lang/Throwable 
            line 2990
            goto V
        T: 
            // try-handler: range=[J-S] handler=T:java/lang/Throwable 
            line 2988
            astore t
        U: 
            line 2989
            aload t
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        V: 
            // try-start:   range=[V-BU] handler=BV:java/lang/Throwable 
            line 2993
            invokestatic zombie/iso/weather/fx/WeatherFxMask.initMask ()V
        W: 
            line 2994
            getstatic zombie/core/skinnedmodel/DeadBodyAtlas.instance Lzombie/core/skinnedmodel/DeadBodyAtlas;
            invokevirtual zombie/core/skinnedmodel/DeadBodyAtlas.render ()V
        X: 
            line 2995
            getstatic zombie/core/skinnedmodel/model/WorldItemAtlas.instance Lzombie/core/skinnedmodel/model/WorldItemAtlas;
            invokevirtual zombie/core/skinnedmodel/model/WorldItemAtlas.render ()V
        Y: 
            line 2996
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.render ()V
        Z: 
            line 2997
            invokestatic zombie/gizmo/Gizmos.getInstance ()Lzombie/gizmo/Gizmos;
            getstatic zombie/iso/IsoCamera.frameState Lzombie/iso/IsoCamera$FrameState;
            getfield zombie/iso/IsoCamera$FrameState.playerIndex I
            invokevirtual zombie/gizmo/Gizmos.render (I)V
        AA: 
            line 2998
            aload this
            invokevirtual zombie/iso/IsoWorld.DrawIsoCursorHelper ()V
        AB: 
            line 2999
            getstatic zombie/core/skinnedmodel/DeadBodyAtlas.instance Lzombie/core/skinnedmodel/DeadBodyAtlas;
            invokevirtual zombie/core/skinnedmodel/DeadBodyAtlas.renderDebug ()V
        AC: 
            line 3000
            aload profiler
            ldc "renderPathfinding"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        AD: 
            // try-start:   range=[AD-AE] handler=AF:java/lang/Throwable 
            line 3001
            aload this
            invokevirtual zombie/iso/IsoWorld.renderPathfinding ()V
        AE: 
            // try-end:     range=[AD-AE] handler=AF:java/lang/Throwable 
            line 3002
            aload ignored
            ifnull AK
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto AK
        AF: 
            // try-handler: range=[AD-AE] handler=AF:java/lang/Throwable 
            line 3000
            astore v4
            aload ignored
            ifnull AJ
        AG: 
            // try-start:   range=[AG-AH] handler=AI:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        AH: 
            // try-end:     range=[AG-AH] handler=AI:java/lang/Throwable 
            goto AJ
        AI: 
            // try-handler: range=[AG-AH] handler=AI:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AJ: 
            aload v4
            athrow 
        AK: 
            line 3003
            getstatic zombie/WorldSoundManager.instance Lzombie/WorldSoundManager;
            invokevirtual zombie/WorldSoundManager.render ()V
        AL: 
            line 3004
            invokestatic zombie/iso/weather/WorldFlares.debugRender ()V
        AM: 
            line 3005
            getstatic zombie/iso/WorldMarkers.instance Lzombie/iso/WorldMarkers;
            invokevirtual zombie/iso/WorldMarkers.debugRender ()V
        AN: 
            line 3006
            invokestatic zombie/audio/ObjectAmbientEmitters.getInstance ()Lzombie/audio/ObjectAmbientEmitters;
            invokevirtual zombie/audio/ObjectAmbientEmitters.render ()V
        AO: 
            line 3007
            aload profiler
            ldc "renderVocals"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        AP: 
            // try-start:   range=[AP-AQ] handler=AR:java/lang/Throwable 
            line 3008
            aload this
            invokevirtual zombie/iso/IsoWorld.renderVocals ()V
        AQ: 
            // try-end:     range=[AP-AQ] handler=AR:java/lang/Throwable 
            line 3009
            aload ignored
            ifnull AW
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto AW
        AR: 
            // try-handler: range=[AP-AQ] handler=AR:java/lang/Throwable 
            line 3007
            astore v4
            aload ignored
            ifnull AV
        AS: 
            // try-start:   range=[AS-AT] handler=AU:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        AT: 
            // try-end:     range=[AS-AT] handler=AU:java/lang/Throwable 
            goto AV
        AU: 
            // try-handler: range=[AS-AT] handler=AU:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AV: 
            aload v4
            athrow 
        AW: 
            line 3010
            aload profiler
            ldc "renderWeatherFX"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        AX: 
            // try-start:   range=[AX-AY] handler=AZ:java/lang/Throwable 
            line 3011
            aload this
            invokevirtual zombie/iso/IsoWorld.renderWeatherFX ()V
        AY: 
            // try-end:     range=[AX-AY] handler=AZ:java/lang/Throwable 
            line 3012
            aload ignored
            ifnull BE
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto BE
        AZ: 
            // try-handler: range=[AX-AY] handler=AZ:java/lang/Throwable 
            line 3010
            astore v4
            aload ignored
            ifnull BD
        BA: 
            // try-start:   range=[BA-BB] handler=BC:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        BB: 
            // try-end:     range=[BA-BB] handler=BC:java/lang/Throwable 
            goto BD
        BC: 
            // try-handler: range=[BA-BB] handler=BC:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        BD: 
            aload v4
            athrow 
        BE: 
            line 3014
            getstatic zombie/core/PerformanceSettings.fboRenderChunk Z
            ifeq BH
        BF: 
            line 3015
            invokestatic zombie/iso/fboRenderChunk/FBORenderAreaHighlights.getInstance ()Lzombie/iso/fboRenderChunk/FBORenderAreaHighlights;
            invokevirtual zombie/iso/fboRenderChunk/FBORenderAreaHighlights.render ()V
        BG: 
            line 3016
            invokestatic zombie/buildingRooms/BuildingRoomsEditor.getInstance ()Lzombie/buildingRooms/BuildingRoomsEditor;
            invokevirtual zombie/buildingRooms/BuildingRoomsEditor.renderMain ()V
        BH: 
            line 3018
            invokestatic zombie/audio/parameters/ParameterInside.renderDebug ()V
        BI: 
            line 3019
            invokestatic zombie/debug/LineDrawer.render ()V
        BJ: 
            line 3020
            getstatic zombie/network/GameClient.client Z
            ifeq BM
        BK: 
            line 3021
            getstatic zombie/iso/IsoCamera.frameState Lzombie/iso/IsoCamera$FrameState;
            getfield zombie/iso/IsoCamera$FrameState.playerIndex I
            invokestatic zombie/network/ClientServerMap.render (I)V
        BL: 
            line 3022
            getstatic zombie/iso/IsoCamera.frameState Lzombie/iso/IsoCamera$FrameState;
            getfield zombie/iso/IsoCamera$FrameState.playerIndex I
            invokestatic zombie/network/PassengerMap.render (I)V
        BM: 
            line 3024
            aload profiler
            ldc "Skybox"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        BN: 
            // try-start:   range=[BN-BO] handler=BP:java/lang/Throwable 
            line 3025
            invokestatic zombie/iso/sprite/SkyBox.getInstance ()Lzombie/iso/sprite/SkyBox;
            invokevirtual zombie/iso/sprite/SkyBox.render ()V
        BO: 
            // try-end:     range=[BN-BO] handler=BP:java/lang/Throwable 
            line 3026
            aload ignored
            ifnull BU
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto BU
        BP: 
            // try-handler: range=[BN-BO] handler=BP:java/lang/Throwable 
            line 3024
            astore v4
            aload ignored
            ifnull BT
        BQ: 
            // try-start:   range=[BQ-BR] handler=BS:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        BR: 
            // try-end:     range=[BQ-BR] handler=BS:java/lang/Throwable 
            goto BT
        BS: 
            // try-handler: range=[BQ-BR] handler=BS:java/lang/Throwable 
            astore v5
            aload v4
            aload v5
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        BT: 
            aload v4
            athrow 
        BU: 
            // try-end:     range=[V-BU] handler=BV:java/lang/Throwable 
            line 3029
            goto BX
        BV: 
            // try-handler: range=[V-BU] handler=BV:java/lang/Throwable 
            line 3027
            astore t
        BW: 
            line 3028
            aload t
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        BX: 
            line 3030
            return 
        BY: 
        }
    }

    .method private renderPathfinding ()V {
        parameters: { this },
        code: {
        A: 
            line 3033
            getstatic zombie/pathfind/nativeCode/PathfindNative.useNativeCode Z
            ifeq D
        B: 
            line 3034
            getstatic zombie/pathfind/nativeCode/PathfindNative.instance Lzombie/pathfind/nativeCode/PathfindNative;
            invokevirtual zombie/pathfind/nativeCode/PathfindNative.render ()V
        C: 
            line 3035
            getstatic zombie/pathfind/nativeCode/PathfindNativeRenderer.instance Lzombie/pathfind/nativeCode/PathfindNativeRenderer;
            invokevirtual zombie/pathfind/nativeCode/PathfindNativeRenderer.render ()V
            goto E
        D: 
            line 3037
            getstatic zombie/pathfind/PolygonalMap2.instance Lzombie/pathfind/PolygonalMap2;
            invokevirtual zombie/pathfind/PolygonalMap2.render ()V
        E: 
            line 3039
            getstatic zombie/pathfind/extra/BorderFinderRenderer.instance Lzombie/pathfind/extra/BorderFinderRenderer;
            invokevirtual zombie/pathfind/extra/BorderFinderRenderer.render ()V
        F: 
            line 3040
            return 
        G: 
        }
    }

    .method private renderVocals ()V {
        parameters: { this },
        code: {
        A: 
            line 3043
            getstatic zombie/characters/AnimalVocalsManager.instance Lzombie/characters/AnimalVocalsManager;
            invokevirtual zombie/characters/AnimalVocalsManager.render ()V
        B: 
            line 3044
            getstatic zombie/characters/ZombieVocalsManager.instance Lzombie/characters/ZombieVocalsManager;
            invokevirtual zombie/characters/ZombieVocalsManager.render ()V
        C: 
            line 3045
            return 
        D: 
        }
    }

    .method private renderWeatherFX ()V {
        parameters: { this },
        code: {
        A: 
            line 3048
            aload this
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getWeatherFX ()Lzombie/iso/weather/fx/IsoWeatherFX;
            getstatic zombie/iso/weather/fx/IsoWeatherFX.cloudId I
            invokevirtual zombie/iso/weather/fx/IsoWeatherFX.getDrawer (I)Lzombie/iso/weather/fx/WeatherParticleDrawer;
            invokevirtual zombie/iso/weather/fx/WeatherParticleDrawer.startFrame ()V
        B: 
            line 3049
            aload this
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getWeatherFX ()Lzombie/iso/weather/fx/IsoWeatherFX;
            getstatic zombie/iso/weather/fx/IsoWeatherFX.fogId I
            invokevirtual zombie/iso/weather/fx/IsoWeatherFX.getDrawer (I)Lzombie/iso/weather/fx/WeatherParticleDrawer;
            invokevirtual zombie/iso/weather/fx/WeatherParticleDrawer.startFrame ()V
        C: 
            line 3050
            aload this
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getWeatherFX ()Lzombie/iso/weather/fx/IsoWeatherFX;
            getstatic zombie/iso/weather/fx/IsoWeatherFX.snowId I
            invokevirtual zombie/iso/weather/fx/IsoWeatherFX.getDrawer (I)Lzombie/iso/weather/fx/WeatherParticleDrawer;
            invokevirtual zombie/iso/weather/fx/WeatherParticleDrawer.startFrame ()V
        D: 
            line 3051
            aload this
            invokevirtual zombie/iso/IsoWorld.getCell ()Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getWeatherFX ()Lzombie/iso/weather/fx/IsoWeatherFX;
            getstatic zombie/iso/weather/fx/IsoWeatherFX.rainId I
            invokevirtual zombie/iso/weather/fx/IsoWeatherFX.getDrawer (I)Lzombie/iso/weather/fx/WeatherParticleDrawer;
            invokevirtual zombie/iso/weather/fx/WeatherParticleDrawer.startFrame ()V
        E: 
            line 3052
            getstatic zombie/iso/IsoCamera.frameState Lzombie/iso/IsoCamera$FrameState;
            getfield zombie/iso/IsoCamera$FrameState.playerIndex I
            invokestatic zombie/iso/weather/fx/WeatherFxMask.renderFxMask (I)V
        F: 
            line 3053
            return 
        G: 
        }
    }

    .method public DrawPlayerCone ()V {
        parameters: { this },
        code: {
        A: 
            line 3060
            getstatic zombie/iso/IsoCamera.frameState Lzombie/iso/IsoCamera$FrameState;
            getfield zombie/iso/IsoCamera$FrameState.playerIndex I
            istore playerIndex
        B: 
            line 3062
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.getX ()F
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.getY ()F
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            invokevirtual zombie/characters/IsoPlayer.getZ ()F
            ldc 180D
            invokestatic java/lang/Math.toRadians (D)D
            d2f 
            iconst_0 
            invokevirtual zombie/core/SpriteRenderer.pushIsoView (FFFFZ)V
        C: 
            line 3066
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            astore player
        D: 
            line 3069
            aload player
            invokevirtual zombie/characters/IsoPlayer.getStats ()Lzombie/characters/Stats;
            getstatic zombie/characters/CharacterStat.FATIGUE Lzombie/characters/CharacterStat;
            invokevirtual zombie/characters/Stats.get (Lzombie/characters/CharacterStat;)F
            ldc 0.6000000238F
            fsub 
            fstore tireddel
        E: 
            line 3070
            fload tireddel
            fconst_0 
            fcmpg 
            ifge G
        F: 
            line 3071
            fconst_0 
            fstore tireddel
        G: 
            line 3073
            fload tireddel
            ldc 2.5F
            fmul 
            fstore tireddel
        H: 
            line 3074
            aload player
            getstatic zombie/scripting/objects/CharacterTrait.HARD_OF_HEARING Lzombie/scripting/objects/CharacterTrait;
            invokevirtual zombie/characters/IsoPlayer.hasTrait (Lzombie/scripting/objects/CharacterTrait;)Z
            ifeq K
        I: 
            line 3075
            fload tireddel
            ldc 0.6999999881F
            fcmpg 
            ifge K
        J: 
            line 3076
            ldc 0.6999999881F
            fstore tireddel
        K: 
            line 3080
            fconst_2 
            fstore ndist
        L: 
            line 3081
            aload player
            getstatic zombie/scripting/objects/CharacterTrait.KEEN_HEARING Lzombie/scripting/objects/CharacterTrait;
            invokevirtual zombie/characters/IsoPlayer.hasTrait (Lzombie/scripting/objects/CharacterTrait;)Z
            ifeq N
        M: 
            line 3082
            fload ndist
            ldc 3F
            fadd 
            fstore ndist
        N: 
            line 3085
            aload player
            invokestatic zombie/iso/LightingJNI.calculateVisionCone (Lzombie/characters/IsoGameCharacter;)F
            fstore cone
        O: 
            line 3087
            fload cone
            fneg 
            fstore cone
        P: 
            line 3089
            fconst_1 
            fload cone
            fsub 
            fstore cone
        Q: 
            line 3091
            aload player
            aload this
            getfield zombie/iso/IsoWorld.coneTempo1 Lzombie/iso/Vector2;
            invokevirtual zombie/characters/IsoPlayer.getLookVector (Lzombie/iso/Vector2;)Lzombie/iso/Vector2;
            astore lookVector
        R: 
            line 3093
            aload player
            invokevirtual zombie/characters/IsoPlayer.getVehicle ()Lzombie/vehicles/BaseVehicle;
            astore vehicle
        S: 
            line 3094
            aload vehicle
            ifnull U
            aload player
            invokevirtual zombie/characters/IsoPlayer.isAiming ()Z
            ifne U
            aload player
            invokevirtual zombie/characters/IsoPlayer.isLookingWhileInVehicle ()Z
            ifne U
            aload vehicle
            aload player
            invokevirtual zombie/vehicles/BaseVehicle.isDriver (Lzombie/characters/IsoGameCharacter;)Z
            ifeq U
            aload vehicle
            invokevirtual zombie/vehicles/BaseVehicle.getCurrentSpeedKmHour ()F
            ldc -1F
            fcmpg 
            ifge U
        T: 
            line 3095
            aload lookVector
            ldc 3.141592741F
            invokevirtual zombie/iso/Vector2.rotate (F)V
        U: 
            line 3098
            fload cone
            fconst_0 
            fcmpg 
            ifge W
        V: 
            line 3099
            fload cone
            invokestatic java/lang/Math.abs (F)F
            fconst_1 
            fadd 
            fstore cone
        W: 
            line 3102
            fload cone
            f2d 
            ldc 1.5707963268D
            dmul 
            d2f 
            fstore cone
        X: 
            line 3104
            aload this
            getfield zombie/iso/IsoWorld.coneTempo2 Lzombie/iso/Vector2;
            aload lookVector
            getfield zombie/iso/Vector2.x F
            putfield zombie/iso/Vector2.x F
        Y: 
            line 3105
            aload this
            getfield zombie/iso/IsoWorld.coneTempo2 Lzombie/iso/Vector2;
            aload lookVector
            getfield zombie/iso/Vector2.y F
            putfield zombie/iso/Vector2.y F
        Z: 
            line 3107
            aload this
            getfield zombie/iso/IsoWorld.coneTempo3 Lzombie/iso/Vector2;
            aload lookVector
            getfield zombie/iso/Vector2.x F
            putfield zombie/iso/Vector2.x F
        AA: 
            line 3108
            aload this
            getfield zombie/iso/IsoWorld.coneTempo3 Lzombie/iso/Vector2;
            aload lookVector
            getfield zombie/iso/Vector2.y F
            putfield zombie/iso/Vector2.y F
        AB: 
            line 3110
            aload this
            getfield zombie/iso/IsoWorld.coneTempo2 Lzombie/iso/Vector2;
            fload cone
            fneg 
            invokevirtual zombie/iso/Vector2.rotate (F)V
        AC: 
            line 3111
            aload this
            getfield zombie/iso/IsoWorld.coneTempo3 Lzombie/iso/Vector2;
            fload cone
            invokevirtual zombie/iso/Vector2.rotate (F)V
        AD: 
            line 3113
            aload this
            getfield zombie/iso/IsoWorld.coneTempo2 Lzombie/iso/Vector2;
            getfield zombie/iso/Vector2.x F
            ldc 1000F
            fmul 
            fstore offscreen1x
        AE: 
            line 3114
            aload this
            getfield zombie/iso/IsoWorld.coneTempo2 Lzombie/iso/Vector2;
            getfield zombie/iso/Vector2.y F
            ldc 1000F
            fmul 
            fstore offscreen1y
        AF: 
            line 3116
            fload offscreen1x
            aload lookVector
            getfield zombie/iso/Vector2.x F
            fneg 
            ldc 1000F
            fmul 
            fadd 
            fstore offscreen2x
        AG: 
            line 3117
            fload offscreen1y
            aload lookVector
            getfield zombie/iso/Vector2.y F
            fneg 
            ldc 1000F
            fmul 
            fadd 
            fstore offscreen2y
        AH: 
            line 3119
            aload lookVector
            getfield zombie/iso/Vector2.x F
            fneg 
            ldc 1000F
            fmul 
            fstore offscreen3x
        AI: 
            line 3120
            aload lookVector
            getfield zombie/iso/Vector2.y F
            fneg 
            ldc 1000F
            fmul 
            fstore offscreen3y
        AJ: 
            line 3122
            invokestatic zombie/IndieGL.disableDepthTest ()V
        AK: 
            line 3123
            invokestatic zombie/IndieGL.disableScissorTest ()V
        AL: 
            line 3124
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            bipush 8
            iconst_0 
            invokevirtual zombie/core/SpriteRenderer.glBuffer (II)V
        AM: 
            line 3125
            getstatic zombie/viewCone/ViewConeTextureFBO.instance Lzombie/viewCone/ViewConeTextureFBO;
            invokevirtual zombie/viewCone/ViewConeTextureFBO.getTexture ()Lzombie/core/textures/Texture;
            ifnull AO
        AN: 
            line 3126
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            iconst_0 
            iconst_0 
            getstatic zombie/viewCone/ViewConeTextureFBO.instance Lzombie/viewCone/ViewConeTextureFBO;
            invokevirtual zombie/viewCone/ViewConeTextureFBO.getTexture ()Lzombie/core/textures/Texture;
            invokevirtual zombie/core/textures/Texture.getWidth ()I
            getstatic zombie/viewCone/ViewConeTextureFBO.instance Lzombie/viewCone/ViewConeTextureFBO;
            invokevirtual zombie/viewCone/ViewConeTextureFBO.getTexture ()Lzombie/core/textures/Texture;
            invokevirtual zombie/core/textures/Texture.getHeight ()I
            invokevirtual zombie/core/SpriteRenderer.glViewport (IIII)V
        AO: 
            line 3128
            iconst_0 
            invokestatic zombie/IndieGL.StartShader (I)V
        AP: 
            line 3129
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            fconst_0 
            fconst_0 
            fload offscreen1x
            fload offscreen1y
            fload offscreen2x
            fload offscreen2y
            fload offscreen3x
            fload offscreen3y
            fconst_0 
            fconst_0 
            fconst_0 
            ldc 0.5F
            invokevirtual zombie/core/SpriteRenderer.renderPoly (FFFFFFFFFFFF)V
        AQ: 
            line 3130
            invokestatic zombie/IndieGL.EndShader ()V
        AR: 
            line 3132
            aload this
            getfield zombie/iso/IsoWorld.coneTempo3 Lzombie/iso/Vector2;
            getfield zombie/iso/Vector2.x F
            ldc 1000F
            fmul 
            fstore offscreen1x
        AS: 
            line 3133
            aload this
            getfield zombie/iso/IsoWorld.coneTempo3 Lzombie/iso/Vector2;
            getfield zombie/iso/Vector2.y F
            ldc 1000F
            fmul 
            fstore offscreen1y
        AT: 
            line 3134
            fload offscreen1x
            aload lookVector
            getfield zombie/iso/Vector2.x F
            fneg 
            ldc 1000F
            fmul 
            fadd 
            fstore offscreen2x
        AU: 
            line 3135
            fload offscreen1y
            aload lookVector
            getfield zombie/iso/Vector2.y F
            fneg 
            ldc 1000F
            fmul 
            fadd 
            fstore offscreen2y
        AV: 
            line 3136
            aload lookVector
            getfield zombie/iso/Vector2.x F
            fneg 
            ldc 1000F
            fmul 
            fstore offscreen3x
        AW: 
            line 3137
            aload lookVector
            getfield zombie/iso/Vector2.y F
            fneg 
            ldc 1000F
            fmul 
            fstore offscreen3y
        AX: 
            line 3139
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            fload offscreen3x
            fload offscreen3y
            fload offscreen2x
            fload offscreen2y
            fload offscreen1x
            fload offscreen1y
            fconst_0 
            fconst_0 
            fconst_0 
            fconst_0 
            fconst_0 
            ldc 0.5F
            invokevirtual zombie/core/SpriteRenderer.renderPoly (FFFFFFFFFFFF)V
        AY: 
            line 3140
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            bipush 9
            iconst_0 
            invokevirtual zombie/core/SpriteRenderer.glBuffer (II)V
        AZ: 
            line 3141
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            iload playerIndex
            invokestatic zombie/iso/IsoCamera.getScreenLeft (I)I
            iload playerIndex
            invokestatic zombie/iso/IsoCamera.getScreenTop (I)I
            iload playerIndex
            invokestatic zombie/iso/IsoCamera.getScreenWidth (I)I
            iload playerIndex
            invokestatic zombie/iso/IsoCamera.getScreenHeight (I)I
            invokevirtual zombie/core/SpriteRenderer.glViewport (IIII)V
        BA: 
            line 3142
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            invokevirtual zombie/core/SpriteRenderer.popIsoView ()V
        BB: 
            line 3143
            invokestatic zombie/IndieGL.enableScissorTest ()V
        BC: 
            line 3144
            return 
        BD: 
        }
    }

    .method public DrawPlayerCone2 ()V {
        parameters: { this },
        code: {
        A: 
            line 3147
            iconst_0 
            invokestatic zombie/IndieGL.glDepthMask (Z)V
        B: 
            line 3148
            sipush 770
            sipush 771
            invokestatic zombie/IndieGL.glBlendFunc (II)V
        C: 
            line 3149
            getstatic zombie/core/SceneShaderStore.blurShader Lzombie/core/opengl/Shader;
            ifnull E
        D: 
            line 3150
            getstatic zombie/core/SceneShaderStore.blurShader Lzombie/core/opengl/Shader;
            getstatic zombie/viewCone/ViewConeTextureFBO.instance Lzombie/viewCone/ViewConeTextureFBO;
            invokevirtual zombie/viewCone/ViewConeTextureFBO.getTexture ()Lzombie/core/textures/Texture;
            invokevirtual zombie/core/opengl/Shader.setTexture (Lzombie/core/textures/Texture;)V
        E: 
            line 3152
            getstatic zombie/core/SceneShaderStore.blurShader Lzombie/core/opengl/Shader;
            ifnull G
        F: 
            line 3153
            getstatic zombie/core/SceneShaderStore.blurShader Lzombie/core/opengl/Shader;
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            invokestatic zombie/IndieGL.StartShader (Lzombie/core/opengl/Shader;I)V
        G: 
            line 3155
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            getstatic zombie/viewCone/ViewConeTextureFBO.instance Lzombie/viewCone/ViewConeTextureFBO;
            invokevirtual zombie/viewCone/ViewConeTextureFBO.getTexture ()Lzombie/core/textures/Texture;
            fconst_0 
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            invokevirtual zombie/core/Core.getOffscreenHeight (I)I
            i2f 
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            invokevirtual zombie/core/Core.getOffscreenWidth (I)I
            i2f 
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            invokevirtual zombie/core/Core.getOffscreenHeight (I)I
            ineg 
            i2f 
            fconst_1 
            fconst_1 
            fconst_1 
            fconst_1 
            aconst_null 
            invokevirtual zombie/core/SpriteRenderer.render (Lzombie/core/textures/Texture;FFFFFFFFLjava/util/function/Consumer;)V
        H: 
            line 3156
            getstatic zombie/core/SceneShaderStore.blurShader Lzombie/core/opengl/Shader;
            ifnull J
        I: 
            line 3157
            invokestatic zombie/IndieGL.EndShader ()V
        J: 
            line 3159
            iconst_1 
            invokestatic zombie/IndieGL.glDepthMask (Z)V
        K: 
            line 3160
            return 
        L: 
        }
    }

    .method private DrawIsoCursorHelper ()V {
        parameters: { this },
        code: {
        A: 
            line 3163
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.getOffscreenBuffer ()Lzombie/core/textures/TextureFBO;
            ifnull C
        B: 
            line 3165
            return 
        C: 
            line 3168
            invokestatic zombie/characters/IsoPlayer.getInstance ()Lzombie/characters/IsoPlayer;
            astore player
        D: 
            line 3169
            aload player
            ifnull E
            aload player
            invokevirtual zombie/characters/IsoPlayer.isDead ()Z
            ifne E
            aload player
            invokevirtual zombie/characters/IsoPlayer.isAiming ()Z
            ifeq E
            aload player
            getfield zombie/characters/IsoPlayer.playerIndex I
            ifne E
            aload player
            getfield zombie/characters/IsoPlayer.joypadBind I
            iconst_m1 
            if_icmpeq F
        E: 
            line 3170
            return 
        F: 
            line 3173
            invokestatic zombie/GameTime.isGamePaused ()Z
            ifeq H
        G: 
            line 3174
            return 
        H: 
            line 3177
            ldc 0.0500000007F
            fstore alpha
        I: 
            line 3179
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.getIsoCursorVisibility ()I
            tableswitch {
                min: 0,
                max: 7,
                cases: { J, K, M, O, Q, S, U },
                default: V
            }
        J: 
            line 3181
            return 
        K: 
            line 3183
            ldc 0.0500000007F
            fstore alpha
        L: 
            line 3184
            goto V
        M: 
            line 3186
            ldc 0.1000000015F
            fstore alpha
        N: 
            line 3187
            goto V
        O: 
            line 3189
            ldc 0.150000006F
            fstore alpha
        P: 
            line 3190
            goto V
        Q: 
            line 3192
            ldc 0.3000000119F
            fstore alpha
        R: 
            line 3193
            goto V
        S: 
            line 3195
            ldc 0.5F
            fstore alpha
        T: 
            line 3196
            goto V
        U: 
            line 3198
            ldc 0.75F
            fstore alpha
        V: 
            line 3202
            invokestatic zombie/core/Core.getInstance ()Lzombie/core/Core;
            invokevirtual zombie/core/Core.isFlashIsoCursor ()Z
            ifeq AE
        W: 
            line 3203
            aload this
            getfield zombie/iso/IsoWorld.flashIsoCursorInc Z
            ifeq AA
        X: 
            line 3204
            aload this
            dup 
            getfield zombie/iso/IsoWorld.flashIsoCursorA F
            ldc 0.1000000015F
            fadd 
            putfield zombie/iso/IsoWorld.flashIsoCursorA F
        Y: 
            line 3205
            aload this
            getfield zombie/iso/IsoWorld.flashIsoCursorA F
            fconst_1 
            fcmpl 
            iflt AD
        Z: 
            line 3206
            aload this
            iconst_0 
            putfield zombie/iso/IsoWorld.flashIsoCursorInc Z
            goto AD
        AA: 
            line 3209
            aload this
            dup 
            getfield zombie/iso/IsoWorld.flashIsoCursorA F
            ldc 0.1000000015F
            fsub 
            putfield zombie/iso/IsoWorld.flashIsoCursorA F
        AB: 
            line 3210
            aload this
            getfield zombie/iso/IsoWorld.flashIsoCursorA F
            fconst_0 
            fcmpg 
            ifgt AD
        AC: 
            line 3211
            aload this
            iconst_1 
            putfield zombie/iso/IsoWorld.flashIsoCursorInc Z
        AD: 
            line 3214
            aload this
            getfield zombie/iso/IsoWorld.flashIsoCursorA F
            fstore alpha
        AE: 
            line 3217
            ldc "media/ui/isocursor.png"
            invokestatic zombie/core/textures/Texture.getSharedTexture (Ljava/lang/String;)Lzombie/core/textures/Texture;
            astore t
        AF: 
            line 3218
            aload t
            invokevirtual zombie/core/textures/Texture.getWidth ()I
            getstatic zombie/core/Core.tileScale I
            imul 
            i2f 
            fconst_2 
            fdiv 
            f2i 
            istore width
        AG: 
            line 3219
            aload t
            invokevirtual zombie/core/textures/Texture.getHeight ()I
            getstatic zombie/core/Core.tileScale I
            imul 
            i2f 
            fconst_2 
            fdiv 
            f2i 
            istore height
        AH: 
            line 3220
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            iconst_1 
            invokevirtual zombie/core/SpriteRenderer.setDoAdditive (Z)V
        AI: 
            line 3221
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            aload t
            invokestatic zombie/input/Mouse.getX ()I
            iload width
            iconst_2 
            idiv 
            isub 
            invokestatic zombie/input/Mouse.getY ()I
            iload height
            iconst_2 
            idiv 
            isub 
            iload width
            iload height
            fload alpha
            fload alpha
            fload alpha
            fload alpha
            aconst_null 
            invokevirtual zombie/core/SpriteRenderer.renderi (Lzombie/core/textures/Texture;IIIIFFFFLjava/util/function/Consumer;)V
        AJ: 
            line 3222
            getstatic zombie/core/SpriteRenderer.instance Lzombie/core/SpriteRenderer;
            iconst_0 
            invokevirtual zombie/core/SpriteRenderer.setDoAdditive (Z)V
        AK: 
            line 3223
            return 
        AL: 
        }
    }

    .method private updateWorld ()V {
        parameters: { this },
        exceptions: { 
            { H, I, J, Ljava/lang/Throwable; }, 
            { K, L, M, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 3271
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.update ()V
        B: 
            line 3272
            invokestatic zombie/iso/areas/isoregion/IsoRegions.update ()V
        C: 
            line 3273
            invokestatic zombie/characters/HaloTextHelper.update ()V
        D: 
            line 3274
            getstatic zombie/CollisionManager.instance Lzombie/CollisionManager;
            invokevirtual zombie/CollisionManager.ResolveContacts ()V
        E: 
            line 3276
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.threadAnimation Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq G
        F: 
            line 3277
            getstatic zombie/MovingObjectUpdateScheduler.instance Lzombie/MovingObjectUpdateScheduler;
            dup 
            invokestatic java/util/Objects.requireNonNull (Ljava/lang/Object;)Ljava/lang/Object;
            pop 
            invokedynamic run (Lzombie/MovingObjectUpdateScheduler;)Ljava/lang/Runnable; LambdaMetafactory.metafactory { ()V, { invokevirtual, zombie/MovingObjectUpdateScheduler.postupdate, ()V }, ()V }
            invokestatic java/util/concurrent/CompletableFuture.runAsync (Ljava/lang/Runnable;)Ljava/util/concurrent/CompletableFuture;
            putstatic zombie/iso/IsoWorld.animationThread Ljava/util/concurrent/CompletableFuture;
            goto O
        G: 
            line 3279
            invokestatic zombie/GameProfiler.getInstance ()Lzombie/GameProfiler;
            ldc "Animation"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        H: 
            // try-start:   range=[H-I] handler=J:java/lang/Throwable 
            line 3280
            getstatic zombie/MovingObjectUpdateScheduler.instance Lzombie/MovingObjectUpdateScheduler;
            invokevirtual zombie/MovingObjectUpdateScheduler.postupdate ()V
        I: 
            // try-end:     range=[H-I] handler=J:java/lang/Throwable 
            line 3281
            aload ignored
            ifnull O
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto O
        J: 
            // try-handler: range=[H-I] handler=J:java/lang/Throwable 
            line 3279
            astore v2
            aload ignored
            ifnull N
        K: 
            // try-start:   range=[K-L] handler=M:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        L: 
            // try-end:     range=[K-L] handler=M:java/lang/Throwable 
            goto N
        M: 
            // try-handler: range=[K-L] handler=M:java/lang/Throwable 
            astore v3
            aload v2
            aload v3
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        N: 
            aload v2
            athrow 
        O: 
            line 3283
            return 
        P: 
        }
    }

    .method public FinishAnimation ()V {
        parameters: { this },
        exceptions: { 
            { C, D, E, Ljava/lang/Throwable; }, 
            { F, G, H, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 3286
            getstatic zombie/iso/IsoWorld.animationThread Ljava/util/concurrent/CompletableFuture;
            ifnull K
        B: 
            line 3287
            invokestatic zombie/GameProfiler.getInstance ()Lzombie/GameProfiler;
            ldc "Wait Animation"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        C: 
            // try-start:   range=[C-D] handler=E:java/lang/Throwable 
            line 3288
            getstatic zombie/iso/IsoWorld.animationThread Ljava/util/concurrent/CompletableFuture;
            invokevirtual java/util/concurrent/CompletableFuture.join ()Ljava/lang/Object;
            pop 
        D: 
            // try-end:     range=[C-D] handler=E:java/lang/Throwable 
            line 3289
            aload ignored
            ifnull J
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto J
        E: 
            // try-handler: range=[C-D] handler=E:java/lang/Throwable 
            line 3287
            astore v2
            aload ignored
            ifnull I
        F: 
            // try-start:   range=[F-G] handler=H:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        G: 
            // try-end:     range=[F-G] handler=H:java/lang/Throwable 
            goto I
        H: 
            // try-handler: range=[F-G] handler=H:java/lang/Throwable 
            astore v3
            aload v2
            aload v3
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        I: 
            aload v2
            athrow 
        J: 
            line 3290
            aconst_null 
            putstatic zombie/iso/IsoWorld.animationThread Ljava/util/concurrent/CompletableFuture;
        K: 
            line 3292
            return 
        L: 
        }
    }

    .method public update ()V {
        parameters: { this },
        exceptions: { 
            { B, C, D, Ljava/lang/Throwable; }, 
            { E, F, G, Ljava/lang/Throwable; }, 
            { J, K, L, Ljava/lang/Throwable; }, 
            { M, N, O, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 3295
            getstatic zombie/iso/IsoWorld$s_performance.isoWorldUpdate Lzombie/core/profiling/PerformanceProfileProbe;
            invokevirtual zombie/core/profiling/PerformanceProfileProbe.profile ()Lzombie/core/profiling/AbstractPerformanceProfileProbe;
            astore ignored
        B: 
            // try-start:   range=[B-C] handler=D:java/lang/Throwable 
            line 3296
            aload this
            invokevirtual zombie/iso/IsoWorld.updateInternal ()V
        C: 
            // try-end:     range=[B-C] handler=D:java/lang/Throwable 
            line 3297
            aload ignored
            ifnull I
            aload ignored
            invokevirtual zombie/core/profiling/AbstractPerformanceProfileProbe.close ()V
            goto I
        D: 
            // try-handler: range=[B-C] handler=D:java/lang/Throwable 
            line 3295
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
            line 3298
            invokestatic zombie/GameProfiler.getInstance ()Lzombie/GameProfiler;
            ldc "Update DZ"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored2
        J: 
            // try-start:   range=[J-K] handler=L:java/lang/Throwable 
            line 3299
            invokestatic zombie/iso/areas/DesignationZone.update ()V
        K: 
            // try-end:     range=[J-K] handler=L:java/lang/Throwable 
            line 3300
            aload ignored2
            ifnull Q
            aload ignored2
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto Q
        L: 
            // try-handler: range=[J-K] handler=L:java/lang/Throwable 
            line 3298
            astore v2
            aload ignored2
            ifnull P
        M: 
            // try-start:   range=[M-N] handler=O:java/lang/Throwable 
            aload ignored2
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        N: 
            // try-end:     range=[M-N] handler=O:java/lang/Throwable 
            goto P
        O: 
            // try-handler: range=[M-N] handler=O:java/lang/Throwable 
            astore v3
            aload v2
            aload v3
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        P: 
            aload v2
            athrow 
        Q: 
            line 3301
            return 
        R: 
        }
    }

    .method private updateInternal ()V {
        parameters: { this },
        exceptions: { 
            { C, D, E, Ljava/lang/Exception; }, 
            { AR, AS, AT, Ljava/lang/Throwable; }, 
            { AU, AV, AW, Ljava/lang/Throwable; }, 
            { BB, BC, BD, Ljava/lang/Throwable; }, 
            { BE, BF, BG, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 3304
            aload this
            dup 
            getfield zombie/iso/IsoWorld.frameNo I
            iconst_1 
            iadd 
            putfield zombie/iso/IsoWorld.frameNo I
        B: 
            line 3305
            getstatic zombie/network/GameServer.server Z
            ifeq G
        C: 
            // try-start:   range=[C-D] handler=E:java/lang/Exception 
            line 3307
            getstatic zombie/vehicles/VehicleManager.instance Lzombie/vehicles/VehicleManager;
            invokevirtual zombie/vehicles/VehicleManager.serverUpdate ()V
        D: 
            // try-end:     range=[C-D] handler=E:java/lang/Exception 
            line 3310
            goto G
        E: 
            // try-handler: range=[C-D] handler=E:java/lang/Exception 
            line 3308
            astore ex
        F: 
            line 3309
            aload ex
            invokevirtual java/lang/Exception.printStackTrace ()V
        G: 
            line 3312
            getstatic zombie/core/physics/WorldSimulation.instance Lzombie/core/physics/WorldSimulation;
            invokevirtual zombie/core/physics/WorldSimulation.update ()V
        H: 
            line 3313
            invokestatic zombie/popman/animal/HutchManager.getInstance ()Lzombie/popman/animal/HutchManager;
            invokevirtual zombie/popman/animal/HutchManager.updateAll ()V
        I: 
            line 3314
            invokestatic zombie/iso/weather/fog/ImprovedFog.update ()V
        J: 
            line 3315
            aload this
            getfield zombie/iso/IsoWorld.helicopter Lzombie/iso/Helicopter;
            invokevirtual zombie/iso/Helicopter.update ()V
        K: 
            line 3316
            invokestatic java/lang/System.currentTimeMillis ()J
            lstore currentMS
        L: 
            line 3317
            lload currentMS
            aload this
            getfield zombie/iso/IsoWorld.emitterUpdateMs J
            lsub 
            ldc 30L
            lcmp 
            iflt O
        M: 
            line 3318
            aload this
            lload currentMS
            putfield zombie/iso/IsoWorld.emitterUpdateMs J
        N: 
            line 3319
            aload this
            iconst_1 
            putfield zombie/iso/IsoWorld.emitterUpdate Z
            goto P
        O: 
            line 3321
            aload this
            iconst_0 
            putfield zombie/iso/IsoWorld.emitterUpdate Z
        P: 
            line 3323
            iconst_0 
            istore n
        Q: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge AE
        R: 
            line 3324
            aload this
            getfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/audio/BaseSoundEmitter
            astore e
        S: 
            line 3325
            aload this
            getfield zombie/iso/IsoWorld.emitterUpdate Z
            ifne T
            aload e
            invokevirtual zombie/audio/BaseSoundEmitter.hasSoundsToStart ()Z
            ifeq U
        T: 
            line 3326
            aload e
            invokevirtual zombie/audio/BaseSoundEmitter.tick ()V
        U: 
            line 3328
            aload e
            invokevirtual zombie/audio/BaseSoundEmitter.isEmpty ()Z
            ifeq AD
        V: 
            line 3329
            aload e
            instanceof fmod/fmod/FMODSoundEmitter
            ifeq X
            aload e
            checkcast fmod/fmod/FMODSoundEmitter
            astore fmodSoundEmitter
        W: 
            line 3330
            aload fmodSoundEmitter
            invokevirtual fmod/fmod/FMODSoundEmitter.clearParameters ()V
        X: 
            line 3332
            aload this
            getfield zombie/iso/IsoWorld.currentEmitters Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        Y: 
            line 3333
            aload this
            getfield zombie/iso/IsoWorld.freeEmitters Ljava/util/ArrayDeque;
            aload e
            invokevirtual java/util/ArrayDeque.push (Ljava/lang/Object;)V
        Z: 
            line 3334
            aload this
            getfield zombie/iso/IsoWorld.emitterOwners Ljava/util/HashMap;
            aload e
            invokevirtual java/util/HashMap.remove (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast zombie/iso/IsoObject
            astore owner
        AA: 
            line 3335
            aload owner
            ifnull AC
            aload owner
            getfield zombie/iso/IsoObject.emitter Lzombie/audio/BaseSoundEmitter;
            aload e
            if_acmpne AC
        AB: 
            line 3336
            aload owner
            aconst_null 
            putfield zombie/iso/IsoObject.emitter Lzombie/audio/BaseSoundEmitter;
        AC: 
            line 3338
            iinc n -1
        AD: 
            line 3323
            iinc n 1
            goto Q
        AE: 
            line 3341
            getstatic zombie/network/GameClient.client Z
            ifne AI
            getstatic zombie/network/GameServer.server Z
            ifne AI
        AF: 
            line 3342
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            invokevirtual zombie/iso/IsoMetaGrid.getCurrentCellData ()Lzombie/iso/IsoMetaCell;
            astore currentChunk
        AG: 
            line 3343
            aload currentChunk
            ifnull AI
        AH: 
            line 3344
            aload currentChunk
            invokevirtual zombie/iso/IsoMetaCell.checkTriggers ()V
        AI: 
            line 3347
            getstatic zombie/WorldSoundManager.instance Lzombie/WorldSoundManager;
            invokevirtual zombie/WorldSoundManager.initFrame ()V
        AJ: 
            line 3348
            getstatic zombie/ai/ZombieGroupManager.instance Lzombie/ai/ZombieGroupManager;
            invokevirtual zombie/ai/ZombieGroupManager.preupdate ()V
        AK: 
            line 3349
            invokestatic zombie/core/utils/OnceEvery.update ()V
        AL: 
            line 3350
            getstatic zombie/CollisionManager.instance Lzombie/CollisionManager;
            invokevirtual zombie/CollisionManager.initUpdate ()V
        AM: 
            line 3352
            aconst_null 
            astore thread
        AN: 
            line 3354
            getstatic zombie/debug/DebugOptions.instance Lzombie/debug/DebugOptions;
            getfield zombie/debug/DebugOptions.threadWorld Lzombie/debug/BooleanDebugOption;
            invokevirtual zombie/debug/BooleanDebugOption.getValue ()Z
            ifeq AP
        AO: 
            line 3355
            aload this
            invokedynamic run (Lzombie/iso/IsoWorld;)Ljava/lang/Runnable; LambdaMetafactory.metafactory { ()V, { invokevirtual, zombie/iso/IsoWorld.updateThread, ()V }, ()V }
            invokestatic zombie/core/PZForkJoinPool.commonPool ()Ljava/util/concurrent/ForkJoinPool;
            invokestatic java/util/concurrent/CompletableFuture.runAsync (Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/CompletableFuture;
            astore thread
        AP: 
            line 3358
            invokestatic zombie/GameProfiler.getInstance ()Lzombie/GameProfiler;
            astore profiler
        AQ: 
            line 3359
            aload profiler
            ldc "Update Climate"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        AR: 
            // try-start:   range=[AR-AS] handler=AT:java/lang/Throwable 
            line 3360
            invokestatic zombie/iso/weather/ClimateManager.getInstance ()Lzombie/iso/weather/ClimateManager;
            invokevirtual zombie/iso/weather/ClimateManager.update ()V
        AS: 
            // try-end:     range=[AR-AS] handler=AT:java/lang/Throwable 
            line 3361
            aload ignored
            ifnull AY
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto AY
        AT: 
            // try-handler: range=[AR-AS] handler=AT:java/lang/Throwable 
            line 3359
            astore v6
            aload ignored
            ifnull AX
        AU: 
            // try-start:   range=[AU-AV] handler=AW:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        AV: 
            // try-end:     range=[AU-AV] handler=AW:java/lang/Throwable 
            goto AX
        AW: 
            // try-handler: range=[AU-AV] handler=AW:java/lang/Throwable 
            astore v7
            aload v6
            aload v7
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AX: 
            aload v6
            athrow 
        AY: 
            line 3363
            aload this
            invokevirtual zombie/iso/IsoWorld.updateWorld ()V
        AZ: 
            line 3365
            aload thread
            ifnull BJ
        BA: 
            line 3366
            aload profiler
            ldc "Wait Thread"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        BB: 
            // try-start:   range=[BB-BC] handler=BD:java/lang/Throwable 
            line 3367
            aload thread
            invokevirtual java/util/concurrent/CompletableFuture.join ()Ljava/lang/Object;
            pop 
        BC: 
            // try-end:     range=[BB-BC] handler=BD:java/lang/Throwable 
            line 3368
            aload ignored
            ifnull BI
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto BI
        BD: 
            // try-handler: range=[BB-BC] handler=BD:java/lang/Throwable 
            line 3366
            astore v6
            aload ignored
            ifnull BH
        BE: 
            // try-start:   range=[BE-BF] handler=BG:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        BF: 
            // try-end:     range=[BE-BF] handler=BG:java/lang/Throwable 
            goto BH
        BG: 
            // try-handler: range=[BE-BF] handler=BG:java/lang/Throwable 
            astore v7
            aload v6
            aload v7
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        BH: 
            aload v6
            athrow 
        BI: 
            goto BK
        BJ: 
            line 3370
            aload this
            invokevirtual zombie/iso/IsoWorld.updateThread ()V
        BK: 
            line 3374
            getstatic zombie/iso/IsoWorld.animationRecorderDiscard Z
            ifeq BN
        BL: 
            line 3375
            invokestatic zombie/core/skinnedmodel/animation/debug/AnimationPlayerRecorder.discardOldRecordings ()V
        BM: 
            line 3376
            iconst_0 
            putstatic zombie/iso/IsoWorld.animationRecorderDiscard Z
        BN: 
            line 3378
            return 
        BO: 
        }
    }

    .method private updateThread ()V {
        parameters: { this },
        exceptions: { 
            { C, D, E, Ljava/lang/Throwable; }, 
            { F, G, H, Ljava/lang/Throwable; }, 
            { K, L, M, Ljava/lang/Throwable; }, 
            { N, O, P, Ljava/lang/Throwable; }, 
            { AB, AC, AD, Ljava/lang/Throwable; }, 
            { AE, AF, AG, Ljava/lang/Throwable; }, 
            { AO, AP, AQ, Ljava/lang/Throwable; }, 
            { AR, AS, AT, Ljava/lang/Throwable; }, 
            { AW, AX, AY, Ljava/lang/Throwable; }, 
            { AZ, BA, BB, Ljava/lang/Throwable; }
         },
        code: {
        A: 
            line 3381
            invokestatic zombie/GameProfiler.getInstance ()Lzombie/GameProfiler;
            astore profiler
        B: 
            line 3382
            aload profiler
            ldc "Update Buildings"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        C: 
            // try-start:   range=[C-D] handler=E:java/lang/Throwable 
            line 3383
            aload this
            invokevirtual zombie/iso/IsoWorld.updateBuildings ()V
        D: 
            // try-end:     range=[C-D] handler=E:java/lang/Throwable 
            line 3384
            aload ignored
            ifnull J
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto J
        E: 
            // try-handler: range=[C-D] handler=E:java/lang/Throwable 
            line 3382
            astore v3
            aload ignored
            ifnull I
        F: 
            // try-start:   range=[F-G] handler=H:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        G: 
            // try-end:     range=[F-G] handler=H:java/lang/Throwable 
            goto I
        H: 
            // try-handler: range=[F-G] handler=H:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        I: 
            aload v3
            athrow 
        J: 
            line 3386
            aload profiler
            ldc "Update Static"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        K: 
            // try-start:   range=[K-L] handler=M:java/lang/Throwable 
            line 3387
            invokestatic zombie/iso/objects/ObjectRenderEffects.updateStatic ()V
        L: 
            // try-end:     range=[K-L] handler=M:java/lang/Throwable 
            line 3388
            aload ignored
            ifnull R
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto R
        M: 
            // try-handler: range=[K-L] handler=M:java/lang/Throwable 
            line 3386
            astore v3
            aload ignored
            ifnull Q
        N: 
            // try-start:   range=[N-O] handler=P:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        O: 
            // try-end:     range=[N-O] handler=P:java/lang/Throwable 
            goto Q
        P: 
            // try-handler: range=[N-O] handler=P:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        Q: 
            aload v3
            athrow 
        R: 
            line 3390
            iconst_0 
            istore i
        S: 
            iload i
            aload this
            getfield zombie/iso/IsoWorld.addCoopPlayers Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge Y
        T: 
            line 3391
            aload this
            getfield zombie/iso/IsoWorld.addCoopPlayers Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/util/AddCoopPlayer
            astore acp
        U: 
            line 3392
            aload acp
            invokevirtual zombie/util/AddCoopPlayer.update ()V
        V: 
            line 3393
            aload acp
            invokevirtual zombie/util/AddCoopPlayer.isFinished ()Z
            ifeq X
        W: 
            line 3394
            aload this
            getfield zombie/iso/IsoWorld.addCoopPlayers Ljava/util/ArrayList;
            iload i
            iinc i -1
            invokevirtual java/util/ArrayList.remove (I)Ljava/lang/Object;
            pop 
        X: 
            line 3390
            iinc i 1
            goto S
        Y: 
            line 3397
            getstatic zombie/network/GameServer.server Z
            ifne AA
        Z: 
            line 3398
            invokestatic zombie/characters/IsoPlayer.UpdateRemovedEmitters ()V
        AA: 
            line 3401
            aload profiler
            ldc "Update DBs"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        AB: 
            // try-start:   range=[AB-AC] handler=AD:java/lang/Throwable 
            line 3402
            aload this
            invokevirtual zombie/iso/IsoWorld.updateDBs ()V
        AC: 
            // try-end:     range=[AB-AC] handler=AD:java/lang/Throwable 
            line 3403
            aload ignored
            ifnull AI
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto AI
        AD: 
            // try-handler: range=[AB-AC] handler=AD:java/lang/Throwable 
            line 3401
            astore v3
            aload ignored
            ifnull AH
        AE: 
            // try-start:   range=[AE-AF] handler=AG:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        AF: 
            // try-end:     range=[AE-AF] handler=AG:java/lang/Throwable 
            goto AH
        AG: 
            // try-handler: range=[AE-AF] handler=AG:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AH: 
            aload v3
            athrow 
        AI: 
            line 3405
            aload this
            getfield zombie/iso/IsoWorld.updateSafehousePlayers I
            ifle AN
            getstatic zombie/network/GameServer.server Z
            ifne AJ
            getstatic zombie/network/GameClient.client Z
            ifeq AN
        AJ: 
            line 3406
            aload this
            dup 
            getfield zombie/iso/IsoWorld.updateSafehousePlayers I
            iconst_1 
            isub 
            putfield zombie/iso/IsoWorld.updateSafehousePlayers I
        AK: 
            line 3407
            aload this
            getfield zombie/iso/IsoWorld.updateSafehousePlayers I
            ifne AN
        AL: 
            line 3408
            aload this
            sipush 200
            putfield zombie/iso/IsoWorld.updateSafehousePlayers I
        AM: 
            line 3409
            invokestatic zombie/iso/areas/SafeHouse.updateSafehousePlayersConnected ()V
        AN: 
            line 3413
            aload profiler
            ldc "Update VA"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        AO: 
            // try-start:   range=[AO-AP] handler=AQ:java/lang/Throwable 
            line 3414
            invokestatic zombie/characters/animals/AnimalZones.updateVirtualAnimals ()V
        AP: 
            // try-end:     range=[AO-AP] handler=AQ:java/lang/Throwable 
            line 3415
            aload ignored
            ifnull AV
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto AV
        AQ: 
            // try-handler: range=[AO-AP] handler=AQ:java/lang/Throwable 
            line 3413
            astore v3
            aload ignored
            ifnull AU
        AR: 
            // try-start:   range=[AR-AS] handler=AT:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        AS: 
            // try-end:     range=[AR-AS] handler=AT:java/lang/Throwable 
            goto AU
        AT: 
            // try-handler: range=[AR-AS] handler=AT:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        AU: 
            aload v3
            athrow 
        AV: 
            line 3416
            aload profiler
            ldc "Load Animal Defs"
            invokevirtual zombie/GameProfiler.profile (Ljava/lang/String;)Lzombie/GameProfiler$ProfileArea;
            astore ignored
        AW: 
            // try-start:   range=[AW-AX] handler=AY:java/lang/Throwable 
            line 3417
            invokestatic zombie/characters/animals/AnimalTracksDefinitions.loadTracksDefinitions ()V
        AX: 
            // try-end:     range=[AW-AX] handler=AY:java/lang/Throwable 
            line 3418
            aload ignored
            ifnull BD
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
            goto BD
        AY: 
            // try-handler: range=[AW-AX] handler=AY:java/lang/Throwable 
            line 3416
            astore v3
            aload ignored
            ifnull BC
        AZ: 
            // try-start:   range=[AZ-BA] handler=BB:java/lang/Throwable 
            aload ignored
            invokevirtual zombie/GameProfiler$ProfileArea.close ()V
        BA: 
            // try-end:     range=[AZ-BA] handler=BB:java/lang/Throwable 
            goto BC
        BB: 
            // try-handler: range=[AZ-BA] handler=BB:java/lang/Throwable 
            astore v4
            aload v3
            aload v4
            invokevirtual java/lang/Throwable.addSuppressed (Ljava/lang/Throwable;)V
        BC: 
            aload v3
            athrow 
        BD: 
            line 3419
            return 
        BE: 
        }
    }

    .method private updateBuildings ()V {
        parameters: { this },
        code: {
        A: 
            line 3422
            iconst_0 
            istore n
        B: 
            iload n
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getBuildingList ()Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge E
        C: 
            line 3423
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            invokevirtual zombie/iso/IsoCell.getBuildingList ()Ljava/util/ArrayList;
            iload n
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/iso/areas/IsoBuilding
            invokevirtual zombie/iso/areas/IsoBuilding.update ()V
        D: 
            line 3422
            iinc n 1
            goto B
        E: 
            line 3425
            return 
        F: 
        }
    }

    .method private updateDBs ()V {
        parameters: { this },
        exceptions: { 
            { A, D, E, Ljava/lang/Exception; }
         },
        code: {
        A: 
            // try-start:   range=[A-D] handler=E:java/lang/Exception 
            line 3429
            invokestatic zombie/savefile/PlayerDB.isAvailable ()Z
            ifeq C
        B: 
            line 3430
            invokestatic zombie/savefile/PlayerDB.getInstance ()Lzombie/savefile/PlayerDB;
            invokevirtual zombie/savefile/PlayerDB.updateMain ()V
        C: 
            line 3432
            getstatic zombie/vehicles/VehiclesDB2.instance Lzombie/vehicles/VehiclesDB2;
            invokevirtual zombie/vehicles/VehiclesDB2.updateMain ()V
        D: 
            // try-end:     range=[A-D] handler=E:java/lang/Exception 
            line 3435
            goto G
        E: 
            // try-handler: range=[A-D] handler=E:java/lang/Exception 
            line 3433
            astore ex
        F: 
            line 3434
            aload ex
            invokestatic zombie/core/logger/ExceptionLogger.logException (Ljava/lang/Throwable;)V
        G: 
            line 3436
            return 
        H: 
        }
    }

    .method public getCell ()Lzombie/iso/IsoCell; {
        parameters: { this },
        code: {
        A: 
            line 3439
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            areturn 
        B: 
        }
    }

    .method private PopulateCellWithSurvivors ()V {
        parameters: { this },
        code: {
        A: 
            line 3443
            return 
        B: 
        }
    }

    .method public getWorldSquareY ()I {
        parameters: { this },
        code: {
        A: 
            line 3446
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            aaload 
            getfield zombie/iso/IsoChunkMap.worldY I
            bipush 8
            imul 
            ireturn 
        B: 
        }
    }

    .method public getWorldSquareX ()I {
        parameters: { this },
        code: {
        A: 
            line 3450
            aload this
            getfield zombie/iso/IsoWorld.currentCell Lzombie/iso/IsoCell;
            getfield zombie/iso/IsoCell.chunkMap [Lzombie/iso/IsoChunkMap;
            invokestatic zombie/characters/IsoPlayer.getPlayerIndex ()I
            aaload 
            getfield zombie/iso/IsoChunkMap.worldX I
            bipush 8
            imul 
            ireturn 
        B: 
        }
    }

    .method public getMetaChunk (II)Lzombie/iso/IsoMetaChunk; {
        parameters: { this, wx, wy },
        code: {
        A: 
            line 3454
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            iload wx
            iload wy
            invokevirtual zombie/iso/IsoMetaGrid.getChunkData (II)Lzombie/iso/IsoMetaChunk;
            areturn 
        B: 
        }
    }

    .method public getMetaChunkFromTile (II)Lzombie/iso/IsoMetaChunk; {
        parameters: { this, wx, wy },
        code: {
        A: 
            line 3458
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            iload wx
            iload wy
            invokevirtual zombie/iso/IsoMetaGrid.getChunkDataFromTile (II)Lzombie/iso/IsoMetaChunk;
            areturn 
        B: 
        }
    }

    .method public getGlobalTemperature ()F {
        parameters: { this },
        code: {
        A: 
            line 3462
            invokestatic zombie/iso/weather/ClimateManager.getInstance ()Lzombie/iso/weather/ClimateManager;
            invokevirtual zombie/iso/weather/ClimateManager.getTemperature ()F
            freturn 
        B: 
        }
    }

    .method public getWeather ()Ljava/lang/String; {
        parameters: { this },
        code: {
        A: 
            line 3466
            aload this
            getfield zombie/iso/IsoWorld.weather Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public setWeather (Ljava/lang/String;)V {
        parameters: { this, weather },
        code: {
        A: 
            line 3470
            aload this
            aload weather
            putfield zombie/iso/IsoWorld.weather Ljava/lang/String;
        B: 
            line 3471
            return 
        C: 
        }
    }

    .method public getLuaSpawnCellX ()I {
        parameters: { this },
        code: {
        A: 
            line 3474
            aload this
            getfield zombie/iso/IsoWorld.luaPosX I
            sipush 256
            invokestatic zombie/core/math/PZMath.coordmodulo (II)I
            ireturn 
        B: 
        }
    }

    .visible-annotation java/lang/Deprecated {}
    .method public setLuaSpawnCellX (I)V {
        parameters: { this, luaSpawnCellX },
        code: {
        A: 
            line 3479
            return 
        B: 
        }
    }

    .method public getLuaSpawnCellY ()I {
        parameters: { this },
        code: {
        A: 
            line 3482
            aload this
            getfield zombie/iso/IsoWorld.luaPosY I
            sipush 256
            invokestatic zombie/core/math/PZMath.coordmodulo (II)I
            ireturn 
        B: 
        }
    }

    .visible-annotation java/lang/Deprecated {}
    .method public setLuaSpawnCellY (I)V {
        parameters: { this, luaSpawnCellY },
        code: {
        A: 
            line 3487
            return 
        B: 
        }
    }

    .method public getLuaPosX ()I {
        parameters: { this },
        code: {
        A: 
            line 3490
            aload this
            getfield zombie/iso/IsoWorld.luaPosX I
            ireturn 
        B: 
        }
    }

    .method public setLuaPosX (I)V {
        parameters: { this, luaPosX },
        code: {
        A: 
            line 3494
            aload this
            iload luaPosX
            putfield zombie/iso/IsoWorld.luaPosX I
        B: 
            line 3495
            return 
        C: 
        }
    }

    .method public getLuaPosY ()I {
        parameters: { this },
        code: {
        A: 
            line 3498
            aload this
            getfield zombie/iso/IsoWorld.luaPosY I
            ireturn 
        B: 
        }
    }

    .method public setLuaPosY (I)V {
        parameters: { this, luaPosY },
        code: {
        A: 
            line 3502
            aload this
            iload luaPosY
            putfield zombie/iso/IsoWorld.luaPosY I
        B: 
            line 3503
            return 
        C: 
        }
    }

    .method public getLuaPosZ ()I {
        parameters: { this },
        code: {
        A: 
            line 3506
            aload this
            getfield zombie/iso/IsoWorld.luaPosZ I
            ireturn 
        B: 
        }
    }

    .method public setLuaPosZ (I)V {
        parameters: { this, luaPosZ },
        code: {
        A: 
            line 3510
            aload this
            iload luaPosZ
            putfield zombie/iso/IsoWorld.luaPosZ I
        B: 
            line 3511
            return 
        C: 
        }
    }

    .method public setSpawnRegion (Ljava/lang/String;)V {
        parameters: { this, spawnRegionName },
        code: {
        A: 
            line 3514
            aload spawnRegionName
            ifnull C
        B: 
            line 3515
            aload this
            aload spawnRegionName
            putfield zombie/iso/IsoWorld.spawnRegionName Ljava/lang/String;
        C: 
            line 3517
            return 
        D: 
        }
    }

    .method public getSpawnRegion ()Ljava/lang/String; {
        parameters: { this },
        code: {
        A: 
            line 3520
            aload this
            getfield zombie/iso/IsoWorld.spawnRegionName Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public getWorld ()Ljava/lang/String; {
        parameters: { this },
        code: {
        A: 
            line 3524
            getstatic zombie/core/Core.gameSaveWorld Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public transmitWeather ()V {
        parameters: { this },
        code: {
        A: 
            line 3528
            getstatic zombie/network/GameServer.server Z
            ifne C
        B: 
            line 3529
            return 
        C: 
            line 3531
            invokestatic zombie/network/GameServer.sendWeather ()V
        D: 
            line 3532
            return 
        E: 
        }
    }

    .method public isValidSquare (III)Z {
        parameters: { this, x, y, z },
        code: {
        A: 
            line 3535
            iload z
            bipush -32
            if_icmplt B
            iload z
            bipush 31
            if_icmple C
        B: 
            line 3536
            iconst_0 
            ireturn 
        C: 
            line 3538
            aload this
            getfield zombie/iso/IsoWorld.metaGrid Lzombie/iso/IsoMetaGrid;
            iload x
            iload y
            invokevirtual zombie/iso/IsoMetaGrid.isValidSquare (II)Z
            ireturn 
        D: 
        }
    }

    .signature "()Ljava/util/ArrayList<Lzombie/randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase;>;"
    .method public getRandomizedZoneList ()Ljava/util/ArrayList; {
        parameters: { this },
        code: {
        A: 
            line 3542
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            areturn 
        B: 
        }
    }

    .method public getRandomizedZoneStoryByName (Ljava/lang/String;)Lzombie/randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase; {
        parameters: { this, name },
        code: {
        A: 
            line 3546
            iconst_0 
            istore i
        B: 
            iload i
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge G
        C: 
            line 3547
            aload this
            getfield zombie/iso/IsoWorld.randomizedZoneList Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase
            astore rzs
        D: 
            line 3548
            aload rzs
            invokevirtual zombie/randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase.getName ()Ljava/lang/String;
            aload name
            invokevirtual java/lang/String.equalsIgnoreCase (Ljava/lang/String;)Z
            ifeq F
        E: 
            line 3549
            aload rzs
            areturn 
        F: 
            line 3546
            iinc i 1
            goto B
        G: 
            line 3552
            aconst_null 
            areturn 
        H: 
        }
    }

    .signature "()Ljava/util/ArrayList<Lzombie/randomizedWorld/randomizedBuilding/RandomizedBuildingBase;>;"
    .method public getRandomizedBuildingList ()Ljava/util/ArrayList; {
        parameters: { this },
        code: {
        A: 
            line 3556
            aload this
            getfield zombie/iso/IsoWorld.randomizedBuildingList Ljava/util/ArrayList;
            areturn 
        B: 
        }
    }

    .signature "()Ljava/util/ArrayList<Lzombie/randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase;>;"
    .method public getRandomizedVehicleStoryList ()Ljava/util/ArrayList; {
        parameters: { this },
        code: {
        A: 
            line 3560
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            areturn 
        B: 
        }
    }

    .method public getRandomizedVehicleStoryByName (Ljava/lang/String;)Lzombie/randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase; {
        parameters: { this, name },
        code: {
        A: 
            line 3564
            iconst_0 
            istore i
        B: 
            iload i
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            invokevirtual java/util/ArrayList.size ()I
            if_icmpge G
        C: 
            line 3565
            aload this
            getfield zombie/iso/IsoWorld.randomizedVehicleStoryList Ljava/util/ArrayList;
            iload i
            invokevirtual java/util/ArrayList.get (I)Ljava/lang/Object;
            checkcast zombie/randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase
            astore rvs
        D: 
            line 3566
            aload rvs
            invokevirtual zombie/randomizedWorld/randomizedVehicleStory/RandomizedVehicleStoryBase.getName ()Ljava/lang/String;
            aload name
            invokevirtual java/lang/String.equalsIgnoreCase (Ljava/lang/String;)Z
            ifeq F
        E: 
            line 3567
            aload rvs
            areturn 
        F: 
            line 3564
            iinc i 1
            goto B
        G: 
            line 3570
            aconst_null 
            areturn 
        H: 
        }
    }

    .method public getRBBasic ()Lzombie/randomizedWorld/randomizedBuilding/RandomizedBuildingBase; {
        parameters: { this },
        code: {
        A: 
            line 3574
            aload this
            getfield zombie/iso/IsoWorld.rbBasic Lzombie/randomizedWorld/randomizedBuilding/RandomizedBuildingBase;
            areturn 
        B: 
        }
    }

    .method public getRandomizedWorldBase ()Lzombie/randomizedWorld/RandomizedWorldBase; {
        parameters: { this },
        code: {
        A: 
            line 3578
            aload this
            getfield zombie/iso/IsoWorld.randomizedWorldBase Lzombie/randomizedWorld/RandomizedWorldBase;
            areturn 
        B: 
        }
    }

    .method public getDifficulty ()Ljava/lang/String; {
        parameters: { this },
        code: {
        A: 
            line 3582
            invokestatic zombie/core/Core.getDifficulty ()Ljava/lang/String;
            areturn 
        B: 
        }
    }

    .method public setDifficulty (Ljava/lang/String;)V {
        parameters: { this, difficulty },
        code: {
        A: 
            line 3586
            aload difficulty
            invokestatic zombie/core/Core.setDifficulty (Ljava/lang/String;)V
        B: 
            line 3587
            return 
        C: 
        }
    }

    .method public static getZombiesDisabled ()Z {
        code: {
        A: 
            line 3590
            getstatic zombie/iso/IsoWorld.noZombies Z
            ifne B
            getstatic zombie/SystemDisabler.doZombieCreation Z
            ifeq B
            getstatic zombie/SandboxOptions.instance Lzombie/SandboxOptions;
            getfield zombie/SandboxOptions.zombies Lzombie/SandboxOptions$EnumSandboxOption;
            invokevirtual zombie/SandboxOptions$EnumSandboxOption.getValue ()I
            bipush 6
            if_icmpne C
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

    .method public static getZombiesEnabled ()Z {
        code: {
        A: 
            line 3594
            invokestatic zombie/iso/IsoWorld.getZombiesDisabled ()Z
            ifne B
            iconst_1 
            goto C
        B: 
            iconst_0 
        C: 
            ireturn 
        D: 
        }
    }

    .method public getClimateManager ()Lzombie/iso/weather/ClimateManager; {
        parameters: { this },
        code: {
        A: 
            line 3598
            invokestatic zombie/iso/weather/ClimateManager.getInstance ()Lzombie/iso/weather/ClimateManager;
            areturn 
        B: 
        }
    }

    .method public getPuddlesManager ()Lzombie/iso/IsoPuddles; {
        parameters: { this },
        code: {
        A: 
            line 3602
            invokestatic zombie/iso/IsoPuddles.getInstance ()Lzombie/iso/IsoPuddles;
            areturn 
        B: 
        }
    }

    .method public static getWorldVersion ()I {
        code: {
        A: 
            line 3607
            sipush 241
            ireturn 
        B: 
        }
    }

    .signature "()Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/util/UUID;>;>;"
    .method public getSpawnedZombieZone ()Ljava/util/HashMap; {
        parameters: { this },
        code: {
        A: 
            line 3611
            aload this
            getfield zombie/iso/IsoWorld.spawnedZombieZone Ljava/util/HashMap;
            areturn 
        B: 
        }
    }

    .method public getTimeSinceLastSurvivorInHorde ()I {
        parameters: { this },
        code: {
        A: 
            line 3615
            aload this
            getfield zombie/iso/IsoWorld.timeSinceLastSurvivorInHorde I
            ireturn 
        B: 
        }
    }

    .method public setTimeSinceLastSurvivorInHorde (I)V {
        parameters: { this, timeSinceLastSurvivorInHorde },
        code: {
        A: 
            line 3619
            aload this
            iload timeSinceLastSurvivorInHorde
            putfield zombie/iso/IsoWorld.timeSinceLastSurvivorInHorde I
        B: 
            line 3620
            return 
        C: 
        }
    }

    .method public getWorldAgeDays ()F {
        parameters: { this },
        code: {
        A: 
            line 3623
            invokestatic zombie/GameTime.getInstance ()Lzombie/GameTime;
            invokevirtual zombie/GameTime.getWorldAgeHours ()D
            d2f 
            ldc 24F
            fdiv 
            fstore worldAgeDays
        B: 
            line 3625
            fload worldAgeDays
            getstatic zombie/SandboxOptions.instance Lzombie/SandboxOptions;
            getfield zombie/SandboxOptions.timeSinceApo Lzombie/SandboxOptions$EnumSandboxOption;
            invokevirtual zombie/SandboxOptions$EnumSandboxOption.getValue ()I
            iconst_1 
            isub 
            bipush 30
            imul 
            i2f 
            fadd 
            fstore worldAgeDays
        C: 
            line 3626
            fload worldAgeDays
            freturn 
        D: 
        }
    }

    .signature "()Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .method public getAllTiles ()Ljava/util/HashMap; {
        parameters: { this },
        code: {
        A: 
            line 3630
            aload this
            getfield zombie/iso/IsoWorld.allTiles Ljava/util/HashMap;
            areturn 
        B: 
        }
    }

    .signature "()Ljava/util/ArrayList<Ljava/lang/String;>;"
    .method public getAllTilesName ()Ljava/util/ArrayList; {
        parameters: { this },
        code: {
        A: 
            line 3639
            new java/util/ArrayList
            dup 
            invokespecial java/util/ArrayList.<init> ()V
            astore result
        B: 
            line 3640
            aload this
            getfield zombie/iso/IsoWorld.allTiles Ljava/util/HashMap;
            invokevirtual java/util/HashMap.keySet ()Ljava/util/Set;
            invokeinterface java/util/Set.iterator ()Ljava/util/Iterator;
            astore it
        C: 
            line 3641
            aload it
            invokeinterface java/util/Iterator.hasNext ()Z
            ifeq E
        D: 
            line 3642
            aload result
            aload it
            invokeinterface java/util/Iterator.next ()Ljava/lang/Object;
            checkcast java/lang/String
            invokevirtual java/util/ArrayList.add (Ljava/lang/Object;)Z
            pop 
            goto C
        E: 
            line 3644
            aload result
            invokestatic java/util/Collections.sort (Ljava/util/List;)V
        F: 
            line 3645
            aload result
            areturn 
        G: 
        }
    }

    .signature "(Ljava/lang/String;)Ljava/util/ArrayList<Ljava/lang/String;>;"
    .method public getAllTiles (Ljava/lang/String;)Ljava/util/ArrayList; {
        parameters: { this, filename },
        code: {
        A: 
            line 3649
            aload this
            getfield zombie/iso/IsoWorld.allTiles Ljava/util/HashMap;
            aload filename
            invokevirtual java/util/HashMap.get (Ljava/lang/Object;)Ljava/lang/Object;
            checkcast java/util/ArrayList
            areturn 
        B: 
        }
    }

    .method public isHydroPowerOn ()Z {
        parameters: { this },
        code: {
        A: 
            line 3653
            aload this
            getfield zombie/iso/IsoWorld.hydroPowerOn Z
            ireturn 
        B: 
        }
    }

    .method public setHydroPowerOn (Z)V {
        parameters: { this, on },
        code: {
        A: 
            line 3660
            aload this
            iload on
            putfield zombie/iso/IsoWorld.hydroPowerOn Z
        B: 
            line 3661
            return 
        C: 
        }
    }

    .signature "()Ljava/util/ArrayList<Ljava/lang/String;>;"
    .method public getTileImageNames ()Ljava/util/ArrayList; {
        parameters: { this },
        code: {
        A: 
            line 3664
            aload this
            getfield zombie/iso/IsoWorld.tileImages Ljava/util/ArrayList;
            areturn 
        B: 
        }
    }

    .method public static parseDistributions ()V {
        code: {
        A: 
            line 3668
            invokestatic zombie/inventory/ItemPickerJava.Parse ()V
        B: 
            line 3669
            invokestatic zombie/inventory/ItemPickerJava.InitSandboxLootSettings ()V
        C: 
            line 3670
            return 
        D: 
        }
    }

    .method public setRules (Lzombie/iso/worldgen/rules/Rules;)V {
        parameters: { this, rules },
        code: {
        A: 
            line 3675
            aload this
            aload rules
            putfield zombie/iso/IsoWorld.rules Lzombie/iso/worldgen/rules/Rules;
        B: 
            line 3676
            return 
        C: 
        }
    }

    .method public getRules ()Lzombie/iso/worldgen/rules/Rules; {
        parameters: { this },
        code: {
        A: 
            line 3679
            aload this
            getfield zombie/iso/IsoWorld.rules Lzombie/iso/worldgen/rules/Rules;
            areturn 
        B: 
        }
    }

    .method public setWgChunk (Lzombie/iso/worldgen/WorldGenChunk;)V {
        parameters: { this, wgChunk },
        code: {
        A: 
            line 3685
            aload this
            aload wgChunk
            putfield zombie/iso/IsoWorld.wgChunk Lzombie/iso/worldgen/WorldGenChunk;
        B: 
            line 3686
            return 
        C: 
        }
    }

    .method public getWgChunk ()Lzombie/iso/worldgen/WorldGenChunk; {
        parameters: { this },
        code: {
        A: 
            line 3689
            aload this
            getfield zombie/iso/IsoWorld.wgChunk Lzombie/iso/worldgen/WorldGenChunk;
            areturn 
        B: 
        }
    }

    .method public setBlending (Lzombie/iso/worldgen/blending/Blending;)V {
        parameters: { this, blending },
        code: {
        A: 
            line 3695
            aload this
            aload blending
            putfield zombie/iso/IsoWorld.blending Lzombie/iso/worldgen/blending/Blending;
        B: 
            line 3696
            return 
        C: 
        }
    }

    .method public getBlending ()Lzombie/iso/worldgen/blending/Blending; {
        parameters: { this },
        code: {
        A: 
            line 3699
            aload this
            getfield zombie/iso/IsoWorld.blending Lzombie/iso/worldgen/blending/Blending;
            areturn 
        B: 
        }
    }

    .method public setAttachmentsHandler (Lzombie/iso/worldgen/attachments/AttachmentsHandler;)V {
        parameters: { this, attachmentsHandler },
        code: {
        A: 
            line 3705
            aload this
            aload attachmentsHandler
            putfield zombie/iso/IsoWorld.attachmentsHandler Lzombie/iso/worldgen/attachments/AttachmentsHandler;
        B: 
            line 3706
            return 
        C: 
        }
    }

    .method public getAttachmentsHandler ()Lzombie/iso/worldgen/attachments/AttachmentsHandler; {
        parameters: { this },
        code: {
        A: 
            line 3709
            aload this
            getfield zombie/iso/IsoWorld.attachmentsHandler Lzombie/iso/worldgen/attachments/AttachmentsHandler;
            areturn 
        B: 
        }
    }

    .method public setZoneGenerator (Lzombie/iso/worldgen/zones/ZoneGenerator;)V {
        parameters: { this, zoneGenerator },
        code: {
        A: 
            line 3715
            aload this
            aload zoneGenerator
            putfield zombie/iso/IsoWorld.zoneGenerator Lzombie/iso/worldgen/zones/ZoneGenerator;
        B: 
            line 3716
            return 
        C: 
        }
    }

    .method public getZoneGenerator ()Lzombie/iso/worldgen/zones/ZoneGenerator; {
        parameters: { this },
        code: {
        A: 
            line 3719
            aload this
            getfield zombie/iso/IsoWorld.zoneGenerator Lzombie/iso/worldgen/zones/ZoneGenerator;
            areturn 
        B: 
        }
    }

    .method public setBiomeMap (Lzombie/iso/worldgen/maps/BiomeMap;)V {
        parameters: { this, biomeMap },
        code: {
        A: 
            line 3725
            aload this
            aload biomeMap
            putfield zombie/iso/IsoWorld.biomeMap Lzombie/iso/worldgen/maps/BiomeMap;
        B: 
            line 3726
            return 
        C: 
        }
    }

    .method public getBiomeMap ()Lzombie/iso/worldgen/maps/BiomeMap; {
        parameters: { this },
        code: {
        A: 
            line 3729
            aload this
            getfield zombie/iso/IsoWorld.biomeMap Lzombie/iso/worldgen/maps/BiomeMap;
            areturn 
        B: 
        }
    }

    .signature "(Ljava/util/List<Lzombie/iso/worldgen/zombie/ZombieVoronoi;>;)V"
    .method public setZombieVoronois (Ljava/util/List;)V {
        parameters: { this, zombieVoronois },
        code: {
        A: 
            line 3735
            aload this
            aload zombieVoronois
            putfield zombie/iso/IsoWorld.zombieVoronois Ljava/util/List;
        B: 
            line 3736
            return 
        C: 
        }
    }

    .signature "()Ljava/util/List<Lzombie/iso/worldgen/zombie/ZombieVoronoi;>;"
    .method public getZombieVoronois ()Ljava/util/List; {
        parameters: { this },
        code: {
        A: 
            line 3739
            aload this
            getfield zombie/iso/IsoWorld.zombieVoronois Ljava/util/List;
            areturn 
        B: 
        }
    }

    .method static <clinit> ()V {
        code: {
        A: 
            line 284
            ldc Lzombie/iso/IsoWorld;
            invokevirtual java/lang/Class.desiredAssertionStatus ()Z
            ifne B
            iconst_1 
            goto C
        B: 
            iconst_0 
        C: 
            putstatic zombie/iso/IsoWorld.$assertionsDisabled Z
        D: 
            line 449
            new zombie/iso/IsoWorld
            dup 
            invokespecial zombie/iso/IsoWorld.<init> ()V
            putstatic zombie/iso/IsoWorld.instance Lzombie/iso/IsoWorld;
        E: 
            line 483
            new zombie/iso/IsoWorld$CompScoreToPlayer
            dup 
            invokespecial zombie/iso/IsoWorld$CompScoreToPlayer.<init> ()V
            putstatic zombie/iso/IsoWorld.compScoreToPlayer Lzombie/iso/IsoWorld$CompScoreToPlayer;
        F: 
            line 554
            ldc "media/"
            putstatic zombie/iso/IsoWorld.mapPath Ljava/lang/String;
        G: 
            line 555
            iconst_1 
            putstatic zombie/iso/IsoWorld.mapUseJar Z
        H: 
            line 1299
            new java/util/HashMap
            dup 
            invokespecial java/util/HashMap.<init> ()V
            putstatic zombie/iso/IsoWorld.PropertyValueMap Ljava/util/HashMap;
        I: 
            line 1903
            iconst_m1 
            putstatic zombie/iso/IsoWorld.savedWorldVersion I
        J: 
            line 3258
            iconst_m1 
            putstatic zombie/iso/IsoWorld.totalWorldVersion I
            return 
        K: 
        }
    }

}
