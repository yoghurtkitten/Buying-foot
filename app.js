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
    secret: '12345',//自定义安全字符串
    cookie: { maxAge: 18000000 },//毫秒数，依靠cookie，保存8个小时
    resave: false,//每次请求都需要更新session
    saveUninitialized: true//初始化是否保存数据
}));
/* server.use('/',(req, res, next) => {
    console.log(req.session.user);
    // res.send('validata falut!')
    //验证成功，执行下一个中间件
    next();
}); */
server.use(express.static('public'));
server.use(express.static('asset'));
server.use(bodyParser.urlencoded({ extended: false }));


//解决跨域问题
server.use(cors({
    origin: ['http://127.0.0.1:5000','http://localhost:5000'],
    credentials: true  // 是否带cookie
}));


server.use('/user', userRouter);
server.use('/business', businessRouter);






