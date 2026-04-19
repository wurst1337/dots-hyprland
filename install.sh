#!/usr/bin/env bash
set -euo pipefail

YESFORALL=0
EXIT_REQUESTED=0
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTS_CONFIG_SRC="$SCRIPT_DIR/dots/.config"
WALLMK_SRC="$SCRIPT_DIR/dots/utils/wallmk"
DEFWALL_SRC="$SCRIPT_DIR/dots/utils/defaultwallpaper.png"
WALLMK_DEST="/usr/local/bin/wallmk"

RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
NC='\033[0m'

die() {
    echo -e "${RED}ERROR:${NC} $*" >&2
    exit 1
}

warn() {
    echo -e "${YELLOW}WARNING:${NC} $*" >&2
}

info() {
    echo -e "${BLUE}==>${NC} $*"
}

success() {
    echo -e "${GREEN}++>${NC} $*"
}

check_not_root() {
    if [[ $EUID -eq 0 ]]; then
        die "This script must not be run as root. Run it as a normal user."
    fi
}

confirm_action() {
    local description="$1"

    if [[ $YESFORALL -eq 1 ]]; then
        info "Skipping confirmation (yesforall active): $description"
        return 0
    fi

    echo
    warn "Action: $description"
    while true; do
        read -p "Proceed? [y]es / [n]o / yes for [a]ll / [e]xit: " yn
        case $yn in
            [Yy] ) return 0 ;;
            [Nn] ) return 1 ;;
            [Aa] ) YESFORALL=1; return 0 ;;
            [Ee] ) EXIT_REQUESTED=1; return 1 ;;
            * ) echo "Please answer y, n, a, or e." ;;
        esac
    done
}

run_with_confirm() {
    local description="$1"
    shift
    local cmd=("$@")

    if ! confirm_action "$description"; then
        if [[ $EXIT_REQUESTED -eq 1 ]]; then
            info "Exiting as requested."
            exit 0
        else
            info "Skipped: $description"
            return 0
        fi
    fi

    info "Running: ${cmd[*]}"
    "${cmd[@]}"
    local status=$?
    if [[ $status -eq 0 ]]; then
        success "Completed: $description"
    else
        warn "Command failed (status $status): ${cmd[*]}"
        if [[ $YESFORALL -eq 1 ]]; then
            info "Continuing due to yesforall..."
        else
            read -p "Continue script? [y/N]: " cont
            [[ "$cont" =~ ^[Yy]$ ]] || exit 1
        fi
    fi
}

PACMAN_PACKAGES=(
    sddm
    hyprland
    hyprlock
    hypridle
    kitty
    rofi
    awww
    python
    python-pywal
    swaync
    grim
    swappy
    slurp
    waybar
    brightnessctl
    dolphin
    papirus-icon-theme
    fish
    starship
    hyprsunset
    cava
    networkmanager
    pipewire
    wireplumber
    pipewire-audio
    libpipewire
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    gst-plugin-pipewire
    cliphist
    wl-clipboard
    playerctl
    libnotify
    pavucontrol
    firefox
    xdg-desktop-portal-hyprland
    ttf-jetbrains-mono-nerd
)

TASKS=(
    install_pacman_packages
    check_existing_configs
    copy_dotfiles
    install_wallmk
    set_default_wallpaper
    post_install_actions
)

install_pacman_packages() {
    run_with_confirm "Update pacman database?" \
        sudo pacman -Sy --noconfirm

    run_with_confirm "Install packages from official repositories:\n$(printf '  %s\n' "${PACMAN_PACKAGES[@]}")" \
        sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"
}

check_existing_configs() {
    if [[ -d "$HOME/.config" ]] && [[ -n "$(ls -A "$HOME/.config" 2>/dev/null)" ]]; then
        warn "Existing config files found in ~/.config/"
        warn "Copying dotfiles will OVERWRITE matching files/directories!"
        confirm_action "Proceed with copying dotfiles (overwrites may occur)?" || {
            info "Skipping dotfiles copy."
            return 1
        }
    fi
}

copy_dotfiles() {
    if [[ ! -d "$DOTS_CONFIG_SRC" ]]; then
        warn "Source dotfiles directory not found: $DOTS_CONFIG_SRC"
        return 1
    fi

    run_with_confirm "Copy dotfiles from $DOTS_CONFIG_SRC to ~/.config/" \
        bash -c "mkdir -p '$HOME/.config' && cp -r '$DOTS_CONFIG_SRC'/* '$HOME/.config/'"
}

install_wallmk() {
    if [[ ! -f "$WALLMK_SRC" ]]; then
        warn "wallmk script not found: $WALLMK_SRC"
        return 1
    fi

    run_with_confirm "Install wallmk to /usr/local/bin (requires sudo)" \
        sudo bash -c "cp '$WALLMK_SRC' '$WALLMK_DEST' && chmod +x '$WALLMK_DEST'"
}

set_default_wallpaper() {
    if [[ ! -f "$DEFWALL_SRC" ]]; then
        warn "default wallpaper not found: $DEFWALL_SRC"
        return 1
    fi

    run_with_confirm "[REQUIRED] set default wallpaper via wallmk?" \
        wallmk "$DEFWALL_SRC"
}

post_install_actions() {
    echo
    success "Installation complete!"
    info "Next steps:"
    echo "  - Enable SDDM: sudo systemctl enable sddm"
    echo "  - Enable NetworkManager: sudo systemctl enable NetworkManager"
    echo "  - Change default shell to fish (optional): chsh -s /usr/bin/fish"
    echo

    if confirm_action "[RECOMENDED] Set a wallpaper using wallmk now? (requires an image path)"; then
        read -p "Enter path to wallpaper image: " img_path
        if [[ -f "$img_path" ]]; then
            run_with_confirm "Set wallpaper with wallmk" \
                wallmk "$img_path"
        else
            warn "File not found: $img_path"
        fi
    fi

    if confirm_action "Reboot system now?"; then
        info "Rebooting..."
        sudo reboot
    else
        info "You can reboot later manually."
    fi
}

main() {
    check_not_root

    echo
    info "=== Hyprland Dotfiles by wurst1337 Installer for Arch Linux ==="
    info "You will be prompted before each action."
    echo

    for task in "${TASKS[@]}"; do
        if declare -f "$task" >/dev/null; then
            $task
        else
            warn "Function '$task' not defined, skipping."
        fi
    done

    success "All tasks processed. Enjoy!"
}

main "$@"
