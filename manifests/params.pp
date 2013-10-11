class rsyslog::params () {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $rsyslog_service_name   = 'rsyslog'
      $rsyslog_package_name   = 'rsyslog'
      $rsyslog_config_name    = '/etc/rsyslog.conf'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}

