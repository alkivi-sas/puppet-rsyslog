class rsyslog::server(
  $allowed_customers,
  $tcp      = true,
  $tcp_port = 10514,
  $udp      = false,
  $udp_port = 514,

) {

  if $tcp and (! is_integer($tcp_port))
  {
    fail('tcp_port should be an integer')
  }

  if $udp and (! is_integer($udp_port))
  {
    fail('udp_port should be an integer')
  }

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['rsyslog'],
  }

  concat{ $rsyslog::params::rsyslog_config_name:
    owner => 'root',
    group => 'root',
    mode  => '0644',
    notify => Service['rsyslog'],
  }

  concat::fragment{'rsyslog.main':
    target  => $rsyslog::params::rsyslog_config_name,
    content => template('rsyslog/server.conf.erb'),
    order   => 01,
  }

  file { '/etc/iptables.d/21-rsyslog.rules.ipv4':
    content => template('rsyslog/iptable.conf.erb'),
    notify  => Service['alkivi-iptables'],
    require => Class['alkivi_base'],
  }
}
