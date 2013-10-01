class rsyslog::server(
  $allowed_customers,
  $port    = '10514',
) {
  validate_string($port)

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['rsyslog'],
  }

  file { '/etc/rsyslog.conf':
    content => template('rsyslog/server.conf.erb'),
  }

  file { '/etc/iptables.d/21-rsyslog.rules.ipv4':
    content => template('rsyslog/iptable.conf.erb'),
    notify  => Service['alkivi-iptables'],
    require => Class['alkivi_base'],
  }
}
