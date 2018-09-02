#! /bin/bash

#author: Pierre-Yves Lemay

if [ -d /etc/xfce4 ]
then
  tty -s; if [ $? -ne 0 ]; then xfce4-terminal -e "$0"; exit; fi
fi 

#if GUI is XFCE, remove comments
#tty -s; if [ $? -ne 0 ]; then xfce4-terminal -e "$0"; exit; fi
echo "Please enter project name (lowercase)"
read projectname
launcher_filename=/opt/dev/java/launchers/eclipse-$projectname.sh
workspace_name=/opt/dev/java/workspaces/workspace-$projectname
if [ ! -d "$workspace_name" ]; then
  mkdir $workspace_name
  rsync -r /opt/dev/java/workspaces/workspace-vanille/ $workspace_name
fi
echo "#! /bin/bash" >> $launcher_filename
echo "unlink /opt/dev/java/workspaces/workspace" >> $launcher_filename
echo "ln -s "$workspace_name" /opt/dev/java/workspaces/workspace" >> $launcher_filename
echo "cd /opt/dev/java/eclipses" >> $launcher_filename
echo "/opt/dev/java/eclipses/eclipse/eclipse -data /opt/dev/java/workspaces/workspace -vm /opt/dev/java/jdks/jdk/bin/java -vmargs -Xms512m -Xmx2048m" >> $launcher_filename
chmod +x $launcher_filename
cd /opt/dev/java
$launcher_filename

