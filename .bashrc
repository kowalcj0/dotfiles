# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && eval "$(SHELL=/bin/sh lesspipe.sh)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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


# MOJ BASHRC

# If not running interactively, don't do anything
# it's a quick fix when ssh'ing to a machine running a random cow text
[[ $- == *i* ]] || return


###############################################################################
# 3rd party scripts
###############################################################################
export PATH="$PATH:./3rdParty/soundcloud-dl" #sound cloud downloader


## =============================================================================
## Bash history related cfg
## http://unix.stackexchange.com/a/48113
## =============================================================================
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


## =============================================================================
## handy aliases
## =============================================================================
alias alt='sudo update-alternatives --config ' # quickly change between installed version of an application
alias ba='vim ~/.bashrc'   # edit bashrc file
alias vv='vim ~/.vimrc'    # edit vimrc file
alias env='env | sort'     # gives you sorted list of env variables
alias du='du -kh'          # Makes a more readable output.
alias df='df -kTh'
alias h='history'
alias j='jobs -l'
function find_file() { find . -iname "*$@*"; }
alias f=find_file
alias hg='history | grep '  # grep history
alias o='xdg-open'         # open selected file with an associated application
alias which='type -a'
alias scan='sudo clamscan -r / --bell --quiet --infected --exclude-dir=/sys --exclude-dir=/dev --exclude-dir=/proc --exclude=.vmdk --exclude=.flac --exclude=.nef'
alias ..='cd ..'
alias .='cd .. && cd -' # goes one level up and re-enters the last directory. Usueful with RVM etc
alias ct="ctags --exclude=.git --exclude='*.log' --exclude='*.pyc' --exclude=.ropeproject -R *"
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias s2u="rename 'y/ /_/' *" # replace spaces in filenames with underscores
alias rs2u=replacesSpacesRecursively  # recursive s2u
alias types=findTypes
alias sacd2flac='for f in *.dsf ; do dsf2flac -i "${f}" -o "${f}.flac" ; done;'
alias tostereo=sacdiso2stereo
alias tomulti=sacdiso2multi
alias ll='ls -Al --group-directories-first'
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias h0='set +o history && echo "Bash history is turned off!!"' # turn off history
alias h1='set -o history && echo "Bash history is turned on!!"' # turn off history
alias tree='tree -Csu'     # nice alternative to 'recursive ls'
alias port='lsof -Pnl +M -i4 | grep ' # find app that listens on given port
alias serv='initctl list | sort' # list all the startup services
alias agi='sudo apt-get install ' # shortcut for installing apps
alias agu='sudo apt-get update ' # shortcut for updating the repos
alias agr='sudo apt-get remove --purge ' # shortcut for removing a package
alias agc='sudo apt-get clean ' # to finish cleaning the env after deinstallation
alias myip=`wget -qO- http://ipecho.net/plain && echo` # get public IP address
alias pkgf=findPackageUsingAptAndDpkg; # search for a package using apt and dpkg
alias pkgi='dpkg -s '      # nice info about the selected package
alias pkgd='aptitude why ' # find what depends on specified package
alias pkg=findInstalledPackage; # find among installed packages
alias depyc='find . -name "*.pyc" -exec rm -rf {} \;' # delete all pyc files
alias tafs='for f in *; do tar cjf "$f.bz2" "$f"; done' # tar and bz2 all directories into separate files
alias untar='tar -zxvf' # untar tar.gz file
alias dps='docker ps -a --format "table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.CreatedAt}}\t{{.Image}}\t{{.Ports}}"' # show all running docker containers
alias dev=dev;

# $1 - package name you want to find
function findPackageUsingAptAndDpkg() {
    echo "Searching for a package '${1}' using apt-cache:...
*******************************************************";
    apt-cache search ${1};

    echo -e "\nSearching for a package '${1}' using dpkg:...
*******************************************************";
    dpkg -l \*${1}\*;
}

function findInstalledPackage() {
    dpkg --get-selections | grep -v deinstall |  grep ${1}
}

function findTypes() {
    find . -type f -iname '*.*' | awk -F . '{print $NF}' | sort | uniq -c | sort
}


function allIso2Dsf() {
    SCRIPT_PATH=`pwd`
    for iso in $(find . -iname "*.iso")
    do
        folder=$(dirname ${iso})
        file=$(basename ${iso})
        cd "${folder}" && {
            echo "Converting: ${file}";
            sacd_extract -2 -s --input="${file}"
            cd "${SCRIPT_PATH}";
        } || {
            echo "couldn't get into folder: ${folder}";
        }
    done
}


function sacdiso2stereo() {
    sacd_extract -2 -s -P --input="${1}"
}

function sacdiso2multi() {
    sacd_extract -m -s -P --input="${1}"
}

function replacesSpacesRecursively() {
    # replace spaces in dirs first
    find -name "* *" -type d | rename 's/ /_/g' && {
        # then in filenames
        find -name "* *" -type f | rename 's/ /_/g';
    }
}

function dev() {
    h0
    source ~/dev.sh
    h1
}

# bash - disable interpreting <C-s> by the terminal
# No ttyctl, so we need to save and then restore terminal settings
stty -ixon

