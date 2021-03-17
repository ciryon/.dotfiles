export ZSH="/Users/ciryon/.oh-my-zsh"
# ZSH_THEME="agnoster" # fancy
# ZSH_THEME="amuse" # fancy
ZSH_THEME="fox"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  dotenv
  aws
  nvm
  #rvm
  brew
  )

# Plugin settings
ZSH_DOTENV_FILE=.envrc
ZSH_DOTENV_PROMPT=false
SHOW_AWS_PROMPT=false

source $ZSH/oh-my-zsh.sh

# User configuration

setopt noautomenu
setopt nomenucomplete

export ANDROID_HOME=/Users/$USER/Library/Android/sdk

# export MANPATH="/usr/local/man:$MANPATH"
export AWS_CONFIG_FILE=~/.aws/config

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Aliases
alias g='/usr/local/bin/git'
alias xc='cd ~/Coding/XCode'
alias an='cd ~/Coding/Android'
alias ra='cd ~/Coding/Ruby_on_Rails'
alias ja='cd ~/Coding/Java'
alias js='cd ~/Coding/JavaScript'
alias ru='cd ~/Coding/Ruby'
alias pu='cd ~/Coding/PulsSolutions && asp puls-dev && echo Puls'
alias is='cd ~/Coding/Istari && asp istari && echo Istari'
alias t='tmux'
alias yesterday='~/Coding/misc_scripts/yesterday.rb'
alias grep='grep --color=auto'
alias serve='python -m SimpleHTTPServer 8000'
alias r='rails'
alias subs='echo "Recursively updating Git submodules..."; git submodule update --init --recursive'
alias pico=vim
alias chrome-insecure='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --allow-running-insecure-content  --disable-web-security'
alias aws-profile="asp"
alias aws="aws-wrapper"
alias chrome="open -a \"Google Chrome\""
# alias atom="echo 'You did mean code right?'; code"
alias s="code .; yarn run dev"
alias prod="node ./scripts/deploy_site.js www puls-solutions.com appen sv dryRun; echo 'config is for prod now' "
alias logs='echo "Tailing ${PWD##*/}-${ENVIRONMENT}"; aws logs tail --format short --follow  "/aws/lambda/${PWD##*/}-${ENVIRONMENT}"'

# Pager with nice colors
export PAGER="most"

# And a Fortune!
echo ""
tput setaf 1; fortune -s aynrand
echo ""
echo ""

# Secrets file (not to be version controlled)
SECRETS=~/.secrets && test -f $SECRETS && source $SECRETS

export NVM_DIR="~/.nvm"
source ~/.nvm/nvm.sh
source /Users/ciryon/.rvm/scripts/rvm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/usr/local/bin:/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$RUBY_GEM_BIN:~/bin:$HOME/Coding/misc_scripts:$HOME/Coding/Istari/AWS/scripts:$HOME/dev/flutter/.pub-cache/bin:$HOME/dev/flutter/bin:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
