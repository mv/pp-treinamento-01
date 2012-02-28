#
# puppet simple: mysql01
#

package { "mysql.x86_64":
    ensure => present,
}

package { "mysql-server.x86_64":
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

# vim:ft=puppet

