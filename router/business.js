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
            console.log(req.session.business.name)
            res.send({ code: 200, data: result });
        } else {
            res.send({ code: 400, data: '登录失败' })
        }
    })
});

module.exports = router;