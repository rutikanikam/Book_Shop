-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 11, 2022 at 07:31 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(3, 2, 15, 100, 1, '2022-01-11 12:45:37'),
(4, 2, 14, 300, 1, '2022-01-11 12:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category` varchar(250) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(5, 'PHILOSOPHY', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-12-20 15:03:30'),
(6, 'SCIENCE', '', 1, '2021-12-21 12:42:55'),
(7, 'SERIES', '', 1, '2021-12-21 12:43:13'),
(8, 'SELF HELP', '', 1, '2021-12-21 12:43:46'),
(9, 'POETRY', '', 1, '2021-12-21 12:44:56'),
(10, 'BIOGRAPHIES', '', 1, '2021-12-21 12:45:16'),
(11, 'DIARIES', '', 1, '2021-12-21 12:45:31'),
(12, 'SOCIAL SCIENCE', '', 1, '2021-12-21 12:45:49'),
(13, 'RELIGIOUS', '', 1, '2021-12-21 12:46:11'),
(14, 'ACTION AND ADVENTURE', '', 1, '2021-12-21 14:54:43'),
(15, 'HISTRORY', '', 1, '2021-12-21 14:54:53'),
(16, 'ANTHOLOGIES', '', 1, '2021-12-21 14:55:09'),
(17, 'MATH', '', 1, '2021-12-21 14:55:20'),
(18, 'ART', '', 1, '2021-12-21 14:55:41'),
(19, 'DRAMA', '', 1, '2021-12-21 14:55:50'),
(20, 'SATIRE', '', 1, '2021-12-21 14:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `town` varchar(40) DEFAULT NULL,
  `pincode` varchar(40) DEFAULT NULL,
  `taluka` varchar(40) DEFAULT NULL,
  `district` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `middle_name`, `lastname`, `gender`, `contact`, `email`, `town`, `pincode`, `taluka`, `district`, `state`, `password`, `default_delivery_address`, `date_created`) VALUES
