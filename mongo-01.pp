
# Ref: http://www.mongodb.org/display/DOCS/CentOS+and+Fedora+Packages

### repos definition
yumrepo { "10gen":
    name       => '10gen_Repository',
    baseurl    => 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64',
    descr      => '10gen RPM Repository',
    enabled    => 1,
    gpgcheck   => 0,
}


yumrepo { "10gen_32bits":
    name       => '10gen_Repository_32bits',
    baseurl    => 'http://downloads-distro.mongodb.org/repo/redhat/os/i686',
    descr      => '10gen RPM Repository 32bits',
    enabled    => 1,
    gpgcheck   => 0,
}

package { "mongo-client":
    name   => "mongo-10gen.x86_64",
    ensure => installed,
}

package { "mongo-server":
    name   => "mongo-10gen-server.x86_64",
    ensure => installed,
}

file { "/etc/mongod.conf":
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['mongo-server'],
}

service { "mongod":
    ensure  => running,
    require => File["/etc/mongod.conf"],
}

file { ["/mongo",
        "/mongo/logs",
       ]:
    ensure => directory,
    owner  => 'mongod',
    group  => 'mongod',
    mode   => '0755',
}

group { 'mongod':
    ensure => present,
    gid    => 11,
}

user { 'mongod':
    ensure => present,
    uid    => 15,
    gid    => 11,
    shell  => '/sbin/nologin',
    home   => '/var/empty/mongo',
}


