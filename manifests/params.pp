class filebeat::params {
    
  $package_name = 'filebeat'
  $service_name = 'filebeat'
  $conf_dir = '/etc/filebeat'
  $conf_file = "${conf_dir}/filebeat.yml"
  $confd_dir = "${conf_dir}/conf.d"

  case $::osfamily {
    'Debian'           : {
      if ($::architecture == 'amd64') {
        $default_package_file = 'https://download.elastic.co/beats/filebeat/filebeat_1.0.0-rc1_amd64.deb'
      } else {
        $default_package_file = 'https://download.elastic.co/beats/filebeat/filebeat_1.0.0-rc1_i386.deb'
      }
$default_package_provider = 'dpkg'
}

  default : {
      fail("${::operatingsystem} not supported")
    }
  }
}

