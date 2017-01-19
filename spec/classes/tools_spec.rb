require 'spec_helper'

describe 'vagrantenv::tools' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { should contain_class('vagrantenv::tools') }

      it { should contain_package('bash-completion') }
      it { should contain_package('curl') }
      it { should contain_package('htop') }
      it { should contain_package('mlocate') }
      it { should contain_package('screen') }
      it { should contain_package('sysstat') }

      if facts[:osfamily] == 'RedHat'
        it { should contain_package('vim-enhanced') }
      else
        it { should contain_package('vim') }
      end

      it { should contain_alternatives('editor') } if facts[:osfamily] == 'Debian'
    end
  end
end
