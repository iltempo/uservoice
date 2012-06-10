require "ezcrypto"

module Uservoice
end

require "uservoice/config"
require "uservoice/token"
require "uservoice/view_helpers"

ActionView::Base.send(:include, Uservoice::UservoiceViewHelpers)