#!/bin/bash



apt-get install goldendict

# setup tor-browser
add-apt-repository ppa:webupd8team/tor-browser
apt-get update
apt-get install tor-browser

sed -i "s/HISTCONTROL=/HISTCONTROL=ignoreboth:erasedups #HISTCONTROL=/g" ~/.bachrc
sed -i "s/HISTSIZE=/HISTSIZE=10000 #HISTSIZE=/g" ~/.bachrc
sed -i "s/HISTFILESIZE=/HISTFILESIZE=10000 #HISTFILESIZE=/g" ~/.bachrc
