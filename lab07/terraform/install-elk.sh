#!/bin/bash

echo "Instalando Docker"

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common \
    jq \
    git
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
groupadd docker
usermod -aG docker ubuntu
systemctl enable docker

echo "Instalando ELK"

cd /home/ubuntu
git clone https://github.com/deviantony/docker-elk.git
chown -R ubuntu:ubuntu docker-elk/
cd /home/ubuntu/docker-elk/
docker compose up setup
docker compose up -d