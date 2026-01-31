package zombie.radio;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import zombie.GameTime;
import zombie.GameWindow;
import zombie.Lua.LuaEventManager;
import zombie.SandboxOptions;
import zombie.ZomboidFileSystem;
import zombie.characters.IsoPlayer;
import zombie.chat.ChatElement;
import zombie.chat.ChatMessage;
import zombie.core.Color;
import zombie.core.Core;
import zombie.core.Rand;
import zombie.core.logger.ExceptionLogger;
import zombie.core.network.ByteBufferWriter;
import zombie.core.raknet.VoiceManagerData;
import zombie.debug.DebugLog;
import zombie.debug.DebugType;
import zombie.inventory.types.Radio;
import zombie.iso.weather.ClimateManager;
import zombie.network.GameClient;
import zombie.network.GameServer;
import zombie.network.ServerOptions;
import zombie.radio.GameMode;
import zombie.radio.RadioAPI;
import zombie.radio.RadioData;
import zombie.radio.RadioDebugConsole;
import zombie.radio.StorySounds.SLSoundManager;
import zombie.radio.ZomboidRadio;
import zombie.radio.devices.DeviceData;
import zombie.radio.devices.WaveSignalDevice;
import zombie.radio.media.RecordedMedia;
import zombie.radio.scripting.RadioChannel;
import zombie.radio.scripting.RadioScript;
import zombie.radio.scripting.RadioScriptManager;

public final class ZomboidRadio {
    static {
        DebugLog.log((String)("PATCH: ZomboidRadio"));
    }
    public static final String SAVE_FILE = "RADIO_SAVE.txt";
    private final ArrayList<WaveSignalDevice> devices = new ArrayList();
    private final ArrayList<WaveSignalDevice> broadcastDevices = new ArrayList();
    private RadioScriptManager scriptManager;
    private int DaysSinceStart = 0;
    private int lastRecordedHour;
    private final String[] playerLastLine = new String[4];
    private final Map<Integer, String> channelNames = new HashMap<Integer, String>();
    private final Map<String, Map<Integer, String>> categorizedChannels = new HashMap<String, Map<Integer, String>>();
    private final List<Integer> knownFrequencies = new ArrayList<Integer>();
    private RadioDebugConsole debugConsole;
    private boolean hasRecievedServerData = false;
    private SLSoundManager storySoundManager = null;
    private static final String[] staticSounds = new String[]{"<bzzt>", "<fzzt>", "<wzzt>", "<szzt>"};
    public static boolean DEBUG_MODE = false;
    public static boolean DEBUG_XML = false;
    public static boolean DEBUG_SOUND = false;
    public static boolean POST_RADIO_SILENCE = false;
    public static boolean DISABLE_BROADCASTING = false;
    private static ZomboidRadio instance;
    private static RecordedMedia recordedMedia;
    public static boolean LOUISVILLE_OBFUSCATION;
    private String lastSaveFile;
    private String lastSaveContent;
    private HashMap<Integer, FreqListEntry> freqlist = new HashMap();
    private boolean hasAppliedRangeDistortion = false;
    private StringBuilder stringBuilder = new StringBuilder();
    private boolean hasAppliedInterference = false;
    private static int[] obfuscateChannels;

    public static boolean hasInstance() {
        return instance != null;
    }

    public static ZomboidRadio getInstance() {
        if (instance == null) {
            instance = new ZomboidRadio();
        }
        return instance;
    }

    private ZomboidRadio() {
        this.lastRecordedHour = GameTime.instance.getHour();
        SLSoundManager.DEBUG = DEBUG_SOUND;
        for (int i = 0; i < staticSounds.length; ++i) {
            ChatElement.addNoLogText((String)staticSounds[i]);
        }
        ChatElement.addNoLogText((String)"~");
        recordedMedia = new RecordedMedia();
    }

    public static boolean isStaticSound(String string) {
        if (string != null) {
            for (String string2 : staticSounds) {
                if (!string.equals(string2)) continue;
                return true;
            }
        }
        return false;
    }

    public RadioScriptManager getScriptManager() {
        return this.scriptManager;
    }

    public int getDaysSinceStart() {
        return this.DaysSinceStart;
    }

    public ArrayList<WaveSignalDevice> getDevices() {
        return this.devices;
    }

    public ArrayList<WaveSignalDevice> getBroadcastDevices() {
        return this.broadcastDevices;
    }

    public void setHasRecievedServerData(boolean bl) {
        this.hasRecievedServerData = bl;
    }

    public void addChannelName(String string, int n, String string2) {
        this.addChannelName(string, n, string2, true);
    }

