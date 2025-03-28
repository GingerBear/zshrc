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
# alias gc='git commit'
alias gfu='git fetch upstream'
alias gd='git diff'
alias go='git checkout'
alias gpu='git pull upstream '
alias gpo='git push origin '
alias gom='go master && gpu master'
alias gob='go master && gpu master && go -b '
alias gdd='go master && git branch -D '
alias gpr='git-open '
alias ga='git commit -a --amend --no-edit'
# alias makepr='git push origin HEAD && gpr'
alias chost='st /private/etc/hosts'
alias zshrc='st $HOME/.zshrc'
alias gst='git reset '
alias xc='open ios/*.xcworkspace'
alias s='npm start'
alias hg='history | grep'
alias find-file='find . -print | grep -i'

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
plugins=(
    git
    zsh-autosuggestions
    fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

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

# will open sublime text
st() {
    dir=$1
    if [[ -z $dir ]]; then
      dir=.
    fi
    /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $dir
}

# git commit and message 
gc() {
    message=""

    for i; do
      message="$message $i";
    done

    message_trimed="$(echo -e "${message}" | sed -e 's/^[[:space:]]*//')"

    echo "git commit -am \"$message_trimed\""
    git commit -am "$message_trimed"
}

# git commit and message with prefix branch name
gcm() {
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}
    message=""

    for i; do 
        message="$message $i";
    done

    echo "git add ."
    git add .

    echo "git commit -am \"$branch_name$message\""
    git commit -am "$branch_name$message"
}

# pull down mr 
mr() {
    echo "git fetch origin"
    git fetch origin

    echo "git checkout -b $1 origin/$1"
    git checkout -b $1 origin/$1
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

# added by Miniconda2 installer
export PATH="/Users/neil.ding/miniconda2/bin:$PATH"
export PATH=~/.local/bin:$PATH
export PATH="$PATH:/usr/local/smlnj/bin"
