drop database if exists buying;
create database buying;
use buying;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-02-22 08:03:44
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
  `food_id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `price` decimal(6,0) DEFAULT NULL,
  `ingredients` varchar(64) DEFAULT NULL,
  `foot_type` varchar(16) NOT NULL,
  `food_start` tinyint(4) NOT NULL,
  `sell_number` smallint(6) NOT NULL,
  `food_img` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`food_id`, `shop_id`, `name`, `price`, `ingredients`, `foot_type`, `food_start`, `sell_number`, `food_img`) VALUES
(3, 1, '川香回锅肉', '59', '亲，记得点米饭哦！', '热销', 5, 25, 'img/goods/rou.jpg'),
(4, 1, '老长沙肉炒肉', '49', '亲，记得点米饭哦！', '热销', 4, 25, 'img/goods/rou2.jpg'),
(5, 1, '卤藕牛三样', '59', '亲，记得点米饭哦！', '热销', 5, 18, 'img/goods/agg.webp'),
(6, 1, '铁板牛肉', '49', '亲，记得点米饭哦！', '新品', 4, 30, 'img/goods/rou.jpg'),
(7, 1, '南京鸭血粉丝汤', '59', '亲，记得点米饭哦！', '新品', 5, 28, 'img/goods/agg.webp'),
(8, 1, '老坛酸菜龙利鱼', '59', '土豆软糯，牛肉酥烂入味', '新品', 5, 35, 'img/goods/agg.webp'),
(9, 1, '水煮肉片', '49', '豆芽，千张打底，重辣！配有香葱芝麻', '靓粥', 4, 24, 'img/goods/rou.jpg'),
(10, 1, '土豆炖牛腩', '59', '土豆软糯，牛肉酥烂入味', '靓粥', 5, 19, 'img/goods/agg.webp'),
(11, 1, '鹌鹑蛋香干烧排骨', '49', '亲 米饭需要单点', '靓粥', 4, 28, 'img/goods/agg.webp'),
(12, 1, '私房毛血旺', '59', '亲 米饭需要单点', '饮品', 5, 32, 'img/goods/agg.webp'),
(13, 1, '香辣带鱼', '49', '亲 米饭需要单点', '饮品', 4, 37, 'img/goods/agg.webp'),
(14, 1, '外婆下饭菜\r\n', '59', '亲 米饭需要单点', '饮品', 5, 35, 'img/goods/agg.webp'),
(15, 1, '虎皮青椒荷包蛋', '59', '亲 米饭需要单点', '小食', 5, 28, 'img/goods/agg.webp'),
(16, 1, '剁椒黑木耳炒鸡蛋\r\n', '49', '亲 米饭需要单点', '小食', 4, 27, 'img/goods/agg.webp'),
(17, 1, '炒双素(四季豆+土豆条）', '59', '亲 米饭需要单点', '小食', 5, 34, 'img/goods/agg.webp'),
(18, 1, '新派麻婆豆腐', '49', '亲 米饭需要单点', '套餐', 4, 26, 'img/goods/agg.webp'),
(19, 1, '橄菜四季豆肉丁', '59', '亲 米饭需要单点', '套餐', 5, 18, 'img/goods/agg.webp'),
(20, 1, '新派鱼香肉丝', '49', '亲 米饭需要单点', '套餐', 4, 37, 'img/goods/agg.webp'),
(21, 1, '干锅土豆片（孜然味）', '59', '亲 米饭需要单点', '冷藏', 5, 28, 'img/goods/agg.webp'),
(22, 1, '蕃茄紫菜蛋花汤', '59', '亲 米饭需要单点', '冷藏', 5, 25, 'img/goods/agg.webp'),
(23, 1, '铁板牛肉', '49', '亲 米饭需要单点', '暖汤', 4, 34, 'img/goods/agg.webp'),
(24, 1, '土豆炖牛腩', '59', '亲 米饭需要单点', '暖汤', 5, 28, 'img/goods/agg.webp'),
(25, 1, '铁板牛肉', '49', '亲 米饭需要单点', '暖汤', 4, 35, 'img/goods/agg.webp'),
(26, 1, '外婆下饭菜', '59', '亲 米饭需要单点', '优惠', 5, 27, 'img/goods/agg.webp'),
(27, 1, '虎皮青椒荷包蛋', '49', '亲 米饭需要单点', '小份热菜', 4, 29, 'img/goods/agg.webp'),
(28, 1, '土豆炖牛腩', '59', '土豆软糯，牛肉酥烂入味', '热销', 5, 0, 'img/goods/agg.webp'),
(29, 1, '土豆炖牛腩', '59', '土豆软糯，牛肉酥烂入味', '热销', 5, 0, 'img/goods/agg.webp'),
(30, 1, '铁板牛肉', '49', '土豆软糯，牛肉酥烂入味', '新品', 4, 0, 'img/goods/agg.webp');

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
(24, 2, 32, 1, 0, 1548758813088, NULL, 0, NULL, '', 0, '108.00', '', '1548756122250818043'),
(25, 2, 33, 1, 0, 1548758100374, NULL, 0, NULL, '', 1, '118.00', '', '1548756307412500378'),
(26, 25, 37, 1, 0, 1548817042449, NULL, 0, NULL, '', 1, '118.00', '', '1548814394177058400'),
(28, 20, 38, 1, 0, 1548817494646, NULL, 0, NULL, '', 0, '118.00', '', '1548815699473618832'),
(29, 2, 32, 1, 1, 1548844557752, NULL, 0, NULL, '', 1, '226.00', '', '1548841862511645488'),
(30, 2, 32, 1, 1, 1548844647186, NULL, 0, NULL, '', 2, '295.00', '', '1548841953004342191'),
(31, 2, 32, 1, 1, 0, NULL, 0, NULL, '', 0, '147.00', '', '1549887248367395732'),
(32, 2, 32, 1, 0, 1549890758586, NULL, 0, NULL, '', 1, '118.00', '', '1549889308702986630'),
(33, 2, 32, 1, 0, 1549934754936, NULL, 0, NULL, '', 1, '118.00', '', '1549933015333574971'),
(34, 2, 32, 1, 0, 1549955955143, NULL, 0, NULL, '', 1, '118.00', '', '1549953262288564317'),
(35, 2, 32, 1, 0, 1549955955143, NULL, 0, NULL, '', 1, '118.00', '', '1549953338612479403'),
(37, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '118.00', '', '1549953471095950042'),
(38, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '118.00', '', '1549953519459014746'),
(40, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '118.00', '', '1549953567315704767'),
(41, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '118.00', '', '1549953642841331894'),
(42, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '118.00', '', '1549953663659349016'),
(43, 2, 32, 1, 0, 1549971819190, NULL, 0, NULL, '', 1, '108.00', '', '1549970024608450580'),
(44, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '108.00', '', '1549970595043340466'),
(45, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '236.00', '', '1549971072720588696'),
(46, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '177.00', '', '1549971233130899288'),
(47, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '108.00', '', '1549971415652813662'),
(48, 2, 32, 1, 0, 1549971635343, NULL, 0, NULL, '', 0, '108.00', '', '1549971696587275225'),
(49, 2, 32, 1, 1, 1549971728233, NULL, 0, NULL, '', 0, '108.00', '', '1549971734243202345'),
(50, 2, 32, 1, 1, 1549971945883, NULL, 0, NULL, '', 0, '108.00', '', '1549971950259340039'),
(51, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '108.00', '', '1549972062976718049'),
(52, 2, 32, 1, 1, 1549972256922, NULL, 0, NULL, '', 0, '108.00', '', '1549972256927496862'),
(53, 2, 32, 1, 1, 1549972431864, NULL, 0, NULL, '', 0, '108.00', '', '1549972431877125265'),
(54, 2, 32, 1, 1, 1549972462703, NULL, 0, NULL, '', 0, '304.00', '', '1549972462709082320'),
(55, 2, 32, 1, 0, 1549972532623, NULL, 0, NULL, '', 0, '236.00', '', '1549972532633901751'),
(56, 2, 32, 1, 0, 1549972532623, NULL, 0, NULL, '', 0, '236.00', '', '1549972560322347176'),
(57, 2, 32, 1, 1, 1549972571935, NULL, 0, NULL, '', 0, '236.00', '', '1549972571940871128'),
(58, 2, 32, 1, 1, 1549973581776, NULL, 0, NULL, '', 0, '108.00', '', '1549973581782202955'),
(59, 2, 32, 1, 0, 1549974682632, NULL, 0, NULL, '', 0, '167.00', '', '1549974682639297645'),
(60, 2, 32, 1, 0, 1549974763929, NULL, 0, NULL, '', 0, '226.00', '', '1549974763933828300'),
(61, 2, 32, 1, 1, 1549974855207, NULL, 0, NULL, '', 0, '226.00', '微信', '1549974855216428230'),
(62, 2, 32, 1, 1, 1549975049749, NULL, 0, NULL, '', 0, '216.00', '微信', '1549975049761961742'),
(63, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '108.00', '', '1549975634760412630'),
(64, 2, 32, 1, 1, 1550020046023, NULL, 0, NULL, '', 0, '295.00', '支付宝', '1550020046029679217'),
(65, 2, 32, 1, 1, 1550033868429, NULL, 0, NULL, '', 0, '167.00', '支付宝', '1550033868436608516'),
(66, 2, 32, 1, 0, 0, NULL, 0, NULL, '', 0, '196.00', '', '1550033898452441395'),
(67, 2, 32, 1, 1, 1550034064931, NULL, 0, NULL, '', 0, '108.00', '微信', '1550034064938488417'),
(68, 2, 32, 1, 0, 1550035107412, NULL, 0, NULL, '', 0, '196.00', '', '1550035107418935858'),
(69, 2, 34, 1, 0, 0, NULL, 0, NULL, '', 0, '226.00', '', '1550040439950377121'),
(70, 2, 32, 1, 0, 1550059058187, NULL, 0, NULL, '', 0, '108.00', '', '1550059058193144844'),
(71, 2, 32, 1, 0, 1550059429049, NULL, 0, NULL, '', 0, '167.00', '', '1550059429054796664'),
(72, 2, 32, 1, 0, 1550060518033, NULL, 0, NULL, '', 0, '167.00', '', '1550060518056872145'),
(73, 2, 32, 1, 0, 1550060548474, NULL, 0, NULL, '', 0, '177.00', '', '1550060548480002717'),
(74, 2, 32, 1, 0, 1550060666952, NULL, 0, NULL, '', 0, '196.00', '', '1550060666960707451'),
(75, 2, 32, 1, 0, 1550060812599, NULL, 0, NULL, '', 0, '108.00', '', '1550060812605269354'),
(76, 2, 32, 1, 0, 1550062102487, NULL, 0, NULL, '', 0, '108.00', '', '1550062102494653568'),
(77, 2, 32, 1, 0, 1550062152350, NULL, 0, NULL, '', 0, '108.00', '', '1550062152356877769'),
(78, 2, 32, 1, 0, 1550062347565, NULL, 0, NULL, '', 0, '108.00', '', '1550062347570427242'),
(79, 2, 32, 1, 0, 1550062473931, NULL, 0, NULL, '', 0, '196.00', '', '1550062473940921392'),
(80, 2, 32, 1, 0, 1550105043344, NULL, 0, NULL, '', 0, '118.00', '', '1550105043351157375'),
(81, 2, 32, 1, 0, 1550105058704, NULL, 0, NULL, '', 0, '59.00', '', '1550105058709090738'),
(82, 2, 34, 1, 0, 1550105515085, NULL, 0, NULL, '', 0, '177.00', '', '1550105515099005261'),
(83, 2, 32, 1, 0, 1550105670052, NULL, 0, NULL, '', 0, '177.00', '', '1550105670058130347'),
(84, 2, 32, 1, 0, 1550105782386, NULL, 0, NULL, '', 0, '196.00', '', '1550105782391748950'),
(85, 2, 32, 1, 0, 1550105838091, NULL, 0, NULL, '', 0, '354.00', '', '1550105838095432070'),
(86, 2, 32, 1, 0, 1550105917866, NULL, 0, NULL, '', 0, '354.00', '', '1550105917870859993'),
(87, 2, 32, 1, 0, 1550106027650, NULL, 0, NULL, '', 0, '177.00', '', '1550106027655259108'),
(88, 2, 32, 1, 0, 1550106095521, NULL, 0, NULL, '', 0, '226.00', '', '1550106095526087511'),
(89, 2, 32, 1, 0, 1550106125752, NULL, 0, NULL, '', 0, '236.00', '', '1550106125758462672'),
(90, 2, 32, 1, 0, 1550106334072, NULL, 0, NULL, '', 0, '59.00', '', '1550106334076226332'),
(91, 2, 32, 1, 0, 1550106348352, NULL, 0, NULL, '', 0, '108.00', '', '1550106348356704318'),
(92, 2, 32, 1, 0, 1550106446471, NULL, 0, NULL, '', 0, '108.00', '', '1550106446476257274'),
(93, 2, 32, 1, 0, 1550106603005, NULL, 0, NULL, '', 0, '49.00', '', '1550106603010438921'),
(94, 2, 32, 1, 0, 1550106661661, NULL, 0, NULL, '', 0, '49.00', '', '1550106661664263000'),
(95, 2, 32, 1, 0, 1550106701949, NULL, 0, NULL, '', 0, '49.00', '', '1550106701953366645'),
(96, 2, 32, 1, 0, 1550106720644, NULL, 0, NULL, '', 0, '49.00', '', '1550106720649494238'),
(97, 2, 32, 1, 0, 1550107458144, NULL, 0, NULL, '', 0, '49.00', '', '1550107458148196178'),
(98, 2, 32, 1, 0, 1550107503744, NULL, 0, NULL, '', 0, '49.00', '', '1550107503748586442'),
(99, 2, 32, 1, 0, 1550107535599, NULL, 0, NULL, '', 0, '59.00', '', '1550107535603090456'),
(100, 2, 32, 1, 0, 1550107718869, NULL, 0, NULL, '', 0, '49.00', '', '1550107718874979561'),
(101, 2, 32, 1, 0, 1550107810149, NULL, 0, NULL, '', 0, '49.00', '', '1550107810156858212'),
(102, 2, 32, 1, 0, 1550109612752, NULL, 0, NULL, '', 0, '49.00', '', '1550109612758949717'),
(103, 2, 32, 1, 0, 1550109631168, NULL, 0, NULL, '', 0, '59.00', '', '1550109631173550976'),
(104, 2, 32, 1, 0, 1550109670728, NULL, 0, NULL, '', 0, '108.00', '', '1550109670731188777'),
(105, 2, 32, 1, 1, 1550110624441, NULL, 0, NULL, '', 0, '49.00', '微信', '1550110624447716805'),
(106, 2, 32, 1, 1, 1550110636049, NULL, 0, NULL, '', 0, '49.00', '支付宝', '1550110636055848571'),
(107, 2, 32, 1, 0, 1550110769224, NULL, 0, NULL, '', 0, '49.00', '', '1550110769227389012'),
(108, 2, 32, 1, 0, 1550110843439, NULL, 0, NULL, '', 0, '49.00', '', '1550110843442726276'),
(109, 2, 32, 1, 0, 1550110967167, NULL, 0, NULL, '', 0, '49.00', '', '1550110967170930901'),
(110, 2, 32, 1, 0, 1550111070054, NULL, 0, NULL, '', 0, '49.00', '', '1550111070057207502'),
(111, 2, 32, 1, 0, 1550111087693, NULL, 0, NULL, '', 0, '49.00', '', '1550111087697787319'),
(112, 2, 32, 1, 0, 1550111148485, NULL, 0, NULL, '', 0, '49.00', '', '1550111148488982051'),
(113, 2, 32, 1, 0, 1550111236988, NULL, 0, NULL, '', 0, '49.00', '', '1550111236992329586'),
(114, 2, 32, 1, 0, 1550111372036, NULL, 0, NULL, '', 0, '49.00', '', '1550111372042766410'),
(115, 2, 32, 1, 0, 1550111493995, NULL, 0, NULL, '', 0, '49.00', '', '1550111493999593904'),
(116, 2, 32, 1, 0, 1550111776145, NULL, 0, NULL, '', 0, '49.00', '', '1550111776150479049'),
(117, 2, 32, 1, 0, 1550111795185, NULL, 0, NULL, '', 0, '108.00', '', '1550111795190230039'),
(118, 2, 32, 1, 1, 1550748222350, NULL, 0, NULL, '', 1, '118.00', '微信', '1550748229235335707'),
(119, 2, 32, 1, 0, 1550749548062, NULL, 0, NULL, '', 0, '177.00', '', '1550749548067810081'),
(120, 2, 32, 1, 1, 1550749667061, NULL, 0, NULL, '', 0, '108.00', '支付宝', '1550749667065101384'),
(121, 2, 32, 1, 0, 1550751211498, NULL, 0, NULL, '', 0, '177.00', '', '1550751211506704193');

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
(32, 2, 'Tom', '天津', '天津', '和平区', '和平小学', '15945612345', 0, 0),
(33, 2, 'Alice', '河北', '邢台', '内丘县', '451', '15812345678', 0, 0),
(34, 2, '张三', '天津', '天津', '河东区', '43', '15712345678', 1, 0),
(35, 2, '5435', '天津', '天津', '南开区', '4234', '15712345678', 0, 0),
(36, 2, '8768867', '北京', '北京', '宣武区', '55345', '15712346578', 0, 0),
(37, 25, 'Jerry', '河北', '石家庄', '郊区', 'A451', '15012345678', 0, 0),
(38, 20, '王五', '河北', '石家庄', '郊区', 'A21', '15812345678', 1, 0),
(39, 2, 'Jerry', '湖北', '武汉', '武昌区', '卓刀泉南路', '15012345678', 1, 0),
(40, 2, '李大川', '湖北', '武汉', '武昌区', '张之洞路千家街', '15912345645', 1, 0),
(41, NULL, '李琳', '天津', '天津城', '河东区', '张之洞路', '18812345678', 0, 0),
(42, NULL, 'JeJejE', '天津', '天津城', '河东区', '1545', '18945612345', 0, 0);

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
(1, 1, '叮咚叮咚早餐店（杨家湾店）', '正餐优选', '湖北', '武汉', '武昌区', '湖北省武汉市武昌区', '654654131', '8', '20', 30, 'img/brand/miaomiao.jpg', 3, '15912345678'),
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
  `shop_id` int(11) NOT NULL,
  `number` smallint(6) DEFAULT NULL,
  `un_price` float NOT NULL,
  `isOrder` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_car`
