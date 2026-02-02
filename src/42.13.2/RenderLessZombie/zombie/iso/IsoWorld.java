package zombie.iso;

import fmod.fmod.FMODSoundEmitter;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.io.RandomAccessFile;
import java.lang.invoke.CallSite;
import java.lang.invoke.LambdaMetafactory;
import java.nio.ByteBuffer;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.logging.Level;
import java.util.logging.Logger;
import se.krka.kahlua.vm.KahluaTable;
import zombie.CollisionManager;
import zombie.DebugFileWatcher;
import zombie.FliesSound;
import zombie.GameProfiler;
import zombie.GameTime;
import zombie.GameWindow;
import zombie.IndieGL;
import zombie.Lua.LuaEventManager;
import zombie.Lua.LuaManager;
import zombie.MapCollisionData;
import zombie.MovingObjectUpdateScheduler;
import zombie.PersistentOutfits;
import zombie.PredicatedFileWatcher;
import zombie.ReanimatedPlayers;
import zombie.SandboxOptions;
import zombie.SharedDescriptors;
import zombie.SoundManager;
import zombie.SystemDisabler;
import zombie.VirtualZombieManager;
import zombie.WorldSoundManager;
import zombie.ZomboidFileSystem;
import zombie.ZomboidGlobals;
import zombie.ai.State;
import zombie.ai.ZombieGroupManager;
import zombie.ai.states.FakeDeadZombieState;
import zombie.audio.BaseSoundEmitter;
import zombie.audio.DummySoundEmitter;
import zombie.audio.ObjectAmbientEmitters;
import zombie.audio.parameters.ParameterInside;
import zombie.basements.Basements;
import zombie.characters.AnimalVocalsManager;
import zombie.characters.HaloTextHelper;
import zombie.characters.IsoGameCharacter;
import zombie.characters.IsoPlayer;
import zombie.characters.IsoSurvivor;
import zombie.characters.IsoZombie;
import zombie.characters.SurvivorDesc;
import zombie.characters.TriggerSetAnimationRecorderFile;
import zombie.characters.ZombieVocalsManager;
import zombie.characters.animals.AnimalDefinitions;
import zombie.characters.animals.AnimalPopulationManager;
import zombie.characters.animals.AnimalTracksDefinitions;
import zombie.characters.animals.AnimalZones;
import zombie.characters.animals.IsoAnimal;
import zombie.characters.professions.ProfessionFactory;
import zombie.characters.traits.TraitFactory;
import zombie.core.Core;
import zombie.core.ImportantAreaManager;
import zombie.core.PZForkJoinPool;
import zombie.core.PerformanceSettings;
import zombie.core.SceneShaderStore;
import zombie.core.SpriteRenderer;
import zombie.core.TilePropertyAliasMap;
import zombie.core.Translator;
import zombie.core.logger.ExceptionLogger;
import zombie.core.math.PZMath;
import zombie.core.opengl.Shader;
import zombie.core.physics.WorldSimulation;
import zombie.core.profiling.AbstractPerformanceProfileProbe;
import zombie.core.profiling.PerformanceProfileProbe;
import zombie.core.properties.PropertyContainer;
import zombie.core.random.Rand;
import zombie.core.skinnedmodel.DeadBodyAtlas;
import zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder;
import zombie.core.skinnedmodel.model.WorldItemAtlas;
import zombie.core.stash.StashSystem;
import zombie.core.textures.Texture;
import zombie.core.utils.OnceEvery;
import zombie.debug.DebugLog;
import zombie.debug.DebugOptions;
import zombie.debug.LineDrawer;
import zombie.entity.GameEntityManager;
import zombie.entity.components.spriteconfig.SpriteConfigManager;
import zombie.erosion.ErosionGlobals;
import zombie.gameStates.GameLoadingState;
import zombie.globalObjects.GlobalObjectLookup;
import zombie.input.Mouse;
import zombie.inventory.ItemConfigurator;
import zombie.inventory.ItemPickerJava;
import zombie.inventory.types.MapItem;
import zombie.iso.CellLoader;
import zombie.iso.FishSchoolManager;
import zombie.iso.Helicopter;
import zombie.iso.InstanceTracker;
import zombie.iso.IsoCamera;
import zombie.iso.IsoCell;
import zombie.iso.IsoChunk;
import zombie.iso.IsoChunkMap;
import zombie.iso.IsoDirections;
import zombie.iso.IsoGridSquare;
import zombie.iso.IsoLot;
import zombie.iso.IsoMetaCell;
import zombie.iso.IsoMetaChunk;
import zombie.iso.IsoMetaGrid;
import zombie.iso.IsoMovingObject;
import zombie.iso.IsoObject;
import zombie.iso.IsoObjectPicker;
import zombie.iso.IsoPuddles;
import zombie.iso.IsoUtils;
import zombie.iso.IsoWaterFlow;
import zombie.iso.LightingJNI;
import zombie.iso.LightingThread;
import zombie.iso.MetaTracker;
import zombie.iso.SliceY;
import zombie.iso.SpawnPoints;
import zombie.iso.SpriteDetails.IsoFlagType;
import zombie.iso.SpriteDetails.IsoObjectType;
import zombie.iso.Vector2;
import zombie.iso.WorldConverter;
import zombie.iso.WorldMarkers;
import zombie.iso.WorldStreamer;
import zombie.iso.areas.DesignationZone;
import zombie.iso.areas.IsoBuilding;
import zombie.iso.areas.SafeHouse;
import zombie.iso.areas.isoregion.IsoRegions;
import zombie.iso.fboRenderChunk.FBORenderAreaHighlights;
import zombie.iso.objects.IsoFireManager;
import zombie.iso.objects.ObjectRenderEffects;
import zombie.iso.objects.RainManager;
import zombie.iso.sprite.IsoSprite;
import zombie.iso.sprite.IsoSpriteGrid;
import zombie.iso.sprite.IsoSpriteManager;
import zombie.iso.sprite.SkyBox;
import zombie.iso.sprite.SpriteGridParseData;
import zombie.iso.weather.ClimateManager;
import zombie.iso.weather.WorldFlares;
import zombie.iso.weather.fog.ImprovedFog;
import zombie.iso.weather.fx.IsoWeatherFX;
import zombie.iso.weather.fx.WeatherFxMask;
import zombie.iso.worldgen.WGChunk;
import zombie.iso.worldgen.WGParams;
import zombie.iso.worldgen.attachments.AttachmentsHandler;
import zombie.iso.worldgen.blending.Blending;
import zombie.iso.worldgen.maps.BiomeMap;
import zombie.iso.worldgen.rules.Rules;
import zombie.iso.worldgen.zones.ZoneGenerator;
import zombie.iso.zones.Zone;
import zombie.network.BodyDamageSync;
import zombie.network.ClientServerMap;
import zombie.network.GameClient;
import zombie.network.GameServer;
import zombie.network.NetChecksum;
import zombie.network.PassengerMap;
import zombie.network.ServerMap;
import zombie.network.ServerOptions;
import zombie.network.id.ObjectIDManager;
import zombie.pathfind.PolygonalMap2;
import zombie.pathfind.extra.BorderFinderRenderer;
import zombie.pathfind.nativeCode.PathfindNative;
import zombie.pathfind.nativeCode.PathfindNativeRenderer;
import zombie.popman.ZombiePopulationManager;
import zombie.popman.animal.HutchManager;
import zombie.radio.ZomboidRadio;
import zombie.randomizedWorld.RandomizedWorldBase;
import zombie.randomizedWorld.randomizedBuilding.RBBar;
import zombie.randomizedWorld.randomizedBuilding.RBBarn;
import zombie.randomizedWorld.randomizedBuilding.RBBasic;
import zombie.randomizedWorld.randomizedBuilding.RBBurnt;
import zombie.randomizedWorld.randomizedBuilding.RBBurntCorpse;
import zombie.randomizedWorld.randomizedBuilding.RBBurntFireman;
import zombie.randomizedWorld.randomizedBuilding.RBCafe;
import zombie.randomizedWorld.randomizedBuilding.RBClinic;
import zombie.randomizedWorld.randomizedBuilding.RBDorm;
import zombie.randomizedWorld.randomizedBuilding.RBGunstoreSiege;
import zombie.randomizedWorld.randomizedBuilding.RBHairSalon;
import zombie.randomizedWorld.randomizedBuilding.RBHeatBreakAfternoon;
import zombie.randomizedWorld.randomizedBuilding.RBJackieJaye;
import zombie.randomizedWorld.randomizedBuilding.RBJoanHartford;
import zombie.randomizedWorld.randomizedBuilding.RBKateAndBaldspot;
import zombie.randomizedWorld.randomizedBuilding.RBLooted;
import zombie.randomizedWorld.randomizedBuilding.RBMayorWestPoint;
import zombie.randomizedWorld.randomizedBuilding.RBNolans;
import zombie.randomizedWorld.randomizedBuilding.RBOffice;
import zombie.randomizedWorld.randomizedBuilding.RBOther;
import zombie.randomizedWorld.randomizedBuilding.RBPileOCrepe;
import zombie.randomizedWorld.randomizedBuilding.RBPizzaWhirled;
import zombie.randomizedWorld.randomizedBuilding.RBPoliceSiege;
import zombie.randomizedWorld.randomizedBuilding.RBSafehouse;
import zombie.randomizedWorld.randomizedBuilding.RBSchool;
import zombie.randomizedWorld.randomizedBuilding.RBShopLooted;
import zombie.randomizedWorld.randomizedBuilding.RBSpiffo;
import zombie.randomizedWorld.randomizedBuilding.RBStripclub;
import zombie.randomizedWorld.randomizedBuilding.RBTrashed;
import zombie.randomizedWorld.randomizedBuilding.RBTwiggy;
import zombie.randomizedWorld.randomizedBuilding.RBWoodcraft;
import zombie.randomizedWorld.randomizedBuilding.RandomizedBuildingBase;
import zombie.randomizedWorld.randomizedVehicleStory.RVSAmbulanceCrash;
import zombie.randomizedWorld.randomizedVehicleStory.RVSAnimalOnRoad;
import zombie.randomizedWorld.randomizedVehicleStory.RVSAnimalTrailerOnRoad;
import zombie.randomizedWorld.randomizedVehicleStory.RVSBanditRoad;
import zombie.randomizedWorld.randomizedVehicleStory.RVSBurntCar;
import zombie.randomizedWorld.randomizedVehicleStory.RVSCarCrash;
import zombie.randomizedWorld.randomizedVehicleStory.RVSCarCrashCorpse;
import zombie.randomizedWorld.randomizedVehicleStory.RVSCarCrashDeer;
import zombie.randomizedWorld.randomizedVehicleStory.RVSChangingTire;
import zombie.randomizedWorld.randomizedVehicleStory.RVSConstructionSite;
import zombie.randomizedWorld.randomizedVehicleStory.RVSCrashHorde;
import zombie.randomizedWorld.randomizedVehicleStory.RVSDeadEnd;
import zombie.randomizedWorld.randomizedVehicleStory.RVSFlippedCrash;
import zombie.randomizedWorld.randomizedVehicleStory.RVSHerdOnRoad;
import zombie.randomizedWorld.randomizedVehicleStory.RVSPlonkies;
import zombie.randomizedWorld.randomizedVehicleStory.RVSPoliceBlockade;
import zombie.randomizedWorld.randomizedVehicleStory.RVSPoliceBlockadeShooting;
import zombie.randomizedWorld.randomizedVehicleStory.RVSRegionalProfessionVehicle;
import zombie.randomizedWorld.randomizedVehicleStory.RVSRichJerk;
import zombie.randomizedWorld.randomizedVehicleStory.RVSRoadKill;
import zombie.randomizedWorld.randomizedVehicleStory.RVSRoadKillSmall;
import zombie.randomizedWorld.randomizedVehicleStory.RVSTrailerCrash;
import zombie.randomizedWorld.randomizedVehicleStory.RVSUtilityVehicle;
import zombie.randomizedWorld.randomizedVehicleStory.RandomizedVehicleStoryBase;
import zombie.randomizedWorld.randomizedZoneStory.RZJackieJaye;
import zombie.randomizedWorld.randomizedZoneStory.RZSAttachedAnimal;
import zombie.randomizedWorld.randomizedZoneStory.RZSBBQParty;
import zombie.randomizedWorld.randomizedZoneStory.RZSBaseball;
import zombie.randomizedWorld.randomizedZoneStory.RZSBeachParty;
import zombie.randomizedWorld.randomizedZoneStory.RZSBurntWreck;
import zombie.randomizedWorld.randomizedZoneStory.RZSBuryingCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSCampsite;
import zombie.randomizedWorld.randomizedZoneStory.RZSCharcoalBurner;
import zombie.randomizedWorld.randomizedZoneStory.RZSDean;
import zombie.randomizedWorld.randomizedZoneStory.RZSDuke;
import zombie.randomizedWorld.randomizedZoneStory.RZSEscapedAnimal;
import zombie.randomizedWorld.randomizedZoneStory.RZSEscapedHerd;
import zombie.randomizedWorld.randomizedZoneStory.RZSFishingTrip;
import zombie.randomizedWorld.randomizedZoneStory.RZSForestCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSForestCampEaten;
import zombie.randomizedWorld.randomizedZoneStory.RZSFrankHemingway;
import zombie.randomizedWorld.randomizedZoneStory.RZSHermitCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSHillbillyHoedown;
import zombie.randomizedWorld.randomizedZoneStory.RZSHogWild;
import zombie.randomizedWorld.randomizedZoneStory.RZSHunterCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSKirstyKormick;
import zombie.randomizedWorld.randomizedZoneStory.RZSMurderScene;
import zombie.randomizedWorld.randomizedZoneStory.RZSMusicFest;
import zombie.randomizedWorld.randomizedZoneStory.RZSMusicFestStage;
import zombie.randomizedWorld.randomizedZoneStory.RZSNastyMattress;
import zombie.randomizedWorld.randomizedZoneStory.RZSOccultActivity;
import zombie.randomizedWorld.randomizedZoneStory.RZSOldFirepit;
import zombie.randomizedWorld.randomizedZoneStory.RZSOldShelter;
import zombie.randomizedWorld.randomizedZoneStory.RZSOrphanedFawn;
import zombie.randomizedWorld.randomizedZoneStory.RZSRangerSmith;
import zombie.randomizedWorld.randomizedZoneStory.RZSRockerParty;
import zombie.randomizedWorld.randomizedZoneStory.RZSSadCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSSexyTime;
import zombie.randomizedWorld.randomizedZoneStory.RZSSirTwiggy;
import zombie.randomizedWorld.randomizedZoneStory.RZSSurvivalistCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSTragicPicnic;
import zombie.randomizedWorld.randomizedZoneStory.RZSTrapperCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSVanCamp;
import zombie.randomizedWorld.randomizedZoneStory.RZSWasteDump;
import zombie.randomizedWorld.randomizedZoneStory.RZSWaterPump;
import zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase;
import zombie.savefile.ClientPlayerDB;
import zombie.savefile.PlayerDB;
import zombie.savefile.PlayerDBHelper;
import zombie.savefile.ServerPlayerDB;
import zombie.scripting.ScriptManager;
import zombie.spriteModel.SpriteModelManager;
import zombie.text.templating.TemplateText;
import zombie.tileDepth.TileDepthTextureManager;
import zombie.ui.TutorialManager;
import zombie.util.AddCoopPlayer;
import zombie.util.SharedStrings;
import zombie.util.StringUtils;
import zombie.util.Type;
import zombie.util.lambda.QuadConsumer;
import zombie.vehicles.BaseVehicle;
import zombie.vehicles.VehicleIDMap;
import zombie.vehicles.VehicleManager;
import zombie.vehicles.VehiclesDB2;
import zombie.viewCone.ViewConeTextureFBO;
import zombie.world.WorldDictionary;
import zombie.world.WorldDictionaryException;
import zombie.world.moddata.GlobalModData;
import zombie.worldMap.network.WorldMapClient;

