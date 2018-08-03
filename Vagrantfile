MY_VAR = ENV['MY_VAR']
Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end
  config.vm.box = "anthshor/centos72"
  config.vm.synced_folder "~/proxy", "/proxy"

  config.vm.define "web1" do |web1|
    web1.vm.network "private_network", ip: "192.168.33.25" 
    web1.vm.network "forwarded_port", guest: 8080, host: 8080
    web1.vm.hostname = "web1"
    web1.vm.provision "shell", path: "provision_web1.sh"
  end
  config.vm.define "web2" do |web2|
    web2.vm.network "private_network", ip: "192.168.33.26" 
    web2.vm.network "forwarded_port", guest: 8080, host: 8081
    web2.vm.hostname = "web2"
    web2.vm.provision "shell", path: "provision_web2.sh"
  end
  config.vm.define "tower" do |tower|
    tower.vm.hostname = "tower"
    tower.vm.network "private_network", ip: "192.168.33.21" 
    tower.vm.provision "shell", path: "provision_tower.sh", args: MY_VAR
  end
end
