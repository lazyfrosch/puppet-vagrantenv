require 'spec_helper'

describe 'vagrantenv::issue' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { should contain_class('vagrantenv::issue') }

      it do
        should contain_file('motd')
          .with_content(/#{Regexp.quote(facts[:operatingsystem])}/)
          .with_content(/#{Regexp.quote(facts[:fqdn])}/)
      end
      it do
        should contain_file('issue')
          .with_content(/#{Regexp.quote(facts[:operatingsystem])}/)
          .with_content(/#{Regexp.quote(facts[:fqdn])}/)
      end
    end
  end
end
