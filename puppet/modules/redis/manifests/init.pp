class redis {

  package { ['redis-server', 'redis-tools', 'php7-redis']:
    ensure => present,
    require => [
      Package['php5-fpm'],
      Exec['apt-get-update'],
    ]
  }
}
