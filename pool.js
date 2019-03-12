const mysql = require('mysql');
var pool = mysql.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: '',
    database: 'buying',
    connectionLimit: 20,
    charset: 'UTF8_GENERAL_CI'
})

module.exports = pool;