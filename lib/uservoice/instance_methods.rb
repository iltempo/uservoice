# This module holds all instance methods to be
# included into ActionController::Base class
# for enabling uservoice in a Rails app.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

module Uservoice
  module InstanceMethods

    # Set uservoice configuration file path.
    # Can be overridden.
    #
    def uservoice_configuration_file #:nodoc:
      "#{RAILS_ROOT}/config/uservoice.yml"
    end

    # Generates token for uservoice single sign-on
    # that will be delivered by uservoice helper.
    # See https://ACCOUNT.uservoice.com/admin2/docs#/sso for
    # properties available.
    #
    def set_uservoice_sso(user_data)
      @uservoice_sso_token = Uservoice::Token.new(
        uservoice_configuration['uservoice_options']['key'],
        uservoice_configuration['uservoice_api']['api_key'],
        user_data)
    end

    def uservoice_configuration
      @@uservoice_configuration = begin
        configuration = YAML::load(IO.read(uservoice_configuration_file))
        HashWithIndifferentAccess.new(configuration)
      end
    end

  end
end
