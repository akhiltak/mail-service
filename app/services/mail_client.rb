require 'mailgun'

class MailClient

	def initialize
		# initializing Mailgun client
		@mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
	end

	# Sends a mail to a given email id
	# Can simply add tags using params 'o:tag' to classify messages 
	def send_mail(send_to, subject, text)

		# setting message contents
		message_params =  { 
			from: ENV['SENDER'],
			to:   send_to,
			subject: subject,
			text:    text,
		}

		# Sending message through the client
		@mg_client.send_message(ENV['DOMAIN'], message_params)
	end

	# Get all sent emails from this particular domain, irrespective of failures
	def get_sent_mails

		# setting request params
		params = {
			begin: Time.zone.now.to_i,
			ascending: "no",
			pretty: "yes"
		}

		result = @mg_client.get("#{ENV['DOMAIN']}/events", params).to_h
		return result["items"]
	end

	# Returns a list of email ids which have either bounced, being unsubscribed or have complaints against them
	# Currently, no pagination step implemented, but should be added for large number of results
	def get_suppression_list
		result = []

		# get bounced email ids
		result << @mg_client.get("#{ENV['DOMAIN']}/bounces").to_h["items"] || []
		# get unsubscribed email ids
		result << @mg_client.get("#{ENV['DOMAIN']}/unsubscribes").to_h["items"] || []
		# get complaint email ids
		result << @mg_client.get("#{ENV['DOMAIN']}/complaints").to_h["items"] || []

		return result.flatten.uniq.map{ |e| e["address"]}
	end

	# Returns true/false based on whether given email belongs in the suppression list
	def email_suppressed?(email)
		s_list = get_suppression_list
		return s_list.include?(email)
	end


	# Returns whether user with given email has even opened the activation mail
	def activation_mail_opened?(email)

		# setting request params
		params = {
			begin: Time.zone.now.to_i,
			ascending: "no",
			event: "opened",
			subject: "Activate your account",
			to: email,
			pretty: "yes"
		}

		result = @mg_client.get("#{ENV['DOMAIN']}/events", params).to_h
		return !result["items"].blank?
	end
end