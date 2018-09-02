#! /bin/bash

#author: Pierre-Yves Lemay

cd /opt/dev/java

if [ ! -d /opt/dev/java/workspaces ]
then
  echo "....creating workspaces directory"
  mkdir workspaces
  # IMPORTANT: un premier workspace pour configurer eclipse. Ce workspace servira de base pour la creation des autres.
  #mkdir workspaces/workspace-vanille
  cd /opt/dev/java/workspaces
  cp /opt/install-dev/workspace-vanille.tar.gz /opt/dev/java/workspaces/workspace-vanille.tar.gz
  tar -xzf workspace-vanille.tar.gz
  rm workspace-vanille.tar.gz
  ln -s /opt/dev/java/workspaces/workspace-vanille /opt/dev/java/workspaces/workspace
fi