public final class IsoWorld {
    private String weather = "sunny";
    public final IsoMetaGrid MetaGrid = new IsoMetaGrid();
    private final ArrayList randomizedBuildingList = new ArrayList();
    private final ArrayList randomizedZoneList = new ArrayList();
    private final ArrayList randomizedVehicleStoryList = new ArrayList();
    private final RandomizedBuildingBase RBBasic = new RBBasic();
    private final RandomizedWorldBase RandomizedWorldBase = new RandomizedWorldBase();
    private final HashMap spawnedZombieZone = new HashMap();
    private final HashMap allTiles = new HashMap();
    private final ArrayList tileImages = new ArrayList();
    private float flashIsoCursorA = 1.0f;
    private boolean flashIsoCursorInc = false;
    public SkyBox sky = null;
    private static PredicatedFileWatcher m_setAnimationRecordingTriggerWatcher;
    private static boolean m_animationRecorderActive;
    private static boolean m_animationRecorderDiscard;
    private int timeSinceLastSurvivorInHorde = 4000;
    private int m_frameNo = 0;
    public final Helicopter helicopter = new Helicopter();
    private boolean bHydroPowerOn = false;
    public final ArrayList Characters = new ArrayList();
    private final ArrayDeque freeEmitters = new ArrayDeque();
    private final ArrayList currentEmitters = new ArrayList();
    private final HashMap emitterOwners = new HashMap();
    public int x = 50;
    public int y = 50;
    public IsoCell CurrentCell;
    public static IsoWorld instance;
    public int TotalSurvivorsDead = 0;
    public int TotalSurvivorNights = 0;
    public int SurvivorSurvivalRecord = 0;
    public HashMap SurvivorDescriptors = new HashMap();
    public ArrayList AddCoopPlayers = new ArrayList();
    private static final CompScoreToPlayer compScoreToPlayer;
    public static String mapPath;
    public static boolean mapUseJar;
    private boolean bLoaded = false;
    public static final HashMap PropertyValueMap;
    private static int WorldX;
    private static int WorldY;
    private SurvivorDesc luaDesc;
    private ArrayList luatraits;
    private int luaPosX = -1;
    private int luaPosY = -1;
    private int luaPosZ = -1;
    private String spawnRegionName = "";
    public static final int WorldVersion = 223;
    public static final int WorldVersion_PreviouslyMoved = 196;
    public static final int WorldVersion_DesignationZone = 197;
    public static final int WorldVersion_PlayerExtraInfoFlags = 198;
    public static final int WorldVersion_ObjectID = 199;
    public static final int WorldVersion_CraftUpdateFoundations = 200;
    public static final int WorldVersion_AlarmDecay = 201;
    public static final int WorldVersion_FishingCheat = 202;
    public static final int WorldVersion_CharacterVoiceType = 203;
    public static final int WorldVersion_AnimalHutch = 204;
    public static final int WorldVersion_AlarmClock = 205;
    public static final int WorldVersion_VariableHeight = 206;
    public static final int WorldVersion_EnableWorldgen = 207;
    public static final int WorldVersion_CharacterVoiceOptions = 208;
    public static final int WorldVersion_ChunksWorldGeneratedBoolean = 209;
    public static final int WorldVersion_ChunksWorldModifiedBoolean = 210;
    public static final int WorldVersion_CharacterDiscomfort = 211;
    public static final int WorldVersion_HutchAndVehicleAnimalFormat = 212;
    public static final int WorldVersion_IsoCompostHealthValues = 213;
    public static final int WorldVersion_ChunksAttachmentsState = 214;
    public static final int WorldVersion_ZoneIDisUUID = 215;
    public static final int WorldVersion_SafeHouseHitPoints = 216;
    public static final int WorldVersion_FastMoveCheat = 217;
    public static final int WorldVersion_SquareSeen = 218;
    public static final int WorldVersion_TrapExplosionDuration = 219;
    public static final int WorldVersion_InventoryItemUsesInteger = 220;
    public static final int WorldVersion_ChunksAttachmentsPartial = 221;
    public static final int WorldVersion_PrintMediaRottingCorpsesBodyDamage = 222;
    public static final int WorldVersion_SafeHouseCreatedTimeAndLocation = 223;
    public static int SavedWorldVersion;
    private boolean bDrawWorld = true;
    private final ArrayList zombieWithModel = new ArrayList();
    private final ArrayList zombieWithoutModel = new ArrayList();
    private final ArrayList animalWithModel = new ArrayList();
    private final ArrayList animalWithoutModel = new ArrayList();
    private Vector2 coneTempo1 = new Vector2();
    private Vector2 coneTempo2 = new Vector2();
    private Vector2 coneTempo3 = new Vector2();
    public static boolean NoZombies;
    public static int TotalWorldVersion;
    public static int saveoffsetx;
    public static int saveoffsety;
    public boolean bDoChunkMapUpdate = true;
    private long emitterUpdateMS;
    public boolean emitterUpdate;
    private int updateSafehousePlayers = 200;
    public static CompletableFuture animationThread;
    private Rules rules;
    private WGChunk wgChunk;
    private Blending blending;
    private AttachmentsHandler attachmentsHandler;
    private ZoneGenerator zoneGenerator;
    private BiomeMap biomeMap;
    private short MaxRenderCount;

    public void setMaxRenderCount(int var1) {
        this.MaxRenderCount = (short)var1;
    }

    public int getMaxRenderCount() {
        return this.MaxRenderCount;
    }

    public IsoMetaGrid getMetaGrid() {
        return this.MetaGrid;
    }

    public Zone registerZone(String var1, String var2, int var3, int var4, int var5, int var6, int var7) {
        return this.MetaGrid.registerZone(var1, var2, var3, var4, var5, var6, var7);
    }

    @Deprecated
    public Zone registerZoneNoOverlap(String var1, String var2, int var3, int var4, int var5, int var6, int var7) {
        return this.registerZone(var1, var2, var3, var4, var5, var6, var7);
    }

    public void removeZonesForLotDirectory(String var1) {
        this.MetaGrid.removeZonesForLotDirectory(var1);
    }

    public BaseSoundEmitter getFreeEmitter() {
        Object var1 = null;
        var1 = this.freeEmitters.isEmpty() ? (Core.SoundDisabled ? new DummySoundEmitter() : new FMODSoundEmitter()) : (BaseSoundEmitter)this.freeEmitters.pop();
        this.currentEmitters.add(var1);
        return var1;
    }

    public BaseSoundEmitter getFreeEmitter(float var1, float var2, float var3) {
        BaseSoundEmitter var4 = this.getFreeEmitter();
        var4.setPos(var1, var2, var3);
        return var4;
    }

    public void takeOwnershipOfEmitter(BaseSoundEmitter var1) {
        this.currentEmitters.remove(var1);
    }

    public void setEmitterOwner(BaseSoundEmitter var1, IsoObject var2) {
        if (var1 != null && var2 != null && !this.emitterOwners.containsKey(var1)) {
            this.emitterOwners.put(var1, var2);
        }
    }

    public void returnOwnershipOfEmitter(BaseSoundEmitter var1) {
        if (var1 != null && !this.currentEmitters.contains(var1) && !this.freeEmitters.contains(var1)) {
            if (var1.isEmpty()) {
                FMODSoundEmitter var2 = (FMODSoundEmitter)Type.tryCastTo((Object)var1, FMODSoundEmitter.class);
                if (var2 != null) {
                    var2.clearParameters();
                }
                this.freeEmitters.add(var1);
            } else {
                this.currentEmitters.add(var1);
            }
        }
    }

    public Zone registerVehiclesZone(String var1, String var2, int var3, int var4, int var5, int var6, int var7, KahluaTable var8) {
        return this.MetaGrid.registerVehiclesZone(var1, var2, var3, var4, var5, var6, var7, var8);
    }

    public Zone registerMannequinZone(String var1, String var2, int var3, int var4, int var5, int var6, int var7, KahluaTable var8) {
        return this.MetaGrid.registerMannequinZone(var1, var2, var3, var4, var5, var6, var7, var8);
    }

    public void registerRoomTone(String var1, String var2, int var3, int var4, int var5, int var6, int var7, KahluaTable var8) {
        this.MetaGrid.registerRoomTone(var1, var2, var3, var4, var5, var6, var7, var8);
    }

    public void registerSpawnOrigin(int var1, int var2, int var3, int var4, KahluaTable var5) {
        ZombiePopulationManager.instance.registerSpawnOrigin(var1, var2, var3, var4, var5);
    }

    public void registerWaterFlow(float var1, float var2, float var3, float var4) {
        IsoWaterFlow.addFlow((float)var1, (float)var2, (float)var3, (float)var4);
    }

    public void registerWaterZone(float var1, float var2, float var3, float var4, float var5, float var6) {
        IsoWaterFlow.addZone((float)var1, (float)var2, (float)var3, (float)var4, (float)var5, (float)var6);
    }

    public void checkVehiclesZones() {
        this.MetaGrid.checkVehiclesZones();
    }

    public void setGameMode(String var1) {
        Core.GameMode = var1;
        Core.bLastStand = "LastStand".equals(var1);
        Core.getInstance().setChallenge(false);
        Core.ChallengeID = null;
    }

    public String getGameMode() {
        return Core.GameMode;
    }

    public void setPreset(String var1) {
        Core.Preset = var1;
    }

    public String getPreset() {
        return Core.Preset;
    }

    public void setWorld(String var1) {
        Core.GameSaveWorld = var1.trim();
    }

    public void setMap(String var1) {
        Core.GameMap = var1;
    }

    public String getMap() {
        return Core.GameMap;
    }

    public void renderTerrain() {
    }

    public int getFrameNo() {
        return this.m_frameNo;
    }

    private static void initMessaging() {
        if (m_setAnimationRecordingTriggerWatcher == null) {
            m_setAnimationRecordingTriggerWatcher = new PredicatedFileWatcher(ZomboidFileSystem.instance.getMessagingDirSub("Trigger_AnimationRecorder.xml"), TriggerSetAnimationRecorderFile.class, IsoWorld::onTrigger_setAnimationRecorderTriggerFile);
            DebugFileWatcher.instance.add(m_setAnimationRecordingTriggerWatcher);
        }
    }

    private static void onTrigger_setAnimationRecorderTriggerFile(TriggerSetAnimationRecorderFile var0) {
        m_animationRecorderActive = var0.isRecording;
        m_animationRecorderDiscard = var0.discard;
    }

    public static boolean isAnimRecorderActive() {
        return m_animationRecorderActive;
    }

    public static boolean isAnimRecorderDiscardTriggered() {
        return m_animationRecorderDiscard;
    }

    public IsoSurvivor CreateRandomSurvivor(SurvivorDesc var1, IsoGridSquare var2, IsoPlayer var3) {
        return null;
    }

    public void CreateSwarm(int var1, int var2, int var3, int var4, int var5) {
    }

    public void ForceKillAllZombies() {
        GameTime.getInstance().RemoveZombiesIndiscriminate(1000);
    }

    public static int readInt(RandomAccessFile var0) throws EOFException, IOException {
        int var4;
        int var3;
        int var2;
        int var1 = var0.read();
        if ((var1 | (var2 = var0.read()) | (var3 = var0.read()) | (var4 = var0.read())) < 0) {
            throw new EOFException();
        }
        return (var1 << 0) + (var2 << 8) + (var3 << 16) + (var4 << 24);
    }

    public static String readString(RandomAccessFile var0) throws EOFException, IOException {
        return var0.readLine();
    }

    public static int readInt(InputStream var0) throws EOFException, IOException {
        int var4;
        int var3;
        int var2;
        int var1 = var0.read();
        if ((var1 | (var2 = var0.read()) | (var3 = var0.read()) | (var4 = var0.read())) < 0) {
            throw new EOFException();
        }
        return (var1 << 0) + (var2 << 8) + (var3 << 16) + (var4 << 24);
    }

    public static String readString(InputStream var0, StringBuilder var1) throws IOException {
        var1.setLength(0);
        int var2 = -1;
        boolean var3 = false;
        block4: while (!var3) {
            var2 = var0.read();
            switch (var2) {
                case -1: 
                case 10: {
                    var3 = true;
                    continue block4;
                }
                case 13: {
                    throw new IllegalStateException("\r\n unsupported");
                }
            }
            var1.append((char)var2);
        }
        if (var2 == -1 && var1.length() == 0) {
            return null;
        }
        return var1.toString();
    }

