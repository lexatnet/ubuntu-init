#!/bin/bash

apt-get update
apt-get install mc
apt-get install goldendict
apt-get install chromium-browser

# setup tor-browser
add-apt-repository ppa:webupd8team/tor-browser
apt-get update
apt-get install tor-browser

sed -i "s/HISTCONTROL=/HISTCONTROL=ignoreboth:erasedups #HISTCONTROL=/g" ~/.bashrc
sed -i "s/HISTSIZE=/HISTSIZE=10000 #HISTSIZE=/g" ~/.bashrc
sed -i "s/HISTFILESIZE=/HISTFILESIZE=10000 #HISTFILESIZE=/g" ~/.bashrc

#install keepassx
sudo add-apt-repository ppa:eugenesan/ppa
apt-get update
sudo apt-get install keepassx

#install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
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
apt-get update
apt-get install docker-ce
groupadd docker
usermod -aG docker $USER

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
