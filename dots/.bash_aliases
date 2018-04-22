# CUSTOM ALIASES

# tweaks for ls
alias ls='ls --color -I snap -I Downloads'
alias pls='echo "CWD: $(pwd)"; ls'

# clear and list contents
alias cls='clear; ls'
alias pcls='clear; echo "CWD: $(pwd)"; ls'
alias clsa='clear; ls -A'
alias pclsa='clear; echo "CWD: $(pwd)"; ls -A'

# reload .bashrc
alias reload-bashrc='. ~/.bashrc'

# connect to Eustis
alias eustis='ssh ti406994@eustis.eecs.ucf.edu'

# map vim to nvim
alias vim='nvim'

# clean the slate
alias clean-slate='rm -r ~/Slate/*'

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
