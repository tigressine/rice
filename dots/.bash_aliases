# CUSTOM ALIASES

# tweaks for ls
alias ls='ls --color -I snap -I Downloads'
alias pls='pwd; ls'

# clear and list contents
alias cls='clear; ls'
alias pcls='clear; pwd; ls'
alias clsa='clear; ls -A'
alias pclsa='clear; pwd; ls -A'

# reload .bashrc
alias reload='. ~/.bashrc'

# connect to Eustis
alias eustis='ssh ti406994@eustis.eecs.ucf.edu'

# for when you're tilted
alias fucking='sudo'

# aliases for neovim
alias v='nvim'
alias vim='nvim'

# clean the slate
alias clean-slate='rm -rf ~/Slate/*'

# open pdfs
function pdf {
    gio open $1 &> /dev/null
}

# open a file window at location
alias f='nautilus . &> /dev/null'

# easily clone my repos
function clone {
    git clone "https://www.github.com/tgsachse/$1.git"
}

# compile and execute Java within package
function javabr {
    javac *.java && cd .. && java $1.$2; cd $1
}
