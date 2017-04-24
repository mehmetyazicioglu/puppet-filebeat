class filebeat::install {
  package { $::filebeat::params::package_name:
    ensure   => present,
    source   => $::filebeat::real_package_file,
    provider => $::filebeat::real_package_provider,
  }
  
  file { $::elastic_filebeat::params::conf_dir:
    ensure  => 'directory',
    require => Package[$::filebeat::params::package_name],
  }

  file { $::filebeat::params::confd_dir:
    ensure  => 'directory',
    purge   => true,
    recurse => true,
    require => File[$::filebeat::params::conf_dir],
  }
  
}
