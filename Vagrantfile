# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.env.enable
    config.vm.define "server" do |machine|
      machine.vm.network "private_network", ip: "10.2.2.25"
      machine.vm.box = "bento/ubuntu-20.04"
      #machine.vm.provision :ansible do |ansible|
      #  ansible.playbook = ENV["PLAYBOOK_NAME"]
      #  ansible.verbose = 'vv'
      #end
    end
  end