# TODO: Make paths universal

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/bin* ]]; then
  path_append "$HOME/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.shell/fzf/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.shell/fzf/key-bindings.bash"
source "$HOME/.shell/fzf/fzf-git.sh/fzf-git.sh"
