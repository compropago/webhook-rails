Webhook::Application.routes.draw do
  #match "webhooks/receiver" => "webhooks#receiver", :via => :post
  post "webhooks/receiver" => "webhooks#receiver"
end
