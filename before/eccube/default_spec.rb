require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'eccube::default' do
  context file('/var/www/eccube') do
    it {
      should_not be_directory
      should_not be_mode 755
    }
  end

  context file('/var/www/eccube/define.php') do
    it {
      should_not be_file
      should_not be_mode 644
    }
  end

  context file('/etc/httpd/sites-available/default') do
    it {
      should_not be_file
      should_not be_mode 644
    }
  end

end

