require 'csv'

class MailgunWebhooksController < ApplicationController

	FILENAME = "tmp/webhook_data.csv"

  def click
  	create_file if !File.file?(FILENAME)
  	CSV.open(FILENAME, "a") do |csv|
  		csv << [params["recipient"], params["ip"], params["message-headers"]["subject"], params["event"]]
  	end
  end

  def bounce
  	create_file if !File.file?(FILENAME)
  	CSV.open(FILENAME, "a") do |csv|
  		csv << [params["recipient"], params["ip"], params["message-headers"]["subject"], params["event"]]
  	end
  end

  private

  def create_file
  	CSV.open(FILENAME, "a") do |csv|
  		csv << ["Email Address", "Ip Address", "Message subject", "Webhook type"]
  	end
  end
end
