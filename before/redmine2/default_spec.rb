require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe user('redmine') do
  it { should_not exist }
end

describe 'redmine::default' do
  context file('/home/redmine') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

  context file('/home/redmine/redmine/Rakefile') do
    it {
      should_not be_file
      should_not be_mode 644
    }
  end

end

