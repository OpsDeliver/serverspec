require 'spec_helper'

describe 'owncloud::default' do

  if os[:family] == 'redhat'
    context file('/var/www/html/owncloud') do
      it {
        should_not be_directory
      }
    end

    context file('/var/www/html/owncloud/config/config.php') do
      it {
        should_not be_file
      }
    end

    context file('/etc/httpd/sites-enabled/owncloud.conf') do
      it {
        should_not be_linked_to '../sites-available/owncloud.conf'
      }
    end
  end

  if os[:family] == 'ubuntu' || os[:family] == 'debian'
    context file('/var/www/owncloud') do
      it {
        should_not be_directory
      }
    end

    context file('/var/www/owncloud/config/config.php') do
      it {
        should_not be_file
      }
    end
    
    context file('/etc/apache2/sites-enabled/owncloud.conf') do
      it {
        should_not be_linked_to '../sites-available/owncloud.conf'
      }
    end
  end

end

describe port(80) do
  it { should_not be_listening }
end