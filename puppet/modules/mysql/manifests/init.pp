class mysql {

  $user = 'developer'
  $password = 'develop123'
  $database_name = 'development'

  package { ['mysql-server-5.6']:
    ensure => present,
    require => Exec['apt-get-update'],
  }

  service { 'mysql':
    ensure => running,
    require => Package['mysql-server-5.6'],
  }

  file { '/etc/mysql/my.cnf':
    source => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server-5.6'],
    notify => Service['mysql'],
  }

  # password = root
  exec { 'set-mysql-password':
    unless => 'mysqladmin -uroot -proot status',
    command => "mysqladmin -uroot password root",
    path => ['/bin', '/usr/bin'],
    require => Service['mysql'],
  }

  exec { "create-db":
    unless => "/usr/bin/mysql -uroot -proot -D $database_name",
    command => "/usr/bin/mysql -uroot -proot -e \"CREATE DATABASE IF NOT EXISTS $database_name;\"",
    require => Exec["set-mysql-password"],
  }

  exec { "create-user":
    command => "/usr/bin/mysql -uroot -proot -e \"CREATE USER '$user'@'%' IDENTIFIED BY '$password';\"",
    require => [
      Service["mysql"],
      Exec["create-db"],
    ]
  }

  exec { "grant-db":
    command => "/usr/bin/mysql -uroot -proot -e \"GRANT ALL PRIVILEGES ON *.* TO '$user'@'%' WITH GRANT OPTION;\"",
    require => [
      Service["mysql"],
      Exec["create-user"],
    ]
  }
}
