require 'helper'

class MyUservoiceController < ActionController::Base
  def self.uservoice_configuration_file
    File.dirname(__FILE__) + '/uservoice_test.yml'
  end
  enable_uservoice

  def assignment
    render :text => nil
  end

  def config_js_default
    render :inline => "<%= uservoice_config_javascript %>"
  end

  def config_js_custom_forum
    render :inline => "<%= uservoice_config_javascript(:forum => 815) %>"
  end

  def config_js_custom_alignment
    render :inline => "<%= uservoice_config_javascript(:alignment => 'right') %>"
  end
end

class UservoiceTest < ActiveSupport::TestCase

  def setup
    @my_controller = MyUservoiceController.new
  end

  ['uservoice_configuration_file'].each do |method|
    test "should add class method '#{method}' to controller classes" do
      assert MyUservoiceController.methods.include?(method)
    end
  end

  ['uservoice_init'].each do |method|
    test "should add instance method '#{method}' to controller classes" do
      assert @my_controller.methods.include?(method)
    end
  end
end

class MyUservoiceControllerTest < ActionController::TestCase
  tests MyUservoiceController

  def setup
    @my_controller = MyUservoiceController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new

    ActionController::Routing::Routes.draw do |map|
      map.connect 'assignment', :controller => 'my_uservoice', :action => :assignment
      map.connect 'config_js_default', :controller => 'my_uservoice', :action => :config_js_default
      map.connect 'config_js_custom_forum', :controller => 'my_uservoice', :action => :config_js_custom_forum
      map.connect 'config_js_custom_alignment', :controller => 'my_uservoice', :action => :config_js_custom_alignment
    end
  end

  def test_controller
    get :assignment
    config = assigns('uservoice_configuration')
    assert config.is_a?(Hash)
    assert_equal 'test', config['key']
  end

  def test_config_javascript_default
    get :config_js_default
    assert_match Regexp.new('<script type="text/javascript"> var uservoiceOptions = .*</script>'), @response.body
    assert_match Regexp.new('"host":"test.uservoice.com"'), @response.body
    assert_match Regexp.new('"forum":12345'), @response.body
  end

  def test_config_custom_forum
    get :config_js_custom_forum
    assert_match Regexp.new('<script type="text/javascript"> var uservoiceOptions = .*</script>'), @response.body
    assert_match Regexp.new('"forum":815'), @response.body
    assert_no_match Regexp.new('"forum":12345'), @response.body
  end

  def test_config_custom_alignment
    get :config_js_custom_alignment
    assert_match Regexp.new('<script type="text/javascript"> var uservoiceOptions = .*</script>'), @response.body
    assert_match Regexp.new('"forum":12345'), @response.body
    assert_match Regexp.new('"alignment":"right"'), @response.body
  end
end

