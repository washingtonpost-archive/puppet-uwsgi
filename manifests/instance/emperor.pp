define uwsgi::instance::emperor(
    $service = 'emperor.conf',
    $vassals = "${uwsgi::params::vassals}",
    $provider = '/etc/init',
    $runlevel_start = 2345,
    $runlevel_stop = 06,
) {
    File {
        owner => 'root',
        group => 'root',
        mode  => '0644',
    }

    file { $name:
        ensure  => present,
        recurse => true,
        content => template('uwsgi/uwsgi.conf.erb'),
        require => Class['uwsgi::package'],
        location => "${provider}/${service}",
    }

    class { $service:
        require => File[$name],
        notify => Uwsgi::Service::Emperor[$name]
    }
}