#
# ~/.bashrc
#

# Path (artık profile.d'de)
#export PATH="$PATH:~/bin:~/.local/bin"
#export EDITOR="nvim"

HISTCONTROL=ignoreboth:erasedups

# Add aliases before returning
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
RESET="\[\e[39m\]"
#PS1='[\u@\h \W]\$ '
PS1="$RED[\u@\h $GREEN\w$RED]$RESET\$ "
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"


. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash
