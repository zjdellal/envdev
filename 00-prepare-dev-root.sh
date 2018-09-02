#!/bin/bash

#author: Pierre-Yves Lemay

#HERE= where this script is located in the file system
HERE=$(pwd)
if [ "$USER" != "root" ]; then
  echo "Please restart with sudo" && exit 1
fi

#prerequis : setter DEV_USER dans /etc/environment
#tester ici si la variable existe, et sortir avec un message si elle n'existe pas

if [[ -z "${DEV_USER}" ]]; then
  echo "please create variable DEV_USER in /etc/environment, then logout en retry this script"
  exit
fi

cd /opt

#creating de /opt/dev directory. If it already exists, delete it and start the whole install procedure
if [ -d /opt/dev ]
then
  sudo rm -rf /opt/dev
fi
sudo mkdir dev
sudo chown -R $DEV_USER:$DEV_USER dev

# copy all install scripts from current directory (clone from gitlab/github) to /opt/install-dev
if [ -d /opt/install-dev ]
then
  sudo rm -rf /opt/install-dev
fi
sudo mkdir install-dev
sudo cp $HERE/*.sh /opt/install-dev
sudo cp $HERE/*.xml /opt/install-dev
sudo cp $HERE/*.jar /opt/install-dev
sudo cp $HERE/*.tar.gz /opt/install-dev
sudo chown -R $DEV_USER:$DEV_USER /opt/install-dev
sudo chmod +x /opt/install-dev/*.sh
sudo chmod +x /opt/install-dev/*.jar

# /opt/depot holds binaries downloaded from internet. Tweak made for performance optimisation.
if [ ! -d /opt/depot ]
then
  sudo mkdir /opt/depot
fi

#be sure the dev user has all rights on the depot folder
sudo chown -R $DEV_USER:$DEV_USER /opt/depot

#install git
sudo apt install -y git

#install openssh-server
sudo apt install -y openssh-server

#install gedit
sudo apt install -y gedit

echo "editer le fichier /etc/ssh/sshd_config. enlever le commentaire pour le port 22, et ajouter le port 443 sur la ligne suivante. Redémarrer"



