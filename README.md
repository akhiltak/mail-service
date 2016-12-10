# README

An integration of a Rails application with the Mailgun API

Rails app integrated with Mailgun 

* Ruby version - 2.3.0

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


