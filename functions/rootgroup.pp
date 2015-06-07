function sudoers::rootgroup() {
  $::osfamily ? {
    /(Darwin|FreeBSD|Solaris)/  => 'wheel',
    default                     => 'root',
  }
}
