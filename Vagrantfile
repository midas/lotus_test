# Commands required to setup working docker enviro, link
# containers etc.
$setup = <<SCRIPT
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y postgresql-client-9.3 python-pip
#sudo pip install -U fig

# Stop and remove any existing containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Build/pull containers
docker pull kamui/postgresql
docker build -t lotustest_app /app

# Run and link the containers
docker run -d --name lotustest_db_1 -p 5432:5432 -e POSTGRESQL_USER=lotus_test -e POSTGRESQL_PASS=lotus_test -e POSTGRESQL_DB=lotus_test kamui/postgresql
docker run -d -p 2300:2300 -v /app:/app --link lotustest_db_1:db --name lotustest_app_1 lotustest_app:latest
SCRIPT

# Commands required to ensure correct docker containers
# are started when the vm is rebooted.
$start = <<SCRIPT
docker start lotustest_db_1
docker start lotustest_app_1
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure( VAGRANTFILE_API_VERSION ) do |config|

  # Setup resource requirements
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
    #v.memory = 2048
    #v.cpus = 2
  end

  config.vm.define "lotus_test"

  config.vm.hostname = "lotus-test.local"

  config.vm.network "private_network", ip: "192.168.1.100"

  # Docker host port
  config.vm.network "forwarded_port", guest: 2375, host: 2375
  # Lotus Server Port Forwarding
  config.vm.network "forwarded_port", guest: 2300, host: 2300
  # Postgresql DB Server
  config.vm.network "forwarded_port", guest: 5432, host: 5432

  # Ubuntu
  config.vm.box = "phusion/ubuntu-14.04-amd64"
  #config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-12.04-amd64-vmwarefusion.box"

  # Install latest docker
  config.vm.provision "docker"

  # Must use NFS for this otherwise rails
  # performance will be awful
  config.vm.synced_folder ".", "/app", type: "nfs"

  # Setup the containers when the VM is first created
  config.vm.provision "shell", inline: $setup

  # Make sure the correct containers are running
  # every time we start the VM.
  config.vm.provision "shell", run: "always", inline: $start
end