    public void addChannelName(String string, int n, String string2, boolean bl) {
        if (bl || !this.channelNames.containsKey(n)) {
            if (!this.categorizedChannels.containsKey(string2)) {
                this.categorizedChannels.put(string2, new HashMap());
            }
            this.categorizedChannels.get(string2).put(n, string);
            this.channelNames.put(n, string);
            this.knownFrequencies.add(n);
        }
    }

    public void removeChannelName(int n) {
        if (this.channelNames.containsKey(n)) {
            this.channelNames.remove(n);
            for (Map.Entry<String, Map<Integer, String>> entry : this.categorizedChannels.entrySet()) {
                if (!entry.getValue().containsKey(n)) continue;
                entry.getValue().remove(n);
            }
        }
    }

    public Map<Integer, String> GetChannelList(String string) {
        if (this.categorizedChannels.containsKey(string)) {
            return this.categorizedChannels.get(string);
        }
        return null;
    }

    public String getChannelName(int n) {
        if (this.channelNames.containsKey(n)) {
            return this.channelNames.get(n);
        }
        return null;
    }

    public int getRandomFrequency() {
        return this.getRandomFrequency(88000, 108000);
    }

    public int getRandomFrequency(int n, int n2) {
        int n3 = 91100;
        do {
            n3 = Rand.Next((int)n, (int)n2);
            n3 /= 200;
        } while (this.knownFrequencies.contains(n3 *= 200));
        return n3;
    }

    public Map<String, Map<Integer, String>> getFullChannelList() {
        return this.categorizedChannels;
    }

    public void WriteRadioServerDataPacket(ByteBufferWriter byteBufferWriter) {
        byteBufferWriter.putInt(this.categorizedChannels.size());
        for (Map.Entry<String, Map<Integer, String>> entry : this.categorizedChannels.entrySet()) {
            GameWindow.WriteString((ByteBuffer)byteBufferWriter.bb, (String)entry.getKey());
            byteBufferWriter.putInt(entry.getValue().size());
            for (Map.Entry<Integer, String> entry2 : entry.getValue().entrySet()) {
                byteBufferWriter.putInt(entry2.getKey().intValue());
                GameWindow.WriteString((ByteBuffer)byteBufferWriter.bb, (String)entry2.getValue());
            }
        }
        byteBufferWriter.putByte(POST_RADIO_SILENCE ? (byte)1 : 0);
    }

    public void Init(int n) {
        POST_RADIO_SILENCE = false;
        boolean bl = false;
        boolean bl2 = DebugLog.isEnabled((DebugType)DebugType.Radio);
        if (bl2) {
            DebugLog.Radio.println("");
            DebugLog.Radio.println("################## Radio Init ##################");
        }
        RadioAPI.getInstance();
        recordedMedia.init();
        this.lastRecordedHour = GameTime.instance.getHour();
        GameMode gameMode = this.getGameMode();
        if (DEBUG_MODE && !gameMode.equals((Object)GameMode.Server)) {
            DebugLog.setLogEnabled((DebugType)DebugType.Radio, (boolean)true);
            this.debugConsole = new RadioDebugConsole();
        }
        if (gameMode.equals((Object)GameMode.Client)) {
            GameClient.sendRadioServerDataRequest();
            if (bl2) {
                DebugLog.Radio.println("Radio (Client) loaded.");
                DebugLog.Radio.println("################################################");
            }
            this.scriptManager = null;
            return;
        }
        this.scriptManager = RadioScriptManager.getInstance();
        this.scriptManager.init(n);
        try {
            if (!Core.getInstance().isNoSave()) {
                ZomboidFileSystem.instance.getFileInCurrentSave("radio", "data").mkdirs();
            }
            ArrayList arrayList = RadioData.fetchAllRadioData();
            for (RadioData radioData : arrayList) {
                for (RadioChannel radioChannel : radioData.getRadioChannels()) {
                    ZomboidRadio.ObfuscateChannelCheck(radioChannel);
                    RadioChannel radioChannel2 = null;
                    if (this.scriptManager.getChannels().containsKey(radioChannel.GetFrequency())) {
                        radioChannel2 = (RadioChannel)this.scriptManager.getChannels().get(radioChannel.GetFrequency());
                    }
                    if (radioChannel2 == null || radioChannel2.getRadioData().isVanilla() && !radioChannel.getRadioData().isVanilla()) {
                        this.scriptManager.AddChannel(radioChannel, true);
                        continue;
                    }
                    if (!bl2) continue;
                    DebugLog.Radio.println("Unable to add channel: " + radioChannel.GetName() + ", frequency '" + radioChannel.GetFrequency() + "' taken.");
                }
            }
            LuaEventManager.triggerEvent((String)"OnLoadRadioScripts", (Object)this.scriptManager, (Object)(n == -1 ? 1 : 0));
            if (n == -1) {
                if (bl2) {
                    DebugLog.Radio.println("Radio setting new game start times");
                }
                SandboxOptions sandboxOptions = SandboxOptions.instance;
                int n2 = sandboxOptions.TimeSinceApo.getValue() - 1;
                if (n2 < 0) {
                    n2 = 0;
                }
                if (bl2) {
                    DebugLog.log((DebugType)DebugType.Radio, (String)("Time since the apocalypse: " + sandboxOptions.TimeSinceApo.getValue()));
                }
                if (n2 > 0) {
                    this.DaysSinceStart = (int)((float)n2 * 30.5f);
                    if (bl2) {
                        DebugLog.Radio.println("Time since the apocalypse in days: " + this.DaysSinceStart);
                    }
                    this.scriptManager.simulateScriptsUntil(this.DaysSinceStart, true);
                }
                this.checkGameModeSpecificStart();
            } else {
                boolean bl3 = this.Load();
                if (!bl3) {
                    RadioData radioData;
                    radioData = SandboxOptions.instance;
                    int n3 = radioData.TimeSinceApo.getValue() - 1;
                    if (n3 < 0) {
                        n3 = 0;
                    }
                    this.DaysSinceStart = (int)((float)n3 * 30.5f);
                    this.DaysSinceStart += GameTime.instance.getNightsSurvived();
                }
                if (this.DaysSinceStart > 0) {
                    this.scriptManager.simulateScriptsUntil(this.DaysSinceStart, false);
                }
            }
            bl = true;
        }
        catch (Exception exception) {
            ExceptionLogger.logException((Throwable)exception);
        }
        if (!bl2) {
            return;
        }
        if (bl) {
            DebugLog.Radio.println("Radio loaded.");
        }
        DebugLog.Radio.println("################################################");
        DebugLog.Radio.println("");
    }

