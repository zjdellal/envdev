#! /bin/bash

#author: Pierre-Yves Lemay

if [ "$USER" == "root" ]; then
  echo "Please restart with developer user account" && exit 1
fi

echo "....installing libs"
cd /opt/dev/java
cp /opt/install-dev/lib_zip.tar.gz /opt/dev/java/lib_zip.tar.gz
tar -xzf lib_zip.tar.gz
rm lib_zip.tar.gz





