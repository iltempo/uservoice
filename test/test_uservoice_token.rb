require 'helper'

class UservoiceTokenTest < Test::Unit::TestCase

  def setup
    @key = 'test'
    @api_key = 'testapikey'
    @user_data = {:guid => 123}
    @token = Uservoice::Token.new(@key, @api_key, @user_data)
  end

  def test_token_does_not_contain_line_breaks
    assert_no_match /\n/, @token.to_s
  end

  def test_can_be_decrypted
    crypt_key = EzCrypto::Key.with_password(@key, @api_key)
    encrypted_data = Base64::decode64(CGI.unescape(@token.data))
    data = JSON.parse(crypt_key.decrypt(encrypted_data)).symbolize_keys

    assert_equal @user_data, data
  end

end
