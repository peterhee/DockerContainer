'use strict';

const express = require('express');

// Constants
const PORT = 3001;
const HOST = '0.0.0.0';
const OS = require('os');

//App
let app = express();
let hostname = OS.hostname();

app.get("/", (req, res) =>
{
   res.send('Hello World - Hostname: ${hostname}\n');
});

app.listen(PORT, HOST);
console.log('Running in http://${HOST}:${PORT}');
