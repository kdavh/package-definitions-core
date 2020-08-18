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

function pathmunge () {
	if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)" ; then
		 if [ "$2" = "after" ] ; then
				PATH="$PATH:$1"
		 else
				PATH="$1:$PATH"
		 fi
	fi
}

extract() {
      if [ -f $1 ] ; then
              case $1 in
                      *.tar.bz2)      tar xjf $1              ;;
                      *.tar.gz)       tar xzf $1              ;;
                      *.bz2)          bunzip2 $1              ;;
                      *.rar)          rar x $1                ;;
                      *.gz)           gunzip $1               ;;
                      *.tar)          tar xf $1               ;;
                      *.tbz2)         tar xjf $1              ;;
                      *.tgz)          tar xzf $1              ;;
                      *.xz)           xz --decompress  $1     ;;
                      *.zip)          unzip $1                ;;
                      *.Z)            uncompress $1           ;;
                      *)              echo "'$1' cannot be extracted via extract()" ;;
              esac
      else
              echo "'$1' is not a valid file"
      fi
}

for f in $(find ${HOME}/.profile.d -maxdepth 1 -mindepth 1); do source $f; done


# edit path
pathmunge "/usr/local/bin" # put local at front of path for brew installs to be run before system installs
pathmunge "$HOME/bin"
pathmunge "$HOME/.local/bin" after

# export CC=/usr/bin/gcc
