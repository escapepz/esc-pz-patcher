# ⚠️ Chunk Grid Width Desynchronization Warning

## Issue

The `chunkGridWidth` setting controls **CLIENT-SIDE rendering only**. The SERVER continues simulating all chunks regardless of this setting.

### Server vs Client Behavior

| Component   | Behavior                                                         |
| ----------- | ---------------------------------------------------------------- |
| **Server**  | Simulates ALL chunks, ALL zombies, ALL world events              |
| **Client**  | Only loads/renders chunks within `chunkGridWidth` grid           |
| **Network** | Server sends updates for ALL chunks, client ignores distant ones |

## Desynchronization Scenarios

### 1. Invisible Zombies Attack

- **Scenario**: Server has zombie 100 tiles away
- **Client Setting**: 3×3 (24 tile radius)
- **Result**: Server updates zombie position, client doesn't load chunk → zombie attacks but stays invisible

### 2. Item Desync

- **Scenario**: NPC picks up item in unloaded chunk
- **Client Setting**: 5×5 (40 tile radius)
- **Result**: Server inventory updated, client doesn't know about it

### 3. Multiplayer Action Desync

- **Scenario**: Player B shoots gun in unloaded chunk from Player A's perspective
- **Client Setting**: 7×7
- **Result**: Player A hears gunshot but sees nothing, AI acts on it but player confused

### 4. Position Validation Mismatch

- **Server**: Player character is valid in all chunks
- **Client**: Player only valid in loaded chunks
- **Result**: Combat/damage calculation conflicts

## Risk Level by Grid Size

| Grid Size | Tile Radius | Risk Level  | Safe For                               |
| --------- | ----------- | ----------- | -------------------------------------- |
| 5×5       | 40 tiles    | 🔴 SEVERE   | Single-player low-end only             |
| 7×7       | 56 tiles    | 🟠 HIGH     | Single-player with caution             |
| 9×9       | 72 tiles    | 🟡 MODERATE | Single-player acceptable               |
| 11×11     | 88 tiles    | 🟢 LOW      | Most use cases                         |
| 13×13     | 104 tiles   | 🟢 SAFE     | Default, multiplayer safe, recommended |
| 15×15     | 120 tiles   | 🟡 HIGH CPU | High-end PCs only                      |
| 17×17     | 136 tiles   | 🟡 HIGH CPU | Very high-end only                     |
| 19×19     | 152 tiles   | 🟡 HIGH CPU | Vanilla max (1080p dynamic)            |
| 21×21     | 168 tiles   | 🔴 EXTREME  | Beyond vanilla, not recommended        |
| 23×23     | 184 tiles   | 🔴 EXTREME  | Beyond vanilla, not recommended        |
| 25×25     | 200 tiles   | 🔴 EXTREME  | Beyond vanilla (max cap)               |
| Dynamic   | Variable    | 🟡 Vanilla  | Auto-scales (max 19)                   |

## Configuration Methods

### Via ModOptions UI

Players can configure chunk grid size in game settings under "ESC PZ Patcher" → "Chunk Grid Size":

- Options: Dynamic, 5×5, 7×7, 9×9, 11×11, 13×13, 15×15, 17×17, 19×19, 21×21, 23×23, 25×25
- Applied on next game restart
- Stored in ModOptions config

### Via Lua Code

```lua
-- Fixed size (requires restart)
IsoChunkMap.setDynamicChunkGridWidth(width)

-- Reset to dynamic auto-calc (requires restart)
IsoChunkMap.resetDynamicChunkGridWidth()

-- Check current setting
local width = IsoChunkMap.getDynamicChunkGridWidth()
```

## Recommendations

### ✅ Safe Configurations

- **Multiplayer (Server/Client)**: Dynamic (default) or 13×13 (safe upper limit)
- **Single-player**: Dynamic recommended, up to 13×13 safe
- **4K Monitor**: Dynamic mode (auto-detects optimal size 4.2-19)
- **High-end PC (i7+, 16GB+ RAM)**: Up to 15×15

### ❌ Dangerous Configurations

- **Never use 5×5 or 7×7 in multiplayer** (zombie desync risk)
- **Never use 15×15+ on servers** (server load increases ~25x per size jump)
- **Avoid 17×19+ unless testing** (extreme performance impact, not well-tested)

## Mitigation

If using strict chunk grid in single-player:

1. Keep difficulty low (fewer zombie calculations)
2. Avoid PvP mods
3. Test thoroughly before long sessions
4. Monitor for zombies appearing instantly

## Important Notes

- **Changes take effect on game restart** - Modifying chunk grid size requires closing and relaunching the game
- **Multiplayer Safety** - Stay at 13×13 or below on multiplayer servers to avoid zombie desync issues
- **Dynamic Mode Recommended** - The "Dynamic" option automatically adjusts based on your screen resolution and is safest for most players
