name             'winbind'
maintainer       'Jeff Moody'
maintainer_email 'fifthecho@gmail.com'
license          'All rights reserved'
description      'Installs/Configures samba-winbind'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "winbind::default", "Includes the winbind::client recipe"
recipe "winbind::client", "Installs Windbind packages and configures system to use Winbind for authentication."

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'

depends 'apt'