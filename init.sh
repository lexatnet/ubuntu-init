#!/bin/bash

apt-get install goldendict

# setup tor-browser
add-apt-repository ppa:webupd8team/tor-browser
apt-get update
apt-get install tor-browser
