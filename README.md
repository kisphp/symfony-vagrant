## Requirements

- Mac OS X or Ubuntu Desktop
- Vagrant 1.7.2
- VirtualBox >= 5+

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
cd ../server

# add vagrant repository to ignore list in your project
echo "_vm/" >> .gitignore 

# install dependencies
composer install

```

> Composer will require interaction to build `parameters.yml` file.

## Use multiple VMs

To use multiple VMs please change `VM_IP` and `VM_NAME` in Vagrantfile before running `vagrant up`:

```ruby
VM_IP = '10.10.0.81' # changed ip from 80 -> 81
VM_NAME = 'project.local' # changed vm name to project.local
SSH_PORT = 10081 # you may change the host ssh port
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
- curl - 7.47
- git - 2.7.4
- htop
- mc
- mcrypt
- make
- memcached
- mysql - 5.7
- nginx - 1.10.3
- ohmyzsh
- php - 7.1
  - "php7.1-common"
  - "php7.1-cli"
  - "php7.1-curl"
  - "php7.1-cgi"
  - "php7.1-fpm"
  - "php7.1-gd"
  - "php7.1-intl"
  - "php7.1-json"
  - "php7.1-mysql"
  - "php7.1-mcrypt"
  - "php7.1-mbstring"
  - "php7.1-sqlite3"
  - "php7.1-xml"
  - "php7.1-zip"
  - "php-xdebug"
- python - 2.7.12/3.5.2
- tree
- vim
- wget

## Javascript related packages

- Nodejs - 6.11.2
- npm - 5.4.2
- gulp - 3.9.1
- bower - 1.8.9


## Create swap

> Run as `root`
```
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
```
