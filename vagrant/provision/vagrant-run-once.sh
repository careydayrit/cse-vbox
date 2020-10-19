#!/usr/bin/env bash


# make sure we are fetching the latest update
sudo apt-get update      

# install the needed to make the smart card reading
sudo apt-get install -y gnupg pcscd scdaemon pinentry-tty

# install the yubikey manager
sudo add-apt-repository ppa:yubico/stable && sudo apt-get update

sudo app-get install -y yubkkey-manager

# copy the files

cat /vagrant/provision/inclusion.txt >> /home/vagrant/.bashrc
cp /vagrant/provision/scdaemon.conf /home/vagrant/.gnupg
chown vagrant:vagrant /home/vagrant/.gnupg/scdaemon.conf
cp /vagrant/provision/gpg-agent.conf /home/vagrant/.gnupg
chown vagrant:vagrant /home/vagrant/.gnupg/gpg-agent.conf
cp /vagrant/provision/config /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh/config


