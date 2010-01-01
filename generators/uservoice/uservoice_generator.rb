class UservoiceGenerator < Rails::Generator::Base
  def manifest
    unless args.length == 2
      puts usage_message
      exit 1
    end

    record do |m|
      m.directory('config')
      m.template 'uservoice_template.yml', 'config/uservoice.yml'

      m.directory('public/javascripts')
      m.file 'uservoice.js', 'public/javascripts/uservoice.js'
    end
  end
end
