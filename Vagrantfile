VM_IP = '10.10.0.80'
VM_NAME = 'dev.local'
VM_RAM = 2048
SYNC_TYPE = 'nfs'
SSH_PORT = 10080

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = VM_NAME
    config.vm.synced_folder "../", "/home/vagrant/server", type: SYNC_TYPE, create: true
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid
    config.vm.network :private_network, ip: VM_IP
    config.vm.network :forwarded_port, guest: 22, host: SSH_PORT, id: 'ssh'

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
        puppet.manifest_file = 'init.pp'
    end

    config.vm.provider :virtualbox do |vb|
        vb.name = VM_NAME
        vb.customize([
            "modifyvm", :id,
            "--memory", VM_RAM,
            "--cpus", 1,
            "--vram", 32
        ])
    end

end
