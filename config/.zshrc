if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

for f in ~/.zsh/*.zsh; do
  [[ $f -nt $f.zwc ]] && zcompile $f
done

# ZInit settings
if [ -e "${HOME}/.zinit" ]; then
    export ZINIT_HOME=${HOME}/.zinit
    source ${ZINIT_HOME}/zinit.zsh
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    for f in $(ls ~/.zsh/*.zsh); do
        zinit snippet $f
    done

    BULLETTRAIN_PROMPT_ADD_NEWLINE=false
    BULLETTRAIN_PROMPT_ORDER=(
        time
        context
        dir
        virtualenv
        git
        status
    )
    zstyle ':omz:alpha:lib:git' async-prompt no
    zinit snippet OMZ::lib/git.zsh
    zinit snippet OMZ::plugins/git/git.plugin.zsh
    zinit cdclear -q # <- forget completions provided up to this moment
    setopt promptsubst
    zinit light caiogondim/bullet-train.zsh
    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-completions
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-history-substring-search
    zinit light Aloxaf/fzf-tab
    zinit light b4b4r07/emoji-cli
    zinit light b4b4r07/enhancd
    zinit light mollifier/cd-gitroot

    autoload -Uz compinit
    if [[ ! -f ~/.zcompdump || ~/.zcompdump -ot ~/.zshrc ]]; then
      compinit -C
    else
      compinit
    fi
    zinit cdreplay -q
fi
