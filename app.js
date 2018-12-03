const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./router/user');

const server = express();

server.listen(3000);
server.use(express.static('public'));
server.use(express.static('asset'));
server.use(bodyParser.urlencoded({extended: false}));

server.use('/user', userRouter);
