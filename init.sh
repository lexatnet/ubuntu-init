#!/bin/bash

apt update
apt install mc
apt install chromium-browser

#install ssh server
apt install openssh-server
sudo service ssh status

# install archive utils
sudo apt install unzip
sudo apt install p7zip-full

#install goldendict
apt install goldendict
# TODO: extract dictionaries

# setup tor-browser
apt install tor
add-apt-repository ppa:webupd8team/tor-browser
apt update
apt install tor-browser

sed -i "s/HISTCONTROL=/HISTCONTROL=ignoreboth:erasedups #HISTCONTROL=/g" ~/.bashrc
sed -i "s/HISTSIZE=/HISTSIZE=10000 #HISTSIZE=/g" ~/.bashrc
sed -i "s/HISTFILESIZE=/HISTFILESIZE=10000 #HISTFILESIZE=/g" ~/.bashrc
echo "stty -ixon" >> ~/.bashrc

#install keepassx
sudo add-apt-repository ppa:eugenesan/ppa
apt update
sudo apt install keepassx

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
gem install bundler

# install docker
apt update
apt install docker-ce
groupadd docker
usermod -aG docker $USER

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#install sqlite3
apt install -y sqlite3
