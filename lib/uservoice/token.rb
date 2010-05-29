# This module represents an encrypted token
# to authenticate a user against the uservoice
# service.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

module Uservoice
  class Token
    attr_reader :data

    # Creates a sign-in token to authenticate user against
    # the uservoice service.
    # See https://ACCOUNT.uservoice.com/admin2/docs#/sso for
    # data properties available.
    #
    def initialize(key, api_key, data)
      data.merge!({:expires => (Time.now + 5 * 60).to_s})

      crypt_key = EzCrypto::Key.with_password(key, api_key)
      encrypted_data = crypt_key.encrypt(data.to_json)

      @data = CGI.escape(Base64.encode64(encrypted_data).gsub(/\n/, ''))
    end

    def to_s #:nodoc:
      @data
    end

  end
end
