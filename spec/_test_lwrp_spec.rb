require 'chefspec'

describe 'The recipe watchdog::_test_lwrp' do
  %w( rhel debian ).each do |platform|
    describe "for platform #{platform}" do
      let(:chef_run) {
        chef_run = ChefSpec::ChefRunner.new(:step_into => ['watchdog_manage'])
        chef_run.converge 'watchdog::_test_lwrp'
        chef_run
      }
      it 'should create directory /etc/watchdog.d' do
        chef_run.should create_directory '/etc/watchdog.d'
      end
      it 'should create file /etc/watchdog.d/test with specific content and notify watchdog to restart' do
        chef_run.should create_file '/etc/watchdog.d/test'
        content = "#!/bin/bash
case $1 in
  test)
    echo OK; exit 0
  ;;
  repair)
    echo NOK; exit 1
  ;;
esac"
        chef_run.should create_file_with_content '/etc/watchdog.d/test', content
      end
      it 'should remove file /etc/watchdog.d/test' do
        chef_run.should delete_file '/etc/watchdog.d/test'
      end
    end
  end
end
