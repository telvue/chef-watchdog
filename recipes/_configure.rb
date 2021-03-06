#
# Cookbook Name:: watchdog
# Recipe:: _configure
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

service 'watchdog' do
  action [ :start, :enable] if node['watchdog']['enabled']
  action [ :stop, :disable ] unless node['watchdog']['enabled']
end

template '/etc/watchdog.conf' do
  source 'watchdog.conf.erb'
  notifies :restart, 'service[watchdog]', :delayed if node['watchdog']['enabled']
end
