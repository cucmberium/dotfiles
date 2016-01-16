
export SHELL=/bin/zsh

# Editor and Lang Settings
export EDITOR=vim
export LANG=ja_JP.UTF8

# History
HISTFILE=~/.histfile
HISTSIZE=8192
SAVEHIST=8192


# Bindkey
bindkey -v


zstyle :compinstall filename '/home/clarkdale/.zshrc'


# Color and Completion

# for Other Linux
#autoload -Uz compinit
#compinit
#export ZSH=$HOME/.oh-my-zsh
#export ZSH_THEME="gentoo"
#source $ZSH/oh-my-zsh.sh

# for Gentoo Linux
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1


export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# Options
#setopt menu_complete
setopt correct
setopt list_packed
setopt nolistbeep
setopt magic_equal_subst
setopt notify

setopt extended_history
setopt share_history
setopt hist_reduce_blanks


# Alias
alias ls='ls -F --color'
alias ll='ls -l -h -F --color'
alias la='ls -a -F --color'
alias du='du -h'
alias df='df -h'

alias pyon='pyonpyon'
