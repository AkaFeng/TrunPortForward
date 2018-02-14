-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2018 at 05:36 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ims`
--
CREATE DATABASE IF NOT EXISTS `ims` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ims`;

-- --------------------------------------------------------

--
-- Table structure for table `ims_sessions`
--

CREATE TABLE `ims_sessions` (
  `id` int(10) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `uid` int(10) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ims_system`
--

CREATE TABLE `ims_system` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` mediumtext NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ims_system`
--

INSERT INTO `ims_system` (`id`, `name`, `value`) VALUES
(1, 'site-open', 'ON'),
(2, 'site-off-notice-html', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <title>升级 - 长郡查分</title>\r\n    <meta name=\"Robots\" content=\"NOINDEX, NOFOLLOW, NOARCHIVE\" />\r\n    <meta name=\"ViewPort\" content=\"initial-scale=1, minimum-scale=1, width=device-width\" />\r\n    <style type=\"text/css\">html,body{width:100%;height:100%;cursor:default}  html,body,p,h2,div{margin:0;padding:0}  body{background: #2f91d1;text-align:center;user-select:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none}  html{font:12px \"Segoe UI\",\"Microsoft YaHei\",FreeSans,Arimo,\"Droid Sans\",\"Hiragino Sans GB\",\"Hiragino Sans GB W3\",Arial,sans-serif}  h2{margin-bottom:25px;font-size:30px;font-weight:300;color:#e05d6f}  p{line-height:1.5em;font-size:12px;color:#95a2a9;margin-bottom:5px}  .title{position:relative;top:75px;margin-bottom:.7em;line-height:30px;font-size:26px;font-weight:300;color:#fff;text-shadow:0 0 4px #666666}  .box{position:relative;top:80px;width:600px;max-width:85%;margin:0 auto;background:#fff;padding:15px;box-shadow:0 0 50px #5D916B}  .main{font-size:18px;color:#000;font-weight:500;line-height:1.7em;margin:0 0 10px}  .foot{position:relative;top:80px;margin:15px 15px 0;font-size:12px;color:#5D916B}  .main,pre{user-select:text;-webkit-user-select:text;-moz-user-select:text;-ms-user-select:text;cursor:text}  ::selection{background:rgba(78,176,248,0.3)}  pre::selection{background:rgba(255,255,255,0.99);color:#3498DB}</style>\r\n</head>\r\n<body>\r\n<p class=\"title\">咱们长郡人 We Changjunese</p>\r\n<div class=\"box\">\r\n    <h2>长郡查分 - <b>平台升级中</b></h2>\r\n    <p class=\"main selectable\">“咱们长郡人”旗下网站长郡查分正在升级中，请过段时间再来看看~</p><p class=\"main selectable\"><strong>本次查询已结束，下次再见~</strong></p><p class=\"main selectable\">(=´∀｀)人(´∀｀=)</p><p class=\"main selectable\">Get in touch with me via Email: qwe8089@hotmail.com</p>\r\n    <p>© 2015-2018 We Changjunese Team</p><p>Special thanks are given to WZJ, who gave me much support:)</p>\r\n</div>\r\n</body>\r\n</html>\r\n'),
(3, 'site-name', 'LightCloud - IMS'),
(4, 'copyright-text', 'LightCloud Team &copy; 2015-2018<br>IMS Verision 0.0.1'),
(5, 'login-page-alert', 'info'),
(6, 'login-page-alert-text', '如果你在使用过程中遇到问题，请联系我们。<br>请注意，如果在任意10分钟内没有操作，你会被强制退出。您只需重新登录。'),
(7, 'page-boxed', '1'),
(8, 'index-notice', '                                        <h3>欢迎使用长郡查分2.0！</h3>\r\n                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat. Vestibulum ullamcorper sodales nisi nec condimentum. Mauris convallis mauris at pellentesque volutpat.\r\n                                            </p>\r\n                                            <h3>Html5 and CSS3</h3>\r\n                                            <p>\r\n                                                Phasellus at ultricies neque, quis malesuada augue. Donec eleifend condimentum nisl eu consectetur. Integer eleifend, nisl venenatis consequat iaculis, lectus arcu malesuada sem, dapibus porta quam lacus eu neque.</p>\r\n                                        '),
(9, 'overview-notice', '<h3>欢迎使用长郡查分2.0！</h3>                                            <p>                            '),
(10, 'session-maxtime', '600');

-- --------------------------------------------------------

--
-- Table structure for table `ims_token`
--

CREATE TABLE `ims_token` (
  `id` int(10) NOT NULL,
  `token` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `uid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ims_users`
--

CREATE TABLE `ims_users` (
  `uid` int(10) NOT NULL,
  `uname` text NOT NULL,
  `passwd` text NOT NULL,
  `email` text NOT NULL,
  `reg_time` datetime NOT NULL,
  `last_login_time` datetime NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'NORMAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ims_users`
--

INSERT INTO `ims_users` (`uid`, `uname`, `passwd`, `email`, `reg_time`, `last_login_time`, `last_login_ip`, `type`) VALUES
(1, 'LightCloud', 'ims@LightCloud', 'cytvictor@yeah.net', '2018-02-14 16:53:57', '2018-02-15 00:29:12', '127.0.0.1', 'NORMAL');

-- --------------------------------------------------------

--
-- Table structure for table `portmg_sessions`
--

CREATE TABLE `portmg_sessions` (
  `id` int(10) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `uid` int(10) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portmg_system`
--

CREATE TABLE `portmg_system` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` mediumtext NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `portmg_system`
--

INSERT INTO `portmg_system` (`id`, `name`, `value`) VALUES
(1, 'site-open', 'ON'),
(2, 'site-off-notice-html', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <title>升级 - 长郡查分</title>\r\n    <meta name=\"Robots\" content=\"NOINDEX, NOFOLLOW, NOARCHIVE\" />\r\n    <meta name=\"ViewPort\" content=\"initial-scale=1, minimum-scale=1, width=device-width\" />\r\n    <style type=\"text/css\">html,body{width:100%;height:100%;cursor:default}  html,body,p,h2,div{margin:0;padding:0}  body{background: #2f91d1;text-align:center;user-select:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none}  html{font:12px \"Segoe UI\",\"Microsoft YaHei\",FreeSans,Arimo,\"Droid Sans\",\"Hiragino Sans GB\",\"Hiragino Sans GB W3\",Arial,sans-serif}  h2{margin-bottom:25px;font-size:30px;font-weight:300;color:#e05d6f}  p{line-height:1.5em;font-size:12px;color:#95a2a9;margin-bottom:5px}  .title{position:relative;top:75px;margin-bottom:.7em;line-height:30px;font-size:26px;font-weight:300;color:#fff;text-shadow:0 0 4px #666666}  .box{position:relative;top:80px;width:600px;max-width:85%;margin:0 auto;background:#fff;padding:15px;box-shadow:0 0 50px #5D916B}  .main{font-size:18px;color:#000;font-weight:500;line-height:1.7em;margin:0 0 10px}  .foot{position:relative;top:80px;margin:15px 15px 0;font-size:12px;color:#5D916B}  .main,pre{user-select:text;-webkit-user-select:text;-moz-user-select:text;-ms-user-select:text;cursor:text}  ::selection{background:rgba(78,176,248,0.3)}  pre::selection{background:rgba(255,255,255,0.99);color:#3498DB}</style>\r\n</head>\r\n<body>\r\n<p class=\"title\">咱们长郡人 We Changjunese</p>\r\n<div class=\"box\">\r\n    <h2>长郡查分 - <b>平台升级中</b></h2>\r\n    <p class=\"main selectable\">“咱们长郡人”旗下网站长郡查分正在升级中，请过段时间再来看看~</p><p class=\"main selectable\"><strong>本次查询已结束，下次再见~</strong></p><p class=\"main selectable\">(=´∀｀)人(´∀｀=)</p><p class=\"main selectable\">Get in touch with me via Email: qwe8089@hotmail.com</p>\r\n    <p>© 2015-2018 We Changjunese Team</p><p>Special thanks are given to WZJ, who gave me much support:)</p>\r\n</div>\r\n</body>\r\n</html>\r\n'),
(3, 'site-name', 'IMS - PortMGR'),
(4, 'copyright-text', 'LightCloud Team &copy; 2015-2018<br>IMS Verision 0.0.1'),
(5, 'login-page-alert', 'info'),
(6, 'login-page-alert-text', '如果你在使用过程中遇到问题，请联系我们。<br>请注意，如果在任意10分钟内没有操作，你会被强制退出。您只需重新登录。'),
(7, 'page-boxed', '1'),
(8, 'index-notice', '                                        <h3>欢迎使用长郡查分2.0！</h3>\r\n                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat. Vestibulum ullamcorper sodales nisi nec condimentum. Mauris convallis mauris at pellentesque volutpat.\r\n                                            </p>\r\n                                            <h3>Html5 and CSS3</h3>\r\n                                            <p>\r\n                                                Phasellus at ultricies neque, quis malesuada augue. Donec eleifend condimentum nisl eu consectetur. Integer eleifend, nisl venenatis consequat iaculis, lectus arcu malesuada sem, dapibus porta quam lacus eu neque.</p>\r\n                                        '),
(9, 'overview-notice', '<h3>欢迎使用长郡查分2.0！</h3>                                            <p>                            '),
(10, 'session-maxtime', '600');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ims_sessions`
--
ALTER TABLE `ims_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_system`
--
ALTER TABLE `ims_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_token`
--
ALTER TABLE `ims_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users`
--
ALTER TABLE `ims_users`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `portmg_sessions`
--
ALTER TABLE `portmg_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_system`
--
ALTER TABLE `portmg_system`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ims_sessions`
--
ALTER TABLE `ims_sessions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ims_system`
--
ALTER TABLE `ims_system`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ims_token`
--
ALTER TABLE `ims_token`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ims_users`
--
ALTER TABLE `ims_users`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portmg_sessions`
--
ALTER TABLE `portmg_sessions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portmg_system`
--
ALTER TABLE `portmg_system`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
