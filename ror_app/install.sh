#!/bin/sh
#rvm :
sudo apt-get install -y build-essential curl zlib1g-dev libreadline-dev libssl-dev libxml2-dev

##Separation ?
curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
#Complete path for rvm because new bashrc isn't load yet
.rvm/bin/rvm reload

#ruby :
.rvm/bin/rvm install 1.9.2

#rails : 
sudo apt-get install -y rails3

#git:
sudo apt-get install -y git

#rapatriement du projet:
git clone https://github.com/STremouille/rails.git
mv rails/ projet-rails/

#intall all gems:
sudo apt-get install -y sqlite3 libsqlite3-dev
sudo gem install sqlite3 -v '1.3.7'
cd projet-rails/ror_app/
bundle install

#migrate de la bdd
rake db:migrate