    private void checkGameModeSpecificStart() {
        block5: {
            block4: {
                if (!Core.GameMode.equals("Initial Infection")) break block4;
                for (Map.Entry entry : this.scriptManager.getChannels().entrySet()) {
                    RadioScript radioScript = ((RadioChannel)entry.getValue()).getRadioScript("init_infection");
                    if (radioScript != null) {
                        radioScript.clearExitOptions();
                        radioScript.AddExitOption(((RadioChannel)entry.getValue()).getCurrentScript().GetName(), 100, 0);
                        ((RadioChannel)entry.getValue()).setActiveScript("init_infection", this.DaysSinceStart);
                        continue;
                    }
                    ((RadioChannel)entry.getValue()).getCurrentScript().setStartDayStamp(this.DaysSinceStart + 1);
                }
                break block5;
            }
            if (!Core.GameMode.equals("Six Months Later")) break block5;
            for (Map.Entry entry : this.scriptManager.getChannels().entrySet()) {
                if (((RadioChannel)entry.getValue()).GetName().equals("Classified M1A1")) {
                    ((RadioChannel)entry.getValue()).setActiveScript("numbers", this.DaysSinceStart);
                    continue;
                }
                if (!((RadioChannel)entry.getValue()).GetName().equals("NNR Radio")) continue;
                ((RadioChannel)entry.getValue()).setActiveScript("pastor", this.DaysSinceStart);
            }
        }
    }

    public void Save() throws FileNotFoundException, IOException {
        File file;
        if (Core.getInstance().isNoSave()) {
            return;
        }
        GameMode gameMode = this.getGameMode();
        if ((gameMode.equals((Object)GameMode.Server) || gameMode.equals((Object)GameMode.SinglePlayer)) && this.scriptManager != null && (file = ZomboidFileSystem.instance.getFileInCurrentSave("radio", "data")).exists() && file.isDirectory()) {
            String string;
            Object object;
            String string2 = ZomboidFileSystem.instance.getFileNameInCurrentSave("radio", "data", SAVE_FILE);
            try {
                object = new StringWriter(1024);
                try {
                    ((StringWriter)object).write("DaysSinceStart = " + this.DaysSinceStart + System.lineSeparator());
                    ((StringWriter)object).write("LvObfuscation = " + LOUISVILLE_OBFUSCATION + System.lineSeparator());
                    this.scriptManager.Save((Writer)object);
                    string = ((StringWriter)object).toString();
                }
                finally {
                    ((StringWriter)object).close();
                }
            }
            catch (IOException iOException) {
                ExceptionLogger.logException((Throwable)iOException);
                return;
            }
            if (string2.equals(this.lastSaveFile) && string.equals(this.lastSaveContent)) {
                return;
            }
            this.lastSaveFile = string2;
            this.lastSaveContent = string;
            object = new File(string2);
            if (DebugLog.isEnabled((DebugType)DebugType.Radio)) {
                DebugLog.Radio.println("Saving radio: " + string2);
            }
            try (FileWriter fileWriter = new FileWriter((File)object, false);){
                fileWriter.write(string);
            }
            catch (Exception exception) {
                ExceptionLogger.logException((Throwable)exception);
            }
        }
        if (recordedMedia != null) {
            try {
                recordedMedia.save();
            }
            catch (Exception exception) {
                exception.printStackTrace();
            }
        }
    }

