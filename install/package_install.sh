#!/bin/bash

sudo apt-get upgrade

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:thefanclub/ubuntu-after-install

sudo apt-get update

sudo apt-get install git meld sublime-text-installer google-chrome-stable ntp ntpdate lm-sensors psensor -y
sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller -y
sudo apt-get install cairo-dock cairo-dock-plug-ins ubuntu-after-install -y


sudo apt-get remove apparmor apparmor-utils
