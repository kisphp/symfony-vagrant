class ohmyzsh {

  # Clone oh-my-zsh
  exec { 'clone-oh-my-zsh':
    cwd     => "/home/ubuntu",
    user    => "vagrant",
    path    => ['/bin', '/usr/bin'],
    command => "git clone https://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh",
    creates => "/home/ubuntu/.oh-my-zsh",
    require => [Package['git'], Package['zsh'], Package['curl']]
  }

  # Set configuration
  file { "/home/ubuntu/.zshrc":
    ensure => file,
    owner => "vagrant",
    group => "vagrant",
    replace => false,
    source => "puppet:///modules/ohmyzsh/zshrc",
    require => Exec['clone-oh-my-zsh']
  }

  # Set the shell
  exec { "chsh -s /usr/bin/zsh ubuntu":
    unless  => "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd",
    path    => ['/bin', '/usr/bin'],
    require => Package['zsh']
  }
}
