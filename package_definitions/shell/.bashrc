#!/bin/bash
# linked file from google drive

# runs on NON-LOGIN shell

echo "${INDENT}Loading ~/.bashrc"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export HISTCONTROL=ignoredups:ignorespace

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" # share history with other sessions
# After each command, append to the history file and reread it
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# when using !-1, !33, etc, verify command before executing
# http://askubuntu.com/questions/342886/select-commands-from-bash-history
shopt -s histverify
shopt -s histappend # append to history file, don't overwrite

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[[ -r ~/.shellrc ]] && INDENT="$INDENT  " source ~/.shellrc

