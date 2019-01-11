-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-01-10 14:04:28
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
  `busine_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `price` decimal(6,0) DEFAULT NULL,
  `ingredients` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`id`, `busine_id`, `type_id`, `name`, `price`, `ingredients`) VALUES
(1, 1, 1, '水煮肉片', '32', '香辣可口'),
(2, 1, 2, '白切鸡', '54', '鲜嫩');

-- --------------------------------------------------------

--
-- 表的结构 `food_img`
--

CREATE TABLE `food_img` (
  `id` int(11) NOT NULL,
  `fid` int(11) DEFAULT NULL,
  `sm` varchar(128) DEFAULT NULL,
  `md` varchar(128) DEFAULT NULL,
  `lg` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `food_type`
--

CREATE TABLE `food_type` (
  `id` int(11) NOT NULL,
  `tname` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `food_type`
--

INSERT INTO `food_type` (`id`, `tname`) VALUES
(1, '川菜'),
(2, '粤菜'),
(3, '快餐'),
(4, '鲁菜');

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
  `busine_id` int(11) DEFAULT NULL,
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
  `shop_img` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop`
--

INSERT INTO `shop` (`id`, `busine_id`, `shop_name`, `shop_type`, `province`, `city`, `county`, `address`, `license`, `deliver_fee`, `deliver_cost`, `deliver_time`, `shop_img`) VALUES
(1, 1, '叮咚叮咚早餐店（杨家湾店）', '正餐优选', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区', '654654131', '8', '20', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg'),
(2, 1, '咕叽快餐', '下午茶', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区杨家湾五环天地', '458453135486', '10', '15', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg'),
(3, 1, '四美包子', '精选小吃', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区杨家湾', '74867654154', '5', '30', 20, 'img/business/business-icon.png'),
(4, 1, '华莱士', '下午茶', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲大道', '86745645', '11', '30', 15, 'img/business/hualaishi.jpg'),
(5, 1, '华莱士', '精选小吃', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '78457546', '12', '20', 30, 'img/business/business-icon.png'),
(6, 1, '华莱士', '正餐优选', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(7, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(8, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(9, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(10, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(11, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(12, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(13, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(14, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(15, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(16, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(17, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(18, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(19, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(20, 1, '华莱士', '美食', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png'),
(21, 1, '四美包子', '正餐优选', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区杨家湾', '74867654154', '5', '30', 20, 'img/business/business-icon.png'),
(22, 1, '叮咚早餐店', '下午茶', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区', '654654131', '8', '20', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg');

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
(4, NULL, NULL, NULL, '15997378017', NULL, NULL);

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
  ADD KEY `busine_id` (`busine_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `food_img`
--
ALTER TABLE `food_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `food_type`
--
ALTER TABLE `food_type`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `busine_id` (`busine_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `food_img`
--
ALTER TABLE `food_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `food_type`
--
ALTER TABLE `food_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 限制导出的表
--

--
-- 限制表 `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`busine_id`) REFERENCES `business` (`id`),
  ADD CONSTRAINT `food_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`id`);

--
-- 限制表 `food_img`
--
ALTER TABLE `food_img`
  ADD CONSTRAINT `food_img_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `food` (`id`);

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
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`busine_id`) REFERENCES `business` (`id`);

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
