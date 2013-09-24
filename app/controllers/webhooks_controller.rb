class WebhooksController < ApplicationController
  ## Si tu APP no usa Rails 4, OMITE la siguiente línea:
  skip_before_action :verify_authenticity_token
  require 'json'

  def receiver
     ## Recibe el objeto de la notificación en JSON
    request.body.rewind
    data_json = JSON.parse request.body.read
    render json: data_json
  end

  def index
  end
end
