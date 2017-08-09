class nodejs {

  exec { "nodejs-prepare":
    command => "/usr/bin/curl -sL https://deb.nodesource.com/setup_6.x | /usr/bin/sudo -E bash -",
    require => Exec['apt-get-update'],
  }

  package { ['nodejs']:
    ensure => 'present',
    require => Exec['nodejs-prepare'],
  }

  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package["nodejs"],
  }

  exec { 'upgrade npm to version 5':
    command => "/usr/bin/npm install npm@latest -g",
    require => Package['nodejs'],
  }

  exec { 'install-gulp':
    command => "/usr/bin/npm install -g gulp",
    require => Package['nodejs'],
  }

  exec { 'install-bower':
    command => "/usr/bin/npm install -g bower",
    require => Package['nodejs'],
  }

  exec { 'install-webpack':
    command => "/usr/bin/npm install -g webpack",
    require => Package['nodejs'],
  }
}
