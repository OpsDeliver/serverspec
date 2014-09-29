require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'zabbix::default' do
  context file('/etc/zabbix') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

  context file('/opt/zabbix') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

  context file('/var/log/zabbix') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

end

