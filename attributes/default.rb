#
# Cookbook Name:: watchdog
# Attributes:: default
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
#

# Enable Watchdog
default['watchdog']['enabled'] = true

# Package version included in this cookbook
default['watchdog']['version'] = '5.11-1'

# For more details please refer to the manpage watchdog.conf
default['watchdog']['config'] = [
  { 'admin' => 'root' },
  { 'interval' => 1 },
  { 'logtick' => 1 },
  { 'log-dir' => '/var/log/watchdog' },
  { 'realtime' => 'yes' },
  { 'priority' => 1 }
]
