-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-01-12 05:02:49
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buying`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(8) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `business`
--

CREATE TABLE `business` (
  `id` int(11) NOT NULL,
  `name` varchar(8) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `shopman_name` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `business`
--

INSERT INTO `business` (`id`, `name`, `password`, `phone`, `shopman_name`) VALUES
(1, NULL, NULL, '15072772685', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `price` decimal(6,0) DEFAULT NULL,
  `ingredients` varchar(64) DEFAULT NULL,
  `foot_type` varchar(16) NOT NULL,
  `food_start` tinyint(4) NOT NULL,
  `sell_number` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`id`, `shop_id`, `name`, `price`, `ingredients`, `foot_type`, `food_start`, `sell_number`) VALUES
(3, 1, '土豆炖牛腩', '59', NULL, '热销', 5, 25),
(4, 1, '铁板牛肉', '49', NULL, '热销', 4, 25),
(5, 1, '土豆炖牛腩', '59', NULL, '热销', 5, 18),
(6, 1, '铁板牛肉', '49', NULL, '新品', 4, 30),
(7, 1, '土豆炖牛腩', '59', NULL, '新品', 5, 28),
(8, 1, '土豆炖牛腩', '59', NULL, '新品', 5, 35),
(9, 1, '铁板牛肉', '49', NULL, '靓粥', 4, 24),
(10, 1, '土豆炖牛腩', '59', NULL, '靓粥', 5, 19),
(11, 1, '铁板牛肉', '49', NULL, '靓粥', 4, 28),
(12, 1, '土豆炖牛腩', '59', NULL, '饮品', 5, 32),
(13, 1, '铁板牛肉', '49', NULL, '饮品', 4, 37),
(14, 1, '土豆炖牛腩', '59', NULL, '饮品', 5, 35),
(15, 1, '土豆炖牛腩', '59', NULL, '小食', 5, 28),
(16, 1, '铁板牛肉', '49', NULL, '小食', 4, 27),
(17, 1, '土豆炖牛腩', '59', NULL, '小食', 5, 34),
(18, 1, '铁板牛肉', '49', NULL, '套餐', 4, 26),
(19, 1, '土豆炖牛腩', '59', NULL, '套餐', 5, 18),
(20, 1, '铁板牛肉', '49', NULL, '套餐', 4, 37),
(21, 1, '土豆炖牛腩', '59', NULL, '冷藏', 5, 28),
(22, 1, '土豆炖牛腩', '59', '', '冷藏', 5, 25),
(23, 1, '铁板牛肉', '49', NULL, '暖汤', 4, 34),
(24, 1, '土豆炖牛腩', '59', NULL, '暖汤', 5, 28),
(25, 1, '铁板牛肉', '49', NULL, '暖汤', 4, 35),
(26, 1, '土豆炖牛腩', '59', NULL, '优惠', 5, 27),
(27, 1, '铁板牛肉', '49', NULL, '小份热菜', 4, 29),
(28, 1, '土豆炖牛腩', '59', NULL, '热销', 5, 0),
(29, 1, '土豆炖牛腩', '59', NULL, '热销', 5, 0),
(30, 1, '铁板牛肉', '49', NULL, '新品', 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `food_catagory`
--

CREATE TABLE `food_catagory` (
  `id` int(11) NOT NULL,
  `type_name` varchar(32) NOT NULL,
  `shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `food_catagory`
--

INSERT INTO `food_catagory` (`id`, `type_name`, `shop_id`) VALUES
(1, '热销', 1),
(2, '新品', 1),
(3, '靓粥', 1),
(4, '饮品', 1),
(5, '小食', 1),
(6, '套餐', 1),
(7, '冷藏', 1),
(8, '暖汤', 1),
(9, '优惠', 1),
(10, '小份热菜', 1);

-- --------------------------------------------------------

--
-- 表的结构 `order_`
--

