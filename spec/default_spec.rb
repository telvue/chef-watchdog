require 'chefspec'

describe 'The recipe watchdog::default' do
  %w( rhel debian ).each do |platform|
    describe "for platform #{platform}" do
      let(:chef_run) {
        chef_run = ChefSpec::ChefRunner.new
        chef_run.converge 'watchdog::default'
        chef_run
      }

      it 'should install package watchdog' do
        chef_run.should install_package 'watchdog'
      end
      it 'should create file /etc/watchdog.conf and restart watchdog' do
        chef_run.should create_file '/etc/watchdog.conf'
        chef_run.template('/etc/watchdog.conf').should notify 'service[watchdog]', 'restart'
      end
    end
  end
end
