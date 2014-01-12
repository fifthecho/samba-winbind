#
# Cookbook Name:: winbind
# Attributes:: default
#
# Copyright (C) 2014 Jeff Moody
# 
# All rights reserved - Do Not Redistribute
#

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


set["winbind"]["packages"] = packages
set["samba"]["security"] = "ads"
set["samba"]["config"] = "/etc/samba/smb.conf"

case node['platform_family']
when "arch"
    set["samba"]["log_dir"] = "/var/log/samba/log.%m"
when "rhel"
    set["samba"]["log_dir"] = "/var/log/samba/log.%m"
else
    set["samba"]["log_dir"] = "/var/log/samba/%m.log"
end