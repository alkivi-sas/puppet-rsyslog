class rsyslog::service () {
  service { $rsyslog::params::rsyslog_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }
}

