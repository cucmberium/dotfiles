
export SHELL=/bin/zsh
export TERM="xterm-256color"

# Editor and Lang Settings
export EDITOR=vim
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

export PATH=/usr/local:$PATH

# ZPlug settings
if [ -e "${HOME}/.zplug" ]; then
    export ZPLUG_HOME=${HOME}/.zplug
    source ${ZPLUG_HOME}/init.zsh
    zplug "stedolan/jq", \
        from:gh-r, \
        as:command, \
        rename-to:jq
    zplug "b4b4r07/emoji-cli", \
        on:"stedolan/jq"
    zplug "mollifier/cd-gitroot"
    zplug "b4b4r07/enhancd", use:init.sh
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-history-substring-search", defer:2
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "mrowa44/emojify", as:command
    zplug "junegunn/fzf-bin", \
        from:gh-r, \
        as:command, \
        rename-to:fzf, \
        use:"*darwin*amd64*"
    BULLETTRAIN_PROMPT_ADD_NEWLINE=false
    BULLETTRAIN_PROMPT_ORDER=(
        time
        context
        dir
        virtualenv
        git
        status
    )
    zplug "caiogondim/bullet-train.zsh", use:"bullet-train.zsh-theme", as:theme

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load --verbose
    
    if zplug check b4b4r07/enhancd; then
        # setting if enhancd is available
        export ENHANCD_FILTER=fzf-tmux
    fi
fi


# History
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000


# Bindkey
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

stty stop undef
stty start undef

zstyle :compinstall filename '~/.zshrc'

# Color and Completion
autoload -Uz compinit
compinit -u

#export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# Options
#setopt menu_complete
setopt correct
setopt list_packed
setopt nolistbeep
setopt magic_equal_subst
setopt notify

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

setopt auto_pushd
setopt pushd_ignore_dups

setopt extended_glob
setopt interactive_comments

# Alias
alias tmux="TERM=screen-256color-bce tmux"

alias ls='ls -F -G'
alias ll='ls -l -h -F -G'
alias la='ls -a -F -G'
alias du='du -h'
alias df='df -h'
alias grep='grep --color=always'
alias less='less -R'

alias nyancat='telnet nyancat.dakko.us'

alias tenki='curl http://wttr.in/nagaoka'

alias pip-update-all-package="pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip install -U"

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# fzf Fuzzy Finder
# Key bindings
# ------------
if [[ $- == *i* ]]; then

# CTRL-T - Paste the selected file path(s) into the command line
__fsel() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

__fzf_use_tmux__() {
  [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
}

__fzfcmd() {
  __fzf_use_tmux__ &&
    echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-file-widget
bindkey '^T' fzf-file-widget

# ALT-C - cd into the selected directory
fzf-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$dir"
  local ret=$?
  zle reset-prompt
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N    fzf-cd-widget
bindkey '\ec' fzf-cd-widget

# CTRL-R - Paste the selected command from history into the command line
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  selected=( $(fc -l 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(q)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

fi
