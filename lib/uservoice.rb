module Uservoice
end

require 'cgi'
require 'ezcrypto'
require 'uservoice/token'
require 'uservoice/instance_methods'
require 'uservoice/view_helpers'

ActionController::Base.send(:include, Uservoice::InstanceMethods)
ActionView::Base.send(:include, Uservoice::UservoiceViewHelpers)
