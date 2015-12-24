exec { 'apt-get-update':
    command => 'apt-get update && apt-get upgrade'
    path => '/usr/bin',
}

package { ['curl', 'tree', 'mc', 'make', 'wget', 'htop', 'build-essential', 'python']:
    ensure => present,
    require => Exec['apt-get-update'],
}

file { '/home/vagrant/server/':
    ensure => 'directory',
    require => Exec['apt-get-update'],
}

include vim, nginx, php, mysql, nodejs, composer, git
