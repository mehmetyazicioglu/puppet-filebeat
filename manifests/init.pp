# Class: filebeat
# ===========================
#
# Full description of class filebeat here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'filebeat':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.

class filebeat (
  $package_file                = '',
  $package_provider            = '',
  $logstash_output_enabled     = false,
  $logstash_output_hosts       = ['localhost:5044'],
  $logstash_output_loadbalance = undef,
  $logstash_output_index       = undef,
  $self_log_to_syslog               = undef,
  $self_log_to_files                = undef,
  $self_log_selectors               = [],
  $self_log_level                   = undef,
  $self_log_path                    = undef,
  $self_log_name                    = undef,
  $self_log_rotateeverybytes        = undef,
  $self_log_keepfiles               = undef) inherits ::filebeat::params {
    
  if ($logstash_output_loadbalance != undef) {
    validate_bool($logstash_output_loadbalance)
  }

  validate_array($logstash_output_hosts)

  if($package_file != ''){
    $real_package_file = $package_file
} else { 
 $real_package_file = $::filebeat::params::default_package_file 
 }


  if($package_provider != ''){
    $real_package_provider = $package_provider
  } else {
    $real_package_provider = $::filebeat::params::default_package_provider
  }

  class { '::filebeat::install': } ->
  class { '::filebeat::config': } ~>
  class { '::filebeat::service': } ->
  Class['::filebeat']
  

}


