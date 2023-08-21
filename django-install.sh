#!/bin/bash

# Exit on error
set -e

# Update and upgrade the system
echo "Updating and upgrading system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Java 17 installation step
echo "Installing Java 17..."
sudo apt install openjdk-17-jdk openjdk-17-jre -y
java --version

# Maven install step
echo "Installing Maven..."
sudo apt install maven -y
mvn -version

# Docker installation step
echo "Installing Docker..."
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
docker --version

# Install Python venv and pip
echo "Installing Python virtual environment and pip..."
sudo apt install python3.10-venv python3-pip -y

# Install Kubectl
echo "Installing Kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client

## Install Terraform
#wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
#echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
#sudo apt update && sudo apt install terraform -y

## doctl install
#wget https://github.com/digitalocean/doctl/releases/download/v1.94.0/doctl-1.94.0-linux-amd64.tar.gz
#tar xf doctl-1.94.0-linux-amd64.tar.gz
#sudo mv doctl /usr/local/bin

# Install Azure CLI
echo "Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "All installations completed successfully!"
