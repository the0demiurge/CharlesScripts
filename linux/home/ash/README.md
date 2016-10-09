#home/ash/#
##.shell.d##
shell 初始化脚本，包括命令别名，路径定义等
##.userscripys/##

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
