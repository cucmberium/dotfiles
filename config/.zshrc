

# ZPlug settings
if [ -e "${HOME}/.zplug" ]; then
    export ZPLUG_HOME=${HOME}/.zplug
    source ${ZPLUG_HOME}/init.zsh
    zplug "b4b4r07/enhancd", use:init.sh
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-history-substring-search", defer:2
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "mollifier/cd-gitroot"
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


