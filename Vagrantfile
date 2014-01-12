# Base hostname
cookbook = 'winbind'

Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  
  config.vm.define :centos5 do |centos5|
    centos5.vm.box      = 'opscode-centos-5.10'
    centos5.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_centos-5.10_chef-provisionerless.box'
    centos5.vm.hostname = "#{cookbook}-centos-5"
  end

  config.vm.define :centos6 do |centos6|
    centos6.vm.box      = 'opscode-centos-6.5'
    centos6.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_centos-6.5_chef-provisionerless.box'
    centos6.vm.hostname = "#{cookbook}-centos-6"
  end

  config.vm.define :debian7 do |debian7|
    debian7.vm.box      = 'opscode-debian-7.2.0'
    debian7.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_debian-7.2.0_chef-provisionerless.box'
    debian7.vm.hostname = "#{cookbook}-debian-7"
  end

  config.vm.define :debian6 do |debian6|
    debian6.vm.box      = 'opscode-debian-6.0.8'
    debian6.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_debian-6.0.8_chef-provisionerless.box'
    debian6.vm.hostname = "#{cookbook}-debian-6"
  end

  config.vm.define :freebsd9 do |freebsd9|
    freebsd9.vm.box      = 'opscode-freebsd-9.2'
    freebsd9.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_freebsd-9.2_chef-provisionerless.box'
    freebsd9.vm.hostname = "#{cookbook}-freebsd-9"
  end

  config.vm.define :ubuntu1204 do |ubuntu1204|
    ubuntu1204.vm.box      = 'opscode-ubuntu-12.04'
    ubuntu1204.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-12.04_chef-provisionerless.box'
    ubuntu1204.vm.hostname = "#{cookbook}-ubuntu-1204"
  end

  config.vm.define :ubuntu1004 do |ubuntu1004|
    ubuntu1004.vm.box      = 'opscode-ubuntu-10.04'
    ubuntu1004.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-10.04_chef-provisionerless.box'
    ubuntu1004.vm.hostname = "#{cookbook}-ubuntu-1004"
  end

  config.vm.provider "vmware_workstation" do |v|
    v.vmx["memsize"] = 1024
    v.vmx["numvcpus"] = 1
  end

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.add_recipe("apt")
    chef.json = {
      "samba" => {
        "workgroup" => "fifthecho",
        "realm" => "fifthecho.com",
        "directory_server" => "dc1.fifthecho.com"
      }
    }
    chef.run_list = [
      "recipe[apt]",
      "recipe[#{cookbook}]"
    ]
    chef.data_bags_path = "./data_bags/winbind/"
    chef.encrypted_data_bag_secret_key_path = "./data_bags/encrypted_data_bag_secret"
  end
end