(2, 'Pradip', 'shivaji', 'jadhav', 'Male', '9890719919', 'pradip.501jadhav@gmail.com', 'tasgaon', '415004', 'satara', 'satara', 'MAHARASHTRA', '827ccb0eea8a706c4c34a16891f84e7b', 'Near Bhairavnath Temple\r\nA/P Tasgaon, Tal-Dist : Satara,', '2021-12-20 13:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 15000, '2021-07-16 10:02:39', '2021-12-20 15:49:23'),
(3, 3, 10, 2500, '2021-07-16 12:05:54', NULL),
(4, 4, 50, 1999.99, '2021-07-16 13:12:10', NULL),
(5, 5, 50, 1, '2021-12-21 12:56:46', NULL),
(6, 6, 2, 80, '2021-12-21 13:07:25', NULL),
(7, 7, 6, 180, '2021-12-21 13:17:56', NULL),
(8, 8, 5, 150, '2021-12-21 13:43:50', NULL),
(9, 9, 5, 220, '2021-12-21 13:46:39', NULL),
(10, 10, 5, 25, '2021-12-21 13:50:22', NULL),
(11, 11, 5, 30, '2021-12-21 14:28:26', NULL),
(12, 12, 5, 50, '2021-12-21 14:36:12', NULL),
(13, 13, 5, 150, '2021-12-21 14:48:40', NULL),
(14, 14, 50, 300, '2021-12-21 15:12:28', '2022-01-05 13:42:37'),
(15, 15, 50, 100, '2021-12-23 16:37:36', '2022-01-05 12:11:49');

-- --------------------------------------------------------

--
-- Stand-in structure for view `mostsalable`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `mostsalable`;
CREATE TABLE IF NOT EXISTS `mostsalable` (
`id` int(30)
,`title` varchar(250)
,`author` text
,`quantity` double
,`price` double
,`qnt` int(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `msale`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `msale`;
CREATE TABLE IF NOT EXISTS `msale` (
`id` int(30)
,`title` varchar(250)
,`description` text
,`status` tinyint(1)
,`date_created` datetime
,`author` text
,`sum` int(30)
,`price` double
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `pscharge` varchar(50) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `pscharge`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 2, 'Near Bhairavnath Temple\r\nA/P Tasgaon, Tal-Dist : Satara,', 'cod', 2, 460, '60', 0, 0, '2022-01-05 14:55:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
CREATE TABLE IF NOT EXISTS `order_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(1, 1, 15, 1, 100, 100),
(2, 1, 14, 1, 300, 300);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `author` text NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `b_weight` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `author`, `language`, `b_weight`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'The Joy of PHP: A Beginner\\\'s Guide to Programming', 'Alan Forbes', NULL, NULL, '&lt;p&gt;&lt;span style=\\\\\\&quot;text-align: justify;\\\\\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non ultrices tortor. Sed at ligula non lectus tempor bibendum a nec ante. Maecenas iaculis vitae nisi eu dictum. Duis sit amet enim arcu. Etiam blandit vulputate magna, non lobortis velit pharetra vel. Morbi sollicitudin lorem sed augue suscipit, eu commodo tortor vulputate. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent eleifend interdum est, at gravida erat molestie in. Vestibulum et consectetur dui, ac luctus arcu. Curabitur et viverra elit. Cras ac eleifend ipsum, ac suscipit leo. Vivamus porttitor ac risus eu ultricies. Morbi malesuada mi vel luctus sagittis. Ut vestibulum porttitor est, id rutrum libero. Mauris at lacus vehicula, aliquam purus quis, pharetra lorem.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-16 09:43:11'),
(2, 1, 1, 'Modern PHP: New Features and Good Practices', 'Josh Lockhart', NULL, NULL, '&lt;p&gt;&lt;span style=\\\\\\\\\\\\\\&quot;text-align: justify;\\\\\\\\\\\\\\&quot;&gt;Proin consectetur massa ut quam molestie porta. Donec sit amet ligula odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi ex sapien, pulvinar ac arcu at, luctus scelerisque nibh. In dolor velit, pellentesque eu blandit a, mollis ac neque. Fusce tortor lectus, aliquam et eleifend id, aliquet ut libero. Nunc scelerisque vulputate turpis quis volutpat. Vivamus malesuada sem in dapibus aliquam. Vestibulum imperdiet, nulla vitae pharetra pretium, magna felis placerat libero, quis tincidunt felis diam nec nisi. Sed scelerisque ullamcorper cursus. Suspendisse posuere, velit nec rhoncus cursus, urna sapien consectetur est, et lacinia odio leo nec massa. Nam vitae nunc vitae tortor vestibulum consequat ac quis risus. Sed finibus pharetra orci, id vehicula tellus eleifend sit amet.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-16 10:08:53'),
(3, 1, 2, 'English Grammar in Use', 'Raymond Murphy, Surai Pongtongcharoen', NULL, NULL, '&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non ultrices tortor. Sed at ligula non lectus tempor bibendum a nec ante. Maecenas iaculis vitae nisi eu dictum. Duis sit amet enim arcu. Etiam blandit vulputate magna, non lobortis velit pharetra vel. Morbi sollicitudin lorem sed augue suscipit, eu commodo tortor vulputate. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent eleifend interdum est, at gravida erat molestie in. Vestibulum et consectetur dui, ac luctus arcu. Curabitur et viverra elit. Cras ac eleifend ipsum, ac suscipit leo. Vivamus porttitor ac risus eu ultricies. Morbi malesuada mi vel luctus sagittis. Ut vestibulum porttitor est, id rutrum libero. Mauris at lacus vehicula, aliquam purus quis, pharetra lorem.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-16 12:03:08'),
(4, 1, 2, 'English Grammar for Dummies', 'Geraldine Woods', NULL, NULL, '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Ut et urna sapien. Nulla lacinia sagittis felis id cursus. Etiam eget lacus quis enim aliquet dignissim. Nulla vel elit ultrices, venenatis quam sed, rutrum magna. Pellentesque ultricies non lorem hendrerit vestibulum. Maecenas lacinia pharetra nisi, at pharetra nunc placerat nec. Maecenas luctus dolor in leo malesuada, vel aliquet metus sollicitudin. Curabitur sed pellentesque sem, in tincidunt mi. Aliquam sodales aliquam felis, eget tristique felis dictum at. Proin leo nisi, malesuada vel ex eu, dictum pellentesque mauris. Quisque sit amet varius augue.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Sed quis imperdiet est. Donec lobortis tortor id neque tempus, vel faucibus lorem mollis. Fusce ut sollicitudin risus. Aliquam iaculis tristique nunc vel feugiat. Sed quis nulla non dui ornare porttitor eu vitae nisi. Curabitur at quam ut libero convallis mattis vel eget mauris. Vivamus vitae lectus ligula. Nulla facilisi. Vivamus tristique maximus nulla, vel mollis felis blandit posuere. Curabitur mi risus, rutrum non magna at, molestie gravida magna. Aenean neque sapien, volutpat a ullamcorper nec, iaculis quis est.&lt;/p&gt;', 1, '2021-07-16 13:11:17'),
(5, 5, 8, 'Tondolakh', 'Dr. R. P. Parnerkar', NULL, NULL, '&lt;p&gt;&lt;span style=\\&quot;color: rgb(130, 130, 130); font-family: Rubik, sans-serif; font-size: 15px; text-align: justify; background-color: rgb(255, 255, 255);\\&quot;&gt;à¤®à¤¾à¤£à¥‚à¤¸ à¤œà¥€à¤µà¤¨ à¤œà¤—à¤¤à¤¾à¤¨à¤¾ à¤•à¤¾à¤¹à¥€ à¤—à¥‹à¤·à¥à¤Ÿà¥€ à¤¯à¤¾ à¤ à¤°à¤µà¥‚à¤¨ à¤¸à¤¾à¤§à¥à¤¯ à¤•à¤°à¤£à¥à¤¯à¤¾à¤šà¤¾ à¤ªà¥à¤°à¤¯à¤¤à¥à¤¨ à¤•à¤°à¤¤ à¤…à¤¸à¤¤à¥‹. à¤¯à¤¾ à¤ à¤°à¤µà¤¿à¤²à¥‡à¤²à¥à¤¯à¤¾ à¤—à¥‹à¤·à¥à¤Ÿà¥€ à¤¸à¤¾à¤§à¤²à¥à¤¯à¤¾ à¤¤à¤° à¤¤à¥à¤¯à¤¾à¤¸ à¤¸à¤®à¤¾à¤§à¤¾à¤¨ à¤²à¤¾à¤­à¤¤à¥‡. à¤¹à¥‡à¤š à¤¸à¤®à¤¾à¤§à¤¾à¤¨ à¤¤à¥à¤¯à¤¾à¤šà¥à¤¯à¤¾ à¤œà¥€à¤µà¤¨à¤¾à¤¤ à¤¸à¥à¤– à¤¨à¤¿à¤°à¥à¤®à¤¾à¤£ à¤•à¤°à¤¤à¥‡, à¤œà¥€à¤µà¤¨à¤¾à¤¤à¥€à¤² à¤†à¤¨à¤‚à¤¦ à¤µà¤¾à¤¢à¤µà¤¤à¥‡, à¤†à¤¤à¥à¤®à¤µà¤¿à¤¶à¥à¤µà¤¾à¤¸ à¤µà¤¾à¤¢à¤µà¤¤à¥‡ à¤†à¤£à¤¿ à¤ªà¥à¤¢à¥‡ à¤…à¤§à¤¿à¤• à¤œà¤¬à¤¾à¤¬à¤¦à¤¾à¤°à¥&zwj;à¤¯à¤¾ à¤˜à¥‡à¤£à¥à¤¯à¤¾à¤¸ à¤ªà¥à¤°à¤µà¥ƒà¤¤à¥à¤¤ à¤•à¤°à¥‚à¤¨ à¤œà¥€à¤µà¤¨ à¤ªà¥à¤°à¤—à¤¤à¥€à¤ªà¤¥à¤¾à¤µà¤° à¤ à¥‡à¤µà¤¤à¥‡. à¤ªà¤£, à¤¹à¥‡ à¤¸à¤°à¥à¤µ à¤•à¤°à¤¤à¤¾à¤¨à¤¾ à¤œà¤° à¤†à¤ªà¤£à¤¾ à¤¸à¥à¤µà¤¤:à¤¸ à¤œà¤° à¤†à¤ªà¤²à¥€à¤š à¤“à¤³à¤– à¤¨à¤¸à¥‡à¤² à¤¤à¤° à¤†à¤ªà¤£ à¤˜à¥‡à¤¤ à¤…à¤¸à¤²à¥‡à¤²à¥à¤¯à¤¾ à¤ªà¥à¤°à¤¯à¤¤à¥à¤¨à¤¾à¤‚à¤¨à¤¾ à¤†à¤ªà¤£à¤¾à¤¸ à¤…à¤ªà¥‡à¤•à¥à¤·à¤¿à¤¤ à¤¯à¤¶ à¤®à¤¿à¤³à¤¤ à¤¨à¤¾à¤¹à¥€. à¤†à¤ªà¤²à¥€ à¤†à¤ªà¤£à¤¾à¤¸à¤š à¤“à¤³à¤– à¤¨à¤¸à¥‡à¤² à¤¤à¤° à¤†à¤ªà¤£ à¤•à¥‹à¤ à¥‡ à¤šà¥à¤•à¤¤à¥‹ à¤†à¤¹à¥‹à¤¤ à¤¹à¥‡à¤¸à¥à¤¦à¥à¤§à¤¾ à¤•à¤³à¤£à¥‡ à¤…à¤µà¤˜à¤¡ à¤¹à¥‹à¤¤à¥‡. à¤ªà¥à¤°à¤¤à¥à¤¯à¤•à¤¾à¤¸ à¤¹à¥€ à¤¸à¥à¤µà¤¤:à¤šà¥€ à¤¤à¥‹à¤‚à¤¡à¤“à¤³à¤– à¤¹à¥‹à¤£à¥‡ à¤…à¤¤à¥à¤¯à¤‚à¤¤ à¤—à¤°à¤œà¥‡à¤šà¥‡ à¤†à¤¹à¥‡. à¤¹à¥€ à¤¹à¥‹à¤£à¥à¤¯à¤¾à¤šà¥à¤¯à¤¾ à¤¦à¥ƒà¤·à¥à¤Ÿà¥€à¤¨à¥‡ à¤¤à¤¤à¥à¤¤à¥à¤µà¤œà¥à¤ž, à¤…à¤°à¥à¤¥à¤¶à¤¾à¤¸à¥à¤¤à¥à¤°à¥€, à¤¸à¤¦à¥&zwnj;à¤—à¥à¤°à¥ à¤ªà¤°à¤® à¤ªà¥‚à¤œà¤¨à¥€à¤¯ à¤¡à¥‰. à¤°à¤¾à¤®à¤šà¤‚à¤¦à¥à¤° à¤ªà¥à¤°à¤²à¥à¤¹à¤¾à¤¦ à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤®à¤¾à¤°à¥à¤—à¤¦à¤°à¥à¤¶à¤¨à¤¾à¤šà¤¾ à¤¸à¤‚à¤•à¤²à¤¿à¤¤ à¤¸à¥à¤µà¤°à¥‚à¤ªà¤¾à¤¤à¥€à¤² &lsquo;à¤¤à¥‹à¤‚à¤¡à¤“à¤³à¤–&rsquo; à¤¹à¤¾ à¤—à¥à¤°à¤‚à¤¥ à¤µà¤¾à¤šà¤•à¤¾à¤‚à¤¸à¤¾à¤ à¥€ à¤¨à¤•à¥à¤•à¥€à¤š à¤‰à¤ªà¤¯à¥‹à¤—à¥€ à¤ à¤°à¤¤à¥‹. à¤¯à¤¾ à¤—à¥à¤°à¤‚à¤¥à¤¾à¤¤ à¤¸à¤¦à¥&zwnj;à¤—à¥à¤°à¥ à¤¡à¥‰. à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤®à¤¹à¤¾à¤°à¤¾à¤œ à¤¯à¤¾à¤‚à¤¸ à¤¤à¥à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤¦à¤°à¥à¤¶à¤¨à¤¾à¤²à¤¾, à¤­à¥‡à¤Ÿà¥€à¤²à¤¾ à¤†à¤²à¥‡à¤²à¥à¤¯à¤¾ à¤µà¥à¤¯à¤•à¥à¤¤à¥€à¤‚à¤¨à¥€ à¤µà¤¿à¤šà¤¾à¤°à¤²à¥‡à¤²à¥‡ à¤ªà¥à¤°à¤¶à¥&zwj;à¤¨ à¤µ à¤¤à¥à¤¯à¤¾ à¤ªà¥à¤°à¤¶à¥&zwj;à¤¨à¤¾à¤‚à¤¨à¤¾ à¤ª. à¤ªà¥‚. à¤¡à¥‰. à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤®à¤¹à¤¾à¤°à¤¾à¤œà¤¾à¤‚à¤¨à¥€ à¤¦à¤¿à¤²à¥‡à¤²à¥€ à¤‰à¤¤à¥à¤¤à¤°à¥‡ à¤¤à¥à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤¶à¤¿à¤·à¥à¤¯à¤¾à¤‚à¤¨à¥€ à¤²à¤¿à¤–à¤¿à¤¤ à¤¸à¥à¤µà¤°à¥‚à¤ªà¤¾à¤¤ à¤¨à¥‹à¤‚à¤¦à¤µà¤¿à¤²à¥€ à¤…à¤¸à¥‚à¤¨, à¤¤à¥à¤¯à¤¾ à¤²à¤¿à¤–à¤¾à¤£à¤¾à¤šà¥‡ à¤¹à¥‡ à¤¸à¤‚à¤•à¤²à¤¨ à¤¹à¥‹à¤¯. à¤œà¥‡ à¤ªà¥à¤°à¤¶à¥&zwj;à¤¨ à¤†à¤ªà¤£à¤¾ à¤¸à¤°à¥à¤µà¤¾à¤‚à¤¨à¤¾ à¤°à¥‹à¤œà¤šà¥‡ à¤œà¥€à¤µà¤¨ à¤œà¤—à¤¤à¤¾à¤¨à¤¾ à¤ªà¤¡à¤¤à¤¾à¤¤, à¤ªà¤£ à¤•à¤¾à¤¹à¥€ à¤•à¤¾à¤°à¤£à¤¾à¤¨à¥‡ à¤…à¤¨à¥à¤¤à¥à¤¤à¤°à¥€à¤¤ à¤°à¤¾à¤¹à¤¤à¤¾à¤¤, à¤¤à¥‡à¤¹à¥€ à¤µà¤¾à¤šà¤•à¤¾à¤‚à¤¸ à¤¯à¥‡à¤¥à¥‡ à¤‰à¤¤à¥à¤¤à¤°à¤¾à¤¸à¤¹à¤¿à¤¤ à¤¸à¤¾à¤ªà¤¡à¤¤à¥€à¤². à¤†à¤ªà¤£ à¤œà¤—à¤¤à¤¾à¤¨à¤¾ à¤†à¤ªà¤²à¥à¤¯à¤¾ à¤®à¤¨à¤¾à¤¤ à¤•à¤¾à¤¹à¥€ à¤¸à¤‚à¤•à¤²à¥à¤ªà¤¨à¤¾ à¤…à¤¶à¤¾ à¤…à¤¸à¤¤à¤¾à¤¤ à¤•à¥€, à¤œà¥à¤¯à¤¾à¤šà¤¾ à¤–à¤°à¤¾ à¤…à¤°à¥à¤¥ à¤†à¤ªà¤£à¤¾à¤¸ à¤ à¤¾à¤Šà¤• à¤¨à¤¸à¤¤à¥‹ à¤…à¤¥à¤µà¤¾ à¤¤à¥à¤¯à¤¾ à¤¸à¤‚à¤•à¤²à¥à¤ªà¤¨à¤¾à¤‚à¤šà¤¾ à¤µà¥à¤¯à¤µà¤¹à¤¾à¤°à¤¾à¤¤ à¤•à¤¸à¤¾ à¤‰à¤ªà¤¯à¥‹à¤— à¤•à¥‡à¤²à¤¾ à¤œà¤¾à¤µà¤¾ à¤¹à¥‡à¤¹à¥€ à¤•à¤³à¤¤ à¤¨à¤¸à¤¤à¥‡. à¤¬à¤°à¥&zwj;à¤¯à¤¾à¤š à¤µà¥‡à¤³à¤¾ à¤†à¤ªà¤£ à¤•à¤µà¤Ÿà¤¾à¤³à¥‚à¤¨ à¤¬à¤¸à¤²à¥‡à¤²à¥à¤¯à¤¾ à¤¸à¤‚à¤•à¤²à¥à¤ªà¤¨à¤¾ à¤µà¤¾ à¤¸à¤¿à¤¦à¥à¤§à¤¾à¤‚à¤¤ à¤†à¤ªà¤²à¥à¤¯à¤¾à¤š à¤ªà¥à¤°à¤—à¤¤à¥€à¤¤ à¤…à¤¡à¤¸à¤° à¤¨à¤¿à¤°à¥à¤®à¤¾à¤£ à¤•à¤°à¤¤à¤¾à¤¤ à¤µà¤¾ à¤®à¥‡à¤‚à¤Ÿà¤² à¤¬à¥à¤²à¥‹à¤•à¥‡à¤œ à¤šà¥‡ à¤•à¤¾à¤® à¤•à¤°à¤¤à¤¾à¤¤. à¤¯à¤¾ à¤—à¥à¤°à¤‚à¤¥à¤¾à¤šà¥à¤¯à¤¾ à¤µà¤¾à¤šà¤¨à¤¾à¤¨à¥‡ à¤¹à¤¾ à¤¤à¤¿à¤¢à¤¾ à¤¸à¥à¤Ÿà¤¤à¥‹ à¤µ à¤¤à¥à¤¯à¤¾à¤‚à¤šà¤¾ à¤–à¤°à¤¾ à¤…à¤°à¥à¤¥ à¤•à¤³à¥‚à¤¨ à¤¨à¤¿à¤°à¥à¤®à¤¾à¤£ à¤à¤¾à¤²à¥‡à¤²à¥‡ à¤…à¤¡à¤¸à¤° à¤¦à¥‚à¤° à¤¹à¥‹à¤¤à¤¾à¤¤, à¤¹à¤¾ à¤œà¥€à¤µà¤¨à¤¾à¤šà¥à¤¯à¤¾ à¤µà¤¿à¤µà¤¿à¤§ à¤•à¥à¤·à¥‡à¤¤à¥à¤°à¤¾à¤¤ à¤•à¤¾à¤°à¥à¤¯à¤°à¤¤ à¤…à¤¸à¤£à¤¾à¤°à¥&zwj;à¤¯à¤¾ à¤…à¤¨à¥‡à¤• à¤µà¤¾à¤šà¤•à¤¾à¤‚à¤šà¤¾ à¤…à¤¨à¥à¤­à¤µ à¤†à¤¹à¥‡. à¤—à¥à¤°à¤‚à¤¥à¤µà¤¾à¤šà¤¨à¤¾à¤¨à¥‡ à¤ªà¥‚à¤°à¥à¤£à¤µà¤¾à¤¦ à¤¯à¤¾ à¤ªà¤°à¤® à¤ªà¥‚à¤œà¤¨à¥€à¤¯ à¤¸à¤¦à¥&zwnj;à¤—à¥à¤°à¥ à¤¡à¥‰. à¤°à¤¾. à¤ªà¥à¤°. à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤¤à¤¤à¥à¤¤à¥à¤µà¤œà¥à¤žà¤¾à¤¨à¤¾à¤šà¥€à¤¹à¥€ à¤¤à¥‹à¤‚à¤¡à¤“à¤³à¤– à¤µà¤¾à¤šà¤•à¤¾à¤‚à¤¸ à¤¹à¥‹à¤¤à¥‡. à¤—à¥à¤°à¤‚à¤¥à¤¾à¤šà¥€ à¤®à¤¾à¤‚à¤¡à¤£à¥€ à¤ªà¥à¤°à¤¶à¥&zwj;à¤¨à¥‹à¤¤à¥à¤¤à¤° à¤µà¤¾ à¤ à¤°à¤¾à¤µà¤¿à¤• à¤®à¥à¤¦à¥à¤¦à¥à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤¯à¤¥à¤¾à¤¯à¥‹à¤—à¥à¤¯ à¤®à¤¾à¤‚à¤¡à¤£à¥€à¤šà¥à¤¯à¤¾ à¤¸à¥à¤µà¤°à¥‚à¤ªà¤¾à¤¤ à¤…à¤¸à¥‚à¤¨, à¤ªà¥à¤°à¤¶à¥&zwj;à¤¨-à¤®à¥à¤¦à¥à¤¦à¥‡ à¤¹à¥‡ à¤¸à¤°à¥à¤µà¤¸à¤¾à¤®à¤¾à¤¨à¥à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤œà¥€à¤µà¤¨à¤¾à¤¶à¥€ à¤¨à¤¿à¤—à¤¡à¥€à¤¤ à¤µ à¤ª. à¤ªà¥‚. à¤¡à¥‰. à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤®à¤¹à¤¾à¤°à¤¾à¤œà¤¾à¤‚à¤¨à¥€ à¤¦à¤¿à¤²à¥‡à¤²à¥à¤¯à¤¾ à¤‰à¤¤à¥à¤¤à¤°à¤¾à¤šà¥€ à¤­à¤¾à¤·à¤¾ à¤…à¤¤à¥à¤¯à¤‚à¤¤ à¤¸à¤°à¤³ à¤µ à¤¸à¤®à¤œà¤£à¥à¤¯à¤¾à¤¸ à¤…à¤¤à¥à¤¯à¤‚à¤¤ à¤¸à¥à¤²à¤­ à¤…à¤¶à¥€ à¤†à¤¹à¥‡.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-12-21 12:52:43'),
(6, 6, 9, 'Kal Vichar', 'Dr. R. P. Parnerkar', NULL, NULL, '', 1, '2021-12-21 13:06:40'),
(7, 7, 10, 'Poornawad Kathamruta Bhag 3', 'N. N. Patankar', NULL, NULL, '', 1, '2021-12-21 13:17:23'),
(8, 10, 11, 'Man Of Gems And A Gem Of Man', 'Adv. S. S. Aboti', NULL, NULL, '', 1, '2021-12-21 13:43:38'),
(9, 12, 12, 'Ek Aahe Samaj', 'S. S. Patil', NULL, NULL, '', 1, '2021-12-21 13:46:20'),
(10, 11, 13, 'Maitriparva', 'Namdevrao Vhatkar', NULL, NULL, '', 1, '2021-12-21 13:50:00'),
(11, 9, 14, 'Abhinav Abhang', 'Dr. R. P. Parnerkar', NULL, NULL, '', 1, '2021-12-21 14:27:49'),
(12, 13, 15, 'chit shakti upasana', 'C. J. Pannabhatti', NULL, NULL, '', 1, '2021-12-21 14:35:29'),
(13, 8, 16, 'Pratibodh', 'Adv. V. R. Parnerkar', 'marathi', '500', '', 1, '2021-12-21 14:46:41'),
(14, 14, 18, 'Kusummala', 'Dr. R. P. Parnerkar', '', '200', '&lt;div style=\\&quot;text-align: left;\\&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div style=\\&quot;text-align: left;\\&quot;&gt;&lt;span style=\\&quot;color: rgb(130, 130, 130); font-family: Rubik, sans-serif; font-size: 15px; text-align: justify; background-color: rgb(255, 255, 255);\\&quot;&gt;à¤¤à¤¤à¥à¤¤à¥à¤µà¤œà¥à¤ž, à¤…à¤°à¥à¤¥à¤¶à¤¾à¤¸à¥à¤¤à¥à¤°à¥€, à¤¸à¤¦à¥à¤—à¥à¤°à¥ à¤¡à¥‰. à¤°à¤¾à¤®à¤šà¤‚à¤¦à¥à¤° à¤ªà¥à¤°. à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤®à¤¹à¤¾à¤°à¤¾à¤œ à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤ªà¥‚à¤°à¥à¤£à¤µà¤¾à¤¦ à¤¯à¤¾ à¤¤à¤¤à¥à¤¤à¥à¤µà¤œà¥à¤žà¤¾à¤¨à¤¾à¤¶à¥€ à¤¸à¤‚à¤¬à¤‚à¤§à¤¿à¤¤ à¤—à¥à¤°à¤‚à¤¥à¤¸à¤‚à¤ªà¤¦à¥‡à¤šà¥‡ à¤ªà¥à¤°à¤•à¤¾à¤¶à¤¨ à¤¶à¥à¤°à¥€ à¤µà¤¿à¤®à¤² à¤ªà¤¬à¥à¤²à¤¿à¤¶à¤°à¥à¤¸ à¤¦à¥à¤µà¤¾à¤°à¥‡ à¤•à¥‡à¤²à¥‡ à¤œà¤¾à¤¤à¥‡. à¤ªà¤°à¤® à¤ªà¥‚à¤œà¤¨à¥€à¤¯ à¤¡à¥‰. à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤®à¤¹à¤¾à¤°à¤¾à¤œà¤¾à¤‚à¤¨à¥€ à¤¶à¥à¤°à¥€à¤—à¤£à¥‡à¤¶à¤¾à¤šà¥à¤¯à¤¾ à¤†à¤œà¥à¤žà¥‡à¤¨à¥à¤¸à¤¾à¤° à¤¸à¤¦à¥à¤—à¥à¤°à¥ à¤ªà¤¦ à¤¸à¥à¤µà¥€à¤•à¤¾à¤°à¤²à¥à¤¯à¤¾à¤¨à¤‚à¤¤à¤° à¤¤à¥à¤¯à¤¾à¤‚à¤¨à¥€ à¤ªà¥à¤°à¤¤à¤¿à¤ªà¤¾à¤¦à¥€à¤¤ à¤•à¥‡à¤²à¥‡à¤²à¥à¤¯à¤¾ à¤ªà¥‚à¤°à¥à¤£à¤µà¤¾à¤¦ à¤¤à¤¤à¥à¤¤à¥à¤µà¤œà¥à¤žà¤¾à¤¨à¤¾à¤šà¥à¤¯à¤¾ à¤®à¥‚à¤³ à¤¸à¤‚à¤¹à¤¿à¤¤à¥‡à¤ªà¥‡à¤•à¥à¤·à¤¾à¤¹à¥€ à¤ªà¥‚à¤°à¥à¤£à¤µà¤¾à¤¦ à¤®à¥€à¤®à¤¾à¤‚à¤¸à¤¾, à¤®à¥à¤¹à¤£à¤œà¥‡à¤š à¤ªà¥‚à¤°à¥à¤£à¤µà¤¾à¤¦ à¤¹à¥‡ à¤¤à¤¤à¥à¤¤à¥à¤µà¤œà¥à¤žà¤¾à¤¨ à¤µà¥à¤¯à¤µà¤¹à¤¾à¤°à¥à¤¯ à¤•à¤¸à¥‡ à¤µ à¤¤à¥à¤¯à¤¾à¤šà¥‡ à¤µà¥à¤¯à¤µà¤¹à¤¾à¤°à¤¾à¤¤ à¤†à¤šà¤°à¤£ à¤•à¤¸à¥‡ à¤•à¤°à¤¤à¤¾ à¤¯à¥‡à¤ˆà¤² à¤¯à¤¾à¤šà¥€ à¤®à¥€à¤®à¤¾à¤‚à¤¸à¤¾ à¤•à¤°à¤£à¤¾à¤°à¥&zwj;à¤¯à¤¾ à¤µ à¤¸à¤°à¥à¤µà¤¸à¤¾à¤®à¤¾à¤¨à¥à¤¯à¤¾à¤‚à¤¸ à¤¸à¤®à¤œà¤¤à¥€à¤² à¤…à¤¶à¤¾ à¤¸à¤¾à¤§à¥à¤¯à¤¾, à¤¸à¤°à¤³ à¤µ à¤¸à¥‹à¤ªà¥à¤¯à¤¾ à¤­à¤¾à¤·à¥‡à¤¤à¥€à¤² à¤—à¥à¤°à¤‚à¤¥à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤¨à¤¿à¤°à¥à¤®à¤¿à¤¤à¥€à¤šà¥€ à¤—à¤°à¤œ à¤­à¤¾à¤¸à¤²à¥€. à¤¯à¤¾ à¤—à¤°à¤œà¥‡à¤¤à¥‚à¤¨à¤š &lsquo;à¤¤à¥‹à¤‚à¤¡à¤“à¤³à¤–&rsquo; à¤¯à¤¾ à¤¤à¥à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤ªà¤¹à¤¿à¤²à¥à¤¯à¤¾ à¤—à¥à¤°à¤‚à¤¥à¤¾à¤šà¥‡ à¤ªà¥à¤°à¤•à¤¾à¤¶à¤¨ à¤®à¤¨à¤•à¤°à¥à¤£à¤¿à¤•à¤¾ à¤ªà¥à¤°à¤•à¤¾à¤¶à¤¨, à¤‡à¤‚à¤¦à¥‹à¤° à¤¯à¤¾à¤‚à¤šà¥à¤¯à¤¾à¤¦à¥à¤µà¤¾à¤°à¥‡ à¤•à¤°à¤£à¥à¤¯à¤¾à¤¤ à¤†à¤²à¥‡. à¤¯à¤¾ à¤ªà¥à¤°à¤•à¤¾à¤¶à¤¨ à¤¸à¤‚à¤¸à¥à¤¥à¥‡à¤šà¥‡ à¤ªà¥à¤°à¤®à¥à¤–à¤ªà¤¦ à¤¤à¥à¤¯à¤¾ à¤•à¤¾à¤³à¥€ à¤¸à¤¦à¥à¤—à¥à¤°à¥ à¤¡à¥‰. à¤°à¤¾à¤®à¤šà¤‚à¤¦à¥à¤° à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° à¤®à¤¹à¤¾à¤°à¤¾à¤œ à¤¯à¤¾à¤‚à¤šà¥‡ à¤œà¥à¤¯à¥‡à¤·à¥à¤  à¤šà¤¿à¤°à¤‚à¤œà¥€à¤µ à¤¶à¥à¤°à¥€. à¤¶à¤°à¤¦à¤œà¥€ à¤°à¤¾. à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° (à¤ªà¤°à¤® à¤ªà¥‚à¤œà¤¨à¥€à¤¯ à¤¸à¤¦à¥à¤—à¥à¤°à¥ à¤¶à¥à¤°à¥€ à¤µà¤¿à¤·à¥à¤£à¥à¤®à¤¹à¤¾à¤°à¤¾à¤œ à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤°) à¤¯à¤¾à¤‚à¤¨à¥€ à¤­à¥‚à¤·à¤µà¤¿à¤²à¥‡ à¤¹à¥‹à¤¤à¥‡. à¤¯à¤¾ à¤¸à¤‚à¤¸à¥à¤¥à¥‡à¤¦à¥à¤µà¤¾à¤°à¥‡ à¤ªà¥‚à¤°à¥à¤£à¤µà¤¾à¤¦ à¤®à¥€à¤®à¤¾à¤‚à¤¸à¥‡à¤šà¥‡ à¤—à¥à¤°à¤‚à¤¥ à¤µ à¤…à¤­à¤¿à¤¨à¤µ à¤…à¤­à¤‚à¤— à¤¯à¤¾ à¤—à¥à¤°à¤‚à¤¥à¤¾à¤‚à¤šà¥‡ à¤ªà¥à¤°à¤•à¤¾à¤¶à¤¨ à¤•à¤°à¤£à¥à¤¯à¤¾à¤¤ à¤†à¤²à¥‡.&lt;/span&gt;&lt;br&gt;&lt;/div&gt;', 1, '2021-12-21 15:12:03'),
(15, 14, 18, 'à¤ªà¤¾à¤°à¤¨à¥‡à¤°à¤•à¤° (Parnerkar)', 'Author: Dr. R. P. Parnerkar, Compiled by: Dr. V. R Parnerkar', 'Marathi                Discount Of 20%', '400', '', 1, '2021-12-23 16:35:32');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 3, 8500, '2021-07-16 11:18:12'),
(3, 5, 7000, '2021-12-20 13:59:05'),
(4, 6, 2500, '2021-12-20 15:20:57'),
(5, 7, 310, '2021-12-23 16:28:48'),
(6, 8, 1500, '2021-12-24 11:32:28'),
(7, 9, 1400, '2021-12-25 12:06:26'),
(8, 10, 8740, '2021-12-25 16:58:44'),
(9, 11, 1260, '2021-12-29 19:18:38'),
(10, 12, 1080, '2021-12-30 11:25:14'),
(11, 13, 140, '2021-12-30 12:02:27'),
(12, 14, 490, '2021-12-30 15:06:37'),
(13, 15, 960, '2021-12-30 16:21:05'),
(14, 16, 960, '2021-12-30 17:27:20'),
(15, 17, 2920, '2022-01-01 12:49:22'),
(16, 18, 460, '2022-01-01 16:09:34'),
(17, 19, 560, '2022-01-01 16:40:28'),
(18, 1, 460, '2022-01-05 14:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Programming', '&lt;p&gt;Sample Sub Category&lt;/p&gt;', 1, '2021-07-16 09:10:44'),
(2, 1, 'Grammar', '&lt;p&gt;Sample Sub 102&lt;/p&gt;', 1, '2021-07-16 09:11:05'),
(3, 2, 'Literary', '&lt;p&gt;Sample Sub 103&lt;/p&gt;', 1, '2021-07-16 09:11:36'),
(4, 2, 'Historical', '&lt;p&gt;Sample 104&lt;/p&gt;', 1, '2021-07-16 09:12:51'),
(5, 3, 'Fantasy', '&lt;p&gt;Sample Sub 105&lt;/p&gt;', 1, '2021-07-16 09:13:28'),
(6, 3, 'Action and Adventure', '&lt;p&gt;Sample Sub 106&lt;/p&gt;', 1, '2021-07-16 09:13:49'),
(7, 4, 'Sub Cat 101', '&lt;p&gt;Sample Sub 107&lt;/p&gt;', 1, '2021-07-16 11:34:22'),
(10, 7, 'SERIES', '', 1, '2021-12-21 13:16:41'),
(11, 10, 'BIOGRAPHIES', '', 1, '2021-12-21 13:42:33'),
(12, 12, 'SOCIAL SCIENCE', '', 1, '2021-12-21 13:45:07'),
(13, 11, 'DIARIES', '', 1, '2021-12-21 13:48:43'),
(14, 9, 'POETRY', '', 1, '2021-12-21 14:24:10'),
(15, 13, 'RELIGIOUS', '', 1, '2021-12-21 14:33:49'),
(16, 8, 'SELF HELP', '', 1, '2021-12-21 14:44:14'),
(17, 16, 'ANTHOLOGIES', '', 1, '2021-12-21 14:57:44'),
(18, 14, 'ACTION & ADVENTURE', '', 1, '2021-12-21 14:57:59'),
(19, 18, 'ART', '', 1, '2021-12-21 14:58:55'),
(20, 19, 'DRAMA', '', 1, '2021-12-21 14:59:55'),
(21, 15, 'HISTORTY', '', 1, '2021-12-21 15:00:20'),
(22, 17, 'MATH', '', 1, '2021-12-21 15:00:31'),
(23, 20, 'SATIRE', '', 1, '2021-12-21 15:01:34'),
(24, 5, 'PHILOSOPHY', '', 1, '2021-12-21 15:03:09'),
(25, 6, 'SCIENCE', '', 1, '2021-12-21 15:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Shree Vimal Publishers Pvt Ltd'),
(6, 'short_name', 'Shree Vimal Publishers Pvt Ltd'),
(11, 'logo', 'uploads/1640088360_logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1626397620_books.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE IF NOT EXISTS `tbl_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(100) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_address` varchar(255) NOT NULL,
  `contact_message` text NOT NULL,
  `is_view` enum('0','1') DEFAULT '0' COMMENT '0-Unread , 1- Read',
  `is_deleted` enum('0','1') DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`contact_id`, `contact_name`, `contact_no`, `contact_email`, `contact_address`, `contact_message`, `is_view`, `is_deleted`, `created_date`) VALUES
(3, 'Pradip Jadhav', '9890719919', 'pradip.501jadhav@gmail.com', 'satara', 'message', '0', '0', '2021-12-22 15:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_distributors`
--

DROP TABLE IF EXISTS `tbl_distributors`;
CREATE TABLE IF NOT EXISTS `tbl_distributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor_name` varchar(255) DEFAULT NULL,
  `distributor_contact_no` varchar(255) DEFAULT NULL,
  `distributor_emailid` varchar(255) DEFAULT NULL,
  `distributor_website` varchar(255) DEFAULT NULL,
  `distributor_address` varchar(255) DEFAULT NULL,
  `distributor_state_id` varchar(11) DEFAULT NULL,
  `distributor_city_id` varchar(11) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `date_created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_distributors`
--

INSERT INTO `tbl_distributors` (`id`, `distributor_name`, `distributor_contact_no`, `distributor_emailid`, `distributor_website`, `distributor_address`, `distributor_state_id`, `distributor_city_id`, `zip_code`, `date_created`) VALUES
(1, 'New Nerlekar Book Sellers', '020-64007257', 'abc@gmail.com', 'www.vimal.com', 'Survey No. 261, Shop No.1,  Budhwar Peth, Shreemant Shree Dagadu Sheth Ganpati Samor, Pune', '22', '2652', '416012', '2021-12-24 09:28:30.630045'),
(2, 'New Nerlekar Book Sellers', '9766541099', 'abc@gmail.com', 'www.vimal.com', 'Survey No. 261, In Swami Samarth Complex Parking , Budhwar Peth, Shreemant Shree Dagadu Sheth Ganpati Samor, Pune', '22', '2763', '411002', '2021-12-24 09:28:30.630045'),
(3, 'Book Ganga', '8888300300', 'bookganga@gmail.com', 'bookganga.com', 'Deccan Gymkhana,Near Post Office Pune.', '22', '2763', '411004', '2021-12-24 09:28:30.630045'),
(4, 'Akshardhara', '20-24441001', 'akashardhar@gmail.com', 'www.akhardhara.com', '1302, Sanas Plaza, Bajirao Road, Shukrawar Peth,Pune', '22', '2763', '411012', '2021-12-24 09:28:30.630045'),
(5, 'Akshar Dalan', '0231-2646424', 'abc@gmail.com', 'www.vimal.com', '2141, B Nirmalay Plaza , Kolekar Tikati, Mangalwar Peth, Kolhapur', '22', '2652', '416012', '2021-12-24 09:28:30.630045'),
(6, 'Noopur Fast Food Center And Garden Restarant', '9422213139', 'abc@gmail.com', 'www.vimal.com', 'Utsav Mangal Karyalay Samor, Sant Eknath Mandira Javal ,New Usamanpura, Aurangabad', '22', '2499', '431003', '2021-12-24 09:28:30.630045'),
(8, 'Abhay Pustak Bhandar', '02462-240265', 'abc@gmail.com', 'www.vimal.com', 'Vazirabad Road, Mahaveer Chowk, Nanded', '22', '2719', '431665', '2021-12-24 09:28:30.630045'),
(10, 'Ashok Book Depo', '9420817762', 'abc@gmail.com', 'www.vimal.com', 'Parbhani', '22', '2747', '431401', '2021-12-24 09:31:57.312884');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter`
--

DROP TABLE IF EXISTS `tbl_newsletter`;
CREATE TABLE IF NOT EXISTS `tbl_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_newsletter`
--

INSERT INTO `tbl_newsletter` (`id`, `email`, `created_date`) VALUES
(1, 'pradip.501jadhav@gmail.com', '2021-12-23 10:03:24'),
(2, 'theurbanblue.india@gmail.com', '2021-12-23 10:03:43'),
(3, 'saiganesh.hosp@gmail.com', '2021-12-23 10:03:50'),
(4, 'abc@gmail.com', '2021-12-23 10:52:18'),
(5, 'kappil@dreamproperties2012.com', '2021-12-25 07:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_postalcharges_master`
--

DROP TABLE IF EXISTS `tbl_postalcharges_master`;
CREATE TABLE IF NOT EXISTS `tbl_postalcharges_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_from` int(11) NOT NULL,
  `range_to` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_postalcharges_master`
--

INSERT INTO `tbl_postalcharges_master` (`id`, `range_from`, `range_to`, `amount`) VALUES
(1, 1, 500, 40),
(2, 501, 1000, 60),
(3, 1001, 1500, 80),
(4, 1501, 2000, 100),
(5, 2001, 2500, 120),
(6, 2501, 3000, 140),
(7, 3001, 3500, 160),
(8, 3501, 4000, 180),
(9, 4001, 4500, 200),
(10, 4501, 5000, 220),
(11, 5001, 5500, 240),
(12, 5501, 6000, 260),
(13, 6001, 6500, 280),
(14, 6501, 7000, 300),
(15, 7001, 7500, 320),
(16, 7501, 8000, 340),
(17, 8001, 8500, 360),
(18, 8501, 9000, 380),
(19, 9001, 9500, 400),
(20, 9501, 10000, 420),
(21, 10001, 10500, 440),
(22, 10501, 11000, 460),
(23, 11001, 11500, 480),
(24, 11501, 12000, 500),
(25, 12001, 12500, 520),
(26, 12501, 13000, 540),
(27, 13001, 13500, 560),
(28, 13501, 14000, 580),
(29, 14001, 14500, 600),
(30, 14501, 15000, 620);

-- --------------------------------------------------------

--
-- Table structure for table `upcoming_book`
--

DROP TABLE IF EXISTS `upcoming_book`;
CREATE TABLE IF NOT EXISTS `upcoming_book` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` text NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upcoming_book`
--

INSERT INTO `upcoming_book` (`id`, `category_id`, `sub_category_id`, `title`, `author`, `language`, `description`, `status`, `date_created`, `price`) VALUES
(3, 14, 18, 'Satyanarayanjee Phalod Charitrabhyas', 'Adv. V. W. Vaze', 'English', '&lt;p&gt;test&lt;/p&gt;', 1, '2021-12-23 11:37:06', 0),
(5, 14, 18, 'Parnerche Darbari Gayak Dattatrayarao ', 'Adv. V. W. Vaze', 'Matathi', '&lt;p style=\\&quot;text-align: justify; \\&quot;&gt;&lt;span style=\\&quot;color: rgb(71, 71, 74); font-family: Roboto, Arial, sans-serif; font-size: large; background-color: rgb(255, 255, 255);\\&quot;&gt;à¤¸à¥à¤µà¤¾à¤¤à¤‚à¤¤à¥à¤°à¥à¤¯ à¤¯à¥à¤¦à¥à¤§à¤¾à¤¤à¥€à¤² à¤¸à¤¾à¤¨à¥‡ à¤—à¥à¤°à¥à¤œà¥€à¤‚à¤šà¥à¤¯à¤¾ à¤¸à¤¹à¤­à¤¾à¤—à¤¾à¤®à¥à¤³à¥‡ à¤¤à¥à¤¯à¤¾à¤‚à¤¨à¤¾ à¤¤à¥à¤°à¥à¤‚à¤—à¤µà¤¾à¤¸ à¤­à¥‹à¤—à¤¾à¤µà¤¾ à¤²à¤¾à¤—à¤²à¤¾. 9 à¤«à¥‡à¤¬à¥à¤°à¥à¤µà¤¾à¤°à¥€ 1933 à¤°à¥‹à¤œà¥€ à¤¨à¤¾à¤¶à¤¿à¤•à¤šà¥à¤¯à¤¾ à¤¤à¥à¤°à¥à¤‚à¤—à¤¾à¤¤ à¤…à¤¸à¤¤à¤¾à¤¨à¤¾ à¤¤à¥à¤¯à¤¾à¤‚à¤¨à¥€ à¤¶à¥à¤¯à¤¾à¤®à¤šà¥€ à¤†à¤ˆ à¤¹à¥‡ à¤ªà¥à¤¸à¥à¤¤à¤• à¤²à¤¿à¤¹à¤¿à¤£à¥à¤¯à¤¾à¤¸ à¤¸à¥à¤°à¥à¤µà¤¾à¤¤ à¤•à¥‡à¤²à¥€. à¤¸à¤¾à¤¨à¥‡ à¤—à¥à¤°à¥à¤œà¥€ à¤¯à¤¾à¤‚à¤¨à¥€ à¤†à¤ªà¤²à¥‡ à¤¬à¤°à¥‡à¤š à¤²à¥‡à¤–à¤¨ à¤¤à¥à¤°à¥à¤‚à¤—à¤¾à¤¤ à¤…à¤¸à¤¤à¤¾à¤¨à¤¾ à¤•à¥‡à¤²à¥‡. à¤¶à¥à¤¯à¤¾à¤®à¤šà¥€ à¤†à¤ˆ à¤¹à¤¾ à¤•à¤¥à¤¾à¤¸à¤‚à¤—à¥à¤°à¤¹ à¤¤à¥à¤¯à¤¾à¤‚à¤¨à¥€ à¤…à¤µà¤˜à¥à¤¯à¤¾ à¤ªà¤¾à¤š à¤¦à¤¿à¤µà¤¸à¤¾à¤¤ à¤²à¤¿à¤¹à¥‚à¤¨ à¤¸à¤‚à¤ªà¤µà¤²à¤¾. à¤¶à¥à¤¯à¤¾à¤®à¤šà¥€ à¤†à¤ˆ à¤¯à¤¾ à¤ªà¥à¤¸à¥à¤¤à¤•à¤¾à¤¤ à¤¸à¤¾à¤¨à¥‡ à¤—à¥à¤°à¥à¤œà¥€à¤‚à¤¨à¥€ \\\'à¤®à¤®à¤¤à¥‡à¤šà¤¾ à¤®à¤¹à¤¿à¤®à¤¾\\\' à¤—à¤¾à¤¯à¤²à¤¾ à¤†à¤¹à¥‡. à¤¤à¥à¤¯à¤¾à¤šà¤¬à¤°à¥‹à¤¬à¤° à¤¸à¥à¤¸à¤‚à¤¸à¥à¤•à¥ƒà¤¤ à¤µ à¤¬à¤¾à¤²à¤¬à¥‹à¤§ à¤˜à¤°à¤¾à¤£à¥à¤¯à¤¾à¤¤à¥€à¤² à¤¸à¤¾à¤§à¥à¤¯à¤¾, à¤¸à¤°à¤³ à¤µ à¤°à¤®à¥à¤¯ à¤¸à¤‚à¤¸à¥à¤•à¥ƒà¤¤à¥€à¤šà¥‡ à¤šà¤¿à¤¤à¥à¤°à¤£à¤¹à¥€ à¤¯à¤¾à¤¤ à¤•à¥‡à¤²à¥‡. à¤¸à¤¾à¤¨à¥‡ à¤—à¥à¤°à¥à¤œà¥€ à¤¸à¤¾à¤ à¥€ à¤¤à¥à¤¯à¤¾à¤‚à¤šà¥€ à¤†à¤ˆ à¤—à¥à¤°à¥ à¤†à¤£à¤¿ à¤•à¤²à¥à¤ªà¤¤à¤°à¥‚ à¤¹à¥‹à¤¤à¥€. \\&quot;à¤—à¤¾à¤ˆà¤—à¥à¤°à¤¾à¤‚à¤µà¤°, à¤«à¥à¤²à¤ªà¤¾à¤–à¤°à¤¾à¤‚à¤µà¤°, à¤à¤¾à¤¡à¤¾à¤‚à¤®à¤¾à¤¡à¤¾à¤µà¤° à¤ªà¥à¤°à¥‡à¤® à¤•à¤°à¤¾à¤¯à¤²à¤¾ à¤¤à¤¿à¤¨à¥‡ à¤¤à¥à¤¯à¤¾à¤‚à¤¨à¤¾ à¤¶à¤¿à¤•à¤µà¤²à¥‡.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-12-23 12:46:44', 30),
(4, 14, 18, 'Vedmurti B. V. Agashe Charitrabhyas', 'Mr. Sanjay B. Agashe', 'Marathi', '&lt;p style=\\&quot;padding: 0px; margin-right: 0px; margin-bottom: 25px; margin-left: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px rgb(255, 255, 255); color: rgb(71, 71, 74); font-family: Roboto, Arial, sans-serif; font-size: 14px;\\&quot;&gt;&lt;span style=\\&quot;padding: 0px; margin: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px; font-family: inherit;\\&quot;&gt;&lt;span style=\\&quot;padding: 0px; margin: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px; font-size: large;\\&quot;&gt;à¤®à¤¹à¤¾à¤¨ à¤²à¥‡à¤–à¤•à¤¾à¤‚à¤šà¥€ à¤ªà¥à¤¸à¥à¤¤à¤•à¥‡ à¤®à¤²à¤¾ à¤œà¥à¤žà¤¾à¤¨ à¤¦à¥‡à¤¤à¤¾à¤¤. à¤œà¤° à¤®à¤²à¤¾ à¤à¤•à¤¦à¤¾ à¤µà¤¾à¤šà¤²à¥à¤¯à¤¾à¤µà¤° à¤ªà¥à¤¸à¥à¤¤à¤• à¤¸à¤®à¤œà¤²à¥‡ à¤¨à¤¾à¤¹à¥€ à¤¤à¤° à¤®à¥€ à¤¤à¥‡ à¤ªà¥à¤¨à¥à¤¹à¤¾ à¤ªà¥à¤¨à¥à¤¹à¤¾ à¤µà¤¾à¤šà¤¤à¥‹. à¤®à¤¹à¤¾à¤¨ à¤²à¥‡à¤–à¤•à¤¾à¤‚à¤šà¥€ à¤ªà¥à¤¸à¥à¤¤à¤•à¥‡ à¤†à¤ªà¤²à¥à¤¯à¤¾ à¤ªà¥à¤°à¤¤à¤¿à¤­à¥‡à¤²à¤¾ à¤†à¤µà¥à¤¹à¤¾à¤¨ à¤¦à¥‡à¤¤à¤¾à¤¤ à¤†à¤£à¤¿ à¤†à¤ªà¤²à¥à¤¯à¤¾à¤²à¤¾ à¤µà¤¿à¤šà¤¾à¤° à¤•à¤°à¤£à¥à¤¯à¤¾à¤¸ à¤ªà¥à¤°à¤µà¥ƒà¤¤à¥à¤¤ à¤•à¤°à¤¤à¤¾à¤¤. à¤à¤•à¤¾ à¤ªà¤¦à¥à¤§à¤¤à¥€à¤¨à¥‡ à¤¤à¥‡ à¤†à¤ªà¤²à¥à¤¯à¤¾ à¤®à¥‡à¤‚à¤¦à¥‚à¤²à¤¾ à¤…à¤¨à¥à¤¨ à¤¦à¥‡à¤¤à¤¾à¤¤. à¤–à¤°à¥‹à¤–à¤°à¤š à¤ªà¥à¤¸à¥à¤¤à¤•à¥‡ à¤†à¤ªà¤²à¥€ à¤ªà¥à¤°à¤¿à¤¯ à¤®à¤¿à¤¤à¥à¤° à¤…à¤¸à¤¤à¤¾à¤¤. à¤œà¥à¤¯à¤¾ à¤µà¥à¤¯à¤•à¥à¤¤à¥€à¤šà¥à¤¯à¤¾ à¤›à¤‚à¤¦ à¤ªà¥à¤¸à¥à¤¤à¤•à¥‡ à¤µà¤¾à¤šà¤£à¥‡ à¤…à¤¸à¤¤à¥‹ à¤¤à¥‹ à¤•à¤§à¥€à¤š à¤à¤•à¤Ÿà¤¾ à¤¨à¤¸à¤¤à¥‹.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;padding: 0px; margin: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px rgb(255, 255, 255); color: rgb(71, 71, 74); font-family: inherit; font-size: 14px;\\&quot;&gt;&lt;span style=\\&quot;padding: 0px; margin: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px; font-size: large;\\&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;padding: 0px; margin-right: 0px; margin-bottom: 25px; margin-left: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px rgb(255, 255, 255); color: rgb(71, 71, 74); font-family: Roboto, Arial, sans-serif; font-size: 14px;\\&quot;&gt;&lt;span style=\\&quot;padding: 0px; margin: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px; font-family: inherit;\\&quot;&gt;&lt;span style=\\&quot;padding: 0px; margin: 0px; border: 0px; outline: none; vertical-align: baseline; background: 0px 0px; font-size: large;\\&quot;&gt;à¤¶à¥‡à¤µà¤Ÿà¥€ à¤¨à¤¿à¤·à¥à¤•à¤°à¥à¤· à¤à¤µà¤¢à¤¾à¤š à¤†à¤¹à¥‡ à¤•à¥€ à¤ªà¥à¤¸à¥à¤¤à¤•à¥‡ à¤µà¤¾à¤šà¤¨ à¤¹à¤¾ à¤¸à¤°à¥à¤µà¤¾à¤¤ à¤šà¤¾à¤‚à¤—à¤²à¤¾ à¤›à¤‚à¤¦ à¤†à¤¹à¥‡. à¤¯à¤¾à¤¤ à¤¶à¤‚à¤•à¤¾ à¤¨à¤¾à¤¹à¥€ à¤•à¥€ à¤ªà¥à¤¸à¥à¤¤à¤•à¤¾à¤‚à¤šà¥à¤¯à¤¾ à¤•à¤¿à¤®à¤¤à¥€ à¤¦à¤¿à¤µà¤¸à¥‡à¤‚à¤¦à¤¿à¤µà¤¸ à¤µà¤¾à¤¢à¤¤ à¤†à¤¹à¥‡ à¤ªà¤£ à¤†à¤ªà¤£ à¤ªà¥à¤¸à¥à¤¤à¤•à¥‡ à¤²à¤¾à¤¯à¤¬à¥à¤°à¤°à¥€à¤®à¤§à¥‚à¤¨ à¤¸à¥à¤¦à¥à¤§à¤¾ à¤µà¤¾à¤šà¥‚ à¤¶à¤•à¤¤à¥‹. à¤µà¤¾à¤šà¤¨ à¤•à¤°à¤¾à¤¯à¤²à¤¾ à¤¦à¥à¤¸à¤°à¥‡ à¤•à¤¾à¤¹à¥€à¤¹à¥€ à¤²à¤¾à¤—à¤¤ à¤¨à¤¾à¤¹à¥€. à¤µà¤¾à¤šà¤¨à¤¾à¤šà¥€ à¤¹à¥€ à¤†à¤µà¤¡ à¤®à¥€ à¤­à¤µà¤¿à¤·à¥à¤¯à¤¾à¤¤à¤¹à¥€ à¤œà¥‹à¤ªà¤¾à¤¸à¤¤ à¤°à¤¾à¤¹à¤¿à¤² à¤†à¤£à¤¿ à¤¤à¥à¤®à¥à¤¹à¤¾ à¤¸à¤°à¥à¤µà¤¾à¤‚à¤¨à¤¾à¤¹à¥€ à¤®à¤¾à¤à¤¾ à¤¸à¤²à¥à¤²à¤¾ à¤†à¤¹à¥‡ à¤•à¥€ à¤¤à¥à¤®à¥à¤¹à¥€à¤¹à¥€ à¤µà¤¾à¤šà¤¨à¤¾à¤šà¤¾ à¤›à¤‚à¤¦ à¤œà¥‹à¤ªà¤¾à¤¸à¤¾.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2021-12-23 12:33:56', 70);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'pradip', 'jadhav', 'Admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2022-01-04 12:02:54'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

-- --------------------------------------------------------

--
-- Structure for view `mostsalable`
--
DROP TABLE IF EXISTS `mostsalable`;

DROP VIEW IF EXISTS `mostsalable`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mostsalable`  AS  select `products`.`id` AS `id`,`products`.`title` AS `title`,`products`.`author` AS `author`,`inventory`.`quantity` AS `quantity`,`order_list`.`price` AS `price`,`order_list`.`quantity` AS `qnt` from ((`products` join `inventory` on((`products`.`id` = `inventory`.`product_id`))) join `order_list` on((`products`.`id` = `order_list`.`product_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `msale`
--
DROP TABLE IF EXISTS `msale`;

DROP VIEW IF EXISTS `msale`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `msale`  AS  select `products`.`id` AS `id`,`products`.`title` AS `title`,`products`.`description` AS `description`,`products`.`status` AS `status`,`products`.`date_created` AS `date_created`,`products`.`author` AS `author`,`order_list`.`quantity` AS `sum`,`order_list`.`price` AS `price`,`order_list`.`total` AS `total` from (`products` left join `order_list` on((`products`.`id` = `order_list`.`product_id`))) where (`products`.`status` = 1) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
