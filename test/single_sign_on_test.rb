require 'test_helper'

class SingleSignOnControllerTest < ActionController::TestCase
  tests UservoiceTestController

  def test_sso_token_set
    get :action_with_sso
    assert_match Regexp.new('<script type="text/javascript">.*var uvOptions = .*\s*</script>', Regexp::MULTILINE), @response.body
    assert_match /"params":\{"sso":".*"\}/, @response.body
  end
end
