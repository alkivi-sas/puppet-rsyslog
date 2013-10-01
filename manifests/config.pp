class rsyslog::config () {
  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service[$rsyslog::params::rsyslog_service_name],
  }

  # Special file to avoid loggin useless sudo information (zabbix)
  file { '/etc/rsyslog.d/alkivi.conf':
    source => 'puppet:///modules/rsyslog/alkivi.conf'
  }
}
