#!/bin/bash

# Update package list and install dependencies
sudo apt-get update

# Restart ssm agent
sudo systemctl restart snap.amazon-ssm-agent.amazon-ssm-agent.service

# Install nvm and node 20
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Source nvm script to make it available in the current shell session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install and use node 20
nvm install 20
nvm use 20
nvm alias default 20
