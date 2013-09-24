Webhook::Application.routes.draw do
  #match "webhooks/receiver" => "webhooks#receiver", :via => :post
  root :to => "webhooks#index"

  post "webhooks/receiver"
end
