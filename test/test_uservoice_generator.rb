require 'helper'

class UservoiceGeneratorTest < Test::Unit::TestCase

  def setup
    FileUtils.mkdir_p(fake_rails_root)
    @original_files = file_list
  end

  def teardown
    FileUtils.rm_r(fake_rails_root)
  end

  def test_generates_correct_files
    run_generator('uservoice', 'test', '12345')
    new_files = file_list - @original_files
    expected_files = ['config',
                      'config/uservoice.yml']

    assert_equal expected_files, new_files
  end

  def test_config_file_contains_settings
    run_generator('uservoice', 'my_name', '98765')
    config = read_config_file
    assert_equal 'my_name', config['uservoice_options']['key']
    assert_equal 'my_name.uservoice.com', config['uservoice_options']['host']
    assert_equal 98765, config['uservoice_options']['forum']
  end

  def test_config_file_contains_api_key_if_given
    run_generator('uservoice', 'my_name', '98765', 'testapikey')
    config = read_config_file
    assert_equal 'testapikey', config['uservoice_api']['api_key']
  end

  private

    def fake_rails_root
      File.join(File.dirname(__FILE__), 'rails_root')
    end

    def file_list
      Dir.chdir(fake_rails_root) do
        Dir.glob('**/*')
      end
    end

    def read_config_file
      YAML::load(IO.read(File.join(fake_rails_root, 'config/uservoice.yml')))
    end

    def run_generator(*options)
      Rails::Generator::Scripts::Generate.new.run(options, :destination => fake_rails_root, :quiet => true)
    end

end
