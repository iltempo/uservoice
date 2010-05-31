require 'helper'

class MyUservoiceSsoController < ActionController::Base

  def uservoice_configuration_file
    File.dirname(__FILE__) + '/uservoice_test.yml'
  end

  def action_with_sso
    render :inline => '<%= uservoice_config_javascript(:sso => {:guid => 123, :display_name => "Bancheff", :email => "chef@bahn.de"}) %>'
  end

end

class UservoiceSsoTest < ActionController::TestCase
  tests MyUservoiceSsoController

  def setup
    @my_controller = MyUservoiceSsoController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new

    ActionController::Routing::Routes.draw do |map|
      map.connect 'action_with_sso', :controller => 'my_uservoice_sso', :action => :action_with_sso
    end
  end

  def test_sso_token_set
    get :action_with_sso
    assert_match Regexp.new('<script type="text/javascript">.*var uservoiceOptions = .*\s*</script>', Regexp::MULTILINE), @response.body
    assert_match /"params":\{"sso":".*"\}/, @response.body
  end

  def test_api_key_not_to_appear
    get :action_with_sso
    assert_no_match /api_key/, @response.body
  end
end
