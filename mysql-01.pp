#
# puppet simple: mysql01
#

package { "mysql":
    ensure => present,
}

service { "mysql":
    ensure => running,
}

file { "my.cnf":
    path  => '/etc/my.cnf',
    mode  => '0644',
    owner => 'root',
    group => 'root',
}

# vim:ft=puppet

