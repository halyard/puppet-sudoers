class sudoers {
  @file { '/etc/sudoers.d':
    ensure => 'directory',
    mode   => '0660',
    owner  => 'root',
    group  => root_group()
  }

  @file_line { 'include for sudoers.d':
    path => '/etc/sudoers',
    line => '#includedir /etc/sudoers.d',
  }
}
