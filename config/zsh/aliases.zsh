alias ..='cd ..'

alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias q=exit
alias clr=clear
alias sudo='sudo '
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias nr='sudo nixos-rebuild'
alias o='xdg-open'
alias y='xclip -selection clipboard -in'
alias p='xclip -selection clipboard -ou'
alias egit="run emacs --eval '(magit)'"
alias less="less -R"
alias dc="docker-compose"

if command -v wget >/dev/null; then
	alias wget='wget -c'
fi

if command -v lazygit >/dev/null; then
  alias lg='lazygit'
fi

if command -v a >/dev/null; then
	alias O='a -e xdg-open' # quick opening files with xdg-open
	alias e='f -e nvim'
	alias v='f -e nvim'
  alias z='fasd_cd -d'
fi

if command -v exa >/dev/null; then
	alias cat='bat'
fi


if command -v exa >/dev/null; then
  alias exa="exa --group-directories-first";
  alias l="exa -1";
	alias ls="exa"
  alias ll="exa -lg";
  alias la="LC_COLLATE=C exa -la";
fi

take() {
  mkdir -p "$1" && cd "$1";
}; compdef take=mkdir

ig() {
  $* &> /dev/null
}

run() {
  ig $* &
}

dot() {
  local user=${1:-$(whoami)}; [ $# -gt 0 ] && shift;
  home-manager switch --flake "$XDG_CONFIG_HOME"/nixpkgs#"$user" --impure "$@"
}

cheat() {
  local lang="$1";
  local thing="$2";
  local answrcnt="${3:-1}"
  cht.sh "$lang/$thing/$answrcnt" | less -R
}

r() {
  local time=$1; shift;
  sleep "${time}m" && notify-send --urgency=critical 'Reminder:' "$@" > /dev/null &;
}; compdef r=sched
