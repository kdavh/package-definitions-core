#!/bin/bash
# runs on LOGIN shell

echo "${INDENT}Loading ~/.bash_profile"

[[ -r ~/.profile ]] && INDENT="${INDENT}  " source "$HOME/.profile"

[[ -r ~/.bashrc ]] && INDENT="${INDENT}  " source "$HOME/.bashrc"
