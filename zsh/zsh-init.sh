# ======================================================
#               MAIN ZSH CONFIG FILE
#           Author: Branko Krstic <saicoder>   
#
#         This file should be sourced from .zshrc
# ======================================================

# UI & PROMPT ===================
autoload -U colors && colors
autoload -U compinit promptinit
compinit
promptinit

PROMPT="[%n] %9F%1~%(#.#.$)%f "
RPROMPT="%F{green}%~%f"


# COMMAND COMP
autoload -U compinit
compinit
