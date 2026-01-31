package zombie.core.textures;

import java.util.ArrayList;
import zombie.GameTime;
import zombie.IndieGL;
import zombie.characters.IsoPlayer;
import zombie.core.Core;
import zombie.core.PerformanceSettings;
import zombie.core.SpriteRenderer;
import zombie.core.opengl.Shader;
import zombie.core.textures.Texture;
import zombie.core.textures.TextureFBO;
import zombie.core.utils.ImageUtils;
import zombie.debug.DebugLog;
import zombie.interfaces.ITexture;
import zombie.iso.IsoCamera;
import zombie.iso.IsoGridSquare;
import zombie.iso.IsoUtils;
import zombie.iso.PlayerCamera;
import zombie.iso.sprite.IsoCursor;
import zombie.network.GameServer;
import zombie.network.ServerGUI;
import zombie.util.Type;

public final class MultiTextureFBO2 {
    private final float[] zoomLevelsDefault = new float[]{4.0f, 3.0f, 2.5f, 2.25f, 2.0f, 1.75f, 1.5f, 1.25f, 1.0f, 0.75f, 0.5f, 0.25f};
    private float[] zoomLevels;
    public TextureFBO Current;
    public volatile TextureFBO FBOrendered = null;
    public final float[] zoom = new float[4];
    public final float[] targetZoom = new float[4];
    public final float[] startZoom = new float[4];
    private float zoomedInLevel;
    private float zoomedOutLevel;
    public final boolean[] bAutoZoom = new boolean[4];
    public boolean bZoomEnabled = true;

    public MultiTextureFBO2() {
        DebugLog.log((String)("PATCHED: MultiTextureFBO2"));
        for (int i = 0; i < 4; ++i) {
            this.startZoom[i] = 1.0f;
            this.targetZoom[i] = 1.0f;
            this.zoom[i] = 1.0f;
        }
    }

    public int getWidth(int n) {
        return (int)((float)IsoCamera.getScreenWidth((int)n) * this.zoom[n] * ((float)Core.TileScale / 2.0f));
    }

    public int getHeight(int n) {
        return (int)((float)IsoCamera.getScreenHeight((int)n) * this.zoom[n] * ((float)Core.TileScale / 2.0f));
    }

    public void setTargetZoom(int n, float f) {
        if (this.targetZoom[n] != f) {
            this.targetZoom[n] = f;
            this.startZoom[n] = this.zoom[n];
        }
    }

    public ArrayList<Integer> getDefaultZoomLevels() {
        ArrayList<Integer> arrayList = new ArrayList<Integer>();
        float[] fArray = this.zoomLevelsDefault;
        for (int i = 0; i < fArray.length; ++i) {
            arrayList.add(Math.round(fArray[i] * 100.0f));
        }
        return arrayList;
    }

    public void setZoomLevelsFromOption(String string) {
        this.zoomLevels = this.zoomLevelsDefault;
        if (string == null || string.isEmpty()) {
            return;
        }
        String[] stringArray = string.split(";");
        if (stringArray.length == 0) {
            return;
        }
        ArrayList<Integer> arrayList = new ArrayList<Integer>();
        block2: for (String string2 : stringArray) {
            if (string2.isEmpty()) continue;
            try {
                int n3 = Integer.parseInt(string2);
                for (float f : this.zoomLevels) {
                    if (Math.round(f * 100.0f) != n3) continue;
                    if (arrayList.contains(n3)) continue block2;
                    arrayList.add(n3);
                    continue block2;
                }
            }
            catch (NumberFormatException numberFormatException) {
                // empty catch block
            }
        }
        if (!arrayList.contains(100)) {
            arrayList.add(100);
        }
        arrayList.sort((n, n2) -> n2 - n);
        this.zoomLevels = new float[arrayList.size()];
        for (int i = 0; i < arrayList.size(); ++i) {
            int n4 = IsoPlayer.getPlayerIndex();
            this.zoomLevels[i] = Core.getInstance().getOffscreenHeight(n4) > 1440 ? (float)((Integer)arrayList.get(i)).intValue() / 100.0f - 0.25f : (float)((Integer)arrayList.get(i)).intValue() / 100.0f;
        }
    }

