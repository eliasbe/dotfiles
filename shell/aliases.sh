# Meta
alias af="alias | fzf"

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

alias duu="du --max-depth=1 ."

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias t="clear"

alias v="vim"

alias et="r"

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

# display tsv
alias tsvsplit='sed G | tr '\''\t'\'' '\''\n'\'''
alias trnslview='sed G | tr '\''\t'\'' '\''\n'\'' | fmt -t -w $((160 < $(tput cols) ? 160 : $(tput cols) ))  | less +-R '

alias tf='tail -f'
