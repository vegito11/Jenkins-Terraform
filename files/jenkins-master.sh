#!/bin/bash

sudo apt update -y
sudo apt install openjdk-11-jre -y

# Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository to sources list
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package index again to include Jenkins repository
sudo apt update
sudo apt install -y jenkins

# Start and Enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Print Jenkins initial admin password (you'll need this to set up Jenkins)
echo "Jenkins initial admin password:"
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"


### Install Ansible

sudo apt install software-properties-common  
sudo apt-add-repository ppa:ansible/ansible  
sudo apt update  
sudo apt install ansible -y