###########################################################
# .bash_profile file for Christian Hedin
#
#
# 
###########################################################

# Setup exports
export CLICOLOR=1
export EDITOR="mvim"
export ANDROID_NDK_ROOT=/Volumes/Storage/Developer/android-ndk-r6b
export NODE_PATH=/usr/local/lib/node_modules
export ANDROID_HOME=/Volumes/Storage/Developer/android-sdk-macosx
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$RUBY_GEM_BIN:~/bin:~/Documents/Coding/Scripts
export ANT_HOME='/usr/local/ant'

# Setup some aliases
alias ls='gls --color=auto'
alias i=' ruby /usr/local/bin/I_time_reporting.rb'
alias I=' ruby /usr/local/bin/I_time_reporting.rb'
alias g='/usr/local/bin/git'
alias xc='cd ~/Documents/Coding/XCode'
alias ra='cd ~/Documents/Coding/Ruby\ on\ Rails'
alias ja='cd ~/Documents/Coding/Java'
alias ru='cd ~/Documents/Coding/Ruby'
alias t='~/Documents/Coding/Scripts/OCUnit2JUnit/ocunit2junit_console.rb'
alias dircolors='gdircolors'
alias yesterday='~/Documents/Coding/Scripts/yesterday.rb'
alias grep='grep --color=auto'
alias serve='python -m SimpleHTTPServer 8000'
alias r='rails'
alias subs='echo "Recursively updating Git submodules..."; git submodule update --init --recursive'
alias pico=vim
alias vim='mvim -v'

# Set the number of open files to be 1024
ulimit -S -n 1024

# Setup the fancy color prompt
function proml {
local BLUE="\[\033[0;34m\]"
local RED="\[\033[0;31m\]"
local LIGHT_BLUE="\[\033[1;34m\]"
local LIGHT_CYAN="\[\033[1;36m\]"
local LIGHT_RED="\[\033[1;31m\]"
local WHITE="\[\033[1;37m\]"
local NO_COLOUR="\[\033[0m\]"

case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="${TITLEBAR}\
$BLUE[$WHITE\$(date +%H:%M)$BLUE]\
$BLUE[$WHITE\u$LIGHT_CYAN@$WHITE\h:$NO_COLOUR\w"
PS1=$PS1'$(__git_ps1 " #%s")'
PS1=$PS1"$BLUE]\
$NO_COLOUR\$ "
PS2='> '
PS4='+ '
}

# Vim as diff for git
function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}


# git completion
#source /usr/local/bin/git-completion.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi


# Do the prompt
proml

# Do some dir colors
eval `dircolors ~/.dir_colors`

# Ruby versioning
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi


# And a Fortune!
fortune -s aynrand
