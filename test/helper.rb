require 'rubygems'
require 'test/unit'

require 'active_support'
require 'active_support/test_case'

require 'action_controller'
require 'action_controller/test_process'

require 'rails_generator'
require 'rails_generator/scripts/generate'
generator_source = Rails::Generator::PathSource.new(:uservoice, File.dirname(__FILE__) + '/../generators')
Rails::Generator::Base.append_sources(generator_source)

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'uservoice'

class Test::Unit::TestCase
end

begin
  require 'redgreen' unless ENV['TM_FILENAME']
rescue LoadError
end
