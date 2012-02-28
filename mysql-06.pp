#
# puppet simple: mysql01
#

package { ["mysql.x86_64",
           "mysql-server.x86_64"]:
    ensure => present,
}

file { "my.cnf":
    path    => '/etc/my.cnf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package["mysql-server.x86_64"],
}

service { "mysqld":
    ensure  => running,
    require => File["my.cnf"]
}


file { ["/mysql",
        "/mysql/data",
        "/mysql/logs",]:
    ensure => directory,
    mode   => "0775",
    owner  => "mysql",
    group  => "mysql",
}

user { "mysql":
    ensure => present,
    uid    => 27,
    gid    => 27,
    shell  => "/sbin/nologin",
    home   => "/var/empty/mysqld",
}

group { "mysql":
    ensure => present,
    gid    => 27,
}

file { "/var/empty/mysqld":
    ensure => directory,
    mode   => 0755,
    owner  => "root",
    group  => "root",
}

# vim:ft=puppet

