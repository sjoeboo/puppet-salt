# defaults for salt module
class salt::defaults {

  # set location of conf file for master
  #
  $master_conf_file = $::operatingsystem ? {
    default => '/etc/salt/master',
  }

  # set location of conf file for minion
  #
  $minion_conf_file = $::operatingsystem ? {
    default => '/etc/salt/minion',
  }

  # set templates for master and minion
  #
  $master_conf_template = 'salt/master.erb'
  $minion_conf_template = 'salt/minion.erb'
  $master_autosign_template = 'salt/autosign.conf.erb'

  # set location of grains file
  #
  $grains_file = $::operatingsystem ? {
    default => '/etc/salt/grains',
  }

  case $::operatingsystem {
    /Ubuntu/: {
      # salt only installs init style scripts
      $service_provider = debian
    }
    default: {
      $service_provider = undef
    }
  }
}
