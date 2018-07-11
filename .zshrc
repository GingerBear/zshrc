# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"
alias cl="clear"
alias gs='git status '
alias gb='git branch '
alias gl='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s" --date=short'
alias gc='git commit'
alias gca='git commit -am '
alias gd='git diff'
alias go='git checkout'
alias gpu='git pull upstream '
alias gpo='git push origin '
alias gom='go master && gpu master'
alias gob='go master && gpu master && go -b '
alias gdd='git branch -D '
alias gpr='git-open '
alias ga='git commit -a --amend --no-edit'
# alias makepr='git push origin HEAD && gpr'
alias chost='st /private/etc/hosts'
alias zshrc='st $HOME/.zshrc'
alias gst='git reset '
alias xc='open ios/*.xcworkspace'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:"
# export MANPATH="/usr/local/man:$MANPATH"

export NODE_PATH=/usr/local/lib/node_modules

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="$HOME/.ssh/dsa_id"


### CODE BEING RAN

pj(){
  cd $HOME/Projects/"${1:-}"
}

# Add this below as well:
# Tell zsh to autocomplete directory names in the same directory as
# the function's when typing a command based on the shell function.

compctl -/ -W $HOME/Projects pj

checkout() {
    git checkout -b $1
    git checkout $1
}

m() {
    project=$1
    cd $HOME/Projects/$project.m
}

api() {
    project=$1
    start=$2
    cd $HOME/Projects/$project.api
    if [[ ! -z $start ]]; then
      git checkout master
      git pull upstream master
      nodemon app.js --w 1
    fi
}

# will run bb platform project
alias bbp='node --debug app'

# will run back end
alias be='node --debug=5859 app -w 0'

# will run front end
alias fe='node --debug app -w 0 --url http://localhost:4000'

# will run front end
alias fe-stage='node --debug app -w 0 --url http://localhost:4000 --stage_url http://localhost-stage:4000'

# will run front end in production mode
alias pfe='NODE_ENV=production node app -w 1 --url http://localhost:4000 -p 3000'

# will run new front end
alias nfe='gulp build && npm start --url=http://localhost:4000'

# will run front end in debuger
alias dfe='node-debug app.js'

# will run front end quickly
alias qfe='npm start --url=http://localhost:4000'

# will start node inspector
alias node-inspector='node $HOME/Projects/node-inspector/bin/inspector.js'

# will start node inspector
alias ni='node-inspector --no-preload --save-live-edit --web-port=8088'

# will start node inspector with no preload
alias ni-all='node-inspector --save-live-edit --web-port=8088'

# will run front end nodemon
alias mfe='nodemon app.js -w 0 --url http://localhost:4000'

# will open front end and run front end
alias openfe='open http://localhost:3000 && fe'

# will open back end and run back end
alias openbe='open http://localhost:4000 && be'

# will run node app
alias na='node app'

# will run node app in production mode
alias pna='NODE_ENV=production node app'

# core demo start
alias core-demo='SQL_HOST=mysql0-php-prod.in.bbhosted.com SQL_USER=demo_user SQL_PASS=KhsVtgT77DEVzXT3 node --debug app'

# will open sublime text
st() {
    dir=$1
    if [[ -z $dir ]]; then
      dir=.
    fi
    /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $dir
}

## make pr
makepr() {
  message=$1
  if [[ -z $message ]]; then
    git push origin HEAD && $HOME/bin/git-open
  else
    git commit -am $1 && git push origin HEAD && $HOME/bin/git-open
  fi
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/" && python -m SimpleHTTPServer "$port"
}

# Add facebook flow command to global
PATH="$PATH:$HOME/Projects/flow/"

# Add extra file into path
PATH="$PATH:$HOME/Projects/path/"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/Projects/flutter/bin:$PATH"
