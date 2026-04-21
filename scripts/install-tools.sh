#!/bin/bash
set -e

echo "Updating system..."
sudo dnf update -y

echo "Installing Docker, Git, AWS CLI..."
sudo dnf install -y docker git awscli

echo "Enabling Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding ec2-user to docker group..."
sudo usermod -aG docker ec2-user

echo "Installing Docker Compose plugin..."
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p "$DOCKER_CONFIG/cli-plugins"
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 \
  -o "$DOCKER_CONFIG/cli-plugins/docker-compose"
chmod +x "$DOCKER_CONFIG/cli-plugins/docker-compose"

echo "Done. Logout and login again before using docker without sudo."
docker --version || true
docker compose version || true
aws --version || true
git --version || true