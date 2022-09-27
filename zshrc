# Startup profiling
# zmodload zsh/zprof

# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
eval "$(fasd --init auto)"

export PATH=/Users/k/bin:$PATH

# Use vi keybindings
bindkey -v


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/hpcdata/Mimir/ebe19/elja_env/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/hpcdata/Mimir/ebe19/elja_env/etc/profile.d/conda.sh" ]; then
        . "/hpcdata/Mimir/ebe19/elja_env/etc/profile.d/conda.sh"
    else
        export PATH="/hpcdata/Mimir/ebe19/elja_env/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


setopt HIST_IGNORE_SPACE

export TERM=xterm-256color



# KANNSKI FÆRA Í SÉR SKRÁR

# Use vim style line editing in zsh
bindkey -v
# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line
bindkey -a '^V' edit-command-line

# PROMPT='[%D{%K:%M}] '$PROMPT

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
source ~/.shell/aliases.sh

# Git fzf
source ~/.shell/fzf-git.sh/fzf-git.sh
# eval spaceship_vi_mode_enable

# source /Users/ebe19/broot/launcher/zsh/br

### Environment variables
export EDITOR=vim
export PAGER=less

# Startup profiling
# zprof

#   source /users/home/ebe19/.config/broot/launcher/bash/br
