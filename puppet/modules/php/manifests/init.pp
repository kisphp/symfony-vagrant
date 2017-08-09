class php {

  package { ['php70-fpm', 'php70-gd', 'php70-mysql', 'php70-cli', 'php-pear', 'php70-intl', 'php70-mcrypt', 'mcrypt', 'php70-imagick', 'imagemagick',
    'php70-curl', 'php70-dev', 'php70-memcache', 'php70-memcached', 'php70-sqlite', 'memcached', 'phpunit']:
    ensure => present,
    require => Exec['apt-get-update'],
  }

  service { 'php70-fpm':
    ensure => running,
    require => Package['php70-fpm'],
  }
}
