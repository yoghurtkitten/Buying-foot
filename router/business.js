const express = require('express');
const router = express.Router();
const pool = require('../pool');

router.get('/Login', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT phone FROM business WHERE phone=? AND password=?';
    pool.query(sql, [obj.user, obj.pwd], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            var business = {
                name: result[0].phone
            }
            req.session.business = business;
            res.send({ code: 200, data: result });
        } else {
            res.send({ code: 400, data: '登录失败' })
        }
    })
});
router.post('/registe', (req, res) => {
    // res.send(req.body);
    var obj = req.body;
    var sql = 'INSERT INTO business VALUES (null, ?,?,?,?,?,?)';
    pool.query(sql, [obj.password, obj.phone, obj.shopman_name, obj.idCard, obj.business_img, obj.contact], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            sql = `INSERT INTO shop (business_id, shop_name, shop_type, province, city, county, address, license, shop_img, shop_phone, licenseName, isPass) 
            VALUES ((SELECT max(id) from business), ?, ?, ?,?,?,?,?,?,?,?,0)`;
            pool.query(sql, [obj.shop_name, obj.shop_type, obj.province, obj.city, obj.county, obj.address, obj.license, obj.shop_img, obj.shop_phone, obj.licenseName], (err, result) => {
                if (err) {
                    throw err;
                }
                if (result.affectedRows) {
                    res.send({ code: 200, msg: '插入成功' });
                } else {
                    res.send({ code: 200, msg: '商家信息插入失败' })
                }
            })
        } else {
            res.send({ code: 200, msg: '商家信息插入失败' })
        }
    })

});
router.get('/getNewCount', (req, res) => {
    var obj = req.query;
    var sql = `SELECT COUNT(order_.id) as count FROM business 
    JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE order_.status=1 AND business.phone=?`;
    pool.query(sql, [obj.bphone], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code:200, data:result})
        } else {
            res.send({code:400, data:result})
        }
    })
})
router.get('/getAllOrder', (req, res) => {
    var obj = req.query;
    var sql = `SELECT order_time,shop.shop_name FROM business 
    JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE business.phone=? AND order_.status <> 0`;
    pool.query(sql, [obj.bphone], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code:200, data:result})
        } else {
            res.send({code:400, data:result})
        }
    })
})
router.get('/getAllPrice', (req, res) => {
    var obj = req.query;
    var sql = `SELECT order_.price,order_.order_time FROM 
    business JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE business.phone=? AND order_.status <> 0`;
    pool.query(sql, [obj.bphone], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code:200, data:result})
        } else {
            res.send({code:400, data:result})
        }
    })
})
router.get('/getCancel', (req, res) => {
    var obj = req.query;
    var sql = `SELECT COUNT(order_.id) as count FROM business 
    JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE order_.status=0 AND business.phone=?`;
    pool.query(sql, [obj.bphone], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code:200, data:result})
        } else {
            res.send({code:400, data:result})
        }
    })
})
router.get('/getBusi', (req, res) => {
    var obj = req.query;
    var sql = 'SELECT id FROM business WHERE phone=?';
    pool.query(sql, [obj.bphone], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.length) {
            res.send({code:200, data:result})            
        } else {
            res.send({code:400, data:result})
        }
    })
})
router.get('/changePwd', (req, res) => {
    var obj = req.query;
    var sql = 'UPDATE business SET password=? WHERE phone=?';
    pool.query(sql, [obj.upwd, obj.bphone], (err, result) => {
        if (err) {
            throw err;
        }
        if (result.affectedRows) {
            res.send({code: 200, msg: '修改成功'});
        } else {
            res.send({code: 400, msg: '修改失败'});
        }
    })
})
module.exports = router;