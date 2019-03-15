const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/Login", (req, res) => {
  var obj = req.query;
  var sql = "SELECT phone FROM business WHERE phone=? AND password=?";
  pool.query(sql, [obj.user, obj.pwd], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length) {
      var business = {
        name: result[0].phone
      };
      req.session.business = business;
      res.send({ code: 200, data: result });
    } else {
      res.send({ code: 400, data: "登录失败" });
    }
  });
});
router.post("/registe", (req, res) => {
  // res.send(req.body);
  var obj = req.body;
  var sql = "INSERT INTO business VALUES (null, ?,?,?,?,?,?,0)";
  pool.query(
    sql,
    [
      obj.password,
      obj.phone,
      obj.shopman_name,
      obj.idCard,
      obj.business_img,
      obj.contact
    ],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result.affectedRows) {
        sql = `INSERT INTO shop (business_id, shop_name, shop_type, province, city, county, address, license, shop_img, shop_phone, licenseName, isPass) 
            VALUES ((SELECT max(id) from business), ?, ?, ?,?,?,?,?,?,?,?,1)`;
        pool.query(
          sql,
          [
            obj.shop_name,
            obj.shop_type,
            obj.province,
            obj.city,
            obj.county,
            obj.address,
            obj.license,
            obj.shop_img,
            obj.shop_phone,
            obj.licenseName
          ],
          (err, result) => {
            if (err) {
              throw err;
            }
            if (result.affectedRows) {
              res.send({ code: 200, msg: "插入成功" });
            } else {
              res.send({ code: 200, msg: "商家信息插入失败" });
            }
          }
        );
      } else {
        res.send({ code: 200, msg: "商家信息插入失败" });
      }
    }
  );
});
router.get("/valiBusiness", (req, res) => {
  var obj = req.query;
  var sql = `SELECT shop.isPass FROM business JOIN shop ON shop.business_id=business.id WHERE business.phone=?`;
  pool.query(sql, [obj.phone], (err, result) => {
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
router.get("/getNewCount", (req, res) => {
  var obj = req.query;
  var sql = `SELECT COUNT(order_.id) as count FROM business 
    JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE order_.status=1 AND business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.get("/getAllOrder", (req, res) => {
  var obj = req.query;
  var sql = `SELECT order_time,shop.shop_name FROM business 
    JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE business.phone=? AND order_.status <> 0`;
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.get("/getShop", (req, res) => {
  var obj = req.query;
  var sql = `SELECT shop.shop_name FROM 
    shop JOIN business ON shop.business_id=business.id WHERE business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.get("/getAllPrice", (req, res) => {
  var obj = req.query;
  var sql = `SELECT order_.price,order_.order_time FROM 
    business JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE business.phone=? AND order_.status <> 0`;
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.get("/getCancel", (req, res) => {
  var obj = req.query;
  var sql = `SELECT COUNT(order_.id) as count FROM business 
    JOIN shop ON business.id=shop.business_id JOIN order_ ON shop.id=order_.shop_id 
    WHERE order_.status=0 AND business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.get("/getBusi", (req, res) => {
  var obj = req.query;
  var sql = "SELECT id FROM business WHERE phone=?";
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.get("/changePwd", (req, res) => {
  var obj = req.query;
  var sql = "UPDATE business SET password=? WHERE phone=?";
  pool.query(sql, [obj.upwd, obj.bphone], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.affectedRows) {
      res.send({ code: 200, msg: "修改成功" });
    } else {
      res.send({ code: 400, msg: "修改失败" });
    }
  });
});
router.get("/newOrdrInfo", (req, res) => {
  var obj = req.query;
  var sql = `SELECT food.name, food.price, shop_car.number,order_.pay_method,order_.id, order_.message,order_.dish_count,shop.deliver_fee,order_.order_time,
    re_address.receiver,re_address.province,re_address.city,re_address.country,re_address.address,re_address.phone,re_address.gender 
    FROM shop_car JOIN food ON shop_car.fid=food.food_id JOIN order_ ON shop_car.isOrder=order_.id JOIN re_address ON order_.addr_id=re_address.id JOIN shop ON food.shop_id=shop.id JOIN business ON business.id=shop.business_id
    WHERE order_.status=1 AND business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.get("/cancleOrderInfo", (req, res) => {
  var obj = req.query;
  var sql = `SELECT food.name, food.price, shop_car.number,order_.id, order_.message,order_.dish_count,shop.deliver_fee,order_.order_time,
  re_address.receiver,re_address.province,re_address.city,re_address.country,re_address.address,re_address.phone,re_address.gender 
  FROM shop_car JOIN food ON shop_car.fid=food.food_id JOIN order_ ON shop_car.isOrder=order_.id JOIN re_address ON order_.addr_id=re_address.id JOIN shop ON food.shop_id=shop.id JOIN business ON business.id=shop.business_id
  WHERE order_.status=0 AND business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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

router.get("/getAllOrderInfo", (req, res) => {
  var obj = req.query;
  var sql = `SELECT food.name, food.price, shop_car.number,order_.status,order_.pay_method,order_.id, order_.message,order_.dish_count,shop.deliver_fee,order_.order_time,order_.order_no,
  re_address.receiver,re_address.province,re_address.city,re_address.country,re_address.address,re_address.phone,re_address.gender 
  FROM shop_car JOIN food ON shop_car.fid=food.food_id JOIN order_ ON shop_car.isOrder=order_.id JOIN re_address ON order_.addr_id=re_address.id JOIN shop ON food.shop_id=shop.id JOIN business ON business.id=shop.business_id
  WHERE business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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

router.get("/changeStatus", (req, res) => {
  var obj = req.query;
  var sql = "UPDATE order_ SET status=2 WHERE id=?";
  pool.query(sql, [obj.id], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.affectedRows) {
      res.send({ code: 200, msg: "更新成功" });
    } else {
      res.send({ code: 400, msg: "更新失败" });
    }
  });
});

router.get("/getFoodCata", (req, res) => {
  var obj = req.query;
  var sql = `SELECT food_catagory.id,type_name FROM food_catagory JOIN shop ON food_catagory.shop_id=shop.id 
    JOIN business ON shop.business_id=business.id 
    WHERE business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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

router.get("/getFoodInfo", (req, res) => {
  var obj = req.query;
  var sql = `SELECT food_catagory.id, food_catagory.type_name, food.name, food.price, food.food_img, food.food_id, food.initial, food.inventory 
    FROM food_catagory JOIN shop ON food_catagory.shop_id=shop.id JOIN business ON shop.business_id=business.id 
    JOIN food ON food.type_id=food_catagory.id WHERE business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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

router.post("/addFoodType", (req, res) => {
  var obj = req.body;
  var sql = `INSERT INTO food_catagory VALUES (null, ?, 
        (SELECT shop.id FROM shop JOIN business ON shop.business_id=business.id WHERE business.phone=?))`;
  pool.query(sql, [obj.type_name, obj.bphone], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.affectedRows) {
      res.send({ code: 200, data: obj.type_name });
    } else {
      res.send({ code: 400, data: "添加失败" });
    }
  });
});

router.post("/addFood", (req, res) => {
  var obj = req.body;
  var sql = `INSERT INTO food VALUES (null, 
        (SELECT shop.id FROM shop JOIN business ON shop.business_id=business.id WHERE business.phone=?), 
        ?,?,?,?,?,0,?,?,?)`;
  pool.query(
    sql,
    [
      obj.bphone,
      obj.food_name,
      obj.price,
      obj.discript,
      obj.type_id,
      obj.star,
      obj.imageUrl,
      obj.inventory,
      obj.initial
    ],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result.affectedRows) {
        res.send({ code: 200, data: "添加成功" });
      } else {
        res.send({ code: 400, data: "添加失败" });
      }
    }
  );
});

router.get("/initFood", (req, res) => {
  var obj = req.query;
  var sql = "UPDATE food SET inventory=initial WHERE food_id=?";
  pool.query(sql, [obj.food_id], (err, result) => {
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

router.get("/foodZero", (req, res) => {
  var obj = req.query;
  var sql = "UPDATE food SET inventory=0 WHERE food_id=?";
  pool.query(sql, [obj.food_id], (err, result) => {
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
router.post("/changeFoodType", (req, res) => {
  var obj = req.body;
  var sql = "UPDATE food_catagory SET type_name=? WHERE id=?";
  console.log(obj.type_name, obj.id);
  pool.query(sql, [obj.type_name, obj.id], (err, result) => {
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
router.get("/delFood", (req, res) => {
  var obj = req.query;
  var sql = "DELETE FROM food WHERE food_id=?";
  pool.query(sql, [obj.food_id], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.affectedRows) {
      res.send({ code: 200, data: "删除成功" });
    } else {
      res.send({ code: 400, data: "删除失败" });
    }
  });
});
router.get("/getSingleFood", (req, res) => {
  var obj = req.query;
  var sql = "SELECT * FROM food WHERE food_id=?";
  pool.query(sql, [obj.food_id], (err, result) => {
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
router.post("/updateFoodInfo", (req, res) => {
  var obj = req.body;
  var sql = `UPDATE food SET name=?,price=?,ingredients=?,
    type_id=?,food_start=?,food_img=?,inventory=?,initial=? WHERE food_id=?`;
  pool.query(
    sql,
    [
      obj.name,
      obj.price,
      obj.ingredients,
      obj.type_id,
      obj.food_start,
      obj.food_img,
      obj.inventory,
      obj.initial,
      obj.food_id
    ],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result.affectedRows) {
        res.send({ code: 200, data: "更新成功" });
      } else {
        res.send({ code: 400, data: "更新失败" });
      }
    }
  );
});

router.get("/getOrder30", (req, res) => {
  var obj = req.query;
  var now = new Date().getTime();
  var sql = `SELECT COUNT(order_.id) AS count FROM order_ JOIN shop ON order_.shop_id=shop.id 
    JOIN business on shop.business_id=business.id WHERE ?-order_.order_time<2592000000
     AND business.phone=?`;
  pool.query(sql, [now, obj.bphone], (err, result) => {
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
router.get("/getPrice30", (req, res) => {
  var obj = req.query;
  var now = new Date().getTime();
  var sql = `SELECT (shop_car.number*shop_car.un_price) AS price,shop.deliver_fee 
    FROM order_ JOIN shop_car ON shop_car.isOrder=order_.id JOIN shop ON shop_car.shop_id=shop.id 
    JOIN business ON shop.business_id=business.id WHERE ?-order_.order_time<2592000000 
    AND business.phone=?`;
  pool.query(sql, [now, obj.bphone], (err, result) => {
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
router.get("/getOrder7", (req, res) => {
  var obj = req.query;
  var now = new Date().getTime();
  var sql = `SELECT order_.id,order_.order_time FROM order_ JOIN shop ON order_.shop_id=shop.id 
    JOIN business ON shop.business_id=business.id 
    WHERE ?-order_.order_time<518400000 AND business.phone=?`;
  pool.query(sql, [now, obj.bphone], (err, result) => {
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
router.post("/getPriceWeek", (req, res) => {
  var obj = req.body;
  var sql = `SELECT isOrder,number,un_price,order_.order_time FROM shop_car JOIN order_ ON shop_car.isOrder=order_.id WHERE isOrder IN (?)`;
  pool.query(sql, [obj.idList], (err, result) => {
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
router.get("/getShopInfo", (req, res) => {
  var obj = req.query;
  var sql = `SELECT shop.shop_phone, shop.shop_start,
    shop.deliver_fee,shop.deliver_cost,shop.deliver_time,shop.notice,shop.isPass 
    FROM shop JOIN business ON shop.business_id=business.id WHERE business.phone=?`;
  pool.query(sql, [obj.bphone], (err, result) => {
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
router.post("/changeShopInfo", (req, res) => {
  var obj = req.body;
  var sql = `UPDATE shop JOIN business ON 
    shop.business_id=business.id SET 
    shop.${obj.option}=? WHERE business.phone=?`;
  pool.query(sql, [obj.content, obj.bphone], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.affectedRows) {
      res.send({ code: 200, data: "更新成功" });
    } else {
      res.send({ code: 400, data: "更新失败" });
    }
  });
});
module.exports = router;
