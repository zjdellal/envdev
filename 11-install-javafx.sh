#! /bin/bash

#author: Pierre-Yves Lemay

if [ ! -d /opt/dev/java/tools ]
then
  echo "creating tools directory"
  mkdir /opt/dev/java/tools
fi

cp /opt/install-dev/gluon.sh /opt/dev/java/tools
cp /opt/install-dev/scenebuilder-8.4.1-all.jar /opt/dev/java/tools

