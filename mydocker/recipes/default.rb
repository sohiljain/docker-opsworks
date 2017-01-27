#
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'aws'

aws_s3_file "/home/sohil" do
  bucket "data-science-honest"
  remote_path "logging"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end

docker_service 'default' do
  action [:create, :start]
end

docker_image 'image_1' do
  tag 'latest'
  source '/home/sohil/docker-sbt-sample/'
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
  port '8080:8080'
  action :run
  env 'unm=sohil'
#   env 'unm=#{node[:unm]}'
  env 'pcode=#{node[:pcode]}'
end
