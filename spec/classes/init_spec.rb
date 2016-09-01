require 'spec_helper'

describe 'vagrantenv' do

  context 'on Debian with MySQL' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let :facts do
          facts
        end

        it { should compile.with_all_deps }
        it { should contain_class('vagrantenv') }
      end
    end
  end
end
