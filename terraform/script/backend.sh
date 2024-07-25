#!/bin/bash

# Update package list and install dependencies
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev curl

# Install MySQL server
sudo apt install mysql-server -y

#Install npm
sudo apt install npm -y


# install node 20 using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc

nvm install 20
nvm use 20
nvm alias default 20

# Install Nginx
sudo apt-get install -y nginx

# Change to the home directory of the current user
cd /home/ubuntu

# Clone the GitHub repository
git clone https://github.com/UjjwalBudha/final-project-app-backend.git

# Navigate to the backend directory and install npm packages
cd /home/ubuntu/final-project-app-backend
npm install


# Create or replace the default Nginx configuration
sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    server_name ujwal.sandbox.adex.ltd;

    location / {
        proxy_pass http://localhost:8082;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}


server {
    listen 80;
    server_name budha.sandbox.adex.ltd;

    location / {
        proxy_pass http://localhost:8081;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

EOF'

# Test Nginx configuration
sudo nginx -t

# Restart Nginx to apply the changes
sudo systemctl restart nginx
