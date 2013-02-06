    # TODO: Turn this pattern into a puppet module
    file { "/etc/init/collect-cpu-stats.conf":
      content => template("etc/init/collect-cpu-stats.conf.erb")
    }
    file { "/etc/init.d/collect-cpu-stats":
      ensure  => "/lib/init/upstart-job",
    }
    remotefile { "/usr/local/bin/collect-cpu-stats":
      mode => 755,
      notify => Service["collect-cpu-stats"],
    }
    service { collect-cpu-stats:
      ensure  => running,
      require => [
        File["/usr/local/bin/collect-cpu-stats"],
        File["/etc/init/collect-cpu-stats.conf"],
        File["/etc/init.d/collect-cpu-stats"],
      ]
    }

