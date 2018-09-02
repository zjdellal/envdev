#!/bin/bash

#author: Pierre-Yves Lemay

if [ ! -d /opt/dev/java/servers ]
then
  mkdir /opt/dev/java/servers
fi

#tomcat 8
if [ -e /opt/depot/apache-tomcat-8.5.33.tar.gz ]
then
  echo "....apache-tomcat-8.5.33.tar.gz already in depot, copying to servers..."
  cp /opt/depot/apache-tomcat-8.5.33.tar.gz /opt/dev/java/servers/apache-tomcat-8.5.33.tar.gz
else
  echo "....download apache-tomcat-8.5.33.tar.gz from internet..."
  cd /opt/depot
  wget -4 "http://muug.ca/mirror/apache-dist/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.tar.gz" \
  -O apache-tomcat-8.5.33.tar.gz
  cp /opt/depot/apache-tomcat-8.5.33.tar.gz /opt/dev/java/servers/apache-tomcat-8.5.33.tar.gz
fi

#tomcat 9
if [ -e /opt/depot/apache-tomcat-9.0.11.tar.gz ]
then
  echo "....apache-tomcat-9.0.11.tar.gz already in depot, copying to servers..."
  cp /opt/depot/apache-tomcat-9.0.11.tar.gz /opt/dev/java/servers/apache-tomcat-9.0.11.tar.gz
else
  echo "....download apache-tomcat-9.0.11.tar.gz from internet..."
  cd /opt/depot
  wget -4 "http://mirror.its.dal.ca/apache/tomcat/tomcat-9/v9.0.11/bin/apache-tomcat-9.0.11.tar.gz" \
  -O apache-tomcat-9.0.11.tar.gz
  cp /opt/depot/apache-tomcat-9.0.11.tar.gz /opt/dev/java/servers/apache-tomcat-9.0.11.tar.gz
fi

echo "....installing apache-tomcat-8.5.33..."
cd /opt/dev/java/servers
tar -xzf apache-tomcat-8.5.33.tar.gz
echo "....installing apache-tomcat-9.0.11.tar.gz..."
tar -xzf apache-tomcat-9.0.11.tar.gz
#menage
rm apache-tomcat-8.5.33.tar.gz
rm apache-tomcat-9.0.11.tar.gz



