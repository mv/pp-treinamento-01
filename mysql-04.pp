#
# puppet simple: mysql01
#

package { ["mysql.x86_64",
           "mysql-server.x86_64"]:
    ensure => present,
}

service { "mysqld":
    ensure => running,
}

file { "my.cnf":
    path  => '/etc/my.cnf',
    mode  => '0644',
    owner => 'root',
    group => 'root',
}

file { ["/mysql",
        "/mysql/data",
        "/mysql/logs",]:
    ensure => directory,
    mode   => "0775",
    owner  => "mysql",
    group  => "mysql",
}


# vim:ft=puppet

