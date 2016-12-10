class SendWelcomeMail

	include Sidekiq::Worker

	def perform(user_email, user_name)
		MailClient.new.send_mail(user_email, "Activate your account", "Welcome #{@user_name}, Please activate your account by clicking this link #{ENV['ROOT_URL']}")
	end
	
end