#!/bin/bash
# runs on LOGIN shell

echo "${INDENT}Loading ~/.bash_profile"

# when using !-1, !33, etc, verify command before executing
# http://askubuntu.com/questions/342886/select-commands-from-bash-history
shopt -s histverify

# Set Terminal Text script from: http://superuser.com/questions/292652/change-iterm2-window-and-tab-titles-in-zsh
# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
title     () { setTerminalText 0 $@; }
# stt_tab   () { setTerminalText 1 $@; }
# stt_title () { setTerminalText 2 $@; }

[[ -r ~/.profile ]] && INDENT="${INDENT}  " source "$HOME/.profile"

[[ -r ~/.bashrc ]] && INDENT="${INDENT}  " source "$HOME/.bashrc"
