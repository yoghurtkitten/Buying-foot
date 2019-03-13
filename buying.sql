-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-03-13 13:07:48
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `password` varchar(16) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `shopman_name` varchar(8) DEFAULT NULL,
  `idCard` varchar(24) NOT NULL,
  `business_img` varchar(128) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `isPass` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `business`
--

INSERT INTO `business` (`id`, `password`, `phone`, `shopman_name`, `idCard`, `business_img`, `contact`, `isPass`) VALUES
(1, '456789', '18672284395', NULL, '', '0', '', 1),
(2, '123456', '15078452148', '张晓恩', '421182159841257895', '15514387144851859.png', '张三', 0),
(3, '123456', '18154334115', '林木森', '421184521320125471', '15523630243203548.jpg', '林立', 1);

-- --------------------------------------------------------

--
-- 表的结构 `food`
--

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `price` decimal(6,0) DEFAULT NULL,
  `ingredients` varchar(64) DEFAULT NULL,
  `type_id` int(16) NOT NULL,
  `food_start` tinyint(4) NOT NULL,
  `sell_number` smallint(6) NOT NULL,
  `food_img` varchar(128) NOT NULL,
  `inventory` int(11) NOT NULL,
  `initial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`food_id`, `shop_id`, `name`, `price`, `ingredients`, `type_id`, `food_start`, `sell_number`, `food_img`, `inventory`, `initial`) VALUES
(3, 1, '土豆炖牛腩', '42', '记得加米饭哦', 1, 5, 5, '155231767183235.jpg', 1000, 1000),
(4, 1, '地三鲜', '18', '各种素菜搭配，营养健康', 2, 5, 3, '15523177202828159.jpg', 996, 1000),
(5, 1, '台湾水果茶', '15', '饭后消食，补充维C', 4, 5, 0, '15523177625467385.jpg', 1000, 1000),
(6, 1, '番茄牛腩', '45', '番茄的酸甜中和了让牛肉的味道变得更有层次感', 1, 5, 4, '15523178578136394.jpg', 986, 1000),
(7, 1, '皮蛋瘦肉粥', '10', '肉类的鲜香与皮蛋奇妙的相遇，在绵软的白粥中渐渐化开', 3, 5, 0, '15523179825701889.jpg', 1000, 1000),
(8, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 990, 1000),
(9, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 3, '15521085161657440.jpg', 1000, 1000),
(11, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 990, 1000),
(12, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 2, '15521085161657440.jpg', 1000, 1000),
(13, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(14, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(15, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(16, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(17, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(18, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(19, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(20, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(21, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(22, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(23, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(24, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(25, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(26, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(27, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(28, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(29, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(30, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(32, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(33, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(34, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(35, 1, '黄豆炖猪脚', '30', '猪脚肥而不腻，黄豆卤香绵软', 2, 4, 0, '15521085161657440.jpg', 1000, 1000),
(41, 25, '花果山', '12', '果香缤纷', 27, 5, 22, '15523633060954923.jpg', 968, 1000),
(42, 25, '抹茶冰淇淋', '3', '低甜系列，怎么吃都不会胖哦~', 29, 5, 6, '15523772308015038.jpg', 996, 1000),
(43, 25, '奶香烧仙草', '15', '', 31, 4, 0, '1552377791962419.jpg', 1000, 1000),
(44, 25, '奥利奥珍珠奶茶', '15', '非常多的奥利奥哦~', 36, 5, 0, '15523778780248292.jpg', 1000, 1000),
(45, 25, '减脂养颜查', '13', '减肥必备哦~', 37, 4, 0, '15523779966965109.jpg', 1000, 1000),
(46, 25, '巧克力甜筒', '20', '浓浓的巧克力香味儿', 30, 5, 0, '15523781144947041.jpg', 1000, 1000);

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
(7, '人气推荐', 1),
(8, '美食', 1),
(9, '明星推荐', 1),
(10, '配菜', 1),
(27, '水果茶', 25),
(29, '冰淇淋', 25),
(30, '缤纷甜筒', 25),
(31, '烧仙草', 25),
(36, '珍珠奶茶', 25),
(37, '养生茶', 25);

-- --------------------------------------------------------

--
-- 表的结构 `order_`
--

CREATE TABLE `order_` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `addr_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `order_time` bigint(20) DEFAULT NULL,
  `pay_time` bigint(20) DEFAULT NULL,
  `deliver_start` bigint(32) NOT NULL,
  `received_time` bigint(20) DEFAULT NULL,
  `message` varchar(128) DEFAULT NULL,
  `dish_count` tinyint(4) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `pay_method` varchar(16) NOT NULL,
  `order_no` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order_`
--

INSERT INTO `order_` (`id`, `uid`, `addr_id`, `shop_id`, `status`, `order_time`, `pay_time`, `deliver_start`, `received_time`, `message`, `dish_count`, `price`, `pay_method`, `order_no`) VALUES
(1, 29, 51, 1, 2, 1551497972480, NULL, 0, NULL, '', 1, '118.00', '微信', '1551496211831163646'),
(2, 2, 52, 1, 2, 1551781136485, NULL, 0, NULL, '', 2, '118.00', '支付宝', '1551778470337399110'),
(3, 2, 52, 1, 2, 1551779540976, NULL, 0, NULL, '', 0, '98.00', '支付宝', '1551779541150097482'),
(4, 2, 52, 1, 2, 1551783932345, NULL, 0, NULL, '', 0, '98.00', '支付宝', '1551783932525367168'),
(5, 2, 52, 1, 2, 1551833682566, NULL, 0, NULL, '', 0, '49.00', '微信', '1551833683650912125'),
(6, 2, 52, 1, 2, 1551834430057, NULL, 0, NULL, '', 0, '49.00', '支付宝', '1551834431134991760'),
(7, 2, 52, 1, 2, 1551834922229, NULL, 0, NULL, '', 0, '59.00', '支付宝', '1551834923306495721'),
(8, 2, 52, 1, 2, 1551835392026, NULL, 0, NULL, '', 0, '59.00', '支付宝', '1551835393103733197'),
(9, 2, 52, 1, 1, 1551835642856, NULL, 0, NULL, '', 0, '236.00', '支付宝', '1551835643931405149'),
(10, 2, 52, 1, 1, 1551839187318, NULL, 0, NULL, '', 0, '98.00', '支付宝', '1551839188398840655'),
(11, 2, 52, 1, 0, 1551840142657, NULL, 0, NULL, '', 0, '49.00', '微信', '1551840143728686113'),
(12, 2, 52, 1, 1, 1551855894610, NULL, 0, NULL, '', 0, '98.00', '微信', '1551855895698979482'),
(13, 2, 52, 1, 0, 1551855957457, NULL, 0, NULL, '', 0, '177.00', '支付宝', '1551855958478555000'),
(14, 2, 52, 1, 1, 1551877952847, NULL, 0, NULL, '', 0, '98.00', '支付宝', '1551875393334124475'),
(15, 2, 53, 1, 0, 1551950200442, NULL, 0, NULL, '不要香菜', 2, '0.00', '微信', '1551946641305834296'),
(16, 2, 53, 1, 1, 1551951083594, NULL, 0, NULL, '', 0, '57.00', '支付宝', '1551948403519379354'),
(17, 2, 53, 1, 1, 1551948565021, NULL, 0, NULL, '', 0, '155.00', '支付宝', '1551948567197670783'),
(18, 2, 52, 1, 0, 1552044995922, NULL, 0, NULL, '', 0, '155.00', '', '1552044999897354231'),
(19, 2, 53, 1, 1, 1552046584358, NULL, 0, NULL, '', 0, '587.00', '支付宝', '1552046588306469595'),
(20, 2, 52, 1, 1, 1552050031774, NULL, 0, NULL, '', 0, '1745.00', '微信', '1552050035711590516'),
(21, 2, 53, 1, 1, 1552358797104, NULL, 0, NULL, '', 0, '185.00', '微信', '1552358798313956607'),
(22, 2, 53, 1, 1, 1552359086445, NULL, 0, NULL, '', 0, '224.00', '支付宝', '1552359087632918504'),
(23, 2, 53, 1, 1, 1552362562459, NULL, 0, NULL, '', 0, '176.00', '微信', '1552359875958840937'),
(25, 2, 52, 25, 2, 1552446778409, NULL, 0, NULL, '', 0, '49.00', '支付宝', '1552446780905861642'),
(26, 2, 53, 25, 2, 1552447631497, NULL, 0, NULL, '', 0, '52.00', '微信', '1552447633994324637'),
(27, 2, 53, 25, 0, 1552447877391, NULL, 0, NULL, '', 0, '25.00', '支付宝', '1552447879883307655'),
(28, 2, 52, 25, 2, 1552447991519, NULL, 0, NULL, '', 0, '58.00', '支付宝', '1552447994008098382'),
(29, 2, 53, 1, 1, 1552478601528, NULL, 0, NULL, '', 0, '97.00', '支付宝', '1552478603946006452');

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
  `phone` varchar(11) DEFAULT NULL,
  `gender` tinyint(4) NOT NULL,
  `isDel` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `re_address`
--

INSERT INTO `re_address` (`id`, `uid`, `receiver`, `province`, `city`, `country`, `address`, `phone`, `gender`, `isDel`) VALUES
(51, 29, '张三', '湖北省', '武汉市', '洪山区', '杨家湾五环天地', '18627785990', 1, 0),
(52, 2, 'Tom', '湖北省', '武汉市', '硚口区', 'A栋', '15846789456', 1, 0),
(53, 2, 'Jerry', '湖北省', '武汉市', '汉阳区', '中心小学', '15845612345', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `save`
--

CREATE TABLE `save` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `isDel` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `save`
--

INSERT INTO `save` (`id`, `uid`, `sid`, `isDel`) VALUES
(6, 32, 1, 0),
(7, 2, 1, 0);

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
  `shop_phone` varchar(16) NOT NULL,
  `isPass` tinyint(4) NOT NULL,
  `licenseName` varchar(128) NOT NULL,
  `notice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop`
--

INSERT INTO `shop` (`id`, `business_id`, `shop_name`, `shop_type`, `province`, `city`, `county`, `address`, `license`, `deliver_fee`, `deliver_cost`, `deliver_time`, `shop_img`, `shop_start`, `shop_phone`, `isPass`, `licenseName`, `notice`) VALUES
(1, 1, '叮咚叮咚早餐店', '正餐优选', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区', '654654131', '7', '18', 30, 'img/brand/miaomiao.jpg', 3, '15926721451', 0, '', '本餐厅的早餐有营养丰富的、有减脂瘦身的~'),
(2, 2, '咕叽快餐', '下午茶', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区杨家湾五环天地', '458453135486', '10', '15', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg', 5, '15912345678', 0, '', '0'),
(3, 2, '四美包子', '精选小吃', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区杨家湾', '74867654154', '5', '30', 20, 'img/business/business-icon.png', 4, '15912345678', 0, '', '0'),
(4, 2, '华莱士', '下午茶', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲大道', '86745645', '11', '30', 15, 'img/business/hualaishi.jpg', 4, '15912345678', 0, '', '0'),
(5, 2, '华莱士', '精选小吃', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '78457546', '12', '20', 30, 'img/business/business-icon.png', 5, '15912345678', 0, '', '0'),
(6, 2, '华莱士', '正餐优选', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678', 0, '', '0'),
(7, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678', 0, '', '0'),
(8, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678', 0, '', '0'),
(9, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678', 0, '', '0'),
(10, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678', 0, '', '0'),
(11, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678', 0, '', '0'),
(12, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678', 0, '', '0'),
(13, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678', 0, '', '0'),
(14, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678', 0, '', '0'),
(15, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678', 0, '', '0'),
(16, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 3, '15912345678', 0, '', '0'),
(17, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '15912345678', 0, '', '0'),
(18, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '15912345678', 0, '', '0'),
(19, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 5, '', 0, '', '0'),
(20, 2, '华莱士', '美食', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区白沙洲', '66541351', '10', '21', 35, 'img/business/business-icon.png', 4, '', 0, '', '0'),
(21, 2, '四美包子', '正餐优选', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区杨家湾', '74867654154', '5', '30', 20, 'img/business/business-icon.png', 3, '', 0, '', '0'),
(22, 2, '叮咚早餐店', '下午茶', '湖北省', '武汉市', '武昌区', '湖北省武汉市武昌区', '654654131', '8', '20', 30, 'img/brand/95608b68ffb39943dbe10ac8c5b9aacd15834.jpg', 4, '', 0, '', '0'),
(25, 3, '吾饮奶茶店', '下午茶', '湖北省', '武汉市', '武昌区', '楚平路', '456451231245645154', '10', '0', 0, '15523630243203548.jpg', 3, '18154334115', 0, '吾饮有限公司', '0');

-- --------------------------------------------------------

--
-- 表的结构 `shop_car`
--

CREATE TABLE `shop_car` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `shop_id` int(11) NOT NULL,
  `number` smallint(6) DEFAULT NULL,
  `un_price` float NOT NULL,
  `isOrder` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_car`
