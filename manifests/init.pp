class uwsgi {

    anchor {'uwsgi::begin':
        before => Class['uwsgi::package'],
        notify => Class['uwsgi::service'],
    }

    class {'uwsgi::package':
        notify => Class['uwsgi::service'],
    }

    class {'uwsgi::config':
        require => Class['uwsgi::package'],
        notify => Class['uwsgi::service'],
    }

    class { 'uwsgi::service': }

    anchor {'uwsgi::end':
        require => Class['uwsgi::service']
    }
}