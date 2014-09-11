#
# Cookbook Name:: watchdog
# Recipe:: default
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

action :add do
  r = directory '/etc/watchdog.d' do
    user 'root'
    group 'root'
    mode '0700'
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?
  r = template "/etc/watchdog.d/#{new_resource.name}" do
    cookbook 'watchdog'
    source 'service.erb'
    variables( 'test_command' => new_resource.test, 'repair_command' => new_resource.repair )
    mode '750'
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?
end

action :remove do
  r = file "/etc/watchdog.d/#{new_resource.name}" do
    action :delete
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?
end
