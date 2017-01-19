require 'spec_helper'

describe 'vagrantenv::vagrant' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { should contain_class('vagrantenv::vagrant') }

      it do
        should contain_file('/home/vagrant/.bashrc')
          .with_content(/managed by Puppet/)
      end
    end
  end
end
