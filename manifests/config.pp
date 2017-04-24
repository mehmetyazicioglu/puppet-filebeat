class filebeat::config {
  file { $::filebeat::params::conf_file:
    ensure  => 'file',
    content => template('filebeat/filebeat.yml.erb'),
  }

}
