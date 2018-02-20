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
setopt promptsubst
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

alias gs="git status"
alias push="git push"
alias pull="git pull"
alias commit="git commit"
alias add="git add"


