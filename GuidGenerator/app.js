'use strict';

const express = require('express');
const uuid = require('uuid');

// Constants
const PORT = 40000;
const HOST = '0.0.0.0';
const os = require('os');

//App
let app = express();
let hostname = os.hostname();

app.get("/uuid", (req, res) =>
{
   var message = ["UUID =", uuid.v4(), "Container =", hostname, '\n'];
   res.send(message.join(" "));
   res.json({"UUID": uuid.v4(), "Container": hostname, "Port": PORT, "Hostname": HOST}); 
});

app.listen(PORT, HOST);
var logentry = ['Running generate random UUID in http://', HOST, ':', PORT,' Container = ', hostname];
console.log(logentry.join(""));
