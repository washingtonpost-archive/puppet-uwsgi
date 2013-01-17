class uwsgi::service::basic {
    service {'uwsgi':
        ensure => running,
        enable => true,
        require => Class['uwsgi::config'],
    }
}

define uwsgi::service::emperor (
)
    {
    service { $name:
        provider => upstart,
        ensure   => running,
    }
}