# based on:
# http://tammersaleh.com/posts/a-better-rvm-bash-prompt/

# checks if code diverged from HEAD
# if so, then show "!" mark after current branch name in prompt
function __git_dirty {
  git diff --quiet HEAD &>/dev/null 
  [ $? == 1 ] && echo "!"
}

# get current git branch
function __git_branch {
  __git_ps1 "[%s]"
}

# show ruby version only if GEM_HOME is set
# which implies that custom ruby env is present in current dir
function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] \
      && {
        # placing this code here, speeds up moving between dirs
        # so that current ruby version is checked only if $GEM_HOME is set
        local current_version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}');
        local full="${current_version}@${gemset}";
        echo "[$full]"; \
      }
}


bash_prompt() {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="$B\$(__my_rvm_ruby_version)$Y\$(__git_branch)$EMY\$(__git_dirty)\[$(tput setaf 1)\]\u@\h:\w \t \[$(tput sgr0)\]${NONE}$ "
}

bash_prompt
unset bash_prompt
