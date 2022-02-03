#!/bin/zsh



# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
  ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

######################Custome Git Repos########################################################
printf "${BLUE}%s\n" "========================================================================================="
printf "${GREEN}%s${BOLD}\n" "Updating GIT REPOS"
if # Upgdate all custom vim plugins
  for plugin in ~/.dotfiles/.vim/*; do
    if [ -d "$plugin/.git" ]; then
      git -C "$plugin" pull
    fi
  done
  for plugin in ~/Repos/*; do
    if [ -d "$plugin/.git" ]; then
      git -C "$plugin" pull
    fi
  done
then
  printf '%s' "$GREEN"
  printf '%s\n' '   ________________   ____  __________  ____  _____'
  printf '%s\n' '  / ____/  _/_  __/  / __ \/ ____/ __ \/ __ \/ ___/'
  printf '%s\n' ' / / __ / /  / /    / /_/ / __/ / /_/ / / / /\__ \ '
  printf '%s\n' '/ /_/ // /  / /    / _, _/ /___/ ____/ /_/ /___/ / '
  printf '%s\n' '\____/___/ /_/    /_/ |_/_____/_/    \____//____/  '
  printf '%s\n' '                                                   '
  printf "${BLUE}%s\n" "Hooray! Your GIT REPOS have been updated and/or are at the current versions."
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
fi
printf "${BLUE}%s\n" "========================================================================================="

#######################UPDATE ZPREZTO##########################################################
printf "${GREEN}%s${BOLD}\n" "Updating zprezto"
zprezto-update
printf "${BLUE}%s\n" "========================================================================================="
##########################HOMEBREW UPDATES###############################################
printf "${GREEN}%s${BOLD}\n" "Updating HOMEBREW"
# Upgdate all Homebrew plugins and casks

brew update
brew upgrade
# brew doctor
# brew cleanup

printf '%s' "$GREEN"
printf '%s\n' '    __  __                     __                     '
printf '%s\n' '   / / / /___  ____ ___  ___  / /_  ________ _      __'
printf '%s\n' '  / /_/ / __ \/ __ `__ \/ _ \/ __ \/ ___/ _ \ | /| / /'
printf '%s\n' ' / __  / /_/ / / / / / /  __/ /_/ / /  /  __/ |/ |/ / '
printf '%s\n' '/_/ /_/\____/_/ /_/ /_/\___/_.___/_/   \___/|__/|__/  '
printf '%s\n' '                                                      '
printf "${BLUE}%s\n" "Hooray! HOMEBREW has been updated and/or is at the current version."
printf "${BLUE}%s\n" "========================================================================================="
##########################HOMEBREW UPDATES END############################################

printf "${GREEN}%s${BOLD}\n" "Updating base conda packages"
conda update --all -y
