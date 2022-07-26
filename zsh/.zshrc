# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.dotnet/tools:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# PLUGINS
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ALIASES

# DNF
alias install="sudo dnf install"
alias remove="sudo dnf remove"
alias update="sudo dnf upgrade"
alias autoremove="sudo dnf autoremove"

# CONFIG FILES
alias zshConfig="nvim ~/.zshrc"
alias nvimDir="cd ~/.config/nvim"
alias nvimConfig="nvim ~/.config/nvim/init.lua"
alias tmuxConfig="nvim ~/.tmux.conf"
alias zshReload="source ~/.zshrc"

# Tmux
alias t="tmux"
alias ta="t a"
alias tan="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Yarn
alias ya="yarn add"
alias yad="yarn add -D"
alias yr="yarn remove"

# Runners
alias vite="npm create vite@latest"
alias cra="npx create-react-app"
alias tailwindInstall="npm install -D tailwindcss postcss autoprefixer && npx tailwindcss init -p"
alias falias="alias | fzf"

# NPM
alias ni="npm install"
alias nid="npm install --dev"
alias nig="npm install -g"

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
