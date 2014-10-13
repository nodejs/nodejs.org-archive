#!/usr/bin/env node

var http = require('http');
var path = require('path');

var ecstatic = require('ecstatic');

var app = process.argv[2] || 'doc';

var docRoot = path.join(__dirname, '..', '..', 'out', app);

docRoot = path.normalize(docRoot);

var staticServer = ecstatic({
  root: docRoot,
});

var port = +process.env.NODE_WEBSITE_PORT || 8080;

var server = http.createServer(staticServer).listen(port);
server.on('listening', function() {
  console.log('listening on port: %d', port);
});
