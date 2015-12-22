class nodejs {

  package { ['nodejs', 'npm']:
    ensure => 'present',
    require => Exec['apt-get update'],
  }

  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package["nodejs"],
  }

  exec { 'upgrade-node-js':
    command => "/usr/bin/npm cache clean -f && /usr/bin/npm install -g n && n stable",
    require => Package['npm'],
  }

  exec { 'install-bower':
    command => "/usr/bin/npm install -g bower",
    require => Exec['upgrade-node-js'],
  }

  exec { 'install-gulp':
    command => "/usr/bin/npm install -g gulp",
    require => Exec['upgrade-node-js'],
  }
}