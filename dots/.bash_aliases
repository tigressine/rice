# CUSTOM ALIASES

# tweaks for ls
alias ls='ls --color -I snap -I Downloads -I Steam'
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

function mveustis {
    scp $1 ti406994@eustis.eecs.ucf.edu:$2
}

# for when you're tilted
alias fucking='sudo'

# aliases for neovim
alias v='nvim'
alias vim='nvim'

# clean the slate
alias clean-slate='rm -rf ~/Slate/*'

# open a file window at location
alias f='nautilus . &> /dev/null &'

# open pdfs
function pdf {
    gio open $1 &> /dev/null &
}

# Git functions
alias clone='clonessh'

function acp {
    git add $1
    git commit -m "$2"
    git push
}

function clonehttps {
    git clone "https://www.github.com/tgsachse/$1.git"
}

function clonessh {
    git clone "git@github.com:tgsachse/$1.git"
}

function switchssh {
    git remote set-url origin git@github.com:tgsachse/$1.git
    git remote -v
}

# compile and execute Java within package
function javabr {
    javac *.java && cd .. && java $1.$2; cd $1
}
