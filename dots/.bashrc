# bashrc configuration for non-login shells

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# configuration for bash_history
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

# update window after each command if necessary
shopt -s checkwinsize

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# checks if the bash_aliases file exists and includes it
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set look for prompt
PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\] "

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Bin" ] ; then
    PATH="$HOME/Bin:$PATH"; export PATH
fi

MANPATH="$(manpath):$HOME/Slate/"; export MANPATH

# initial prompt
fortune -s | cowsay; echo ""

# Load Shellcuts controller file if it exists.
if [ -f ~/.config/shellcuts/bash/controller.sh ]; then
    . ~/.config/shellcuts/bash/controller.sh
fi
