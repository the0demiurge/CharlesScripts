# MyScripts #
我的自用的脚本，包括Ubuntu Gnome 最新LTS版的很方便的使用、配置脚本，包括自动化配置bash、tmux、ipython、pdb的powerline，使用现成的vimrc、自动更新hosts实现无缝科学上网、自动备份系统信息。  

建立这个项目的目的在于：
1. 帮助不会科学上网的同学更方便地查资料（Linux, Windows）
2. 如果我的电脑需要从头开始重装系统，可以大幅减少配置环境所需时间  
**警告：除了本页面推荐过的脚本，如果你没有读过我写的脚本的话请谨慎使用**

# 安装指南 #
1. [Linux安装：](https://github.com/the0demiurge/MyScripts/blob/master/install-linux.sh)  
> 1.1. [点击这里](https://github.com/the0demiurge/MyScripts/archive/master.zip)下载本项目，解压之后在该目录下运行 *./install-linux.sh*  
> 1.2. 安装[SpaceVim](https://spacevim.org/)  
> 1.3. 安装[Nerd字体](https://github.com/ryanoasis/nerd-fonts)  
2. [linux无障碍上网：](https://github.com/the0demiurge/MyScripts/blob/master/install-hosts.sh)  
> [点击这里](https://github.com/the0demiurge/MyScripts/archive/master.zip)下载本项目，解压之后在该目录下运行 *./install-hosts.sh*  
3. [windows无障碍上网：](https://github.com/the0demiurge/MyScripts/tree/master/windows/update-hosts)  
> 下载install.bat，右键运行。  
> **这个Windows翻墙方法不适用于win7，win7及以下请使用[laoD介绍的软件](https://github.com/racaljk/hosts/tree/master/tools)**：[Windows版项目地址](https://github.com/HostsTools/Windows)，以及[下载链接](https://git.io/vX1Pz)  

# 项目内容： #
**install-hosts.sh**: linux科学上网安装脚本  
**install-linux.sh**: 安装我备份的所有软件，并进行配置的一键部署脚本(**警告：这个还未完成，功能有bug**)  
**adblock.list**: chrome中的AdBlock广告过滤里面的自定义部分  
**pac**: 记录了我收集的一部分pac自动配置脚本  
# linux #
## etc/ ##
包含了系统设置更改以及hosts自动更新，脚本自动备份  
**hosts.list**: hosts自动更新列表，计划任务里面自动索引到它  
**hosts.add**: 想添加到hosts列表里面的自定义hosts  
## cron.daily/ ##
**backup-scripts**: 我的自动备份脚本，使用时需要修改里面的用户名  
**update-hosts**: 自动更新hosts以供解除部分网页的使用限制  
## home/ash/ ##
*.vimconfig.vim*: 配合[Aix-Vim项目](https://github.com/DemonCloud/dotfile)使用的vim设置，让它更适合python开发  
包含shell启动脚本，vim配置  
## .shell.d ##
shell 初始化脚本，主要包括alias等  
## .userscripts/ ##
我写的一些我个人常用的脚本  
**add-ppa**: 可批量增加ppa，并备份ppa列表到~/.backup/ppa  
**inst**: 安装软件并备份软件列表到~/.backup/app/ubuntu.list  
**ef**: 编辑fifo命令  
**fifo**: 先入先出队列，用来暂时放一些准备一会再跑的脚本命令  
**wallpaper-earthview**: 自动抓取Google Earthview作为Gnome桌面壁纸  
**uzip**: 解压在Windows里面创建的压缩文件的时候可以防止乱码  
**apt-unlock**: apt-get异常退出之后可以用它来去掉lock文件  
**note**: 用法为*note \<time\> \<to-do\>*,作用为在\<time\>之后提醒我做\<to-do\>,如 *note 10m 'go home'* 为提醒我十分钟之后回家  
**quit-qq**: 完全退出Longene TM2013版的TM.exe和wineserver，因为wine的TM退出不干净，还要手动杀掉进程  
**syslog-clean**: 日志莫名其妙占据大量空间时谨慎使用，清除系统日志以释放空间，需要root权限，通常不需要用  
**update**: 自动更新所有软件，实际上就是 *sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y*  
**adduser**: 为系统增加用户，并记录何时、为谁添加的账户，比如*adduser san 张三*  
### .init/ ###
通过运行install.py安装并配置docker、powerline、oh-my-fish，其中每个项目都是可选的






***使用了这些项目的成果***  
1. [yangyangwithgnu](https://github.com/yangyangwithgnu)的[use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide)  
2. [racaljk](https://github.com/racaljk)的[老D hosts](https://github.com/racaljk/hosts)
3. [Aix-Vim](https://github.com/DemonCloud/dotfile)
