class composer {

  exec { 'download-composer':
    command => "wget https://getcomposer.org/composer.phar && chmod +x composer.phar",
    path => ['/bin', '/usr/bin'],
    require => Package['php5-cli'],
  }

  exec { 'install-composer':
    command => "mv composer.phar /usr/local/bin/composer",
    path => ['/bin', '/usr/bin'],
    require => Exec['download-composer'],
  }
}
