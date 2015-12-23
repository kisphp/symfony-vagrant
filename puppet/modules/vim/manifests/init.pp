class vim {

  package { ['vim']:
    ensure => 'present',
    require => Exec['apt-get update'],
  }

  file { 'vim-config':
    path => '/etc/vim/vimrc',
    source => 'puppet:///modules/vim/vimrc',
    ensure => file,
    require => Package['vim'],
  }
}
