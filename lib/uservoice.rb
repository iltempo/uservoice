module Uservoice
end

require 'cgi'
require 'ezcrypto'
require 'uservoice/token'
require 'uservoice/instance_methods'
require 'uservoice/view_helpers'

ActionController::Base.send(:include, Uservoice::InstanceMethods)
ActionController::Base.send(:helper_method, :uservoice_configuration)
ActionView::Base.send(:include, Uservoice::UservoiceViewHelpers)
