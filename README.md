# 「 Nicomachean dotfiles 」
Minimalistic, powerfull, usable, lightweight dotfiles.

## 〔 overview 〕
### What is it?
This is my dotfiles for **Hyprland, waybar, hyprlock and rofi**. Created to be easy, lightweight, powerfull and minimalistic.

### 〔 software 〕
| Software | Description |
| ---      | ----        |
| Hyprland | The modern, easy and powerfull primary tiling compositor. |
| Waybar  | Just a bar. |
| Rofi    | A modern launcher for your apps. |
| other    | please read the [thirdparty textfile](thirdparty.md). |

## 〔 screenshots 〕 
|  |  |
| ---      | ----        |
| <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e4feb032-269b-4291-8bfe-cf015b514983" /> | <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5efa652d-8d4b-4304-a47c-39443e43002b" /> |
| <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/431471b9-b7ab-4cb6-a5ed-bfb35bdf173d" />  | <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e5492e25-285c-4767-9948-3f2834fec7bb" /> |

## 〔 features 〕
- 🤏🏻 **Slim** - Really slim config withn't a weight-performance ass like a blur and 320kg of animations. Good for end-pc (like mine).
- 🎨 **Auto theme generation** - You can generate color themes from wallpaper using easy self-writed `wallmk` script which uses `pywal`.
- 💡 **Design** - Design created by self-writen standarts and referenced to a KISS philosophy.
- 🌊 **Usability** - Minium of ascetic, maximum of usablility out the box.


## 〔 install 〕

> [!WARNING]
> Installer script for Arch Linux will be soon! Just more patience.

A really cool install script will be created in future, just wait =)

If you really wants this dots - you can copy files manualy, all dots stored and [self-named directory](dots) in repository.

### Arch
Install script for archlinux on alpha-stage is ready!

#### Basic install
```bash
mkdir dots && cd dots
cd dots-hyprland
chmod +x install.sh
./install.sh
```

#### After install
**Warning!**: Don't forget to run `wallmk` to generate themes:
```bash
wallmk /path/to/your/wallpaper
```

## 〔 license 〕
Dots is licensed under MIT License terms. More in [LICENSE](LICENSE) file.

