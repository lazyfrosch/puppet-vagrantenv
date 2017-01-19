require 'spec_helper'

describe 'vagrantenv' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { should compile.with_all_deps }

      it { should contain_class('vagrantenv') }
      it { should contain_class('vagrantenv::root') }
      it { should contain_class('vagrantenv::issue') }
      it { should contain_class('vagrantenv::tools') }
      it { should contain_class('vagrantenv::vagrant') }
    end
  end
end
