Webhook::Application.routes.draw do
  root :to => "webhooks#index"
  post "webhooks/receiver"
end