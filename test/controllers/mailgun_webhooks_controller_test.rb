require 'test_helper'

class MailgunWebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get click" do
    get mailgun_webhooks_click_url
    assert_response :success
  end

  test "should get bounce" do
    get mailgun_webhooks_bounce_url
    assert_response :success
  end

end
