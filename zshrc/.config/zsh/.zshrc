source ~/.config/zpm/zpm.zsh

zpm load \
	zsh-users/zsh-syntax-highlighting \
	zsh-users/zsh-completions \
	zsh-users/zsh-autosuggestions \
	@omz/vi-mode \
	@omz/fastgit \
	@omz/fzf     \
	Aloxaf/fzf-tab \
#############
#   apps    #
#############

eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/emodipt-extend.omp.json)"
###############
#    fzf      #
###############
eval "$(fzf --zsh)"
export FZF_CTRL_T_OPTS="--preview 'bat --style number,changes --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# - The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Disable default completion
zstyle ':completion:*' menu no
# Cd/Zoxide fzf prevew
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --color=always $realpath' 
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --tree --color=always $realpath' 

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
#############
#   alias   #
#############
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
alias zshconfig='nvim ~/.config/zsh/.zshrc'
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias swayconfig="nvim ~/.config/sway/config"
alias wayconfig="nvim ~/.config/waybar/"
alias nvimconfig="nvim ~/.config/nvim/"
#
# systemd aliases
#
alias restart="systemctl restart"
alias start="systemctl start"
alias status="systemctl status"
alias stop="systemctl stop"
alias enable="systemctl enable"
alias disable="systemctl disable"
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""
#
# docker aliases
alias dc-up="sudo docker-compose up -d"
alias dc-down="sudo docker-compose stop"
alias dc-ls="sudo docker-compose ls"
alias dc-ps="sudo docker ps"
# 
# zoxide aliases
alias zz="cd -"
# other aliases
#
alias ls="eza -a --icons=always"
###############
#  variables  #
###############
export SUDO_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME="qt5ct"
compinit -d ~/.config/zsh/zcompdump-$ZSH_VERSION
export HISTFILE=~/.config/zsh/.zsh_history
export TEXMFHOME=$HOME/.texmf
###############
#   paths     #
### ###########
export PATH=~/.local/bin/:$PATH
###############
#   options   #
###############
