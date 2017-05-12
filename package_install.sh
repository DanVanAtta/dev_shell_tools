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


## harden the kernel a bit
# Set: kernel.kptr_restrict = 2 in /etc/sysctl.d/10-kernel-hardening.conf
# install node

sudo add-apt-repository ppa:fossfreedom/byzanz
sudo apt-get update && sudo apt-get install byzanz

#echo "show hidden start up application in startup applications app, remove unnecessary ones there"
#sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop


wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update

sudo apt-get install tiptop gimp htop traceroute apache2 virtualbox clamav php5-cli shellcheck maven npm openvpn gimp htop mysql-server openvpn oracle-java8-installer fail2ban ttf-liberation nmap iftop dos2unix vagrant git eclipse meld sublime-text-installer google-chrome-stable ntp ntpdate lm-sensors psensor unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller parallel expect ruby ruby-dev compizconfig-settings-manager libxml2-utils iftop htop openssh-server -y


## https://askubuntu.com/questions/4428/how-to-record-my-screen  
sudo add-apt-repository ppa:fossfreedom/byzanz
sudo apt-get update && sudo apt-get install byzanz

# install diff-so-fancy  - https://github.com/so-fancy/diff-so-fancy
sudo npm install -g diff-so-fancy


# TODO
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

git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"

# fancy diff color
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"



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
google-chrome http://dev.mysql.com/downloads/workbench/ & 

cd ~
wget https://justgetflux.com/linux/xflux64.tgz
tar -xvf xflux64.tgz 
mv xflux apps/
rm xflux64.tgz

sudo apt-get upgrade



