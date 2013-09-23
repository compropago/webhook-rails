## ComproPago - Webhook Receptor
Crea un Receptor de Webhooks para recibir notificaciones de eventos que ocurren en tu cuenta de ComproPago.

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

## Controllers
Configura el controlador que se convertirá en receptor de Webhook:
<pre>
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
</pre>

## Routes
Configura la ruta de la acción Receiver para aceptar llamadas POST.
<pre><code>match "webhooks/receiver" => "webhooks#receiver", :via => :post</code></pre>

##Información Adicional
Prueba si tu Webhook está recibiendo notificaciones en la sección **panel/webhooks** dentro del Panel de Control de tu cuenta en ComproPago.

##Soporte
Si necesitas ayuda envíanos un email a <a href="mailto:soporte@compropago.com?Subject=Soporte" target="_top">soporte@compropago.com</a>, uno de nuestros expertos estará encantado de ayudarte.