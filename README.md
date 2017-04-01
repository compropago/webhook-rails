## ComproPago - Webhook Receptor
Crea un Receptor de Webhooks en <b>Ruby on Rails</b> para recibir notificaciones de eventos que ocurren en tu cuenta de ComproPago.

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
	 "id": "ch_2a6dc1c2-45e6-4a95-85e0-c111acc8dfc6",
	 "type": "charge.pending",
	 "object": "charge",
	 "created": "1424024955774",
	 "paid": true,
	 "amount": "1000.00",
	 "livemode": true,
	 "currency": "mxn",
	 "refunded": false,
	 "fee": "32.00",

	 "fee_details": {
	    "amount": "32.00",
	    "currency": "mxn",
	    "type": "compropago_fee",
	    "description": "Honorarios de ComproPago",
	    "application": null,
	    "amount_refunded":0,
	    "tax": "0.944"
	 },	 

	 "order_info": {
	 	"order_id": "FBIPC",
	    "order_price": "1000.0",
	    "order_name": "Nokia 552",
	    "payment_method": "cash",
	    "store": "SEVEN_ELEVEN",
	    "country": "MX",	    
	    "image_url": "https://aws.amazon.com/5f437",
	    "success_url": "https://mystore.com/success-ur"
	 },	 

	 "customer": {
	 	"customer_name": "Alejandra Leyva",
        "customer_email": "noreply@compropago.com",
        "customer_phone": "2221515801"
	 },

	 "captured": true,
	 "failure_message": null,
	 "failure_code": null,
	 "amount_refunded": 0,
	 "description": "Estado del pago - ComproPago",
	 "dispute": ,
	 "api_version": "1.1"
    }

## Controllers
Configura el controlador que se convertirá en receptor de Webhook:

	class WebhooksController < ApplicationController

  	  ## Si tu APP no usa Rails 4, OMITE la siguiente línea:
  	  skip_before_action :verify_authenticity_token, only: [:receiver]

  	  require 'json'

  	  def receiver
    	## Recibe el objeto de la notificación en JSON
    	request.body.rewind
   		data_json = JSON.parse request.body.read
     	  ## Haz algo con data_json, por ejemplo:
     	  ## - Para la neuva versión del API 
     	  ##   @payment = Payment.find_by_id(data_json['id'].to_i)

     	  ## - Para la versión anterior del API
     	  ##   @payment = Payment.find_by_id(data_json['data']['object']['id'].to_i)
  	  end
	end

## Routes
Configura la ruta de la acción Receiver para aceptar llamadas POST.

    post "webhooks/receiver"

##Información Adicional
Prueba si tu Webhook está recibiendo notificaciones en la sección **panel/webhooks** dentro del Panel de Control en tu cuenta de ComproPago. Recomendamos usar <a href="https://www.runscope.com">Runscope</a> para hacer el debugging de tu receptor de Webhooks. Puedes usar esta URL: <a href="https://webhook-rails.herokuapp.com/webhooks/receiver">https://webhook-rails.herokuapp.com/webhooks/receiver</a> para observar la respuesta que debe arrojar tu receptor.

##Soporte
Si necesitas ayuda, abre un <a href="https://github.com/compropago/webhook-rails/issues">Issue en Github</a> o envíanos un email a <a href="mailto:soporte@compropago.com?Subject=Soporte" target="_top">soporte@compropago.com</a>, uno de nuestros expertos estará encantado de ayudarte.
