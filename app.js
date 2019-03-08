const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./router/user');
const businessRouter = require('./router/business');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var cors = require("cors")
const fs = require('fs');
const multer = require('multer');


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
server.use(express.static('upload'));
server.use(bodyParser.urlencoded({ extended: false }));


//解决跨域问题
server.use(cors({
    origin: ['http://47.102.198.76:5000','http://127.0.0.1:5000'],
    credentials: true  // 是否带cookie
}));


server.use('/user', userRouter);
server.use('/business', businessRouter);


var upload = multer({ dest: "upload/" });
server.post('/upload', upload.single('mypic'), (req, res) => {
    var src = req.file.originalname;
    var i3 = src.lastIndexOf('.');
    var suff = src.substring(i3);
    var ftime = new Date().getTime();
    var frane = Math.floor(Math.random() * 9999);
    var des = `./upload/${ftime}${frane}${suff}`;
    fs.renameSync(req.file.path, des);
    // console.log(des)
    res.send({ code: 1, msg: '上传文件成功', path: des})
})
server.post('/uploadFood', upload.single('file'), (req, res) => {
    var src = req.file.originalname;
    var i3 = src.lastIndexOf('.');
    var suff = src.substring(i3);
    var ftime = new Date().getTime();
    var frane = Math.floor(Math.random() * 9999);
    var des = `./upload/${ftime}${frane}${suff}`;
    fs.renameSync(req.file.path, des);
    // console.log(des)
    res.send({ code: 1, msg: '上传文件成功', path: des})
})






