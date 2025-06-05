# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update -y
    sudo apt-get upgrade -y

    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common git

    if ! command -v docker &> /dev/null
    then
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable"
      sudo apt-get update -y
      sudo apt-get install -y docker-ce
      sudo usermod -aG docker vagrant
    fi

    if ! command -v docker-compose &> /dev/null
    then
      sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
    fi

    if [ ! -d /home/vagrant/cozymonn ]; then
      git clone https://github.com/NikitaMarakushev/cozymonn.git /home/vagrant/cozymonn
    fi

    cd /home/vagrant/cozymonn

    sudo docker-compose down
    sudo docker-compose up -d
  SHELL

  config.vm.synced_folder "./", "/home/vagrant/cozymonn"
end
