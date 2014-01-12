#
# Cookbook Name:: winbind
# Recipe:: client
#
# Copyright (C) 2014 Jeff Moody
# 
# All rights reserved - Do Not Redistribute
#
#include 'apt'

packages = ["samba-common"]
case node['platform_family']
when 'rhel'
  packages.push("samba-winbind", "samba-client", "samba-winbind-clients")
when 'debian'
  packages.push("samba-common-bin", "samba-libs", "winbind", "libpam-winbind")
end

case node['platform']
  when 'debian'
    if node['platform_version'] >= "7"
     packages.push("libnss-winbind")
  end
end

packages.each do |pkg|
	package pkg do
		action :install
	end
end

template node["winbind"]["config"] do
  source "smb.conf.erb"
  owner "root"
  group "root"
  mode 00644
end