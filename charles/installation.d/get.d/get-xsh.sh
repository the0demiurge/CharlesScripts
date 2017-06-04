#!/bin/sh
if [ `which curl|wc -l` == 0 ];then sudo apt install curl;done
curl -L https://xiki.com/install_xsh -o ~/install_xsh; bash ~/install_xsh
rm ~/install_xsh
echo "set -x PATH ~/xiki-project/bin/ \$PATH" > ~/.config/fish/conf.d/xsh.fish

