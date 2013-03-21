actions :add, :remove

default_action :add

attribute :name, :kind_of => String, :name_attribute => true
attribute :test, :kind_of => String, :required => true
attribute :repair, :kind_of => String, :required => true
