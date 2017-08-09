VM_IP = '10.10.0.80'
VM_NAME = 'dev.local'
VM_RAM = 2048
SYNC_TYPE = 'nfs'
SSH_PORT = 10080

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    #config.vm.box_version = "1.0.1"
    config.vm.hostname = VM_NAME
    config.vm.synced_folder "../", "/home/ubuntu/server", type: SYNC_TYPE, create: true
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid
    config.vm.network :private_network, ip: VM_IP
    config.vm.network :forwarded_port, guest: 22, host: SSH_PORT, id: 'ssh'

    config.vm.provision "ansible_local" do |ans|
        ans.playbook = "playbook.yml"
        ans.install_mode = "pip_args_only"
        ans.pip_args = "-r requirements.txt"
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
