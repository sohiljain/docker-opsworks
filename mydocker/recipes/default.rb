#
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
docker_service 'default' do
  action [:create, :start]
end

docker_image 'image_1' do
  tag 'latest'
  source '/Dockerfile'
  action :build
end

# docker_image 'ankitkariryaa/sbt-javac' do
#   tag 'latest'
#   action :pull
# end

# cookbook_file 'Dockerfile' do
#   source 'Dockerfile'
#   mode '0777'
#   action :create
# end

# cookbook_file 'script.sh' do
#   source 'script.sh'
#   mode '0777'
#   action :create
# end

# Run container exposing ports
docker_container 'my_image' do
  repo 'image_1'
  tag 'latest'
  port '80:80'
  action :run
  env 'unm=#{node[:unm]}'
  env 'pcode=#{node[:pcode]}'
end
