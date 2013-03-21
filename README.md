Description [ ![Codeship Status for Bigpoint/chef-watchdog](https://www.codeship.io/projects/58d93790-746a-0130-3881-12313d33feba/status?branch=master)](https://www.codeship.io/projects/2099)
===========

Requirements
============

## Chef:

* >= 10.10.0

## Platform:

* Debian
* CentOS
* RHEL

## Cookbooks:

*No cookbook dependencies*

Attributes
==========

| Attribute                     | Description                                        | Default            |
| :---------------------------- | :--------------                                    | ------:            |
| `node['watchdog']['enabled']` | Enable watchdog                                    | `true`             |
| `node['watchdog']['version']` | Version of package to install in Squeeze           | `5.11-1`           |
| `node['watchdog']['config']`  | Hash containing the default configuration settings | See attribute file |

Usage
=====

This software comes with a LWRP that allows you to easily add a new test and repair script for a specific service.

Scripts are placed in `/etc/watchdog.d` and are executed by the watchdog process. Please see their manpage for
a full description of this feature. Bear in mind this is relativley new and requires watchdog >=5.11.

LWRP
----

The following commands allow you do add a new resource to watchdog:

```
watchdog_manage 'service' do
  action :add
  test "command to run test"
  repair "command to repair when test fails"
end
```

Obviously you can also remove a service:

```
watchdog_manage 'service' do
  action :remove
end
```

These LWRPs will not restart automatically but you can notify watchdog
to do so:

```
include 'watchdog::_define_service'

watchdog_manage 'service' do
  action :add
  test "command to run test"
  repair "command to repair when test fails"
  notifies :restart, 'service[watchdog]', :delayed
end
```


Recipes
=======

## watchdog::default

Installs and configured a default watchdog installation.

Testing
=======

The cookbook comes with some testing facilities allowing you to iterate quickly
on cookbook changes.

## Rake

You can execute the tests with [Rake](http://rake.rubyforge.org). The `Rakefile`
provides the following tasks:

    $ rake -T
    rake chefspec    # Run ChefSpec examples
    rake foodcritic  # Run Foodcritic lint checks
    rake knife       # Run knife cookbook test
    rake test        # Run all tests

## Bundler

If you prefer to let [Bundler](http://gembundler.com) install all required gems
(you should), run the tests this way:

    $ bundle install
    $ bundle exec rake test

## Berkshelf

[Berkshelf](http://berkshelf.com) is used to set up the cookbook and its
dependencies (as defined in `Berksfile`) prior to testing with Rake and Vagrant.

## Vagrant

With [Vagrant](http://vagrantup.com), you can spin up a virtual machine and run
your cookbook inside it via Chef Solo.

This command will boot and provision the VM as specified in the `Vagrantfile`:

    $ bundle exec vagrant up

(Berkshelf's Vagrant plugin will make your cookbook and its dependencies
automatically available to Vagrant when creating or provisioning a VM.)

## Kitchen

This cookbook is using [test-kitchen](https://github.com/opscode/test-kitchen)  to propagate the `Vagrantfile`. You
can review the boxes by using:

    $ bundle exec kitchen list

Each item in this list is a regular vagrant box that can be started as
usual.

To run the full kitchen suite included in this cookbook simply execute:

    $ bundle exec kitchen test

License and Author
==================

Author:: Sebastian Grewe (<sebastian.grewe@gmail.com>)

Copyright:: 2013, Sebastian Grewe

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
