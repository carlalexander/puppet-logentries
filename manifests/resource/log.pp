# Define: logentries::resource::log
#
# This defines a log to be monitored by logentries
#
# Parameters:
#   [*filename*] - Filename of the log to be monitored. Default: [$name]
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#  logentries::resource::log { '/var/log/cron.log': }
define logentries::resource::log (
  $filename = $name
) {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  exec { "logentries-follow-${filename}":
    cmd    => "le follow ${filename}",
    unless => "le followed ${filename}",
    notify => Service['logentries']
  }
}