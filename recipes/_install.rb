#
# Cookbook Name:: watchdog
# Recipe:: _install
#
# Copyright (C) 2013 Sebastian Grewe <sebastian.grewe@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Try to detect which arch to install
node['kernel']['machine'] =~ /x86_64/ ? arch = 'amd64' : arch = 'i386'

# We need to install the latest version available
cookbook_file "#{Chef::Config[:file_cache_path]}/watchdog_#{node['watchdog']['version']}_#{arch}.deb" do
  source "watchdog_#{node['watchdog']['version']}_#{arch}.deb"
  only_if { node['lsb']['codename'] == 'squeeze' }
end
dpkg_package 'watchdog' do
  source "#{Chef::Config[:file_cache_path]}/watchdog_#{node['watchdog']['version']}_#{arch}.deb"
  only_if { node['lsb']['codename'] == 'squeeze' }
end
package 'watchdog' do
  not_if { node['lsb']['codename'] == 'squeeze' }
end
