#! /bin/bash

#author: Pierre-Yves Lemay

if [ "$USER" == "root" ]; then
  echo "Please restart with developer user account" && exit 1
fi

if [ -d /opt/dev/java/maven ]
then
  echo "....directory maven exists, delete it and restart installing maven"
  rm -rf /opt/dev/java/maven
fi
mkdir /opt/dev/java/maven

#if maven is already in the depot, copy it instead of re-downloading
cd /opt/depot
if [ -e /opt/depot/apache-maven-3.5.3-bin.tar.gz ]
then
  echo "....apache-maven-3.5.3-bin.tar.gz is already in the depot, copy it to /opt/dev/java/maven"
  cp apache-maven-3.5.3-bin.tar.gz /opt/dev/java/maven/apache-maven-3.5.3-bin.tar.gz
else
  echo "....downloading apache-maven-3.5.3-bin.tar.gz from internet"
  wget -4 http://apache.mirror.vexxhost.com/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz -O apache-maven-3.5.3-bin.tar.gz
  cp apache-maven-3.5.3-bin.tar.gz /opt/dev/java/maven/apache-maven-3.5.3-bin.tar.gz
fi

#more complexe installation. Have to add maven to PATH in .profile. JAVA_HOME has to exist for maven. So set it in .profile too.
echo "....installing maven"
cd /opt/dev/java/maven
tar -xzf apache-maven-3.5.3-bin.tar.gz
rm apache-maven-3.5.3-bin.tar.gz

#test if current maven is in PATH. If not, add it to .profile.
if [[ "$PATH" =~ (^|:)"/opt/dev/java/maven/apache-maven-3.5.3/bin"(|/)(:|$) ]]; then
    echo "maven is already in PATH"
else
    echo "export PATH=/opt/dev/java/maven/apache-maven-3.5.3/bin:$PATH" >> /home/$DEV_USER/.profile
fi

#if JAVA_HOME is set in .profile, do nothing. Else, set it to the symlink 
JH=$(cat /home/$DEV_USER/.profile |grep JAVA_HOME)
if [ -z "$JH" ]
then
  echo "export JAVA_HOME=/opt/dev/java/jdks/jdk" >> /home/$DEV_USER/.profile
fi

echo "....restart session to complete!"




