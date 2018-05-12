# bashrc configuration for non-login shells

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# configuration for Base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

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

# load Shellcuts controller file if it exists.
if [ -f ~/.config/shellcuts/bash/controller.sh ]; then
    . ~/.config/shellcuts/bash/controller.sh
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Bin" ] ; then
    PATH="$HOME/Bin:$PATH"; export PATH
fi

# this is for Shellcuts and I'm still working on it
#MANPATH="$(manpath):$HOME/Slate/"; export MANPATH

# set look for prompt
# gorgeous right?
PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;17m\]:\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;17m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# initial prompt
fortune -s | cowsay | lolcat; echo ""
