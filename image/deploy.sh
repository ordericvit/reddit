#!/bin/bash
apt install unrar
mkdir -p /home/appuser/reddit
cp /tmp/reddit.rar /home/appuser/reddit/reddit.rar
cd /home/appuser/reddit
unrar e reddit.rar /home/appuser/reddit
source /etc/profile.d/rvm.sh
rvm use 2.5.3
export PATH=$PATH:/home/appuser/.gem/ruby/2.5.3/bin
export PATH=$PATH:/usr/lib/ruby/gems/2.5.3/bin
apt-get install rubygems
gem install bundle
gem install bundler
gem install puma
cd /home/appuser/reddit
bundle exec puma