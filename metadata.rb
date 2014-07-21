name             'singularity'
maintainer       'Tom Petr'
maintainer_email 'tpetr@hubspot.com'
license          'All rights reserved'
description      'Installs Singularity dependencies (mesos, zk, mysql)'
version          '0.1.1'
supports         'ubuntu'

depends 'apt'
depends 'mysql'
depends 'mesos'
depends 'database'