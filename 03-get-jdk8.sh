#!/bin/bash

#author: Pierre-Yves Lemay

if [ -e /opt/depot/jdk-8u181-linux-x64.tar.gz ]
then
echo "....jdk-8u181-linux-x64.tar.gz already in depot, copying to jdks..."
  cp /opt/depot/jdk-8u181-linux-x64.tar.gz /opt/dev/java/jdks/jdk-8u181-linux-x64.tar.gz
else
  echo "....download jdk-8u181-linux-x64.tar.gz from internet..."
  cd /opt/depot
  wget -4 --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz" \
  -O jdk-8u181-linux-x64.tar.gz
  cp /opt/depot/jdk-8u181-linux-x64.tar.gz /opt/dev/java/jdks/jdk-8u181-linux-x64.tar.gz
fi

echo "....installing jdk-8u181-linux-x64.tar.gz..."
cd /opt/dev/java/jdks
tar -xzf jdk-8u181-linux-x64.tar.gz
rm jdk-8u181-linux-x64.tar.gz
#creer un lien symbolique vers un premier jdk, v8 par defaut
#echo "....create symlink /opt/dev/java/jdks/jdk. Target is /opt/dev/java/jdks/jdk1.8.0_181..."
#ln -s /opt/dev/java/jdks/jdk1.8.0_181 /opt/dev/java/jdks/jdk


