#!/bin/bash
# linked file from google drive

# runs on NON-LOGIN shell

echo "${INDENT}Loading ~/.bashrc"

[[ -r ~/.shellrc ]] && INDENT="$INDENT  " source ~/.shellrc

