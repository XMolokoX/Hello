  
#!/bin/bash

#Update Packages
sudo yum install update -y

#install java
sudo yum install java-1.8.0 -y

#Download latest Jenkins code package
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

#Import a key file from Jenkins-CI to enable installationg from the package
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

#Install Jenkins
sudo yum install jenkins -y

#To start jenkins on a diff port
#Update port number in /etc/sysconfig/jenkins
sudo service jenkins start
sleep 15
#To fetch initial admin password

#cd /var/lib/jenkins/secrets/
#cat initialAdminPassword
