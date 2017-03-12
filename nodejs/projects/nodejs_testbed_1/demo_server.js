var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Welcome Node.js');
}).listen(3001, "0.0.0.0");
console.log('Server running at http://0.0.0.0:3001/');
