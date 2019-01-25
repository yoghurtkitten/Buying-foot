const express = require('express');
var pool = require('../pool');
var formidable = require('formidable');
var router = express.Router();
var request = require('request');
var querystring = require('querystring');

function validate(body) {
    var mystr = '';
    var mycode = 400
    for (const key in body) {
        if (body[key] == '') {
            mystr = `${key} is null !!`;
            break;
        }
        mycode++;
    }
    return { code: mycode, str: mystr };
}

function validate_code() {
    var str = '';
    for (let i = 0; i < 6; i++) {
        str += parseInt(Math.random() * 10);
    }
    return str;
}

router.post('/getVCode', (req, res) => {
    var obj = req.body;
    v_code = validate_code();
    res.send({ code: 200, msg: "短信发送成功", vcode: v_code });

    /* var queryData = querystring.stringify({
        "mobile": obj.phone,  // 接受短信的用户手机号码
        "tpl_id": "127698",  // 您申请的短信模板ID，根据实际情况修改
        "tpl_value": `#code#=${v_code}`,  // 您设置的模板变量，根据实际情况修改
        "key": "5850bb044776fddda1c198bbc6a7a6a8",  // 应用APPKEY(应用详细页查询)
    });
    
    var queryUrl = 'http://v.juhe.cn/sms/send?'+queryData;
    
    request(queryUrl, function (error, response, body) {
        if (!error && response.statusCode == 200) {
            console.log(body) // 打印接口返回内容
            
            var jsonObj = JSON.parse(body); // 解析接口返回的JSON内容
            if (jsonObj.reason == "操作成功") {
                res.send({code: 200, msg: "短信发送成功", vcode: v_code});
            } else {
                res.send({code: 401, msg: "短信发送失败"});
            }
        } else {
            res.send({code: 400, msg: "请求异常"});
        }
    })  */

})

router.post('/regist', (req, res) => {
    var obj = req.body;
    var validateResult = validate(obj);
    if (validateResult.str) {
        res.send({ code: validateResult.code, msg: validateResult.str });
        return;
    }
    var sql = 'INSERT INTO user SET ?';
    pool.query(sql, [obj], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'Insert Success!' })
        } else {
            res.send({ code: 401, msg: 'Insert Fault!' })
        }
    })
});


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
            res.send({ code: 401, msg: 'Query Fault!' });
        }
    })
})


router.get('/getlist', (req, res) => {
    var address = req.query.address.split('-');
    var n = parseInt(req.query.n);
    n = n * 20;
    var [province, city, county] = address;
    var shop_type = req.query.type;
    var sql = '';
    var queryPara = [province, city, county, n];
    if (req.query.type) {
        queryPara = [province, city, county, shop_type, n]
        sql = 'SELECT * FROM shop WHERE province=? and city=? and county=? and shop_type=? LIMIT ?,20';
    } else {
        sql = 'SELECT * FROM shop WHERE province=? and city=? and county=? LIMIT ?,20';
    }

    pool.query(sql, queryPara, (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            res.send(result);
        } else {
            res.send('没有商家');
        }
    })
});

router.get('/searchByBusiness', (req, res) => {
    var address = req.query.address.split('-');
    var [province, city, county] = address;
    var sql = 'SELECT * FROM shop WHERE province=? and city=? and county=? and shop_name like ?';
    var queryPara = [province, city, county, req.query.business];

    pool.query(sql, queryPara, (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            res.send(result);
        } else {
            res.send('没有商家');
        }
    })
})

router.post('/validate', (req, res) => {
    var obj = req.body;
    if (!obj.name) {
        res.send({ code: 402, msg: '用户名不能为空' });
        return;
    }

    var sql = 'SELECT * FROM user WHERE name = ?'
    pool.query(sql, [obj.name], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({ code: 401, msg: '该用户名已存在' });
        } else {
            res.send({ code: 200, msg: '通过' });
        }
    });
});

router.post('/update_validate', (req, res) => {
    var obj = req.body;
    if (!obj.name) {
        res.send({ code: 402, msg: '用户名不能为空' });
        return;
    }

    var sql = 'SELECT * FROM user WHERE name = ?'
    pool.query(sql, [obj.name], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            if (result[0].id == obj.id) {
                res.send({ code: 200, msg: '通过' });
            } else {
                res.send({ code: 401, msg: '该用户名已存在' });
            }
        } else {
            res.send({ code: 200, msg: '通过' });
        }
    });
});

router.post('/login', (req, res) => {
    var obj = req.body;
    var validateResult = validate(obj);
    if (validateResult.str) {
        res.send({ code: validateResult.code, msg: validateResult.str });
        return;
    }
    var sql = 'SELECT * FROM user where phone = ?';
    pool.query(sql, [obj.phone], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            if (obj.code == obj.user_code) {

                var user = {
                    name: obj.phone
                }
                req.session.user = user;
                res.send({ code: 200, msg: 'Login Success!' })
            } else {
                res.send({ code: 403, msg: 'Login Error!', code: v_code })
            }
        } else {
            var sql2 = 'INSERT INTO user (phone) VALUE ( ? )';
            pool.query(sql2, [obj.phone], (err, result) => {
                if (err) {
                    throw err;
                }
                if (result.affectedRows) {
                    var user = {
                        name: obj.phone
                    }
                    req.session.user = user;
                    res.send({ code: 200, msg: 'Insert Success!' })
                } else {
                    res.send({ code: 402, msg: 'Insert Fault!' })
                }
            })
        }
    })
})

router.get('/session', (req, res) => {
    var session_msg = req.session.user;
    if (session_msg) {
        res.send({ code: 200, msg: session_msg });
    } else {
        res.send({ code: 400, msg: 'get session Fault' });
    }
})

