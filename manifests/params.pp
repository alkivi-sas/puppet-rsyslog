class rsyslog::params () {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $rsyslog_service_name   = 'rsyslog'
      $rsyslog_package_name   = 'rsyslog'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}

