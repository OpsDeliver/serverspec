require 'spec_helper'

describe 'munin::default' do
  context file('/etc/munin') do
    it {
      should_not be_directory
    }
  end

  context file('/var/log/munin') do
    it {
      should_not be_directory
    }
  end

  context file('/var/lib/munin') do
    it {
      should_not be_directory
    }
  end

end

describe port(80) do
  it { should_not be_listening }
end