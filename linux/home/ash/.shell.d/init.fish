#INIT
numlockx
source /usr/share/autojump/autojump.fish

#PATHES
set -x PATH $HOME/Software/anaconda3/bin $PATH
set -x PATH $HOME/.userscripts $PATH

#VARIABLES
set -x TF_CPP_MIN_LOG_LEVEL 2

#ALIASES
alias ...='cd ../..'
alias a='sudo apt-fast install'
alias c='clear; cd'
alias cl='cd ..;ls'
alias eg='grep -E'
alias g='git add -A;git commit -m'
alias gaa='git add -A'
alias gc='git checkout'
alias gl='git log'
alias gp='git push'
alias gpl='git pull'
alias gst='git status'
alias histg='history | grep'
alias i='ipython --no-confirm-exit --no-banner --pprint -i --pylab=auto'
alias l='ls --color=auto'
alias la='ls --almost-all --color=auto'
alias le='ls --almost-all --color=auto|egrep'
alias lg='ls --almost-all --color=auto|grep'
alias ll='ls --almost-all -lh --color=auto'
alias n='nautilus .&'
alias o='xdg-open'
alias p='python'
alias pdb='python -mpowerline.bindings.pdb'
alias s='sudo su'
alias sd='sudo shutdown -h 0'
alias u='update'
alias v='vim'
alias x='exit'
alias t='tensorboard --logdir="."'

#FUNCTIONS

function backup
    for i in "$argv"
        cp -r "$i" "$i.bak"
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
