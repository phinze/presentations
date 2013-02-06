class collect_cpu_stats::script {
  file { '/usr/local/bin/collect-cpu-stats':
    mode => 755,
    source => 'puppet:///modules/collect_cpu_stats/collect-cpu-stats'
  }

  file { '/etc/init.d/collect-cpu-stats':
    ensure => link,
    target => '/lib/init/upstart-job'
  }
}
