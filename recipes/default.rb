#
# Cookbook Name:: winbind
# Recipe:: default
#
# Copyright (C) 2014 Jeff Moody
# 
# All rights reserved - Do Not Redistribute
#

# include_attribute "winbind::default"
# case node['platform_family']
# when 'rhel'
#   default['winbind']['package'] = ["samba-winbind", "samba-common", "samba-client", "samba-winbind-clients"]
# when 'debian'
#   default['winbind']['package'] = ["samba-common", "samba-common-bin", "samba-libs", "winbind", "libpam-winbind", "libnss-winbind"]
# end
include_recipe "winbind::client"