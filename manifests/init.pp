class vagrantenv
{
  contain ::vagrantenv::root
  contain ::vagrantenv::vagrant
  contain ::vagrantenv::issue
  contain ::vagrantenv::tools
}
