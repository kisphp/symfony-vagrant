class nginx {

  package { 'nginx':
    ensure => 'present',
    require => Exec['apt-get-update'],
  }

  service { 'nginx':
    ensure => running,
    require => Package['nginx'],
  }

  file { 'vagrant-nginx':
    path => '/etc/nginx/sites-available/dev.local',
    ensure => file,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/dev.local',
  }

  file { 'default-nginx-disable':
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    require => Package['nginx'],
  }

  file { 'vagrant-nginx-enable':
    path => '/etc/nginx/sites-enabled/dev.local',
    target  => '/etc/nginx/sites-available/dev.local',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx'],
      File['default-nginx-disable'],
    ],
  }

  exec { 'check-web-directory-existance':
    command => '/bin/true',
    onlyif => '/usr/bin/test ! -d /home/ubuntu/server/web',
  }

  file { '/home/ubuntu/server/web/':
    ensure => 'directory',
    require => Exec['check-web-directory-existance'],
  }
}
