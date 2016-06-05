#!/bin/sh
#sudo chmod +w /etc/apt/sources.list
#make add-apt-repository
echo  '   #!/bin/sh
    if [ $# -eq 1 ]
    then
        ppa_name=`echo "$1" | cut -d ":" -f2-`
    
        if [ -z "$ppa_name" ]
        then
            echo "PPA name not found"
            echo "Utility to add PPA repositories in your debian machine"
            echo "$0/ppa ppa: user-name"
        else
            echo "$ppa_name"
            echo "deb http://ppa.launchpad.net/$ppa_name/ubuntu maverick main" >> /etc/apt/sources.list
            apt-get update > /dev/null 2>> /tmp/apt_add_key.txt                                                     
            key=`cat /tmp/apt_add_key.txt | cut -d ""-f6 | cut -d"" -f3`
            apt-key adv-keyserver keyserver.ubuntu.com-recv-keys $key
            rm -rf /tmp/apt_add_key.txt
        fi
    else
        echo "Utility to add PPA repositories in your debian machine"
        echo "$0/ppa ppa: user-name"
    fi
' #> add-apt-repository 
#sudo mv add-apt-repository /usr/bin
#sudo chmod +x /usr/bin/add-apt-repository 
#sudo chown root:root /usr/bin/add-apt-repository
#sudo echo 'deb http://mirrors.163.com/debian/ unstable main contrib' > /etc/apt/sources.list
#sudo echo 'deb http://download.virtualbox.org/virtualbox/debian squeeze contrib non-free' >> /etc/apt/sources.list
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo add-apt-repository ppa:fcitx-team/nightly
sudo add-apt-repository ppa:plushuang-tw/uget-stable
sudo add-apt-repository ppa:launchpad.net/~blueman/+archive/ubuntu/ppa
sudo apt-get update
#sudo apt-get install -y netselect
#sudo apt-get install -y apt-spy
sudo apt-get install -y uget aria2
#netselect-apt stable
#sudo mv sources.list /etc/apt/sources.list
#sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y vim emacs elinks
sudo apt-get install -y goldendict
sudo apt-get install -y chromium-browser
sudo apt-get install -y build-essential
sudo apt-get install -y vlc
sudo apt-get install -y gparted
sudo apt-get install -y cmake
sudo apt-get -f remove ibus
sudo apt-get -f remove fcitx* 
sudo apt-get -f autoremove
sudo apt-get install fcitx-sunpinyin
sudo im-config  -s  fcitx -z default


#apt-get install -y fcitx
sudo apt-get install -y parcellite 
wget https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-beta-64-bit.deb
#wget http://cdn2.ime.sogou.com/dl/index/1446541585/sogoupinyin_2.0.0.0068_amd64.deb?st=DB3jBr4uV8whMAUjqrzRqg&e=1451963136&fn=sogoupinyin_2.0.0.0068_amd64.deb
#dpkg -i sogoupinyin_2.0.0.0068_amd64.deb
#rm -f sogoupinyin_2.0.0.0068_amd64.deb
sudo apt-get install -y wine 
sudo dpkg -i lantern-installer-beta-64-bit.deb
rm -f lantern-installer-beta-64-bit.deb
#sudo apt-get install -y blueman
#apt-get install -y 
#cd ~
#mkdir softwares
#cd softwares
#git clone https://github.com/XX-net/XX-Net.git
#git clone https://github.com/simtr/The-Powder-Toy.git
#git clone https://github.com/darlinghq/darling.git
#git clone https://github.com/Psiphon-Labs/psiphon-chrome.git
#git clone 

#set org.gnome.settings-daemon.peripherals.keyboard numlock-state on
