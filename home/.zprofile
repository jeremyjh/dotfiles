PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$HOME/.bin

export PATH=$PATH:/usr/local/scala-2.11.8/bin
export PATH=/usr/local/sbt/bin:$PATH
export PATH=$PATH:/usr/local/play-2.1.1
export PATH=$PATH:/opt/vagrant/bin
export PATH=$PATH:/usr/lib/go/bin
export PATH=/usr/local/haste-compiler/bin:$PATH
export PATH=/usr/local/clion-2016.2/bin/cmake/bin:$PATH
export PATH=$PATH:/usr/lib/hadoop/bin
export PATH=$PATH:/usr/local/hbase/bin
export PATH=$PATH:$HOME/go/bin

# below was needed to use my local ctags
export PATH=/usr/local/bin:$PATH
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/android-ndk
export ANDROID_NDK_ROOT=$NDK_ROOT
export PATH=$NDK_ROOT:$PATH

#Golang homebrew paths
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/bin

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/usr/local/cocos2d-x-3.8.1/tools/cocos2d-console/bin
export COCOS_TEMPLATES_ROOT=/usr/local/cocos2d-x-3.8.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
#Locals
export PATH=~/.local/bin:$PATH

#Current Haskell

export URHO3D_HOME=/usr/local/Urho3D-1.5/build

#maven
export M2_HOME=/opt/maven

#hadoop
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native"

#workaround bug in SDL causing high CPU usage in AtomicGameEngine
export SDL_AUDIODRIVER=pulseaudio

# local sessions should connect to existing ssh-agent
idfile=~/.agentid
if [ -z $SSH_CLIENT ]
then
    is_local_client=YES
    if [[ `uname` == 'Linux' ]]; then
      export SSH_ASKPASS="/usr/bin/ksshaskpass"
    fi
else
    is_local_client=NO
fi
if [ -z $SSH_AUTH_SOCK ]
then
    if ps x -o 'command' -U `whoami` | grep "^ssh-agent" &> /dev/null
    then
        # Attach current shell to existing *local* ssh-agent session
        test -r $idfile && eval `cat $idfile` || echo "ERROR: expected $idfile to exist but it does not..."
    elif [ $is_local_client = "YES" ]
    then
        # Create a new *local* ssh-agent session
        if eval `ssh-agent`
        then
            export SSH_AGENT_PID
            export SSH_AUTH_SOCK
            # output ok; only happens on local (interactive) terminal
            echo "export SSH_AGENT_PID=$SSH_AGENT_PID" > $idfile
            echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> $idfile
        else
            rm -f $idfile
        fi
    else
        tty -s && echo "Skipping ssh-agent setup since this is a remote session."
    fi
fi
unset idfile is_local_client

#man pages stay on screen on exit
export LESS="-R"
export POSTGRES_USER=jeremy

source $HOME/.envlocal

export PATH="$HOME/.cargo/bin:$PATH"

#. /home/jeremy/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$HOME/.bin:$PATH"
source $HOME/.asdf/asdf.sh

export ERL_AFLAGS="-kernel shell_history enabled"

if [ -f $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
