#
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
docker_service 'default' do
  action [:create, :start]
end

cookbook_file 'Dockerfile' do
  source 'Dockerfile'
  mode '0777'
  action :create
end

docker_image 'image_1' do
	tag 'v0.1.0'
	source 'Dockerfile'
	action :build
end

#docker run -p 8080:8080 ankitkariryaa/sbt-javac

# Run container exposing ports
docker_container 'my_image' do
  repo 'image_1'
  tag 'v0.1.0'
  port '80:80'
end
