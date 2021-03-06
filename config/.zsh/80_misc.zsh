umask 022

# Ctrl + S for Vim
stty -ixon -ixoff

export RBENV_ROOT=$HOME/.rbenv
export GOENV_ROOT=$HOME/.goenv
export PYENV_ROOT=$HOME/.pyenv
export LINUXBREW_ROOT=$HOME/.linuxbrew
if is_osx; then {
  export GCLOUD_ROOT=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/
  if [ "$(uname -m)" = 'arm64' ]; then
    export GCLOUD_ROOT=/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/
  fi
}
fi

if has 'rbenv'; then
  eval "$(rbenv init -)"
  source $RBENV_ROOT/completions/rbenv.zsh
fi
if has 'goenv'; then
  eval "$(goenv init -)"
  source $GOENV_ROOT/completions/goenv.zsh
  export GO111MODULE=on
fi
if has 'pyenv'; then
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  source $PYENV_ROOT/completions/pyenv.zsh
fi
if has 'kubectl'; then
  source <(kubectl completion zsh)
fi
if [ -d $LINUXBREW_ROOT ]; then
  eval $($LINUXBREW_ROOT/bin/brew shellenv)
fi
if [ -d $GCLOUD_ROOT ]; then
  source $GCLOUD_ROOT/path.zsh.inc
  source $GCLOUD_ROOT/completion.zsh.inc
fi

zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
