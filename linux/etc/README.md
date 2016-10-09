#etc/#

**host.list**: hosts自动更新列表，计划任务里面自动索引到它
##cron.daily/##

**backup-scripts**: 自动备份所有脚本，它可以用来直接生成整个目录，把root/目录删掉之后可以重新生成整个root/

**update-hosts**: 自动更新hosts以供解除部分网页的使用限制
##cron.monthly/ & cron.weekly/##

**backup-apps**: 自动备份apt安装的软件列表到主目录下，以便使用*sudo apt-get install $(cat $filename)*
