# ls aliases
#alias ll='ls -lh'
#alias la='ls -lha'
#alias l='ls'
# alias ls="exa"
alias l="exa -l --git"
alias la="l -a"
alias ll="l --sort=oldest"
alias lll="l --sort=newest"
alias llll="l --reverse"
alias lls="l --reverse --sort=size"
alias llss="l --sort=size"
alias laa="la --sort=oldest"
alias laaa="la --sort=newest"
alias las="la --reverse --sort=size"
alias lass="la --sort=size"
alias tre="exa --tree"
alias tree="exa --tree --level=2"
alias treee="exa --tree --level=3"
alias treeee="exa --tree --level=4"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias t="clear"
alias et="!!"

alias v="vim"

# git aliases || git module hjá prezto hefur tekið yfir og ákveðin aliös í gitconfig
#alias gs="git status"
#alias gc="git commit"
#alias gcm="gc -m"
alias g="git"
#alias gg="git log --all --graph --decorate --oneline
alias ggr="git log --all --graph --decorate --oneline"
alias gcob='g checkout $(gb | fzf --height 30% --reverse)'
alias gcor='g checkout --track $(gb -remote | fzf)'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Cat replacement
alias bcat="bat -pp"
alias batp="bat -p"

# Uppfæra 'allt'
alias upp='~/.dotfiles/uppfaera.sh'

alias ca='conda activate'
alias cda='conda deactivate'

# Ranger
alias rr='ranger'

# display tsv
alias tsvsplit='sed G | tr '\''\t'\'' '\''\n'\'''
alias trnslview='sed G | tr '\''\t'\'' '\''\n'\'' | fmt -t -w $((160 < $(tput cols) ? 160 : $(tput cols) ))  | less +-R '

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# fh - repeat history
fh()
{
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.

ranger-cd ()
{
    tempfile="$(mktemp)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
# bindkey '^o' ranger-cd
alias oo=ranger-cd
