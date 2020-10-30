## Requirements

- Mac OS X or Ubuntu Desktop
- Vagrant 2.2.0+
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
composer install --no-interaction

```

## Control ansible setup

You can list all ansible TASKS
```bash
./run-ansible.sh --list-tasks
```

You can list all ansible TAGS
```bash
./run-ansible.sh --list-tags
```

You can run individual tags. For example if you add a new mysql user just run
```bash
./run-ansible.sh --tags mysql-users
```

If you update php settings run:
```bash
./run-ansible.sh --tags php
```

You also can run multiple tags at once
```bash
./run-ansible.sh --tags php,xdebug
```


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
- curl - 7.68
- git - 2.25.1
- htop
- mc
- mcrypt
- make
- memcached
- mysql - 8.0.22
- nginx - 1.18.0
- ohmyzsh
- php - 7.4
  - "php7.4-common"
  - "php7.4-cli"
  - "php7.4-curl"
  - "php7.4-cgi"
  - "php7.4-fpm"
  - "php7.4-gd"
  - "php7.4-intl"
  - "php7.4-json"
  - "php7.4-mysql"
  - "php7.4-mcrypt"
  - "php7.4-mbstring"
  - "php7.4-sqlite3"
  - "php7.4-xml"
  - "php7.4-zip"
  - "php-xdebug"
- python - 3.8.2
- tree
- vim
- wget

## Javascript related packages

- Nodejs - 14.15.0
- npm - 6.14.8
- gulp - 2.3.0


## Create swap

> Run as `root`
```
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
```
