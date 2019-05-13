## Unimplemented or no longer used commands, etc

### TODO: all the stuff in dotfiles


### TODO: debian: xclip \ xsel \ inotify-tools \

### TODO:
#   # better cat
#   curl https://github.com/sharkdp/bat/releases/download/v0.6.1/bat_0.6.1_amd64.deb -L -o bat.deb
#   sudo dpkg -i bat.deb
#   rm bat.deb

#   # fuzzy finder, replaces ctrl-R shell lookup, other things
#   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#   ~/.fzf/install

#   # better git diff tool, not really the same interface as diff though
#   curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o ~/bin/diff-so-fancy

#   # better find (by file name)
#   curl https://github.com/sharkdp/fd/releases/download/v7.1.0/fd_7.1.0_amd64.deb -L -o fd.deb
#   sudo dpkg -i fd.deb
#   rm fd.deb

#   # better du
#   sudo apt install ncdu
#   # better file explorer
#   sudo apt install nnn

#   # better help / man
#   npm install -g tldr

#   # get notified about things
#   go get -u github.com/variadico/noti/cmd/noti


# alias g='git'
# alias gh='AUTH_TOKEN=$GITHUB_REPO_EDIT_TOKEN ${DOTFILES}/lib/kdavh/github_api.sh'

# # start postgresql installed by brew
# alias psql-brew-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# # linux, debian
# alias apin='sudo apt-get install'
# alias aprm='sudo apt-get remove'
# alias apclean='sudo apt-get autoremove; sudo apt-get autoclean'
# alias apshow='apt-cache show'

# # linux, arch
# alias pcin='sudo pacman -S'
# alias pcrm='sudo pacman -Rs'
# alias pcshow='sudo pacman -Ss'

# alias cat=bat
# alias preview="fzf --preview 'bat --color \"always\" {}'"
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# # add support for ctrl+o to open selected file in Atom
# export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(atom -n {})+abort'"

# alias top=htop
# alias du="ncdu -r -x --exclude .git --exclude node_modules"
# alias help='tldr'
# alias man='tldr'

