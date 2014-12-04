### 
Test AWS Lambda function publishing custom event to ZADATA MQTT service

@author Zvi Avraham <zvi-AT-zadata-DOT-com>
@copyright 2014 ZADATA Ltd. All Rights Reserved.
###

handler = require('./index').handler

context = {
  done: (cb, result) ->
    console.log "DONE: ", result
    process.exit 0
    return 
}

event = {
  "topic": "my-topic",
  "value": "hello, lambda from test",
  "retain": false
}

handler event, context
