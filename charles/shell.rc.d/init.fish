set -g CHARLES_HOME $HOME/.local/share/CharlesScripts/charles
set -g CHARLES_BACKUP $HOME/.config/CharlesBackup

#PATHES
set -x PATH $CHARLES_HOME/bin $PATH
set -x PATH $HOME/.local/bin $PATH

#VARIABLES
set -x TF_CPP_MIN_LOG_LEVEL 2
set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x FZF_DEFAULT_OPTS "--bind='ctrl-o:execute(subl {})+abort'"
set -x SDCV_PAGER less

#COLOR_LESS
set -x PAGER "less"
set -x LESS "-R -i -g -c -W"
set -x LESSOPEN '|/usr/bin/env lesspipe.sh %s'
set -x LESSCLOSE '/usr/bin/env lesspipe.sh %s %s'
#COLOR MAN
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")

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
    cd "$argv"
    ls
end

function g
    git add -A
    git diff --cached
    echo "type the commits or cancel with Ctrl+C"
    git status
    read COMMIT
    git commit -m "$argv $COMMIT"
    git log -1 HEAD
    if git push
        echo push succeeded
        sl -e | lolcat
        for i in (seq 25)
            echo
        end
        fortune | cowsay -f duck
    else
        for i in (seq 3)
            echo push failed
        end
        echo push failed $PWD
        for i in (seq 25)
            echo
        end
        cowsay -f bong "push failed!!! push again!!!"
    end
end

function mcd
    mkdir -p "$argv"
    cd "$argv"
end

function md5move
    for i in (ls $argv[1])
        set md5 (md5sum $i|string split ' ')[1]
        set tail (string split -m1 -r '.' $i)[2]
        mv $i $md5.$tail
    end
end

function viz
    switch $argv[2]
        case "eps"
            dot -T $argv[2] -o /tmp/(string trim -r -c dot $argv[1])png $argv[1]
            convert /tmp/(string trim -r -c dot $argv[1])png (string trim -r -c dot $argv[1])eps
            rm /tmp/(string trim -r -c dot $argv[1])png
        case "*"
            dot -T $argv[2] -o (string trim -r -c dot $argv[1])$argv[2] $argv[1]
    end
end