    /*
     * WARNING - Removed try catching itself - possible behaviour change.
     */
    public boolean Load() throws FileNotFoundException, IOException {
        boolean bl = false;
        GameMode gameMode = this.getGameMode();
        if (gameMode.equals((Object)GameMode.Server) || gameMode.equals((Object)GameMode.SinglePlayer)) {
            for (Map.Entry object2 : this.scriptManager.getChannels().entrySet()) {
                ((RadioChannel)object2.getValue()).setActiveScriptNull();
            }
            ArrayList arrayList = new ArrayList();
            String string = ZomboidFileSystem.instance.getFileNameInCurrentSave("radio", "data", SAVE_FILE);
            File file = new File(string);
            if (!file.exists()) {
                return false;
            }
            if (DebugLog.isEnabled((DebugType)DebugType.Radio)) {
                DebugLog.log((DebugType)DebugType.Radio, (String)("Loading radio save:" + string));
            }
            try (FileReader exception = new FileReader(file);
                 BufferedReader bufferedReader = new BufferedReader(exception);){
                String string2;
                while ((string2 = bufferedReader.readLine()) != null) {
                    if ((string2 = string2.trim()).startsWith("DaysSinceStart") || string2.startsWith("LvObfuscation")) {
                        String[] stringArray;
                        if (string2.startsWith("DaysSinceStart")) {
                            stringArray = string2.split("=");
                            this.DaysSinceStart = Integer.parseInt(stringArray[1].trim());
                        }
                        if (!string2.startsWith("LvObfuscation")) continue;
                        stringArray = string2.split("=");
                        LOUISVILLE_OBFUSCATION = Boolean.parseBoolean(stringArray[1].trim());
                        continue;
                    }
                    arrayList.add(string2);
                }
            }
            catch (Exception exception2) {
                exception2.printStackTrace();
                return false;
            }
            try {
                DebugLog.log((String)"Radio Loading channels...");
                this.scriptManager.Load((List)arrayList);
            }
            catch (Exception exception) {
                exception.printStackTrace();
                boolean bl2 = false;
                return bl2;
            }
            finally {
                bl = true;
            }
        }
        return bl;
    }

    public void Reset() {
        instance = null;
        if (this.scriptManager != null) {
            this.scriptManager.reset();
        }
    }

    public void UpdateScripts(int n, int n2) {
        GameMode gameMode = this.getGameMode();
        if (gameMode.equals((Object)GameMode.Server) || gameMode.equals((Object)GameMode.SinglePlayer)) {
            if (n == 0 && this.lastRecordedHour != 0) {
                ++this.DaysSinceStart;
            }
            this.lastRecordedHour = n;
            if (this.scriptManager != null) {
                this.scriptManager.UpdateScripts(this.DaysSinceStart, n, n2);
            }
            try {
                this.Save();
            }
            catch (Exception exception) {
                System.out.println(exception.getMessage());
            }
        }
        if (gameMode.equals((Object)GameMode.Client) || gameMode.equals((Object)GameMode.SinglePlayer)) {
            for (int i = 0; i < this.devices.size(); ++i) {
                WaveSignalDevice waveSignalDevice = this.devices.get(i);
                if (!waveSignalDevice.getDeviceData().getIsTurnedOn() || !waveSignalDevice.HasPlayerInRange()) continue;
                waveSignalDevice.getDeviceData().TriggerPlayerListening(true);
            }
        }
        if (gameMode.equals((Object)GameMode.Client) && !this.hasRecievedServerData) {
            GameClient.sendRadioServerDataRequest();
        }
    }

    public void render() {
        GameMode gameMode = this.getGameMode();
        if (DEBUG_MODE && !gameMode.equals((Object)GameMode.Server) && this.debugConsole != null) {
            this.debugConsole.render();
        }
        if (!gameMode.equals((Object)GameMode.Server) && this.storySoundManager != null) {
            this.storySoundManager.render();
        }
    }

