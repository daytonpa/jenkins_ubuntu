#
# Cookbook Name:: jenkins_ubuntu
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# This recipe is a run-list

%w( apt java sysctl ).each do |recipe|
    include_recipe recipe
end

# Disable all IPv6 connections 
sysctl_param 'net.ipv6.conf.all.disable_ipv6' do
	value 1
end

%w( jenkins_user jenkins_install ).each do |recipe|
    include_recipe "jenkins_ubuntu::#{recipe}"
end
