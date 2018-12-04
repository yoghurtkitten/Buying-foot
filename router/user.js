const express = require('express');
var pool = require('../pool');
var formidable = require('formidable');
var router = express.Router();

function validate(body) {
    var mystr = '';
    var mycode = 400
    for (const key in body) {
        if (body[key] == '') {
            mystr = `${key} is null !!`;
            break;
        }
        mycode ++;
    }
    return {code: mycode, str: mystr};
}

router.post('/regist', (req, res) => {
    var obj = req.body;
    var validateResult = validate(obj);
    if (validateResult.str) {
        res.send({code: validateResult.code, msg: validateResult.str});
        return;     
    }
    var sql = 'INSERT INTO user SET ?';
    pool.query(sql, [obj], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({code: 200, msg: 'Insert Success!'})
        } else {
            res.send({code: 401, msg: 'Insert Fault!'})
        }
    }) 
});

router.get('/del/:id', (req, res) => {
    var id = req.params.id;
    var sql = 'DELETE FROM user WHERE id = ?';
    pool.query(sql, [id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({code: 200, msg: 'Delete Success!'})            
        } else {
            res.send({code: 401, msg: 'Delete Fault!'})
        }
    })
})

router.get('/query/:id', (req, res) => {
    var id = req.params.id;
    var sql = 'SELECT * FROM user WHERE id = ?';
    pool.query(sql, [id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code: 200, msg: 'Query Success!'});            
            console.log(result);
        } else {
            res.send({code: 401, msg: 'Query Fault!'});
        }
    })
})

router.post('/update', (req, res) => {
    var form = new formidable.IncomingForm();
    form.parse(req, function(err, fields, files) {
        console.log('fields',fields);//表单传递的input数据
        console.log(files.Filedata.name);//上传文件数据
    });
});

router.get('/list/:count/:index', (req, res) => {
    var count = parseInt(req.params.count);
    var index = parseInt(req.params.index);
    var start = (index - 1) * count;
    var sql = 'SELECT * FROM user LIMIT ?, ?';
    pool.query(sql, [start, count], (err, result) => {
        if (err) {
            throw err;
        }
        res.send(`<!doctype html>
        <html>
            <body>
                <p>${result[0].id}<p>
                <p>${result[0].name}<p>
                <p>${result[0].name}<p>
                <img src = ${result[0].avatar}> 
            </body>
        </html>
        `); 
    })
});

router.post('/validate', (req, res) => {
    var obj = req.body;
    if (!obj.name) {
        res.send({code: 402, msg: '用户名不能为空'});        
        return;
    }

    var sql = 'SELECT * FROM user WHERE name = ?'
    pool.query(sql, [obj.name], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code: 401, msg: '该用户名已存在'});
        } else {
            res.send({code: 200, msg: '通过'});
        }
    });
});

module.exports = router;