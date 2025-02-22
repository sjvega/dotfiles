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
eval "$(fzf --zsh)"
enable-fzf-tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

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
# pikaur aliases
#
alias install='pikaur -S'
alias update='pikaur -Syu'
alias remove='pikaur -Rsc'
alias clean='pikaur -Sc'
alias search='pikaur -Ss'
alias remove-orphans='pikaur -Qtdq | pikaur -Rns - '

#
# config aliases
#
alias config="nvim ~/.config/"
alias zshconfig='nvim ~/.config/zsh/.zshrc'
alias zshsource="source ~/.config/zsh/.zshrc"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias swayconfig="nvim ~/.config/sway/config"
alias wayconfig="nvim ~/.config/waybar/"
alias nvimconfig="nvim ~/.config/nvim/"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias tmuxsource="tmux source ~/.config/tmux/tmux.conf"
#
# systemd aliases
#
alias restart="systemctl restart"
alias start="systemctl start"
alias status="systemctl status"
alias stop="systemctl stop"
alias enable="systemctl enable"
alias disable="systemctl disable"

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

###############
#  variables  #
###############
export SUDO_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim
export MOZ_ENABLE_WAYLAND=1
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
