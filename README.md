## ComproPago - Webhook Receptor
Crea un Receptor de Webhooks en Ruby on Rails para recibir notificaciones de eventos que ocurren en tu cuenta de ComproPago.

## Webhooks
Las notificaciones vía Webhook son mensajes que indican que un evento específico ha ocurrido (<i>ejemplo: un pago exitoso de uno de tus clientes</i>). Dichas notificaciones son enviadas desde ComproPago (vía HTTP POST) a una o más URL que tu determines.

Cada vez que alguno de los siguientes eventos ocurra, te mandaremos una notificación a la URL que prefieras.
<table class="table">
	<tr>
		<th>Tipo de Evento</th>
		<th>Descripción</th>
	</tr>
	<tr>
		<td><span class="label" id="label-event">charge.pending</span></td>
		<td>El pago está en espera de ser confirmado.</td>
	</tr>
	<tr>
		<td><span class="label" id="label-event">charge.success</span></td>
		<td>El pago ha sido confirmado exitosamente.</td>
	</tr>
</table>

La notificación está acompañada de un objeto en JSON que contiene la información del evento recibido.

	{
	  "type": "charge.pending",
	  "object": "event",

	  "data": {
		"object": {
		 "id": "ch_2a6dc1c2-45e6-4a95-85e0-c111acc8dfc6",
		 "object": "charge",
		 "created": "2013-09-17T23:02:41.860Z",
		 "paid": true,
		 "amount": <span class="response_string">"1000.00"</span>,
		 "currency": <span class="response_string">"mxn"</span>,
		 "refunded": <span class="response_boolean">false</span>,
		 "fee": <span class="response_string">"32.00"</span>,

		 "fee_details": [
		   {
		    "amount": <span class="response_string">"32.00"</span>,
		    "currency": <span class="response_string">"mxn"</span>,
		    "type": <span class="response_string">"compropago_fee"</span>,
		    "description": <span class="response_string">"Honorarios de ComproPago"</span>,
		    "application": <span class="response_boolean">null</span>,
		    "amount_refunded": <span class="response_boolean">0</span>
		   }
		 ],

		 "payment_details": [
		   {
		    "object": <span class="response_string">"cash"</span>,
		    "store": <span class="response_string">"Waltmart"</span>,
		    "country": <span class="response_string">"MX"</span>,
		    "product_id": <span class="response_string">"FBIPC5"</span>,
		    "product_price": <span class="response_string">"1000.00"</span>,
		    "product_name": <span class="response_string">"Nokia 5520"</span>,
		    "image_url": <span class="response_string">"https://aws.amazon.com/5f4373"</span>,
		    "success_url": <span class="response_string">"https://mystore.com/success-url"</span>,
		    "customer_name": <span class="response_string">"Alejandra Leyva"</span>,
		    "customer_email": <span class="response_string">"ale.leyva231@gmail.com"</span>,
		    "customer_phone": <span class="response_string">"2221515467"</span>
		   }
		 ],

		 "captured": <span class="response_boolean">true</span>,
		 "failure_message": <span class="response_boolean">null</span>,
		 "failure_code": <span class="response_boolean">null</span>,
		 "amount_refunded": <span class="response_boolean">0</span>,
		 "description": <span class="response_string">"Estado del pago - ComproPago"</span>,
		 "dispute": <span class="response_boolean">null</span>
		}
	  }
    }

## Controllers
Configura el controlador que se convertirá en receptor de Webhook:

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

## Routes
Configura la ruta de la acción Receiver para aceptar llamadas POST.
	match "webhooks/receiver" => "webhooks#receiver", :via => :post

##Información Adicional
Prueba si tu Webhook está recibiendo notificaciones en la sección **panel/webhooks** dentro del Panel de Control en tu cuenta de ComproPago.

##Soporte
Si necesitas ayuda envíanos un email a <a href="mailto:soporte@compropago.com?Subject=Soporte" target="_top">soporte@compropago.com</a>, uno de nuestros expertos estará encantado de ayudarte.