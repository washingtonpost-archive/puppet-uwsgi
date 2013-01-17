class uwsgi::config {

    file {'/etc/default/uwsgi':
        ensure => present,
        content => template('uwsgi/default.erb'),
        require => Class['uwsgi::package'],
    }

    file {'/etc/uwsgi/default.ini':
        ensure => present,
        content => template('uwsgi/default.ini.erb'),
        require => Class['uwsgi::package'],
    }
}