--

INSERT INTO `shop_car` (`id`, `uid`, `fid`, `shop_id`, `number`, `un_price`, `isOrder`) VALUES
(260, 2, 4, 1, 1, 49, 24),
(261, 2, 28, 1, 1, 59, 24),
(262, 2, 3, 1, 1, 59, 25),
(263, 2, 5, 1, 1, 59, 25),
(264, 2, 4, 1, 1, 49, 29),
(265, 2, 28, 1, 3, 59, 29),
(266, 25, 3, 1, 1, 59, 26),
(267, 25, 5, 1, 1, 59, 26),
(268, 20, 3, 1, 1, 59, 28),
(269, 20, 5, 1, 1, 59, 28),
(270, 2, 3, 1, 1, 59, 30),
(271, 2, 5, 1, 3, 59, 30),
(272, 2, 29, 1, 1, 59, 30),
(277, 2, 4, 1, 3, 49, 31),
(278, NULL, 4, 1, 4, 49, 0),
(279, 2, 3, 1, 2, 59, 31),
(280, 2, 4, 1, 1, 49, 43),
(281, 2, 28, 1, 1, 59, 43),
(282, 2, 4, 1, 1, 49, 31),
(283, 2, 28, 1, 1, 59, 31),
(284, 2, 3, 1, 4, 59, 31),
(285, 2, 3, 1, 1, 59, 31),
(286, 2, 5, 1, 1, 59, 31),
(287, 2, 29, 1, 1, 59, 31),
(288, 2, 4, 1, 1, 49, 49),
(289, 2, 28, 1, 1, 59, 49),
(290, 2, 4, 1, 1, 49, 50),
(291, 2, 28, 1, 1, 59, 50),
(292, 2, 4, 1, 1, 49, 31),
(293, 2, 28, 1, 1, 59, 31),
(294, 2, 4, 1, 1, 49, 52),
(295, 2, 28, 1, 1, 59, 52),
(296, 2, 3, 1, 1, 59, 53),
(297, 2, 4, 1, 1, 49, 53),
(298, 2, 3, 1, 1, 59, 54),
(299, 2, 4, 1, 5, 49, 54),
(300, 2, 3, 1, 4, 59, 57),
(301, 2, 4, 1, 1, 49, 58),
(302, 2, 28, 1, 1, 59, 58),
(303, 2, 4, 1, 1, 49, 59),
(304, 2, 28, 1, 1, 59, 59),
(305, 2, 29, 1, 1, 59, 59),
(306, 2, 4, 1, 1, 49, 60),
(307, 2, 28, 1, 1, 59, 60),
(308, 2, 5, 1, 1, 59, 60),
(309, 2, 29, 1, 1, 59, 60),
(310, 2, 4, 1, 1, 49, 61),
(311, 2, 28, 1, 1, 59, 61),
(312, 2, 5, 1, 1, 59, 61),
(313, 2, 29, 1, 1, 59, 61),
(314, 2, 4, 1, 1, 49, 62),
(315, 2, 5, 1, 1, 59, 62),
(316, 2, 6, 1, 1, 49, 62),
(317, 2, 8, 1, 1, 59, 62),
(318, 2, 4, 1, 1, 49, 31),
(319, 2, 28, 1, 1, 59, 31),
(320, 2, 3, 1, 5, 59, 64),
(321, 2, 28, 1, 1, 59, 65),
(322, 2, 7, 1, 1, 59, 65),
(323, 2, 30, 1, 1, 49, 65),
(324, 2, 4, 1, 4, 49, 31),
(325, 2, 10, 1, 1, 59, 67),
(326, 2, 13, 1, 1, 49, 67),
(327, 2, 4, 1, 4, 49, 68),
(328, 2, 4, 1, 1, 49, 31),
(329, 2, 28, 1, 3, 59, 31),
(330, 2, 4, 1, 1, 49, 70),
(331, 2, 28, 1, 1, 59, 70),
(332, 2, 4, 1, 1, 49, 71),
(333, 2, 28, 1, 1, 59, 71),
(334, 2, 5, 1, 1, 59, 71),
(335, 2, 4, 1, 1, 49, 72),
(336, 2, 28, 1, 1, 59, 72),
(337, 2, 5, 1, 1, 59, 72),
(338, 2, 5, 1, 2, 59, 73),
(339, 2, 3, 1, 1, 59, 73),
(340, 2, 4, 1, 4, 49, 74),
(341, 2, 4, 1, 1, 49, 75),
(342, 2, 28, 1, 1, 59, 75),
(343, 2, 4, 1, 1, 49, 78),
(344, 2, 28, 1, 1, 59, 78),
(345, 2, 4, 1, 4, 49, 79),
(346, 2, 3, 1, 2, 59, 80),
(347, 2, 3, 1, 1, 59, 81),
(348, 2, 3, 1, 3, 59, 82),
(349, 2, 3, 1, 3, 59, 83),
(350, 2, 4, 1, 4, 49, 84),
(351, 2, 3, 1, 6, 59, 85),
(352, 2, 3, 1, 4, 59, 86),
(353, 2, 5, 1, 1, 59, 86),
(354, 2, 29, 1, 1, 59, 86),
(355, 2, 3, 1, 1, 59, 87),
(356, 2, 5, 1, 1, 59, 87),
(357, 2, 29, 1, 1, 59, 87),
(358, 2, 4, 1, 1, 49, 88),
(359, 2, 28, 1, 3, 59, 88),
(360, 2, 3, 1, 4, 59, 89),
(361, 2, 3, 1, 1, 59, 90),
(362, 2, 4, 1, 1, 49, 91),
(363, 2, 28, 1, 1, 59, 91),
(364, 2, 4, 1, 1, 49, 92),
(365, 2, 28, 1, 1, 59, 92),
(366, 2, 4, 1, 1, 49, 93),
(367, 2, 4, 1, 1, 49, 94),
(368, 2, 4, 1, 1, 49, 95),
(369, 2, 4, 1, 1, 49, 96),
(370, 2, 4, 1, 1, 49, 97),
(371, 2, 4, 1, 1, 49, 98),
(372, 2, 3, 1, 1, 59, 99),
(373, 2, 4, 1, 1, 49, 100),
(374, 2, 4, 1, 1, 49, 101),
(375, 2, 4, 1, 1, 49, 102),
(376, 2, 28, 1, 1, 59, 103),
(377, 2, 4, 1, 1, 49, 104),
(378, 2, 28, 1, 1, 59, 104),
(379, 2, 4, 1, 1, 49, 105),
(380, 2, 4, 1, 1, 49, 106),
(381, 2, 4, 1, 1, 49, 107),
(382, 2, 4, 1, 1, 49, 108),
(383, 2, 4, 1, 1, 49, 109),
(384, 2, 4, 1, 1, 49, 110),
(385, 2, 4, 1, 1, 49, 111),
(386, 2, 4, 1, 1, 49, 112),
(387, 2, 4, 1, 1, 49, 113),
(388, 2, 4, 1, 1, 49, 114),
(389, 2, 4, 1, 1, 49, 115),
(390, 2, 4, 1, 1, 49, 116),
(391, 2, 4, 1, 1, 49, 117),
(392, 2, 28, 1, 1, 59, 117),
(393, 2, 3, 1, 2, 59, 118),
(394, 2, 3, 1, 2, 59, 119),
(395, 2, 5, 1, 1, 59, 119),
(396, 2, 4, 1, 1, 49, 120),
(397, 2, 28, 1, 1, 59, 120),
(398, 2, 28, 1, 1, 59, 121),
(399, 2, 5, 1, 2, 59, 121),
(400, 2, 6, 1, 3, 49, 0),
(401, 2, 8, 1, 1, 59, 0);

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
(25, NULL, NULL, NULL, '15745612345', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `food_catagory`
--
ALTER TABLE `food_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `order_`
--
ALTER TABLE `order_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- 使用表AUTO_INCREMENT `re_address`
--
ALTER TABLE `re_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- 使用表AUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `shop_car`
--
ALTER TABLE `shop_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
