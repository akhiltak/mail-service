require 'sidekiq/web'

Rails.application.routes.draw do
  get 'mailgun_webhooks/click'

  get 'mailgun_webhooks/bounce'

  resources :users
  root to: 'welcome#index'
	mount Sidekiq::Web => '/sidekiq'
end
