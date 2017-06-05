#PATHES
set -x PATH $CHARLES_HOME/bin $PATH
set -x PATH $HOME/.cabal/bin $PATH

#VARIABLES
set -x TF_CPP_MIN_LOG_LEVEL 2
set -x EDITOR vim

#BOBTHEFISH
set -g theme_date_format "+%A, %B %d, %l:%M%P"
set -g theme_nerd_fonts yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_color_scheme light # dark, light, solarized, solarized-dark, solarized-light, base16, zenburn, gruvbox


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
    if git push
        espeak -vzh push成功
        notify-send 'push成功'
        sl
        clear
        fortune|cowsay -f duck push成功～
    else
        for i in (seq 3)
            espeak -vzh push失败！
        end
        cowsay -f bong "push失败！！！请重新push！！！"
        oneko -sakura
        notify-send "push失败！！！请重新push！！！"
        notify-send -u critical $PWD
    end
end

function mcd
    mkdir -p "$argv"; cd "$argv";
end

function md5check
    md5sum "$argv[1]" | grep "$argv[2]";
end

function viz
    switch $argv[2]
        case "eps"
            dot -T $argv[2] -o (echo $argv[1]|sed 's/\..*//g').png $argv[1]
            convert (echo $argv[1]|sed 's/\..*//g').png (echo $argv[1]|sed 's/\..*//g').eps
        case "*"
            dot -T $argv[2] -o (echo $argv[1]|sed 's/\..*//g').$argv[2] $argv[1]
    end
end

