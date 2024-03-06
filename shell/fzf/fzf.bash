# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/bin* ]]; then
  path_append "$HOME/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.dotfiles/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.dotfiles/fzf/shell/key-bindings.bash"
source "$HOME/.shell/fzf/fzf-git.sh/fzf-git.sh"
