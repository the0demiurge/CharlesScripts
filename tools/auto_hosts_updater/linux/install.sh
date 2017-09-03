#!/bin/sh

echo '#!/bin/bash'|sudo tee /etc/cron.daily/update-hosts
echo 'Automatic Hosts Updater'|sudo tee -a /etc/cron.daily/update-hosts
echo ''|sudo tee -a /etc/cron.daily/update-hosts
echo 'HOSTS_LIST=('|sudo tee -a /etc/cron.daily/update-hosts
# echo '"https://github.com/googlehosts/hosts/raw/master/hosts-files/hosts"'|sudo tee -a /etc/cron.daily/update-hosts
# echo '"https://github.com/vokins/yhosts/raw/master/hosts"'|sudo tee -a /etc/cron.daily/update-hosts
echo '"https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts-ad"'|sudo tee -a /etc/cron.daily/update-hosts
echo ')'|sudo tee -a /etc/cron.daily/update-hosts
echo ''|sudo tee -a /etc/cron.daily/update-hosts
echo 'for item in ${HOSTS_LIST[@]};do'|sudo tee -a /etc/cron.daily/update-hosts
echo '    false'|sudo tee -a /etc/cron.daily/update-hosts
echo '    while [ $? != 0 ]; do'|sudo tee -a /etc/cron.daily/update-hosts
echo '        curl -L $item|tee -a /tmp/hosts'|sudo tee -a /etc/cron.daily/update-hosts
echo '    done'|sudo tee -a /etc/cron.daily/update-hosts
echo 'done'|sudo tee -a /etc/cron.daily/update-hosts
echo ''|sudo tee -a /etc/cron.daily/update-hosts
echo 'if [ -e /tmp/hosts ]; then'|sudo tee -a /etc/cron.daily/update-hosts
echo '    echo "127.0.0.1 " `cat /etc/hostname`|tee /etc/hosts'|sudo tee -a /etc/cron.daily/update-hosts
echo '    cat /tmp/hosts|tee -a /etc/hosts'|sudo tee -a /etc/cron.daily/update-hosts
echo '    rm /tmp/hosts'|sudo tee -a /etc/cron.daily/update-hosts
echo '    echo ""'|sudo tee -a /etc/cron.daily/update-hosts
echo '    echo ""'|sudo tee -a /etc/cron.daily/update-hosts
echo '    echo "hosts updat succeeded!"'|sudo tee -a /etc/cron.daily/update-hosts
echo '    exit 0'|sudo tee -a /etc/cron.daily/update-hosts
echo 'else'|sudo tee -a /etc/cron.daily/update-hosts
echo '    echo "failed!"'|sudo tee -a /etc/cron.daily/update-hosts
echo '    exit 1'|sudo tee -a /etc/cron.daily/update-hosts
echo 'fi'|sudo tee -a /etc/cron.daily/update-hosts






sudo bash /etc/cron.daily/update-hosts
