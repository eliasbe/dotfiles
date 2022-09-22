# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/hpcapps/lib-mimir/software/Anaconda3/2021.11/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/hpcapps/lib-mimir/software/Anaconda3/2021.11/etc/profile.d/conda.sh" ]; then
        . "/hpcapps/lib-mimir/software/Anaconda3/2021.11/etc/profile.d/conda.sh"
    else
        export PATH="/hpcapps/lib-mimir/software/Anaconda3/2021.11/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


source /users/home/ebe19/.config/broot/launcher/bash/br
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.shell/aliases.sh

source /Users/k/.config/broot/launcher/bash/br

eljaenv
