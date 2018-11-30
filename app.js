const express = require('express');
const bodyParser = require('body-parser');
const server = express();

server.listen(3000);
server.use(express.static('public'));
server.use(bodyParser.urlencoded({extended: false}));

server.post('/login', (req, res) => {
    console.log(req.body);
    res.send(req.body);
});
