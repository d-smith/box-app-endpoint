var express = require('express');
var app = express();

app.post('/boxen', function(req, resp) {
  console.log(req.params);
  console.log(req.query);
  resp.status(200).end();
});

app.get('/boxen', function(req, resp) {
  console.log(req.params);
  console.log(req.query);
  resp.status(200).end();
});


var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
});
