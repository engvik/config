# Don't keep duplicate lines in history
HISTCONTROL=ignoreboth

# Set history length
HISTFILESIZE=1000000
HISTSIZE=1000000

# Append to history
shopt -s histappend

# Store multiline commands in one line in history
shopt -s cmdhist

# update the values of LINES and COLUMNS if necessary
shopt -s checkwinsize

# Stop the PC speaker
setterm -bfreq 0

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# PATH
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases live in it's own file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