    private void addFrequencyListEntry(boolean bl, DeviceData deviceData, int n, int n2) {
        if (deviceData == null) {
            return;
        }
        if (!this.freqlist.containsKey(deviceData.getChannel())) {
            this.freqlist.put(deviceData.getChannel(), new FreqListEntry(bl, deviceData, n, n2));
        } else if (this.freqlist.get((Object)Integer.valueOf((int)deviceData.getChannel())).deviceData.getTransmitRange() < deviceData.getTransmitRange()) {
            FreqListEntry freqListEntry = this.freqlist.get(deviceData.getChannel());
            freqListEntry.isInvItem = bl;
            freqListEntry.deviceData = deviceData;
            freqListEntry.sourceX = n;
            freqListEntry.sourceY = n2;
        }
    }

    public void update() {
        GameMode gameMode;
        this.LouisvilleObfuscationCheck();
        if (DEBUG_MODE && this.debugConsole != null) {
            this.debugConsole.update();
        }
        if (((gameMode = this.getGameMode()).equals((Object)GameMode.Server) || gameMode.equals((Object)GameMode.SinglePlayer)) && this.DaysSinceStart > 14 && !POST_RADIO_SILENCE) {
            POST_RADIO_SILENCE = true;
            if (GameServer.bServer) {
                GameServer.sendRadioPostSilence();
            }
        }
        if (!gameMode.equals((Object)GameMode.Server) && this.storySoundManager != null) {
            this.storySoundManager.update(this.DaysSinceStart, GameTime.instance.getHour(), GameTime.instance.getMinutes());
        }
        if ((gameMode.equals((Object)GameMode.Server) || gameMode.equals((Object)GameMode.SinglePlayer)) && this.scriptManager != null) {
            this.scriptManager.update();
        }
        if (gameMode.equals((Object)GameMode.SinglePlayer) || gameMode.equals((Object)GameMode.Client)) {
            for (int i = 0; i < IsoPlayer.numPlayers; ++i) {
                Object object;
                String string;
                IsoPlayer isoPlayer = IsoPlayer.players[i];
                if (isoPlayer == null || isoPlayer.getLastSpokenLine() == null || this.playerLastLine[i] != null && this.playerLastLine[i].equals(isoPlayer.getLastSpokenLine())) continue;
                this.playerLastLine[i] = string = isoPlayer.getLastSpokenLine();
                if (gameMode.equals((Object)GameMode.Client) && ((isoPlayer.accessLevel.equals("admin") || isoPlayer.accessLevel.equals("gm") || isoPlayer.accessLevel.equals("overseer") || isoPlayer.accessLevel.equals("moderator")) && (ServerOptions.instance.DisableRadioStaff.getValue() || ServerOptions.instance.DisableRadioAdmin.getValue() && isoPlayer.accessLevel.equals("admin") || ServerOptions.instance.DisableRadioGM.getValue() && isoPlayer.accessLevel.equals("gm") || ServerOptions.instance.DisableRadioOverseer.getValue() && isoPlayer.accessLevel.equals("overseer") || ServerOptions.instance.DisableRadioModerator.getValue() && isoPlayer.accessLevel.equals("moderator")) || ServerOptions.instance.DisableRadioInvisible.getValue() && isoPlayer.isInvisible())) continue;
                this.freqlist.clear();
                if (!GameClient.bClient && !GameServer.bServer) {
                    for (int j = 0; j < IsoPlayer.numPlayers; ++j) {
                        this.checkPlayerForDevice(IsoPlayer.players[j], isoPlayer);
                    }
                } else if (GameClient.bClient) {
                    object = GameClient.instance.getPlayers();
                    for (int j = 0; j < ((ArrayList)object).size(); ++j) {
                        this.checkPlayerForDevice((IsoPlayer)((ArrayList)object).get(j), isoPlayer);
                    }
                }
                for (WaveSignalDevice waveSignalDevice : this.broadcastDevices) {
                    if (waveSignalDevice == null || waveSignalDevice.getDeviceData() == null || !waveSignalDevice.getDeviceData().getIsTurnedOn() || !waveSignalDevice.getDeviceData().getIsTwoWay() || !waveSignalDevice.HasPlayerInRange() || waveSignalDevice.getDeviceData().getMicIsMuted() || this.GetDistance((int)isoPlayer.getX(), (int)isoPlayer.getY(), (int)waveSignalDevice.getX(), (int)waveSignalDevice.getY()) >= waveSignalDevice.getDeviceData().getMicRange()) continue;
                    this.addFrequencyListEntry(true, waveSignalDevice.getDeviceData(), (int)waveSignalDevice.getX(), (int)waveSignalDevice.getY());
                }
                if (this.freqlist.size() <= 0) continue;
                object = isoPlayer.getSpeakColour();
                for (Map.Entry<Integer, FreqListEntry> entry : this.freqlist.entrySet()) {
                    FreqListEntry freqListEntry = entry.getValue();
                    this.SendTransmission(freqListEntry.sourceX, freqListEntry.sourceY, entry.getKey(), this.playerLastLine[i], null, null, ((Color)object).r, ((Color)object).g, ((Color)object).b, freqListEntry.deviceData.getTransmitRange(), false);
                }
            }
        }
    }

