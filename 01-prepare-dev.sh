#!/bin/bash

#author: Pierre-Yves Lemay

if [ "$USER" == "root" ]; then
  echo "Please restart with developer user account" && exit 1
fi

cd /opt/dev
if [ -d /opt/dev/java ]
then
  echo "........directory java already exists - delete and start again"
  rm -rf /opt/dev/java
fi
mkdir java
mkdir java/jdks
echo "........calling 02-get-jdk10.sh"
/opt/install-dev/02-get-jdk10.sh
echo "........calling 03-get-jdk8.sh"
/opt/install-dev/03-get-jdk8.sh
echo "........calling 035-set-default-jdk.sh"
/opt/install-dev/035-set-default-jdk.sh
echo "........calling 04-install-maven.sh"
/opt/install-dev/04-install-maven.sh
echo "........calling 05-install-eclipse.sh"
/opt/install-dev/05-install-eclipse.sh
echo "........calling 06-create-workspaces.sh"
/opt/install-dev/06-create-workspaces.sh
echo "........calling 07-create-scripts.sh"
/opt/install-dev/07-create-scripts.sh
echo "........calling 08-install-tomcat.sh"
/opt/install-dev/08-install-tomcat.sh
echo "........calling 09-install-tomee.sh"
/opt/install-dev/09-install-tomee.sh

if [ -d /etc/xfce4 ]
then
  echo "........setup xfce thunar for executing .sh files on double-click"
  /opt/install-dev/10-xfce-settings.sh
fi 

echo "........calling 11-install-javafx.sh"
/opt/install-dev/11-install-javafx.sh
echo "........calling 12-install-libs.sh"
/opt/install-dev/12-install-libs.sh
echo "........calling 13-install-docker.sh"
/opt/install-dev/13-install-docker.sh



echo "....01-prepare-dev.sh Done!"
echo "....Please restart to terminate the installation"








