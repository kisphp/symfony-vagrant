class php {

  package { ['php5-fpm', 'php5-gd', 'php5-mysql', 'php5-cli', 'php-pear', 'php5-intl', 'php5-mcrypt', 'mcrypt', 'php5-imagick', 'imagemagick',
    'php5-curl', 'php5-dev', 'php5-memcache', 'php5-memcached', 'php5-sqlite', 'memcached', 'phpunit']:
    ensure => present,
    require => Exec['apt-get-update'],
  }

  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }
}
