source ~/.config/zpm/zpm.zsh

zpm load \
	zsh-users/zsh-syntax-highlighting \
	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-completions \
	@omz/vi-mode \
	@omz/fastgit \
	@omz/zoxide  \
	@omz/fzf \
	@omz/colored-man-pages \
	Aloxaf/fzf-tab \
#############
#   apps    #
#############

eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/quick-term.omp.json)"
###############
#    fzf      #
###############
eval "$(fzf --zsh)"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    *)            fzf --preview "bat --color=always --line-range :500 {}" "$@" ;;
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
#   options   #
###############
