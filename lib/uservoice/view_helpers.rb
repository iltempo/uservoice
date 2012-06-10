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
      config = Uservoice.config
      script_key = config[:script_key]
      subdomain = config[:subdomain]
      sso_key = config[:sso_key]

      if options[:sso] && options[:sso][:guid]
        sso_data = options.delete(:sso)
        options.merge!({:params => {:sso => Uservoice::Token.new(subdomain, sso_key, sso_data).to_s}})
      end

      script = <<-EOS
        <script type=\"text/javascript\">
          var uvOptions = #{options.to_json};
          (function() {
            var uv = document.createElement('script');
            uv.type = 'text/javascript'; uv.async = true;
            uv.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'widget.uservoice.com/#{script_key}.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(uv, s);
          })();
        </script>
      EOS

      script.html_safe
    end

  end
end
