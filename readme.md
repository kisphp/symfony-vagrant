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
- curl - 7.35
- git - 1.9.1
- htop
- imagemagick - 6.7.7-10
- mc
- mcrypt
- make
- memcached
- mysql - 5.6
- nginx - 1.4.6
- ohmyzsh
- php - 5.5.9
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
- python - 2.7.6/3.4.3
- redis - 2.8.4
- tree
- vim
- wget

## Javascript related packages

- Nodejs - 5.11.1
- npm - 3.8.6
- gulp - 3.9.1
- bower - 1.7.9
- webpack - 1.13.0

## Redis

> Redis requires no credentials to login
