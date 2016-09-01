class vagrantenv::vagrant
{
  File {
    owner => 'vagrant',
    group => 'vagrant',
  }

  file {
    '/home/vagrant/.bashrc':
      ensure  => file,
      content => template('vagrantenv/bashrc.erb');
  }
}