    public void LoadTileDefinitions(IsoSpriteManager var1, String var2, int var3) {
        DebugLog.DetailedInfo.trace((Object)("tiledef: loading " + var2));
        boolean var4 = var2.endsWith(".patch.tiles");
        try (FileInputStream var5 = new FileInputStream(var2);
             BufferedInputStream var6 = new BufferedInputStream(var5);){
            int var7 = IsoWorld.readInt(var6);
            int var8 = IsoWorld.readInt(var6);
            int var9 = IsoWorld.readInt(var6);
            SharedStrings var10 = new SharedStrings();
            StringBuilder var11 = new StringBuilder();
            boolean var12 = false;
            boolean var13 = false;
            boolean var14 = Core.bDebug && Translator.getLanguage() == Translator.getDefaultLanguage();
            ArrayList<IsoSprite> var15 = new ArrayList<IsoSprite>();
            HashMap var16 = new HashMap();
            HashMap var17 = new HashMap();
            String[] var18 = new String[]{"N", "E", "S", "W"};
            for (int var19 = 0; var19 < var18.length; ++var19) {
                var17.put(var18[var19], new ArrayList());
            }
            SpriteGridParseData var59 = new SpriteGridParseData();
            HashMap var20 = new HashMap();
            int var21 = 0;
            int var22 = 0;
            int var23 = 0;
            int var24 = 0;
            HashSet<Object> var25 = new HashSet<Object>();
            int var26 = 0;
            block27: while (true) {
                int var41;
                String var282;
                if (var26 >= var9) {
                    String var10001;
                    ArrayList var60;
                    if (var13) {
                        var60 = new ArrayList(var25);
                        Collections.sort(var60);
                        for (String var282 : var60) {
                            PrintStream var99 = System.out;
                            var10001 = var282.replaceAll(" ", "_").replaceAll("-", "_").replaceAll("'", "").replaceAll("\\.", "");
                            var99.println(var10001 + " = \"" + var282 + "\",");
                        }
                    }
                    if (var14) {
                        var60 = new ArrayList(var25);
                        Collections.sort(var60);
                        StringBuilder var62 = new StringBuilder();
                        for (String var29 : var60) {
                            if (Translator.getMoveableDisplayNameOrNull((String)var29) != null) continue;
                            var10001 = var29.replaceAll(" ", "_").replaceAll("-", "_").replaceAll("'", "").replaceAll("\\.", "");
                            var62.append(var10001 + " = \"" + var29 + "\",\n");
                        }
                        var282 = var62.toString();
                        if (!var282.isEmpty() && Core.bDebug) {
                            DebugLog.Translation.debugln((Object)("Missing translations in Moveables_EN.txt:\n" + var282));
                        }
                    }
                    if (var12) {
                        try {
                            this.saveMovableStats(var20, var3, var22, var23, var24, var21);
                        }
                        catch (Exception var62) {}
                    }
                    break;
                }
                String var27 = IsoWorld.readString(var6, var11);
                var282 = var27.trim();
                IsoWorld.readString(var6, var11);
                int var30 = IsoWorld.readInt(var6);
                int var31 = IsoWorld.readInt(var6);
                int var32 = IsoWorld.readInt(var6);
                int var33 = IsoWorld.readInt(var6);
                for (int var34 = 0; var34 < var33; ++var34) {
                    IsoSprite var35;
                    if (var4) {
                        var35 = (IsoSprite)var1.NamedMap.get(var282 + "_" + var34);
                        if (var35 == null) {
                            continue;
                        }
                    } else {
                        var35 = var3 < 2 ? var1.AddSprite(var282 + "_" + var34, var3 * 100 * 1000 + 10000 + var32 * 1000 + var34) : var1.AddSprite(var282 + "_" + var34, var3 * 512 * 512 + var32 * 512 + var34);
                    }
                    if (Core.bDebug) {
                        if (this.allTiles.containsKey(var282)) {
                            if (!var4) {
                                ((ArrayList)this.allTiles.get(var282)).add(var282 + "_" + var34);
                            }
                        } else {
                            ArrayList<CallSite> var36 = new ArrayList<CallSite>();
                            var36.add((CallSite)((Object)(var282 + "_" + var34)));
                            this.allTiles.put(var282, var36);
                        }
                    }
                    var15.add(var35);
                    if (!var4) {
                        var35.setName(var282 + "_" + var34);
                        var35.tilesetName = var282;
                        var35.tileSheetIndex = var34;
                    }
                    if (var35.name.contains("damaged") || var35.name.contains("trash_")) {
                        var35.attachedFloor = true;
                        var35.getProperties().Set("attachedFloor", "true");
                    }
                    if (var35.name.startsWith("f_bushes") && var34 <= 31) {
                        var35.isBush = true;
                        var35.attachedFloor = true;
                    }
                    int var65 = IsoWorld.readInt(var6);
                    for (int var37 = 0; var37 < var65; ++var37) {
                        var27 = IsoWorld.readString(var6, var11);
                        String var38 = var27.trim();
                        var27 = IsoWorld.readString(var6, var11);
                        String var39 = var27.trim();
                        IsoObjectType var40 = IsoObjectType.FromString((String)var38);
                        if (var40 == IsoObjectType.MAX) {
                            if ((var38 = var10.get(var38)).equals("firerequirement")) {
                                var35.firerequirement = Integer.parseInt(var39);
                            } else if (var38.equals("fireRequirement")) {
                                var35.firerequirement = Integer.parseInt(var39);
                            } else if (var38.equals("BurntTile")) {
                                var35.burntTile = var39;
                            } else if (var38.equals("ForceAmbient")) {
                                var35.forceAmbient = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("solidfloor")) {
                                var35.solidfloor = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("canBeRemoved")) {
                                var35.canBeRemoved = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("attachedFloor")) {
                                var35.attachedFloor = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("cutW")) {
                                var35.cutW = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("cutN")) {
                                var35.cutN = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("solid")) {
                                var35.solid = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("solidtrans")) {
                                var35.solidTrans = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("invisible")) {
                                var35.invisible = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("alwaysDraw")) {
                                var35.alwaysDraw = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("forceRender")) {
                                var35.forceRender = true;
                                var35.getProperties().Set(var38, var39);
                            } else if ("FloorHeight".equals(var38)) {
                                if ("OneThird".equals(var39)) {
                                    var35.getProperties().Set(IsoFlagType.FloorHeightOneThird);
                                } else if ("TwoThirds".equals(var39)) {
                                    var35.getProperties().Set(IsoFlagType.FloorHeightTwoThirds);
                                }
                            } else if (var38.equals("MoveWithWind")) {
                                var35.moveWithWind = true;
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("WindType")) {
                                var35.windType = Integer.parseInt(var39);
                                var35.getProperties().Set(var38, var39);
                            } else if (var38.equals("RenderLayer")) {
                                var35.getProperties().Set(var38, var39);
                                if ("Default".equals(var39)) {
                                    var35.renderLayer = 0;
                                } else if ("Floor".equals(var39)) {
                                    var35.renderLayer = 1;
                                }
                            } else if (var38.equals("TreatAsWallOrder")) {
                                var35.treatAsWallOrder = true;
                                var35.getProperties().Set(var38, var39);
                            } else {
                                var35.getProperties().Set(var38, var39);
                                if ("WindowN".equals(var38) || "WindowW".equals(var38)) {
                                    var35.getProperties().Set(var38, var39, false);
                                }
                            }
                        } else {
                            if (var35.getType() != IsoObjectType.doorW && var35.getType() != IsoObjectType.doorN || var40 != IsoObjectType.wall) {
                                var35.setType(var40);
                            }
                            if (var40 == IsoObjectType.doorW) {
                                var35.getProperties().Set(IsoFlagType.doorW);
                            } else if (var40 == IsoObjectType.doorN) {
                                var35.getProperties().Set(IsoFlagType.doorN);
                            }
                        }
                        if (var40 == IsoObjectType.tree) {
                            if (var35.name.equals("e_riverbirch_1_1")) {
                                var39 = "1";
                            }
                            var35.getProperties().Set("tree", var39);
                            var35.getProperties().UnSet(IsoFlagType.solid);
                            var35.getProperties().Set(IsoFlagType.blocksight);
                            var41 = Integer.parseInt(var39);
                            if (var282.startsWith("vegetation_trees")) {
                                var41 = 4;
                            }
                            if (var41 < 1) {
                                var41 = 1;
                            }
                            if (var41 > 4) {
                                var41 = 4;
                            }
                            if (var41 == 1 || var41 == 2) {
                                var35.getProperties().UnSet(IsoFlagType.blocksight);
                            }
                        }
                        if (var38.equals("interior") && var39.equals("false")) {
                            var35.getProperties().Set(IsoFlagType.exterior);
                        }
                        if (var38.equals("HoppableN")) {
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.canPathN);
                            var35.getProperties().Set(IsoFlagType.transparentN);
                        }
                        if (var38.equals("HoppableW")) {
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.canPathW);
                            var35.getProperties().Set(IsoFlagType.transparentW);
                        }
                        if (var38.equals("WallN")) {
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.setType(IsoObjectType.wall);
                            var35.cutN = true;
                            var35.getProperties().Set("WallN", "", false);
                        }
                        if (var38.equals("CantClimb")) {
                            var35.getProperties().Set(IsoFlagType.CantClimb);
                        } else if (var38.equals("container")) {
                            var35.getProperties().Set(var38, var39, false);
                        } else if (var38.equals("WallNTrans")) {
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.transparentN);
                            var35.setType(IsoObjectType.wall);
                            var35.cutN = true;
                            var35.getProperties().Set("WallNTrans", "", false);
                        } else if (var38.equals("WallW")) {
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.setType(IsoObjectType.wall);
                            var35.cutW = true;
                            var35.getProperties().Set("WallW", "", false);
                        } else if (var38.equals("windowN")) {
                            var35.getProperties().Set("WindowN", "WindowN");
                            var35.getProperties().Set(IsoFlagType.transparentN);
                            var35.getProperties().Set("WindowN", "WindowN", false);
                        } else if (var38.equals("windowW")) {
                            var35.getProperties().Set("WindowW", "WindowW");
                            var35.getProperties().Set(IsoFlagType.transparentW);
                            var35.getProperties().Set("WindowW", "WindowW", false);
                        } else if (var38.equals("cutW")) {
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.cutW = true;
                        } else if (var38.equals("cutN")) {
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.cutN = true;
                        } else if (var38.equals("WallWTrans")) {
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.transparentW);
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.setType(IsoObjectType.wall);
                            var35.cutW = true;
                            var35.getProperties().Set("WallWTrans", "", false);
                        } else if (var38.equals("DoorWallN")) {
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.cutN = true;
                            var35.getProperties().Set("DoorWallN", "", false);
                        } else if (var38.equals("DoorWallNTrans")) {
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.transparentN);
                            var35.cutN = true;
                            var35.getProperties().Set("DoorWallNTrans", "", false);
                        } else if (var38.equals("DoorWallW")) {
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.cutW = true;
                            var35.getProperties().Set("DoorWallW", "", false);
                        } else if (var38.equals("DoorWallWTrans")) {
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.getProperties().Set(IsoFlagType.transparentW);
                            var35.cutW = true;
                            var35.getProperties().Set("DoorWallWTrans", "", false);
                        } else if (var38.equals("WallNW")) {
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.setType(IsoObjectType.wall);
                            var35.cutW = true;
                            var35.cutN = true;
                            var35.getProperties().Set("WallNW", "", false);
                        } else if (var38.equals("WallNWTrans")) {
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.transparentN);
                            var35.getProperties().Set(IsoFlagType.transparentW);
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.setType(IsoObjectType.wall);
                            var35.cutW = true;
                            var35.cutN = true;
                            var35.getProperties().Set("WallNWTrans", "", false);
                        } else if (var38.equals("WallSE")) {
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.getProperties().Set(IsoFlagType.WallSE);
                            var35.getProperties().Set("WallSE", "WallSE");
                            var35.cutW = true;
                        } else if (var38.equals("WindowW")) {
                            var35.getProperties().Set(IsoFlagType.canPathW);
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.getProperties().Set(IsoFlagType.transparentW);
                            var35.setType(IsoObjectType.windowFW);
                            if (var35.getProperties().Is(IsoFlagType.HoppableW)) {
                                if (Core.bDebug) {
                                    DebugLog.Moveable.println("ERROR: WindowW sprite shouldn't have HoppableW (" + var35.getName() + ")");
                                }
                                var35.getProperties().UnSet(IsoFlagType.HoppableW);
                            }
                            var35.cutW = true;
                        } else if (var38.equals("WindowN")) {
                            var35.getProperties().Set(IsoFlagType.canPathN);
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.transparentN);
                            var35.setType(IsoObjectType.windowFN);
                            if (var35.getProperties().Is(IsoFlagType.HoppableN)) {
                                if (Core.bDebug) {
                                    DebugLog.Moveable.println("ERROR: WindowN sprite shouldn't have HoppableN (" + var35.getName() + ")");
                                }
                                var35.getProperties().UnSet(IsoFlagType.HoppableN);
                            }
                            var35.cutN = true;
                        } else if (var38.equals("UnbreakableWindowW")) {
                            var35.getProperties().Set(IsoFlagType.canPathW);
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.getProperties().Set(IsoFlagType.transparentW);
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.setType(IsoObjectType.wall);
                            var35.cutW = true;
                        } else if (var38.equals("UnbreakableWindowN")) {
                            var35.getProperties().Set(IsoFlagType.canPathN);
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.transparentN);
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.setType(IsoObjectType.wall);
                            var35.cutN = true;
                        } else if (var38.equals("UnbreakableWindowNW")) {
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.transparentN);
                            var35.getProperties().Set(IsoFlagType.collideN);
                            var35.getProperties().Set(IsoFlagType.cutN);
                            var35.getProperties().Set(IsoFlagType.collideW);
                            var35.getProperties().Set(IsoFlagType.cutW);
                            var35.setType(IsoObjectType.wall);
                            var35.cutW = true;
                            var35.cutN = true;
                        } else if ("NoWallLighting".equals(var38)) {
                            var35.getProperties().Set(IsoFlagType.NoWallLighting);
                        } else if ("ForceAmbient".equals(var38)) {
                            var35.getProperties().Set(IsoFlagType.ForceAmbient);
                        }
                        if (!var38.equals("name")) continue;
                        var35.setParentObjectName(var39);
                    }
                    if (var35.getProperties().Is("lightR") || var35.getProperties().Is("lightG") || var35.getProperties().Is("lightB")) {
                        if (!var35.getProperties().Is("lightR")) {
                            var35.getProperties().Set("lightR", "0");
                        }
                        if (!var35.getProperties().Is("lightG")) {
                            var35.getProperties().Set("lightG", "0");
                        }
                        if (!var35.getProperties().Is("lightB")) {
                            var35.getProperties().Set("lightB", "0");
                        }
                    }
                    var35.getProperties().CreateKeySet();
                    if (!Core.bDebug || !var35.getProperties().Is("SmashedTileOffset") || var35.getProperties().Is("GlassRemovedOffset")) continue;
                    DebugLog.Sprite.error((Object)("Window sprite has SmashedTileOffset but no GlassRemovedOffset (" + var35.getName() + ")"));
                }
                this.setOpenDoorProperties(var282, var15);
                var16.clear();
                for (IsoSprite var35 : var15) {
                    String var67;
                    String var10000;
                    if (var35.getProperties().Is("StopCar")) {
                        var35.setType(IsoObjectType.isMoveAbleObject);
                    }
                    if (var35.getProperties().Is("IsMoveAble")) {
                        if (var35.getProperties().Is("CustomName") && !var35.getProperties().Val("CustomName").equals("")) {
                            ++var21;
                            if (var35.getProperties().Is("GroupName")) {
                                var10000 = var35.getProperties().Val("GroupName");
                                var67 = var10000 + " " + var35.getProperties().Val("CustomName");
                                if (!var16.containsKey(var67)) {
                                    var16.put((CallSite)((Object)var67), new ArrayList());
                                }
                                ((ArrayList)var16.get(var67)).add(var35);
                                var25.add(var67);
                                continue;
                            }
                            if (!var20.containsKey(var282)) {
                                var20.put(var282, new ArrayList());
                            }
                            if (!((ArrayList)var20.get(var282)).contains(var35.getProperties().Val("CustomName"))) {
                                ((ArrayList)var20.get(var282)).add(var35.getProperties().Val("CustomName"));
                            }
                            ++var22;
                            var25.add(var35.getProperties().Val("CustomName"));
                            continue;
                        }
                        DebugLog.Moveable.println("[IMPORTANT] MOVABLES: Object has no custom name defined: sheet = " + var282);
                        continue;
                    }
                    if (!var35.getProperties().Is("SpriteGridPos")) continue;
                    if (StringUtils.isNullOrWhitespace((String)var35.getProperties().Val("CustomName"))) {
                        DebugLog.Moveable.println("[IMPORTANT] MOVABLES: Object has no custom name defined: sheet = " + var282);
                        continue;
                    }
                    if (!var35.getProperties().Is("GroupName")) continue;
                    var10000 = var35.getProperties().Val("GroupName");
                    var67 = var10000 + " " + var35.getProperties().Val("CustomName");
                    if (!var16.containsKey(var67)) {
                        var16.put((CallSite)((Object)var67), new ArrayList());
                    }
                    ((ArrayList)var16.get(var67)).add(var35);
                }
                Iterator<Object> var64 = var16.entrySet().iterator();
                block33: while (true) {
                    int var48;
                    int var75;
                    int var71;
                    ArrayList var68;
                    if (!var64.hasNext()) {
                        var15.clear();
                        ++var26;
                        continue block27;
                    }
                    Map.Entry var66 = (Map.Entry)var64.next();
                    String var67 = (String)var66.getKey();
                    if (!var20.containsKey(var282)) {
                        var20.put(var282, new ArrayList());
                    }
                    if (!((ArrayList)var20.get(var282)).contains(var67)) {
                        ((ArrayList)var20.get(var282)).add(var67);
                    }
                    if ((var68 = (ArrayList)var66.getValue()).size() == 1) {
                        DebugLog.Moveable.println("MOVABLES: Object has only one face defined for group: (" + var67 + ") sheet = " + var282);
                    }
                    if (var68.size() == 3) {
                        DebugLog.Moveable.println("MOVABLES: Object only has 3 sprites, _might_ have a error in settings, group: (" + var67 + ") sheet = " + var282);
                    }
                    String[] var69 = var18;
                    int var72 = var18.length;
                    for (var71 = 0; var71 < var72; ++var71) {
                        String var77 = var69[var71];
                        ((ArrayList)var17.get(var77)).clear();
                    }
                    boolean var70 = ((IsoSprite)var68.get(0)).getProperties().Is("SpriteGridPos") && !((IsoSprite)var68.get(0)).getProperties().Val("SpriteGridPos").equals("None");
                    boolean var74 = true;
                    for (IsoSprite var79 : var68) {
                        boolean var42;
                        boolean bl = var42 = var79.getProperties().Is("SpriteGridPos") && !var79.getProperties().Val("SpriteGridPos").equals("None");
                        if (var70 != var42) {
                            var74 = false;
                            DebugLog.Moveable.println("MOVABLES: Difference in SpriteGrid settings for members of group: (" + var67 + ") sheet = " + var282);
                            break;
                        }
                        if (!var79.getProperties().Is("Facing")) {
                            var74 = false;
                        } else {
                            switch (var79.getProperties().Val("Facing")) {
                                case "N": {
                                    ((ArrayList)var17.get("N")).add(var79);
                                    break;
                                }
                                case "E": {
                                    ((ArrayList)var17.get("E")).add(var79);
                                    break;
                                }
                                case "S": {
                                    ((ArrayList)var17.get("S")).add(var79);
                                    break;
                                }
                                case "W": {
                                    ((ArrayList)var17.get("W")).add(var79);
                                    break;
                                }
                                default: {
                                    DebugLog.Moveable.println("MOVABLES: Invalid face (" + var79.getProperties().Val("Facing") + ") for group: (" + var67 + ") sheet = " + var282);
                                    var74 = false;
                                }
                            }
                        }
                        if (var74) continue;
                        DebugLog.Moveable.println("MOVABLES: Not all members have a valid face defined for group: (" + var67 + ") sheet = " + var282);
                        break;
                    }
                    if (!var74) continue;
                    if (!var70) {
                        if (var68.size() > 4) {
                            DebugLog.Moveable.println("MOVABLES: Object has too many faces defined for group: (" + var67 + ") sheet = " + var282);
                            continue;
                        }
                        String[] var76 = var18;
                        var41 = var18.length;
                        for (int var752 = 0; var752 < var41; ++var752) {
                            String var43 = var76[var752];
                            if (((ArrayList)var17.get(var43)).size() <= 1) continue;
                            DebugLog.Moveable.println("MOVABLES: " + var43 + " face defined more than once for group: (" + var67 + ") sheet = " + var282);
                            var74 = false;
                        }
                        if (!var74) continue;
                        ++var23;
                        Iterator var73 = var68.iterator();
                        block37: while (true) {
                            IsoSprite var79;
                            if (!var73.hasNext()) continue block33;
                            var79 = (IsoSprite)var73.next();
                            String[] var82 = var18;
                            int var83 = var18.length;
                            int var91 = 0;
                            while (true) {
                                if (var91 >= var83) continue block37;
                                String var87 = var82[var91];
                                ArrayList var92 = (ArrayList)var17.get(var87);
                                if (var92.size() > 0 && var92.get(0) != var79) {
                                    var79.getProperties().Set(var87 + "offset", Integer.toString(var15.indexOf(var92.get(0)) - var15.indexOf(var79)));
                                }
                                ++var91;
                            }
                            break;
                        }
                    }
                    var71 = 0;
                    IsoSpriteGrid[] var81 = new IsoSpriteGrid[var18.length];
                    for (var75 = 0; var75 < var18.length; ++var75) {
                        ArrayList var78 = (ArrayList)var17.get(var18[var75]);
                        if (var78.isEmpty()) continue;
                        if (var71 == 0) {
                            var71 = var78.size();
                        }
                        if (var71 != var78.size()) {
                            DebugLog.Moveable.println("MOVABLES: Sprite count mismatch for multi sprite movable, group: (" + var67 + ") sheet = " + var282);
                            var74 = false;
                            break;
                        }
                        var59.clear();
                        for (IsoSprite var45 : var78) {
                            String var46 = var45.getProperties().Val("SpriteGridPos");
                            String[] var47 = var46.split(",");
                            if (var47.length < 2 || var47.length > 3) {
                                DebugLog.Moveable.println("MOVABLES: SpriteGrid position error for multi sprite movable, group: (" + var67 + ") sheet = " + var282);
                                var74 = false;
                                break;
                            }
                            var48 = Integer.parseInt(var47[0]);
                            int var49 = Integer.parseInt(var47[1]);
                            int var50 = 0;
                            if (var47.length == 3) {
                                var50 = Integer.parseInt(var47[2]);
                            }
                            if (var45.getProperties().Is("SpriteGridLevel") && (var50 = Integer.parseInt(var45.getProperties().Val("SpriteGridLevel"))) < 0) {
                                DebugLog.Moveable.println("MOVABLES: invalid SpriteGirdLevel for multi sprite movable, group: (" + var67 + ") sheet = " + var282);
                                var74 = false;
                                break;
                            }
                            SpriteGridParseData.Level var51 = var59.getOrCreateLevel(var50);
                            if (var51.xyToSprite.containsKey(var46)) {
                                DebugLog.Moveable.println("MOVABLES: double SpriteGrid position (" + var46 + ") for multi sprite movable, group: (" + var67 + ") sheet = " + var282);
                                var74 = false;
                                break;
                            }
                            var51.xyToSprite.put(var46, var45);
                            var51.width = PZMath.max((int)var51.width, (int)(var48 + 1));
                            var51.height = PZMath.max((int)var51.height, (int)(var49 + 1));
                            var59.width = PZMath.max((int)var59.width, (int)var51.width);
                            var59.height = PZMath.max((int)var59.height, (int)var51.height);
                        }
                        if (!var74) break;
                        if (!var59.isValid()) {
                            DebugLog.Moveable.println("MOVABLES: SpriteGrid dimensions error for multi sprite movable, group: (" + var67 + ") sheet = " + var282);
                            var74 = false;
                            break;
                        }
                        var81[var75] = new IsoSpriteGrid(var59.width, var59.height, var59.levels.size());
                        for (SpriteGridParseData.Level var84 : var59.levels) {
                            for (Map.Entry var93 : var84.xyToSprite.entrySet()) {
                                String var95 = (String)var93.getKey();
                                IsoSprite var96 = (IsoSprite)var93.getValue();
                                String[] var97 = var95.split(",");
                                int var98 = Integer.parseInt(var97[0]);
                                int var52 = Integer.parseInt(var97[1]);
                                var81[var75].setSprite(var98, var52, var84.z, var96);
                            }
                        }
                        if (var81[var75].validate()) continue;
                        DebugLog.Moveable.println("MOVABLES: SpriteGrid didn't validate for multi sprite movable, group: (" + var67 + ") sheet = " + var282);
                        var74 = false;
                        break;
                    }
                    if (var74 && var71 != 0) {
                        ++var24;
                        var75 = 0;
                        while (true) {
                            if (var75 >= var18.length) continue block33;
                            IsoSpriteGrid var80 = var81[var75];
                            if (var80 != null) {
                                for (IsoSprite var94 : var80.getSprites()) {
                                    if (var94 == null) continue;
                                    var94.setSpriteGrid(var80);
                                    for (var48 = 0; var48 < var18.length; ++var48) {
                                        if (var48 == var75 || var81[var48] == null) continue;
                                        IsoSprite var96 = var81[var48].getAnchorSprite();
                                        var94.getProperties().Set(var18[var48] + "offset", Integer.toString(var96.tileSheetIndex - var94.tileSheetIndex));
                                    }
                                }
                            }
                            ++var75;
                        }
                    }
                    DebugLog.Moveable.println("MOVABLES: Error in multi sprite movable, group: (" + var67 + ") sheet = " + var282);
                }
                break;
            }
        }
        catch (Exception var58) {
            ExceptionLogger.logException((Throwable)var58);
        }
    }

    private void GenerateTilePropertyLookupTables() {
        TilePropertyAliasMap.instance.Generate(PropertyValueMap);
        PropertyValueMap.clear();
    }

    public void LoadTileDefinitionsPropertyStrings(IsoSpriteManager var1, String var2, int var3) {
        DebugLog.DetailedInfo.trace((Object)("tiledef: loading " + var2));
        if (!GameServer.bServer) {
            Thread.yield();
            Core.getInstance().DoFrameReady();
        }
        try (FileInputStream var4 = new FileInputStream(var2);
             BufferedInputStream var5 = new BufferedInputStream(var4);){
            int var6 = IsoWorld.readInt(var5);
            int var7 = IsoWorld.readInt(var5);
            int var8 = IsoWorld.readInt(var5);
            SharedStrings var9 = new SharedStrings();
            StringBuilder var10 = new StringBuilder();
            for (int var11 = 0; var11 < var8; ++var11) {
                String var12 = IsoWorld.readString(var5, var10);
                String var13 = var12.trim();
                String var14 = IsoWorld.readString(var5, var10);
                this.tileImages.add(var14);
                int var15 = IsoWorld.readInt(var5);
                int var16 = IsoWorld.readInt(var5);
                int var17 = IsoWorld.readInt(var5);
                int var18 = IsoWorld.readInt(var5);
                for (int var19 = 0; var19 < var18; ++var19) {
                    int var20 = IsoWorld.readInt(var5);
                    for (int var21 = 0; var21 < var20; ++var21) {
                        var12 = IsoWorld.readString(var5, var10);
                        String var22 = var12.trim();
                        var12 = IsoWorld.readString(var5, var10);
                        String var23 = var12.trim();
                        IsoObjectType var24 = IsoObjectType.FromString((String)var22);
                        var22 = var9.get(var22);
                        ArrayList var25 = null;
                        if (PropertyValueMap.containsKey(var22)) {
                            var25 = (ArrayList)PropertyValueMap.get(var22);
                        } else {
                            var25 = new ArrayList();
                            PropertyValueMap.put(var22, var25);
                        }
                        if (var25.contains(var23)) continue;
                        var25.add(var23);
                    }
                }
            }
        }
        catch (Exception var30) {
            Logger.getLogger(GameWindow.class.getName()).log(Level.SEVERE, (String)null, var30);
        }
    }

    private void SetCustomPropertyValues() {
        String var3;
        int var2;
        ((ArrayList)PropertyValueMap.get("WindowN")).add("WindowN");
        ((ArrayList)PropertyValueMap.get("WindowW")).add("WindowW");
        ((ArrayList)PropertyValueMap.get("DoorWallN")).add("DoorWallN");
        ((ArrayList)PropertyValueMap.get("DoorWallW")).add("DoorWallW");
        ((ArrayList)PropertyValueMap.get("WallSE")).add("WallSE");
        ArrayList<String> var1 = new ArrayList<String>();
        for (var2 = -96; var2 <= 96; ++var2) {
            var3 = Integer.toString(var2);
            var1.add(var3);
        }
        PropertyValueMap.put("Noffset", var1);
        PropertyValueMap.put("Soffset", var1);
        PropertyValueMap.put("Woffset", var1);
        PropertyValueMap.put("Eoffset", var1);
        ((ArrayList)PropertyValueMap.get("tree")).add("5");
        ((ArrayList)PropertyValueMap.get("tree")).add("6");
        ((ArrayList)PropertyValueMap.get("lightR")).add("0");
        ((ArrayList)PropertyValueMap.get("lightG")).add("0");
        ((ArrayList)PropertyValueMap.get("lightB")).add("0");
        for (var2 = 0; var2 <= 96; ++var2) {
            var3 = String.valueOf(var2);
            ArrayList var4 = (ArrayList)PropertyValueMap.get("ItemHeight");
            if (!var4.contains(var3)) {
                var4.add(var3);
            }
            if ((var4 = (ArrayList)PropertyValueMap.get("Surface")).contains(var3)) continue;
            var4.add(var3);
        }
    }

    private void setOpenDoorProperties(String var1, ArrayList var2) {
        for (int var3 = 0; var3 < var2.size(); ++var3) {
            IsoSprite var4 = (IsoSprite)var2.get(var3);
            if (var4.getType() != IsoObjectType.doorN && var4.getType() != IsoObjectType.doorW || var4.getProperties().Is(IsoFlagType.open)) continue;
            String var5 = var4.getProperties().Val("DoubleDoor");
            if (var5 != null) {
                int var6 = PZMath.tryParseInt((String)var5, (int)-1);
                if (var6 < 5) continue;
                var4.getProperties().Set(IsoFlagType.open);
                continue;
            }
            String var8 = var4.getProperties().Val("GarageDoor");
            if (var8 != null) {
                int var7 = PZMath.tryParseInt((String)var8, (int)-1);
                if (var7 < 4) continue;
                var4.getProperties().Set(IsoFlagType.open);
                continue;
            }
            IsoSprite var9 = (IsoSprite)IsoSpriteManager.instance.NamedMap.get(var1 + "_" + (var4.tileSheetIndex + 2));
            if (var9 == null) continue;
            var9.setType(var4.getType());
            var9.getProperties().Set(var4.getType() == IsoObjectType.doorN ? IsoFlagType.doorN : IsoFlagType.doorW);
            var9.getProperties().Set(IsoFlagType.open);
        }
    }

    private void saveMovableStats(Map var1, int var2, int var3, int var4, int var5, int var6) throws FileNotFoundException, IOException {
        File var7 = new File(ZomboidFileSystem.instance.getCacheDir());
        if (var7.exists() && var7.isDirectory()) {
            String var10002 = ZomboidFileSystem.instance.getCacheDir();
            File var8 = new File(var10002 + File.separator + "movables_stats_" + var2 + ".txt");
            try (FileWriter var9 = new FileWriter(var8, false);){
                var9.write("### Movable objects ###" + System.lineSeparator());
                var9.write("Single Face: " + var3 + System.lineSeparator());
                var9.write("Multi Face: " + var4 + System.lineSeparator());
                var9.write("Multi Face & Multi Sprite: " + var5 + System.lineSeparator());
                var9.write("Total objects : " + (var3 + var4 + var5) + System.lineSeparator());
                var9.write(" " + System.lineSeparator());
                var9.write("Total sprites : " + var6 + System.lineSeparator());
                var9.write(" " + System.lineSeparator());
                for (Map.Entry var11 : var1.entrySet()) {
                    String var10001 = (String)var11.getKey();
                    var9.write(var10001 + System.lineSeparator());
                    for (String var13 : (ArrayList)var11.getValue()) {
                        var9.write("\t" + var13 + System.lineSeparator());
                    }
                }
            }
            catch (Exception var16) {
                ExceptionLogger.logException((Throwable)var16);
            }
        }
    }

    private void addJumboTreeTileset(IsoSpriteManager var1, int var2, String var3, int var4, int var5, int var6) {
        int var7 = 2;
        for (int var8 = 0; var8 < var5; ++var8) {
            for (int var9 = 0; var9 < var7; ++var9) {
                String var10 = "e_" + var3 + "JUMBO_1";
                int var11 = var8 * var7 + var9;
                IsoSprite var12 = var1.AddSprite(var10 + "_" + var11, var2 * 512 * 512 + var4 * 512 + var11);
                assert (GameServer.bServer || !var12.hasNoTextures());
                var12.setName(var10 + "_" + var11);
                var12.setType(IsoObjectType.tree);
                var12.getProperties().Set("tree", var9 == 0 ? "5" : "6");
                var12.getProperties().UnSet(IsoFlagType.solid);
                var12.getProperties().Set(IsoFlagType.blocksight);
                var12.getProperties().CreateKeySet();
                var12.moveWithWind = true;
                var12.windType = var6;
            }
        }
    }

    private void JumboTreeDefinitions(IsoSpriteManager var1, int var2) {
        this.addJumboTreeTileset(var1, var2, "americanholly", 1, 2, 3);
        this.addJumboTreeTileset(var1, var2, "americanlinden", 2, 6, 2);
        this.addJumboTreeTileset(var1, var2, "canadianhemlock", 3, 2, 3);
        this.addJumboTreeTileset(var1, var2, "carolinasilverbell", 4, 6, 1);
        this.addJumboTreeTileset(var1, var2, "cockspurhawthorn", 5, 6, 2);
        this.addJumboTreeTileset(var1, var2, "dogwood", 6, 6, 2);
        this.addJumboTreeTileset(var1, var2, "easternredbud", 7, 6, 2);
        this.addJumboTreeTileset(var1, var2, "redmaple", 8, 6, 2);
        this.addJumboTreeTileset(var1, var2, "riverbirch", 9, 6, 1);
        this.addJumboTreeTileset(var1, var2, "virginiapine", 10, 2, 1);
        this.addJumboTreeTileset(var1, var2, "yellowwood", 11, 6, 2);
        int var3 = 12;
        byte var4 = 0;
        IsoSprite var5 = var1.AddSprite("jumbo_tree_01_" + var4, var2 * 512 * 512 + var3 * 512 + var4);
        var5.setName("jumbo_tree_01_" + var4);
        var5.setType(IsoObjectType.tree);
        var5.getProperties().Set("tree", "4");
        var5.getProperties().UnSet(IsoFlagType.solid);
        var5.getProperties().Set(IsoFlagType.blocksight);
    }

    private void loadedTileDefinitions() {
        CellLoader.glassRemovedWindowSpriteMap.clear();
        CellLoader.smashedWindowSpriteMap.clear();
        for (IsoSprite var2 : IsoSpriteManager.instance.NamedMap.values()) {
            IsoSprite var7;
            PropertyContainer var3 = var2.getProperties();
            if (var3.Is(IsoFlagType.windowW) || var3.Is(IsoFlagType.windowN)) {
                IsoSprite var6;
                int var5;
                String var4 = var3.Val("GlassRemovedOffset");
                if (var4 != null && (var5 = PZMath.tryParseInt((String)var4, (int)0)) != 0 && (var6 = IsoSprite.getSprite((IsoSpriteManager)IsoSpriteManager.instance, (IsoSprite)var2, (int)var5)) != null) {
                    CellLoader.glassRemovedWindowSpriteMap.put(var6, var2);
                }
                if ((var4 = var3.Val("SmashedTileOffset")) != null && (var5 = PZMath.tryParseInt((String)var4, (int)0)) != 0 && (var6 = IsoSprite.getSprite((IsoSpriteManager)IsoSpriteManager.instance, (IsoSprite)var2, (int)var5)) != null) {
                    CellLoader.smashedWindowSpriteMap.put(var6, var2);
                }
            }
            if (var2.name != null && var2.name.startsWith("fixtures_railings_01")) {
                var2.getProperties().Set(IsoFlagType.NeverCutaway);
            }
            if ((var7 = (IsoSprite)IsoSpriteManager.instance.NamedMap.get(var2.tilesetName + "_on_" + var2.tileSheetIndex)) != null && !var7.hasNoTextures()) {
                var2.getProperties().Set(IsoFlagType.HasLightOnSprite);
                continue;
            }
            var2.getProperties().UnSet(IsoFlagType.HasLightOnSprite);
        }
        SpriteModelManager.getInstance().loadedTileDefinitions();
        TileDepthTextureManager.getInstance().loadedTileDefinitions();
    }

    /*
     * WARNING - Removed try catching itself - possible behaviour change.
     */
    public boolean LoadPlayerForInfo() throws FileNotFoundException, IOException {
        if (GameClient.bClient) {
            return ClientPlayerDB.getInstance().loadNetworkPlayerInfo(1);
        }
        File var1 = ZomboidFileSystem.instance.getFileInCurrentSave("map_p.bin");
        if (!var1.exists()) {
            PlayerDB.getInstance().importPlayersFromVehiclesDB();
            return PlayerDB.getInstance().loadLocalPlayerInfo(1);
        }
        FileInputStream var2 = new FileInputStream(var1);
        BufferedInputStream var3 = new BufferedInputStream(var2);
        Object object = SliceY.SliceBufferLock;
        synchronized (object) {
            SliceY.SliceBuffer.clear();
            int var5 = var3.read(SliceY.SliceBuffer.array());
            SliceY.SliceBuffer.limit(var5);
            var3.close();
            byte var6 = SliceY.SliceBuffer.get();
            byte var7 = SliceY.SliceBuffer.get();
            byte var8 = SliceY.SliceBuffer.get();
            byte var9 = SliceY.SliceBuffer.get();
            boolean var10 = true;
            if (var6 == 80 && var7 == 76 && var8 == 89 && var9 == 82) {
                int n = SliceY.SliceBuffer.getInt();
            } else {
                SliceY.SliceBuffer.rewind();
            }
            String var11 = GameWindow.ReadString((ByteBuffer)SliceY.SliceBuffer);
            if (GameClient.bClient && !IsoPlayer.isServerPlayerIDValid((String)var11)) {
                GameLoadingState.GameLoadingString = Translator.getText((String)"IGUI_MP_ServerPlayerIDMismatch");
                GameLoadingState.playerWrongIP = true;
                return false;
            }
            WorldX = SliceY.SliceBuffer.getInt();
            WorldY = SliceY.SliceBuffer.getInt();
            IsoChunkMap.WorldXA = SliceY.SliceBuffer.getInt();
            IsoChunkMap.WorldYA = SliceY.SliceBuffer.getInt();
            IsoChunkMap.WorldZA = SliceY.SliceBuffer.getInt();
            IsoChunkMap.WorldXA += IsoCell.CellSizeInSquares * saveoffsetx;
            IsoChunkMap.WorldYA += IsoCell.CellSizeInSquares * saveoffsety;
            IsoChunkMap.SWorldX[0] = WorldX;
            IsoChunkMap.SWorldY[0] = WorldY;
            int[] var10000 = IsoChunkMap.SWorldX;
            var10000[0] = var10000[0] + IsoCell.CellSizeInChunks * saveoffsetx;
            var10000 = IsoChunkMap.SWorldY;
            var10000[0] = var10000[0] + IsoCell.CellSizeInChunks * saveoffsety;
            return true;
        }
    }

    /*
     * WARNING - Removed try catching itself - possible behaviour change.
     * Unable to fully structure code
     */
    public void init() throws FileNotFoundException, IOException, WorldDictionaryException {
        if (!Core.bTutorial) {
            this.randomizedBuildingList.add(new RBSafehouse());
            this.randomizedBuildingList.add(new RBBurnt());
            this.randomizedBuildingList.add(new RBOther());
            this.randomizedBuildingList.add(new RBLooted());
            this.randomizedBuildingList.add(new RBBurntFireman());
            this.randomizedBuildingList.add(new RBBurntCorpse());
            this.randomizedBuildingList.add(new RBShopLooted());
            this.randomizedBuildingList.add(new RBKateAndBaldspot());
            this.randomizedBuildingList.add(new RBStripclub());
            this.randomizedBuildingList.add(new RBSchool());
            this.randomizedBuildingList.add(new RBSpiffo());
            this.randomizedBuildingList.add(new RBPizzaWhirled());
            this.randomizedBuildingList.add(new RBPileOCrepe());
            this.randomizedBuildingList.add(new RBCafe());
            this.randomizedBuildingList.add(new RBBar());
            this.randomizedBuildingList.add(new RBOffice());
            this.randomizedBuildingList.add(new RBHairSalon());
            this.randomizedBuildingList.add(new RBClinic());
            this.randomizedBuildingList.add(new RBGunstoreSiege());
            this.randomizedBuildingList.add(new RBPoliceSiege());
            this.randomizedBuildingList.add(new RBHeatBreakAfternoon());
            this.randomizedBuildingList.add(new RBTrashed());
            this.randomizedBuildingList.add(new RBBarn());
            this.randomizedBuildingList.add(new RBDorm());
            this.randomizedBuildingList.add(new RBNolans());
            this.randomizedBuildingList.add(new RBJackieJaye());
            this.randomizedBuildingList.add(new RBJoanHartford());
            this.randomizedBuildingList.add(new RBMayorWestPoint());
            this.randomizedBuildingList.add(new RBTwiggy());
            this.randomizedBuildingList.add(new RBWoodcraft());
            this.randomizedVehicleStoryList.add(new RVSUtilityVehicle());
            this.randomizedVehicleStoryList.add(new RVSConstructionSite());
            this.randomizedVehicleStoryList.add(new RVSBurntCar());
            this.randomizedVehicleStoryList.add(new RVSPoliceBlockadeShooting());
            this.randomizedVehicleStoryList.add(new RVSPoliceBlockade());
            this.randomizedVehicleStoryList.add(new RVSCarCrash());
            this.randomizedVehicleStoryList.add(new RVSAmbulanceCrash());
            this.randomizedVehicleStoryList.add(new RVSCarCrashCorpse());
            this.randomizedVehicleStoryList.add(new RVSChangingTire());
            this.randomizedVehicleStoryList.add(new RVSFlippedCrash());
            this.randomizedVehicleStoryList.add(new RVSBanditRoad());
            this.randomizedVehicleStoryList.add(new RVSTrailerCrash());
            this.randomizedVehicleStoryList.add(new RVSCrashHorde());
            this.randomizedVehicleStoryList.add(new RVSCarCrashDeer());
            this.randomizedVehicleStoryList.add(new RVSDeadEnd());
            this.randomizedVehicleStoryList.add(new RVSRegionalProfessionVehicle());
            this.randomizedVehicleStoryList.add(new RVSRoadKill());
            this.randomizedVehicleStoryList.add(new RVSRoadKillSmall());
            this.randomizedVehicleStoryList.add(new RVSAnimalOnRoad());
            this.randomizedVehicleStoryList.add(new RVSHerdOnRoad());
            this.randomizedVehicleStoryList.add(new RVSAnimalTrailerOnRoad());
            this.randomizedVehicleStoryList.add(new RVSRichJerk());
            this.randomizedVehicleStoryList.add(new RVSPlonkies());
            this.randomizedZoneList.add(new RZSAttachedAnimal());
            this.randomizedZoneList.add(new RZSBBQParty());
            this.randomizedZoneList.add(new RZSBaseball());
            this.randomizedZoneList.add(new RZSBeachParty());
            this.randomizedZoneList.add(new RZSBurntWreck());
            this.randomizedZoneList.add(new RZSBuryingCamp());
            this.randomizedZoneList.add(new RZSCampsite());
            this.randomizedZoneList.add(new RZSCharcoalBurner());
            this.randomizedZoneList.add(new RZSDean());
            this.randomizedZoneList.add(new RZSDuke());
            this.randomizedZoneList.add(new RZSEscapedAnimal());
            this.randomizedZoneList.add(new RZSEscapedHerd());
            this.randomizedZoneList.add(new RZSFishingTrip());
            this.randomizedZoneList.add(new RZSForestCamp());
            this.randomizedZoneList.add(new RZSForestCampEaten());
            this.randomizedZoneList.add(new RZSFrankHemingway());
            this.randomizedZoneList.add(new RZSHermitCamp());
            this.randomizedZoneList.add(new RZSHillbillyHoedown());
            this.randomizedZoneList.add(new RZSHogWild());
            this.randomizedZoneList.add(new RZSHunterCamp());
            this.randomizedZoneList.add(new RZJackieJaye());
            this.randomizedZoneList.add(new RZSKirstyKormick());
            this.randomizedZoneList.add(new RZSMurderScene());
            this.randomizedZoneList.add(new RZSMusicFest());
            this.randomizedZoneList.add(new RZSMusicFestStage());
            this.randomizedZoneList.add(new RZSNastyMattress());
            this.randomizedZoneList.add(new RZSOccultActivity());
            this.randomizedZoneList.add(new RZSOldFirepit());
            this.randomizedZoneList.add(new RZSOldShelter());
            this.randomizedZoneList.add(new RZSOrphanedFawn());
            this.randomizedZoneList.add(new RZSRangerSmith());
            this.randomizedZoneList.add(new RZSRockerParty());
            this.randomizedZoneList.add(new RZSSadCamp());
            this.randomizedZoneList.add(new RZSSexyTime());
            this.randomizedZoneList.add(new RZSSirTwiggy());
            this.randomizedZoneList.add(new RZSSurvivalistCamp());
            this.randomizedZoneList.add(new RZSTragicPicnic());
            this.randomizedZoneList.add(new RZSTrapperCamp());
            this.randomizedZoneList.add(new RZSVanCamp());
            this.randomizedZoneList.add(new RZSWasteDump());
            this.randomizedZoneList.add(new RZSWaterPump());
        }
        zombie.randomizedWorld.randomizedBuilding.RBBasic.getUniqueRDSSpawned().clear();
        BodyDamageSync.instance = GameClient.bClient == false && GameServer.bServer == false ? null : new BodyDamageSync();
        if (GameServer.bServer) {
            Core.GameSaveWorld = GameServer.ServerName;
            var1 = ZomboidFileSystem.instance.getCurrentSaveDir();
            var2 = new File(var1);
            if (!var2.exists()) {
                GameServer.ResetID = Rand.Next((int)10000000);
                ServerOptions.instance.putSaveOption("ResetID", String.valueOf(GameServer.ResetID));
            }
            LuaManager.GlobalObject.createWorld((String)Core.GameSaveWorld);
        }
        IsoWorld.SavedWorldVersion = this.readWorldVersion();
        if (!GameServer.bServer) {
            var43 = ZomboidFileSystem.instance.getFileInCurrentSave("map_ver.bin");
            try {
                var44 = new FileInputStream(var43);
                try {
                    var3 = new DataInputStream(var44);
                    try {
                        var4 = var3.readInt();
                        var5 = GameWindow.ReadString((DataInputStream)var3);
                        if (!GameClient.bClient) {
                            Core.GameMap = var5;
                        }
                        this.setDifficulty(GameWindow.ReadString((DataInputStream)var3));
                    }
                    finally {
                        var3.close();
                    }
                }
                finally {
                    var44.close();
                }
            }
            catch (FileNotFoundException var41) {
                // empty catch block
            }
        }
        if (!GameClient.bClient) {
            var43 = ZomboidFileSystem.instance.getFileInCurrentSave("id_manager_data.bin");
            try {
                var44 = new FileInputStream(var43);
                try {
                    var3 = new DataInputStream(var44);
                    try {
                        var4 = var3.readInt();
                        ObjectIDManager.getInstance().load(var3, var4);
                    }
                    finally {
                        var3.close();
                    }
                }
                finally {
                    var44.close();
                }
            }
            catch (FileNotFoundException var33) {
                // empty catch block
            }
        }
        if (!GameClient.bClient) {
            var43 = ZomboidFileSystem.instance.getFileInCurrentSave("important_area_data.bin");
            try {
                var44 = new FileInputStream(var43);
                try {
                    var48 = new BufferedInputStream(var44);
                    try {
                        var8_28 = SliceY.SliceBufferLock;
                        synchronized (var8_28) {
                            SliceY.SliceBuffer.clear();
                            var52 = var48.read(SliceY.SliceBuffer.array());
                            SliceY.SliceBuffer.limit(var52);
                            var48.close();
                            var6 = SliceY.SliceBuffer.getInt();
                            ImportantAreaManager.getInstance().load(SliceY.SliceBuffer, var6);
                        }
                    }
                    finally {
                        var48.close();
                    }
                }
                finally {
                    var44.close();
                }
            }
            catch (FileNotFoundException var28) {
                // empty catch block
            }
        }
        if (WGParams.instance.load() == WGParams.Result.NOT_PRESENT && GameServer.bServer) {
            WGParams.instance.setSeedString(ServerOptions.instance.Seed.getValue());
            WGParams.instance.setMinXCell(-250);
            WGParams.instance.setMaxXCell(250);
            WGParams.instance.setMinYCell(-250);
            WGParams.instance.setMaxYCell(250);
        }
        if (!GameServer.bServer || !GameServer.bSoftReset) {
            this.MetaGrid.CreateStep1();
        }
        LuaEventManager.triggerEvent((String)"OnPreDistributionMerge");
        LuaEventManager.triggerEvent((String)"OnDistributionMerge");
        LuaEventManager.triggerEvent((String)"OnPostDistributionMerge");
        DebugLog.General.println("VehiclesDB2.init() start");
        VehiclesDB2.instance.init();
        DebugLog.General.println("VehiclesDB2.init() end");
        DebugLog.General.println("triggerEvent OnInitWorld");
        LuaEventManager.triggerEvent((String)"OnInitWorld");
        if (!GameClient.bClient) {
            DebugLog.General.println("SandboxOptions.load() start");
            SandboxOptions.instance.load();
            DebugLog.General.println("SandboxOptions.load() end");
        }
        DebugLog.General.println("ItemPickerJava.Parse() start");
        ItemPickerJava.Parse();
        DebugLog.General.println("ItemPickerJava.Parse() end");
        this.bHydroPowerOn = (float)(GameTime.getInstance().getWorldAgeHours() / 24.0 + (double)((SandboxOptions.instance.TimeSinceApo.getValue() - 1) * 30)) < (float)SandboxOptions.getInstance().getElecShutModifier();
        ZomboidGlobals.toLua();
        ItemPickerJava.InitSandboxLootSettings();
        this.SurvivorDescriptors.clear();
        IsoSpriteManager.instance.Dispose();
        if (GameClient.bClient && ServerOptions.instance.DoLuaChecksum.getValue()) {
            DebugLog.General.println("client: DoLuaChecksum start");
            try {
                NetChecksum.comparer.beginCompare();
                GameLoadingState.GameLoadingString = Translator.getText((String)"IGUI_MP_Checksum");
                var49 = var45 = System.currentTimeMillis();
                while (!GameClient.checksumValid) {
                    if (GameWindow.bServerDisconnected) {
                        return;
                    }
                    if (System.currentTimeMillis() > var45 + 8000L) {
                        DebugLog.Moveable.println("checksum: timed out waiting for the server to respond");
                        GameClient.connection.forceDisconnect("world-timeout-response");
                        GameWindow.bServerDisconnected = true;
                        GameWindow.kickReason = Translator.getText((String)"UI_GameLoad_TimedOut");
                        return;
                    }
                    if (System.currentTimeMillis() > var49 + 1000L) {
                        DebugLog.Moveable.println("checksum: waited one second");
                        var49 += 1000L;
                    }
                    NetChecksum.comparer.update();
                    if (!GameClient.checksumValid) {
                        Thread.sleep(100L);
                        continue;
                    }
                    break;
                }
            }
            catch (Exception var39) {
                ExceptionLogger.logException((Throwable)var39);
            }
            DebugLog.General.println("client: DoLuaChecksum end");
        }
        GameLoadingState.GameLoadingString = Translator.getText((String)"IGUI_MP_LoadTileDef");
        var46 = IsoSpriteManager.instance;
        this.tileImages.clear();
        DebugLog.General.println("LoadTileDefinitions start");
        var47 = ZomboidFileSystem.instance;
        this.LoadTileDefinitionsPropertyStrings(var46, var47.getMediaPath("tiledefinitions.tiles"), 0);
        this.LoadTileDefinitionsPropertyStrings(var46, var47.getMediaPath("newtiledefinitions.tiles"), 1);
        this.LoadTileDefinitionsPropertyStrings(var46, var47.getMediaPath("tiledefinitions_erosion.tiles"), 2);
        this.LoadTileDefinitionsPropertyStrings(var46, var47.getMediaPath("tiledefinitions_apcom.tiles"), 3);
        this.LoadTileDefinitionsPropertyStrings(var46, var47.getMediaPath("tiledefinitions_overlays.tiles"), 4);
        this.LoadTileDefinitionsPropertyStrings(var46, var47.getMediaPath("tiledefinitions_b42chunkcaching.tiles"), 5);
        this.LoadTileDefinitionsPropertyStrings(var46, var47.getMediaPath("tiledefinitions_noiseworks.patch.tiles"), -1);
        ZomboidFileSystem.instance.loadModTileDefPropertyStrings();
        this.SetCustomPropertyValues();
        this.GenerateTilePropertyLookupTables();
        this.LoadTileDefinitions(var46, var47.getMediaPath("tiledefinitions.tiles"), 0);
        this.LoadTileDefinitions(var46, var47.getMediaPath("newtiledefinitions.tiles"), 1);
        this.LoadTileDefinitions(var46, var47.getMediaPath("tiledefinitions_erosion.tiles"), 2);
        this.LoadTileDefinitions(var46, var47.getMediaPath("tiledefinitions_apcom.tiles"), 3);
        this.LoadTileDefinitions(var46, var47.getMediaPath("tiledefinitions_overlays.tiles"), 4);
        this.LoadTileDefinitions(var46, var47.getMediaPath("tiledefinitions_b42chunkcaching.tiles"), 5);
        this.LoadTileDefinitions(var46, var47.getMediaPath("tiledefinitions_noiseworks.patch.tiles"), -1);
        this.JumboTreeDefinitions(var46, 6);
        ZomboidFileSystem.instance.loadModTileDefs();
        GameLoadingState.GameLoadingString = "";
        DebugLog.General.println("LoadTileDefinitions end");
        var46.AddSprite("media/ui/missing-tile.png");
        ScriptManager.instance.PostTileDefinitions();
        DebugLog.General.println("triggerEvent OnLoadedTileDefinitions");
        LuaEventManager.triggerEvent((String)"OnLoadedTileDefinitions", (Object)var46);
        this.loadedTileDefinitions();
        AnimalDefinitions.getAnimalDefs();
        if (GameServer.bServer && GameServer.bSoftReset) {
            IsoRegions.init();
            WorldConverter.instance.softreset();
        }
        try {
            WeatherFxMask.init();
        }
        catch (Exception var23) {
            ExceptionLogger.logException((Throwable)var23);
        }
        TemplateText.Initialize();
        IsoRegions.init();
        ObjectRenderEffects.init();
        WorldConverter.instance.convert(Core.GameSaveWorld, var46);
        if (!GameLoadingState.worldVersionError) {
            SandboxOptions.instance.handleOldZombiesFile2();
            DebugLog.General.println("GameTime.init() and load() start");
            GameTime.getInstance().init();
            GameTime.getInstance().load();
            DebugLog.General.println("GameTime.init() and load() end");
            ImprovedFog.init();
            DebugLog.General.println("ZomboidRadio.Init() start");
            ZomboidRadio.getInstance().Init(IsoWorld.SavedWorldVersion);
            DebugLog.General.println("ZomboidRadio.Init() end");
            DebugLog.General.println("GlobalModData.init() start");
            GlobalModData.instance.init();
            DebugLog.General.println("GlobalModData.init() end");
            DebugLog.General.println("InstanceTracker.load() start");
            InstanceTracker.load();
            DebugLog.General.println("InstanceTracker.load() end");
            if (GameServer.bServer && Core.getInstance().getPoisonousBerry() == null) {
                Core.getInstance().initPoisonousBerry();
            }
            if (GameServer.bServer && Core.getInstance().getPoisonousMushroom() == null) {
                Core.getInstance().initPoisonousMushroom();
            }
            DebugLog.General.println("ErosionGlobals.Boot() start");
            ErosionGlobals.Boot((IsoSpriteManager)var46);
            DebugLog.General.println("ErosionGlobals.Boot() end");
            DebugLog.General.println("WorldDictionary.init() start");
            WorldDictionary.init();
            ScriptManager.instance.PostWorldDictionaryInit();
            DebugLog.General.println("WorldDictionary.init() end");
            FishSchoolManager.getInstance().init();
            WorldMarkers.instance.init();
            DebugLog.General.println("GameEntityManager.Init() start");
            GameEntityManager.Init((int)IsoWorld.SavedWorldVersion);
            DebugLog.General.println("GameEntityManager.Init() end");
            if (GameServer.bServer) {
                SharedDescriptors.initSharedDescriptors();
            }
            DebugLog.General.println("PersistentOutfits.init() start");
            PersistentOutfits.instance.init();
            DebugLog.General.println("PersistentOutfits.init() end");
            VirtualZombieManager.instance.init();
            VehicleIDMap.instance.Reset();
            VehicleManager.instance = new VehicleManager();
            GameLoadingState.GameLoadingString = Translator.getText((String)"IGUI_MP_InitMap");
            this.MetaGrid.CreateStep2();
            ClimateManager.getInstance().init(this.MetaGrid);
            SafeHouse.init();
            if (!GameClient.bClient) {
                StashSystem.init();
            }
            Basements.getInstance().beforeOnLoadMapZones();
            LuaEventManager.triggerEvent((String)"OnLoadMapZones");
            Basements.getInstance().beforeLoadMetaGrid();
            this.MetaGrid.load();
            Basements.getInstance().afterLoadMetaGrid();
            var10000 = this.MetaGrid;
            var10002 = this.MetaGrid;
            Objects.requireNonNull(var10002);
            var10000.load("map_zone.bin", (BiConsumer<ByteBuffer, Integer>)LambdaMetafactory.metafactory(null, null, null, (Ljava/lang/Object;Ljava/lang/Object;)V, loadZone(java.nio.ByteBuffer int ), (Ljava/nio/ByteBuffer;Ljava/lang/Integer;)V)((IsoMetaGrid)var10002));
            this.MetaGrid.loadCells("metagrid", "metacell_(-?[0-9]+)_(-?[0-9]+)\\.bin", (QuadConsumer)LambdaMetafactory.metafactory(null, null, null, (Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V, load(zombie.iso.IsoMetaGrid java.nio.ByteBuffer int ), (Lzombie/iso/IsoMetaCell;Lzombie/iso/IsoMetaGrid;Ljava/nio/ByteBuffer;Ljava/lang/Integer;)V)());
            var10000 = this.MetaGrid;
            var10002 = this.MetaGrid;
            Objects.requireNonNull(var10002);
            var10000.load("map_animals.bin", (BiConsumer<ByteBuffer, Integer>)LambdaMetafactory.metafactory(null, null, null, (Ljava/lang/Object;Ljava/lang/Object;)V, loadAnimalZones(java.nio.ByteBuffer int ), (Ljava/nio/ByteBuffer;Ljava/lang/Integer;)V)((IsoMetaGrid)var10002));
            this.MetaGrid.processZones();
            DebugLog.General.println("triggerEvent OnLoadedMapZones");
            LuaEventManager.triggerEvent((String)"OnLoadedMapZones");
            if (GameServer.bServer) {
                ServerMap.instance.init(this.MetaGrid);
            }
            DebugLog.General.println("ItemConfigurator.Preprocess() start");
            ItemConfigurator.Preprocess();
            DebugLog.General.println("ItemConfigurator.Preprocess() end");
            var50 = false;
            var51 = false;
            if (GameClient.bClient) {
                if (ClientPlayerDB.getInstance().clientLoadNetworkPlayer() && ClientPlayerDB.getInstance().isAliveMainNetworkPlayer()) {
                    var51 = true;
                }
            } else {
                var51 = PlayerDBHelper.isPlayerAlive((String)ZomboidFileSystem.instance.getCurrentSaveDir(), (int)1);
            }
            if (GameServer.bServer) {
                ServerPlayerDB.setAllow((boolean)true);
            }
            if (!GameClient.bClient && !GameServer.bServer) {
                PlayerDB.setAllow((boolean)true);
            }
            var53 = false;
            var55 = false;
            var7 = false;
            if (var51) {
                var50 = true;
                if (!this.LoadPlayerForInfo()) {
                    return;
                }
                IsoWorld.WorldX = IsoChunkMap.SWorldX[IsoPlayer.getPlayerIndex()];
                IsoWorld.WorldY = IsoChunkMap.SWorldY[IsoPlayer.getPlayerIndex()];
                var52 = IsoChunkMap.WorldXA;
                var6 = IsoChunkMap.WorldYA;
                var17_42 = IsoChunkMap.WorldZA;
            } else {
                var50 = false;
                if (GameClient.bClient && !ServerOptions.instance.SpawnPoint.getValue().isEmpty()) {
                    var8 = ServerOptions.instance.SpawnPoint.getValue().split(",");
                    if (var8.length == 3) {
                        try {
                            IsoChunkMap.MPWorldXA = Integer.valueOf(var8[0].trim());
                            IsoChunkMap.MPWorldYA = Integer.valueOf(var8[1].trim());
                            IsoChunkMap.MPWorldZA = Integer.valueOf(var8[2].trim());
                        }
                        catch (NumberFormatException var22) {
                            DebugLog.Moveable.println("ERROR: SpawnPoint must be x,y,z, got \"" + ServerOptions.instance.SpawnPoint.getValue() + "\"");
                            IsoChunkMap.MPWorldXA = 0;
                            IsoChunkMap.MPWorldYA = 0;
                            IsoChunkMap.MPWorldZA = 0;
                        }
                    } else {
                        DebugLog.Moveable.println("ERROR: SpawnPoint must be x,y,z, got \"" + ServerOptions.instance.SpawnPoint.getValue() + "\"");
                    }
                }
                if (!GameClient.bClient || IsoChunkMap.MPWorldXA == 0 && IsoChunkMap.MPWorldYA == 0) {
                    IsoChunkMap.WorldXA = this.getLuaPosX();
                    IsoChunkMap.WorldYA = this.getLuaPosY();
                    IsoChunkMap.WorldZA = this.getLuaPosZ();
                    if (GameClient.bClient && ServerOptions.instance.SafehouseAllowRespawn.getValue()) {
                        for (var58 = 0; var58 < SafeHouse.getSafehouseList().size(); ++var58) {
                            var9 = (SafeHouse)SafeHouse.getSafehouseList().get(var58);
                            if (!var9.getPlayers().contains(GameClient.username) || !var9.isRespawnInSafehouse(GameClient.username)) continue;
                            IsoChunkMap.WorldXA = var9.getX() + var9.getH() / 2;
                            IsoChunkMap.WorldYA = var9.getY() + var9.getW() / 2;
                            IsoChunkMap.WorldZA = 0;
                        }
                    }
                    IsoWorld.WorldX = PZMath.fastfloor((float)((float)IsoChunkMap.WorldXA / 8.0f));
                    IsoWorld.WorldY = PZMath.fastfloor((float)((float)IsoChunkMap.WorldYA / 8.0f));
                } else if (GameClient.bClient) {
                    IsoChunkMap.WorldXA = IsoChunkMap.MPWorldXA;
                    IsoChunkMap.WorldYA = IsoChunkMap.MPWorldYA;
                    IsoChunkMap.WorldZA = IsoChunkMap.MPWorldZA;
                    IsoWorld.WorldX = PZMath.fastfloor((float)((float)IsoChunkMap.WorldXA / 8.0f));
                    IsoWorld.WorldY = PZMath.fastfloor((float)((float)IsoChunkMap.WorldYA / 8.0f));
                }
            }
            Core.getInstance();
            var59 = (KahluaTable)LuaManager.env.rawget((Object)"selectedDebugScenario");
            if (var59 != null) {
                var60 = (KahluaTable)var59.rawget((Object)"startLoc");
                var10 = ((Double)var60.rawget((Object)"x")).intValue();
                var11 = ((Double)var60.rawget((Object)"y")).intValue();
                var12 = ((Double)var60.rawget((Object)"z")).intValue();
                IsoChunkMap.WorldXA = var10;
                IsoChunkMap.WorldYA = var11;
                IsoChunkMap.WorldZA = var12;
                IsoWorld.WorldX = PZMath.fastfloor((float)((float)IsoChunkMap.WorldXA / 8.0f));
                IsoWorld.WorldY = PZMath.fastfloor((float)((float)IsoChunkMap.WorldYA / 8.0f));
            }
            DebugLog.General.println("MapCollisionData.init() start");
            MapCollisionData.instance.init(IsoWorld.instance.getMetaGrid());
            DebugLog.General.println("MapCollisionData.init() end");
            DebugLog.General.println("AnimalPopulationManager.init() start");
            AnimalPopulationManager.getInstance().init(this.getMetaGrid());
            DebugLog.General.println("AnimalPopulationManager.init() end");
            DebugLog.General.println("ZombiePopulationManager.init() start");
            ZombiePopulationManager.instance.init(IsoWorld.instance.getMetaGrid());
            DebugLog.General.println("ZombiePopulationManager.init() end");
            DebugLog.General.println("Pathfind init() start");
            PathfindNative.USE_NATIVE_CODE = DebugOptions.instance.PathfindUseNativeCode.getValue();
            if (PathfindNative.USE_NATIVE_CODE) {
                PathfindNative.instance.init(IsoWorld.instance.getMetaGrid());
            } else {
                PolygonalMap2.instance.init(IsoWorld.instance.getMetaGrid());
            }
            DebugLog.General.println("Pathfind init() end");
            GlobalObjectLookup.init((IsoMetaGrid)IsoWorld.instance.getMetaGrid());
            if (!GameServer.bServer) {
                SpawnPoints.instance.initSinglePlayer(this.MetaGrid);
            }
            DebugLog.General.println("WorldStreamer.create() start");
            WorldStreamer.instance.create();
            DebugLog.General.println("WorldStreamer.create() end");
            DebugLog.General.println("CellLoader.LoadCellBinaryChunk start");
            this.CurrentCell = CellLoader.LoadCellBinaryChunk((IsoSpriteManager)var46, (int)IsoWorld.WorldX, (int)IsoWorld.WorldY);
            DebugLog.General.println("CellLoader.LoadCellBinaryChunk start");
            ClimateManager.getInstance().postCellLoadSetSnow();
            GameLoadingState.GameLoadingString = Translator.getText((String)"IGUI_MP_LoadWorld");
            MapCollisionData.instance.start();
            if (!GameServer.bServer) {
                DebugLog.General.println("MapItem.LoadWorldMap() start");
                MapItem.LoadWorldMap();
                DebugLog.General.println("MapItem.LoadWorldMap() start");
            }
            if (GameClient.bClient) {
                WorldMapClient.instance.worldMapLoaded();
            }
            DebugLog.General.println("WorldStreamer.isBusy() loop start");
            while (WorldStreamer.instance.isBusy()) {
                try {
                    Thread.sleep(100L);
                }
                catch (InterruptedException var60) {}
            }
            DebugLog.General.println("WorldStreamer.isBusy() loop end");
            var61 = new ArrayList<E>();
            var61.addAll(IsoChunk.loadGridSquare);
            for (IsoChunk var64 : var61) {
                this.CurrentCell.ChunkMap[0].setChunkDirect(var64, false);
            }
            this.CurrentCell.ChunkMap[0].calculateZExtentsForChunkMap();
            IsoChunk.bDoServerRequests = true;
            if (var50 && SystemDisabler.doPlayerCreation) {
                this.CurrentCell.LoadPlayer(IsoWorld.SavedWorldVersion);
                if (GameClient.bClient) {
                    IsoPlayer.getInstance().setUsername(GameClient.username);
                }
                ZomboidRadio.getInstance().getRecordedMedia().handleLegacyListenedLines(IsoPlayer.getInstance());
            } else if (GameClient.bClient) {
                ZomboidRadio.getInstance().getRecordedMedia().handleLegacyListenedLines((IsoPlayer)null);
                LuaManager.thread.debugOwnerThread = GameWindow.GameThread;
                LuaManager.debugthread.debugOwnerThread = GameWindow.GameThread;
                GameClient.sendCreatePlayer((byte)0);
                var63 = System.currentTimeMillis();
                var66 = false;
                block55: while (true) {
                    try {
                        while (true) {
                            if (IsoPlayer.players[0] != null) {
                                var66 = true;
                            }
                            if (System.currentTimeMillis() - var63 > 30000L || var66) break block55;
                            Thread.sleep(100L);
                        }
                    }
                    catch (InterruptedException var27_66) {
                        continue;
                    }
                    break;
                }
                LuaManager.thread.debugOwnerThread = GameLoadingState.loader;
                LuaManager.debugthread.debugOwnerThread = GameLoadingState.loader;
                if (!var66) {
                    throw new RuntimeException("Character can't be created");
                }
                var67 = IsoPlayer.players[0];
                IsoChunkMap.WorldXA = (int)var67.getX();
                var13 = this.CurrentCell.getGridSquare(IsoChunkMap.WorldXA, IsoChunkMap.WorldYA = (int)var67.getY(), IsoChunkMap.WorldZA = (int)var67.getZ());
                if (var13 != null && var13.getRoom() != null) {
                    var13.getRoom().def.setExplored(true);
                    var13.getRoom().building.setAllExplored(true);
                    if (!GameServer.bServer && !GameClient.bClient) {
                        ZombiePopulationManager.instance.playerSpawnedAt(var13.getX(), var13.getY(), var13.getZ());
                    }
                }
                if (!GameClient.bClient) {
                    Core.getInstance().initPoisonousBerry();
                    Core.getInstance().initPoisonousMushroom();
                }
                LuaEventManager.triggerEvent((String)"OnNewGame", (Object)var67, (Object)var13);
            } else {
                ZomboidRadio.getInstance().getRecordedMedia().handleLegacyListenedLines((IsoPlayer)null);
                var9 = null;
                if (IsoPlayer.numPlayers == 0) {
                    IsoPlayer.numPlayers = 1;
                }
                var10 = IsoChunkMap.WorldXA;
                var11 = IsoChunkMap.WorldYA;
                var12 = IsoChunkMap.WorldZA;
                if (GameClient.bClient && !ServerOptions.instance.SpawnPoint.getValue().isEmpty()) {
                    var68 = ServerOptions.instance.SpawnPoint.getValue().split(",");
                    if (var68.length != 3) {
                        DebugLog.Moveable.println("ERROR: SpawnPoint must be x,y,z, got \"" + ServerOptions.instance.SpawnPoint.getValue() + "\"");
                    } else {
                        try {
                            var14 = Integer.valueOf(var68[1].trim());
                            var15 = Integer.valueOf(var68[0].trim());
                            var16 = Integer.valueOf(var68[2].trim());
                            if (GameClient.bClient && ServerOptions.instance.SafehouseAllowRespawn.getValue()) {
                                for (var17 = 0; var17 < SafeHouse.getSafehouseList().size(); ++var17) {
                                    var18 = (SafeHouse)SafeHouse.getSafehouseList().get(var17);
                                    if (!var18.getPlayers().contains(GameClient.username) || !var18.isRespawnInSafehouse(GameClient.username)) continue;
                                    var15 = var18.getX() + var18.getH() / 2;
                                    var14 = var18.getY() + var18.getW() / 2;
                                    var16 = 0;
                                }
                            }
                            if (this.CurrentCell.getGridSquare(var15, var14, var16) != null) {
                                var10 = var15;
                                var11 = var14;
                                var12 = var16;
                            }
                        }
                        catch (NumberFormatException var38) {
                            DebugLog.Moveable.println("ERROR: SpawnPoint must be x,y,z, got \"" + ServerOptions.instance.SpawnPoint.getValue() + "\"");
                        }
                    }
                }
                var65 = this.CurrentCell.getGridSquare(var10, var11, var12);
                if (SystemDisabler.doPlayerCreation && !GameServer.bServer) {
                    if (var65 != null && var65.isFree(false) && var65.getRoom() != null) {
                        var13 = var65;
                        if ((var65 = var65.getRoom().getFreeTile()) == null) {
                            var65 = var13;
                        }
                    }
                    var69 = null;
                    if (this.getLuaPlayerDesc() != null) {
                        if (GameClient.bClient && ServerOptions.instance.SafehouseAllowRespawn.getValue() && (var65 = this.CurrentCell.getGridSquare(IsoChunkMap.WorldXA, IsoChunkMap.WorldYA, IsoChunkMap.WorldZA)) != null && var65.isFree(false) && var65.getRoom() != null) {
                            var70 = var65;
                            if ((var65 = var65.getRoom().getFreeTile()) == null) {
                                var65 = var70;
                            }
                        }
                        if (var65 == null) {
                            throw new RuntimeException("can't create player at x,y,z=" + var10 + "," + var11 + "," + var12 + " because the square is null");
                        }
                        WorldSimulation.instance.create();
                        var69 = new IsoPlayer(IsoWorld.instance.CurrentCell, this.getLuaPlayerDesc(), var65.getX(), var65.getY(), var65.getZ());
                        if (GameClient.bClient) {
                            var69.setUsername(GameClient.username);
                        }
                        var69.setDir(IsoDirections.SE);
                        var69.sqlID = 1;
                        IsoPlayer.players[0] = var69;
                        IsoPlayer.setInstance((IsoPlayer)var69);
                        IsoCamera.setCameraCharacter((IsoGameCharacter)var69);
                    }
                    var71 = IsoPlayer.getInstance();
                    var71.applyTraits(this.getLuaTraits());
                    var72 = ProfessionFactory.getProfession((String)var71.getDescriptor().getProfession());
                    if (var72 != null && !var72.getFreeRecipes().isEmpty()) {
                        for (String var74 : var72.getFreeRecipes()) {
                            var71.getKnownRecipes().add(var74);
                        }
                    }
                    var73 = this.getLuaTraits().iterator();
                    block59: while (true) {
                        if (!var73.hasNext()) {
                            if (var65 != null && var65.getRoom() != null) {
                                var65.getRoom().def.setExplored(true);
                                var65.getRoom().building.setAllExplored(true);
                                if (!GameServer.bServer && !GameClient.bClient) {
                                    ZombiePopulationManager.instance.playerSpawnedAt(var65.getX(), var65.getY(), var65.getZ());
                                }
                            }
                            if (!GameClient.bClient) {
                                Core.getInstance().initPoisonousBerry();
                                Core.getInstance().initPoisonousMushroom();
                            }
                            LuaEventManager.triggerEvent((String)"OnNewGame", (Object)var69, (Object)var65);
                            break;
                        }
                        var74 = (String)var73.next();
                        var75 = TraitFactory.getTrait((String)var74);
                        if (var75 == null || var75.getFreeRecipes().isEmpty()) continue;
                        var19 = var75.getFreeRecipes().iterator();
                        while (true) {
                            if (var19.hasNext()) ** break;
                            continue block59;
                            var20 = (String)var19.next();
                            var71.getKnownRecipes().add(var20);
                        }
                        break;
                    }
                }
            }
            if (PlayerDB.isAllow()) {
                PlayerDB.getInstance().m_canSavePlayers = true;
            }
            if (ClientPlayerDB.isAllow()) {
                ClientPlayerDB.getInstance().canSavePlayers = true;
            }
            TutorialManager.instance.ActiveControlZombies = false;
            ReanimatedPlayers.instance.loadReanimatedPlayers();
            if (IsoPlayer.getInstance() != null) {
                if (GameClient.bClient) {
                    var54 = PZMath.fastfloor((float)IsoPlayer.getInstance().getX());
                    var4 = PZMath.fastfloor((float)IsoPlayer.getInstance().getY());
                    var52 = PZMath.fastfloor((float)IsoPlayer.getInstance().getZ());
                    while (!(var52 <= 0 || (var56 = this.CurrentCell.getGridSquare(var54, var4, PZMath.fastfloor((float)var52))) != null && var56.TreatAsSolidFloor())) {
                        IsoPlayer.getInstance().setZ((float)(--var52));
                    }
                }
                ScriptManager.instance.checkAutoLearn((IsoGameCharacter)IsoPlayer.getInstance());
                ScriptManager.instance.checkMetaRecipes((IsoGameCharacter)IsoPlayer.getInstance());
                IsoPlayer.getInstance().setCurrent(this.CurrentCell.getGridSquare(PZMath.fastfloor((float)IsoPlayer.getInstance().getX()), PZMath.fastfloor((float)IsoPlayer.getInstance().getY()), PZMath.fastfloor((float)IsoPlayer.getInstance().getZ())));
            }
            if (!this.bLoaded) {
                if (!this.CurrentCell.getBuildingList().isEmpty()) {
                    // empty if block
                }
                if (!this.bLoaded) {
                    this.PopulateCellWithSurvivors();
                }
            }
            if (IsoPlayer.players[0] != null && !this.CurrentCell.getObjectList().contains(IsoPlayer.players[0])) {
                this.CurrentCell.getObjectList().add(IsoPlayer.players[0]);
            }
            LightingThread.instance.create();
            DebugLog.General.println("MetaTracker.load() start");
            MetaTracker.load();
            DebugLog.General.println("MetaTracker.load() start");
            GameLoadingState.GameLoadingString = "";
            IsoWorld.initMessaging();
            WorldDictionary.onWorldLoaded();
            this.CurrentCell.initWeatherFx();
            if (ScriptManager.instance.hasLoadErrors(Core.bDebug == false) || SpriteConfigManager.HasLoadErrors()) {
                var76 = DebugLog.Moveable;
                var10001 = ScriptManager.instance.hasLoadErrors(Core.bDebug == false);
                var76.println("script error = " + var10001 + ", sprite error = " + SpriteConfigManager.HasLoadErrors());
                throw new WorldDictionaryException("World loading could not proceed, there are script load errors. (Actual error may be printed earlier in log)");
            }
        }
    }

    int readWorldVersion() {
        if (GameServer.bServer) {
            block27: {
                File var1 = ZomboidFileSystem.instance.getFileInCurrentSave("map_t.bin");
                try {
                    int var8;
                    try (FileInputStream var2 = new FileInputStream(var1);
                         DataInputStream var3 = new DataInputStream(var2);){
                        byte var21 = var3.readByte();
                        byte var5 = var3.readByte();
                        byte var6 = var3.readByte();
                        byte var7 = var3.readByte();
                        if (var21 != 71 || var5 != 77 || var6 != 84 || var7 != 77) break block27;
                        var8 = var3.readInt();
                    }
                    return var8;
                }
                catch (FileNotFoundException var8) {
                }
                catch (IOException var20) {
                    ExceptionLogger.logException((Throwable)var20);
                }
            }
            return -1;
        }
        File var1 = ZomboidFileSystem.instance.getFileInCurrentSave("map_ver.bin");
        try {
            int var4;
            try (FileInputStream var2 = new FileInputStream(var1);
                 DataInputStream var3 = new DataInputStream(var2);){
                var4 = var3.readInt();
            }
            return var4;
        }
        catch (FileNotFoundException var4) {
        }
        catch (IOException var16) {
            ExceptionLogger.logException((Throwable)var16);
        }
        return -1;
    }

    public ArrayList getLuaTraits() {
        if (this.luatraits == null) {
            this.luatraits = new ArrayList();
        }
        return this.luatraits;
    }

    public void addLuaTrait(String var1) {
        this.getLuaTraits().add(var1);
    }

    public SurvivorDesc getLuaPlayerDesc() {
        return this.luaDesc;
    }

    public void setLuaPlayerDesc(SurvivorDesc var1) {
        this.luaDesc = var1;
    }

    public void KillCell() {
        this.helicopter.deactivate();
        CollisionManager.instance.ContactMap.clear();
        ObjectIDManager.getInstance().clear();
        FliesSound.instance.Reset();
        IsoObjectPicker.Instance.Init();
        IsoChunkMap.SharedChunks.clear();
        SoundManager.instance.StopMusic();
        WorldSoundManager.instance.KillCell();
        ZombieGroupManager.instance.Reset();
        this.CurrentCell.Dispose();
        IsoSpriteManager.instance.Dispose();
        this.CurrentCell = null;
        IsoLot.Dispose();
        IsoGameCharacter.getSurvivorMap().clear();
        IsoPlayer.getInstance().setCurrent((IsoGridSquare)null);
        IsoPlayer.getInstance().setLast((IsoGridSquare)null);
        IsoPlayer.getInstance().square = null;
        RainManager.reset();
        IsoFireManager.Reset();
        ObjectAmbientEmitters.Reset();
        AnimalVocalsManager.Reset();
        ZombieVocalsManager.Reset();
        IsoWaterFlow.Reset();
        this.MetaGrid.Dispose();
        this.biomeMap.Dispose();
        IsoBuilding.IDMax = 0;
        instance = new IsoWorld();
    }

    public void setDrawWorld(boolean var1) {
        this.bDrawWorld = var1;
    }

    public void sceneCullZombies() {
        int var11;
        int var1;
        this.zombieWithModel.clear();
        this.zombieWithoutModel.clear();
        for (var1 = 0; var1 < this.CurrentCell.getZombieList().size(); ++var1) {
            IsoZombie var2 = (IsoZombie)this.CurrentCell.getZombieList().get(var1);
            boolean var3 = false;
            for (int var4 = 0; var4 < IsoPlayer.numPlayers; ++var4) {
                IsoPlayer var5 = IsoPlayer.players[var4];
                if (var5 == null || var2.current == null) continue;
                float var6 = var2.getScreenProperX(var4);
                float var7 = var2.getScreenProperY(var4);
                if (var6 < -100.0f || var7 < -100.0f || var6 > (float)(Core.getInstance().getOffscreenWidth(var4) + 100) || var7 > (float)(Core.getInstance().getOffscreenHeight(var4) + 100) || (var2.getAlpha(var4) == 0.0f || var2.legsSprite.def.alpha == 0.0f) && !var2.current.isCouldSee(var4) && !var2.couldSeeHeadSquare(var5)) continue;
                var3 = true;
                break;
            }
            if (var3 && var2.isCurrentState((State)FakeDeadZombieState.instance())) {
                var3 = false;
            }
            if (var3) {
                this.zombieWithModel.add(var2);
                continue;
            }
            this.zombieWithoutModel.add(var2);
        }
        Collections.sort(this.zombieWithModel, compScoreToPlayer);
        var1 = 0;
        int var8 = 0;
        int var9 = 0;
        int var10 = this.MaxRenderCount;
        PerformanceSettings.AnimationSkip = 0;
        for (var11 = 0; var11 < this.zombieWithModel.size(); ++var11) {
            IsoZombie var12 = (IsoZombie)this.zombieWithModel.get(var11);
            if (var9 < var10) {
                if (var12.Ghost) continue;
                ++var8;
                ++var9;
                var12.setSceneCulled(false);
                if (var12.legsSprite == null || var12.legsSprite.modelSlot == null) continue;
                if (var8 > PerformanceSettings.ZombieAnimationSpeedFalloffCount) {
                    ++var1;
                    var8 = 0;
                }
                if (var9 < PerformanceSettings.ZombieBonusFullspeedFalloff) {
                    var12.legsSprite.modelSlot.model.setInstanceSkip(var8 / PerformanceSettings.ZombieBonusFullspeedFalloff);
                    var8 = 0;
                } else {
                    var12.legsSprite.modelSlot.model.setInstanceSkip(var1 + PerformanceSettings.AnimationSkip);
                }
                if (var12.legsSprite.modelSlot.model.AnimPlayer == null) continue;
                if (var9 >= PerformanceSettings.numberZombiesBlended) {
                    var12.legsSprite.modelSlot.model.AnimPlayer.bDoBlending = false;
                    continue;
                }
                var12.legsSprite.modelSlot.model.AnimPlayer.bDoBlending = !var12.isAlphaAndTargetZero(0) || !var12.isAlphaAndTargetZero(1) || !var12.isAlphaAndTargetZero(2) || !var12.isAlphaAndTargetZero(3);
                continue;
            }
            var12.setSceneCulled(true);
            if (!var12.hasAnimationPlayer()) continue;
            var12.getAnimationPlayer().bDoBlending = false;
        }
        for (var11 = 0; var11 < this.zombieWithoutModel.size(); ++var11) {
            IsoZombie var12 = (IsoZombie)this.zombieWithoutModel.get(var11);
            if (var12.hasActiveModel()) {
                var12.setSceneCulled(true);
            }
            if (!var12.hasAnimationPlayer()) continue;
            var12.getAnimationPlayer().bDoBlending = false;
        }
    }

    public void sceneCullAnimals() {
        IsoAnimal var9;
        int var1;
        this.animalWithModel.clear();
        this.animalWithoutModel.clear();
        for (var1 = 0; var1 < this.CurrentCell.getObjectList().size(); ++var1) {
            IsoMovingObject var2 = (IsoMovingObject)this.CurrentCell.getObjectList().get(var1);
            IsoAnimal var3 = (IsoAnimal)Type.tryCastTo((Object)var2, IsoAnimal.class);
            if (var3 == null) continue;
            boolean var4 = false;
            for (int var5 = 0; var5 < IsoPlayer.numPlayers; ++var5) {
                IsoPlayer var6 = IsoPlayer.players[var5];
                if (var6 == null || var3.current == null) continue;
                float var7 = (int)(IsoUtils.XToScreen((float)var3.getX(), (float)var3.getY(), (float)var3.getZ(), (int)0) - IsoCamera.cameras[var5].getOffX());
                float var8 = (int)(IsoUtils.YToScreen((float)var3.getX(), (float)var3.getY(), (float)var3.getZ(), (int)0) - IsoCamera.cameras[var5].getOffY());
                if (var7 < -100.0f || var8 < -100.0f || var7 > (float)(Core.getInstance().getOffscreenWidth(var5) + 100) || var8 > (float)(Core.getInstance().getOffscreenHeight(var5) + 100) || (var3.getAlpha(var5) == 0.0f || var3.legsSprite.def.alpha == 0.0f) && !var3.current.isCouldSee(var5)) continue;
                var4 = true;
                break;
            }
            if (var4 && var3.isCurrentState((State)FakeDeadZombieState.instance())) {
                var4 = false;
            }
            if (var4) {
                this.animalWithModel.add(var3);
                continue;
            }
            this.animalWithoutModel.add(var3);
        }
        for (var1 = 0; var1 < this.animalWithModel.size(); ++var1) {
            var9 = (IsoAnimal)this.animalWithModel.get(var1);
            var9.setSceneCulled(false);
            if (!var9.hasAnimationPlayer()) continue;
            var9.getAnimationPlayer().bDoBlending = true;
        }
        for (var1 = 0; var1 < this.animalWithoutModel.size(); ++var1) {
            var9 = (IsoAnimal)this.animalWithoutModel.get(var1);
            if (var9.hasActiveModel()) {
                var9.setSceneCulled(true);
            }
            if (!var9.hasAnimationPlayer()) continue;
            var9.getAnimationPlayer().bDoBlending = false;
        }
    }

    public void render() {
        try (AbstractPerformanceProfileProbe var1 = s_performance.isoWorldRender.profile();){
            this.renderInternal();
        }
    }

    private void renderInternal() {
        IsoGameCharacter var1;
        if (this.bDrawWorld && (var1 = IsoCamera.getCameraCharacter()) != null) {
            GameProfiler.ProfileArea var3;
            SpriteRenderer.instance.doCoreIntParam(0, var1.getX());
            SpriteRenderer.instance.doCoreIntParam(1, var1.getY());
            SpriteRenderer.instance.doCoreIntParam(2, IsoCamera.frameState.CamCharacterZ);
            GameProfiler var2 = GameProfiler.getInstance();
            try {
                var3 = var2.profile("Cull");
                try {
                    this.sceneCullZombies();
                    this.sceneCullAnimals();
                }
                finally {
                    if (var3 != null) {
                        var3.close();
                    }
                }
            }
            catch (Throwable var17) {
                ExceptionLogger.logException((Throwable)var17);
            }
            try {
                WeatherFxMask.initMask();
                DeadBodyAtlas.instance.render();
                WorldItemAtlas.instance.render();
                this.CurrentCell.render();
                this.DrawIsoCursorHelper();
                DeadBodyAtlas.instance.renderDebug();
                var3 = var2.profile("renderPathfinding");
                try {
                    this.renderPathfinding();
                }
                finally {
                    if (var3 != null) {
                        var3.close();
                    }
                }
                WorldSoundManager.instance.render();
                WorldFlares.debugRender();
                WorldMarkers.instance.debugRender();
                ObjectAmbientEmitters.getInstance().render();
                var3 = var2.profile("renderVocals");
                try {
                    this.renderVocals();
                }
                finally {
                    if (var3 != null) {
                        var3.close();
                    }
                }
                var3 = var2.profile("renderWeatherFX");
                try {
                    this.renderWeatherFX();
                }
                finally {
                    if (var3 != null) {
                        var3.close();
                    }
                }
                if (PerformanceSettings.FBORenderChunk) {
                    FBORenderAreaHighlights.getInstance().render();
                }
                ParameterInside.renderDebug();
                LineDrawer.render();
                if (GameClient.bClient) {
                    ClientServerMap.render((int)IsoCamera.frameState.playerIndex);
                    PassengerMap.render((int)IsoCamera.frameState.playerIndex);
                }
                var3 = var2.profile("Skybox");
                try {
                    SkyBox.getInstance().render();
                }
                finally {
                    if (var3 != null) {
                        var3.close();
                    }
                }
            }
            catch (Throwable var15) {
                ExceptionLogger.logException((Throwable)var15);
            }
        }
    }

    private void renderPathfinding() {
        if (PathfindNative.USE_NATIVE_CODE) {
            PathfindNative.instance.render();
            PathfindNativeRenderer.instance.render();
        } else {
            PolygonalMap2.instance.render();
        }
        BorderFinderRenderer.instance.render();
    }

    private void renderVocals() {
        AnimalVocalsManager.instance.render();
        ZombieVocalsManager.instance.render();
    }

    private void renderWeatherFX() {
        this.getCell().getWeatherFX().getDrawer(IsoWeatherFX.ID_CLOUD).startFrame();
        this.getCell().getWeatherFX().getDrawer(IsoWeatherFX.ID_FOG).startFrame();
        this.getCell().getWeatherFX().getDrawer(IsoWeatherFX.ID_SNOW).startFrame();
        this.getCell().getWeatherFX().getDrawer(IsoWeatherFX.ID_RAIN).startFrame();
        WeatherFxMask.renderFxMask((int)IsoCamera.frameState.playerIndex);
    }

    public void DrawPlayerCone() {
        int var1 = IsoCamera.frameState.playerIndex;
        SpriteRenderer.instance.pushIsoView(IsoPlayer.getInstance().getX(), IsoPlayer.getInstance().getY(), IsoPlayer.getInstance().getZ(), (float)Math.toRadians(180.0), false);
        IsoPlayer var2 = IsoPlayer.getInstance();
        float var3 = var2.getStats().fatigue - 0.6f;
        if (var3 < 0.0f) {
            var3 = 0.0f;
        }
        var3 *= 2.5f;
        if (var2.Traits.HardOfHearing.isSet() && var3 < 0.7f) {
            var3 = 0.7f;
        }
        float var4 = 2.0f;
        if (var2.Traits.KeenHearing.isSet()) {
            var4 += 3.0f;
        }
        float var5 = LightingJNI.calculateVisionCone((IsoGameCharacter)var2);
        var5 = -var5;
        var5 = 1.0f - var5;
        Vector2 var6 = var2.getLookVector(this.coneTempo1);
        BaseVehicle var7 = var2.getVehicle();
        if (var7 != null && !var2.isAiming() && !var2.isLookingWhileInVehicle() && var7.isDriver((IsoGameCharacter)var2) && var7.getCurrentSpeedKmHour() < -1.0f) {
            var6.rotate((float)Math.PI);
        }
        if (var5 < 0.0f) {
            var5 = Math.abs(var5) + 1.0f;
        }
        var5 = (float)((double)var5 * 1.5707963267948966);
        this.coneTempo2.x = var6.x;
        this.coneTempo2.y = var6.y;
        this.coneTempo3.x = var6.x;
        this.coneTempo3.y = var6.y;
        this.coneTempo2.rotate(-var5);
        this.coneTempo3.rotate(var5);
        float var8 = this.coneTempo2.x * 1000.0f;
        float var9 = this.coneTempo2.y * 1000.0f;
        float var10 = var8 + -var6.x * 1000.0f;
        float var11 = var9 + -var6.y * 1000.0f;
        float var12 = -var6.x * 1000.0f;
        float var13 = -var6.y * 1000.0f;
        IndieGL.disableDepthTest();
        IndieGL.disableScissorTest();
        SpriteRenderer.instance.glBuffer(8, 0);
        if (ViewConeTextureFBO.instance.getTexture() != null) {
            SpriteRenderer.instance.glViewport(0, 0, ViewConeTextureFBO.instance.getTexture().getWidth(), ViewConeTextureFBO.instance.getTexture().getHeight());
        }
        IndieGL.StartShader((int)0);
        SpriteRenderer.instance.renderPoly(0.0f, 0.0f, var8, var9, var10, var11, var12, var13, 0.0f, 0.0f, 0.0f, 0.5f);
        IndieGL.EndShader();
        var8 = this.coneTempo3.x * 1000.0f;
        var9 = this.coneTempo3.y * 1000.0f;
        var10 = var8 + -var6.x * 1000.0f;
        var11 = var9 + -var6.y * 1000.0f;
        var12 = -var6.x * 1000.0f;
        var13 = -var6.y * 1000.0f;
        SpriteRenderer.instance.renderPoly(var12, var13, var10, var11, var8, var9, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.5f);
        SpriteRenderer.instance.glBuffer(9, 0);
        SpriteRenderer.instance.glViewport(IsoCamera.getScreenLeft((int)var1), IsoCamera.getScreenTop((int)var1), IsoCamera.getScreenWidth((int)var1), IsoCamera.getScreenHeight((int)var1));
        SpriteRenderer.instance.popIsoView();
        IndieGL.enableScissorTest();
    }

    public void DrawPlayerCone2() {
        IndieGL.glDepthMask((boolean)false);
        IndieGL.glBlendFunc((int)770, (int)771);
        if (SceneShaderStore.BlurShader != null) {
            SceneShaderStore.BlurShader.setTexture(ViewConeTextureFBO.instance.getTexture());
        }
        if (SceneShaderStore.BlurShader != null) {
            IndieGL.StartShader((Shader)SceneShaderStore.BlurShader, (int)IsoPlayer.getPlayerIndex());
        }
        SpriteRenderer.instance.render(ViewConeTextureFBO.instance.getTexture(), 0.0f, (float)Core.getInstance().getOffscreenHeight(IsoPlayer.getPlayerIndex()), (float)Core.getInstance().getOffscreenWidth(IsoPlayer.getPlayerIndex()), (float)(-Core.getInstance().getOffscreenHeight(IsoPlayer.getPlayerIndex())), 1.0f, 1.0f, 1.0f, 1.0f, (Consumer)null);
        if (SceneShaderStore.BlurShader != null) {
            IndieGL.EndShader();
        }
        IndieGL.glDepthMask((boolean)true);
    }

    private void DrawIsoCursorHelper() {
        IsoPlayer var1;
        if (Core.getInstance().getOffscreenBuffer() == null && (var1 = IsoPlayer.getInstance()) != null && !var1.isDead() && var1.isAiming() && var1.PlayerIndex == 0 && var1.JoypadBind == -1 && !GameTime.isGamePaused()) {
            float var2 = 0.05f;
            switch (Core.getInstance().getIsoCursorVisibility()) {
                case 0: {
                    return;
                }
                case 1: {
                    var2 = 0.05f;
                    break;
                }
                case 2: {
                    var2 = 0.1f;
                    break;
                }
                case 3: {
                    var2 = 0.15f;
                    break;
                }
                case 4: {
                    var2 = 0.3f;
                    break;
                }
                case 5: {
                    var2 = 0.5f;
                    break;
                }
                case 6: {
                    var2 = 0.75f;
                }
            }
            if (Core.getInstance().isFlashIsoCursor()) {
                if (this.flashIsoCursorInc) {
                    this.flashIsoCursorA += 0.1f;
                    if (this.flashIsoCursorA >= 1.0f) {
                        this.flashIsoCursorInc = false;
                    }
                } else {
                    this.flashIsoCursorA -= 0.1f;
                    if (this.flashIsoCursorA <= 0.0f) {
                        this.flashIsoCursorInc = true;
                    }
                }
                var2 = this.flashIsoCursorA;
            }
            Texture var3 = Texture.getSharedTexture((String)"media/ui/isocursor.png");
            int var4 = (int)((float)(var3.getWidth() * Core.TileScale) / 2.0f);
            int var5 = (int)((float)(var3.getHeight() * Core.TileScale) / 2.0f);
            SpriteRenderer.instance.setDoAdditive(true);
            SpriteRenderer.instance.renderi(var3, Mouse.getX() - var4 / 2, Mouse.getY() - var5 / 2, var4, var5, var2, var2, var2, var2, (Consumer)null);
            SpriteRenderer.instance.setDoAdditive(false);
        }
    }

    private void updateWorld() {
        this.CurrentCell.update();
        IsoRegions.update();
        HaloTextHelper.update();
        CollisionManager.instance.ResolveContacts();
        if (DebugOptions.instance.ThreadAnimation.getValue()) {
            MovingObjectUpdateScheduler var10000 = MovingObjectUpdateScheduler.instance;
            Objects.requireNonNull(var10000);
            animationThread = CompletableFuture.runAsync(() -> ((MovingObjectUpdateScheduler)var10000).postupdate());
        } else {
            try (GameProfiler.ProfileArea var1 = GameProfiler.getInstance().profile("Animation");){
                MovingObjectUpdateScheduler.instance.postupdate();
            }
        }
    }

    public void FinishAnimation() {
        if (animationThread != null) {
            try (GameProfiler.ProfileArea var1 = GameProfiler.getInstance().profile("Wait Animation");){
                animationThread.join();
            }
            animationThread = null;
        }
    }

    public void update() {
        try (AbstractPerformanceProfileProbe var1 = s_performance.isoWorldUpdate.profile();){
            this.updateInternal();
        }
        try (GameProfiler.ProfileArea var8 = GameProfiler.getInstance().profile("Update DZ");){
            DesignationZone.update();
        }
    }

    private void updateInternal() {
        IsoMetaCell var13;
        ++this.m_frameNo;
        if (GameServer.bServer) {
            try {
                VehicleManager.instance.serverUpdate();
            }
            catch (Exception var10) {
                var10.printStackTrace();
            }
        }
        WorldSimulation.instance.update();
        HutchManager.getInstance().updateAll();
        ImprovedFog.update();
        this.helicopter.update();
        long var1 = System.currentTimeMillis();
        if (var1 - this.emitterUpdateMS >= 30L) {
            this.emitterUpdateMS = var1;
            this.emitterUpdate = true;
        } else {
            this.emitterUpdate = false;
        }
        for (int var3 = 0; var3 < this.currentEmitters.size(); ++var3) {
            BaseSoundEmitter var4 = (BaseSoundEmitter)this.currentEmitters.get(var3);
            if (this.emitterUpdate || var4.hasSoundsToStart()) {
                var4.tick();
            }
            if (!var4.isEmpty()) continue;
            FMODSoundEmitter var5 = (FMODSoundEmitter)Type.tryCastTo((Object)var4, FMODSoundEmitter.class);
            if (var5 != null) {
                var5.clearParameters();
            }
            this.currentEmitters.remove(var3);
            this.freeEmitters.push(var4);
            IsoObject var6 = (IsoObject)this.emitterOwners.remove(var4);
            if (var6 != null && var6.emitter == var4) {
                var6.emitter = null;
            }
            --var3;
        }
        if (!GameClient.bClient && !GameServer.bServer && (var13 = this.MetaGrid.getCurrentCellData()) != null) {
            var13.checkTriggers();
        }
        WorldSoundManager.instance.initFrame();
        ZombieGroupManager.instance.preupdate();
        OnceEvery.update();
        CollisionManager.instance.initUpdate();
        CompletableFuture<Void> var15 = null;
        if (DebugOptions.instance.ThreadWorld.getValue()) {
            var15 = CompletableFuture.runAsync(this::updateThread, PZForkJoinPool.commonPool());
        }
        GameProfiler var14 = GameProfiler.getInstance();
        try (GameProfiler.ProfileArea var16 = var14.profile("Update Climate");){
            ClimateManager.getInstance().update();
        }
        this.updateWorld();
        if (var15 != null) {
            var16 = var14.profile("Wait Thread");
            try {
                var15.join();
            }
            finally {
                if (var16 != null) {
                    var16.close();
                }
            }
        } else {
            this.updateThread();
        }
        if (m_animationRecorderDiscard) {
            AnimationPlayerRecorder.discardOldRecordings();
            m_animationRecorderDiscard = false;
        }
    }

    private void updateThread() {
        GameProfiler var1 = GameProfiler.getInstance();
        try (GameProfiler.ProfileArea var2 = var1.profile("Update Buildings");){
            this.updateBuildings();
        }
        var2 = var1.profile("Update Static");
        try {
            ObjectRenderEffects.updateStatic();
        }
        finally {
            if (var2 != null) {
                var2.close();
            }
        }
        for (int var15 = 0; var15 < this.AddCoopPlayers.size(); ++var15) {
            AddCoopPlayer var3 = (AddCoopPlayer)this.AddCoopPlayers.get(var15);
            var3.update();
            if (!var3.isFinished()) continue;
            this.AddCoopPlayers.remove(var15--);
        }
        if (!GameServer.bServer) {
            IsoPlayer.UpdateRemovedEmitters();
        }
        var2 = var1.profile("Update DBs");
        try {
            this.updateDBs();
        }
        finally {
            if (var2 != null) {
                var2.close();
            }
        }
        if (this.updateSafehousePlayers > 0 && (GameServer.bServer || GameClient.bClient)) {
            --this.updateSafehousePlayers;
            if (this.updateSafehousePlayers == 0) {
                this.updateSafehousePlayers = 200;
                SafeHouse.updateSafehousePlayersConnected();
            }
        }
        var2 = var1.profile("Update VA");
        try {
            AnimalZones.updateVirtualAnimals();
        }
        finally {
            if (var2 != null) {
                var2.close();
            }
        }
        var2 = var1.profile("Load Animal Defs");
        try {
            AnimalTracksDefinitions.loadTracksDefinitions();
        }
        finally {
            if (var2 != null) {
                var2.close();
            }
        }
    }

    private void updateBuildings() {
        for (int var1 = 0; var1 < this.CurrentCell.getBuildingList().size(); ++var1) {
            ((IsoBuilding)this.CurrentCell.getBuildingList().get(var1)).update();
        }
    }

    private void updateDBs() {
        try {
            if (PlayerDB.isAvailable()) {
                PlayerDB.getInstance().updateMain();
            }
            if (ClientPlayerDB.isAvailable()) {
                ClientPlayerDB.getInstance().updateMain();
            }
            VehiclesDB2.instance.updateMain();
        }
        catch (Exception var2) {
            ExceptionLogger.logException((Throwable)var2);
        }
    }

    public IsoCell getCell() {
        return this.CurrentCell;
    }

    private void PopulateCellWithSurvivors() {
    }

    public int getWorldSquareY() {
        return this.CurrentCell.ChunkMap[IsoPlayer.getPlayerIndex()].WorldY * 8;
    }

    public int getWorldSquareX() {
        return this.CurrentCell.ChunkMap[IsoPlayer.getPlayerIndex()].WorldX * 8;
    }

    public IsoMetaChunk getMetaChunk(int var1, int var2) {
        return this.MetaGrid.getChunkData(var1, var2);
    }

    public IsoMetaChunk getMetaChunkFromTile(int var1, int var2) {
        return this.MetaGrid.getChunkDataFromTile(var1, var2);
    }

    public float getGlobalTemperature() {
        return ClimateManager.getInstance().getTemperature();
    }

    public String getWeather() {
        return this.weather;
    }

    public void setWeather(String var1) {
        this.weather = var1;
    }

    public int getLuaSpawnCellX() {
        return PZMath.coordmodulo((int)this.luaPosX, (int)IsoCell.CellSizeInSquares);
    }

    @Deprecated
    public void setLuaSpawnCellX(int var1) {
    }

    public int getLuaSpawnCellY() {
        return PZMath.coordmodulo((int)this.luaPosY, (int)IsoCell.CellSizeInSquares);
    }

    @Deprecated
    public void setLuaSpawnCellY(int var1) {
    }

    public int getLuaPosX() {
        return this.luaPosX;
    }

    public void setLuaPosX(int var1) {
        this.luaPosX = var1;
    }

    public int getLuaPosY() {
        return this.luaPosY;
    }

    public void setLuaPosY(int var1) {
        this.luaPosY = var1;
    }

    public int getLuaPosZ() {
        return this.luaPosZ;
    }

    public void setLuaPosZ(int var1) {
        this.luaPosZ = var1;
    }

    public void setSpawnRegion(String var1) {
        if (var1 != null) {
            this.spawnRegionName = var1;
        }
    }

    public String getSpawnRegion() {
        return this.spawnRegionName;
    }

    public String getWorld() {
        return Core.GameSaveWorld;
    }

    public void transmitWeather() {
        if (GameServer.bServer) {
            GameServer.sendWeather();
        }
    }

    public boolean isValidSquare(int var1, int var2, int var3) {
        return var3 >= -32 && var3 <= 31 ? this.MetaGrid.isValidSquare(var1, var2) : false;
    }

    public ArrayList getRandomizedZoneList() {
        return this.randomizedZoneList;
    }

    public RandomizedZoneStoryBase getRandomizedZoneStoryByName(String var1) {
        for (int var2 = 0; var2 < this.randomizedZoneList.size(); ++var2) {
            RandomizedZoneStoryBase var3 = (RandomizedZoneStoryBase)this.randomizedZoneList.get(var2);
            if (!var3.getName().equalsIgnoreCase(var1)) continue;
            return var3;
        }
        return null;
    }

    public ArrayList getRandomizedBuildingList() {
        return this.randomizedBuildingList;
    }

    public ArrayList getRandomizedVehicleStoryList() {
        return this.randomizedVehicleStoryList;
    }

    public RandomizedVehicleStoryBase getRandomizedVehicleStoryByName(String var1) {
        for (int var2 = 0; var2 < this.randomizedVehicleStoryList.size(); ++var2) {
            RandomizedVehicleStoryBase var3 = (RandomizedVehicleStoryBase)this.randomizedVehicleStoryList.get(var2);
            if (!var3.getName().equalsIgnoreCase(var1)) continue;
            return var3;
        }
        return null;
    }

    public RandomizedBuildingBase getRBBasic() {
        return this.RBBasic;
    }

    public RandomizedWorldBase getRandomizedWorldBase() {
        return this.RandomizedWorldBase;
    }

    public String getDifficulty() {
        return Core.getDifficulty();
    }

    public void setDifficulty(String var1) {
        Core.setDifficulty((String)var1);
    }

    public static boolean getZombiesDisabled() {
        return NoZombies || !SystemDisabler.doZombieCreation || SandboxOptions.instance.Zombies.getValue() == 6;
    }

    public static boolean getZombiesEnabled() {
        return !IsoWorld.getZombiesDisabled();
    }

    public ClimateManager getClimateManager() {
        return ClimateManager.getInstance();
    }

    public IsoPuddles getPuddlesManager() {
        return IsoPuddles.getInstance();
    }

    public static int getWorldVersion() {
        return 223;
    }

    public HashMap getSpawnedZombieZone() {
        return this.spawnedZombieZone;
    }

    public int getTimeSinceLastSurvivorInHorde() {
        return this.timeSinceLastSurvivorInHorde;
    }

    public void setTimeSinceLastSurvivorInHorde(int var1) {
        this.timeSinceLastSurvivorInHorde = var1;
    }

    public float getWorldAgeDays() {
        float var1 = (float)GameTime.getInstance().getWorldAgeHours() / 24.0f;
        return var1 += (float)((SandboxOptions.instance.TimeSinceApo.getValue() - 1) * 30);
    }

    public HashMap getAllTiles() {
        return this.allTiles;
    }

    public ArrayList getAllTilesName() {
        ArrayList<String> var1 = new ArrayList<String>();
        Iterator var2 = this.allTiles.keySet().iterator();
        while (var2.hasNext()) {
            var1.add((String)var2.next());
        }
        Collections.sort(var1);
        return var1;
    }

    public ArrayList getAllTiles(String var1) {
        return (ArrayList)this.allTiles.get(var1);
    }

    public boolean isHydroPowerOn() {
        return this.bHydroPowerOn;
    }

    public void setHydroPowerOn(boolean var1) {
        this.bHydroPowerOn = var1;
    }

    public ArrayList getTileImageNames() {
        return this.tileImages;
    }

    public static void parseDistributions() {
        ItemPickerJava.Parse();
        ItemPickerJava.InitSandboxLootSettings();
    }

    public void setRules(Rules var1) {
        this.rules = var1;
    }

    public Rules getRules() {
        return this.rules;
    }

    public void setWgChunk(WGChunk var1) {
        this.wgChunk = var1;
    }

    public WGChunk getWgChunk() {
        return this.wgChunk;
    }

    public void setBlending(Blending var1) {
        this.blending = var1;
    }

    public Blending getBlending() {
        return this.blending;
    }

    public void setAttachmentsHandler(AttachmentsHandler var1) {
        this.attachmentsHandler = var1;
    }

    public AttachmentsHandler getAttachmentsHandler() {
        return this.attachmentsHandler;
    }

    public void setZoneGenerator(ZoneGenerator var1) {
        this.zoneGenerator = var1;
    }

    public ZoneGenerator getZoneGenerator() {
        return this.zoneGenerator;
    }

    public void setBiomeMap(BiomeMap var1) {
        this.biomeMap = var1;
    }

    public BiomeMap getBiomeMap() {
        return this.biomeMap;
    }

    static {
        m_animationRecorderActive = false;
        m_animationRecorderDiscard = false;
        instance = new IsoWorld();
        compScoreToPlayer = new CompScoreToPlayer();
        mapPath = "media/";
        mapUseJar = true;
        PropertyValueMap = new HashMap();
        WorldX = 0;
        WorldY = 0;
        SavedWorldVersion = -1;
        NoZombies = false;
        TotalWorldVersion = -1;
    }

    private static class CompScoreToPlayer
    implements Comparator {
        private CompScoreToPlayer() {
        }

        public int compare(IsoZombie var1, IsoZombie var2) {
            float var4;
            float var3 = this.getScore(var1);
            if (var3 < (var4 = this.getScore(var2))) {
                return 1;
            }
            return var3 > var4 ? -1 : 0;
        }

        public float getScore(IsoZombie var1) {
            float var2 = Float.MIN_VALUE;
            for (int var3 = 0; var3 < 4; ++var3) {
                IsoPlayer var4 = IsoPlayer.players[var3];
                if (var4 == null || var4.current == null) continue;
                float var5 = var4.getZombieRelevenceScore(var1);
                var2 = Math.max(var2, var5);
            }
            return var2;
        }

        public int compare(Object o1, Object o2) {
            return 0;
        }
    }

    private static class s_performance {
        static final PerformanceProfileProbe isoWorldUpdate = new PerformanceProfileProbe("IsoWorld.update");
        static final PerformanceProfileProbe isoWorldRender = new PerformanceProfileProbe("IsoWorld.render");

        private s_performance() {
        }
    }

    private static class CompDistToPlayer
    implements Comparator {
        public float px;
        public float py;

        private CompDistToPlayer() {
        }

        public int compare(IsoZombie var1, IsoZombie var2) {
            float var4;
            float var3 = IsoUtils.DistanceManhatten((float)PZMath.fastfloor((float)var1.getX()), (float)PZMath.fastfloor((float)var1.getY()), (float)this.px, (float)this.py);
            if (var3 < (var4 = IsoUtils.DistanceManhatten((float)PZMath.fastfloor((float)var2.getX()), (float)PZMath.fastfloor((float)var2.getY()), (float)this.px, (float)this.py))) {
                return -1;
            }
            return var3 > var4 ? 1 : 0;
        }

        public int compare(Object o1, Object o2) {
            return 0;
        }
    }

    public static class MetaCell {
        public int x;
        public int y;
        public int zombieCount;
        public IsoDirections zombieMigrateDirection;
        public int[][] from = new int[3][3];
    }

    public class Frame {
        public ArrayList xPos = new ArrayList();
        public ArrayList yPos = new ArrayList();
        public ArrayList Type = new ArrayList();

        public Frame() {
            Iterator var2 = IsoWorld.instance.CurrentCell.getObjectList().iterator();
            while (var2 != null && var2.hasNext()) {
                int var5;
                IsoMovingObject var3 = (IsoMovingObject)var2.next();
                boolean var4 = true;
                if (var3 instanceof IsoPlayer) {
                    var5 = 0;
                } else if (var3 instanceof IsoSurvivor) {
                    var5 = 1;
                } else {
                    if (!(var3 instanceof IsoZombie) || ((IsoZombie)var3).Ghost) continue;
                    var5 = 2;
                }
                this.xPos.add(PZMath.fastfloor((float)var3.getX()));
                this.yPos.add(PZMath.fastfloor((float)var3.getY()));
                this.Type.add(var5);
            }
        }
    }
}
