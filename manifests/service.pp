class uwsgi::service::basic {
    service {'uwsgi':
        ensure => running,
        enable => true,
        require => Class['uwsgi::config'],
    }
}

class uwsgi::service::emperor {
    service { 'uwsgi':
        provider => upstart,
        ensure   => running,
    }
}