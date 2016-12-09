#INIT
numlockx
source /usr/share/autojump/autojump.fish

#HOMES
set -x MY_HOME /home/ash

#PATHES
set -x PATH /home/ash/Software/anaconda3/bin $PATH
set -x PATH $MY_HOME/.userscripts $PATH
set -x GOPATH ~/.local/share/golang

    #ALIASES
abbr a 'sudo apt-fast'
abbr c 'clear; and cd'
abbr cl 'cd ..;ls'
abbr d 'dict'
abbr eg 'grep -E'
abbr g 'git add -A; and git commit -m'
abbr gc 'git checkout'
abbr gl 'git log'
abbr gp 'git push'
abbr gpl 'git pull'
abbr gst 'git status'
abbr i 'ipython'
abbr l 'ls --color=auto'
abbr la 'ls --almost-all --color=auto'
abbr le 'ls --almost-all --color=auto|egrep'
abbr lg 'ls --almost-all --color=auto|grep'
abbr ll 'ls --almost-all -lh --color=auto'
abbr n 'nautilus .&'
abbr o 'xdg-open'
abbr p 'python'
abbr s 'sudo su -'
abbr sd 'sudo shutdown -h'
abbr u 'update'
abbr v 'vim'
abbr x 'exit'
abbr t 'tensorboard --logdir="."'
clear
