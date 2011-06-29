require 'rubygems'
require 'test/unit'
require 'mocha'

require File.dirname(__FILE__) + "/../lib/captchatrader"

class APITest < Test::Unit::TestCase
  def setup
    # Captchatrader::API.username = "myusername"
    # Captchatrader::API.password = "mypasswordorkey"
    # Captchatrader::API.api_key  = "myapikey"
  end

  def test_version
    assert_match /\A\d+\.\d+\.\d+\z/, Captchatrader::VERSION
  end
  
  
  def test_credits_success
    Captchatrader::API.stubs(:get).returns(credits_response_success)
    assert_equal 115, Captchatrader::API.credits
  end

  def test_credits_error
    Captchatrader::API.stubs(:get).returns(credits_response_error)
    assert_raise Captchatrader::API::Error do 
      Captchatrader::API.credits
    end
  end
  
  
  def test_submit_success
    Captchatrader::API.stubs(:post).returns(submit_response_success)
    submission = Captchatrader::API.submit(remote_image_url, :url)
    assert_equal "iollowi over", submission.to_s
    assert_equal 10112496, submission.ticket
  end
  
  def test_respond_success
    Captchatrader::API.stubs(:post).returns(respond_response_success)
    assert_equal true, Captchatrader::API.respond('10112946', false)
  end
  
  
  private
  
  def credits_response_success
    "[0,115]"
  end
  
  def credits_response_error
    "[-1,\"Invalid User\"]"
  end
  
  def submit_response_success
    "[10112496, \"iollowi over\"]"
  end
  
  def respond_response_success
    "[0]"
  end
  
  def remote_image_url
    "http://www.google.com/recaptcha/api/image?c=03AHJ_VusxYUTFpsrUDp7jRFyWUAiOswMofRqqqG5fDyn9LE-GHseucckAY7JKYO3UyP-Y1cN1mOj9WmaMQ8G43Ws3LC7djbXzU6_ppyyLGZY6vomOTm_IvBQdwJzgeMn6bqZMKk7UPzeeA9k5bZhU9X_7ozm3PzhRtQ"
  end
end