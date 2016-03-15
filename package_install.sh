#!/bin/bash


GIT_NAME=$1
GIT_EMAIL=$2

function usage() {
  echo "usage: $(basename $0) <git_name> <git_email>"
  exit 1
}

echo "install xflux local launcher file"
XFLUX_LAUNCHER_FILE="config/xflux.desktop"
sed -i "s|/home/dan|/home/$USER|g" $XFLUX_LAUNCHER_FILE
mkdir -p ~/.config/autostart
cp $XFLUX_LAUNCHER_FILE ~/.config/autostart/

echo "download /etc/hosts adblocking list"
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
sudo cp /etc/hosts /etc/hosts.backup
cat hosts | sudo tee -a /etc/hosts

if [[ -z "$GIT_NAME" ]] || [[ -z "$GIT_EMAIL" ]]; then
  usage
fi

cd ~
rm -rf Music/ Public/ Templates/

# TODO
## harden the kernel a bit
# Set: kernel.kptr_restrict = 2 in /etc/sysctl.d/10-kernel-hardening.conf
# install node

#echo "show hidden start up application in startup applications app, remove unnecessary ones there"
#sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop


wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo add-apt-repository ppa:thefanclub/ubuntu-after-install -y

# fail2ban looks for suspicious login attempts and blocks them
sudo apt-get update
sudo apt-get install oracle-java8-installer fail2ban ttf-liberation -y

sudo apt-get install git eclipse meld sublime-text-installer google-chrome-stable ntp ntpdate lm-sensors psensor -y
sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller -y
# sudo apt-get install cairo-dock cairo-dock-plug-ins 
sudo apt-get install ubuntu-after-install -y
sudo apt-get install parallel expect ruby ruby-dev compizconfig-settings-manager libxml2-utils  -y
sudo apt-get install oracle-java8-installer iftop htop openssh-server -y
sudo gem install travis -v 1.8.2 --no-rdoc --no-ri

echo "on the next window, disable passwordles login, hit enter to continue"
read
sudo vi /etc/ssh/sshd_config

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


cd ~/
mkdir -p work
cd work
git clone git@github.com:DanVanAtta/linux_tools.git
cp linux_tools/config/.bashrc ~/
cp linux_tools/config/.vimrc ~/

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

google-chrome https://www.yworks.com/products/yed/download &

cd ~
wget https://justgetflux.com/linux/xflux64.tgz
tar -xvf xflux64.tgz 
mv xflux apps/
rm xflux64.tgz

sudo apt-get upgrade


echo "run ubuntu-after-install"
echo "turn on privacy"
echo  "To do this, go to System Settings -> Security & Privacy :  disable record app results and the unity online search"
echo "System settings > appearance -> enable workspaces"


echo ""
echo "Also, ttf-liberation font has been installed, can select that in terminal.."
