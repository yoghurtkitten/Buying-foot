SET NAMES UTF8;
DROP DATABASE IF EXISTS buying;
CREATE DATABASE buying CHARSET = UTF8;

USE buying;
CREATE TABLE user(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(16),
  gender BOOL,
  email VARCHAR(64),
  phone VARCHAR(11),
  avatar VARCHAR(128),
  user_name VARCHAR(8)
);

CREATE TABLE business(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(8),
  phone VARCHAR(11),
  shopman_name VARCHAR(8)
);

CREATE TABLE shop(
  id INT PRIMARY KEY AUTO_INCREMENT,
  busine_id INT,
  shop_name VARCHAR(16),
  shop_type VARCHAR(16),
  province VARCHAR(12), #省份
  city VARCHAR(10), #城市
  county VARCHAR(10), #县
  address VARCHAR(64), #详细地址
  license VARCHAR(18), #营业执照号
  deliver_fee DECIMAL(4,2),
  deliver_cost DECIMAL(5,2),
  deliver_time TINYINT,
  shop_img VARCHAR(64),
  FOREIGN KEY (busine_id) REFERENCES business(id)
);

CREATE TABLE food_type(
  id INT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(16)
);
CREATE TABLE food(
  id INT PRIMARY KEY AUTO_INCREMENT,
  busine_id INT,
  type_id INT,
  name VARCHAR(16),
  price DECIMAL(6.2),
  ingredients VARCHAR(64),
  FOREIGN KEY (busine_id) REFERENCES business(id),
  FOREIGN KEY (type_id) REFERENCES food_type(id)
);
CREATE TABLE food_img(
  id INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,
  sm VARCHAR(128),
  md VARCHAR(128),
  lg VARCHAR(128),
  FOREIGN KEY (fid) REFERENCES food(id)
);
CREATE TABLE shop_car(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  fid INT,
  number SMALLINT,
  FOREIGN KEY (uid) REFERENCES user(id),
  FOREIGN KEY (fid) REFERENCES food(id)
);

CREATE TABLE order_(
  id INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,
  uid INT,
  number SMALLINT,
  status TINYINT,
  order_time BIGINT,
  pay_time BIGINT,
  received_time BIGINT,
  message VARCHAR(128),
  FOREIGN KEY (fid) REFERENCES food(id),
  FOREIGN KEY (uid) REFERENCES user(id)
);

CREATE TABLE re_address(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  receiver VARCHAR(8),
  province VARCHAR(16),
  city VARCHAR(16),
  country VARCHAR(16),
  address VARCHAR(128),
  phone VARCHAR(11),
  FOREIGN KEY (uid) REFERENCES user(id)
);

CREATE TABLE admin(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(8),
  password VARCHAR(16)
);



