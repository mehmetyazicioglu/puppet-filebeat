class filebeat::service {

  service { $::filebeat::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    
  }
}

