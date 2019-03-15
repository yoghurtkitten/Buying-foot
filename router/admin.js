const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/login", (req, res) => {
  var obj = req.query;
  var sql = `SELECT name FROM admin WHERE name=? AND password=?`;
  pool.query(sql, [obj.name, obj.pwd], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length) {
      res.send({ code: 200, data: result });
    } else {
      res.send({ code: 400, data: result });
    }
  });
});

router.get("/getShopBusi", (req, res) => {
  var sql = `SELECT shop.id,shop.shop_name,shop.business_id,shop.province,
  shop.city,shop.address,shop.license,shop.county,
  business.shopman_name,business.phone,business.idCard,shop.isPass 
  FROM business JOIN shop ON business.id=shop.business_id`;
  pool.query(sql, (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length) {
      res.send({ code: 200, data: result });
    } else {
      res.send({ code: 400, data: result });
    }
  });
});

router.get("/changeShopStatu", (req, res) => {
  var obj = req.query;
  var sql = `UPDATE shop SET shop.isPass=? WHERE id=?`;
  pool.query(sql, [obj.isPass, obj.id], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.affectedRows) {
      res.send({ code: 200, data: "修改成功" });
    } else {
      res.send({ code: 400, data: "修改失败" });
    }
  });
});

router.get("/changeAdminPwd", (req, res) => {
  var obj = req.query;
  var sql = `UPDATE admin SET password=? WHERE password=?`;
  pool.query(sql, [obj.pwd, obj.oldPwd], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.affectedRows) {
      res.send({ code: 200, msg: "更改成功" });
    } else {
      res.send({ code: 400, msg: "更改失败" });
    }
  });
});
module.exports = router;
