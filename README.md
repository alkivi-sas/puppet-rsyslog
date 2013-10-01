# Rsyslog Module

This module will install and configure a rsyslog server.

## Usage

### Minimal configuration

```puppet
class { 'rsyslog': }
```
This will do the typical install, configure and service management.


### Add forwarder configuration

```puppet
class { 'rsyslog::client': 
 hostname   => 'toto.alkivi.fr',
 forwarders => [ { host => 'syslog.alkivi.fr', port => '10514', protocol => 'tcp' } ],
}
```

### General server
```puppet
class { 'rsyslog::server':
  allowed_customers => ['127.0.0.1'] ,
}
```

allowed_customers will create iptables rules accordingly using 'alkivi-iptables'


## Limitations

* This module has been tested on Debian Wheezy, Squeeze.

## License

All the code is freely distributable under the terms of the LGPLv3 license.

## Contact

Need help ? contact@alkivi.fr

## Support

Please log tickets and issues at our [Github](https://github.com/alkivi-sas/)
