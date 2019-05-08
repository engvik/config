# vim => neovim
alias vim="nvim"
alias vimdiff="nvim -d"

# ls
alias ll='ls -lh'
alias la='ls -alh'
alias l='ls -l'

# cd ..
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# clear
alias c="clear"

# Weather
alias weather="curl wttr.in/oslo"

# Python server
alias pythonserver='python -m SimpleHTTPServer 8000'

# Apt
alias supdt='sudo apt update'
alias supgr='sudo apt upgrade'

# enable color supported aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

