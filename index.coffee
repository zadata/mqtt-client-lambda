### 
AWS Lambda function to publish custom events to ZADATA MQTT service

@author Zvi Avraham <zvi-AT-zadata-DOT-com>
@copyright 2014 ZADATA Ltd. All Rights Reserved.
###

mqtt = require('mqtt')

MQTT_HOST     = "mqtt.zadata.com"
MQTT_PORT     = 1883
MQTT_USER     = "your MQTT username on ZADATA"
MQTT_PWD      = "your MQTT password on ZADATA"
MQTT_CLIENTID = "some_client_id"

console.log "Loading event"

exports.handler = (event, context) ->
  console.log "event =\n", event

  client = mqtt.connect("mqtt://#{MQTT_USER}:#{MQTT_PASS}@#{MQTT_HOST}:#{MQTT_PORT}?clientId=#{MQTT_CLIENTID}")
  console.log "after mqtt.connect()"

  client.publish event.topic, event.value, 
    retain: (event.retain? and event.retain)
  console.log "after client.publish()"

  client.end()
  console.log "after client.end()"

  client.on "close", (-> context.done null, "SUCCESS")
  client.on "error", (-> context.done null, "ERROR")

  return
