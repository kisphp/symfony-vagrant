exec { 'apt-get update':
    path => '/usr/bin',
}

package { ['curl', 'tree', 'mc', 'make', 'wget', 'htop', 'build-essential', 'python']:
    ensure => present,
}

file { '/home/vagrant/server/':
    ensure => 'directory',
}

include vim, nginx, php, mysql, nodejs, composer, git
