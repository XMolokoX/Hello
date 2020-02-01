#!/bin/bash
#sudo yum install epel-release -y
#sudo yum update -y && sudo reboot

sudo yum install java-1.8.0-openjdk.x86_64 -y

sudo groupadd tomcat
sudo mkdir -p /opt/tomcat
sudo useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
sudo cd ~
sudo wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz
tar -zxvf apache-tomcat-8.0.33.tar.gz -C /opt/tomcat --strip-components=1
sudo rm -rf apache*
cd /opt/tomcat
sudo chgrp -R tomcat conf
sudo chmod g+rwx conf
sudo chmod g+r conf/*
sudo chown -R tomcat logs/ temp/ webapps/ work/

sudo chgrp -R tomcat bin
sudo chgrp -R tomcat lib
sudo chmod g+rwx bin
sudo chmod g+r bin/*


sudo touch /etc/systemd/system/tomcat.service
sudo cat <<EOT >> /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat Web Application
After=syslog.target network.target

[Service]
Type=forking


ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdowm.sh

User=tomcat
Group=tomcat

[Install]
WantedBy=multi-user.target
EOT

sudo systemctl start tomcat.service
sudo systemctl enable tomcat.service

sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

