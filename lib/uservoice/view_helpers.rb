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
      config = uservoice_configuration['uservoice_options'].dup
      config.merge!(options)

      if config[:sso] && config[:sso][:guid]
        config.merge!(:params => {:sso => Uservoice::Token.new(
          uservoice_configuration['uservoice_options']['key'],
          uservoice_configuration['uservoice_api']['api_key'],
          config.delete(:sso)).to_s})
      end

      <<-EOS
        <script type=\"text/javascript\">
          function _loadUserVoice() {
            var s = document.createElement('script');
            s.setAttribute('type', 'text/javascript');
            s.setAttribute('src', ("https:" == document.location.protocol ? "https://" : "http://") + "cdn.uservoice.com/javascripts/widgets/tab.js");
            document.getElementsByTagName('head')[0].appendChild(s);
          }
          _loadSuper = window.onload;
          window.onload = (typeof window.onload != 'function') ? _loadUserVoice : function() { _loadSuper(); _loadUserVoice(); };
          var uservoiceOptions = #{config.to_json};
        </script>
      EOS
    end

  end
end
