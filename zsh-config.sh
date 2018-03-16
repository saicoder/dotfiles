# ======================================================
#               MAIN ZSH CONFIG FILE
#           Author: Branko Krstic <saicoder>   
#
#         This file should be sourced from .zshrc
# ======================================================

# UI ===================
autoload -U colors && colors
autoload -U compinit promptinit
compinit
promptinit

export CLICOLOR=1 #cli color enabled

# PROMPT
setopt promptsubst interactivecomments
export PROMPT="[%n] %9F%1~%(#.#.$)%f "
export RPROMPT='%F{green}%~%f'
export RPROMPT='$(___r_prompt)'

# if git show branch and status or if not show just path
function ___r_prompt(){
  if [ -d .git ]; then
    __branch="$(git rev-parse --abbrev-ref HEAD)"

    __status="$(git diff-index --quiet HEAD -- && echo 0 || echo 1)"
    __status_color="$([ "$__status" -eq "0" ] && echo '%F{green}' || echo '%F{magenta}')"
    __status_icon="$([ "$__status" -eq "0" ] && printf '\xE2\x9C\x93\x0A' || printf '\xE2\x93\xA7\x0A')"

    echo "$__status_color$__status_icon [$__branch]%f";
  else
    echo '%F{green}%~%f'
  fi
}


# HISTORY
export SAVEHIST=100
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredups
export HISTSIZE=450
export HISTFILESIZE=450
export EDITOR=$(which nvim)


# COMMAND COMP
autoload -U compinit
compinit
setopt correct #autocorect


# ALIASES
alias sha1='openssl sha -sha1 -hex'
alias sha256='openssl sha -sha256 -hex'
alias ll='ls -lah'
alias h='history'

alias ..="cd .."

# GIT
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gc="git commit"
alias push="git push"
alias pull="git pull"


# Quick Launch menu used for ex: quick login to machines. Example (in .zshrc):
#   QUICK_LAUNCH_COMMANDS = ('ssh root@hello.com' 'ssh 127.0.0.1')
#   alias ql="quick_lanch"

function quick_lanch() {
  tput setaf 4;
  printf "\n============================================"
  printf "\n              Quick Launch"
  printf "\n============================================\n\n"

  for ((ix = 1; ix <= $#QUICK_LAUNCH_COMMANDS; ix++)); do
    tput setaf 2; printf "($ix) => "
    tput setaf 3; echo "$QUICK_LAUNCH_COMMANDS[$ix]"
  done

  tput setaf 4; printf "\n==> "; tput sgr0
  read index; 

  if [ "$QUICK_LAUNCH_COMMANDS[$index]" ]; then
    sh -c "$QUICK_LAUNCH_COMMANDS[$index]"
  else
    echo "Invalid option"
  fi
}




