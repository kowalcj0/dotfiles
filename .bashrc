# If not running interactively, don't do anything
# it's a quick fix when ssh'ing to a machine running a random cow text
[[ $- == *i* ]] || return



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

# changes the prompt to something like: root@medusa:/tmp 14:25:56 >
export PS1='\[$(tput setaf 1)\]\u@\h:\w \t> \[$(tput sgr0)\]'

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
alias f='find . -iname '
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
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
alias agi='sudo apt-get install ' # shortcut for installing apps
alias agu='sudo apt-get update ' # shortcut for updating the repos
alias agr='sudo apt-get remove --purge ' # shortcut for removing a package
alias agc='sudo apt-get clean ' # to finish cleaning the env after deinstallation
alias pkgf=findPackageUsingAptAndDpkg; # search for a package using apt and dpkg
alias pkgi='dpkg -s '      # nice info about the selected package
alias depyc='find . -name "*.pyc" -exec rm -rf {} \;' # delete all pyc files

# $1 - package name you want to find
function findPackageUsingAptAndDpkg() { 
    echo "Searching for a package '${1}' using apt-cache:...
*******************************************************";
    apt-cache search ${1};

    echo -e "\nSearching for a package '${1}' using dpkg:...
*******************************************************";
    dpkg -l \*${1}\*; 
}


## =============================================================================
## git related config
## =============================================================================
export GIT_SSL_NO_VERIFY=true


## =============================================================================
## git command aliases
## =============================================================================
alias gp='git show --pretty="format:" --name-only ' # pretty print of files changes in given commit, ex.: gp commitID
alias gb='git diff --stat-width=250 --stat-width=250 --stat-name-width=500 --color ' # diff branches by showing only modified files, usage: gb master..janusz or gb janusz..master
alias gc='git checkout ' # a shortcut for checking out a branch
alias gl='git log -n ' # show a given number of commit comments, ex: gl 2
alias gll="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" # a nice representation of the commit tree
alias gh='git difftool HEAD' # use default diff tool to compare changes since HEAD
# but first configure the difftool http://stackoverflow.com/a/3713865
alias gs='git status' # show the status
alias ge='git ls-files . --exclude-standard --others' #show all the non-tracked files
alias gi='git ls-files . --ignored --exclude-standard --others' #show all the ignored files
alias go='git log origin/master..master' # list commits not pushed to the origin
alias gk='gitk --all' # view full version tree in gitk
alias gd=gitBranchDiffFile;

# $1 first branch
# $2 second branch
# $3 file to compare
function gitBranchDiffFile() {
    git diff "${1}" "${2}" -- "${3}";
}

# to grep through all the files found by find in the current dir, 
# Usage: g pattern
function g() { find . -type f -print0 | xargs -0 grep --colour=auto "${1}" ; }

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
export TERM="xterm-256color"
