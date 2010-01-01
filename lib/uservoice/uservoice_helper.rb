# This module holds all frontend helper methods
# for uservoice in a Rails app.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

module UservoiceHelper

  # Renders javascript configuration to be integrated
  # into layout file.
  # Takes a forum id if different from default one.
  #
  def uservoice_config_javascript(options={})
    config = @uservoice_configuration.dup
    config.merge!(options)
    "<script type=\"text/javascript\"> var uservoiceOptions = #{config.to_json}; </script>"
  end

end
