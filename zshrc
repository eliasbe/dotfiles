# Startup profiling
# zmodload zsh/zprof

# Load shell functions
source ~/.shell/functions.sh


# Allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

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
# eval spaceship_vi_mode_enable

source /Users/k/.config/broot/launcher/bash/br

### Environment variables
export EDITOR=vim
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
