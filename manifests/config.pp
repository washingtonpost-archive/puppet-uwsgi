class uwsgi::config {

    file {'/etc/default/uwsgi':
        ensure => present,
        content => template('uwsgi/default.erb'),
        require => Package['uwsgi'],
    }

    file {'/etc/uwsgi/default.ini':
        ensure => present,
        content => template('uwsgi/default.ini.erb'),
        require => Package['uwsgi'],
    }
}