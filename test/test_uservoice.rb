require 'helper'

class MyUservoiceController < ActionController::Base

  def uservoice_configuration_file
    File.dirname(__FILE__) + '/uservoice_test.yml'
  end

  def assignment
    render :nothing => true
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

  def config_js_erb
    render :inline => "<%= uservoice_config_javascript %>"
  end
end


class UservoiceControllerTest < ActionController::TestCase
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
      map.connect 'config_js_erb', :controller => 'my_uservoice', :action => :config_js_erb
    end
  end

  def test_config_javascript_default
    get :config_js_default
    assert_match Regexp.new('^\s*<script type="text/javascript">(.*)</script>\s*$', Regexp::MULTILINE), @response.body
    assert_match /var uservoiceOptions = \{.*\}/, @response.body
    assert_match /"host":"test.uservoice.com"/, @response.body
    assert_match /"forum":12345/, @response.body
  end

  def test_config_custom_forum
    get :config_js_custom_forum
    assert_match /"forum":815/, @response.body
    assert_no_match /"forum":12345/, @response.body
  end

  def test_config_custom_alignment
    get :config_js_custom_alignment
    assert_match /"forum":12345/, @response.body
    assert_match /"alignment":"right"/, @response.body
  end

  def test_config_erb
    get :config_js_erb
    assert_match /"erb_value":"testing 1 2 3"/, @response.body
  end
end

