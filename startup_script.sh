#!/bin/bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys $KEY
curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
apt-get install ruby-full
source ~/.rvm/scripts/rvm source ~/.rvm/scripts/rvm
rvm requirements
rvm use 2.6.5 --default
gem install bundler -V --no-ri --no-rdoc
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
apt-get install -y mongodb-org
systemctl unmask mongodb
service mongod start
systemctl enable mongod
systemctl status mongod
git clone https://github.com/Artemmkin/reddit.git
cd ~/reddit && bundle install
puma -d
ps aux | grep puma

gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags testscriptorderic-server --restart-on-failure --zone=europe-west1-b reddit-app \ 
--metadata startup-script='#!/bin/bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys $KEY
curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
apt-get install ruby-full
source ~/.rvm/scripts/rvm source ~/.rvm/scripts/rvm
rvm requirements
rvm use 2.3.1 --default
gem install bundler -V --no-ri --no-rdoc
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
apt-get install -y mongodb-org
systemctl unmask mongodb
service mongod start
systemctl enable mongod
systemctl status mongod
git clone https://github.com/Artemmkin/reddit.git
cd ~/reddit && bundle install
puma -d
ps aux | grep puma
EOF'
