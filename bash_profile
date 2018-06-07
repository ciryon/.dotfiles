###########################################################
# .bash_profile file for Christian Hedin
#
#
# 
###########################################################

# Quit if we're not an interactive shell
[ -z "$PS1" ] && return

# Setup exports
export CLICOLOR=1
export EDITOR="vim"
export REACT_EDITOR="vim"
export ANDROID_HOME=~/Library/Android/sdk/
export AWS_CONFIG_FILE=~/.aws/config
export PATH=/usr/local/bin:$M2_HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH:$RUBY_GEM_BIN:~/bin:$HOME/Coding/misc_scripts:$HOME/Coding/Istari/AWS/scripts:$ANDROID_HOME/platform-tools

# Set the number of open files to be 1024
ulimit -S -n 1024

if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
fi

# AWS completion
complete -C aws_completer aws
alias aws-profile="source aws-profile"
alias aws="aws-wrapper"

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

#PS1="${TITLEBAR}\
PS1="${TITLEBAR}\
$BLUE[$WHITE\$(date +%H:%M)$BLUE]\
$BLUE[$WHITE\u$LIGHT_CYAN@$WHITE\h:$NO_COLOUR\W"
PS1=$PS1'$(__git_ps1 " #%s")'
PS1=$PS1"$BLUE]\
  $NO_COLOUR\n\$ "
PS2='> '
PS4='+ '
}

# Do the prompt
proml

# Setup some aliases
alias i=' ruby /usr/local/bin/I_time_reporting.rb'
alias I=' ruby /usr/local/bin/I_time_reporting.rb'
alias g='/usr/local/bin/git'
alias xc='cd ~/Coding/XCode'
alias an='cd ~/Coding/Android'
alias ra='cd ~/Coding/Ruby_on_Rails'
alias ja='cd ~/Coding/Java'
alias js='cd ~/Coding/JavaScript'
alias ru='cd ~/Coding/Ruby'
alias is='cd ~/Coding/Istari'
alias t='tmux'
alias yesterday='~/Coding/Scripts/yesterday.rb'
alias grep='grep --color=auto'
alias serve='python -m SimpleHTTPServer 8000'
alias r='rails'
alias subs='echo "Recursively updating Git submodules..."; git submodule update --init --recursive'
alias pico=vim
alias chrome-insecure='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --allow-running-insecure-content  --disable-web-security'
#alias vim='nvim' # Lets see how this works...

# Ruby versioning
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# tabtab source for ec2-ssh package
# uninstall by removing these lines or running `tabtab uninstall ec2-ssh`
[ -f /usr/local/lib/node_modules/ec2-ssh/node_modules/tabtab/.completions/ec2-ssh.bash ] && . /usr/local/lib/node_modules/ec2-ssh/node_modules/tabtab/.completions/ec2-ssh.bash

# man formatters
vman () {
  MANWIDTH=120 MANPAGER='col -bx' man $@ | vim
}

# And a Fortune!
echo ""
tput setaf 1; fortune -s aynrand
echo ""
echo ""

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

export LANG=en_US.UTF-8

# direnv
eval "$(direnv hook bash)"

# Secrets file (not to be version controlled)
SECRETS=~/.secrets && test -f $SECRETS && source $SECRETS
