# This module holds all class methods to be
# included into ActionController::Base class
# for enabling uservoice in a Rails app.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

module Uservoice
  module ClassMethods

    # Loads uservoice configuration from yaml file.
    #
    def enable_uservoice
      self.uservoice_configuration ||= begin
        configuration = YAML::load(IO.read(self.uservoice_configuration_file))
        HashWithIndifferentAccess.new(configuration['uservoice_options'])
      end
    end

    def uservoice_configuration_file #:nodoc:
      "#{RAILS_ROOT}/config/uservoice.yml"
    end

  end
end
