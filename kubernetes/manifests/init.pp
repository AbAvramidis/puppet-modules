class kubernetes {
  file { '/kubernetes/':
    ensure => 'directory',
    source => 'puppet:///modules/kubernetes/',
    recurse => 'remote',
    notify => Exec['install_kubernetes']
  }

  exec { 'add_permissions':
    command => "/bin/bash -c 'chmod -R +x /kubernetes/'",
  }

  exec { 'install_kubernetes':
    command => "/bin/bash -c '/kubernetes/install_kubernetes.sh",
  }
}

