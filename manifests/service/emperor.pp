define uwsgi::service::emperor (
)
    {
    service { $name:
        provider => upstart,
        ensure   => running,
    }
}