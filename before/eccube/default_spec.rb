require 'spec_helper'

describe 'eccube::default' do
  context file('/var/www/html') do
    it {
      should_not be_directory
    }
  end

  context file('/var/www/html/define.php') do
    it {
      should_not be_file
    }
  end

  if os[:family] == 'redhat'
    context file('/etc/httpd/sites-enabled/default.conf') do
      it {
        should_not be_linked_to '../sites-available/default.conf'
      }
    end
  end

  if os[:family] == 'ubuntu' || os[:family] == 'debian'
    context file('/etc/apache2/sites-enabled/000-default.conf') do
      it {
        should_not be_linked_to '../sites-available/000-default.conf'
      }
    end
  end

end

describe port(80) do
  it { should_not be_listening }
end