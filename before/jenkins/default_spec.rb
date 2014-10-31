require 'spec_helper'

describe 'jenkins::default' do
  context file('/var/lib/jenkins') do
    it {
      should_not be_directory
    }
  end

  context file('/var/log/jenkins') do
    it {
      should_not be_directory
    }
  end

end

describe port(8080) do
  it { should_not be_listening }
end