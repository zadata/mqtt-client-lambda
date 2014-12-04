// Generated by CoffeeScript 1.8.0
var context, event, handler;

handler = require('./index').handler;

context = {
  done: function(cb, result) {
    console.log("DONE: ", result);
    process.exit(0);
  }
};

event = {
  "topic": "my-topic",
  "value": "hello, lambda from test",
  "retain": false
};

handler(event, context);