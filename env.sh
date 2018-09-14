alias ..='cd ..'
alias l='ls -l'
alias la='ls -la'

function mkcd() { mkdir -p "$@" && cd "$_"; }
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

alias c='code-insiders .'
alias cc='code .'
alias cs='code'
alias chromedbg2='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222'
alias chromedbg='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir=/tmp/chromedata'
alias ci='code-insiders'
alias codecpu='ps -eo pcpu,user,pid,command | grep Code | grep "^\s*[1-9]"'
alias cleancode='code-insiders --disable-extensions --user-data-dir=`mktemp -d` --skip-getting-started ~/code/vscode'

function citmp() { code-insiders --user-data-dir=$(mktemp -d) "$@" }

alias smokedev='npm test -- --latest "/Users/roblou/code/vscode/scripts/code.sh" --stable "/Applications/Visual Studio Code.app/Contents/MacOS/Electron"'

alias gc='git commit'
alias gch='git checkout'
alias gcl='git clone'
alias gf='git fetch'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'
alias gs='git stash'
alias gsh='git stash'
alias gst='git status'

alias ni='npm install'
alias nl='npm link'
alias nlc='npm link vscode-chrome-debug-core'
alias nr='npm run'
alias nul='npm unlink'
alias nulc='npm unlink vscode-chrome-debug-core && ni vscode-chrome-debug-core'
alias yr='yarn run'

alias nv='node --version'

function swaphosts() {
    sudo mv /etc/hosts /etc/hosts.tmp
    sudo mv /etc/hosts.bk /etc/hosts
    sudo mv /etc/hosts.tmp /etc/hosts.bk
}

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
# http://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -f __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/code/go"

export GPG_TTY=$(tty)