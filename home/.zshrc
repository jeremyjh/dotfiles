# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="nebirhos"
ZSH_THEME="superjarin"

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


bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
[[ -z "$terminfo[khome]" ]] || bindkey -M viins "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M viins "$terminfo[kend]" end-of-line
[[ -z "$terminfo[kdch1]" ]] || bindkey -M viins "$terminfo[kdch1]" vi-delete-char

export PATH=$PATH:/usr/local/sbt/bin
export PATH=$PATH:/usr/local/play-2.0.4
export PATH=$PATH:/home/jeremy/.cabal/bin
export PATH=$PATH:/opt/vagrant/bin
export PATH=$PATH:/usr/lib/go/bin

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

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
