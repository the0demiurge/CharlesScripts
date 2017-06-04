#!/bin/sh
read -p "这个脚本只是测试用途，有很多bug，不要使用，按Ctrl+C退出" a
echo 'installing the linux scripts'

read -p 'install hosts?[Y/n]:' PROMPT
if [ -z $PROMPT ];then PROMPT='y';fi
if [ '$PROMPT'=='y' ];then
    ./install-hosts.sh
fi

read -p 'install cronjobs(wallpaper-earthview updater for Gnome3)?[Y/n]:' PROMPT
if [ -z $PROMPT ];then PROMPT='y';fi
if [ '$PROMPT'=='y' ];then
    sudo cp -p ./linux/etc/cron.hourly/wallpaper-earthview /etc/cron.hourly/
fi

read -p 'install backuping cronjob for installed scripts?[y/N]:' PROMPT
if [ -z $PROMPT ];then PROMPT='n';fi
if [ '$PROMPT'=='y' ];then
    cp -p ./linux/etc/cron.daily/backup-scripts /etc/cron.daily/
    echo 'edit the /etc/cron.daily/backup-scripts!'
    sleep 5
    vi /etc/cron.daily/backup-scripts
fi

read -p 'install user configs and userscripts?[Y/n]:' PROMPT
if [ -z $PROMPT ];then PROMPT='y';fi
if [ '$PROMPT'=='y' ];then
    cp -p ./linux/ash/* ~/
fi

read -p 'Updating ppas?[Y/n]:' PROMPT
if [ -z $PROMPT ];then PROMPT='y';fi
if [ '$PROMPT'=='y' ];then
sudo add-apt-repository $(cat ~/.backup/ppa)
sudo apt update
fi

read -p 'install my installed apps?[Y/n]:' PROMPT
if [ -z $PROMPT ];then PROMPT='y';fi
if [ '$PROMPT'=='y' ];then
sudo apt install $(cat ~/.backup/apps/ubuntu.list)
fi

read -p 'install and config softwares including docker, powerline, omf?[y/N]:' PROMPT
if [ -z $PROMPT ];then PROMPT='y';fi
if [ '$PROMPT'=='y' ];then
sudo apt install -y python3
python3 ~/.userscripts/.init/install.py
fi

chsh -s /usr/bin/fish
echo 'all done!'
echo 'please manually edit and place ./linux/etc/cron.daily/backup-scripts to /etc/cron.daily/'
