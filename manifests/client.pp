class rsyslog::client(
  $hostname,
  $forwarders = [],
) {
  validate_string($hostname)
  validate_array($forwarders)

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat{ $rsyslog::params::rsyslog_config_name:
    owner => 'root',
    group => 'root',
    mode  => '0644',
    notify => Service['rsyslog'],
  }

  concat::fragment{'rsyslog.main':
    target  => $rsyslog::params::rsyslog_config_name,
    content => template('rsyslog/client.conf.erb'),
    order   => 01,
  }
}