    private void checkPlayerForDevice(IsoPlayer isoPlayer, IsoPlayer isoPlayer2) {
        Radio radio;
        boolean bl;
        boolean bl2 = bl = isoPlayer == isoPlayer2;
        if (isoPlayer != null && (radio = isoPlayer.getEquipedRadio()) != null && radio.getDeviceData() != null && radio.getDeviceData().getIsPortable() && radio.getDeviceData().getIsTwoWay() && radio.getDeviceData().getIsTurnedOn() && !radio.getDeviceData().getMicIsMuted() && (bl || this.GetDistance((int)isoPlayer2.getX(), (int)isoPlayer2.getY(), (int)isoPlayer.getX(), (int)isoPlayer.getY()) < radio.getDeviceData().getMicRange())) {
            this.addFrequencyListEntry(true, radio.getDeviceData(), (int)isoPlayer.getX(), (int)isoPlayer.getY());
        }
    }

    private boolean DeviceInRange(int n, int n2, int n3, int n4, int n5) {
        return n > n3 - n5 && n < n3 + n5 && n2 > n4 - n5 && n2 < n4 + n5 && Math.sqrt(Math.pow(n - n3, 2.0) + Math.pow(n2 - n4, 2.0)) < (double)n5;
    }

    private int GetDistance(int n, int n2, int n3, int n4) {
        return (int)Math.sqrt(Math.pow(n - n3, 2.0) + Math.pow(n2 - n4, 2.0));
    }

    /*
     * WARNING - Removed try catching itself - possible behaviour change.
     */
    private void DistributeToPlayerOnClient(IsoPlayer isoPlayer, int n, int n2, int n3, String string, String string2, String string3, float f, float f2, float f3, int n4, boolean bl) {
        if (isoPlayer != null && isoPlayer.getOnlineID() != -1) {
            VoiceManagerData voiceManagerData = VoiceManagerData.get((short)isoPlayer.getOnlineID());
            ArrayList arrayList = voiceManagerData.radioData;
            synchronized (arrayList) {
                for (VoiceManagerData.RadioData radioData : voiceManagerData.radioData) {
                    if (!radioData.isReceivingAvailable(n3)) continue;
                    this.DistributeToPlayerInternal(radioData.getDeviceData().getParent(), isoPlayer, n, n2, string, string2, string3, f, f2, f3, n4);
                }
            }
        }
    }

    private void DistributeToPlayer(IsoPlayer isoPlayer, int n, int n2, int n3, String string, String string2, String string3, float f, float f2, float f3, int n4, boolean bl) {
        Radio radio;
        if (isoPlayer != null && (radio = isoPlayer.getEquipedRadio()) != null && radio.getDeviceData() != null && radio.getDeviceData().getIsPortable() && radio.getDeviceData().getIsTurnedOn() && radio.getDeviceData().getChannel() == n3) {
            if (radio.getDeviceData().getDeviceVolume() <= 0.0f) {
                return;
            }
            if (radio.getDeviceData().isPlayingMedia() || radio.getDeviceData().isNoTransmit()) {
                return;
            }
            this.DistributeToPlayerInternal((WaveSignalDevice)radio, isoPlayer, n, n2, string, string2, string3, f, f2, f3, n4);
        }
    }

    private void DistributeToPlayerInternal(WaveSignalDevice waveSignalDevice, IsoPlayer isoPlayer, int n, int n2, String string, String string2, String string3, float f, float f2, float f3, int n3) {
        boolean bl = false;
        int n4 = -1;
        if (n3 < 0) {
            bl = true;
        } else {
            n4 = this.GetDistance((int)isoPlayer.getX(), (int)isoPlayer.getY(), n, n2);
            if (n4 > 3 && n4 < n3) {
                bl = true;
            }
        }
        if (bl) {
            if (n3 > 0) {
                this.hasAppliedRangeDistortion = false;
                string = this.doDeviceRangeDistortion(string, n3, n4);
            }
            if (!this.hasAppliedRangeDistortion) {
                waveSignalDevice.AddDeviceText(isoPlayer, string, f, f2, f3, string2, string3, n4);
            } else {
                waveSignalDevice.AddDeviceText(string, 0.5f, 0.5f, 0.5f, string2, string3, n4);
            }
        }
    }