# rename image files based on exif data
# will move files to separate folders and rename files
# usage:
# rnbyexif *.jpg
alias rnbyexif='exiftool -r -d %Y-%m-%d/%Y%m%d-%H%M%S_%%f.%%le "-filename<createdate" '


# simple netcat based command that will do a port scan of a given ip range
# it this simpliest form it will scan only last octet of the ip range
# usage:
#    portscaniprange "192.268.0" 22
# http://www.commandlinefu.com/commands/view/3626/port-scan-a-range-of-hosts-with-netcat.
function portscaniprange() {
    local iprange="${1}"
    local port="${2}"
    for i in {43..43}; do
        nc -v -n -z -w 1 ${iprange}.$i ${port};
    done
}


## =============================================================================
## git related config
## =============================================================================
export GIT_SSL_NO_VERIFY=true


## =============================================================================
## git command aliases
## =============================================================================
# but first configure the difftool http://stackoverflow.com/a/3713865
alias ga='git branch -a' # show all branches
alias gb='git diff --stat-width=250 --stat-width=250 --stat-name-width=500 --color ' # diff branches by showing only modified files, usage: gb master..janusz or gb janusz..master
alias gc='git checkout ' # a shortcut for checking out a branch
alias gd=gitBranchDiffFile; # compare file between branches
alias ge='git ls-files . --exclude-standard --others' #show all the non-tracked files
alias gh='git difftool HEAD' # use default diff tool to compare changes since HEAD
alias gi='git ls-files . --ignored --exclude-standard --others' #show all the ignored files
alias gk='gitk --all' # view full version tree in gitk
alias gl='git log -n ' # show a given number of commit comments, ex: gl 2
alias gll="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" # a nice representation of the commit tree
#alias go='git log origin/master..master' # list commits not pushed to the origin
alias gp='git show --pretty="format:" --name-only ' # pretty print of files changes in given commit, ex.: gp commitID
alias gs='git status' # show the status
alias gf='git checkout master && git pull && git fetch --prune && git branch -a'

# $1 first branch
# $2 second branch
# $3 file to compare
function gitBranchDiffFile() {
    git diff "${1}" "${2}" -- "${3}";
}

# to grep through all the files found by find in the current dir,
# g will search through more files
# whereas gg will skip more files, like js, minified files and so on
# Usage: g pattern
function g() { find . -type f ! -iname "*.pyc" ! -iname ".git" ! -iname "*log*" ! -iname "tags" ! -iname ".ropeproject" -print0 | xargs -0 grep -n --colour=auto "${1}" ; }
function gg() { find . -type f ! -iname "*.pyc" ! -iname "*.js" ! -iname "*.css" ! -iname "*log*" ! -iname "*jquery*" ! -iname "*min*" ! -iname "*less*" ! -iname "*map*" ! -iname "*.json" ! -name "*.html" ! -iname "tags" ! -iname ".ropeproject" ! -path "*.git*" ! -path "*.kitchen*" ! -path "*.bundle*" ! -path git -print0 | xargs -0 grep --colour=auto "${1}" ; }

# find all of the distinct file extensions in a folder
# http://stackoverflow.com/questions/1842254/how-can-i-find-all-of-the-distinct-file-extensions-in-a-folder-hierarchy
function ext() { find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u; }


# simple way to convert a music file (mp3) to a mp4 video with static image
# really useful for youtube
# example: mp3tovidwithimg cover.jpeg music_track.mp3 output_vid.mp4
function mp3tovidwithimg() { ffmpeg -threads 0 -loop 1 -shortest -f image2 -i $1 -i $2 -c:v libx264 -tune stillimage -acodec copy -strict experimental $3; }

# decrypting pdf files
function decrpdf() { gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$2 -c .setpdfwrite -f $1; }

# simple xml data extractor, use it: xtag tagName filename
function xtag() { awk -F'[<|>]' '/<'$1'>/{print $3}' $2; }


# will calculate md4sum from a input string
# example 1: md5 "this is a long string test_string"
# example 2: md5 singleWordExample
function md5() { md5sum<<<$1 | cut -f1 -d' '; }

# a fix for SSL issues with Pidgin
export NSS_SSL_CBC_RANDOM_IV=0

export JAVA_HOME=/usr

# Amazon EC2 settings
#export EC2_HOME="/usr/lib/ec2/ec2-api-tools-1.6.6.4" # Amazon EC2 tools
#export AWS_ACCESS_KEY=
#export AWS_SECRET_KEY=
#export EC2_PRIVATE_KEY="~/.ec2/pk-****.pem"
#export EC2_CERT="~/.ec2/cert-****.pem"
#export EC2_URL=https://ec2.amazonaws.com
export PATH=$PATH:$HOME/bin
# set 256 color for terminator
# http://vim.wikia.com/wiki/256_colors_setup_for_console_Vim#Terminal_recap
# http://askubuntu.com/a/14891
export TERM=xterm-256color

source ~/.git-prompt.sh
source ~/.git-completion.bash

GIT_PROMPT_ONLY_IN_REPO=1

# set the PS1
DIR="$(dirname $(readlink -m "$BASH_SOURCE"))"
source ${DIR}/prompt.sh

source $(which virtualenvwrapper.sh) # registers all virtualenv commands for u

