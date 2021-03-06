require 'spec_helper'

describe 'newrelic::agent::php', :type => :class do
    let(:facts) do
    {
      'os' => {
        'family'  => 'RedHat',
        'name'    => 'CentOS',
        'release' => {
          'major' => '7'
        }
      },
      'operatingsystem' => 'Centos',
      'path' => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin:/root/.local/bin:/root/bin'
   }
  end

  let(:params) do
    {
    :license_key => '1234567890qwerty',
    :conf_dir => '/opt/rh/php54/root/etc/php.d',
    }
  end

  it { is_expected.to compile }
  it { should contain_class('newrelic::params') }
  it { should contain_class('newrelic::repo::legacy') }
  it { should contain_package('newrelic-php5') }
  it { should contain_package('php-cli') }
  it { should contain_file('/etc/newrelic/newrelic.cfg') }
  it { should contain_file('/opt/rh/php54/root/etc/php.d/newrelic.ini') }
  it { should contain_exec('newrelic install') }
  it { should contain_exec('newrelic_kill') }


  context 'startup_mode => external' do
    let(:params) do
      super().merge({ 'startup_mode' => 'external' })
    end
    it { should contain_service('newrelic-daemon') }
  end
end
