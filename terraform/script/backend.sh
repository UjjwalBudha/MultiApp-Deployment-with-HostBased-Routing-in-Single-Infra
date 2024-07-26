#!/bin/bash

# Update package list and install dependencies
sudo apt-get update

# Restart ssm agent
sudo systemctl restart snap.amazon-ssm-agent.amazon-ssm-agent.service

# Install node 20
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install 20
    nvm use 20
    nvm alias default 20