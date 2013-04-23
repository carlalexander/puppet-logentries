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
  service { "logentries":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}