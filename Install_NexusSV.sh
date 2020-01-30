#!/bin/bash
cd /./opt
sudo wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
sudo tar -zxvf nexus-3.0.2-02-unix.tar.gz
sudo mv /opt/nexus-3.0.2-02 /opt/nexus
sudo adduser nexus
line=$(sed -n '/root/{/ALL/=}' /etc/sudoers)
#line = ${cd /./home | ls -al}
sudo sed -ie ''$line' a nexus	ALL=(ALL)	NOPASSWD: ALL' /etc/sudoers 
sudo chown -R nexus:nexus /opt/nexus
sudo sed -ie 's/run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

