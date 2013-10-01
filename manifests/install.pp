class rsyslog::install () {
  package { $rsyslog::params::rsyslog_package_name:
    ensure => installed,
  }
}
