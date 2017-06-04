#!/bin/sh
echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
if [ `which curl|wc -l` == 0 ];then sudo apt install -y --force-yes curl;fi
if [ `which wget|wc -l` == 0 ];then sudo apt install -y --force-yes wget;fi
wget -qO - https://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add -
curl -LO https://linux-packages.resilio.com/resilio-sync/key.asc && sudo apt-key add ./key.asc
sudo apt-get update
sudo apt-get install resilio-sync
sudo systemctl enable resilio-sync
rm ./key.asc
xdg-open 'http://localhost:8888/gui/'
echo 'B7P64IMWOCXWEYOXIMBX6HN5MHEULFS4V'
