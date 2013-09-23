class WebhooksController < ApplicationController
  ## Si tu APP no usa Rails 4, OMITE la siguiente línea:
  skip_before_action :verify_authenticity_token, only: [:receiver]

  require 'json'

  def receiver
     ## Recibe el objeto de la notificación en JSON
   data_json = JSON.parse request.body.read
     ## Haz algo con data_json, por ejemplo:
     ## @payment = Payment.find_by_id(data_json['data']['object']['id'].to_i)
  end
end
