class UservoiceGenerator < Rails::Generator::Base

  def manifest
    unless [2, 3].include?(args.length)
      puts usage_message
      exit 1
    end

    record do |m|
      m.directory('config')
      m.template 'uservoice_template.yml', 'config/uservoice.yml'
    end
  end

end
