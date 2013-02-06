class collect_cpu_stats(
  $hostname = $fqdn
  $interval = 10
) {
  include collect_cpu_stats::package
  class { 'collect_cpu_stats::config'
    hostname => $hostname,
    interval => $interval
  }
  include collect_cpu_stats::service

  Class['collect_cpu_stats::package']
    -> Class['collect_cpu_stats::config']
    -> Class['collect_cpu_stats::service']
}
