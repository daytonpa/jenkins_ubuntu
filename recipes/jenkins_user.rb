
# Create the Jenkins user
user node['jenkins_ubuntu']['user'] do
    home node['jenkins_ubuntu']['home']
    system node['jenkins_ubuntu']['use_system_accounts']
end

# Create the Jenkins group
group node['jenkins_ubuntu']['group'] do
    members node['jenkins_ubuntu']['user']
    system node['jenkins_ubuntu']['use_system_accounts']
end

# Create the Jenkins log directory
directory node['jenkins_ubuntu']['logs'] do
    owner node['jenkins_ubuntu']['user']
    group node['jenkins_ubuntu']['group']
    mode '0755'
    recursive true
end
