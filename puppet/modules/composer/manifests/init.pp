class composer {

  exec { 'download-composer':
    command => "curl -sS https://getcomposer.org/installer | php",
    path => ['/bin', '/usr/bin'],
    require => [
      Package['curl'],
      Package['php5-cli'],
    ]
  }

  exec { 'install-composer':
    command => "mv composer.phar /usr/local/bin/composer",
    path => ['/bin', '/usr/bin'],
    require => Exec['download-composer'],
  }
}