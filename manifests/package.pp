class uwsgi::package {
  anchor { 'uwsgi::package::begin': }
  anchor { 'uwsgi::package::end': }

  case $operatingsystem {
    # centos,fedora,rhel: {
    #   class { 'uwsgi::package::redhat':
    #     require => Anchor['uwsgi::package::begin'],
    #     before  => Anchor['uwsgi::package::end'],
    #   }
    # }
    debian,ubuntu: {
      class { 'uwsgi::package::debian':
        require => Anchor['uwsgi::package::begin'],
        before  => Anchor['uwsgi::package::end'],
      }
    }
    # opensuse,suse: {
    #   class { 'uwsgi::package::suse':
    #     require => Anchor['uwsgi::package::begin'],
    #     before  => Anchor['uwsgi::package::end'],
    #   }
    # }
  }
}
