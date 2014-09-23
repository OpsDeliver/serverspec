require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'munin::default' do
  context file('/etc/munin') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

  context file('/var/log/munin') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

  context file('/var/lib/munin') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

end