    public void destroy() {
        if (this.Current == null) {
            return;
        }
        this.Current.destroy();
        this.Current = null;
        this.FBOrendered = null;
        for (int i = 0; i < 4; ++i) {
            this.targetZoom[i] = 1.0f;
            this.zoom[i] = 1.0f;
        }
    }

    public void create(int n, int n2) throws Exception {
        if (!this.bZoomEnabled) {
            return;
        }
        if (this.zoomLevels == null) {
            this.zoomLevels = this.zoomLevelsDefault;
        }
        this.zoomedInLevel = this.zoomLevels[this.zoomLevels.length - 1];
        this.zoomedOutLevel = this.zoomLevels[0];
        int n3 = ImageUtils.getNextPowerOfTwoHW((int)n);
        int n4 = ImageUtils.getNextPowerOfTwoHW((int)n2);
        this.Current = this.createTexture(n3, n4, false);
    }

    public void update() {
        float f;
        int n = IsoPlayer.getPlayerIndex();
        if (!this.bZoomEnabled) {
            this.targetZoom[n] = 1.0f;
            this.zoom[n] = 1.0f;
        }
        if (this.bAutoZoom[n] && IsoCamera.CamCharacter != null && this.bZoomEnabled) {
            f = IsoUtils.DistanceTo((float)IsoCamera.getRightClickOffX(), (float)IsoCamera.getRightClickOffY(), (float)0.0f, (float)0.0f);
            float f2 = f / 300.0f;
            if (f2 > 1.0f) {
                f2 = 1.0f;
            }
            float f3 = this.shouldAutoZoomIn() ? this.zoomedInLevel : this.zoomedOutLevel;
            if ((f3 += f2) > this.zoomLevels[0]) {
                f3 = this.zoomLevels[0];
            }
            if (IsoCamera.CamCharacter.getVehicle() != null) {
                f3 = this.getMaxZoom();
            }
            this.setTargetZoom(n, f3);
        }
        f = 0.004f * GameTime.instance.getMultiplier() / GameTime.instance.getTrueMultiplier() * (Core.TileScale == 2 ? 1.5f : 1.5f);
        if (!this.bAutoZoom[n]) {
            f *= 5.0f;
        } else if (this.targetZoom[n] > this.zoom[n]) {
            f *= 1.0f;
        }
        if (this.targetZoom[n] > this.zoom[n]) {
            int n2 = n;
            this.zoom[n2] = this.zoom[n2] + f;
            IsoPlayer.players[n].dirtyRecalcGridStackTime = 2.0f;
            if (this.zoom[n] > this.targetZoom[n] || Math.abs(this.zoom[n] - this.targetZoom[n]) < 0.001f) {
                this.zoom[n] = this.targetZoom[n];
            }
        }
        if (this.targetZoom[n] < this.zoom[n]) {
            int n3 = n;
            this.zoom[n3] = this.zoom[n3] - f;
            IsoPlayer.players[n].dirtyRecalcGridStackTime = 2.0f;
            if (this.zoom[n] < this.targetZoom[n] || Math.abs(this.zoom[n] - this.targetZoom[n]) < 0.001f) {
                this.zoom[n] = this.targetZoom[n];
            }
        }
        this.setCameraToCentre();
    }

    private boolean shouldAutoZoomIn() {
        if (IsoCamera.CamCharacter == null) {
            return false;
        }
        IsoGridSquare isoGridSquare = IsoCamera.CamCharacter.getCurrentSquare();
        if (isoGridSquare != null && !isoGridSquare.isOutside()) {
            return true;
        }
        IsoPlayer isoPlayer = (IsoPlayer)Type.tryCastTo((Object)IsoCamera.CamCharacter, IsoPlayer.class);
        if (isoPlayer == null) {
            return false;
        }
        if (isoPlayer.isRunning() || isoPlayer.isSprinting()) {
            return false;
        }
        if (isoPlayer.closestZombie < 6.0f && isoPlayer.isTargetedByZombie()) {
            return true;
        }
        return isoPlayer.lastTargeted < (float)(PerformanceSettings.getLockFPS() * 4);
    }

