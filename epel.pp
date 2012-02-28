
http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm

yumrepo { “epel”:
    mirrorlist => ‘http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch’,
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => “file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL”,
    require    => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL"]
}

