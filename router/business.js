const express = require('express');
const router = express.Router();
const pool = require('../pool');

router.post('/reigiste', (req, res) => {
    console.log('123');
    /* var sql = 'SELECT * FROM business';
    pool.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.send(result);
    }); */
});

module.exports = router;