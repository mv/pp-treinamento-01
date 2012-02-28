
yumrepo { "epel":
    name       => 'python',
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch',
    enabled    => 1,
}

package { "python26":
    ensure => present,
}

