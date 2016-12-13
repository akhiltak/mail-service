# README

An integration of a Rails application with the Mailgun API
 * Sends a welcome email on user creation
 * If email is not opened for 2 days (and not supressed by user), sends a reminnder email
 * Test suite to test this functionality
 * Webhooks to find out list of clicked and bounced emails from Mailgun

Rails app integrated with Mailgun 

* Ruby version - 2.3.0
* Rails version - 5.0

* Configuration
 - Requires redis and sidekiq gem for background processes

* Database creation
	rake db:create
	rake db:migrate

* How to run the test suite
	- from root folder, run 'rspec'

* Services (job queues, cache servers, search engines, etc.)
 - run the following along with rails server
 	- redis-server
 	- sidekiq


