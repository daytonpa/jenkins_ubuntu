#
# Cookbook Name:: jenkins_ubuntu
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'jenkins_ubuntu::default' do
	# Serverspec examples can be found at
	# http://serverspec.org/resource_types.html

	# Tests for Jenkins Continuous Integration

	## User and Group ##
 	describe group('jenkins') do
  		it { should exist }
  	end

    describe user('jenkins') do
  		it { should exist }
  		it { should belong_to_group 'jenkins' }
  	end


  	## Directories and Repositories ##
    describe file('/var/lib/apt/periodic') do
        it { should exist }
        it { should be_directory }
    end

    # Default repositories directory
  	describe file('/etc/apt/apt.conf.d') do
  		it { should exist }
        it { should be_directory }
        it { should be_mode '755' }
  	end

    # Jenkins logs directory
  	describe file('/var/log/jenkins') do
  		it { should exist }
  		it { should be_directory }
        it { should be_owned_by 'jenkins' }
        it { should be_grouped_into 'jenkins' }
        it { should be_mode '755' }
  	end

    # Jenkins home directory
  	describe file('/var/lib/jenkins') do
  		it { should exist }
  		it { should be_directory }
  		it { should be_owned_by 'jenkins' }
  		it { should be_grouped_into 'jenkins' }
  		it { should be_mode '755' }
  	end

  	## Packages ##
    %w( openjdk-7-jdk jenkins ).each do |pkg|
  	    describe package(pkg) do
  		    it { should be_installed }
  	    end
  	end

  	## Ports ##
  	describe port('8080') do
  		it { should be_listening }
  		it { should be_listening.on('0.0.0.0').with('tcp') }
  	end

  	## Service ##
  	describe service('jenkins') do
  	    it { should be_enabled }
        it { should be_running }
        it { should be_running.under('systemd') }
  	end

end
