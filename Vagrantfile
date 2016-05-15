# 
# Vagrantfile per il 1 progetto, che prevede:
# - un nodo (application) server 
# - un nodo database 
# 

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Configurazioni comuni.
    # Ubuntu trusty 64 VirtualBox.
    config.vm.box = "ubuntu/trusty64"

    #
    # Configurazione del nodo database: 
    #
    config.vm.define "db" do |node|
        node.vm.hostname = "db"    
        node.vm.network "private_network", ip: "10.11.1.102", virtualbox__intnet: true
        
        node.vm.provider "virtualbox" do |v| 
            v.memory = 512 
        end 
        
        # cartella condivisa contenente il database iniziale
        node.vm.synced_folder "filedb/", "/home/vagrant/filedb", :mount_options => ["dmode=777", "fmode=777"]


        node.vm.network "forwarded_port", guest: 22, host: 2210, id: 'ssh', auto_correct: true
        node.ssh.forward_agent = true

        node.vm.network "forwarded_port", guest: 5432, host: 15432

        # provisioning con bash e puppet
        node.vm.provision :shell, :inline => 'sudo apt-get update'

        node.vm.provision :shell, :inline => 'puppet module install puppetlabs-postgresql'
        node.vm.provision "puppet" do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file = "inizializedb.pp"
        end
        
        # importa un database iniziale in postgres
        node.vm.provision :shell, :inline => 'echo postgres| sudo -S pg_restore -i -h localhost -p 5432 -U postgres -d model -v "/home/vagrant/filedb/database.backup"'
        node.vm.provision :shell, :inline => 'echo  "configurazione database completata"'

    end

    #
    # Configurazione del nodo server: 
    #
    config.vm.define "server" do |node|
        node.vm.hostname = "server"    
        node.vm.network "private_network", ip: "10.11.1.101", virtualbox__intnet: true

        node.vm.provider "virtualbox" do |v| 
            v.memory = 512 
        end 
        
        # cartella condivisa contenente il necessario per installare java
        node.vm.synced_folder "shared/", "/home/vagrant/shared", :mount_options => ["dmode=777", "fmode=777"]


        node.vm.network "forwarded_port", guest: 22, host: 2212, id: 'ssh', auto_correct: true
        node.ssh.forward_agent = true
        
        node.vm.network :forwarded_port, guest: 8080, host: 5678
        
        # provisioning con bash 
        node.vm.provision :shell, :inline => 'apt-get update'

        node.vm.provision "file", source:"tomee/", destination:"/home/vagrant/tomee"
        node.vm.provision :shell, :inline => 'sudo chmod 755 -R tomee'

        node.vm.provision :shell, path: "shared/scripts/setup-java.sh"
        
        node.vm.provision :shell, inline: "echo  'configurazione nodo server completata'"
        node.vm.provision :shell, :inline => 'bash /home/vagrant/tomee/bin/startup.sh', :run => 'always'

    end

end
