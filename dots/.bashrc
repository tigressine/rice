# Bashrc configuration for non-login shells

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set the editor to be neovim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Configuration for bash_history
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

# Update window after each command if necessary
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Checks if the bash_aliases file exists and includes it
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set look for prompt
PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]:\[$(tput sgr0)\]\[\033[38;5;15m\]\w \[$(tput sgr0)\]\[\033[38;5;12m\]\\$\[$(tput sgr0)\] "

# Initial prompt
fortune -s | cowsay | lolcat; echo ""

# Load the Shellcuts controller file if it exists.
if [ -f $HOME/.shellcuts/shells/bash/controller.bash ]; then
    . $HOME/.shellcuts/shells/bash/controller.bash
fi
