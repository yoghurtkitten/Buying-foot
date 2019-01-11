const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./router/user');
const businessRouter = require('./router/business');
var cookieParser = require('cookie-parser');
var session = require('express-session');

const server = express();

server.listen(3000);

server.use(cookieParser());
server.use(session({
    secret: '12345',//与cookieParser中的一致
    cookie:{maxAge:600000},
    resave: false,
    saveUninitialized:true
}));
/* server.use('/',(req, res, next) => {
    console.log(req.session.user);
    // res.send('validata falut!')
    //验证成功，执行下一个中间件
    next();
}); */
server.use(express.static('public'));
server.use(express.static('asset'));
server.use(bodyParser.urlencoded({extended: false}));

server.use('/user', userRouter);
server.use('/business', businessRouter);

