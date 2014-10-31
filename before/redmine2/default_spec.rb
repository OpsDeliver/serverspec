require 'spec_helper'

describe user('redmine') do
  it { should_not exist }
end

describe 'redmine::default' do
  context file('/home/redmine') do
    it {
      should_not be_directory
    }
  end

  context file('/home/redmine/redmine/Rakefile') do
    it {
      should_not be_file
    }
  end

end

describe port(80) do
  it { should_not be_listening }
end