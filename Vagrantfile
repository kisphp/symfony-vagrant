VM_IP = '10.10.0.80'
SYNC_TYPE = 'nfs'

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "dev.local"
    config.vm.network :private_network, ip: VM_IP
    config.vm.synced_folder "../", "/home/vagrant/server", type: SYNC_TYPE, create: true
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
        puppet.manifest_file = 'init.pp'
    end

    config.vm.provider :virtualbox do |vb|
        vb.name = "DEV local"
        vb.customize([
            "modifyvm", :id,
            "--memory", 1024,
            "--cpus", 1,
            "--vram", 32
        ])
    end

end
