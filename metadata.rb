name 'jenkins_ubuntu'
maintainer 'Patrick Dayton'
maintainer_email 'daytonpa@gmail.com'
license 'all_rights'
description 'Installs/Configures jenkins_ubuntu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/jenkins_ubuntu/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/jenkins_ubuntu' if respond_to?(:source_url)

%w( apt java sysctl ).each do |cookbook|
    depends cookbook
end
