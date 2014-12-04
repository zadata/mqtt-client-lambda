mqtt = require('mqtt')

MQTT_USER     = "your MQTT username on ZADATA"
MQTT_PWD      = "your MQTT password on ZADATA"
MQTT_CLIENTID = "some_client_id"

console.log "Loading event"

exports.handler = (event, context) ->
  console.log "event =\n", event

  client = mqtt.connect("mqtt://#{MQTT_USER}:#{MQTT_PASS}@mqtt.zadata.com:1883?clientId=#{MQTT_CLIENTID}")
  console.log "after mqtt.connect()"

  client.publish event.topic, event.value, 
    retain: (event.retain? and event.retain)
  console.log "after client.publish()"

  client.end()
  console.log "after client.end()"

  client.on "close", (-> context.done null, "SUCCESS")
  client.on "error", (-> context.done null, "ERROR")

  return
