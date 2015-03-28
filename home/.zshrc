# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="nebirhos"
ZSH_THEME="superjarin"
#ZSH_THEME="oh-my-solarized"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow gem debian vi-mode rvm bundler)

source $ZSH/oh-my-zsh.sh

#solarized ls
#eval `dircolors ~/.dircolors`

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
[[ -z "$terminfo[khome]" ]] || bindkey -M viins "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M viins "$terminfo[kend]" end-of-line
[[ -z "$terminfo[kdch1]" ]] || bindkey -M viins "$terminfo[kdch1]" vi-delete-char

export PATH=$PATH:/usr/local/scala-2.10.3/bin
export PATH=$PATH:/usr/local/play-2.1.1
export PATH=$PATH:/home/jeremy/.cabal/bin
export PATH=$PATH:/opt/vagrant/bin
export PATH=$PATH:/usr/lib/go/bin
export PATH=/usr/local/haste-compiler/bin:$PATH
#export PATH=$PATH:/usr/local/ghc-7.8.3/bin

# below was needed to use my local ctags
export PATH=/usr/local/bin:$PATH

if [ -f ~/.zsh_nocorrect ]; then
	while read -r COMMAND; do
	  alias $COMMAND="nocorrect $COMMAND"
	done < ~/.zsh_nocorrect
fi

#unbind C-s
bindkey -r "^s"
stty -ixon

#set JAVA_HOME using update alternative loc
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
export EDITOR=/usr/bin/vim

#fix solarized theme in tmux
export TERM="xterm-256color"
alias tmux="TERM=xterm-256color tmux"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#riak expansions
rget () {
	curl http://127.0.0.1:8098/riak/$1
}

# erlang
#. /home/jeremy/erlang/r16b/activate

#nix
#. /etc/profile.d/nix.sho#
export PATH=/home/jeremy/.cabal/bin:$PATH
export COCOS_CONSOLE_ROOT=/usr/local/cocos2d-x-3.0/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/android-dev/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/usr/local/android-dev/sdk
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/bin
