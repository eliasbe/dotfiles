path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "$HOME/.shell.here"
    echo "here -> $(readlink $HOME/.shell.here)"
}

there="$HOME/.shell.here"

there() {
    cd "$(readlink "${there}")"
}

# TODO: Move to fzf?
# List git files and show their diffs
gds() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview --bind 'enter:execute(git add {} &)'
}

# list conda environments and their packages with fzf
cel() {
    preview='conda list -n {1}'
    conda env list | awk '{if (NR>2) print}' | fzf -m --ansi --preview $preview --bind 'enter:become(conda list -n {1} | awk "{if (NR>3) print}" | fzf --preview=""),ctrl-d:preview-page-down,ctrl-u:preview-page-up'
}

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Update local dotfiles
dflu() {
    (
        cd ~/.dotfiles_local && git pull --ff-only && ./install -q 
    )
}

# Update local dotfiles and install binaries
dflui() {
    (
        cd ~/.dotfiles_local && git pull --ff-only && ./install -q && ./install -c install-binaries.conf.yaml
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
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
# bindkey '^o' ranger-cd
alias oo=ranger-cd

jql ()
{
    jq -C '.' "$@" | less -R
}

jqfl ()
{
    local width=${2:-100} # Second argument, 100 default value
    jq -C '.' "$1" | fmt -w "$width" | less -R
}

jqm ()
{
    jq -C '.' "$@" | more
}

wcl ()
{
    wc -l *
}

key2json() {
  local file="$1"
  local key="$2"

  if [ -z "$file" ] || [ -z "$key" ]; then
    echo "Usage: read_json_value <file> <key>"
    return 1
  fi

  if [ ! -f "$file" ]; then
    echo "File not found: $file"
    return 1
  fi

  cat "$file" | jq ".$key | fromjson" -C | less -R
}

# Forward port $2 on compute-$1 to localhost
eljaport()
{
    ssh -t -t elja -L "$2":localhost:"$2" ssh compute-$1 -L "$2":localhost:"$2"
}

# SSH into compute-$1
eljacompute()
{
    ssh -t -t elja ssh compute-$1
}

lns()
{
    ln -s "$1" .
}

lnss()
{
    lns $(d | fzf | awk '{print $2}')
}

cancels() {
  local jobinfo jobid

  # Get the full job line from squeue based on fzf selection
  jobinfo=$(squeue | fzf --header="Select a job to cancel" --no-preview)

  # Extract the job ID (first column)
  jobid=$(echo "$jobinfo" | awk '{print $1}')

  if [[ -n $jobid && $jobid =~ ^[0-9]+$ ]]; then
    echo "Are you sure you want to cancel the following job?"
    echo "$jobinfo"
    echo "Press Enter to cancel, or Ctrl+C to abort."
    read -r

    scancel "$jobid"
    echo "Job $jobid canceled."
  else
    echo "No valid job selected."
  fi
}
