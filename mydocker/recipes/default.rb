#
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
docker_service 'default' do
  action [:create, :start]
end

docker_image 'image_1' do
	tag 'v0.1.0'
	source '/files/Dockerfile'
	action :build
end
