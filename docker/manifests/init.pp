class docker {
    file { '/docker/':
	ensure => 'directory',
	source => 'puppet:///modules/docker/',
	recurse => 'remote',
	notify => Exec['docker_install']
    }

    exec { 'add_permissions':
	command => "/bin/bash -c 'chmod -R +x /docker/'",
    }

    exec { 'docker_install':
	command => "/bin/bash -c '/docker/docker_install.sh'"
    }
}
