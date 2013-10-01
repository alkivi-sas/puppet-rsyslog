class rsyslog (
  $motd = true,
) {

  if($motd)
  {
    motd::register{'Rsyslog Server': }
  }

  # declare all parameterized classes
  class { 'rsyslog::params': }
  class { 'rsyslog::install': }
  class { 'rsyslog::config': }
  class { 'rsyslog::service': }

  # declare relationships
  Class['rsyslog::params'] ->
  Class['rsyslog::install'] ->
  Class['rsyslog::config'] ->
  Class['rsyslog::service']
}

