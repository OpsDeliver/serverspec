require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'wordpress::default' do
  context file('/var/www/wordpress') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/var/www/wordpress/wp-config.php') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-available/wordpress.conf') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

end

