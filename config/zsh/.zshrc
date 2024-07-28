if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

if [ ! -d "$ZGEN_DIR" ]; then
  echo "Installing jandamm/zgenom"
  git clone https://github.com/jandamm/zgenom "$ZGEN_DIR"
fi
source $ZGEN_DIR/zgenom.zsh
zgenom autoupdate

if ! zgenom saved; then
  echo "Initializing zgenom"
  rm -f $ZDOTDIR/*.zwc(N) \
        $XDG_CACHE_HOME/zsh/*(N) \
        $ZGEN_INIT.zwc

if [[ "$OSTYPE" =~ ^darwin ]]; then
    zgenom load junegunn/fzf shell
    zgenom load jeffreytse/zsh-vi-mode
    zgenom load hlissner/zsh-autopair autopair.zsh
  else 
    zgenom load junegunn/fzf shell
    zgenom load jeffreytse/zsh-vi-mode
    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load zsh-users/zsh-completions src
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-history-substring-search
    zgenom load romkatv/powerlevel10k powerlevel10k
    zgenom load hlissner/zsh-autopair autopair.zsh
fi

  zgenom save
  zgenom compile $ZDOTDIR
fi


if [[ $TERM != dumb ]]; then
  autoload -Uz compinit && compinit -u -d $ZSH_CACHE/zcompdump
  source $ZDOTDIR/config.zsh
	source $ZDOTDIR/keybinds.zsh
	source $ZDOTDIR/completion.zsh
	source $ZDOTDIR/aliases.zsh
	
	autopair-init
  # nice project local environment variablees
	eval "$(direnv hook zsh)"
  # nicer cd / cdpath
  eval "$(zoxide init zsh)"
  # asdf package manager
  source $(brew --prefix asdf)/libexec/asdf.sh
  # node version manager
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash
  source <(fzf --zsh)
  # nice prompt
  eval "$(starship init zsh)"
fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
