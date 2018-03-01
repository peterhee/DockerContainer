// 'use strict';
var express = require('express'),
    uuid = require('uuid'),
    os = require('os');

// Constants
var PORT = 40000;
var HOST = '0.0.0.0';
var os = require('os');

//App
var app = express();
var hostname = os.hostname();

app.get("/uuid", (req, res) =>
{
   var message = ["UUID =", uuid.v4(), "Container =", hostname, '\n'];
   res.send(message.join(" "));
   res.json({"UUID": uuid.v4(), "Container": hostname, "Port": PORT, "Hostname": HOST}); 
});

app.listen(PORT, HOST);
var logentry = ['Running generate random UUID in http://', HOST, ':', PORT,' Container = ', hostname];
console.log(logentry.join(""));
