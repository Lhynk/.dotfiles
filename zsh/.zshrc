# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# THEME
ZSH_THEME="robbyrussell"

# PLUGINS
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ALIASES

# APT
alias install="sudo apt install"
alias remove="sudo apt remove"
alias update="sudo apt update"
alias autoremove="sudo apt autoremove"

# CONFIG FILES
alias zshConfig="gedit ~/.zshrc"
alias nvimDir="cd ~/.config/nvim"
alias nvimConfig="nvim ~/.config/nvim/init.lua"


# FUNCTIONS
function terminalTheme() {
    bash -c "$(wget -qO- https://git.io/vQgMr)"
}

function dev() {
    cd ~/Documents/Development
    clear
}

function home() {
    cd ~
    clear
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
