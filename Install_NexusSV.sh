#!/bin/bash
sudo yum install update -y

#install java
sudo yum install java-1.8.0 -y

cd /./opt

sudo wget http://download.sonatype.com/nexus/3/nexus-3.15.1-01-unix.tar.gz
sudo tar -zxvf nexus-3.15.1-01-unix.tar.gz
sudo mv /opt/nexus-3.15.1-01 /opt/nexus
sudo adduser nexus
line=$(sudo sed -n '/root/{/ALL/=}' /etc/sudoers)
#line = ${cd /./home | ls -al}
sudo sed -ie ''$line' a nexus	ALL=(ALL)	NOPASSWD: ALL' /etc/sudoers 
sudo chown -R nexus:nexus /opt/nexus
sudo sed -ie 's/run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

