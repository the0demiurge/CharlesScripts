#MyScripts#
我的自用的脚本云备份，里面包含一些配置文件  
感兴趣的朋友们可以下载下来使用  
具体介绍见操作系统目录中的README  
**自动更新hosts翻墙脚本直达：**  
[linux](https://github.com/the0demiurge/MyScripts/tree/master/linux/etc) 注意这个需要hosts列表来支持，列表放在/etc/host.list  
[windows](https://github.com/the0demiurge/MyScripts/tree/master/windows/update-hosts) 一个安装与一个卸载脚本，hosts源在install.bat里面设置好了
  
**adblock.list**: chrome中的AdBlock广告过滤里面的自定义部分  
**pac**: 记录了我收集的一部分pac自动配置脚本  
  
***使用了相关项目的成果***  
1. [yangyangwithgnu](https://github.com/yangyangwithgnu)的[use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide)  
2. [racaljk](https://github.com/racaljk)的[老D hosts](https://github.com/racaljk/hosts)


#不完整目录：
#linux#
##etc/##
包含了系统设置更改以及hosts自动更新，脚本自动备份  

**hosts.list**: hosts自动更新列表，计划任务里面自动索引到它
**hosts.add**: 想添加到hosts列表里面的自定义hosts
##cron.daily/##

**backup-scripts**: 自动备份所有脚本，它可以用来直接生成整个目录，把root/目录删掉之后可以重新生成整个root/

**update-hosts**: 自动更新hosts以供解除部分网页的使用限制
##cron.monthly/ & cron.weekly/##

**backup-apps**: 自动备份apt安装的软件列表到主目录下，以便使用*sudo apt-get install $(cat $filename)*
##home/ash/##
包含shell启动脚本，vim配置
##.shell.d##
shell 初始化脚本，包括命令别名，路径定义等
##.userscripys/##

我写的一些我个人常用的脚本
**wallpaper-earthview**: 自动抓取Google Earthview作为Gnome桌面壁纸  

**uzip**: 解压在Windows里面创建的压缩文件的时候可以防止乱码  

**apt-unlock**: apt-get异常退出之后可以用它来去掉lock文件

**ef**: 编辑fifo命令

**fifo**: 先入先出队列，用来暂时放一些准备一会再跑的脚本命令

**note**: 用法为*note \<time\> \<to-do\>*,作用为在\<time\>之后提醒我做\<to-do\>,如*note 10m 'go home'*为提醒我十分钟之后回家

**quit-qq**: 完全退出TM.exe和wineserver，因为wine的TM退出不干净，还要手动杀掉进程

**syslog-clean**: 清除系统日志以释放空间，需要root权限，通常不需要用

**update**: 自动更新软件并删掉没用的软件。如果该命令后面附带了参数，比如*update pip3*就自动更新python3的所有库。因为使用了*apt-get autoremove*,所以**Debian慎用！**

**wallpaper-switcher**: 从网上扒下来的一个可以定时自动切换壁纸的脚本，没用过
