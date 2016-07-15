我的自用Ubuntu-Gnome脚本云备份，里面包含配置文件
感兴趣的朋友们可以下载下来使用
下面介绍我的主要有用的脚本


**pac**: 记录了我收集的一部分pac自动配置脚本
#root/#
#etc/#

**host.list**: hosts自动更新列表，计划任务里面自动索引到它
##cron.daily/##

**backup-scripts**: 自动备份所有脚本，它可以用来直接生成整个目录，把root/目录删掉之后可以重新生成整个root/

**update-hosts**: 自动更新hosts以供解除部分网页的使用限制
##cron.monthly/ & cron.weekly/##

**backup-apps**: 自动备份apt安装的软件列表到主目录下，以便使用*sudo apt-get install $(cat $filename)*
#home/ash/#

**.sh_alias**: 我自己使用的sh的别名

**.backup-apps.**: 自动保存的app列表
##.userscripys/##

**wallpaper-earthview**: 自动抓取Google Earthview作为Gnome桌面壁纸  

**uzip**: 解压在Windows里面创建的压缩文件的时候可以防止乱码  

**apt-unlock**: apt-get异常退出之后可以用它来去掉lock文件

**ef**: 编辑fifo命令

**fifo**: 先入先出队列，用来暂时放一些准备一会再跑的脚本命令

**note**: 用法为*note <time> <to-do>*,作用为在<time>之后提醒我做<to-do>,如*note 10m 'go home'*为提醒我十分钟之后回家

**quit-qq**: 完全退出TM.exe和wineserver，因为wine的TM退出不干净，还要手动杀掉进程

**syslog-clean**: 清除系统日志以释放空间，需要root权限，通常不需要用

**update**: 自动更新软件并删掉没用的软件，因为使用了*apt-get autoremove*,所以**Debian慎用！**

**wallpaper-switcher**: 从网上扒下来的一个可以定时自动切换壁纸的脚本，没用过
