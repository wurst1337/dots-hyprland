# 「 Nicomachean dotfiles 」
Minimalistic, slim, usable, lightweight dotfiles.

## 〔 overview 〕
> [!WARNING]
> At this moment, I'm enchanting the dots and making it for public. The config at same time maybe sounds raw.

### What is it?
This is my dotfiles for **Hyprland, waybar, hyprlock and rofi**. Created to be easy, lightweight, powerfull and minimalistic.

### 〔 software 〕
| Software | Description |
| ---      | ----        |
| Hyprland | The modern, easy and powerfull primary tiling compositor. |
| Waybar  | Bar. |
| Rofi    | A modern launcher for your apps. |
| other    | read the [thirdparty textfile](thirdparty.md). |

## 〔 screenshots 〕 
|  |  |
| ---      | ----        |
| <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e4feb032-269b-4291-8bfe-cf015b514983" /> | <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5efa652d-8d4b-4304-a47c-39443e43002b" /> |
| <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/431471b9-b7ab-4cb6-a5ed-bfb35bdf173d" />  | <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e5492e25-285c-4767-9948-3f2834fec7bb" /> |

### 〔 philosophy/rules 〕
| №  |  Description                                                      | Why?  |
| ---|  -----                                                            | ----- |
| 1  |  Use an accent color from wallpaper in Hyprland, waybar, rofi, etc.  | 1) It's beautiful, fast and convenient. <br> 2) It doesn't take time to manually edit each config. <br> 3) Makes everything a "unified system"
| 2  |   Make a beatiful, but lightweight config.
| 3  |  The config should be convenient for everyday use, with pleasure.


## 〔 install 〕
### Arch
> [!WARNING]
> Installer on an alpha-stage of development.

#### Basic install
```bash
sudo pacman -Syu && sudo pacman -S git
mkdir dots && cd dots
git clone https://github.com/wurst1337/dots-hyprland.git
cd dots-hyprland
chmod +x install.sh
./install.sh
```

#### After install
> [!WARNING]
> Generate themes.

**Warning!**: Don't forget to run `wallmk` to generate themes:
```bash
wallmk /path/to/your/wallpaper.jpg
```

## 〔 license 〕
Dots is licensed under MIT License terms. More in [LICENSE](LICENSE) file.