Vagrant.configure("2") do|config|
    config.vm.define "vbox" do|vbox|
        vbox.vm.provider "virtualbox" do|vbox_provider|
            vbox_provider.cpus = 2
            vbox_provider.memory = 8144
            vbox_provider.name = "learnkubernetes"
        end
        vbox.vm.box = "ubuntu/jammy64"
        vbox.vm.disk :disk, size: "40GB", primary: true
        vbox.vm.network "public_network", ip:"192.168.50.51", mode:"bridge"
        vbox.vm.hostname = "learnkubernetes"
        vbox.vm.provision "file", source: "reference/kind_cluster.yaml", destination: "kind_cluster.yaml"
        #vbox.vm.provision "file", source: "reference/basic_nginx_pod.yaml", destination: "basic_nginx_pod.yaml"
        #vbox.vm.provision "file", source: "/deploy_nginx.yaml", destination: "deploy_nginx.yaml"
        vbox.vm.provision "docker-shell", type:"shell", path:"userdata/install-docker.sh"
    end
    # this works!
    # config.vm.define "winbox" do|winbox|
    #     winbox.vm.box = "StefanScherer/windows_11"
    #     winbox.vm.box_version = "2021.12.09"
    # end        
end

