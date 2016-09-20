# # encoding: utf-8

# Inspec test for recipe jenkins_ubuntu::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

# User and Group
describe user('jenkins') do
    it { should exist }
    its('group') { should eq 'jenkins' }
    its('home') { should eq '/var/lib/jenkins'}
end
describe group('jenkins') do
    it { should exist }
end

# Directories
# - Jenkins home
describe directory('/var/lib/jenkins') do
    it { should exist }
    its('owner') { should cmp 'jenkins' }
    its('mode') { should cmp 0755 }
end
# - Jenkins log
describe directory('/var/log/jenkins') do
    it { should exist }
    its('owner') { should cmp 'jenkins' }
    its('mode') { should cmp 0775 }
end

## IPAddress ##
describe port(8080) do
  it { should be_listening }
  its('processes') { should include 'java' }
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
end

## Packages ##
describe package('java') do
    it { should be_installed }
end
describe package('jenkins') do
    it { should be_installed }
end

# Jenkins configuration file
describe file('/var/lib/jenkins/config.xml') do
    it { should exist }
end

## Services ##
describe service('jenkins') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
end
