# config for master
class salt::master::config {
  file { 'master-conf':
    ensure  => present,
    path    => $salt::master_conf_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($salt::master_conf_template),
  }

  #if using autosign, create autosign.conf and populate
  if $salt::master_autosign_file != undef {
    file { 'autosign-conf':
      ensure  => present,
      path    => $salt::autosign_file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template($salt::master_autosign_template),
    }
  }
}
