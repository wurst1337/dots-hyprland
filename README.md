# dots-hyprland
My simple Hyprland and Waybar dots

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5ce949d5-eb9e-411e-b1a4-83f97202aa27" />


## Demo video
<video src="overall.mp4"></video>

## wallmk
**wallmk** - is a simple script for auto-generating theme from wallpaper accent color using [`pywal`](https://github.com/dylanaraps/pywal) and `awww` (aka swww).

Script is apply color scheme to:
- kitty (just colors)
- waybar (just colors)
- hyprland (border colors)

## Hyprland
### Keybinds

| Keybing | Description | Command |
| ---     | ----        | ---     |
| `Super`+`Enter` or `Super`+`T` | Run terminal | `exec, $terminal` |
| `Super`+`Q` | Kill active window | `killactive` |
| `Super`+`E` | Open file manager | `exec, $fileManager` |
| `Super`+`W` | Open browser | `exec, $browser` |
| `Super`+`G` | Toggle floating | `togglefloating` |
| `Super`+`R` | Open launcher | `exec, $menu` |
| `Super`+`P` | Toggle pseudo-mode | `pseudo` |
| `Super`+`N` | Open notification center (`swaync`) | `exec, swaync-client -t -sw ` |
| `Super`+`↑`,`↓`,`←`,`→` | Move focus  | - |
| `Super`+`h`,`j`,`k`,`l` | Move focus (alt)  | - |
| `Super`+`Ctrl`+`↑`,`↓`,`←`,`→` | Move focused window  | - |
| `Super`+`Ctrl`+`h`,`j`,`k`,`l` | Move focus window (alt)  | - |
| `Super`+`Shift`+`←`,`→` | Move to L and R workspaces  | - |
| `Super`+`1`,`2`, `3`, ... `9`, `10` | Move to workspaces  | - |
| `Super`+`Shift`+`1`,`2`, `3`, ... `9`, `10` | Move focused window to workspaces  | - |
| `Super`+`V` | Open cliphist via rofi  | - |
| `Super`+`Shift`+`S` | Open screenshot util  | - |
| `Super`+`Shift`+`E` | Open screenshot util and edit via swappy  | - |
| `Super`+`F` | Toggle fullscreen mode for focused window  | - |
| `Super`+`Ctrl`+`Shift`+`←`,`→` | Move focused window to workspaces  | - |
| `Super`+`Ctrl`+`Shift`+`h`,`l` | Move focused window to workspaces (alt)  | - |




## Hypridle
### Demo screenshot
<img width="1270" height="720" alt="hyprlock_screenshot" src="https://github.com/user-attachments/assets/98694f1d-0378-4265-9131-f0d2c1a82506" />


## Waybar
Just a simple waybar config.
### Screenshots
<img width="1920" height="42" alt="image" src="https://github.com/user-attachments/assets/df5969fe-9f4f-41a2-89b2-cf96b348d45b" /> <br>
<img width="1920" height="42" alt="image" src="https://github.com/user-attachments/assets/542a3db5-621f-4628-9d75-fc09983ebb5b" /> <br>
<img width="1920" height="42" alt="image" src="https://github.com/user-attachments/assets/b5ca9095-767a-4088-93e9-ee3ac85b58c8" />

## License
Dots is licensed under MIT License terms. More in [LICENSE](LICENSE) file.
