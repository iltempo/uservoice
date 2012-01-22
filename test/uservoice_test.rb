require "test_helper"

class UservoiceControllerTest < ActionController::TestCase
  tests UservoiceTestController

  def setup
  end

  def test_config_javascript_default
    get :config_js_default
    assert_match Regexp.new('^\s*<script type="text/javascript">(.*)</script>\s*$', Regexp::MULTILINE), @response.body
    assert_match /var uvOptions = \{.*\}/, @response.body
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

