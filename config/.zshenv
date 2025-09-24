typeset -gx -U path
if [[ $(uname -m) = "x86_64" ]]; then
    path=( \
        ~/bin(N-/) \
        ~/sbin(N-/) \
        ~/.local/bin(N-/) \
        ~/.rbenv/bin(N-/) \
        ~/.rbenv/shims(N-/) \
        ~/.goenv/bin(N-/) \
        ~/.goenv/shims(N-/) \
        ~/.pyenv/bin(N-/) \
        ~/.pyenv/shims(N-/) \
        ~/.nodenv/bin(N-/) \
        ~/.nodenv/shims(N-/) \
        ~/.zinit/bin(N-/) \
        ~/.tmux/bin(N-/) \
        ~/.rd/bin(N-/) \
        /usr/local/bin(N-/) \
        /usr/local/sbin(N-/)
        "$path[@]" \
        )
else
    path=( \
        ~/bin(N-/) \
        ~/sbin(N-/) \
        ~/.local/bin(N-/) \
        ~/.rbenv/bin(N-/) \
        ~/.rbenv/shims(N-/) \
        ~/.goenv/bin(N-/) \
        ~/.goenv/shims(N-/) \
        ~/.pyenv/bin(N-/) \
        ~/.pyenv/shims(N-/) \
        ~/.nodenv/bin(N-/) \
        ~/.nodenv/shims(N-/) \
        ~/.zinit/bin(N-/) \
        ~/.tmux/bin(N-/) \
        ~/.rd/bin(N-/) \
        /opt/homebrew/bin(N-/)
        /opt/homebrew/sbin(N-/)
        /usr/local/bin(N-/) \
        /usr/local/sbin(N-/)
        "$path[@]" \
        )
fi

typeset -gx -U fpath
fpath=( \
    ~/.rbenv/completions(N-/) \
    $fpath \
    )

setopt no_global_rcs

# autoload
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# Language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Editor
export EDITOR=vim
export GIT_EDITOR="${EDITOR}"

# Pager
export PAGER=less

# Less status line
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'

# Less man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Set ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# Settings for golang
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Declare the environment variables
export CORRECT_IGNORE='_*'
export CORRECT_IGNORE_FILE='.*'
export WORDCHARS='*?_-.[]~!#$%^(){}<>'
export TERM="xterm-256color"

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
# Share history with different sessions
setopt share_history
# Do not add in root
if [[ $UID == 0 ]]; then
    unset HISTFILE
    export SAVEHIST=0
fi

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
