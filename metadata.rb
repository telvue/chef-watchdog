name              "watchdog"
maintainer        "Sebastian Grewe"
maintainer_email  "sebastian.grewe@gmail.com"
license           "Apache 2.0"
description       "Installs and configures watchdog."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"
recipe            "watchdog::default", "Installs and configures a basic watchdog system."

%w( debian rhel centos ).each do |sup|
  supports sup
end
