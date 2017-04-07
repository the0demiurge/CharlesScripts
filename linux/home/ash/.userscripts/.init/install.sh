#!/bin/sh
SETTING_PATH = ~/.userscripts/.init
cd $SETTING_PATH

./get-oh-my-fish
./get-docker
./restore-omf
./config-vim
./config-bash
./config-fish

