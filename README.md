# MyScripts #
**使用说明：**

请配合我的博客：[**Ubuntu Gnome 酷炫完整指南系列**](https://the0demiurge.blogspot.jp/2017/02/ubuntu-gnome.html)（需翻墙，且hosts无效，可以配合[lantern](https://github.com/getlantern/lantern)使用）使用。

**项目说明：**

懒是人类进步的第一动力，经过几年Ubuntu的使用，我写了一些很方便的小脚本，但因为我是初学者，早期代码风格很糟糕。而且当时写这些脚本主要为了自己用，只追求functional...因为水平有限，我把它们开源出来请大家多多指教，共同完善：）

* 支持的操作系统：Ubuntu Gnome 最新LTS版（其他Linux发行版甚至WSL、Linux on Android等也能用，只不过部分功能需要hack一下脚本）。
* 读者须知：使用此脚本需要一定（较低）的英文和bash脚本阅读能力，由于本项目不够完善，有的脚本可能迁移到您的电脑之前需要小小地修改。

**内容简介：**（每个链接都指向我写的配置脚本）

* 自动化[安装](https://github.com/the0demiurge/MyScripts/blob/master/linux/home/ash/.userscripts/.init/get.d/get-powerline)、[配置bash](https://github.com/the0demiurge/MyScripts/blob/master/linux/home/ash/.userscripts/.init/conf.d/config-powerline-bash)、[配置tmux](https://github.com/the0demiurge/MyScripts/blob/master/linux/home/ash/.userscripts/.init/conf.d/config-powerline-tmux)、[配置ipython](https://github.com/the0demiurge/MyScripts/blob/master/linux/home/ash/.userscripts/.init/conf.d/config-powerline-ipython)、配置pdb（[fish shell版](https://github.com/the0demiurge/MyScripts/blob/master/linux/home/ash/.shell.d/init.fish#L38)，[bash、zsh版](https://github.com/the0demiurge/MyScripts/blob/master/linux/home/ash/.shell.d/init.shell#L27)）的powerline
* [自动更新hosts](https://github.com/the0demiurge/MyScripts#安装指南)实现无缝科学上网、自动备份系统信息。
* [更新源和软件，类似于`pacman -Syu`](https://github.com/the0demiurge/MyScripts/blob/master/linux/home/ash/.userscripts/update)

**本项目建立目的：**

1. 贡献我写的小脚本给大家，方便使用
2. 请大家为这些小脚本提出建议、共同修改、共同完善
3. 帮助不会科学上网的同学更方便地查资料（Linux, Windows）
4. 如果大家或者我的电脑需要从头开始重装系统，可以大幅减少配置环境所需时间

**警告：除了本页面或我的博客推荐过的脚本，如果你没有读过我写的脚本的话请谨慎使用**

# 安装指南 #

1. [Linux安装：](https://github.com/the0demiurge/MyScripts/blob/master/install-linux.sh)
> 1.1. [点击这里](https://github.com/the0demiurge/MyScripts/archive/master.zip)下载本项目，解压之后在该目录下运行 *./install-linux.sh*  
> 1.2. 安装[SpaceVim](https://spacevim.org/)  
> 1.3. 安装[Nerd字体](https://github.com/ryanoasis/nerd-fonts)  
> 1.4. 安装语音合成引擎espeak `sudo apt-get install espeak`  

2. [linux无障碍上网：](https://github.com/the0demiurge/MyScripts/blob/master/install-hosts.sh)
> [点击这里](https://github.com/the0demiurge/MyScripts/archive/master.zip)下载本项目，解压之后在该目录下运行 *./install-hosts.sh*

3. [windows无障碍上网：](https://github.com/the0demiurge/MyScripts/tree/master/windows/update-hosts)
> 下载install.bat，右键运行。
> **Windows7及以前的Windows版本须知：**这个脚本只适用于Win10及以上系统，Win7可能会不正常工作，Win7以下一定不会正常工作！
>>win7及以下请使用[laoD介绍的软件](https://github.com/racaljk/hosts/tree/master/tools)：[Windows版项目地址](https://github.com/HostsTools/Windows)，以及[下载链接](https://git.io/vX1Pz)

# 项目目录： #
目录更新日期：2017年5月29日
```
MyScripts/
├── configs
│   ├── ads                               # chrome中的AdBlock广告过滤里面的自定义部分  
│   │   ├── my-ublock-backup.txt
│   │   └── my-ublock-static-filters.txt
│   ├── pac                               # 记录了我收集的一部分pac自动配置脚本
│   └── tampermonkey_backup.zip
├── install-hosts.sh                      # linux科学上网安装脚本
├── install-linux.sh                      # 安装我备份的所有软件，并进行配置的一键部署脚本(警告：这个还未完成，功能有bug)
├── linux
│   ├── etc                               # 包含了系统设置更改以及hosts自动更新，脚本自动备份
│   │   ├── cron.daily
│   │   │   ├── backup-scripts            # 我的自动备份脚本，使用时需要修改里面的用户名
│   │   │   └── update-hosts              # 自动更新hosts以供解除部分网页的使用限制
│   │   ├── cron.weekly
│   │   │   └── update -> /home/ash/.userscripts/update
│   │   ├── hosts.add                     # 添加到hosts列表里面的自定义hosts
│   │   ├── hosts.allow
│   │   ├── hosts.deny
│   │   ├── hosts.list                    # hosts自动更新列表，计划任务里面自动索引到它
│   │   └── rc.local
│   └── home
│       └── ash
│           ├── .backup
│           │   ├── apps
│           │   │   └── ubuntu.list
│           │   ├── omf.list
│           │   └── ppa
│           ├── .bash_logout
│           ├── .config                  # 我的配置文件
│           │   ├── fusuma
│           │   │   └── config.yml
│           │   └── sublime-text-3
│           ├── .profile
│           ├── .shell.d                 # shell 初始化脚本，主要包括alias等
│           │   ├── init.fish
│           │   └── init.shell
│           ├── .userscripts
│           │   ├── add-ppa              # 可批量增加ppa，并备份ppa列表到~/.backup/ppa
│           │   ├── adduser              # 为系统增加用户，并记录何时、为谁添加的账户，比如adduser san 张三（管理服务器的时候方便）
│           │   ├── apt-unlock           # apt-get异常终止之后可以用它来去掉lock文件
│           │   ├── cb2pdf
│           │   ├── ef                   # 编辑fifo命令
│           │   ├── fifo                 # 先入先出队列，用来暂时放一些准备一会再跑的脚本命令
│           │   ├── inst                 # 安装软件并备份软件列表到~/.backup/app/ubuntu.list
│           │   ├── note                 # 提醒，用法为note <time> <to-do>,作用为在<time>之后提醒我做<to-do>,如 note 10m '回家' 为提醒我十分钟之后回家（需要输入sudo apt install espeak安装语音合成引擎）
│           │   ├── quit-qq              # 完全退出Longene TM2013版的TM.exe和wineserver
│           │   ├── star-wars-one
│           │   ├── update               # 类似于pacman -Syu，自动更新所有软件，实际上就是 sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y
│           │   ├── wallpaper-earthview  # 自动抓取Google Earthview作为Gnome桌面壁纸（其他桌面也能用，需要调整里面修改壁纸的命令）
│           │   └── .init                # 通过运行install.py安装并配置docker、powerline、oh-my-fish，其中每个项目都是可选的
│           │       ├── conf.d
│           │       │   ├── config-bash
│           │       │   ├── config-fish
│           │       │   ├── config-git
│           │       │   ├── config-powerline-bash
│           │       │   ├── config-powerline-ipython
│           │       │   ├── config-powerline-tmux
│           │       │   └── config-vim
│           │       ├── get.d
│           │       │   ├── get-calibre
│           │       │   ├── get-docker
│           │       │   ├── get-oh-my-fish
│           │       │   ├── get-powerline
│           │       │   ├── get-resilio_sync.sh
│           │       │   ├── get-spacevim
│           │       │   └── get-xsh.sh
│           │       ├── install.py
│           │       ├── omf-backup
│           │       ├── .omflist
│           │       └── omf-restore
│           └── .vimconfig.vim
├── README.md
├── tools
│   ├── codecombine
│   └── README.md
└── windows
    ├── README.md
    └── update-hosts
        ├── install.bat
        ├── README.md
        └── uninst.bat
```
