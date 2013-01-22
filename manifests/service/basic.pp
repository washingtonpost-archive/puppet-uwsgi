class uwsgi::service::basic {
    service {'uwsgi':
        ensure => running,
        enable => true,
        require => Class['uwsgi::config'],
    }
}