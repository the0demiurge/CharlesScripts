#INIT
numlockx
source /usr/share/autojump/autojump.fish

#HOMES
set -x MY_HOME /home/ash

#PATHES
set -x PATH /home/ash/Software/anaconda3/bin $PATH
set -x PATH $MY_HOME/.userscripts $PATH

#ALIASES
alias ...='cd ../..'
abbr a 'sudo apt-fast install'
abbr c 'clear; and cd'
abbr cl 'cd ..;ls'
alias eg='grep -E'
abbr g 'git add -A; and git commit -m'
abbr gaa 'git add -A'
abbr gc 'git checkout'
abbr gl 'git log'
abbr gp 'git push'
abbr gpl 'git pull'
abbr gst 'git status'
abbr histg 'history | grep'
abbr i 'ipython --no-confirm-exit --no-banner --pprint -i --pylab=auto'
alias l='ls --color=auto'
alias la='ls --almost-all --color=auto'
alias le='ls --almost-all --color=auto|egrep'
alias lg='ls --almost-all --color=auto|grep'
alias ll='ls --almost-all -lh --color=auto'
abbr n 'nautilus .&'
abbr o 'xdg-open'
abbr p 'python'
abbr s 'sudo su -'
abbr sd 'sudo shutdown -h 0'
abbr u 'update'
abbr v 'vim'
abbr x 'exit'
abbr t 'tensorboard --logdir="."'

#FUNCTIONS

function backup
    for i in "$argv"
        mv "$i" "$i.bak"
    end
end

function cls
    cd "$argv"; ls;
end

function d
    dict "$argv[1]"|less
end

function mcd
    mkdir -p "$argv"; cd "$argv";
end

function md5check
    md5sum "$argv[1]" | grep "$argv[2]";
end

#sdl == sudo !!
function sdl
    eval command sudo $history[1]
end

