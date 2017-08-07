require 'spec_helper'

describe 'newrelic::agent::php', :type => :class do
  let(:title) { 'newrelic_php' }
    let(:facts) do
    {
      'os' => {
          'family' => 'RedHat',

      },
      'operatingsystem' => 'Centos',
   }
  end

  let(:params) do 
    {
    :newrelic_license_key => '1234567890qwerty',
    :newrelic_php_conf_dir => '/opt/rh/php54/root/etc/php.d',
    :newrelic_php_exec_path => '/opt/rh/php54/root/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
    :newrelic_ini_appname => 'prod-web'
    }
  end

  it { is_expected.to compile }
end