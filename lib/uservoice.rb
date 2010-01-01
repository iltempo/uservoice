path = File.join(File.dirname(__FILE__), 'uservoice')
$LOAD_PATH << path
ActiveSupport::Dependencies.load_paths << path
ActiveSupport::Dependencies.load_once_paths.delete(path)

module Uservoice
end

require 'class_methods'
require 'instance_methods'

module ActionController #:nodoc:
  class Base #:nodoc:
    cattr_accessor :uservoice_configuration
    before_filter :uservoice_init
    helper :uservoice

    include Uservoice::InstanceMethods
    extend Uservoice::ClassMethods
  end
end