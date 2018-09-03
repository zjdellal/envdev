#!/bin/bash

#author: Pierre-Yves Lemay

if [ -e /opt/depot/jdk-10.0.2_linux-x64_bin.tar.gz ]
then
  echo "....jdk-10.0.2_linux-x64_bin.tar.gz already in depot, copying to jdks..."
  cp /opt/depot/jdk-10.0.2_linux-x64_bin.tar.gz /opt/dev/java/jdks/jdk-10.0.2_linux-x64_bin.tar.gz
else
  echo "....download jdk-10.0.2_linux-x64_bin.tar.gz from internet..."
  cd /opt/depot
  wget -4 --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.tar.gz" \
  -O jdk-10.0.2_linux-x64_bin.tar.gz
  cp /opt/depot/jdk-10.0.2_linux-x64_bin.tar.gz /opt/dev/java/jdks/jdk-10.0.2_linux-x64_bin.tar.gz
fi

echo "....installing jdk-10.0.2_linux-x64_bin.tar.gz..."
cd /opt/dev/java/jdks
tar -xzf jdk-10.0.2_linux-x64_bin.tar.gz
#menage
rm jdk-10.0.2_linux-x64_bin.tar.gz
#creer un lien symbolique vers un premier jdk
#echo "....create symlink /opt/dev/java/jdks/jdk. Target is /opt/dev/java/jdks/jdk-10.0.1..."
#ln -s /opt/dev/java/jdks/jdk-10.0.1 /opt/dev/java/jdks/jdk

