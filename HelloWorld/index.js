// 'use strict';
var express = require('express'),
    os = require('os');

// Constants
var PORT = 30000;
var HOST = '0.0.0.0';

//App
var app = express();
var hostname = os.hostname();

app.get("/", (req, res) =>
{
   var message = ["Hello World - Hostname", hostname, '\n'];
   res.send(message.join(" "));
});

app.listen(PORT, HOST);
var logentry = ['Running in http://', HOST, ':', PORT,' Container: ', hostname];
console.log(logentry.join(""));
