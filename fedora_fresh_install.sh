#! bin/bash 
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./fedora_fresh_install.sh" 2>&1
  exit 1
fi

#Removing unnecessary progrmas
echo "Removing unnecessary programs"
dnf remove boxes cheese gnome-help gnome-system-monitor gnome-photos gnome-weather gnome-maps gnome-tour rhythmbox totem

#Updating System
echo "Updating system"
dnf update -y

# Installing Essential Programs 
echo "Installing essential progams"

dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

dnf copr enable agriffis/neovim-nightly

dnf install brave-browser kitty git gcc gcc-c+ neovim python3-neovim stow util-linux-user zsh

# Adding addons or configure programs
echo "Setting up zsh"
chsh -s $(which zsh)
echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Installing fonts
wget -P ~/.fonts/SpaceMono "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Bold/complete/Space%20Mono%20Bold%20Nerd%20Font%20Complete.ttf"
wget -P ~/.fonts/SpaceMono "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Italic/complete/Space%20Mono%20Italic%20Nerd%20Font%20Complete.ttf"
wget -P ~/.fonts/SpaceMono "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete.ttf"

wget -P ~/.fonts/VictorMono "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/VictorMono/Regular/complete/Victor%20Mono%20Regular%20Nerd%20Font%20Complete.ttf"
wget -P ~/.fonts/VictorMono "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/VictorMono/Bold/complete/Victor%20Mono%20Bold%20Nerd%20Font%20Complete.ttf"
wget -P ~/.fonts/VictorMono "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/VictorMono/Italic/complete/Victor%20Mono%20Italic%20Nerd%20Font%20Complete.ttf"