router.get('/getFoods', (req, res) => {
    var sid = req.query.sid;
    var sql = 'SELECT * FROM shop JOIN food ON shop.id=food.shop_id WHERE food.shop_id=?';
    pool.query(sql, [sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            res.send(result)
        } else {
            res.send('err');
        }
    })
})
router.get('/getFoodsCatagory', (req, res) => {
    var food_catagory = { foods: [], catagory: [] };
    var sid = req.query.sid;
    var sql = "SELECT type_name FROM shop JOIN food_catagory ON shop.id=food_catagory.shop_id WHERE shop.id=?";
    pool.query(sql, [sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            food_catagory.catagory = result;
            var sql2 = 'SELECT * FROM shop JOIN food ON shop.id=food.shop_id WHERE food.shop_id=?';
            pool.query(sql2, [sid], (err, result) => {
                if (err) {
                    throw err;
                }
                if (result) {
                    food_catagory.foods = result;
                    res.send(food_catagory)
                } else {
                    res.send('err');
                }
            })

        } else {
            res.send('err');
        }
    })
})

router.post('/setShopCar', (req, res) => {
    var obj = req.body;
    var sql = `INSERT INTO shop_car VALUES (null, (SELECT user.id FROM user WHERE user.phone = ?), ?, 1, ?)`
    pool.query(sql, [obj.user, parseInt(obj.foods_id), parseFloat(obj.un_price)], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send(result);
        } else {
            res.send({ code: 400, msg: 'fault' })
        }
    })
})

router.post('/update_shopCar', (req, res) => {
    var obj = req.body;
    var sql = `UPDATE shop_car SET number=? WHERE fid=?`
    pool.query(sql, [obj.number, obj.foods_id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            var sql2 = `SELECT un_price FROM shop_car WHERE fid=?`;
            pool.query(sql2, [obj.foods_id], (err, result) => {
                if (err) {
                    throw err;
                }
                if (result) {
                    res.send(result);
                } else {
                    res.send({ code: 400, msg: 'fault_select' })
                }
            })
        } else {
            res.send({ code: 400, msg: 'fault' })
        }
    })
})

router.get('/load_shop_car', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT fid,food.name as name,number,un_price FROM shop_car JOIN food on shop_car.fid = food.food_id JOIN user ON shop_car.uid=user.id WHERE user.phone=?';
    pool.query(sql, [obj.user], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            // console.log(obj.user)
            // console.log(result)
            res.send(result);
        } else {
            result({ code: 400, msg: 'select Fault' })
        }
    });
})

router.post('/getOrderInfo', (req, res) => {
    var obj = req.body;
    var sid = obj.sid;
    var user = obj.user;
    
    var sql = `SELECT shop.shop_name,shop.deliver_fee,shop.deliver_time,food.name,shop_car.number,shop_car.un_price 
    FROM food JOIN shop_car ON food.food_id=shop_car.fid JOIN shop ON food.shop_id=shop.id JOIN user ON shop_car.uid=user.id 
    WHERE user.phone=? AND shop.id=?
    `;
    pool.query(sql, [user, sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            res.send(result);
        } else {
            res.send({ code: 400, msg: 'get order info fault!' })
        }
    })
})

router.post('/save_address', (req, res) => {
    var obj = req.body;
    var sql = `INSERT INTO re_address VALUES (null, (SELECT id FROM user WHERE user.phone=?), ?, ?, ?, ?, ?, ?, ?)`;
    pool.query(sql, [obj.u_phone, obj.receiver, obj.province, obj.city, obj.country, obj.address, obj.phone, obj.gender], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'Insert Success' });
        } else {
            res.send({ code: 400, msg: 'Insert Fault' });
        }
    })
})

router.post('/valiUser', (req, res) => {
    var obj = req.body;
    var sql = `SELECT * FROM shop_car JOIN user ON shop_car.uid=user.id WHERE user.phone=? AND shop_car.fid=?`;
    pool.query(sql, [obj.user, obj.foods_id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            res.send(result)
        } else {
            res.send('error')
        }
    })
})

router.get('/valiAddress', (req, res) => {
    var obj = req.query;
    var sql = "select re_address.id, re_address.receiver,re_address.province,re_address.city,re_address.country,re_address.address,re_address.phone,re_address.gender from re_address JOIN user ON re_address.uid=user.id WHERE user.phone=?";
    pool.query(sql, [obj.user], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send(result)
        } else {
            res.send({ code: 400, msg: 'no address' })
        }
    })
})

router.get('/accross', (req, res) => {
    res.send('123456');
})

router.post('/saveOrder', (req, res) => {
    var obj = req.body;
    var sid = obj.sid;
    var user = obj.user;
    var add_id = obj.add_id;
    var sql = `SELECT shop.shop_name,shop.deliver_fee,shop.deliver_time,food.name,shop_car.number,shop_car.un_price,re_address.receiver,re_address.province,re_address.city,re_address.country,re_address.address,re_address.phone,re_address.gender 
    FROM food JOIN shop_car ON food.food_id=shop_car.fid JOIN shop ON food.shop_id=shop.id JOIN user ON shop_car.uid=user.id JOIN re_address ON user.id=re_address.uid WHERE 
    user.phone=? AND shop.id=? AND re_address.id=?
    `;
    pool.query(sql, [user, sid, add_id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            res.send(result);
        } else {
            res.send({ code: 400, msg: 'get order info fault!' })
        }
    })
})

router.get('/delete_shop_car', (req, res) => {
    var obj = req.query;
    var sql = `DELETE FROM shop_car WHERE uid=(SELECT id FROM user WHERE user.phone=?)`;
    pool.query(sql, [obj.user], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'Delete Success' });
        } else {
            res.send({ code: 400, msg: 'Delete Fault' });
        }
    })
})

module.exports = router;