    private void DistributeTransmission(int n, int n2, int n3, String string, String string2, String string3, float f, float f2, float f3, int n4, boolean bl) {
        int n5;
        if (!bl) {
            if (!GameClient.bClient && !GameServer.bServer) {
                for (n5 = 0; n5 < IsoPlayer.numPlayers; ++n5) {
                    this.DistributeToPlayer(IsoPlayer.players[n5], n, n2, n3, string, string2, string3, f, f2, f3, n4, bl);
                }
            } else if (GameClient.bClient) {
                for (IsoPlayer isoPlayer : IsoPlayer.players) {
                    this.DistributeToPlayerOnClient(isoPlayer, n, n2, n3, string, string2, string3, f, f2, f3, n4, bl);
                }
                return;
            }
        }
        if (this.devices.size() == 0) {
            return;
        }
        for (n5 = 0; n5 < this.devices.size(); ++n5) {
            WaveSignalDevice waveSignalDevice = this.devices.get(n5);
            if (waveSignalDevice == null || waveSignalDevice.getDeviceData() == null || !waveSignalDevice.getDeviceData().getIsTurnedOn() || bl != waveSignalDevice.getDeviceData().getIsTelevision()) continue;
            if (waveSignalDevice.getDeviceData().isPlayingMedia() || waveSignalDevice.getDeviceData().isNoTransmit()) {
                return;
            }
            if (n3 != waveSignalDevice.getDeviceData().getChannel()) continue;
            boolean bl2 = false;
            if (n4 == -1) {
                bl2 = true;
            } else if (n != (int)waveSignalDevice.getX() && n2 != (int)waveSignalDevice.getY()) {
                bl2 = true;
            }
            if (!bl2) continue;
            int n6 = -1;
            if (n4 > 0) {
                this.hasAppliedRangeDistortion = false;
                n6 = this.GetDistance((int)waveSignalDevice.getX(), (int)waveSignalDevice.getY(), n, n2);
                string = this.doDeviceRangeDistortion(string, n4, n6);
            }
            if (!this.hasAppliedRangeDistortion) {
                waveSignalDevice.AddDeviceText(string, f, f2, f3, string2, string3, n6);
                continue;
            }
            waveSignalDevice.AddDeviceText(string, 0.5f, 0.5f, 0.5f, string2, string3, n6);
        }
    }

    private String doDeviceRangeDistortion(String string, int n, int n2) {
        float f = (float)n * 0.9f;
        if (f < (float)n && (float)n2 > f) {
            float f2 = 100.0f * (((float)n2 - f) / ((float)n - f));
            string = this.scrambleString(string, (int)f2, false);
            this.hasAppliedRangeDistortion = true;
        }
        return string;
    }

    public GameMode getGameMode() {
        if (!GameClient.bClient && !GameServer.bServer) {
            return GameMode.SinglePlayer;
        }
        if (GameServer.bServer) {
            return GameMode.Server;
        }
        return GameMode.Client;
    }

    public String getRandomBzztFzzt() {
        int n = Rand.Next((int)staticSounds.length);
        return staticSounds[n];
    }

    private String applyWeatherInterference(String string, int n) {
        if (ClimateManager.getInstance().getWeatherInterference() <= 0.0f) {
            return string;
        }
        int n2 = (int)(ClimateManager.getInstance().getWeatherInterference() * 100.0f);
        return this.scrambleString(string, n2, n == -1);
    }

    private String scrambleString(String string, int n, boolean bl) {
        return this.scrambleString(string, n, bl, null);
    }

    public String scrambleString(String string, int n, boolean bl, String string2) {
        ZomboidRadio zomboidRadio = this;
        return string;
    }

    public void ReceiveTransmission(int n, int n2, int n3, String string, String string2, String string3, float f, float f2, float f3, int n4, boolean bl) {
        GameMode gameMode = this.getGameMode();
        if (gameMode.equals((Object)GameMode.Server)) {
            this.SendTransmission(n, n2, n3, string, string2, string3, f, f2, f3, n4, bl);
        } else {
            this.DistributeTransmission(n, n2, n3, string, string2, string3, f, f2, f3, n4, bl);
        }
    }

    public void SendTransmission(int n, int n2, ChatMessage chatMessage, int n3) {
        Color color = chatMessage.getTextColor();
        int n4 = chatMessage.getRadioChannel();
        this.SendTransmission(n, n2, n4, chatMessage.getText(), null, null, color.r, color.g, color.b, n3, false);
    }

    public void SendTransmission(int n, int n2, int n3, String string, String string2, String string3, float f, float f2, float f3, int n4, boolean bl) {
        this.SendTransmission(-1L, n, n2, n3, string, string2, string3, f, f2, f3, n4, bl);
    }

