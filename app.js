const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./router/user');
const businessRouter = require('./router/business');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var cors = require("cors")


const server = express();

server.listen(5050);

server.use(cookieParser());
server.use(session({
    secret: '12345',//与cookieParser中的一致
    cookie:{maxAge:18000000},
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


//解决跨域问题
server.use(cors());
server.all('*', function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("Access-Control-Allow-Credentials", true);
    res.header("X-Powered-By", ' 3.2.1')
    if (req.method == "OPTIONS") res.send(200);/*让options请求快速返回*/
    else next();
});


server.use('/user', userRouter);
server.use('/business', businessRouter);






