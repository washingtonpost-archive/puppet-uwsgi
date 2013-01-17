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

    file { $name:
        ensure  => present,
        recurse => true,
        content => template('uwsgi/uwsgi.conf.erb'),
        require => Class['uwsgi::package'],
        path => "${provider}/${service}.conf",
        notify => Uwsgi::Service::Emperor[$service]

    }

}