    public void SendTransmission(long l, int n, int n2, int n3, String string, String string2, String string3, float f, float f2, float f3, int n4, boolean bl) {
        GameMode gameMode = this.getGameMode();
        if (!(bl || gameMode != GameMode.Server && gameMode != GameMode.SinglePlayer)) {
            this.hasAppliedInterference = false;
            string = this.applyWeatherInterference(string, n4);
            if (this.hasAppliedInterference) {
                f = 0.5f;
                f2 = 0.5f;
                f3 = 0.5f;
                string3 = "";
            }
        }
        if (gameMode.equals((Object)GameMode.SinglePlayer)) {
            this.ReceiveTransmission(n, n2, n3, string, string2, string3, f, f2, f3, n4, bl);
        } else if (gameMode.equals((Object)GameMode.Server)) {
            GameServer.sendIsoWaveSignal((long)l, (int)n, (int)n2, (int)n3, (String)string, (String)string2, (String)string3, (float)f, (float)f2, (float)f3, (int)n4, (boolean)bl);
        } else if (gameMode.equals((Object)GameMode.Client)) {
            GameClient.sendIsoWaveSignal((int)n, (int)n2, (int)n3, (String)string, (String)string2, (String)string3, (float)f, (float)f2, (float)f3, (int)n4, (boolean)bl);
        }
    }

    public void PlayerListensChannel(int n, boolean bl, boolean bl2) {
        GameMode gameMode = this.getGameMode();
        if (gameMode.equals((Object)GameMode.SinglePlayer) || gameMode.equals((Object)GameMode.Server)) {
            if (this.scriptManager != null) {
                this.scriptManager.PlayerListensChannel(n, bl, bl2);
            }
        } else if (gameMode.equals((Object)GameMode.Client)) {
            GameClient.sendPlayerListensChannel((int)n, (boolean)bl, (boolean)bl2);
        }
    }

    public void RegisterDevice(WaveSignalDevice waveSignalDevice) {
        if (waveSignalDevice == null) {
            return;
        }
        if (!GameServer.bServer && !this.devices.contains(waveSignalDevice)) {
            this.devices.add(waveSignalDevice);
        }
        if (!GameServer.bServer && waveSignalDevice.getDeviceData().getIsTwoWay() && !this.broadcastDevices.contains(waveSignalDevice)) {
            this.broadcastDevices.add(waveSignalDevice);
        }
    }

    public void UnRegisterDevice(WaveSignalDevice waveSignalDevice) {
        if (waveSignalDevice == null) {
            return;
        }
        if (!GameServer.bServer && this.devices.contains(waveSignalDevice)) {
            this.devices.remove(waveSignalDevice);
        }
        if (!GameServer.bServer && waveSignalDevice.getDeviceData().getIsTwoWay() && this.broadcastDevices.contains(waveSignalDevice)) {
            this.broadcastDevices.remove(waveSignalDevice);
        }
    }

    public Object clone() {
        return null;
    }

    public String computerize(String string) {
        StringBuilder stringBuilder = this.stringBuilder;
        stringBuilder.setLength(0);
        for (char c : string.toCharArray()) {
            if (Character.isLetter(c)) {
                stringBuilder.append(Rand.NextBool((int)2) ? Character.toLowerCase(c) : Character.toUpperCase(c));
                continue;
            }
            stringBuilder.append(c);
        }
        return stringBuilder.toString();
    }

    public RecordedMedia getRecordedMedia() {
        return recordedMedia;
    }

    public void setDisableBroadcasting(boolean bl) {
        DISABLE_BROADCASTING = bl;
    }

    public boolean getDisableBroadcasting() {
        return DISABLE_BROADCASTING;
    }

    public void setDisableMediaLineLearning(boolean bl) {
        RecordedMedia.DISABLE_LINE_LEARNING = bl;
    }

    public boolean getDisableMediaLineLearning() {
        return RecordedMedia.DISABLE_LINE_LEARNING;
    }

    private void LouisvilleObfuscationCheck() {
        if (GameClient.bClient || GameServer.bServer) {
            return;
        }
        IsoPlayer isoPlayer = IsoPlayer.getInstance();
        if (isoPlayer != null && isoPlayer.getY() < 3550.0f) {
            LOUISVILLE_OBFUSCATION = true;
        }
    }

    public static void ObfuscateChannelCheck(RadioChannel radioChannel) {
        if (!radioChannel.isVanilla()) {
            return;
        }
        int n = radioChannel.GetFrequency();
        for (int i = 0; i < obfuscateChannels.length; ++i) {
            if (n != obfuscateChannels[i]) continue;
            radioChannel.setLouisvilleObfuscate(true);
        }
    }

    static {
        LOUISVILLE_OBFUSCATION = false;
        obfuscateChannels = new int[]{200, 201, 204, 93200, 98000, 101200};
    }
}
