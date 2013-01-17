define uwsgi::instance::vassal(
    $emperor,
    $workers=2,
    $params={'pythonpath' => '["foo"]'},
    $user = "${uwsgi::params::user}",

) {
    File {
        owner => $user,
        group => $user,
        mode  => '0644',
    }

    file {"${emperor}/${name}.json":
        ensure  => present,
        recurse => true,
        content => template('uwsgi/config.json.erb'),
        require => Class['uwsgi::package'],
    }

}