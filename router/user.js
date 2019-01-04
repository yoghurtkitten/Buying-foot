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

router.get('/del', (req, res) => {
    var id = req.query.id;
    var sql = 'DELETE FROM user WHERE id = ?';
    pool.query(sql, [id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send(`<script>alert('删除成功');location.href="http://127.0.0.1:3000/user_list.html"</script>`)            
        } else {
            res.send({code: 401, msg: 'Delete Fault!'})
        }
    })
})

router.get('/query', (req, res) => {
    // res.send(req.query.id);
    var id = req.query.id;
    var sql = 'SELECT * FROM user WHERE id = ?';
    pool.query(sql, [id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send(result);            
        } else {
            res.send({code: 401, msg: 'Query Fault!'});
        }
    }) 
})

router.post('/update', (req, res) => {
    /* var form = new formidable.IncomingForm();
    form.parse(req, function(err, fields, files) {
        console.log('fields',fields);//表单传递的input数据
        console.log(files.Filedata.name);//上传文件数据
    }); */
    var obj = req.body;
    var validateResult = validate(obj);
    if (validateResult.str) {
        res.send({code: validateResult.code, msg: validateResult.str});
        return;     
    }

    var sql = 'UPDATE user SET name = ?, email = ?, phone = ?, user_name = ?, gender = ?, password = ? WHERE id = ?';

    pool.query(sql, [obj.name, obj.email, obj.phone, obj.user_name, obj.gender, obj.password, obj.id], (err, result) => {
        if (err) {
            throw err;
        }
        // res.send(result);
        if (result.affectedRows) {
            // res.send(`<script>alert('修改成功');location.href='http://127.0.0.1:3000/user_list.html'</script>`)
            res.send('Update Success!!');
        } else {
            res.send('Update Error!!');
        }
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

router.get('/list_all', (req, res) => {

    var sql = 'SELECT * FROM user';
    pool.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.send(result); 
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

router.post('/update_validate', (req, res) => {
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
            if (result[0].id == obj.id) {
                res.send({code: 200, msg: '通过'});   
            } else {
                res.send({code: 401, msg: '该用户名已存在'});
            }
        } else {
            res.send({code: 200, msg: '通过'});
        }
    }); 
});

router.post('/login', (req, res) => {
    var obj = req.body;
    var validateResult = validate(obj);
    if (validateResult.str) {
        res.send({code: validateResult.code, msg: validateResult.str});
        return;     
    }
    var sql = 'SELECT * FROM user where name = ? and password = ?';
    pool.query(sql, [obj.name, obj.password], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code: 200, msg: 'Login Success!'})
        } else {
            var new_user = 'SELECT * FROM user where name = ?';
            pool.query(new_user, [obj.name], (err, result) => {
                if (err) {
                    throw err;
                }
                if (result.length) {
                    res.send({code: 401, msg: 'Login Fault!'})
                } else {
                    var insert_sql = 'INSERT INTO user SET ?';
                    pool.query(insert_sql, [obj], (err, result) => {
                        if (err) {
                            throw err;
                        }
                        if (result.affectedRows) {
                            res.send({code: 200, msg: 'Insert Success!'})
                        } else {
                            res.send({code: 401, msg: 'Insert Fault!'})
                        }
                    }) 
                }
            })

        }
    })
})
module.exports = router;