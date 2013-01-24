define uwsgi::instance::vassal(
    $emperor,
    $workers=2,
    $params={'pythonpath' => '["foo"]'},
    $zerg=true,
    $vassal_sos_backlog=10,
    $processes=1,
    $disable_logging=false,
    $idle=30,
    $die_on_idle=true
) {
    File {
        owner => $uwsgi::params::user,
        group => $uwsgi::params::user,
        mode  => '0664',
    }
    file {"${emperor}/${name}.json":
        ensure  => present,
        recurse => true,
        content => template('uwsgi/config.json.erb'),
        require => Class['uwsgi::package'],
    }

}