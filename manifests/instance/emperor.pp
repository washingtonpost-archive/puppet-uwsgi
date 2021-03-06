define uwsgi::instance::emperor(
    $service = 'emperor',
    $provider = '/etc/init',
    $runlevel_start = 2345,
    $runlevel_stop = 06,
) {
    File {
        owner => $uwsgi::params::user,
        group => $uwsgi::params::user,
        mode  => '0644',
    }

    file { $name:
        ensure  => present,
        recurse => true,
        content => template('uwsgi/uwsgi.conf.erb'),
        path => "${provider}/${service}.conf",
    }

    service { $service:
        provider => upstart,
        ensure   => running,
        require => File[$name]
    }


}