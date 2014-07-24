name             'singularity'
maintainer       'Tom Petr'
maintainer_email 'tpetr@hubspot.com'
license          'All rights reserved'
description      'Installs Singularity dependencies (mesos, zk, mysql)'
version          '0.2.1'
supports         'ubuntu'

depends 'apt'
depends 'mysql'
depends 'database'
depends 'hostsfile'