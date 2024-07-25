#!/bin/bash

# Update the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Node 20
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc

nvm install 20
nvm use 20
nvm alias default 20

# Install MySQL server
sudo apt-get install -y mysql-server

# Install PM2 globally
npm install -g pm2

# Install Nginx
sudo apt-get install -y nginx

# Change to the home directory of the current user
cd /home/ubuntu

# Clone the GitHub repository
git clone https://github.com/UjjwalBudha/final-project-app-frontend.git

# Navigate to the frontend directory and install npm packages
cd /home/ubuntu/final-project-app-frontend
npm install

# Start the frontend application (use pm2 to run it in the background)
# pm2 start npm --name "frontend" -- start

# Create or replace the default Nginx configuration
sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    server_name ujwal.sandbox.adex.ltd;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}

server {
    listen 80;
    server_name budha.sandbox.adex.ltd;

    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF'

# Test Nginx configuration
sudo nginx -t

# Restart Nginx to apply the changes
sudo systemctl restart nginx
