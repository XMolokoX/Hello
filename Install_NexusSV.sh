#!/bin/bash
cd /./opt
wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
tar -zxvf nexus-3.0.2-02-unix.tar.gz
mv /opt/nexus-3.0.2-02 /opt/nexus
adduser nexus
line=$(sed -n '/root/{/ALL/=}' /etc/sudoers)
#line = ${cd /./home | ls -al}


echo "$line"
#sed -ie '$line a nexus	ALL=(ALL)	ALL' /etc/sudoers
sed -ie ''$line' a nexus	ALL=(ALL)	NOPASSWD: ALL' /etc/sudoers 
chown -R nexus:nexus /opt/nexus
sed -ie 's/run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.d
ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