    private void setCameraToCentre() {
        PlayerCamera playerCamera = IsoCamera.cameras[IsoPlayer.getPlayerIndex()];
        playerCamera.center();
    }

    private TextureFBO createTexture(int n, int n2, boolean bl) {
        if (bl) {
            Texture texture = new Texture(n, n2, 16);
            TextureFBO textureFBO = new TextureFBO((ITexture)texture);
            textureFBO.destroy();
            return null;
        }
        Texture texture = new Texture(n, n2, 19);
        return new TextureFBO((ITexture)texture);
    }

    public void render() {
        int n;
        if (this.Current == null) {
            return;
        }
        int n2 = 0;
        for (n = 3; n >= 0; --n) {
            if (IsoPlayer.players[n] == null) continue;
            n2 = n > 1 ? 3 : n;
            break;
        }
        n2 = Math.max(n2, IsoPlayer.numPlayers - 1);
        for (n = 0; n <= n2; ++n) {
            if (Core.getInstance().RenderShader != null) {
                IndieGL.StartShader((Shader)Core.getInstance().RenderShader, (int)n);
            }
            int n3 = IsoCamera.getScreenLeft((int)n);
            int n4 = IsoCamera.getScreenTop((int)n);
            int n5 = IsoCamera.getScreenWidth((int)n);
            int n6 = IsoCamera.getScreenHeight((int)n);
            if (!(IsoPlayer.players[n] != null || GameServer.bServer && ServerGUI.isCreated())) {
                SpriteRenderer.instance.renderi(null, n3, n4, n5, n6, 0.0f, 0.0f, 0.0f, 1.0f, null);
                continue;
            }
            ((Texture)this.Current.getTexture()).rendershader2((float)n3, (float)n4, (float)n5, (float)n6, n3, n4, n5, n6, 1.0f, 1.0f, 1.0f, 1.0f);
        }
        if (Core.getInstance().RenderShader != null) {
            IndieGL.EndShader();
        }
        IsoCursor.getInstance().render(0);
    }

    public TextureFBO getCurrent(int n) {
        return this.Current;
    }

    public Texture getTexture(int n) {
        return (Texture)this.Current.getTexture();
    }

    public void doZoomScroll(int n, int n2) {
        this.targetZoom[n] = this.getNextZoom(n, n2);
    }

    public float getNextZoom(int n, int n2) {
        block4: {
            block3: {
                if (!this.bZoomEnabled || this.zoomLevels == null) {
                    return 1.0f;
                }
                if (n2 <= 0) break block3;
                for (int i = this.zoomLevels.length - 1; i > 0; --i) {
                    if (this.targetZoom[n] != this.zoomLevels[i]) continue;
                    return this.zoomLevels[i - 1];
                }
                break block4;
            }
            if (n2 >= 0) break block4;
            for (int i = 0; i < this.zoomLevels.length - 1; ++i) {
                if (this.targetZoom[n] != this.zoomLevels[i]) continue;
                return this.zoomLevels[i + 1];
            }
        }
        return this.targetZoom[n];
    }

    public float getMinZoom() {
        if (!this.bZoomEnabled || this.zoomLevels == null || this.zoomLevels.length == 0) {
            return 1.0f;
        }
        return this.zoomLevels[this.zoomLevels.length - 1];
    }

    public float getMaxZoom() {
        if (!this.bZoomEnabled || this.zoomLevels == null || this.zoomLevels.length == 0) {
            return 1.0f;
        }
        return this.zoomLevels[0];
    }

    public boolean test() {
        try {
            this.createTexture(16, 16, true);
        }
        catch (Exception exception) {
            DebugLog.General.error((Object)"Failed to create Test FBO");
            exception.printStackTrace();
            Core.SafeMode = true;
            return false;
        }
        return true;
    }
}
