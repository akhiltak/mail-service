require 'rails_helper'

RSpec.describe MailClient do 

	let(:params) {
		{
			to: "test@b.com",
			subject: "test",
			text: "test mail"
		}
	}

	before(:each) do
		RestClient.post("https://api:#{ENV['MAILGUN_API_KEY']}"\
                  "@api.mailgun.net/v3/#{ENV['DOMAIN']}/bounces",
                  :address => 'darth@starwars.com')
  end

	describe "send_mail" do
		it "should send a mail" do
			MailClient.new.send_mail(params[:to],params[:subject],params[:text])
		end
	end

	describe "get_sent_mails" do
		it "get sent emails" do
			response = MailClient.new.get_sent_mails
			expect(response).not_to be_empty
		end
	end

	describe "get_suppression_list" do
		it "get suppression list" do
			response = MailClient.new.get_suppression_list
			expect(response).not_to be_empty
		end
	end

	describe "email_suppressed?" do
		it "check if email is suppressed" do
			response = MailClient.new.email_suppressed?("darth@starwars.com")
			expect(response).to eq(true)
		end
	end

	describe "activation_mail_opened?" do
		it "if welcome/activation email was opened" do
			response = MailClient.new.activation_mail_opened?(params[:to])
			expect(response).to eq(false)
		end
	end

	
end