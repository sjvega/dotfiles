#######################
#  Zpm plugin manager #
#######################
source ~/.config/zpm/zpm.zsh

zpm load @omz
zpm load @omz/git
zpm load @omz/fzf
zpm load @omz/zoxide
zpm load @omz/magic-enter

zpm load zsh-users/zsh-syntax-highlighting
zpm load zsh-users/zsh-completions
zpm load zsh-users/zsh-autosuggestions
zpm load Aloxaf/fzf-tab
zpm load softmoth/zsh-vim-mode

export PATH=$PATH:/Users/santivega/bin
export PATH=$PATH:/opt/homebrew/bin
##########
# Zoxide #
##########
eval "$(zoxide init --cmd cd zsh)"

############
# starship #
############
eval "$(starship init zsh)"

###############
#    fzf      #
###############
source <(fzf --zsh)

########
# tmux #
########
[ -z "$TMUX" ] && {exec tmux new-session && exit;}

###############
# magic-enter #
###############
export MAGIC_ENTER_OTHER_COMMAND='clear'
export MAGIC_ENTER_GIT_COMMAND='clear && git status -u'

###############
#   aliases   #
###############
#
# config aliases
#
alias config="nvim ~/.config/"
alias zshconfig='nvim ~/.config/zsh/.zshrc'
alias zshsource="source ~/.config/zsh/.zshrc"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias nvimconfig="nvim ~/.config/nvim/"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias tmuxsource="tmux source ~/.config/tmux/tmux.conf"
#
# docker aliases
alias dc-up="sudo docker-compose up -d"
alias dc-down="sudo docker-compose stop"
alias dc-ls="sudo docker-compose ls"
alias dc-ps="sudo docker ps"

# 
# other aliases
#
alias ls="eza -a -T -L 1 --color=always --icons=always"

# muun aliases
alias muun-vpn='/Applications/Tailscale.app/Contents/MacOS/Tailscale up --hostname "santivega.muun.com" --login-server https://tailscale.muun.io:8443 --force-reauth --shields-up --accept-routes'
alias dgrw='aws-vault exec rdsrw --duration=4h --prompt osascript -- open \/Applications\/DataGrip.app\/'
alias dgro='aws-vault exec rdsro --duration=4h --prompt osascript -- open \/Applications\/DataGrip.app\/'
alias dgsupport='aws-vault exec rdssupport --duration=4h --prompt osascript --server -- open \/Applications\/DataGrip.app\/'
alias dgrw='aws-vault exec rdsro --duration=4h --prompt osascript --server -- open \/Applications\/DataGrip.app\/'
alias muun='cd ~/Code/muun/ && /Users/santivega/Code/muun/toolkit/bin/muun'
alias dc='sh ~/Code/muun/tools/dc-wrapper.sh'
alias aws-dash='aws-vault login dev'
alias muun-dev-pods="kubectl config use-context dev && kubectl get pods"
alias muun-prd-pods="kubectl config use-context prd && kubectl get pods"

alias zshconfig='nvim ~/.zshrc'
alias lg='lazygit'
alias ld='lazydocker'
###############
#  variables  #
###############
export SUDO_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export HISTFILE=~/.config/zsh/.zsh_history
export TEXMFHOME=$HOME/.texmf

###############
#   paths     #
###############
export PATH=~/.local/bin/:$PATH

####################
#  History options #
####################
HISTSIZE=500000
SAVEHIST=500000
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt globdots

##################
# Extra keybinds #
##################
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

###########################
#  vi-mode cursor options #
###########################
MODE_CURSOR_VIINS="blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
