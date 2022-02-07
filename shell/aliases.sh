# ls aliases
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls'

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# git aliases || git module hjá prezto hefur tekið yfir
#alias gs="git status"
#alias gc="git commit"
#alias gcm="gc -m"
#alias g="git"
#alias gg="git log --all --graph --decorate --oneline
alias ggr="git log --all --graph --decorate --oneline"

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Uppfæra 'allt'
alias upp='~/.dotfiles/uppfaera.sh'

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

