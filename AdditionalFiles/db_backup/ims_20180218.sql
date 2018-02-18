-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2018 at 04:58 AM
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
(1, 'LightCloud', 'ims@LightCloud', 'cytvictor@yeah.net', '2018-02-14 16:53:57', '2018-02-18 10:44:58', '127.0.0.1', 'ADMIN'),
(2, 'cytvictor', '89652a', 'cytvictor@yeah.net', '2018-02-14 16:53:57', '2018-02-17 11:39:54', '127.0.0.1', 'ADMIN'),
(3, '3245508983', '3245508983', '3245508983@qq.com', '2018-02-14 16:53:57', '2018-02-18 10:44:28', '127.0.0.1', 'NORMAL');

-- --------------------------------------------------------

--
-- Table structure for table `portmg_hosts`
--

CREATE TABLE `portmg_hosts` (
  `id` int(10) NOT NULL,
  `hostname` text NOT NULL,
  `portapi_address` text NOT NULL,
  `ssh_address` text NOT NULL,
  `ssh_port` int(5) NOT NULL DEFAULT '22',
  `ssh_password` text NOT NULL,
  `create_at` datetime NOT NULL,
  `create_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portmg_hosts`
--

INSERT INTO `portmg_hosts` (`id`, `hostname`, `portapi_address`, `ssh_address`, `ssh_port`, `ssh_password`, `create_at`, `create_by`) VALUES
(1, 'KR01-101', '', '92.223.73.98', 22, '', '2018-02-15 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `portmg_ips`
--

CREATE TABLE `portmg_ips` (
  `id` int(10) NOT NULL,
  `ip_address` text NOT NULL,
  `host_id` int(10) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portmg_ips`
--

INSERT INTO `portmg_ips` (`id`, `ip_address`, `host_id`, `create_at`) VALUES
(1, '92.223.73.98', 1, '2018-02-17 12:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `portmg_ports`
--

CREATE TABLE `portmg_ports` (
  `id` int(10) NOT NULL,
  `range_id` int(10) NOT NULL,
  `port` int(5) NOT NULL,
  `connect_port` int(5) DEFAULT NULL,
  `ip_id` int(10) NOT NULL,
  `vm_id` int(10) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `released_at` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `apply_status` varchar(20) NOT NULL,
  `operator_uid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portmg_ports`
--

INSERT INTO `portmg_ports` (`id`, `range_id`, `port`, `connect_port`, `ip_id`, `vm_id`, `create_at`, `used_at`, `released_at`, `status`, `apply_status`, `operator_uid`) VALUES
(1, 1, 10000, 22, 1, 1, '2018-02-17 15:26:41', '2018-02-17 16:27:00', '2018-02-17 16:28:00', 'NORMAL', 'RELEASED', NULL),
(2, 1, 10001, NULL, 1, NULL, '2018-02-17 15:26:41', NULL, NULL, 'NORMAL', 'UNUSED', NULL),
(3, 1, 10002, NULL, 1, NULL, '2018-02-17 15:26:41', NULL, NULL, 'NORMAL', 'UNUSED', NULL),
(4, 1, 10003, 3389, 1, 1, '2018-02-17 15:26:41', '2018-02-18 11:52:25', NULL, 'NORMAL', 'USED', 1),
(5, 1, 10004, NULL, 1, NULL, '2018-02-17 15:26:41', NULL, NULL, 'NORMAL', 'UNUSED', NULL),
(6, 1, 10005, 1433, 1, 1, '2018-02-17 15:26:41', '2018-02-18 11:52:23', NULL, 'NORMAL', 'USED', 1),
(7, 2, 10101, 22, 1, 1, '2018-02-17 15:26:54', '2018-02-18 11:29:30', '2018-02-18 11:36:03', 'NORMAL', 'RELEASED', 1),
(8, 2, 10102, 8080, 1, 1, '2018-02-17 15:26:54', NULL, NULL, 'NORMAL', 'APPLIED', NULL),
(9, 2, 10103, NULL, 1, NULL, '2018-02-17 15:26:54', NULL, NULL, 'NORMAL', 'UNUSED', NULL),
(10, 2, 10104, 3306, 1, 1, '2018-02-17 15:26:54', '2018-02-18 11:36:31', NULL, 'NORMAL', 'USED', 1),
(11, 2, 10105, NULL, 1, NULL, '2018-02-17 15:26:54', NULL, NULL, 'NORMAL', 'UNUSED', NULL),
(13, 1, 10000, NULL, 1, NULL, '2018-02-17 15:26:41', NULL, NULL, 'NORMAL', 'UNUSED', NULL),
(64, 2, 10101, NULL, 1, NULL, '2018-02-17 15:26:54', NULL, NULL, 'NORMAL', 'UNUSED', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `portmg_port_ranges`
--

CREATE TABLE `portmg_port_ranges` (
  `id` int(10) NOT NULL,
  `ip_id` int(10) NOT NULL,
  `start_port` int(5) NOT NULL,
  `end_port` int(5) NOT NULL,
  `operator_id` int(10) NOT NULL,
  `create_at` datetime NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portmg_port_ranges`
--

INSERT INTO `portmg_port_ranges` (`id`, `ip_id`, `start_port`, `end_port`, `operator_id`, `create_at`, `status`) VALUES
(1, 1, 10000, 10005, 1, '0000-00-00 00:00:00', ''),
(2, 1, 10101, 10105, 1, '0000-00-00 00:00:00', ''),
(3, 1, 30601, 30650, 1, '0000-00-00 00:00:00', 'DELETED');

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
-- Table structure for table `portmg_svm_servers`
--

CREATE TABLE `portmg_svm_servers` (
  `id` int(11) NOT NULL,
  `friendly_name` text NOT NULL,
  `api_address` text NOT NULL,
  `api_id` varchar(50) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `create_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portmg_svm_servers`
--

INSERT INTO `portmg_svm_servers` (`id`, `friendly_name`, `api_address`, `api_id`, `api_key`, `type`, `create_at`, `update_at`, `create_by`) VALUES
(1, 'LC - SVM01', 'http://168.235.75.234/api/admin', 'YKkKWwSgPla2YeBuViYcxAnhYcC8ycImNTXygGFV', 'RGNFKf1voOyMfMU4Om1cpyp3hdqnJV0prNV2TLn8', 'solusvm', '2018-02-15 15:18:34', '2018-02-15 15:18:34', 1);

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
(3, 'site-name', 'LightCloud-ims'),
(4, 'copyright-text', 'LightCloud Team &copy; 2015-2018<br>IMS Verision 0.0.1'),
(5, 'login-page-alert', 'info'),
(6, 'login-page-alert-text', '如果你在使用过程中遇到问题，请联系我们。<br>请注意，如果在任意10分钟内没有操作，你会被强制退出。您只需重新登录。'),
(7, 'page-boxed', '1'),
(8, 'index-notice', '                                        <h3>欢迎使用长郡查分2.0！</h3>\r\n                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat. Vestibulum ullamcorper sodales nisi nec condimentum. Mauris convallis mauris at pellentesque volutpat.\r\n                                            </p>\r\n                                            <h3>Html5 and CSS3</h3>\r\n                                            <p>\r\n                                                Phasellus at ultricies neque, quis malesuada augue. Donec eleifend condimentum nisl eu consectetur. Integer eleifend, nisl venenatis consequat iaculis, lectus arcu malesuada sem, dapibus porta quam lacus eu neque.</p>\r\n                                        '),
(9, 'vms-notice', '<h3>欢迎使用LightCloud IMS信息管理系统！</h3><p> 版本号:0.0.1 更新时间:2018-02-15 15:52'),
(10, 'session-maxtime', '600');

-- --------------------------------------------------------

--
-- Table structure for table `portmg_vms`
--

CREATE TABLE `portmg_vms` (
  `id` int(10) NOT NULL,
  `hostname` text NOT NULL,
  `svm_server_id` int(10) NOT NULL,
  `host_id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `svm_vm_id` int(10) NOT NULL,
  `svm_internal_ip` varchar(15) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `port_allocated_count` int(5) DEFAULT '20'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portmg_vms`
--

INSERT INTO `portmg_vms` (`id`, `hostname`, `svm_server_id`, `host_id`, `uid`, `svm_vm_id`, `svm_internal_ip`, `create_at`, `update_at`, `port_allocated_count`) VALUES
(1, 'LightCloud-MLqNnsI2', 1, 1, 1, 593, '', '2018-02-15 15:04:21', '2018-02-15 15:04:21', 20);

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
-- Indexes for table `portmg_hosts`
--
ALTER TABLE `portmg_hosts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_ips`
--
ALTER TABLE `portmg_ips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_ports`
--
ALTER TABLE `portmg_ports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_port_ranges`
--
ALTER TABLE `portmg_port_ranges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_sessions`
--
ALTER TABLE `portmg_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_svm_servers`
--
ALTER TABLE `portmg_svm_servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_system`
--
ALTER TABLE `portmg_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portmg_vms`
--
ALTER TABLE `portmg_vms`
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
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `portmg_hosts`
--
ALTER TABLE `portmg_hosts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portmg_ips`
--
ALTER TABLE `portmg_ips`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portmg_ports`
--
ALTER TABLE `portmg_ports`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `portmg_port_ranges`
--
ALTER TABLE `portmg_port_ranges`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `portmg_sessions`
--
ALTER TABLE `portmg_sessions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portmg_svm_servers`
--
ALTER TABLE `portmg_svm_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portmg_system`
--
ALTER TABLE `portmg_system`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `portmg_vms`
--
ALTER TABLE `portmg_vms`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
