class uwsgi::package::debian {

    exec { "update_aptitude":
        command => "/usr/bin/apt-get update --fix-missing",
    }

    package {'libjansson4':
        ensure => present,
        require => Exec['update_aptitude']
    }

    package {'libjansson-dev':
        ensure => present,
        require => Exec['update_aptitude']

    }

    package{'python-setuptools':
        ensure => present,
        require => Exec['update_aptitude']
    }

    # Required for normal package installation and virtualenv
    package{'python-pip':
        ensure=> present,
        require => Package['python-setuptools']
    }

    exec {'install_uwsgi_globally':
        command => '/usr/local/bin/pip install uwsgi',
        creates => '/usr/local/bin/uwsgi',
        require => Package['python-pip']
    }

    file {['/usr/lib/uwsgi', '/usr/lib/uwsgi/plugins']:
        ensure => directory,
        require => Exec['install_uwsgi_globally'],
    }
}