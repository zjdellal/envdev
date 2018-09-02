#! /bin/bash

#author: Pierre-Yves Lemay

cd /opt/dev/java

if [ -d /opt/dev/java/scripts ]
then
  rm -rf /opt/dev/java/scripts
fi
echo "....creating scripts directory"
mkdir /opt/dev/java/scripts

if [ -d /opt/dev/java/launchers ]
then
  rm -rf /opt/dev/java/launchers
fi
echo "....creating launchers directory"
mkdir /opt/dev/java/launchers

cp /opt/install-dev/new-project.sh /opt/dev/java/scripts/new-project.sh
chmod +x /opt/dev/java/scripts/new-project.sh



