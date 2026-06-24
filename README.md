# Astolfo Hyprland Theme

A feminine, Astolfo-inspired Hyprland theme featuring pink and purple gradients, cute accents, and a kawaii aesthetic. Designed for daily use on Arch Linux with an adorable, productive desktop setup.

![Astolfo Preview](wallpaper/wallpaper1.jpg) *(Preview - shows the gradient wallpaper)*

## Features

- **Astolfo-themed Wallpapers** - Beautiful pink and purple gradients, SVG with sparkles
- **Custom Hyprland theme** with Astolfo pink accents for active borders and UI elements
- **Pre-configured workspaces** (1-6) with names: main, web, code, chat, media, misc
- **Essential keybindings** (Super+Enter → Alacritty, Super+E → Thunar, Super+F → Firefox, Super+D → Rofi, Super+Shift+Q → exit Hyprland)
- **Hyprpaper integration** for smooth wallpaper rendering
- **Matching GTK theme** (`AstolfoGTK`) with pink and purple highlights
- **Icon theme** set to inherit Papirus (install Papirus-Icon-Theme for best results)
- **Cute decorative elements** - sparkles, hearts, and kawaii touches in the SVG wallpaper

## Astolfo Theme Details

This theme is inspired by Astolfo from Fate/Apocrypha, featuring:
- **Primary Color**: #F48FB1 (Astolfo Pink)
- **Secondary Colors**: #F06292, #EC407A, #CE93D8, #BA68C8
- **Accents**: #F8BBD0, #FFFFFF
- **Aesthetic**: Feminine, cute, kawaii with subtle sparkle effects

## Installation

> **Prerequisites**: Arch Linux (or Arch-based) with `base-devel` and `git` installed.

### 1. Install Hyprland and dependencies

```bash
sudo pacman -S hyprland hyprpaper alacritty thunar firefox rofi papirus-icon-theme bibata-cursor-theme-bin imagemagick
# Optional: bibata-cursor-theme for the cursor specified in the GTK settings
# Optional: imagemagick for wallpaper generation (if you want to create your own)
```

### 2. Obtain this theme

```bash
# If you already have the theme, skip this step
git clone https://github.com:username/astolafork/theme or cpaland-theme -r wallpapers/theme_location
cd hyperland-theme
```

### 3. Apply the wallpaper

The wallpaper expects to be located at `~/hyperland-theme/wallpaper/`.
If you placed the folder elsewhere, edit `hyprland/hyprpaper.conf` and update the path.

```bash
# Ensure the directory exists in your home (optional)
mkdir -p ~/hyperland-theme/wallpaper
cp -r wallpaper/* ~/hyperland-theme/wallpaper/
```

### 4. Copy Hyprland configuration

```bash
mkdir -p ~/.config/hypr
cp -r hyprland/* ~/.config/hypr/
```

### 5. Apply the GTK and icon themes

You can use `lxappearance`, `gtk-theme-switch2`, or GNOME Tweaks (if installed) to select:

- **GTK Theme**: `AstolfoGTK`
- **Icon Theme**: `Astolfo Icons` (falls back to Papirus)
- **Cursor Theme**: `Bibata-Modern-ICE` (or any you prefer)

If you prefer to set via environment variables (e.g., in your `~/.gtkrc-2.0` or `~/.config/gtk-3.0/settings.ini`), the provided `gtk-3.0/settings.ini` already contains the desired values.

Copy the GTK theme to your themes directory (usually `~/.themes`):

```bash
mkdir -p ~/.themes
cp -r gtk-theme/AstolfoGTK ~/.themes/
```

Copy the icon theme to `~/.icons`:

```bash
mkdir -p ~/.icons
cp -r icons/AstolfoIcons ~/.icons/
```

Then run:

```bash
gsettings set org.gnome.desktop.interface gtk-theme "AstolfoGTK"
gsettings set org.gnome.desktop.interface icon-theme "Astolfo Icons"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-ICE"
```

### 6. Reload Hyprland

Press `Mod+Shift+E` to exit Hyprland and log back in, or run:

```bash
hyprctl reload
```

Your desktop should now reflect the adorable Astolfo theme.

## Customization

### Wallpapers
- Edit `wallpaper/wallpaper.svg` with Inkscape or any SVG editor to change colors, text, or add graphics
- Replace JPG wallpapers with your own Astolfo-themed images
- The SVG includes animated sparkles for extra kawaii effect

### Colors
In `hyprland/hyprland.conf`, modify the RGBA values:

```conf
col.active_border rgba(244,143,177,0.8)   /* #F48FB1 - Astolfo Pink */
col.inactive_border rgba(30,30,30,0.6)
```

### GTK Theme
Adjust `gtk-theme/AstolfoGTK/gtk-3.0/gtk.css` to change button colors, entry styles, etc.

### Keybindings
Edit `hyprland/hyprland.conf` and look for the `bind =` lines. Replace the commands with your preferred applications.

### Workspaces
Modify the `workspace` lines in `hyprland/hyprland.conf` to suit your workflow.

### Adding More Cute Elements
Feel free to add more Astolfo-themed elements:
- Heart symbols (♥) in the SVG wallpaper
- Star symbols (★) or sparkles (✧˖°)
- Princess-themed decorations
- Additional pastel colors

## Gallery

Wallpaper options included:
- `wallpaper1.jpg`: Default vertical pink-to-purple gradient
- `wallpaper2.jpg`: Diagonal gradient  
- `wallpaper3.jpg`: Multi-stop pink gradient
- `wallpaper4.jpg`: Radial gradient
- `wallpaper.svg`: Animated SVG with sparkles, hearts, and cute text

## Inspiration

This theme draws inspiration from:
- Astolfo's charming and feminine aesthetic from Fate/Apocrypha
- Kawaii culture and pastel aesthetics
- Clean, functional Hyprland workflows
- The original HyperLand theme structure

## Troubleshooting

If icons aren't showing correctly:
1. Ensure Papirus Icon Theme is installed: `sudo pacman -S papirus-icon-theme`
2. Rebuild icon cache: `gtk-update-icon-cache ~/.icons/AstolfoIcons`

If the theme doesn't apply correctly:
1. Check that you copied files to the correct locations (`~/.config/hypr/`, `~/.themes/`, `~/.icons/`)
2. Reload Hyprland with `Mod+Shift+E` then log back in
3. Verify GTK theme is applied via `lxappearance` or similar tool

## License

This configuration is released under the MIT License – feel free to modify, share, and use it for your own adorable desktop.

---

**Enjoy your cute Astolfo desktop!**  
*(✧˖° ʚĭɞ° ✧˖°)*  
If you have any questions or improvements, feel free to open an issue or pull request!
