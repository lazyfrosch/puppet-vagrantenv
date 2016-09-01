class vagrantenv::tools
{
  Package {
    ensure => present,
  }

  ensure_packages(
    [
      'bash-completion',
      'screen',
      'sysstat',
      'curl',
      'htop',
    ]
  )

  # VIM START
  $_vim_package = $::osfamily ? {
    'RedHat' => 'vim-enhanced',
    default  => 'vim',
  }

  package { 'vim':
    name => $_vim_package,
  }

  if $::osfamily == 'Debian' {
    alternatives { 'editor':
      path    => '/usr/bin/vim.basic',
      require => Package['vim'],
    }
  }
  # VIM END

  # LOCATE START
  $_mlocate_package = $::osfamily ? {
    'Suse'  => 'findutils-locate',
    default => 'mlocate',
  }

  package { 'mlocate':
    name => $_mlocate_package,
  }
  # LOCATE END
}