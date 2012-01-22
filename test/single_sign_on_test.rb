require 'test_helper'

class SingleSignOnControllerTest < ActionController::TestCase
  tests UservoiceTestController

  def test_sso_token_set
    get :action_with_sso
    assert_match Regexp.new('<script type="text/javascript">.*var uvOptions = .*\s*</script>', Regexp::MULTILINE), @response.body
    assert_match /"params":\{"sso":".*"\}/, @response.body
  end

  def test_api_key_not_to_appear
    get :action_with_sso
    assert_no_match /api_key/, @response.body
  end
end
