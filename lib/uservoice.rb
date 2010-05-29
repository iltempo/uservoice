module Uservoice
end

require 'cgi'
require 'rubygems'
require 'ezcrypto'
require 'uservoice/token'
require 'uservoice/instance_methods'
require 'uservoice/view_helpers'

module ActionController #:nodoc:
  class Base #:nodoc:
    before_filter :load_uservoice_config

    include Uservoice::InstanceMethods

    def self.enable_uservoice
      warn "[DEPRECATION] 'enable_uservoice' is deprecated. Uservoice is loaded by default in every controller now."
    end
  end
end

ActionView::Base.send(:include, Uservoice::UservoiceViewHelpers)
