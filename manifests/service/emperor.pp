class uwsgi::service::emperor (
)
    {
    service { $name:
        provider => upstart,
        ensure   => running,
        require => Class['uwsgi::package'],
    }
}