# Class: logentries
#
# This module manages Logentries log management.
#
# Parameters:
#
#   [*account_key*] - Logentries account key
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include logentries
# }
class logentries (
  $account_key = undef
) {
  class { 'logentries::package':
    notify => Class['logentries::service'],
  }

  class { 'logentries::config':
    account_key => $account_key,
    require     => Class['logentries::package'],
    notify      => Class['logentries::service'],
  }

  class { 'logentries::service': }
}