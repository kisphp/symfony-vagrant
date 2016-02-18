class redis {

  package { ['redis-server', 'redis-tools', 'php5-redis']:
    ensure => present,
    require => [
      Package['php5-fpm'],
      Exec['apt-get-update'],
    ]
  }
}
