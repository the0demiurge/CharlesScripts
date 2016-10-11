#INIT
numlockx
source /usr/share/autojump/autojump.fish

#HOMES
set -x MY_HOME /home/ash

#PATHES
set -x PATH /home/ash/Software/anaconda3/bin $PATH
set -x PATH $MY_HOME/.userscripts $PATH

#ALIASES

abbr a 'sudo apt-fast'
abbr c 'clear and cd'
abbr eg 'grep -E'
abbr g 'git add .; and git commit -m'
abbr i 'ipython'
abbr l 'ls --color=auto'
abbr la 'ls --almost-all --color=auto'
abbr le 'ls --almost-all --color=auto|egrep'
abbr lg 'ls --almost-all --color=auto|grep'
abbr ll 'ls --almost-all -lh --color=auto'
abbr o 'xdg-open'
abbr p 'python'
abbr s 'sudo su -'
abbr sd 'sudo shutdown -h'
abbr u 'update'
abbr v 'vim'
abbr x 'exit'
abbr t 'tensorboard --logdir="."'
clear