CREATE TABLE `order_` (
  `id` int(11) NOT NULL,
  `fid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `order_time` bigint(20) DEFAULT NULL,
  `pay_time` bigint(20) DEFAULT NULL,
  `received_time` bigint(20) DEFAULT NULL,
  `message` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `re_address`
--

CREATE TABLE `re_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `receiver` varchar(8) DEFAULT NULL,
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `shop_name` varchar(16) DEFAULT NULL,
  `shop_type` varchar(16) DEFAULT NULL,
  `province` varchar(12) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `county` varchar(10) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `license` varchar(18) DEFAULT NULL,
  `deliver_fee` decimal(10,0) NOT NULL,
  `deliver_cost` decimal(10,0) NOT NULL,
  `deliver_time` tinyint(11) NOT NULL,
  `shop_img` varchar(64) NOT NULL,
  `shop_start` tinyint(4) NOT NULL,
  `shop_phone` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop`
--

INSERT INTO `shop` (`id`, `business_id`, `shop_name`, `shop_type`, `province`, `city`, `county`, `address`, `license`, `deliver_fee`, `deliver_cost`, `deliver_time`, `shop_img`, `shop_start`, `shop_phone`) VALUES
(1, 1, '叮咚叮咚早餐店（杨家湾店）', '正餐优选', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区', '654654131', '8', '20', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg', 3, '15912345678'),
(2, 1, '咕叽快餐', '下午茶', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区杨家湾五环天地', '458453135486', '10', '15', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg', 5, '15912345678'),
(3, 1, '四美包子', '精选小吃', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区杨家湾', '74867654154', '5', '30', 20, 'img/business/business-icon.png', 4, '15912345678'),
(4, 1, '华莱士', '下午茶', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲大道', '86745645', '11', '30', 15, 'img/business/hualaishi.jpg', 4, '15912345678'),
(5, 1, '华莱士', '精选小吃', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '78457546', '12', '20', 30, 'img/business/business-icon.png', 5, '15912345678'),
(6, 1, '华莱士', '正餐优选', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678'),
(7, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678'),
(8, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678'),
(9, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678'),
(10, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678'),
(11, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678'),
(12, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678'),
(13, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678'),
(14, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678'),
(15, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678'),
(16, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678'),
(17, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678'),
(18, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678'),
(19, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, ''),
(20, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, ''),
(21, 1, '四美包子', '正餐优选', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区杨家湾', '74867654154', '5', '30', 20, 'img/business/business-icon.png', 3, ''),
(22, 1, '叮咚早餐店', '下午茶', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区', '654654131', '8', '20', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg', 4, '');

-- --------------------------------------------------------

--
-- 表的结构 `shop_car`
--

CREATE TABLE `shop_car` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `number` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT NULL,
  `user_name` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `gender`, `email`, `phone`, `avatar`, `user_name`) VALUES
(2, NULL, NULL, NULL, '15072772685', NULL, NULL),
(3, NULL, NULL, NULL, '1507254564', NULL, NULL),
(4, NULL, NULL, NULL, '15997378017', NULL, NULL),
(5, NULL, NULL, NULL, '15926471451', NULL, NULL),
(6, NULL, NULL, NULL, '15926721451', NULL, NULL),
(7, NULL, NULL, NULL, '18154334115', NULL, NULL),
(8, NULL, NULL, NULL, '15012345678', NULL, NULL),
(9, NULL, NULL, NULL, '15912345664', NULL, NULL),
(10, NULL, NULL, NULL, '18812345555', NULL, NULL),
(11, NULL, NULL, NULL, '15912345678', NULL, NULL),
(12, NULL, NULL, NULL, '15926789784', NULL, NULL),
(13, NULL, NULL, NULL, '15646545456', NULL, NULL),
(14, NULL, NULL, NULL, '18845644564', NULL, NULL),
(15, NULL, NULL, NULL, '15956541256', NULL, NULL),
(16, NULL, NULL, NULL, '15789784564', NULL, NULL),
(17, NULL, NULL, NULL, '17445645645', NULL, NULL),
(18, NULL, NULL, NULL, '15045678945', NULL, NULL),
(19, NULL, NULL, NULL, '18895461234', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `busine_id` (`shop_id`);

--
-- Indexes for table `food_catagory`
--
ALTER TABLE `food_catagory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `order_`
--
ALTER TABLE `order_`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fid` (`fid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `re_address`
--
ALTER TABLE `re_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `busine_id` (`business_id`);

--
-- Indexes for table `shop_car`
--
ALTER TABLE `shop_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `business`
--
ALTER TABLE `business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `food_catagory`
--
ALTER TABLE `food_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `order_`
--
ALTER TABLE `order_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `re_address`
--
ALTER TABLE `re_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `shop_car`
--
ALTER TABLE `shop_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 限制导出的表
--

--
-- 限制表 `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `business` (`id`);

--
-- 限制表 `food_catagory`
--
ALTER TABLE `food_catagory`
  ADD CONSTRAINT `food_catagory_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

--
-- 限制表 `order_`
--
ALTER TABLE `order_`
  ADD CONSTRAINT `order__ibfk_1` FOREIGN KEY (`fid`) REFERENCES `food` (`id`),
  ADD CONSTRAINT `order__ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- 限制表 `re_address`
--
ALTER TABLE `re_address`
  ADD CONSTRAINT `re_address_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- 限制表 `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`);

--
-- 限制表 `shop_car`
--
ALTER TABLE `shop_car`
  ADD CONSTRAINT `shop_car_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `shop_car_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `food` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
