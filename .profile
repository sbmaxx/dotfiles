export PS1="\u@\h \w $ "

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTFILE=~/.bash_history-`tty | sed -e 's/\/dev\///'`
export HISTCONTROL=ignoreboth

export PATH=${PATH}:/usr/local/bin/atom
export PATH=${PATH}:/usr/local/share/npm/bin
export PATH=${PATH}:/usr/local/lib/node_modules/

export EDITOR=vim

alias f='open -a Finder ./'
alias wake='wake-on-lan 50:46:5D:A0:9A:D7'

if which brew >/dev/null; then
    ## Bash Completetion. brew install bash-copmpletion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi


platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
fi

if [[ $platform == 'linux' ]]; then
    export LS_OPTS='--color'
elif [[ $platform == 'macos' ]]; then
    export LS_OPTS='-G'
elif [[ $platform == 'freebsd' ]]; then
    export LS_OPTS='--color=auto'
fi

alias ls='ls ${LS_OPTS}'
alias ss='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'
alias ll='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

## ssh-agent identity
ssh-add

## sshfs
# подмаунтить jail
# используется http://osxfuse.github.com/
mountsshfs()
{
    JAIL=${1:-"yandex.ru"}
    FOLDER=${2:-"/home/$USER"}
    echo -e "\033[33m===> MOUNT JAIL: \033[31m$JAIL \033[0m"
    mkdir -p /mount/$JAIL
    unmountsshfs $JAIL
    sshfs $USER@$JAIL:$FOLDER /mount/$JAIL -oauto_cache,reconnect,volname=$1
}

# размаунтить джейл
unmountsshfs()
{
    JAIL=${1:-"yandex.ru"}
    umount /mount/$1 >/dev/null
}

tunnel-mongo()
{
    ssh -N $1 -L 9999:localhost:27017
}

## home
alias mount-daywatch='mount -t nfs 192.168.1.2:/d ~/mount/daywatch'

export NVM_DIR="/Users/sbmaxx/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use v4.3.0

if [[ "$NODE_PATH" == '' ]]; then
    export NODE_PATH=`npm root -g`:./node_modules
else
    export NODE_PATH=$NODE_PATH:`npm root -g`:./node_modules
fi

export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:~/node_modules/.bin
export PATH=~/bin:${PATH}
export PATH=${PATH}:bin
