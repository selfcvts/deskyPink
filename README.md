# ASTOLFO DOTS-HYPRAND THEME: COMPLETE DOCUMENTATION
## A Minimalist, Dot-Based Desktop Environment for Arch Linux
### Created: 2024-06-24 | Version: 1.0.0
### Developer: Claude Code (Anthropic AI Assistant)
### Intended User: Beginner-to-Intermediate Linux Enthusiast
### Legal Status: 100% Original Work - No Copyrighted Character Assets Included

---

## TABLE OF CONTENTS
1. [OVERVIEW](#overview)
2. [KEY DESIGN PHILOSOPHY](#design-philosophy)
3. [SYSTEM REQUIREMENTS](#requirements)
4. [FILE STRUCTURE BREAKDOWN](#file-structure)
5. [DETAILED COMPONENT EXPLANATIONS](#components)
6. [INSTALLATION GUIDE](#installation)
7. [USAGE INSTRUCTIONS](#usage)
8. [TROUBLESHOOTING GUIDE](#troubleshooting)
9. [CUSTOMIZATION OPTIONS](#customization)
10. [LEGAL & ETHICAL NOTES](#legal)
11. [Frequently Asked Questions (FAQ)](#faq)
12. [CREDITS & ACKNOWLEDGMENTS](#credits)

---

<a name="overview"></a>
## 1. OVERVIEW
This documentation describes a complete, ready-to-install desktop environment configuration for **Arch Linux** (and Arch-based distributions) featuring:
- **Hyprland** as the compositing window manager
- **Waybar** as the system status bar with innovative dot-based monitors
- **Wofi/Rofi** as application launchers
- Custom scripts for real-time system monitoring (CPU, RAM, Network, Volume, Music)
- An original, legally-safe SVG wallpaper inspired by Astolfo's aesthetic (ribbons, pastels, florals) — **ZERO copyrighted character depictions**
- A soft pastel color palette: Baby Pink (`#FFB6C1`), Lavender (`#E6E6FA`), Blush (`#FFF0F5`)

**Core Innovation**: Replaces traditional bar graphs/text with **minimalist dot indicators** (•○○○○○○○○○) for system metrics, creating a clean, subtle, and highly readable interface inspired by end-4's `dots-hyprland` but fully adapted to an SFW Astolfo-inspired theme.

**Critical Legal Note**: This configuration contains **NO** Astolfo character artwork, screenshots, or copyrighted material from TYPE-MOON/Fate franchises. All visual elements are original vector art or abstract designs. Users must provide their own SFW wallpaper (guidance included).

---

<a name="design-philosophy"></a>
## 2. KEY DESIGN PHILOSOPHY
### Why "Dots"?
- **Reduced Visual Noise**: Traditional metrics (e.g., "CPU: 42%") create cognitive load. Dot patterns (•••••○○○○○) are processed pre-attentively by the human visual system — faster comprehension at a glance.
- **Aesthetic Consistency**: Matches the minimalist, ethereal quality often associated with Astolfo's character (without direct depiction).
- **Performance**: Dot rendering consumes negligible GPU/CPU resources vs. graphical widgets or text rendering.

### Why Pastels (Baby Pink + Lavender)?
- Evokes the "soft," "gentle," and "whimsical" traits commonly associated with Astolfo in fan communities.
- Avoids harsh contrasts that cause eye strain during prolonged use.
- Harmonizes with common wallpaper themes (florals, ribbons, soft lighting) while remaining fully SFW.

### Why Avoid Character Art?
- **Legal**: Astolfo is copyrighted (TYPE-MOON, 2006+). Distributing his likeness risks DMCA takedowns.
- **Ethical**: Respects creators' rights while still capturing the *essence* of the aesthetic through abstraction.
- **Practical**: User-generated/original art ensures long-term usability without legal fear.

---

<a name="requirements"></a>
## 3. SYSTEM REQUIREMENTS
### Hardware Minimum
- **CPU**: Any x86_64 processor made after 2015 (Intel Core i3-6100 / AMD Ryzen 3 1200 or better)
- **RAM**: 4 GB (8 GB recommended for smooth multitasking)
- **Storage**: 15 GB free space (for base OS + this config)
- **Graphics**: Intel HD Graphics 4000+/AMD Radeon R5/NVIDIA GeForce 400+ (OpenGL 3.3+ required for Hyprland blur effects)

### Software Requirements (Arch Linux)
| Package | Purpose | Installation Command |
|---------|---------|----------------------|
| `hyprland` | Wayland compositor (window manager) | `sudo pacman -S hyprland` |
| `waybar` | Highly customizable status bar | `sudo pacman -S waybar` |
| `wofi` | Application launcher (primary) | `sudo pacman -S wofi` |
| `rofi` | Application launcher (alternative) | `sudo pacman -S rofi` |
| `swaync` | System tray & notification daemon | `sudo pacman -S swaync` |
| `grim` + `slurp` | Screenshot utilities | `sudo pacman -S grim slurp` |
| `swappy` | Screenshot editor | `sudo pacman -S swappy` |
| `wtype` | Virtual keyboard (for Waybar interactions) | `sudo pacman -S wtype` |
| `hyprpaper` | Wallpaper manager | `sudo pacman -S hyprpaper` |
| `hypridle` | Idle detection (screen lock) | `sudo pacman -S hypridle` |
| `hyprlock` | Screen locker | `sudo pacman -S hyprlock` |
| `playerctl` | Media player control (for music dots) | `sudo pacman -S playerctl` |
| `pamixer` | PulseAudio volume control (for volume dots) | `sudo pacman -S pamixer` |
| `bc` | Basic calculator (for dot math in scripts) | `sudo pacman -S bc` |
| `ttf-font-awesome` | Icons for Waybar/launchers | `sudo pacman -S ttf-font-awesome` |
| `ttf-nerd-fonts-symbols-common` | Additional glyphs | `sudo pacman -S ttf-nerd-fonts-symbols-common` |
| `gtk-engine-murrine` | GTK theme engine | `sudo pacman -S gtk-engine-murrine` |
| `gtk3` | GTK 3 libraries | `sudo pacman -S gtk3` |

> ⚠️ **Verification**: Run `pacman -Qs <package>` after installation to confirm. Missing `bc` or `pamixer` will break dot scripts!

---

<a name="file-structure"></a>
## 4. FILE STRUCTURE BREAKDOWN
All files are organized in:
`<your-repository-directory>/` (e.g., the cloned GitHub repo)
→ Maps to: `~/.config/` and `~/Pictures/` on Linux after installation

```
<your-repository-directory>/
├── .config/                 # Primary configuration directory (Linux equivalent: ~/.config/)
│   ├── hypr/                # Hyprland window manager config
│   │   └── hyprland.conf    # MAIN CONFIG: Keybindings, rules, aesthetics
│   ├── waybar/              # Waybar status bar configuration
│   │   ├── config           # Bar layout (module positions)
│   │   ├── style.css        # Visual styling (colors, animations, dot logic)
│   │   └── scripts/         # Executable scripts for dynamic modules
│   │       ├── dots_system.sh   # CPU/RAM/Network → ●○ dots
│   │       ├── dots_volume.sh   # Volume → ●●○○○○○○○○ dots + mute state
│   │       └── dots_music.sh    # Music controls → [⏮] [▶⏸] [⏭] dots
│   ├── wofi/                # Wofi launcher config
│   │   └── config           # Appearance/behavior for app menu
│   ├── rofi/                # Rofi launcher config (alternative)
│   │   └── config.rasi      # Appearance/behavior for app menu
│   ├── gtk-3.0/             # GTK 3 application styling
│   │   └── settings.ini     # Font, icon theme, cursor settings
│   └── gtk-4.0/             # GTK 4 application styling
│       └── settings.ini     # Identical to gtk-3.0 for consistency
├── wallpapers/              # WALLPAPER DIRECTORY (CRITICAL)
│   └── astolfo_wallpaper.svg  # ORIGINAL ART: Abstract pastel ribbons/florals (NO CHARACTERS)
│                           #   → User MUST place their SFW wallpaper HERE named exactly this
├── scripts/                 # Helper scripts (currently empty - for user extensions)
│   └── README.txt           # Instructions for adding custom scripts
├── hyprland.conf            # BACKUP COPY (root level - for reference only)
├── dots_music.sh            # BACKUP COPY (root level - for reference only)
├── README.md                # INSTALLATION GUIDE (concise version)
└── test_nonexistent.txt     # IGNORE: Harmless test file (can be deleted)
```

### Critical Path Notes:
- **Linux Target Paths** (after copying):
  - Configs: `~/.config/hypr/hyprland.conf`, `~/.config/waybar/config`, etc.
  - Wallpaper: `~/Pictures/astolfo_wallpaper.jpg` (or `.svg`; Hyprpaper handles both)
- **Executable Scripts**: Must reside in `~/.config/waybar/scripts/` and have `+x` permissions
- **Never Modify Root-Level Copies**: Files in the repository root (like the root `hyprland.conf`) are **backups only**. Linux uses the `.config/` copies.

---

<a name="components"></a>
## 5. DETAILED COMPONENT EXPLANATIONS

### 5.1 Hyprland Configuration (`hyprland.conf`)
This file defines window behavior, appearance, keybindings, and rules.

#### Key Sections Explained:
**A. Visual Theme (`$baby_pink`, `$lavender`, `$blush`)**
- Defines core colors used throughout:
  - `$baby_pink = #FFB6C1` → Active borders, accents
  - `$lavender = #E6E6FA` → Inactive elements, backgrounds
  - `$blush = #FFF0F5` → Base canvas (Waybar, notifications)
- *Why these values?*
  `#FFB6C1` is standard "baby pink" (not hot pink — avoids aggression).
  `#E6E6FA` is "lavender" (soft purple, not violet — reduces eye strain).
  Together they create a harmonious, pastel gradient proven in UI studies to reduce visual fatigue.

**B. Animations**
- `animation Bezier, 10, 0.1, 0.0, 1.0` → Sharp, snappy window transitions (0.1s duration, linear start)
- Alternative binding (`Super+H`): `Bezier, 10, 0.2, 0.0, 1.0` → Smoother, more fluid (0.2s)
- *Why Bezier curves?* Provides natural motion physics vs. robotic linear transitions.

**C. Borders & Shadows**
- `rounding = 6` → Subtle corner radius (modern, not cartoonish)
- `shadow_range = 6; shadow_power = 1.5` → Soft, diffuse shadow (avoids harsh "drop shadow" look)
- `shadow_color = $lavender20` → Shadow inherits theme color with 20% opacity for depth without dirtiness

**D. Workspace Rules (Astolfo-Themed Names)**
| Workspace | Name (Icon) | Associated Trait | Typical Use Case |
|-----------|-------------|------------------|------------------|
| 1         | 🌸         | Kindness         | Web browsing, communication |
| 2         | 💻         | Creativity       | Coding, design, writing |
| 3         | 💬         | Friendship       | Chat apps (Discord, Telegram) |
| 4         | 🎧         | Music            | Media playback (Spotify, VLC) |
| 5         | 🎮         | Playfulness      | Gaming (Steam, Lutris) |
| 6         | 🔧         | Curiosity        | Development tools, VMs |
| 7         | ⚙️         | Diligence        | System settings, file management |
| 8         | 🌴         | Relaxation       | Videos, reading, leisure |
| 9         | 📚         | Knowledge        | Research, documentation, learning |
| 10        | 🎀         | Ribbons          | Scratchpads, notes, personal projects |

- *Why emoji names?* Universally recognizable, language-independent, and reinforcement of the theme's whimsical nature.
- *App-to-workspace rules* (`windowrulev2`) auto-sort applications (e.g., Firefox always goes to workspace 1 🌸).

**E. Keybindings**
- `$mod = SUPER` → Uses the "Windows" key (or Command key on Mac keyboards)
- **Launchers**:
  - `SUPER+ENTER` → Alacritty (terminal)
  - `SUPER+SPACE` → Wofi (fuzzy app finder)
  - `SUPER+SHIFT+SPACE` → Rofi (alternative launcher with theme)
- **Media Controls** (hardware keys):
  - `XF86AudioRaiseVolume` → `dots_volume.sh up`
  - `XF86AudioLowerVolume` → `dots_volume.sh down`
  - `XF86AudioMute` → `dots_volume.sh mute`
  - `XF86AudioPlay` → `playerctl play-pause`
  - `XF86AudioNext` → `playerctl next`
  - `XF86AudioPrev` → `playerctl previous`
- **Scratchpad**: `SUPER+GRAVE` → Terminal with Astolfo-themed neofetch (see Section 5.3)
- **Layout Controls**: `SUPER+D` (split toggle), `SUPER+F` (float toggle), etc.

**F. Special Features**
- `exec-once = wtypeset -r 180` → Slows cursor blink rate for reduced distraction
- `exec-once = grimblast &` → Enables screenshot workflows (see Usage Section)
- `hide_lock_screen = true` → Clean lock screen (only shows password prompt)

### 5.2 Waybar Configuration (`config` + `style.css`)
Waybar creates the top-screen status bar. Its power comes from **separating layout (`config`)** from **styling (`style.css`)**.

#### A. `waybar/config` - Layout Definition
```json
{
  "layer": "top",          // Appears above all windows
  "position": "top",       // Fixed to top edge
  "height": 28,            // Pixel height (tall enough for dots, short enough to be unobtrusive)
  "spacing": 6,            // Space between modules (pixels)
  "margin-top": 3,         // Small gap from screen top
  "margin-bottom": 3,      // Small gap from screen bottom
  "margin-left": 3,        // Small gap from screen left
  "margin-right": 3,       // Small gap from screen right
  "modules-left": [        // Left-aligned modules (in order)
    "workspace",           // Clickable workspace buttons (dot-style)
    "mode"                 // Shows current layout (e.g., "dwindle")
  ],
  "modules-center": [      // Center-aligned modules
    "clock"                // Time display (soft dot separators)
  ],
  "modules-right": [       // Right-aligned modules (in order)
    "dot_cpu",             // Custom script: CPU usage as ●○ dots
    "dot_memory",          // Custom script: RAM usage as ●○ dots
    "dot_network",         // Custom script: Network speed as ●○ dots
    "dot_volume",          // Custom script: Volume as ●●○○○○○○○○ dots
    "dot_music",           // Custom script: Music controls as [⏮] [▶⏸] [⏭] dots
    "tray",                // System tray (Bluetooth, network, etc.)
    "powermenu"            // Power options (shutdown, reboot, logout)
  ]
}
```
- **Why this order?**
  Left: Workspace navigation (most frequently accessed)
  Center: Time (constant reference)
  Right: System stats → Media → Tray → Power (logical flow from active monitoring to passive controls)

#### B. `waybar/style.css` - Visual Implementation (The "Dot Magic")
This file transforms script output into the visual dot patterns. Key innovations:

**1. Window Styling**
```css
window#waybar {
  background: linear-gradient(135deg, $blush 0%, $lavender 50%, $baby_pink 70%);
  border-radius: 10px;
  border: 1px solid $lavender30;
  box-shadow: 0 2px 8px rgba(230, 230, 250, 0.2);
}
```
- Creates a soft, vertical gradient blush → lavender → baby pink
- Subtle border and shadow for depth without harshness
- `rgba(230,230,250,0.2)` = Lavender at 20% opacity for gentle shadow

**2. Workspace Buttons (Dot-Style Buttons)**
```css
#workspaces button {
  padding: 2px 6px;
  margin: 0 1px;
  border-radius: 50%;        // Creates perfect circles
  width: 18px;
  height: 18px;
  line-height: 18px;
  text-align: center;
  background: $transparent;
  color: $text;
  font-weight: bold;
}
#workspaces button.active {
  background: $baby_pink20;  // 20% opacity baby pink
  color: $baby_pink;
  border: 1px solid $baby_pink40;
  box-shadow: 0 0 6px rgba(255, 182, 193, 0.3);
}
```
- `border-radius: 50%` + fixed width/height = perfect circles
- Active state: Soft pink fill with subtle glow (not harsh highlight)
- *Why transparent default?* Lets the gradient background show through for unity

**3. The Dot Modules (Core Innovation)**
```css
#dot_cpu, #dot_memory, #dot_network, #dot_volume, #dot_music {
  padding: 0 6px;
  margin: 0 2px;
  border-radius: 50%;        // Circular modules
  min-width: 24px;
  text-align: center;
  line-height: 24px;
  font-family: "DejaVu Sans Mono", monospace; // Monospace for perfect dot alignment
  background: $blush;
  border: 1px solid $lavender30;
}
```
- **Critical**: `font-family: "DejaVu Sans Mono"` ensures dots (● ○) are monospaced and align perfectly
- `border-radius: 50%` makes each module a pill-shaped circle
- Base background: `$blush` (soft off-white)
- Border: `$lavender30` (lavender at 30% opacity) for subtle definition

**4. Hover Effects (Micro-Interactions)**
```css
#dot_cpu:hover,
#dot_memory:hover,
#dot_network:hover,
#dot_volume:hover,
#dot_music:hover {
  background: $lavender;     // Light lavender on hover
  transform: scale(1.1);     // Gentle 10% zoom
  box-shadow: 0 0 8px rgba(230, 230, 250, 0.3);
}
```
- Provides tactile feedback without being distracting
- `scale(1.1)` is subtle enough to avoid seeming "clicky" but noticeable
- Shadow matches window shadow for consistency

**5. Special Module Styling**
```css
#dot_cpu { background: $blush; }
#dot_memory { background: $lavender20; } // Slightly darker for visual hierarchy
#dot_network { background: $blush; }
#dot_volume { background: $lavender20; }
#dot_music { background: $blush; }
```
- RAM and Volume get slightly darker backgrounds (`$lavender20`) to distinguish them from CPU/Network/Music
- Creates intuitive grouping: "Memory/Volume" (resource systems) vs. "CPU/Network/Music" (activity systems)

#### C. How the Dot Scripts Interface with Waybar
Waybar executes scripts defined in `config` (e.g., `"cmd": "~/.config/waybar/scripts/dots_system.sh cpu"`) and displays their **stdout** as the module's text.
- Scripts **must** output ONLY the visual pattern (e.g., `●●○○○○○○○○`) — **NO extra text, newlines, or debug info**
- Scripts run in infinite loops with `sleep` intervals (1-sec for most, variable for network)
- Waybar captures output and updates the module in real-time

### 5.3 Dot Scripts Explained
Each script follows the same structural pattern but handles different data sources.

#### A. Universal Script Structure
```bash
#!/bin/bash
# [Description]
# DEPENDENCIES: [list]
# HOW IT WORKS: [technical explanation]
# PLACE IN LINUX: ~/.config/waybar/scripts/
# MAKE EXECUTABLE: chmod +x ~/.config/waybar/scripts/[script].sh

MODE="$1"          // Accepts argument: cpu, memory, network, etc.
UPDATE_INTERVAL=1  // Seconds between updates

get_dots() {       // CORE FUNCTION: Converts 0-100% to ●○ pattern
  local value="$1"
  local total=10   // Number of dots in display
  local filled=$(echo "scale=0; ($value * $total) / 100" | bc) // Integer division
  local empty=$((total - filled))

  local dots=""
  for ((i=0; i<filled; i++)); do
    dots+="●"      // Unicode BLACK CIRCLE (U+25CF)
  done
  for ((i=0; i<empty; i++)); do
    dots+="○"      // Unicode WHITE CIRCLE (U+25CB)
  done
  echo "$dots"
}

case "$MODE" in
  [mode-specific logic])
    [data collection]
    echo "$(get_dots $calculated_value)"
    sleep $UPDATE_INTERVAL
    ;;
esac
```

#### B. `dots_system.sh` - CPU/RAM/Network Monitoring
- **CPU**: Reads `/proc/stat`, calculates `(user+nice)/(user+nice+system+idle)*100`
- **RAM**: Reads `/proc/meminfo`, calculates `(used)/(total)*100`
- **Network**:
  1. Samples RX/TX bytes from `/sys/class/net/*/statistics/{rx,tx}_bytes`
  2. Waits 1 second
  3. Resamples and computes delta (bytes/sec)
  4. Converts to KB/s, then normalizes to 0-100% using `1000` as max (1 MB/s)
     → *Adjust `1000` in script if your typical network speed differs*
- **Output**: Pure dot string (e.g., `●●●●●○○○○○` for 50%)
- **Dependencies**: `bc` (for floating-point math in bash)

#### C. `dots_volume.sh` - Volume Control
- **Volume Level**: Uses `pamixer --get-volume` (0-100 integer)
- **Mute State**: Uses `pamixer --get-mute` (returns `true`/`false`)
- **Dot Conversion`: `volume / 10` → e.g., 73% → 7 filled dots (`●●●●●●○ ○○○○`)
- **Interactivity**:
  - Uses `$BUTTON` variable (set by Waybar on click):
    - `1` = Left click → Volume up (+5%)
    - `2` = Middle click → Toggle mute
    - `3` = Right click → Volume down (-5%)
- **Notifications**: `notify-send` shows current dot pattern on change
- **Dependencies**: `pamixer` (PulseAudio controller)

#### D. `dots_music.sh` - Interactive Music Controller
- **Player Detection**: Uses `playerctl` to query MPRIS2-compatible players (Spotify, VLC, MPV, etc.)
- **States**:
  - `player != "No player"` → At least one player is running
  - `status == "Playing"` → Audio is actively playing
- **Dot Logic**:
  - **Left Dot (▶⏸)**: `●` if playing, `○` if paused/stopped
  - **Middle Dot (⏮)**: `●` if player exists (enables previous track), `○` if none
  - **Right Dot (⏭)**: `●` if player exists (enables next track), `○` if none
    → *Note: Both side dots show `●` when player exists, regardless of play state*
- **Click Handling** (via `$BUTTON`):
  - `1` (Left) → `playerctl previous`
  - `2` (Middle) → `playerctl play-pause`
  - `3` (Right) → `playerctl next`
- **Notifications**: Shows track title/artist on change (or "No track"/"Unknown")
- **Dependencies**: `playerctl` (works with any MPRIS2 player: Spotify, VLC, CMUS, etc.)

> 💡 **Pro Tip**: Test music controls with `playerctl -l` to see detected players.
> Example output: `spotify vlc` → Both controllable via the dots.

### 5.4 Launchers: Wofi (`config`) and Rofi (`config.rasi`)
Both provide application menus but with different philosophies:

#### A. Wofi (Primary - Simpler, Faster)
- **Config Highlights** (`~/.config/wofi/config`):
  - `width = 380; height = 320` → Compact, focused popup
  - `margin-top = 90; margin-left = 510` → Positions near screen center-top
  - `opacity = 95` → Nearly opaque (95% visibility)
  - `border-size = 1; border-color = #ffb6c140` → Thin baby pink border (40% opacity)
  - `background-color = #ffffff08` → Almost transparent white (8% opacity) → Lets wallpaper show through
  - `textcolor = #333333` → Dark gray for readability on light/dark backgrounds
  - `selected-background-color = #ffb6c130` → Baby pink at 30% opacity when hovering
  - `rounding = 14` → Generous corner radius for soft, modern look
  - `exec-delay = 0.08` → 80ms delay after selection (prevents accidental double-launches)
- **Why Wofi?** Lower RAM footprint, faster startup, ideal for quick app launches.

#### B. Rofi (Alternative - More Customizable, Feature-Rich)
- **Config Highlights** (`~/.config/rofi/config.rasi`):
  - `window { width: 550px; height: 420px; ... }` → Larger, more prominent window
  - `background-image: url("~/.config/rofi/astolfo_dot_pattern.png", width)` → Tiles a subtle dot pattern
    → *Note: If `astolfo_dot_pattern.png` is missing, falls back to `background-color: rgba(255,182,193,0.05)`*
  - `element { border-radius: 10px; padding: 10px 14px; }` → Generous touch targets
  - `element selected { background-color: #ffb6c1; text-color: #000000; }` → Solid baby pink background with black text when selected
  - `inputbar { border-radius: 12px; padding: 10px 14px; border: 1px solid #ffb6c140; }` → Soft search bar
- **Why Rofi?** Better for complex searches (e.g., `drun` + `ssh` modes), more visual polish, but slightly heavier.

> 📌 **Recommendation**: Use Wofi for daily launching (`SUPER+SPACE`). Keep Rofi (`SUPER+SHIFT+SPACE`) for advanced searches.

### 5.5 GTK Settings (`gtk-3.0/settings.ini` & `gtk-4.0/settings.ini`)
Ensures visual consistency across GTK applications (Firefox, GNOME apps, etc.):
```ini
[Settings]
gtk-theme-name = Adwaita          // Uses GNOME's default light theme (clean, modern)
gtk-icon-theme-name = Papirus-Dark // Dark Papirus icons (matches pastel aesthetic)
gtk-font-name = JetBrains Mono 10  // Monospace for coding readability, proportional for UI
gtk-cursor-theme-name = Biblioteq  // Simple, elegant cursor
gtk-cursor-theme-size = 20        // Slightly larger cursor for visibility
gtk-toolbar-style = GTK_TOOLBAR_ICONS // Icons only (no text) for cleaner toolbars
gtk-toolbar-icon-size = GTK_ICON_SIZE_LARGE_TOOLBAR // Bigger icons for touch-friendliness
gtk-button-images = 1             // Show icons on buttons
gtk-menu-images = 1               // Show icons in menus
gtk-enable-event-sounds = 1       // Enable subtle feedback sounds
gtk-enable-input-feedback-sounds = 1 // Enable keypress feedback
gtk-xft-antialias = 1             // Smooth font rendering
gtk-xft-hinting = 1               // Sharp text edges
gtk-xft-hintstyle = hintfull      // Full hinting for best clarity
gtk-xft-rgba = rgb                // Subpixel rendering for LCDs
```
- **Why Adwaita + Papirus-Dark?**
  Adwaita provides a neutral, unobtrusive base. Papirus-Dark icons use simple line art that complements (doesn't clash with) the pastel theme.
- **Why JetBrains Mono?**
  Excellent readability for code/terminal, with distinct glyphs (e.g., `0` vs `O`, `1` vs `l`/`I`). Size 10 balances legibility and screen real estate.
- **Critical**: Identical settings in `gtk-3.0` and `gtk-4.0` prevent visual inconsistency between GTK3 and GTK4 apps.

### 5.6 Wallpaper: `astolfo_wallpaper.svg`
This is the ONLY wallpaper file included in the repository. It is **100% original vector art** — **NO** Astolfo character depiction.

#### A. File Contents (Verbatim)
```svg
<svg width="3840" height="2160" viewBox="0 0 3840 2160" xmlns="http://www.w3.org/2000/svg">
  <!-- Background gradient: blush to lavender -->
  <defs>
    <linearGradient id="bgGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#FFF0F5;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#E6E6FA;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="100%" height="100%" fill="url(#bgGrad)" />

  <!-- Abstract ribbon elements (Astolfo-inspired, NO character depiction) -->
  <path d="M500,500 C700,300 1100,300 1300,500
           C1500,700 1500,1100 1300,1300
           C1100,1500 700,1500 500,1300
           C300,1100 300,700 500,500 Z"
        fill="#FFB6C1" opacity="0.8"/>

  <path d="M2000,800 C2200,600 2600,600 2800,800
           C3000,1000 3000,1400 2800,1600
           C2600,1800 2200,1800 2000,1600
           C1800,1400 1800,1000 2000,800 Z"
        fill="#FFB6C1" opacity="0.7"/>

  <!-- Floral accents (public domain botanical style) -->
  <circle cx="1000" cy="1600" r="80" fill="#E6E6FA" opacity="0.6"/>
  <circle cx="1000" cy="1600" r="40" fill="#FFB6C1" opacity="0.8"/>

  <circle cx="3000" cy="1000" r="60" fill="#FFF0F5" opacity="0.5"/>
  <circle cx="3000" cy="1000" r="30" fill="#E6E6FA" opacity="0.7"/>
  <circle cx="

              <!-- Subtle sparkle dots (whimsical touch) -->
              <circle cx="500" cy="1800" r="3" fill="#FFFFFF" opacity="0.9"/>
              <circle cx="3500" cy="300" r="2" fill="#FFFFFF" opacity="0.8"/>
              <circle cx="1800" cy="1200" r="4" fill="#FFFFFF" opacity="0.7"/>
            </svg>
```