#
# ~/.bashrc
#

HISTCONTROL=ignoreboth:erasedups

# Add aliases before returning
[[ -f ~/aliasrc ]] && . ~/aliasrc

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

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
