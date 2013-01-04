define uwsgi::instance::vassal(
    $emperor,
    $workers=2,
) {
    File {
        owner => 'root',
        group => 'root',
        mode  => '0644',
    }

    file {"/etc/uwsgi/apps-enabled/${name}.json":
        ensure  => present,
        recurse => true,
        content => template('uwsgi/config.json.erb'),
        require => Class['uwsgi::package'],
        notify => Class['uwsgi::service'],
    }

}