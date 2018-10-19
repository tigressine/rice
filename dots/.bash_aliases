# tweaks for ls
alias ls='ls --color -I snap -I Downloads -I Steam'
alias pls='pwd; ls'
alias up='cd .. && ls'
function down {
    cd "$1" && ls
}

# clear and list contents
alias cls='clear; ls'
alias pcls='clear; pwd; ls'
alias clsa='clear; ls -A'
alias pclsa='clear; pwd; ls -A'

# reload .bashrc
alias reload='. ~/.bashrc'

# SSH connections
alias eustis='ssh ti406994@eustis.eecs.ucf.edu'
alias zajedno='ssh root@206.189.228.110'
function move-eustis {
    scp $1 ti406994@eustis.eecs.ucf.edu:$2
}

# for installation fun
alias fucking='sudo apt'

# aliases for neovim
alias v='nvim'
alias vim='nvim'

# aliases for the slate
alias rmslate='rm -rf ~/Slate/*'
function cpslate {
    for ITEM in "$@"; do
        if [[ -d $ITEM ]]; then
            cp -r $ITEM ~/Slate
        elif [[ -f $ITEM ]]; then
            cp $ITEM ~/Slate
        fi
    done
}
function mvslate {
    for ITEM in "$@"; do
        mv $ITEM ~/Slate
    done
}

# a better way to remove files
function toss {
    mkdir -p /tmp/tossed
    for ITEM in "$@"; do
        mv "$ITEM" /tmp/tossed
    done
}

# open a file window at location
alias f='(nautilus . &> /dev/null &)'

# open pdfs
function pdf {
    (gio open "$@" &> /dev/null &)
}

# git functions
alias clone='clonessh'
function acp {
    git add $1
    git commit -m "$2"
    git push
}
function clonehttps {
    git clone "https://www.github.com/tgsachse/$1.git" $2
}
function clonessh {
    git clone "git@github.com:tgsachse/$1.git" $2
}
function switchssh {
    git remote set-url origin git@github.com:tgsachse/$1.git
    git remote -v
}

# minecraft
alias minecraft="java -jar ~/.minecraft/Minecraft.jar"
