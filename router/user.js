const express = require('express');
var router = express.Router();

router.post('/login', (req, res) => {
    console.log(req.body);
    res.send(req.body);
});

module.exports = router;