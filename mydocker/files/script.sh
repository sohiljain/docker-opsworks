#!/bin/bash

cd /root/
git clone https://$unm:$pcode@github.com/honest/boson-demo.git
cd boson-demo/
git checkout develop

cd firstdemo/blockingEndPoint
sbt clean
sbt reload
sbt assembly

#cd resources
#echo 'password' | sudo -S ./env.init.sh

#java -jar /root/boson-demo/firstdemo/blockingEndPoint/target/scala-2.11/boson-http-log-appdata-assembly-2.0.0-SNAPSHOT-REALTIME-ElasticSearch.jar
