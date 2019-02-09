#!/bin/bash
# linked file from google drive

# runs on NON-LOGIN shell

echo "Loading ~/.bashrc"

[[ -r ~/.shellrc ]] && INDENT="$INDENT  " source ~/.shellrc
# .shellrc loads nvm and sets $NVM_DIR
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
