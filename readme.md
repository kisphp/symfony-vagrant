## Requirements

- Mac OS X or Ubuntu Desktop
- Vagrant 1.7.2
- VirtualBox >= 4.3.30

## Installation

```bash
# download symfony basic project (you may clone your own symfony project)
git clone https://github.com/symfony/symfony-standard.git

# go into project directory
cd symfony-standard

# clone vagrant VM
git clone https://github.com/kisphp/symfony-vagrant.git _vm

# go into vm directory
cd _vm

# create virtual machine
vagrant up

# login inside virtual machine
vagrant ssh

# go to project directory
cd server

# add vagrant repository to ignore list in your project
echo "_vm/" >> .gitignore 

# install dependencies
composer update

```

> Composer will require interaction to build `parameters.yml` file.

## Use multiple VMs

To use multiple VMs please change `VM_IP` and `VM_NAME` in Vagrantfile before running `vagrant up`:

```ruby
VM_IP = '10.10.0.81' # changed ip from 80 -> 81
VM_NAME = 'project.local' # changed vm name to project.local
```

> If you want to host multiple projects on the same VM, please use [Vagrant Multiserver VM](https://github.com/kisphp/vagrant-multiserver)

## Ubuntu host fixes 
```bash
sudo apt-get install nfs-kernel-server
```

### MySQL credentials

```
DATABASE_USERNAME = developer
DATABASE_PASSWORD = develop123
DATABASE_NAME = development
```

## Ubuntu fixes (run before `vagrant up`)
```bash
sudo apt-get install nfs-kernel-server
```


### Installed Packages in VM

- build-essential
- composer
- curl
- git
- htop
- imagemagick
- mc
- mcrypt
- make
- memcached
- mysql
- nginx
- ohmyzsh
- php
    - php5-fpm
    - php5-gd
    - php5-mysql
    - php5-cli
    - php5-dev
    - php-pear
    - php5-mcrypt
    - php5-imagick
    - php5-curl
    - php5-memcache
    - php5-memcached
    - php5-sqlite
- python
- redis
- tree
- vim
- wget

### MySQL credentials

```
DATABASE_USERNAME = developer
DATABASE_PASSWORD = develop123
DATABASE_NAME = development
```

## Redis

> Redis requires no credentials to login
