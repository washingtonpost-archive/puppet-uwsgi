define uwsgi::instance::emperor(
    $service = 'emperor',
    $provider = '/etc/init',
    $runlevel_start = 2345,
    $runlevel_stop = 06,
) {
    File {
        owner => 'root',
        group => 'root',
        mode  => '0644',
    }

    service { $service:
        provider => upstart,
        ensure   => running,
    }

    file { $name:
        ensure  => present,
        recurse => true,
        content => template('uwsgi/uwsgi.conf.erb'),
        require => Service[$service],
        path => "${provider}/${service}.conf",
    }

}