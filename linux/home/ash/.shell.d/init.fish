#PATHES
set -x PATH $HOME/.userscripts $PATH
set -x PATH  /home/ash/Software/games/links $PATH

#VARIABLES
set -x TF_CPP_MIN_LOG_LEVEL 2

#BOBTHEFISH
set -g theme_date_format "+%A, %B %d, %l:%M%P"
set -g theme_nerd_fonts yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_color_scheme dark # dark, light, solarized, solarized-dark, solarized-light, base16, zenburn, gruvbox

#BALIASES
balias ... 'cd ...'
balias c 'clear; cd'
balias cl 'cd ..;ls'
balias eg 'grep -E'
balias gaa 'git add -A'
balias gc 'git checkout'
balias gl 'git l'
balias gp 'git push'
balias gpl 'git pull'
balias gst 'git status'
balias histg 'history | grep'
balias i 'ipython --no-confirm-exit --no-banner --pprint -i --pylab=auto'
balias l 'ls --color=auto'
balias la 'ls --almost-all --color=auto'
balias le 'ls --almost-all --color=auto|egrep'
balias lg 'ls --almost-all --color=auto|grep'
balias ll 'ls --almost-all -lh --color=auto'
balias n 'nautilus .&'
balias o 'xdg-open'
balias p 'python'
balias pdb 'python -mpowerline.bindings.pdb'
balias su 'sudo su'
balias u 'update'
balias t 'tensorboard --logdir="."'

#FUNCTIONS

function backup
    for i in "$argv"
        cp -r "$i" "$i.bak"
    end
end

function cls
    cd "$argv"; ls;
end

function g
    git add -A
    git status
    echo "type the commits or cancel with Ctrl+C"
    read COMMIT
    git commit -m "$COMMIT"
    git log -1 HEAD
    git push
end

function mcd
    mkdir -p "$argv"; cd "$argv";
end

function md5check
    md5sum "$argv[1]" | grep "$argv[2]";
end

function viz
    dot -T $argv[2] -o $argv[1].$argv[2] $argv[1].dot
end

