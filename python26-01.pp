
# Ref: https://fedoraproject.org/keys

### gpg rpm keys
exec { "epel-gpg-key":
    command   => "/bin/rpm -ivh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm",
    creates   => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL",
	logoutput => on_failure,
}

### repos definition
yumrepo { "epel":
    name       => 'epel',
    descr      => 'Extra Packages for Enterprise Linux repository configuration',
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch',
    enabled    => 1,
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL",
    require    => Exec["epel-gpg-key"],
}

### package
package { "python26":
    ensure => present,
}

