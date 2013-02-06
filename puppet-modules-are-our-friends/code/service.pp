class collect_cpu_stats::service {
  service { 'collect-cpu-stats':
    ensure  => running,
  }
}
