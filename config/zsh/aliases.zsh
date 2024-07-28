alias ..='cd ..'

alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# alias q=exit
alias clr=clear
alias sudo='sudo '
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias nr='sudo nixos-rebuild'
alias egit="run emacs --eval '(magit)'"
alias less="less -R"
alias dc="docker-compose"

alias teich-up="wakeonlan 40:b0:34:f3:d4:00"
alias teich-ssh="ssh tim@teichserver"

alias lman="man -M $HOME/ubuntu-man/"

# ai pair programming
alias aider="python3 -m aider.main"


if command -v nvim >/dev/null; then
	alias vim='nvim'
	alias vi='nvim'
fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias o='open'
  alias y=pbcopy
  alias p=pbpaste
else
  alias o='xdg-open'
  alias y=xclip -selection clipboard -in
  alias p=xclip -selection clipboard -ou
fi

if command -v wget >/dev/null; then
	alias wget='wget -c'
fi

if command -v lazygit >/dev/null; then
  alias lg='lazygit'
fi

if command -v lazydocker >/dev/null; then
  alias lzd='lazydocker'
fi

if command -v python >/dev/null; then
  alias py='python'
fi

if command -v python3 >/dev/null; then
  alias py='python3'
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
