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
plugins=(git git-flow gem vi-mode rvm bundler kube-ps1)

source $ZSH/oh-my-zsh.sh

#solarized ls
#eval `dircolors ~/.dircolors`

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
[[ -z "$terminfo[khome]" ]] || bindkey -M viins "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M viins "$terminfo[kend]" end-of-line
[[ -z "$terminfo[kdch1]" ]] || bindkey -M viins "$terminfo[kdch1]" vi-delete-char

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line


if [ -f ~/.zsh_nocorrect ]; then
	while read -r COMMAND; do
	  alias $COMMAND="nocorrect $COMMAND"
	done < ~/.zsh_nocorrect
fi

#unbind C-s
bindkey -r "^s"
stty -ixon


#fix solarized theme in tmux
export TERM="xterm-256color"
alias tmux="TERM=xterm-256color tmux"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export EDITOR=/usr/bin/vim

if [[ `uname` == 'Linux' ]]; then
  function docker() { sudo docker $@; }
  function docker-compose() { sudo docker-compose $@; }
  function emacs() { setsid emacs $@ > /dev/null }
else
  function emacs() { /usr/bin/nohup emacs $@ > /dev/null 2>&1 & }
fi

setopt histignorespace

alias etck='sudo etckeeper'
alias etcg='sudo etckeeper vcs'

if type hub > /dev/null; then
  alias git=hub
fi

alias demo="HEROKU_APP=smart-erp-demo heroku $@"
alias staging="HEROKU_APP=smart-erp-staging heroku $@"
alias prod="HEROKU_APP=smart-erp-production heroku $@"
alias cont="HEROKU_APP=smart-erp-contingency heroku $@"
alias reporting="HEROKU_APP=smart-erp-reporting heroku $@"
alias cons="HEROKU_APP=smart-erp-consolidated heroku $@"

function stack-completions() {
  autoload -U +X compinit && compinit
  autoload -U +X bashcompinit && bashcompinit
  eval "$(stack --bash-completion-script stack)"
}

alias k=kubectl

which stack &> /dev/null && stack-completions

if [[ -f /opt/google-cloud-sdk/completion.zsh.inc ]]; then
  source /opt/google-cloud-sdk/completion.zsh.inc
fi

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi
