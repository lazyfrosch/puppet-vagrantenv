class vagrantenv::root
{
  File {
    owner => 'root',
    group => 'root',
    mode  => '0700',
  }

  file {
    '/root':
      ensure => directory;
    '/root/.ssh':
      ensure => directory;
    '/root/.bashrc':
      ensure  => file,
      content => template('vagrantenv/root_bashrc.erb');
  }
}
