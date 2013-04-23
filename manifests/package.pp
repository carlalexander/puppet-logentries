# Class: logentries::package
#
# This module manages logentries package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class logentries::package {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  exec { 'add-pgp.mit.edu':
    command => 'gpg --keyserver pgp.mit.edu --recv-keys C43C79AD && gpg -a --export C43C79AD | apt-key add -',
    unless  => 'apt-key list | grep -c C43C79AD'
  }

  exec { 'logentries.list':
    command => "echo 'deb http://rep.logentries.com/ quantal main' >> /etc/apt/sources.list.d/logentries.list && apt-get update",
    creates => '/etc/apt/sources.list.d/logentries.list',
    require => Exec['add-pgp.mit.edu']
  }

  package { 'python-setproctitle':
    ensure  => latest,
    require => Exec['add-pgp.mit.edu'],
  }

  package { 'logentries':
    ensure  => latest,
    require => Package['python-setproctitle'],
  }
}