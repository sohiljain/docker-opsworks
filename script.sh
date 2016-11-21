#!/bin/bash

#install sudo
apt-get install sudo

#create log file
sudo mkdir -p /var/log/app-boson-log
chown `whoami` /var/log/app-boson-log/

#Env settings
pcode=696f180f22d0dbccc2b6b2f6642e2c93e2833159

#Git checkout
cd /home/
git clone https://sohiljain:$pcode@github.com/honest/boson.git
cd boson/
git checkout develop

#Build the project
cd dataPipeline
sbt clean
sbt reload
sbt 'project metadataLog' assembly

#Execute the service
java -jar dataPipeline/metaData-Logging/target/scala-2.10/boson-http-log-metadata-assembly-1.5.0-search-logging.jar >> nohup.out &
