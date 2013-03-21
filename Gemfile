source 'https://rubygems.org/'

gem 'berkshelf'
gem 'chef',       '< 11.0.0'  # ChefSpec isn't Chef 11 ready yet
gem 'chefspec',   '~> 0.9.0'
gem 'foodcritic'
gem 'rake'
gem 'vagrant'

group :integration do
  gem 'test-kitchen', :git => "git://github.com/opscode/test-kitchen.git", :branch => '1.0'
  gem 'kitchen-vagrant', :git => "git://github.com/opscode/kitchen-vagrant.git"
end