--

INSERT INTO `shop_car` (`id`, `uid`, `fid`, `shop_id`, `number`, `un_price`, `isOrder`) VALUES
(1, 29, 3, 1, 2, 59, 1),
(2, 2, 7, 1, 2, 59, 2),
(3, 2, 4, 1, 1, 49, 3),
(4, 2, 4, 1, 1, 49, 3),
(5, 2, 4, 1, 2, 49, 4),
(6, 2, 4, 1, 1, 49, 5),
(7, 2, 4, 1, 1, 49, 6),
(8, 2, 3, 1, 1, 59, 7),
(9, 2, 5, 1, 1, 59, 8),
(10, 2, 3, 1, 2, 59, 9),
(11, 2, 3, 1, 2, 59, 9),
(14, 33, 6, 1, 2, 49, 0),
(15, 2, 4, 1, 2, 49, 10),
(16, 2, 4, 1, 1, 49, 11),
(17, 2, 4, 1, 1, 49, 12),
(18, 2, 6, 1, 1, 49, 12),
(19, 2, 3, 1, 3, 59, 13),
(20, 2, 4, 1, 2, 49, 14),
(21, 2, 4, 1, 1, 49, 15),
(22, 2, 3, 1, 1, 59, 15),
(23, 2, 5, 1, 1, 59, 15),
(24, 2, 4, 1, 1, 49, 16),
(25, 2, 4, 1, 3, 49, 17),
(26, 2, 4, 1, 3, 49, 18),
(27, 2, 3, 1, 1, 59, 18),
(28, 2, 4, 1, 1, 49, 18),
(29, 2, 4, 1, 6, 49, 19),
(30, 2, 3, 1, 2, 59, 19),
(31, 2, 5, 1, 1, 59, 19),
(32, 2, 6, 1, 1, 49, 19),
(33, 2, 7, 1, 1, 59, 19),
(34, 2, 4, 1, 21, 49, 20),
(35, 2, 3, 1, 12, 59, 20),
(36, 2, 6, 1, 3, 45, 21),
(37, 2, 3, 1, 1, 42, 21),
(38, 2, 4, 1, 2, 18, 22),
(39, 2, 8, 1, 3, 30, 22),
(40, 2, 11, 1, 3, 30, 22),
(41, 2, 4, 1, 1, 18, 23),
(42, 2, 9, 1, 1, 30, 23),
(43, 2, 12, 1, 1, 30, 23),
(44, 2, 6, 1, 2, 45, 23),
(47, 2, 41, 25, 3, 12, 25),
(48, 2, 42, 25, 1, 3, 25),
(49, 2, 41, 25, 3, 12, 26),
(50, 2, 42, 25, 2, 3, 26),
(51, 2, 41, 25, 1, 12, 27),
(52, 2, 42, 25, 1, 3, 27),
(53, 2, 41, 25, 4, 12, 28),
(54, 2, 3, 1, 1, 42, 29),
(55, 2, 4, 1, 1, 18, 29),
(56, 2, 9, 1, 1, 30, 29);

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
(19, NULL, NULL, NULL, '18895461234', NULL, NULL),
(20, NULL, NULL, NULL, '15078945612', NULL, NULL),
(21, NULL, NULL, NULL, '18672295462', NULL, NULL),
(22, NULL, NULL, NULL, '15072772698', NULL, NULL),
(23, NULL, NULL, NULL, '15932165478', NULL, NULL),
(24, NULL, NULL, NULL, '15072772688', NULL, NULL),
(25, NULL, NULL, NULL, '15745612345', NULL, NULL),
(26, NULL, NULL, NULL, '15845612345', NULL, NULL),
(27, NULL, NULL, NULL, '15784651545', NULL, NULL),
(28, NULL, NULL, NULL, '15784654548', NULL, NULL),
(29, NULL, NULL, NULL, '15451234545', NULL, NULL),
(30, NULL, NULL, NULL, '15484561545', NULL, NULL),
(31, NULL, NULL, NULL, '15645641234', NULL, NULL),
(32, NULL, NULL, NULL, '15456456151', NULL, NULL),
(33, NULL, NULL, NULL, '15434542454', NULL, NULL),
(34, NULL, NULL, NULL, '15452752420', NULL, NULL);

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
  ADD PRIMARY KEY (`food_id`),
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
  ADD KEY `uid` (`uid`),
  ADD KEY `order__ibfk_3` (`addr_id`),
  ADD KEY `order__ibfk_4` (`shop_id`);

--
-- Indexes for table `re_address`
--
ALTER TABLE `re_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `save`
--
ALTER TABLE `save`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `fid` (`fid`),
  ADD KEY `shop_car_ibfk_3` (`shop_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- 使用表AUTO_INCREMENT `food_catagory`
--
ALTER TABLE `food_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `order_`
--
ALTER TABLE `order_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `re_address`
--
ALTER TABLE `re_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- 使用表AUTO_INCREMENT `save`
--
ALTER TABLE `save`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `shop_car`
--
ALTER TABLE `shop_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- 限制导出的表
--

--
-- 限制表 `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

--
-- 限制表 `food_catagory`
--
ALTER TABLE `food_catagory`
  ADD CONSTRAINT `food_catagory_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

--
-- 限制表 `order_`
--
ALTER TABLE `order_`
  ADD CONSTRAINT `order__ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order__ibfk_3` FOREIGN KEY (`addr_id`) REFERENCES `re_address` (`id`),
  ADD CONSTRAINT `order__ibfk_4` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

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
  ADD CONSTRAINT `shop_car_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `food` (`food_id`),
  ADD CONSTRAINT `shop_car_ibfk_3` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
