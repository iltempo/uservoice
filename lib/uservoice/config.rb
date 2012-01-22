require "erb"
require "active_support/hash_with_indifferent_access"

module Uservoice
  class Config < ::HashWithIndifferentAccess
    def initialize
      load_from_file!
    end

    private
    # Set uservoice configuration file path.
    # Can be overridden.
    #
    def uservoice_configuration_file #:nodoc:
      "#{::Rails.root}/config/uservoice.yml"
    end

    # Returns the uservoice configuration hash.
    # It's been lazy loaded and cached in the controller class.
    #
    def load_from_file!
      return unless File.exists?(uservoice_configuration_file)

      config = ERB.new(IO.read(uservoice_configuration_file)).result
      configuration = YAML::load(config)
      self.merge!(configuration["uservoice"])
    end
  end

  def self.config
    @_config ||= Uservoice::Config.new
  end

  def self.reset_config
    remove_instance_variable :@_config if defined?(@_config)
  end
end