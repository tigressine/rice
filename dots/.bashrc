# Bashrc configuration for non-login shells

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Configuration for Base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

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
PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;17m\]:\[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;17m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Initial prompt
fortune -s | cowsay; echo ""

# Load the Shellcuts controller file if it exists.
if [ -f $HOME/.shellcuts/shells/bash/controller.bash ]; then
    . $HOME/.shellcuts/shells/bash/controller.bash
    #source ~/.local/bin/bashmarks.sh
fi
