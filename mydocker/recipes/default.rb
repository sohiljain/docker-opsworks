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

cookbook_file 'script.sh' do
  source 'script.sh'
  mode '0777'
  action :create
end

# Run container exposing ports
docker_container 'my_image' do
  repo 'image_1'
  tag 'v0.1.0'
  port '80:80'
  env 'unm=#{node[:unm]}'
  env 'pcode=#{node[:pcode]}'
end
