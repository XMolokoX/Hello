#!/bin/bash

sudo yum update -y
sudo yum install wget -y
#install java
sudo yum install java-1.8.0-openjdk.x86_64 -y

cd /./opt


sudo wget http://download.sonatype.com/nexus/3/nexus-3.15.1-01-unix.tar.gz
	
sudo tar -zxvf nexus-3.15.1-01-unix.tar.gz
sudo rm -rf nexus-3.15.1-01-unix.tar.gz
sudo mv /opt/nexus-3* /opt/nexus
sudo adduser nexus
line=$(sudo sed -n '/root/{/ALL/=}' /etc/sudoers)
#line = ${cd /./home | ls -al}
sudo sed -ie ''$line' a nexus	ALL=(ALL)	NOPASSWD: ALL' /etc/sudoers 
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo sed -ie 's/run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo chkconfig --add nexus
sudo chkconfig nexus on


