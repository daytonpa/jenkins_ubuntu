
# Download the Jenkins repository
apt_repository 'jenkins' do
    uri node['jenkins_ubuntu']['repo_url_endpoint']
    distribution 'binary/'
    key node['jenkins_ubuntu']['repo_key']

    action :add
end

# Install Jenkins
apt_package 'jenkins' do
    action :install
    notifies :start, 'service[jenkins]', :immediately
end

# Reset Jenkins home directory permissions
directory node['jenkins_ubuntu']['home'] do
    owner node['jenkins_ubuntu']['user']
    group node['jenkins_ubuntu']['group']
    mode '0755'
    recursive true
end

# template '/etc/default/jenkins' do
#     source 'jenkins_ubuntu-config.erb'
#     mode '0644'
#     notifies :restart, 'service[jenkins]', :immediately
# end

service 'jenkins' do
    supports status: true, restart: true, reload: true
    action [:start, :enable]
end
