# Startup profiling
# zmodload zsh/zprof

# Load shell functions
source ~/.shell/functions.sh

# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#
eval "$(fasd --init auto)"
# export PATH=/Users/k/bin:$PATH
source ~/.shell/zsh-autosuggestions/zsh-autosuggestions.zsh

# Allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# TODO: move to macos local
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

eval "$(fasd --init auto)"
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export PATH=$HOME/bin:$PATH

# Use vi keybindings
bindkey -v

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
source ~/.shell/plugins/fzf-git.sh/fzf-git.sh
# source ~/.shell/fzf-git.sh/fzf-git.sh
# eval spaceship_vi_mode_enable

## source /Users/k/.config/broot/launcher/bash/br

### Environment variables
export EDITOR=vim
export VISUAL=vim
export PAGER=less

# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

# Startup profiling
# zprof

# Miðeind/Ada specific
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/data/scratch/elias/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/data/scratch/elias/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/data/scratch/elias/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/data/scratch/elias/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export CUDA_VISIBLE_DEVICES="$CUDA_VISIBLE_DEVICES"

# Ath. conda aktíverar sjálfkrafa ada -> sub. Veit ekki ástæðuna.
# ca ada

source /home/elias/.config/broot/launcher/bash/br
