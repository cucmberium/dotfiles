umask 022

# Ctrl + S for Vim
stty -ixon -ixoff

export RBENV_ROOT=$HOME/.rbenv
export GOENV_ROOT=$HOME/.goenv
export PYENV_ROOT=$HOME/.pyenv
export JENV_ROOT=$HOME/.jenv

if has 'rbenv'; then
  # For performance: eval "$(rbenv init -)"
  source $RBENV_ROOT/completions/rbenv.zsh
fi
if has 'goenv'; then
  # For performance: eval "$(goenv init -)"
  source $GOENV_ROOT/completions/goenv.zsh
fi
if has 'pyenv'; then
  # For performance: eval "$(pyenv init -)"
  # For performance: eval "$(pyenv virtualenv-init -)"
  source $PYENV_ROOT/completions/pyenv.zsh
fi
if has 'jenv'; then
  # For performance: eval "$(jenv init -)"
  source $JENV_ROOT/completions/jenv.zsh
fi


zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin