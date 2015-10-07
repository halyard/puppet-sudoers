# Define global requirements for sudoers
class sudoers {
  $rootgroup = $::osfamily ? {
    /(Darwin|FreeBSD|Solaris)/ => 'wheel',
    default                    => 'root',
  }

  @file { '/etc/sudoers.d':
    ensure => 'directory',
    mode   => '0660',
    owner  => 'root',
    group  => $rootgroup
  }

  @file_line { 'include for sudoers.d':
    path => '/etc/sudoers',
    line => '#includedir /etc/sudoers.d',
  }
}
