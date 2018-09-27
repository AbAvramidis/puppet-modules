class mysql {

    file { '/mysql':
	ensure => 'directory',
	source => 'puppet:///modules/mysql',
	recurse => 'remote',
	notify => Exec['mysql_install']
    }

    exec { 'add_permissions':
	command => "/bin/bash -c 'chmod -R +x /mysql/'",
    }

    exec { 'mysql_install':
	command => "/bin/bash -c '/mysql/mysql_install.sh'"
    }

    exec { 'setup_db':
	command => "/bin/bash -c '/mysql/setup.sh'",
    }
}

