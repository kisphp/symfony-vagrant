VM_IP = '10.10.0.80'
VM_NAME = 'dev.local'
VM_RAM = 2048
SYNC_TYPE = 'nfs'
SSH_PORT = 10080

require_relative File.join(File.dirname(__FILE__), 'ini_file_generator.rb')

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.hostname = VM_NAME
    config.vm.synced_folder "../", "/home/server", type: SYNC_TYPE, create: true
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid
    config.vm.network :private_network, ip: VM_IP
    config.vm.network :forwarded_port, guest: 22, host: SSH_PORT, id: 'ssh'

    config.vbguest.auto_update = false

    #config.ssh.insert_key = true
    config.ssh.username = 'vagrant'

    gen = IniFileGenerator.new(VM_IP)
    gen.generate_ini_file
    gen.copy_dist_file("config.dist.yml", "config.yml")

    # upload ssh id_rsa file
    config.vm.provision :file do |file|
      file.source = "~/.ssh/id_rsa"
      file.destination = "~/.ssh/id_rsa"
    end

    # upload ssh id_rsa.pub file
    config.vm.provision :file do |file|
      file.source = "~/.ssh/id_rsa.pub"
      file.destination = "~/.ssh/id_rsa.pub"
    end

    config.vm.provision "ansible_local" do |ans|
        ans.playbook = "setup-vagrant.yml"
        ans.compatibility_mode = "2.0"
        ans.install_mode = "pip_args_only"
        ans.pip_args = "-r /vagrant/requirements.txt"
    end

    config.vm.provider :virtualbox do |vb|
        #vb.name = VM_NAME
        vb.customize([
            "modifyvm", :id,
            "--memory", VM_RAM,
            "--cpus", 1,
            "--vram", 32
        ])
    end

end
