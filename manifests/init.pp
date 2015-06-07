class sudoers {
  @file { '/etc/sudoers.d':
    ensure => 'directory',
    mode   => '0660',
    owner  => 'root',
    group  => sudoers::rootgroup()
  }

  @file_line { 'include for sudoers.d':
    path => '/etc/sudoers',
    line => '#includedir /etc/sudoers.d',
  }
}
