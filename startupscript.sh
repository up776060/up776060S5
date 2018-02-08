#!/bin/bash

#Install Required Dependencies
echo "Installing required dependencies...";
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash;
sudo apt-get install -y nodejs;
sudo apt-get install -y git;
echo "Dependencies installed!"
#Install Client Software

git clone https://github.com/portsoc/clocoss-master-worker;
cd clocoss-master-worker;
npm install;

#Initialise Server Parameters
secretkey=`curl -s -H "Metadata-Flavor: Google"  \
              "http://metadata.google.internal/computeMetadata/v1/instance/attributes/secret"`;
serverip=`curl -s -H "Metadata-Flavor: Google"  \
               "http://metadata.google.internal/computeMetadata/v1/instance/attributes/ip"`;

#Run client 
npm run client $secretkey $serverip:8080;

