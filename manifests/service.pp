class uwsgi::service {
    service {'uwsgi':
        ensure => running,
        enable => true,
        require => Class['uwsgi::config'],
    }
}