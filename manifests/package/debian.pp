class uwsgi::package::debian {
    package {'libjansson4':
        ensure => present,
    }
    package {'uwsgi':
        ensure => present,
        require => Package['libjansson4'],
    }
    package {'uwsgi-plugin-python':
        ensure => present,
        require => Package['uwsgi'],
    }
    file {['/usr/lib/uwsgi', '/usr/lib/uwsgi/plugins']:
        ensure => directory,
        require => Package['uwsgi'],
    }
}