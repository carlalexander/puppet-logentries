# Class: logentries::config
#
# This module manages Logentries module configuration
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
class logentries::config (
  $account_key = undef
) {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  if ($account_key == undef) {
    fail('You must specify an account key')
  }

  exec { 'le-register':
    command     => "le register --account-key=${account_key}",
    creates     => "/etc/le/config"
  }
}