#!/bin/bash
# 1. Clone the Git repository using the command:
git clone https://github.com/devopsinsiders/todoapp-frontend-react.git
# 2. Navigate to the cloned repository:
cd todoapp-frontend-react
# 3. Install NodeJS 16.x and npm:
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y npm
#  Run "npm install":
npm install
#  Run "npm run build":
npm run build
# Update package index
apt-get update
# Install nginx:
sudo apt-get install -y nginx
#  Copy files to nginx server path:
sudo cp -r build/* /var/www/html/
#  Restart nginx:
sudo systemctl restart nginx
# Start Nginx service
systemctl start nginx
# Enable Nginx service to start on boot
systemctl enable nginx
