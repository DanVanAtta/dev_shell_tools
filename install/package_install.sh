#!/bin/bash

GIT_NAME=$1
GIT_EMAIL=$2

function usage() {
  echo "usage: $(basename $0) <git_name> <git_email>"
  exit 1
}

if [[ -z "$GIT_NAME" ]] || [[ -z "$GIT_EMAIL" ]]; then
  usage
fi

cd ~
rm -rf ~/Music/ ~/Public/ ~/Templates/ ~/Videos/ ~/Documents
mkdir -p ~/work


# TODO
## harden the kernel a bit
# Set: kernel.kptr_restrict = 2 in /etc/sysctl.d/10-kernel-hardening.conf



wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:thefanclub/ubuntu-after-install

sudo apt-get install git eclipse meld sublime-text-installer google-chrome-stable ntp ntpdate lm-sensors psensor -y
sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller -y
sudo apt-get install cairo-dock cairo-dock-plug-ins ubuntu-after-install -y
sudo apt-get install parallel compizconfig-settings-manager -y



service apparmor stop 
update-rc.d -f apparmor remove 
sudo apt-get remove apparmor apparmor-utils -y

sudo sensors-detect --auto


echo select no for dash, default shell will be bash and not dash
sudo dpkg-reconfigure dash  


echo "Run git config:"
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME
git config --global core.editor vi
git config --global merge.tool meld
git config --global core.autocrlf input
git config branch.autosetuprebase always --global
git config --global push.default simple


cd ~/work
git clone git@github.com:DanVanAtta/linux_tools.git
cp linux_tools/.bashrc ~/.bashrc
source ~/.bashrc


## firewall
sudo ufw enable
 ## enable rate limit
sudo ufw limit ssh
sudo ufw allow 22  ## only do this is password authentication is turned off for ssh (ssh key authentication only)
sudo ufw allow 3300  ## triplea port
 ## restart the firewall
sudo systemctl restart ssh 


## SCM https://github.com/ndbroadbent/scm_breeze
git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.bashrc   # or source ~/.zshrc

sudo add-apt-repository ppa:kilian/f.lux
sudo apt-get update
sudo apt-get install fluxgui


google-chrome https://www.yworks.com/products/yed/download &
google-chrome https://justgetflux.com/ &

sudo apt-get upgrade
sudo apt-get update

echo "show hidden start up application in startup applications app, remove unnecessary ones there"
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

echo "run ubuntu-after-install, install flux, copy .bashrc and .vimrc to your home folder"
echo turn on privacy
echo  To do this, go to System Settings -> Security & Privacy :  disable record app results and the unity online search
echo System settings > appearance -> enable workspaces


