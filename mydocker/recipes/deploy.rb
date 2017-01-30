#Rnuning demo  
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
docker_service 'default' do
  action [:create, :start]
end

docker_image 'image_1' do
  tag 'latest'
  source '/home/sohil/docker-sbt-sample/'
  action :build
end

# Run container exposing ports
docker_container 'my_image' do
  repo 'image_1'
  tag 'latest'
  port '8090:8080'
  action :run
  command 'java -jar /home/boson-http-log-metadata-assembly-1.5.0-search-logging.jar >> nohup.out &'
end
