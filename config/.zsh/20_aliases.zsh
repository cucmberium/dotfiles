alias ls='ls -F -G'
alias ll='ls -l -h -F -G'
alias la='ls -a -F -G'
alias du='du -h'
alias df='df -h'
alias less='less -R'
alias mkdir='mkdir -p'
alias vi='vim'

if is_osx; then
  alias tmux="TERM=screen-256color-bce tmux"
fi

alias cgrep='grep --color=always'
alias wttr='curl http://wttr.in/'
alias pip-update-all-package="pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip install -U"

# Use if colordiff exists
if has 'colordiff'; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi
