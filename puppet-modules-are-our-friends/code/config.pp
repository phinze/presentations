class collect_cpu_stats::config (
  $hostname,
  $interval
) {
  file { "/etc/init/collect-cpu-stats.conf":
    content => template("collect_cpu_stats/collect-cpu-stats.conf.erb"),
    notify => Class['collect_cpu_stats::service']
  }
}
