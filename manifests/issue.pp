class vagrantenv::issue
{
  File {
    ensure  => file,
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { 'issue':
    path    => '/etc/issue',
    content => template('vagrantenv/issue.erb'),
  }

  file { 'motd':
    path    => '/etc/motd',
    content => template('vagrantenv/motd.erb'),
  }
}
