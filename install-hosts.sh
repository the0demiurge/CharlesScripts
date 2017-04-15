#!/bin/sh
sudo cp ./linux/etc/cron.daily/update-hosts /etc/cron.daily
sudo cp ./linux/etc/hosts.list /etc/
sudo sh /etc/cron.daily/update-hosts

