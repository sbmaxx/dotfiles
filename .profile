export PS1="\u@\h \w $ "

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTFILE=~/.bash_history-`tty | sed -e 's/\/dev\///'`
export HISTCONTROL=ignoreboth

export PATH=${PATH}:/usr/local/share/npm/bin
export PATH=${PATH}:/usr/local/lib/node_modules/

export EDITOR=vim
if [[ $platform == 'linux' ]]; then
   export LS_OPTS='-G'
elif [[ $platform == 'freebsd' ]]; then
   export LS_OPTS='--color=auto'
fi

alias ls='ls ${LS_OPTS}'

alias mount-daywatch='mount -t nfs 192.168.1.2:/d ~/mount/daywatch'