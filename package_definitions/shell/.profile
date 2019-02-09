# runs on LOGIN shell, overridden by .bash_login or .zlogin
# runs if using `sh`

# login vs non-login, interactive vs non-interactive: http://hayne.net/MacDev/Notes/unixFAQ.html#whichShell
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
# in bash non-interactive shells (when shell runs in a script) $BASH_ENV determines what file is preloaded, if any.

thisfile="~/.profile"
echo "${INDENT}Loading ${thisfile}"

# stop terminal flow control so as to stop shadowing search-forward \Cs
# http://stackoverflow.com/questions/12373586/how-to-reverse-i-search-back-and-forth
# stop ubuntu login alert: stty standard input inappropriate ioctl for device
if `tty -s`; then
	stty -ixon
fi

pathmunge () {
	if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)" ; then
		 if [ "$2" = "after" ] ; then
				PATH="$PATH:$1"
		 else
				PATH="$1:$PATH"
		 fi
	fi
}

export GOPATH=$HOME/dev/go
export GOME=$GOPATH/src/github.com/kdavh
export DOTFILES=$HOME/dev/dotfiles

if [[ -r "$HOME/dev/dotfiles-private/env.sh" ]]; then
	INDENT="${INDENT}  " source "$HOME/dev/dotfiles-private/env.sh"
fi

export EDITOR=vim
export PAGER="less"
export LESS="-RMin"

export SAVEHIST=9999
export HISTSIZE=9999
export HISTFILE=$HOME/.history
export HIST_EXPIRE_DUPS_FIRST=true

# edit path
pathmunge "/usr/local/bin" # put local at front of path for brew installs to be run before system installs
pathmunge "$HOME/bin"
pathmunge $GOPATH/bin after
pathmunge /usr/local/go/bin after
pathmunge "$DOTFILES/bin" after
pathmunge "$HOME/.yarn/bin"
pathmunge "$HOME/.local/bin" after

# rust binaries
if [[ -d $HOME/.cargo ]]; then
	pathmunge "$HOME/.cargo/bin" after
fi

export CC=/usr/bin/gcc

# load work specific environment
if [[ -r "$HOME/.profile-work" ]]; then
		INDENT="${INDENT}  " source "$HOME/.profile-work"
fi

export PATH="$HOME/.cargo/bin:$PATH"
