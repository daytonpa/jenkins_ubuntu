default['jenkins_ubuntu'].tap do |jenkins|

    # User
    jenkins['user'] = 'jenkins'
    # Group
    jenkins['group'] = 'jenkins'

    # Directories:
    # - Jenkins Home
    jenkins['home'] = '/var/lib/jenkins'
    # - Jenkins Logs
    jenkins['logs'] = '/var/log/jenkins'
    # - Java Home
    jenkins['java'] = jenkins['home']


    jenkins['use_system_accounts'] = true

    # Jenkins Repo:
    # - Defaut Jenkins version:  default 'debian-stable'
    jenkins['version'] = 'debian-stable'
    # - Jenkins url
    jenkins['url'] = 'http://pkg.jenkins-ci.org/'
    # - Jenkins repository download location
    jenkins['repo_url_endpoint'] = "#{jenkins['url']}#{jenkins['version']}"
    # - Jenkins repository key
    jenkins['repo_key'] = "#{jenkins['url']}#{jenkins['version']}/jenkins-ci.org.key"

    # Configuration attributes:
    # - Arguments to pass to Java
    jenkins['java_args'] = nil
    # - Jenkins default listening address  ('127.0.0.1')
    jenkins['listen_address'] = '0.0.0.0'
    # - Jenkins default listening port  ('8080')
    jenkins['listen_port'] = '8080'

end

# Java attributes
default['java']['jdk_version'] = '7'
