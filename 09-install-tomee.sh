#!/bin/bash

#author: Pierre-Yves Lemay

if [ ! -d /opt/dev/java/servers ]
then
  mkdir /opt/dev/java/servers
fi

if [ -e /opt/depot/apache-tomee-7.0.2-plume.tar.gz ]
then
  echo "....apache-tomee-7.0.2-plume.tar.gz already in depot, copying to servers..."
  cp /opt/depot/apache-tomee-7.0.2-plume.tar.gz /opt/dev/java/servers/apache-tomee-7.0.2-plume.tar.gz
else
  echo "....download apache-tomee-7.0.2-plume.tar.gz from internet..."
  cd /opt/depot
  wget -4 "http://repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/7.0.2/apache-tomee-7.0.2-plume.tar.gz" \
  -O apache-tomee-7.0.2-plume.tar.gz
  cp /opt/depot/apache-tomee-7.0.2-plume.tar.gz /opt/dev/java/servers/apache-tomee-7.0.2-plume.tar.gz
fi

echo "....installing apache-tomee-7.0.2-plume.tar.gz..."
cd /opt/dev/java/servers
tar -xzf apache-tomee-7.0.2-plume.tar.gz
#menage
rm apache-tomee-7.0.2-plume.tar.gz


