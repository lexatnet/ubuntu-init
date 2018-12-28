#!/bin/bash

apt update
apt install -y git
cd /tmp
git clone https://github.com/lexatnet/ubuntu-init.git
cd ubuntu-init


apt install -y  mc
apt install -y chromium-browser
apt install -y net-tools
apt install -y g++

#install ssh server
apt install -y openssh-server
service ssh status

# install archive utils
apt install -y unzip
apt install -y p7zip-full

#install goldendict
apt install -y goldendict
cd dicts
mkdir ~/.dicts/
ls *.tar.gz | xargs -I '{}' tar -zxvf {} --directory ~/.dicts/
ls *.tar.bz2 | xargs -I '{}' tar -jxvf {} --directory ~/.dicts/
ls *.zip | xargs -I '{}' unzip {} -d ~/.dicts/

# setup tor-browser
apt install -y torbrowser-launcher

sed -i "s/HISTCONTROL=/HISTCONTROL=ignoreboth:erasedups #HISTCONTROL=/g" ~/.bashrc
sed -i "s/HISTSIZE=/HISTSIZE=10000 #HISTSIZE=/g" ~/.bashrc
sed -i "s/HISTFILESIZE=/HISTFILESIZE=10000 #HISTFILESIZE=/g" ~/.bashrc

# disable terminal supress
echo "stty -ixon" >> ~/.bashrc


#install keepassx
add-apt-repository ppa:eugenesan/ppa
apt update
apt install -y keepassx

#install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install node

#install ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install 2.5.0
rbenv global 2.5.0
gem install -y bundler

# install docker
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt update
apt install -y docker-ce
groupadd docker
usermod -aG docker $USER

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#install sqlite3
apt install -y sqlite3

#install VPN managers
apt install -y openvpn network-manager-openvpn
apt install -y openconnect network-manager-openconnect

#install VirtualBox
apt install -y virtualbox
apt install -y virtualbox-ext-pack

#install flash-player
add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
apt update
apt install -y adobe-flashplugin browser-plugin-freshplayer-pepperflash
