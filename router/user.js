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

   /*  var queryData = querystring.stringify({
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
        sql = 'SELECT * FROM shop WHERE province=? and city=? and county=? and shop_type=? and isPass=0 LIMIT ?,20';
    } else {
        sql = 'SELECT * FROM shop WHERE province=? and city=? and county=? and isPass=0 LIMIT ?,20';
    }
    // console.log(`SELECT * FROM shop WHERE province=${province} and city=${city} and county=${county} LIMIT ${n},20`);
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
    var businessList = [];
    var ids = [];
    var address = req.query.address.split('-');
    // console.log(address)
    var [province, city, county] = address;
    var sql = `SELECT shop.id,shop.shop_name,shop.deliver_time,shop.shop_start,food.name,food.price 
    FROM shop JOIN food ON shop.id=food.shop_id 
    WHERE province=? and city=? and county=? and shop_name = ? LIMIT 0, 3
    `;
    var queryPara = [province, city, county, req.query.business];

    pool.query(sql, queryPara, (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            for (const key in result) {
                if (result.hasOwnProperty(key)) {
                    const element = result[key];
                    if (ids.indexOf(element.id) == -1) {
                        ids.push(element.id);
                    }
                }
            }
            var index = 0;
            for (const i in ids) {
                if (ids.hasOwnProperty(i)) {
                    const element = ids[i];
                    businessList[index++] = { id: element, foods: [] }
                }
            }
            index = 0;
            for (const i in businessList) {
                for (const j in result) {
                    if (businessList[i].id == result[j].id) {
                        businessList[i].foods[index++] = result[j]
                    }
                }
            }
            // console.log(businessList)
            res.send(businessList);
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
                // console.log(req.session.user);
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
    // console.log(req.session)
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
            var sql2 = 'SELECT * FROM shop JOIN food ON shop.id=food.shop_id JOIN food_catagory ON food.type_id=food_catagory.id WHERE food.shop_id=?';
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
    var sql = `INSERT INTO shop_car VALUES (null, (SELECT user.id FROM user WHERE user.phone = ?), ?, ?, 1, ?, 0)`
    pool.query(sql, [obj.user, parseInt(obj.foods_id), obj.sid, parseFloat(obj.un_price)], (err, result) => {
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
    if (obj.number == 0) {
        var sql = `DELETE FROM shop_car WHERE fid=? AND shop_car.isOrder=0`;
        pool.query(sql, [obj.foods_id], (err, result) => {
            if (err) {
                throw err;
            }
            if (result.affectedRows) {
                res.send({ code: 200, msg: 'Success' })
            } else {
                res.send({ code: 400, msg: 'fault' })
            }
        })
    } else {
        var sql = `UPDATE shop_car SET number=? WHERE fid=? AND shop_car.isOrder=0`
        pool.query(sql, [obj.number, obj.foods_id], (err, result) => {
            if (err) {
                throw err;
            }
            if (result.affectedRows) {
                res.send({ code: 200, msg: 'Success' })
            } else {
                res.send({ code: 400, msg: 'fault' })
            }
        })
    }
})

router.get('/load_shop_car', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT fid,food.name as name,number,un_price FROM shop_car JOIN food on shop_car.fid = food.food_id JOIN user ON shop_car.uid=user.id WHERE user.phone=? AND shop_car.isOrder=0';
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
    WHERE user.phone=? AND shop.id=? AND shop_car.isOrder=0
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
    console.log(req.session.user.name, obj.receiver, obj.province, obj.city, obj.country, obj.address, obj.phone, obj.gender)
    var sql = `INSERT INTO re_address VALUES (null, (SELECT id FROM user WHERE user.phone=?), ?, ?, ?, ?, ?, ?, ?, 0)`;
    pool.query(sql, [req.session.user.name, obj.receiver, obj.province, obj.city, obj.country, obj.address, obj.phone, obj.gender], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            sql = 'SELECT max(id) AS id FROM re_address';
            pool.query(sql,(err, result) => {
                if (err) {
                    throw err;
                }
                if (result.length) {
                    
                    res.send({ code: 200, msg: 'Insert Success', id: result});
                }
            })
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
    var sql = "select re_address.id, re_address.receiver,re_address.province,re_address.city,re_address.country,re_address.address,re_address.phone,re_address.gender from re_address JOIN user ON re_address.uid=user.id WHERE user.phone=? AND re_address.isDel=0";
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

router.post('/load_Order', (req, res) => {
    var obj = req.body;
    var sid = obj.sid;
    var user = obj.user;
    var add_id = obj.add_id;
    var order_id = parseInt(obj.order_id);
    // console.log(order_id)
    var sql = `SELECT shop.shop_name,shop.deliver_fee,shop.deliver_time,food.name,shop_car.number,shop_car.un_price,re_address.receiver,re_address.province,re_address.city,re_address.country,re_address.address,re_address.phone,re_address.gender 
    FROM food JOIN shop_car ON food.food_id=shop_car.fid JOIN shop ON food.shop_id=shop.id JOIN user ON shop_car.uid=user.id JOIN re_address ON user.id=re_address.uid WHERE 
    user.phone=? AND shop.id=? AND re_address.id=? AND shop_car.isOrder=?
    `;
    pool.query(sql, [user, sid, add_id, order_id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            // console.log(result)
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

function randomOrder() {
    var outTradeNo = "";  //订单号
    for (var i = 0; i < 6; i++) //6位随机数，用以加在时间戳后面。
    {
        outTradeNo += Math.floor(Math.random() * 10);
    }
    outTradeNo = new Date().getTime() + outTradeNo;
    return outTradeNo;
}
router.post('/save_Order', (req, res) => {
    var obj = req.body;
    var order_random = randomOrder();
    var sql = 'INSERT INTO order_ (uid, addr_id, shop_id, status, order_time,message,dish_count,price,order_no) VALUES ((SELECT id FROM user WHERE user.phone=?), ?, ?, 0, ?, ?, ?, ?, ?)'
    pool.query(sql, [obj.u_phone, obj.addr_id, obj.shop_id, obj.order_time, obj.message, obj.dish_count, obj.price, order_random], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            // console.log(result);
            var sql2 = 'SELECT id, order_no FROM order_ WHERE order_time=?';
            pool.query(sql2, [obj.order_time], (err, result) => {
                if (err) {
                    throw err;
                }
                if (result) {
                    res.send(result);
                } else {
                    res.send({ code: 400, msg: 'Select Id Fault!' });
                }
            })
        } else {
            res.send({ code: 400, msg: 'Insert Fault!' });
        }
    })
})

router.get('/change_order', (req, res) => {
    var obj = req.query;
    var sql = 'UPDATE shop_car SET isOrder=? WHERE uid=(SELECT id FROM user WHERE user.phone=?) AND shop_id=? AND isOrder=0';
    pool.query(sql, [obj.order_id, obj.u_phone, obj.sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'Update Success!' });
        } else {
            res.send({ code: 400, msg: 'Update Fault!' });
        }
    })
})

router.post('/changeStatu', (req, res) => {
    var obj = req.body;
    console.log(obj.pay_method, obj.order_no)
    var sql = 'UPDATE order_ SET status=1,pay_method=? WHERE id = ?';
    pool.query(sql, [obj.pay_method, obj.order_no], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'updata statu success' });
        } else {
            res.send({ code: 400, msg: 'updata statu fault' });
        }
    })
})
router.get('/updateFoodSell', (req, res) => {
    var obj = req.query;
    var sql = `UPDATE food JOIN shop_car ON food.food_id=shop_car.fid JOIN order_ ON shop_car.isOrder=order_.id 
    SET food.sell_number=food.sell_number+shop_car.number WHERE order_.id=?`;
    pool.query(sql, [obj.order_id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'updata statu success' });
        } else {
            res.send({ code: 400, msg: 'updata statu fault' });
        }
    })
})

router.get('/orderStatu', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT status FROM order_ WHERE id=?';
    pool.query(sql, [obj.order_id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send(result)
        }
    })
})

router.get('/getShopAddress', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT province, city, county FROM shop WHERE id = ?';
    pool.query(sql, [obj.sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            res.send(result)
        } else {
            res.send({ code: 400, msg: 'no shop' })
        }
    })
})

router.get('/getUserOrder', (req, res) => {
    var newOrder = [];//newOrder[{id:22, content[]}]
    var user = req.query.user;
    var sql = `
    SELECT order_.id FROM order_ JOIN user ON order_.uid=user.id WHERE user.phone=?
    `;
    pool.query(sql, [user], (err, result) => {
        if (err) {
            throw err;
        }
        if (result) {
            var index = 0;
            for (const key in result) {
                newOrder[index++] = { id: result[key].id }
            }
            var sql2 = `
            SELECT order_.id,shop.id AS sid,shop.shop_name,shop.shop_img,food.name,shop_car.number,shop_car.un_price,order_.status,order_.order_time,order_.order_no,order_.addr_id FROM
            order_ JOIN user ON order_.uid=user.id JOIN shop_car ON order_.id=shop_car.isOrder JOIN
            shop ON order_.shop_id=shop.id JOIN food ON shop_car.fid=food.food_id 
            WHERE user.phone=?

            `;
            pool.query(sql2, [user], (err, result) => {

                if (err) {
                    throw err;
                }
                if (result) {
                    for (const key in newOrder) {
                        var index = 0;
                        newOrder[key].content = []
                        for (const all in result) {
                            if (result[all].id == newOrder[key].id) {
                                newOrder[key].content[index++] = result[all]
                            }
                        }
                    }
                    res.send({ code: 200, data: newOrder })
                } else {
                    res.send({ code: 400, msg: 'SELECT FAULT!' })
                }
            })
        } else {
            res.send({ code: 400, msg: 'SELECT FAULT!' })
        }
    })
})

router.get('/getShopInfo', (req, res) => {
    var obj = req.query;
    var sql = `SELECT shop_name, shop_phone,deliver_fee,shop_img FROM shop JOIN order_ ON shop.id=order_.shop_id WHERE order_.order_no=?`;
    pool.query(sql, [obj.order_no], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({ code: 200, data: result });
        } else {
            res.send({ code: 400, data: 'Get shop info fault!' })
        }
    })
})
router.get('/getShopCarInfo', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT shop_car.number,shop_car.un_price*shop_car.number AS price,food.name FROM shop_car JOIN order_ ON shop_car.isOrder=order_.id JOIN food ON food.food_id=shop_car.fid WHERE order_.order_no=?';
    pool.query(sql, [obj.order_no], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({ code: 200, data: result });
        } else {
            res.send({ code: 400, data: 'Get shop_car info fault!' })
        }
    })
})

router.get('/getAddressInfo', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT re_address.receiver, re_address.address,re_address.phone,re_address.gender,order_.message,order_.order_time FROM order_ JOIN re_address ON order_.addr_id=re_address.id WHERE order_.order_no=?';
    pool.query(sql, [obj.order_no], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({ code: 200, data: result });
        } else {
            res.send({ code: 400, data: 'Get address info fault!' })
        }
    })
})

router.get('/getOrderStatu', (req, res) => {
    var obj = req.query;
    var sql = `SELECT status FROM order_ WHERE id=?`;
    pool.query(sql, [obj.order_id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({ code: result[0].status })
        } else {
            res.send({ code: -1 })
        }
    })
})

router.get('/get_address', (req, res) => {
    var obj = req.query;
    var sql = `SELECT * FROM re_address WHERE uid=(SELECT id FROM user WHERE user.phone=?) AND isDel=0`;
    pool.query(sql, [req.session.user.name], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({ code: 200, data: result });
        } else {
            res.send({ code: 400, data: result });
        }
    })
})

router.get('/delAddress', (req, res) => {
    var obj = req.query;
    var sql = `UPDATE re_address SET isDel=1 WHERE id=?`;
    pool.query(sql, [obj.id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'Delete Success!!' })
        } else {
            res.send({ code: 400, msg: 'Delete Fault!!' })
        }
    })
})

router.get('/selectAddress', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT * FROM re_address WHERE id=?';
    pool.query(sql, [obj.id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({ code: 200, data: result })
        } else {
            res.send({ code: 400, data: 'The User Is Not Exists!' })
        }
    })
})
router.post('/update_address', (req, res) => {
    var obj = req.body;
    var sql = 'UPDATE re_address SET receiver=?, province=?, city=?, country=?, address=?, phone=?, gender=? WHERE id=?';
    pool.query(sql, [obj.receiver, obj.province, obj.city, obj.country, obj.address, obj.phone, obj.gender, obj.id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, msg: 'Update Success!' });
        } else {
            res.send({ code: 200, msg: 'Update Fault!' });
        }
    })
})
router.post('/SaveShop', (req, res) => {
    var obj = req.body;
    var sql = 'INSERT INTO save VALUES(null, (SELECT id FROM user WHERE user.phone=?), ?, 0)';
    console.log(req.session.user.name)
    console.log(obj.sid)
    pool.query(sql, [req.session.user.name, obj.sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            sql = 'SELECT max(id) from save';
            pool.query(sql, (err, result) => {
                if (err) {
                    throw err;
                }
                if (result.length) {
                    res.send({ code: 200, data: result })
                } else {
                    res.send({ code: 400, data: 'Insert Fault' });
                }
            })
        } else {
            res.send({ code: 400, data: 'Insert Fault!!' });
        }
    })
})
router.get('/UnSave', (req, res) => {
    var obj = req.query;
    var sql = 'UPDATE save SET isDel=? WHERE id=?';
    pool.query(sql, [obj.isDel, obj.id], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({ code: 200, data: obj.id });
        } else {
            res.send({ code: 400, data: 'Update Fault!!' });
        }
    })
})

router.get('/isSave', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT id, isDel FROM save WHERE uid=(SELECT id FROM user WHERE user.phone=?) AND sid=?';
    pool.query(sql, [req.session.user.name, obj.sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            if (result[0].isDel == 1) {
                res.send({ code: 200, data: result })
            } else {
                res.send({ code: 201, data: result })
            }
        } else {
            res.send({ code: 400, data: result })
        }
    })
})

router.get('/getSave', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT shop.id, shop.shop_name, shop.shop_start, shop.deliver_cost, shop.deliver_fee, shop.deliver_time, shop.shop_img FROM save JOIN shop ON save.sid=shop.id WHERE uid=(SELECT id FROM user WHERE user.phone=?)';
    pool.query(sql, [req.session.user.name], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code:200, data:result});
        } else {
            res.send({code:400, data:result});
        }
    })
})

router.get('/getOrderStatus', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT status FROM order_ WHERE order_no=?';
    pool.query(sql, [obj.order_no], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code:200, data:result});
        } else {
            res.send({code:400, data:result});
        }
    })
})

router.get('/hasFood', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT COUNT(food.food_id) as c FROM shop JOIN food ON shop.id=food.shop_id WHERE shop.id=?';
    pool.query(sql, [obj.sid], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code: 200, data: result[0]})
        } else {
            res.send({code: 400, data: result})
        }
    })
})

router.get('/getFoodCount', (req, res) => {
    var obj = req.query;
    var inventory = parseInt(obj.inventory);
    var sql = 'UPDATE food SET inventory=inventory-? WHERE food_id=? AND inventory>?';
    pool.query(sql, [inventory, obj.food_id, inventory], (err,result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({code: 200, data: '添加成功'})
        } else {
            res.send({code: 400, data: '库存不足'})
        }
    })
})

module.exports = router;