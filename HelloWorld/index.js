'use strict';

const express = require('express');

// Constants
const PORT = 3001;
const HOST = '0.0.0.0';
const os = require('os');

//App
let app = express();
let hostname = os.hostname();

app.get("/", (req, res) =>
{
   var message = ["Hello World - Hostname", hostname, '\n'];
   res.send(message.join(" "));
});

app.listen(PORT, HOST);
var logentry = ['Running in http://', HOST, ':', PORT,' Hostname: ', hostname];
console.log(logentry.join(""));
