require 'test_helper'

class MailgunWebhooksControllerTest < ActionDispatch::IntegrationTest

	setup do
		@params = {
			"recipient":"a@b.c",
			"ip":"127.0.0.1",
			"message-headers":{
				"subject":"this is a test"
			}
		}
	end

  test "should get click" do
  	@params.merge!("event":"clicked")
    get mailgun_webhooks_click_url @params
    assert_response :success
  end

  test "should get bounce" do
  	@params.merge!("event":"bounced")
    get mailgun_webhooks_bounce_url @params
    assert_response :success
  end

end
