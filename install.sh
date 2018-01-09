#!/bin/bash
OS=$(cat /etc/issue|cut -f 1 -d ' ')
CHARLES_BACKUP=~/.config/CharlesBackup
case $OS in
    'Arch')    INSTALL() { sudo pacman -S --needed $@; };UPDATE() { sudo pacman -Syy; }                       ;;
    'Ubuntu')  INSTALL() { sudo apt install $@ -y --allow-unauthenticated; };UPDATE() { sudo apt update; } ;;
    *)         echo 'Your distribution has not implementd yet, please modify this command'                 ;;
esac

if [[ $0 != 'debug' ]]; then
    set -e
fi

promptn(){
    read -p 'Will you run '$1'?[y/N]' PMT
    if [[ $PMT == 'y' || $PMT == 'Y' ]]; then
        . ./$1
    fi
}

prompty(){
    read -p 'Will you run '$1'?[Y/n]' PMT
    if [[ $PMT != 'n' && $PMT != 'N' ]]; then
        . ./$1
    fi
}

dependency(){
    echo 'Installing part of the dependencies...'
    UPDATE
    case $OS in
        'Arch')    INSTALL git espeak cowsay sl fish mlocate fortune-mod                                     ;;
        'Ubuntu')  INSTALL git espeak cowsay oneko sl fortune fish mlocate                       ;;
        *)         echo 'Your distribution has not implementd yet, please modify this command'   ;;
    esac
    sudo updatedb
}

gitclone(){
    if [ ! -d ~/.local/share ]; then mkdir -p ~/.local/share;fi
    if [[ -x ~/.local/share/CharlesScripts ]]; then rm -rf ~/.local/share/CharlesScripts;fi
    git clone https://github.com/the0demiurge/CharlesScripts.git ~/.local/share/CharlesScripts
    echo 'Please type your backup git repo address. If you do not have one, you may create it on GitHub.com.'
    read -p 'Press Enter to skip' REPO
    if [[ ! -x $CHARLES_BACKUP ]]; then git clone $REPO $CHARLES_BACKUP||true;fi
    if [[ ! -x $CHARLES_BACKUP ]]; then
        echo 'Clone failed! Default CharlesBackup will be cloned!'
        git clone https://github.com/the0demiurge/CharlesScripts.git $CHARLES_BACKUP
        echo 'You may modify $CHARLES_BACKUP, and type:'
        echo 'cd $CHARLES_BACKUP'
        echo 'git remote set-url origin <your-git-url>'
        echo 'git add -A; git commit -m "init commit";git push -u origin master'
    fi
}

get(){
    Y_LIST=(get-fasd
            get-powerline
            #get-oh-my-fish
            get-thefuck)

    N_LIST=(get-calibre
            get-docker
            get-spacemacs
            get-spacevim
            get-sublime-text-3
            get-xsh)

    
    for Y in ${Y_LIST[@]}; do
        cd ~/.local/share/CharlesScripts/charles/installation.d/get.d/
        prompty $Y
    done
    
    for N in ${N_LIST[@]}; do
        cd ~/.local/share/CharlesScripts/charles/installation.d/get.d/
        prompty $N
    done
}

conf(){
    Y_LIST=(config-bash
            config-fish
            config-git
            config-gnome
            config-powerline-bash
            config-tmux)

    N_LIST=(config-powerline-ipython)

    
    for Y in ${Y_LIST[@]}; do
        cd ~/.local/share/CharlesScripts/charles/installation.d/conf.d/
        prompty $Y
    done
    
    for N in ${N_LIST[@]}; do
        cd ~/.local/share/CharlesScripts/charles/installation.d/conf.d/
        prompty $N
    done
}

restore(){
    read -p 'DANGER! Restore dotfiles from ~/.local/share/CharlesScripts/data/home/.* ?[y/N]' PMT
    if [[ $PMT == 'y' || $PMT == 'Y' ]]; then
        cp -rvi ~/.local/share/CharlesScripts/data/home/.* ~/
    fi
    
    cd ~/.local/share/CharlesScripts/charles/bin
    
    Y_LIST=(gnome-shell-extensions-restore
            omf-restore)
    
    for Y in ${Y_LIST[@]}; do
        prompty $Y
    done
}
dependency
gitclone
get
conf
restore

cd ~/.local/share/CharlesScripts/charles/installation.d/get.d/
prompty get-oh-my-fish
