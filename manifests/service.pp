# Class: logentries:service
#
# This module manages the Logentries log management service
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
class logentries::service {
  # Service package depends on the config
  package { 'logentries-daemon':
    ensure => latest,
    notify => Service['logentries'],
  }

  service { "logentries":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}