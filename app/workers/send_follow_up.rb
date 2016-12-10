class SendFollowUp

	include Sidekiq::Worker

	def perform(user_email, user_name)
		mailer = MailClient.new

		if !mailer.activation_mail_opened?(user_email) and !mailer.email_suppressed?(user_email)
			mailer.send_mail(user_email, "Waiting to hear from you", "#{user_name}, we still haven't seen you account activated.") 
		end
	end 
	
end