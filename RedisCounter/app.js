var express = require('express'),
    http = require('http'),
    redis = require('redis'),
    os = require('os');

var app = express();
var container = os.hostname();

// Constants
var DockerServiceName = 'redis';
var DockerServicePort = '6379'
var PORT = 30000;
var HOST = '0.0.0.0';


console.log(process.env.REDIS_PORT_6379_TCP_ADDR + ':' + process.env.REDIS_PORT_6379_TCP_PORT);

// APPROACH 1: Using environment variables created by Docker
// var client = redis.createClient(
// 	process.env.REDIS_PORT_6379_TCP_PORT,
//   	process.env.REDIS_PORT_6379_TCP_ADDR
// );

// APPROACH 2: Using host entries created by Docker in /etc/hosts (RECOMMENDED)
var client = redis.createClient(DockerServicePort, DockerServiceName);


app.get('/', function(req, res, next) {
  client.incr('counter', function(err, counter) {
    if(err) return next(err);
    res.send('This page has been viewed ' + counter + ' times! - Container: ' + container);
  });
});

http.createServer(app).listen(process.env.PORT || PORT, function() {
  console.log('Listening on port ' + (process.env.PORT || PORT));
});
