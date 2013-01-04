define uwsgi::instance::emperor(
    $conf='/etc/init/uwsgi.conf',
    $vassals='/etc/uwsgi/apps-enabled',
) {

    file { $conf:
        ensure  => present,
        recurse => true,
        content => template('uwsgi/uwsgi.conf.erb'),
        require => Class['uwsgi::package'],
    }

    class { 'uwsgi::service::emperor':
        require => File[$conf]
    }
}