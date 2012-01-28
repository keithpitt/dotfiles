# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="nicoulaj"
# export ZSH_THEME="random"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew ruby lighthouse gem git-flow github osx pow rails3 rvm ssh-agent bundler autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# For RVM on Lion
function using_gcc() {
  env CC="/usr/bin/gcc" ARCHFLAGS="-arch x86_64" ARCHS="x86_64" $*
}

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load scripts
source "$HOME/.scripts/publish_to.sh"

export APPLEDOC_TEMPLATE_PATH="$HOME/Development/appledoc/Templates"
export EDITOR=vim
export PGOPTIONS='-c client_min_messages=WARNING'

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
# export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
# export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
# export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"

# For awesomeness
alias boom!="git pull --rebase && rake db:migrate && rake && git push"
alias boom="boom!"
alias jasmine_consumer='be rake jasmine CONFIG_YML=jasmine_consumer.yml'
alias v='vim'
alias gogo='foreman start'
