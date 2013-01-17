class uwsgi {

    class {'uwsgi::package': }

    class {'uwsgi::config':
        require => Class['uwsgi::package'],
    }

}