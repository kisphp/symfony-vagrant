class php {

  exec { 'add-ppa-repo':
    command => 'sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php',
    path => '/usr/bin',
    require => Exec['apt-get-update'],
  }
  exec { 'local-apt-update':
    command => 'sudo apt-get update',
    path => '/usr/bin',
    require => Exec['add-ppa-repo'],
  }

  package { ['php5.6', 'php5-fpm', 'php5-gd', 'php5-mysql', 'php5-cli', 'php-pear', 'php5-intl', 'php5-mcrypt', 'mcrypt', 'php5-imagick', 'imagemagick',
    'php5-curl', 'php5-dev', 'php5-memcache', 'php5-memcached', 'php5-sqlite', 'memcached', 'phpunit']:
    ensure => present,
    require => Exec['local-apt-update'],
  }

  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }
}
