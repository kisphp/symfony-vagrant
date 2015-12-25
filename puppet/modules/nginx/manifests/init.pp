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
    ensure => absend,
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
    onlyif => '/usr/bin/test ! -d /home/vagrant/server/web',
  }

  file { '/home/vagrant/server/web/':
    ensure => 'directory',
    require => Exec['check-web-directory-existance'],
  }

  exec { 'check-app-dev':
    command => '/bin/true',
    onlyif => '/usr/bin/test ! -f /home/vagrant/server/web/index.php '
  }

  file { 'dummy-index-php-file':
    path => '/home/vagrant/server/web/index.php',
    source => 'puppet:///modules/nginx/index.php',
    ensure => file,
    require => Exec['check-app-dev'],
  }

#  exec { 'write-index':
#    command => "echo 'It works' > /home/vagrant/server/web/index.php",
#    require => Exec['check-app-dev'],
#  }
}
