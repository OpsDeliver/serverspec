require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'wordpress::default' do
  context file('/var/www/wordpress') do
    it {
      should_not be_directory
    }
  end

  context file('/var/www/wordpress/wp-config.php') do
    it {
      should_not be_file
    }
  end

  if os[:family] == 'redhat'
    context file('/etc/httpd/sites-available/wordpress.conf') do
      it {
        should_not be_file
      }
    end
  end

  if os[:family] == 'ubuntu' || 'debian'
    context file('/etc/apache2/sites-available/wordpress.conf') do
      it {
        should_not be_file
      }
    end
  end

end

describe port(80) do
  it { should_not be_listening }
end