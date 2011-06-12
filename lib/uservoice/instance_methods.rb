# This module holds all instance methods to be
# included into ActionController::Base class
# for enabling uservoice in a Rails app.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

require "erb"

module Uservoice
  module InstanceMethods

    # Making helper method available when module
    # gets included into ActionController::Base.
    #
    def self.included(mod)
      mod.send(:helper_method, :uservoice_configuration)
    end

    # Set uservoice configuration file path.
    # Can be overridden.
    #
    def uservoice_configuration_file #:nodoc:
      "#{::Rails.root}/config/uservoice.yml"
    end

    # Returns the uservoice configuration hash.
    # It's been lazy loaded and cached in the controller class.
    #
    def uservoice_configuration
      @@uservoice_configuration ||= begin
        config = ERB.new(IO.read(uservoice_configuration_file)).result
        configuration = YAML::load(config)
        HashWithIndifferentAccess.new(configuration)
      end
    end

  end
end
