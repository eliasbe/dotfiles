# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/bin* ]]; then
  path_append "$HOME/bin"
fi

# PATH="${PATH:+${PATH}:}$HOME/bin"

source $HOME/.dotfiles/shell/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.shell/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.shell/fzf/key-bindings.zsh"
source "$HOME/.shell/fzf/fzf-git.sh"

# TODO: systemize ' and "
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='fd --type f --follow --hidden --exclude ".git"'
export FZF_DEFAULT_OPTS='
        --preview  "bat --color=always --line-range :100 {}"
        --bind "ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)"
        --bind "ctrl-alt-s:toggle-preview"
        --bind "ctrl-s:change-preview(tree -C {})"
        --bind "ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up"'
        # --bind "j:down,k:up"' # assess
#        --preview "tree -C {} | head -50"'
export FZF_CTRL_R_OPTS="
        --preview 'echo {}' --preview-window up:3:hidden:wrap
        --bind 'ctrl-s:toggle-preview'
        --color header:italic
        --header 'Press CTRL-S to preview whole command'" 
        
#        --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#        --header 'Press CTRL-Y to copy command into clipboard'" 

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :100 {}'"
export FZF_ALT_C_COMMAND='fd --type d . --hidden --exclude ".git"'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
# Use fd command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

## Functions
## fkill - kill processes - list only the ones you can kill.
fkill() {
    local pid
    local preview=""
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m --preview=$preview | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m  --preview=$preview| awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

## Homebrew
alias binfo='brew info $(brew formulae | fzf)'
alias binstall='brew install $(brew formulae | fzf)'
# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]ackage
bip() {
  local inst=$(brew search "$@" | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]ackage
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]ackage (e.g. uninstall)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}

### fasd
alg() {
    [ $# -gt 0 ] && fasd -f -e ${EDITOR} "$*" && return
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vim "${file}" || return 1
}

# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
unalias z
z() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf --preview "tree -C {} | head -50" -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}


### Git
# fshow - git commit browser
ggrs ()
{
  git log --all --graph --decorate --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
   fzf --ansi --no-sort --reverse --tiebreak=index --preview \
   'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
   --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-d:preview-page-down,ctrl-u:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:60%
}


# fco_preview - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
gbrs() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}
