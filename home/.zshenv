PATH=$PATH:$HOME/.rvm/bin

#set JAVA_HOME using update alternative loc
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")

export PATH=$PATH:/usr/local/scala-2.10.3/bin
export PATH=/usr/local/sbt/bin:$PATH
export PATH=$PATH:/usr/local/play-2.1.1
export PATH=$PATH:/home/jeremy/.cabal/bin
export PATH=$PATH:/opt/vagrant/bin
export PATH=$PATH:/usr/lib/go/bin
export PATH=/usr/local/haste-compiler/bin:$PATH
export PATH=/home/jeremy/.multirust/toolchains/stable/cargo/bin:$PATH

# below was needed to use my local ctags
export PATH=/usr/local/bin:$PATH
export PATH=/home/jeremy/.cabal/bin:$PATH
export COCOS_CONSOLE_ROOT=/usr/local/cocos2d-x-3.8.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/android-dev/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/usr/local/android-dev/sdk
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/bin

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/home/jeremy/Downloads/cocos2d-x-3.8.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/usr/local/cocos2d-x-3.8.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Erlang
source ~/erlang/18.2.1/activate

#Locals
export PATH=~/.local/bin:$PATH

#Current Haskell
export PATH=/home/jeremy/.stack/programs/x86_64-linux/ghc-7.10.3/bin:$PATH
