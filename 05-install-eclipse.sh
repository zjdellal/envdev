#! /bin/bash

#author: Pierre-Yves Lemay

cd /opt/dev/java

#if directory /opt/dev/java/eclipses does not exists, create it.
#same for /opt/dev/java/eclipses/oxygen3
if [ ! -d /opt/dev/java/eclipses ]
then
  echo "creating eclipses directory"
  mkdir eclipses
  mkdir eclipses/oxygen3
fi

#getting eclipse oxygen3
if [ -e /opt/depot/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz ]
then
  echo "....copying eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz to /opt/dev/java/eclipses/oxygen3..."
  cp /opt/depot/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz /opt/dev/java/eclipses/oxygen3/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz
else
  echo "....getting eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz from internet..."
  cd /opt/depot
  wget -4 "http://eclipse.mirror.rafal.ca/technology/epp/downloads/release/oxygen/3a/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz" \
  -O eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz
  cp /opt/depot/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz /opt/dev/java/eclipses/oxygen3/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz
fi

#install oxygen3
echo "....installing eclipse oxygen3"
cd /opt/dev/java/eclipses/oxygen3
tar -xzf eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz
rm eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz

#symlink to default eclipse version (directory)
ln -s /opt/dev/java/eclipses/oxygen3/eclipse /opt/dev/java/eclipses/eclipse
cp /opt/install-dev/code-formatter.xml /opt/dev/java/eclipses/code-formatter.xml

