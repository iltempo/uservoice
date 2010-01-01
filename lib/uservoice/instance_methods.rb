# This module holds all instance methods to be
# included into ActionController::Base class
# for enabling uservoice in a Rails app.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

module Uservoice
  module InstanceMethods

    # Enables uservoice configuration as controller
    # instance variable
    #
    def uservoice_init
      @uservoice_configuration ||= self.class.uservoice_configuration
    end

  end
end
