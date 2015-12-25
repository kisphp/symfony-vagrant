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
    path => '/etc/nginx/sites-available/project.local',
    ensure => file,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/project.local',
  }

  file { 'default-nginx-disable':
    path => '/etc/nginx/sites-enabled/default',
    ensure => absend,
    require => Package['nginx'],
  }

  file { 'vagrant-nginx-enable':
    path => '/etc/nginx/sites-enabled/project.local',
    target  => '/etc/nginx/sites-available/project.local',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx'],
      File['default-nginx-disable'],
    ],
  }

  exec { 'check-app-dev':
    command => '/bin/true',
    onlyif => '/usr/bin/test [-e /home/vagrant/server/web/app_dev.php && ! -f /home/vagrant/server/web/index.php ]'
  }

  exec { 'write-index':
    command => "/bin/cp /home/vagrant/server/web/app_dev.php /home/vagrant/server/web/index.php",
    require => Exec['check-app-dev'],
  }
}
