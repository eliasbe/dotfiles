# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null
source "~/.shell/completion.bash"

# Key bindings
# ------------
# source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
source "~/.shell/key-bindings.bash"
