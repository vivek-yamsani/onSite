#! /bin/bash

sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests

sudo mkdir /var/www/html/public_html
sudo cp detect.php /var/www/html/public_html/ 

sudo cp ./desktop.loadbalance.local.conf /etc/apache2/sites-available/desktop.loadbalance.local.conf 
sudo cp ./mobile.loadbalance.local.conf /etc/apache2/sites-available/mobile.loadbalance.local.conf 
sudo cp ./loadbalance.local.conf /etc/apache2/sites-available/loadbalance.local.conf 

sudo a2ensite desktop.loadbalance.local.conf
sudo a2ensite mobile.loadbalance.local.conf
sudo a2ensite loadbalance.local.conf

echo "127.0.0.1  desktop.loadbalance.local" | sudo tee -a /etc/hosts
echo "127.0.0.1  mobile.loadbalance.local" | sudo tee -a /etc/hosts
echo "127.0.0.1  loadbalance.local" | sudo tee -a /etc/hosts

sudo systemctl restart apache2