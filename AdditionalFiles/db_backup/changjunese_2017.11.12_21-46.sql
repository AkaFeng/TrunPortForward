-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-11-12 14:46:43
-- 服务器版本： 5.6.35
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
-- Database: `changjunese`
--

-- --------------------------------------------------------

--
-- 表的结构 `score_banip`
--

CREATE TABLE `score_banip` (
  `id` int(10) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `start_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `score_menus`
--

CREATE TABLE `score_menus` (
  `id` int(10) NOT NULL,
  `link` text NOT NULL,
  `display_name` text NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent_id` int(10) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `score_menus`
--

INSERT INTO `score_menus` (`id`, `link`, `display_name`, `create_at`, `parent_id`, `level`) VALUES
(1, '/', '站点根', '2017-10-18 22:53:25', 0, 'ROOT'),
(2, '', '查分', '2017-10-18 22:55:24', 1, 'SUBTITLE'),
(3, '/query/routine', '查询自己/他人', '2017-10-18 22:56:55', 2, 'MENU'),
(4, '/query/subscribe', '订阅成绩', '2017-10-18 22:57:12', 2, 'MENU'),
(5, '', '用户', '2017-10-18 22:57:48', 1, 'SUBTITLE'),
(6, '/account/verification', '身份认证', '2017-10-18 22:58:23', 5, 'MENU'),
(7, '/account/settings', '用户资料/设置', '2017-10-18 22:59:16', 5, 'MENU'),
(8, '/account/payments', '我的支付', '2017-10-18 22:59:16', 5, 'MENU'),
(9, '/account/joinus', '加入长郡查分', '2017-10-18 22:59:16', 5, 'MENU'),
(10, '', '高级功能', '2017-10-18 22:59:35', 1, 'SUBTITLE'),
(11, '/advanced/api', '查分API接口', '2017-10-18 23:00:11', 10, 'MENU'),
(12, '/advanced/qrobot', 'QQ机器人', '2017-10-18 23:00:26', 10, 'MENU'),
(13, '', '数据特派员:管理中心', '2017-10-18 23:01:03', 1, 'SUBTITLE'),
(14, '', '长郡查分', '2017-10-18 23:13:42', 1, 'SUBTITLE'),
(15, '/', '首页', '2017-10-18 23:30:29', 14, 'MENU'),
(16, '/auth/login', '登录', '2017-10-18 23:30:48', 14, 'MENU'),
(17, '/auth/register', '注册', '2017-10-18 23:30:48', 14, 'MENU'),
(18, '/overview', '概览', '2017-10-18 23:36:11', 14, 'MENU');

-- --------------------------------------------------------

--
-- 表的结构 `score_operators`
--

CREATE TABLE `score_operators` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `create_at` datetime NOT NULL,
  `manage_range` text NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `score_operators`
--

INSERT INTO `score_operators` (`id`, `uid`, `type`, `create_at`, `manage_range`, `update_at`) VALUES
(2, 3, 'DATA', '2017-11-01 00:00:00', '', '2017-11-12 15:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `score_operators_logs`
--

CREATE TABLE `score_operators_logs` (
  `id` int(10) NOT NULL,
  `detail` text NOT NULL,
  `operator_id` int(10) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `score_query_2_logs`
--

CREATE TABLE `score_query_2_logs` (
  `id` int(10) NOT NULL,
  `detail` text,
  `uid` int(10) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `score_query_2_result`
--

CREATE TABLE `score_query_2_result` (
  `id` int(10) NOT NULL,
  `姓名` text,
  `考号` text,
  `result` text,
  `stu_sn` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `score_query_2_students`
--

CREATE TABLE `score_query_2_students` (
  `id` int(10) NOT NULL,
  `姓名` text,
  `考号` text,
  `stu_cla_sn` varchar(20) DEFAULT NULL,
  `stu_cn` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `score_query_2_student_class`
--

CREATE TABLE `score_query_2_student_class` (
  `id` int(10) NOT NULL,
  `class_name` text,
  `school_name` text,
  `stu_cla_sn` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `score_query_exams`
--

CREATE TABLE `score_query_exams` (
  `id` int(10) NOT NULL,
  `exam_name` text NOT NULL,
  `create_at` datetime NOT NULL,
  `operator_id` int(10) NOT NULL,
  `mark_status` varchar(20) NOT NULL,
  `query_status` varchar(20) NOT NULL,
  `update_at` datetime NOT NULL,
  `exam_end_at` datetime NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试信息表';

--
-- 转存表中的数据 `score_query_exams`
--

INSERT INTO `score_query_exams` (`id`, `exam_name`, `create_at`, `operator_id`, `mark_status`, `query_status`, `update_at`, `exam_end_at`, `type`) VALUES
(1, '演示考试1', '2017-11-10 20:18:46', 1, 'END', 'DELETED', '2017-11-12 21:45:04', '2017-11-10 20:20:00', 'D'),
(2, 'demoExam', '2017-11-12 21:44:41', 2, 'END', 'PROCESSING', '2017-11-12 21:45:25', '2017-11-12 21:48:00', 'D');

-- --------------------------------------------------------

--
-- 表的结构 `score_query_orders`
--

CREATE TABLE `score_query_orders` (
  `id` int(10) NOT NULL,
  `trade_no` varchar(50) NOT NULL,
  `uid` int(10) NOT NULL,
  `total_amount` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `total_count` int(3) NOT NULL,
  `send_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `score_remote_servers`
--

CREATE TABLE `score_remote_servers` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `apms_root_dir` varchar(255) NOT NULL,
  `apms_report_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `score_remote_servers`
--

INSERT INTO `score_remote_servers` (`id`, `name`, `address`, `status`, `apms_root_dir`, `apms_report_address`) VALUES
(1, '长本阅卷服务器', 'http://61.187.87.198:50680/APMS/_mark/Mark.Page.Data.aspx', 'ACTIVE', 'D:\\AllcomSoft\\APMS\\Export\\Report\\', ''),
(2, '长梅阅卷服务器（未启用）', '', 'INACTIVE', '', ''),
(3, '麓山阅卷服务器（未启用）', '', 'INACTIVE', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `score_sch`
--

CREATE TABLE `score_sch` (
  `id` int(10) NOT NULL,
  `name` text,
  `parent_id` int(10) DEFAULT NULL,
  `add_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `level` varchar(10) DEFAULT NULL,
  `display` int(1) DEFAULT '1',
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `score_sessions`
--

CREATE TABLE `score_sessions` (
  `id` int(10) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `uid` int(10) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `score_sessions`
--

INSERT INTO `score_sessions` (`id`, `session_id`, `uid`, `create_at`, `update_at`) VALUES
(11, '9778ccf702737a0fa400333b85b14140', 3, '2017-11-12 21:41:45', '2017-11-12 21:46:31');

-- --------------------------------------------------------

--
-- 表的结构 `score_student`
--

CREATE TABLE `score_student` (
  `id` int(10) NOT NULL,
  `sch_id` int(10) DEFAULT NULL,
  `stu_name` text,
  `stu_class` varchar(255) DEFAULT NULL,
  `stu_no` int(4) DEFAULT NULL,
  `sch_name` text,
  `subject` varchar(255) NOT NULL DEFAULT '无',
  `status` varchar(255) NOT NULL DEFAULT 'ACTIVE',
  `school_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `score_system`
--

CREATE TABLE `score_system` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` mediumtext NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `score_system`
--

INSERT INTO `score_system` (`id`, `name`, `value`) VALUES
(1, 'site-open', 'ON'),
(2, 'site-off-notice-html', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <title>升级 - 长郡查分</title>\r\n    <meta name=\"Robots\" content=\"NOINDEX, NOFOLLOW, NOARCHIVE\" />\r\n    <meta name=\"ViewPort\" content=\"initial-scale=1, minimum-scale=1, width=device-width\" />\r\n    <style type=\"text/css\">html,body{width:100%;height:100%;cursor:default}  html,body,p,h2,div{margin:0;padding:0}  body{background: #2f91d1;text-align:center;user-select:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none}  html{font:12px \"Segoe UI\",\"Microsoft YaHei\",FreeSans,Arimo,\"Droid Sans\",\"Hiragino Sans GB\",\"Hiragino Sans GB W3\",Arial,sans-serif}  h2{margin-bottom:25px;font-size:30px;font-weight:300;color:#e05d6f}  p{line-height:1.5em;font-size:12px;color:#95a2a9;margin-bottom:5px}  .title{position:relative;top:75px;margin-bottom:.7em;line-height:30px;font-size:26px;font-weight:300;color:#fff;text-shadow:0 0 4px #666666}  .box{position:relative;top:80px;width:600px;max-width:85%;margin:0 auto;background:#fff;padding:15px;box-shadow:0 0 50px #5D916B}  .main{font-size:18px;color:#000;font-weight:500;line-height:1.7em;margin:0 0 10px}  .foot{position:relative;top:80px;margin:15px 15px 0;font-size:12px;color:#5D916B}  .main,pre{user-select:text;-webkit-user-select:text;-moz-user-select:text;-ms-user-select:text;cursor:text}  ::selection{background:rgba(78,176,248,0.3)}  pre::selection{background:rgba(255,255,255,0.99);color:#3498DB}</style>\r\n</head>\r\n<body>\r\n<p class=\"title\">咱们长郡人 We Changjunese</p>\r\n<div class=\"box\">\r\n    <h2>长郡查分 - <b>平台升级中</b></h2>\r\n    <p class=\"main selectable\">“咱们长郡人”旗下网站长郡查分正在升级中，请过段时间再来看看~</p>\r\n    <p>© 2015-2017 We Changjunese Team</p>\r\n</div>\r\n</body>\r\n</html>\r\n'),
(3, 'site-name', '长郡查分2.0'),
(4, 'copyright-text', 'We Changjunese &copy; 2015-2017'),
(5, 'login-page-alert', 'info'),
(6, 'login-page-alert-text', '如果你在使用过程中遇到问题，请联系我们。<br>请注意，如果在任意10分钟内没有操作，你会被强制退出。您只需重新登录。'),
(7, 'page-boxed', '1'),
(8, 'index-notice', '                                        <h3>欢迎使用长郡查分2.0！</h3>\r\n                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat. Vestibulum ullamcorper sodales nisi nec condimentum. Mauris convallis mauris at pellentesque volutpat.\r\n                                            </p>\r\n                                            <h3>Html5 and CSS3</h3>\r\n                                            <p>\r\n                                                Phasellus at ultricies neque, quis malesuada augue. Donec eleifend condimentum nisl eu consectetur. Integer eleifend, nisl venenatis consequat iaculis, lectus arcu malesuada sem, dapibus porta quam lacus eu neque.</p>\r\n                                        '),
(9, 'overview-notice', '<h3>欢迎使用长郡查分2.0！</h3>                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat. Vestibulum ullamcorper sodales nisi nec condimentum. Mauris convallis mauris at pellentesque volutpat.\r\n                                            </p>\r\n                                            <h3>Html5 and CSS3</h3>\r\n                                            <p>\r\n                                                Phasellus at ultricies neque, quis malesuada augue. Donec eleifend condimentum nisl eu consectetur. Integer eleifend, nisl venenatis consequat iaculis, lectus arcu malesuada sem, dapibus porta quam lacus eu neque.</p>\r\n                                        '),
(10, 'query-count', '0'),
(11, 'session-maxtime', '600');

-- --------------------------------------------------------

--
-- 表的结构 `score_users`
--

CREATE TABLE `score_users` (
  `uid` bigint(20) UNSIGNED NOT NULL,
  `uname` text NOT NULL,
  `email` text NOT NULL,
  `email_check` text NOT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `lostpassword_check` text NOT NULL,
  `passwd` text NOT NULL,
  `r_pw` text,
  `reg_time` datetime NOT NULL,
  `type` bigint(20) NOT NULL DEFAULT '1',
  `qq_openid` text,
  `sinaweibo_uid` text,
  `sinaweibo_name` text,
  `baidu_openid` text,
  `sch_id` int(10) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sch_name` text,
  `grade_name` text,
  `stu_class` text,
  `stu_name` text,
  `avatar_link` text,
  `stu_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `score_users`
--

INSERT INTO `score_users` (`uid`, `uname`, `email`, `email_check`, `qq`, `last_login_ip`, `last_login_time`, `lostpassword_check`, `passwd`, `r_pw`, `reg_time`, `type`, `qq_openid`, `sinaweibo_uid`, `sinaweibo_name`, `baidu_openid`, `sch_id`, `phone`, `sch_name`, `grade_name`, `stu_class`, `stu_name`, `avatar_link`, `stu_id`) VALUES
(1, 'cytvictor', 'cytvictor@yeah.net', '', NULL, '127.0.0.1', '2017-10-30 01:21:33', '', 'cytvictor', NULL, '2017-10-18 22:41:27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL),
(2, '访客', 'visitors@noname.com', '', NULL, NULL, NULL, '', '', NULL, '2017-10-18 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '3245508983', '3245508983@qq.com', '', NULL, '127.0.0.1', '2017-11-12 21:41:45', '', '3245508983', NULL, '2017-10-19 21:58:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Victor', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `score_users_verification`
--

CREATE TABLE `score_users_verification` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `sch_id` int(10) NOT NULL,
  `real_name` text NOT NULL,
  `photo_path` text NOT NULL,
  `operator_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `operator_mark` text NOT NULL,
  `user_mark` text NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `score_banip`
--
ALTER TABLE `score_banip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_menus`
--
ALTER TABLE `score_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_operators`
--
ALTER TABLE `score_operators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_operators_logs`
--
ALTER TABLE `score_operators_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_query_2_logs`
--
ALTER TABLE `score_query_2_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_query_2_result`
--
ALTER TABLE `score_query_2_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_query_2_students`
--
ALTER TABLE `score_query_2_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_query_2_student_class`
--
ALTER TABLE `score_query_2_student_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_query_exams`
--
ALTER TABLE `score_query_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_query_orders`
--
ALTER TABLE `score_query_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_remote_servers`
--
ALTER TABLE `score_remote_servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_sch`
--
ALTER TABLE `score_sch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_sessions`
--
ALTER TABLE `score_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_student`
--
ALTER TABLE `score_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_system`
--
ALTER TABLE `score_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_users`
--
ALTER TABLE `score_users`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `score_users_verification`
--
ALTER TABLE `score_users_verification`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `score_banip`
--
ALTER TABLE `score_banip`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_menus`
--
ALTER TABLE `score_menus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `score_operators`
--
ALTER TABLE `score_operators`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `score_operators_logs`
--
ALTER TABLE `score_operators_logs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_query_2_logs`
--
ALTER TABLE `score_query_2_logs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_query_2_result`
--
ALTER TABLE `score_query_2_result`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_query_2_students`
--
ALTER TABLE `score_query_2_students`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_query_2_student_class`
--
ALTER TABLE `score_query_2_student_class`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_query_exams`
--
ALTER TABLE `score_query_exams`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `score_query_orders`
--
ALTER TABLE `score_query_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_remote_servers`
--
ALTER TABLE `score_remote_servers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `score_sch`
--
ALTER TABLE `score_sch`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_sessions`
--
ALTER TABLE `score_sessions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `score_student`
--
ALTER TABLE `score_student`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `score_system`
--
ALTER TABLE `score_system`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `score_users`
--
ALTER TABLE `score_users`
  MODIFY `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `score_users_verification`
--
ALTER TABLE `score_users_verification`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
