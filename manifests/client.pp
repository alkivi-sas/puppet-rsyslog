class rsyslog::client(
  $hostname,
  $forwarders,
) {
  validate_string($hostname)
  validate_array($forwarders)

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['rsyslog'],
  }

  file { '/etc/rsyslog.conf':
    content => template('rsyslog/client.conf.erb'),
  }
}
