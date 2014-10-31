require 'spec_helper'

describe 'zabbix::default' do
  context file('/etc/zabbix') do
    it {
      should_not be_directory
    }
  end

  context file('/opt/zabbix') do
    it {
      should_not be_directory
    }
  end

  context file('/var/log/zabbix') do
    it {
      should_not be_directory
    }
  end

end

describe port(80) do
  it { should_not be_listening }
end