#!/bin/bash
set -e

source ~/.profile
sudo chmod 777 -R /usr/local/rvm/gems/ruby-2.5.3/wrappers
git clone https://github.com/Artemmkin/reddit.git
cd reddit
sudo chmod 777 -R ~/.profile
bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
