# Aliases
source ~/.shell/aliases.sh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(fasd --init auto)"
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export PATH=/Users/k/bin:$PATH

# Use vi keybindings
bindkey -v


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


setopt HIST_IGNORE_SPACE

