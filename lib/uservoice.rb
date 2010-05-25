path = File.join(File.dirname(__FILE__), 'uservoice')
$LOAD_PATH << path
ActiveSupport::Dependencies.load_paths << path
ActiveSupport::Dependencies.load_once_paths.delete(path)

module Uservoice
end

require 'cgi'
require 'rubygems'
require 'ezcrypto'
require 'uservoice_token'
require 'instance_methods'

module ActionController #:nodoc:
  class Base #:nodoc:
    helper :uservoice
    before_filter :load_uservoice_config

    include Uservoice::InstanceMethods

    def self.enable_uservoice
      warn "[DEPRECATION] 'enable_uservoice' is deprecated. Uservoice is loaded by default in every controller now."
    end
  end
end
