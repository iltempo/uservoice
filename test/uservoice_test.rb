require "test_helper"

class UservoiceControllerTest < ActionController::TestCase
  tests UservoiceTestController

  def test_config_javascript_default
    get :config_js_default
    assert_match Regexp.new('^\s*<script type="text/javascript">(.*)</script>\s*$', Regexp::MULTILINE), @response.body
    assert_match /var uvOptions = \{.*\}/, @response.body
    assert_match /widget.uservoice.com\/test_script_key.js/, @response.body
  end
end

