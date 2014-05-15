ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
osx brew brew-cask colored-man
npm
python pip django
ant
history-substring-search
web-search
)

source $ZSH/oh-my-zsh.sh

alias la="ls -A"
alias brews="brew list"
alias casks="brew cask list"
alias js="node"
alias ag="ag --smart-case --follow --group"

export EDITOR='vim'
export VISUAL=$EDITOR

# Stop zsh from catching ^ chars.
setopt NO_NOMATCH

# Hide annoying '%' sign.
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

# Homebrew
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Ruby
PATH="/usr/local/opt/ruby/bin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Node
PATH="/usr/local/share/npm/bin:$PATH"

# Latex / BasicTex
PATH="/usr/texbin:$PATH"

# Eclipse
export ECLIPSE_HOME="/opt/homebrew-cask/Caskroom/eclipse-ide/4.3.2/eclipse"
PATH="$ECLIPSE_HOME:$PATH"

export PATH
