Webhook::Application.routes.draw do
  match "webhooks/receiver" => "webhooks#receiver", :via => :post
end
