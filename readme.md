## Requirements

- Mac OS X or Ubuntu/Debian Linux
- Vagrant 1.7.2
- VirtualBox 4.3.30

## Install

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

Composer will require interaction to build `parameters.yml` file.

### Installed Packages in VM

- curl
- tree
- ohmyzsh
- mc
- make
- wget
- htop
- build-essential
- python
- vim
- nginx
- php
    - php5-fpm
    - php5-gd
    - php5-mysql
    - php5-cli
    - php-pear
    - php5-mcrypt
    - mcrypt
    - php5-imagick
    - imagemagick
    - php5-curl
    - php5-memcache
    - php5-memcached
    - php5-sqlite
    - memcached
- mysql
- composer
- git

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
