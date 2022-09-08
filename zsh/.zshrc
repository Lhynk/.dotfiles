# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.dotnet/tools:$PATH

# export PNPM
export PNPM_HOME="~/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# PLUGINS
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ALIASES

# DNF
alias install="sudo dnf install"
alias remove="sudo dnf remove"
alias update="sudo dnf update"
alias autoremove="sudo apt autoremove"

# CONFIG FILES
alias zshConfig="nvim ~/.zshrc"
alias nvimDir="cd ~/.config/nvim"
alias nvimConfig="nvimConfig"
alias tmuxConfig="nvim ~/.tmux.conf"
alias bspConfig="nvim ~/.config/bspwm/bspwmrc"
alias sxhkdConfig="nvim ~/.config/sxhkd/sxhkdrc"
alias kittyConfig="nvim ~/.config/kitty/kitty.conf"
alias polybarConfig="nvim ~/.config/polybar/config.ini"
alias picomConfig="nvim ~/.config/picom/picom.conf"
alias i3Config="nvim ~/.config/i3/config"
alias i3StatusConfig="nvim ~/.config/i3status/config"

# Runners
alias vite="npm create vite@latest"
alias cra="npx create-react-app"
alias tailwindInstall="npm install -D tailwindcss postcss autoprefixer && npx tailwindcss init -p"
alias falias="alias | fzf"

# MISC
alias cls="clear"

# NPM
alias ni="pnpm install"
alias nid="pnpm install --dev"
alias nig="pnpm add -g"
alias nr="npm run"

# FUNCTIONS
function terminalTheme() {
    bash -c "$(wget -qO- https://git.io/vQgMr)"
}

function dev() {
    clear
    cd ~/Development
}

function home() {
    cd ~
    clear
}

function reload() {
  source ~/.zshrc
  clear
}

function nvimConfig() {
  nvimDir
  nvim .
  home
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fdfind --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# pnpm
export PNPM_HOME="/home/lhynk/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
