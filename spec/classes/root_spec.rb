require 'spec_helper'

describe 'vagrantenv::root' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { should contain_class('vagrantenv::root') }

      it { should contain_file('/root').with_ensure('directory') }
      it do
        should contain_file('/root/.ssh')
          .with_ensure('directory')
          .with_mode('0700')
      end
      it do
        should contain_file('/root/.bashrc')
          .with_content(/managed by Puppet/)
      end
    end
  end
end
