<<<<<<< HEAD
#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Install Nginx if not already installed
if ! dpkg -l | grep -q nginx; then
    apt-get update
    apt-get install -y nginx
fi

# Create necessary directories
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
touch /data/web_static/releases/test/index.html

# Create a fake HTML file
echo "Hello, this is a test!" > /data/web_static/releases/test/index.html

# Create or update symbolic link
if [ -L /data/web_static/current ]; then
    rm /data/web_static/current
fi
ln -sf /data/web_static/releases/test/ /data/web_static/current

# Set ownership to ubuntu user and group recursively
chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
config_file="/etc/nginx/sites-available/default"
if [ -f "$config_file" ]; then
    sed -i '/location \/hbnb_static {/a \
        alias /data/web_static/current/;' "$config_file"
fi

# Restart Nginx
service nginx restart

exit 0

=======
#!/usr/bin/env bash
# Sets up a web server for deployment of web_static.

apt-get update
apt-get install -y nginx

mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "Hello World" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current

chown -R ubuntu /data/
chgrp -R ubuntu /data/

printf %s "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By $HOSTNAME;
    root   /var/www/html;
    index  index.html index.htm;

    location /hbnb_static {
        alias /data/web_static/current;
        index index.html index.htm;
    }

    location /redirect_me {
        return 301 http://cuberule.com/;
    }

    error_page 404 /404.html;
    location /404 {
      root /var/www/html;
      internal;
    }
}" > /etc/nginx/sites-available/default

service nginx restart
>>>>>>> 9db69a5622ce3505e96f160ca8f62b5ebe8dd509
