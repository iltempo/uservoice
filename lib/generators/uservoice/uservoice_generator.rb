class UservoiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  desc "This generator creates a config/uservoice.yml config file"
  def create_config_file
    template "config/uservoice.yml"
  end
end
