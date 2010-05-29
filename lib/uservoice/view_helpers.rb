# This module holds all frontend helper methods
# for uservoice in a Rails app.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

module Uservoice
  module UservoiceViewHelpers

    # Renders javascript to configure uservoice feedback widget. Options
    # can be used to override default settings like forum id.
    # e.g. uservoice_config_javascript(forum_id => 12345)
    # See https://ACCOUNT.uservoice.com/admin2/docs#/widget for options
    # available.
    #
    def uservoice_config_javascript(options={})
      config = @uservoice_configuration['uservoice_options'].dup
      config.merge!(options)

      if @uservoice_sso_token
        config.merge!({:params => {:sso => @uservoice_sso_token.data}})
      end

      <<-EOS
        <script type=\"text/javascript\">
          var uservoiceOptions = #{config.to_json};
        </script>
      EOS
    end

  end
end
