require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'jenkins::default' do
  context file('/var/lib/jenkins') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

  context file('/var/log/jenkins') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

end

