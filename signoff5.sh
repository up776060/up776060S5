#!/bin/bash

N=$1;
echo "Dependencies will begin installing."

#Install Required Dependencies
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash;
sudo apt-get -y install nodejs;

echo "Node has been installed."

sudo apt-get install git;
echo "Git has been installed."

#Install Client Software

echo "Cloning and installing client software."

git clone https://github.com/portsoc/clocoss-master-worker;
cd clocoss-master-worker;
npm install;

echo "Client software has been installed."

echo "Creating secret key";
secretkey=`openssl rand -base64 32`;
echo $secretkey;

workerName="up776060worker";

echo "This script will create $N workers.";

gcloud config set compute/zone europe-west1-c;

serverip=`curl -s -H "Metadata-Flavor: Google" \
                                               "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip"` \

echo "Worker VM production will now begin.";

for i in `seq 1 $N`;
do
    gcloud compute instances create "$workerName$i"\
    --machine-type n1-standard-1 \
    --tags http-server,https-server \
    --metadata secret=$secretkey,ip=$serverip \
    --metadata-from-file \
      startup-script=../startupscript.sh \
    --preemptible
done;

echo "Server is running.";
npm run server $secretkey;

echo "Removing Server.";
cd ..;
sudo rm clocoss-master-worker -r;

echo "Removing Worker VMs."
for i in `seq 1 $N`;
do
    gcloud compute instances delete "$workerName$i" --quiet;
done;

echo "Job completed. Script by up776060";
