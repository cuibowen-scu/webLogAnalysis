-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.53 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 weblog 的数据库结构
CREATE DATABASE IF NOT EXISTS `weblog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `weblog`;

-- 导出  表 weblog.day_top10_request_pages 结构
CREATE TABLE IF NOT EXISTS `day_top10_request_pages` (
  `rank` int(11) DEFAULT NULL,
  `page` varchar(64) DEFAULT NULL,
  `pvs` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.day_top10_request_pages 的数据：10 rows
/*!40000 ALTER TABLE `day_top10_request_pages` DISABLE KEYS */;
INSERT INTO `day_top10_request_pages` (`rank`, `page`, `pvs`) VALUES
	(1, '/', 2268),
	(2, '/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.2.1', 293),
	(3, '/wp-includes/js/jquery/jquery.js?ver=1.10.2', 290),
	(4, '/js/baidu.js', 260),
	(5, '/js/google.js ', 259),
	(6, '/wp-content/themes/silesia/js/jquery.cycle.all.min.js', 244),
	(7, '/wp-content/themes/silesia/js/load.js', 243),
	(8, '/wp-content/themes/silesia/functions/js/shortcode.js', 242),
	(9, '/wp-includes/js/comment-reply.min.js?ver=3.6', 223),
	(10, '/wp-content/themes/silesia/style.css', 211);
/*!40000 ALTER TABLE `day_top10_request_pages` ENABLE KEYS */;

-- 导出  表 weblog.each_day_avg_user_pvs 结构
CREATE TABLE IF NOT EXISTS `each_day_avg_user_pvs` (
  `day` varchar(50) DEFAULT NULL,
  `pages` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_day_avg_user_pvs 的数据：2 rows
/*!40000 ALTER TABLE `each_day_avg_user_pvs` DISABLE KEYS */;
INSERT INTO `each_day_avg_user_pvs` (`day`, `pages`) VALUES
	('09-18', 12.458959537572253),
	('09-19', 12.682203389830509);
/*!40000 ALTER TABLE `each_day_avg_user_pvs` ENABLE KEYS */;

-- 导出  表 weblog.each_day_new_ip 结构
CREATE TABLE IF NOT EXISTS `each_day_new_ip` (
  `day` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_day_new_ip 的数据：2 rows
/*!40000 ALTER TABLE `each_day_new_ip` DISABLE KEYS */;
INSERT INTO `each_day_new_ip` (`day`, `count`) VALUES
	('09-18', 865),
	('09-19', 162);
/*!40000 ALTER TABLE `each_day_new_ip` ENABLE KEYS */;

-- 导出  表 weblog.each_day_pvs 结构
CREATE TABLE IF NOT EXISTS `each_day_pvs` (
  `day` varchar(64) DEFAULT NULL,
  `pvs` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_day_pvs 的数据：2 rows
/*!40000 ALTER TABLE `each_day_pvs` DISABLE KEYS */;
INSERT INTO `each_day_pvs` (`day`, `pvs`) VALUES
	('09-18', 10777),
	('09-19', 2993);
/*!40000 ALTER TABLE `each_day_pvs` ENABLE KEYS */;

-- 导出  表 weblog.each_hour_avg_user_pvs 结构
CREATE TABLE IF NOT EXISTS `each_hour_avg_user_pvs` (
  `hour` varchar(64) DEFAULT NULL,
  `pages` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_hour_avg_user_pvs 的数据：25 rows
/*!40000 ALTER TABLE `each_hour_avg_user_pvs` DISABLE KEYS */;
INSERT INTO `each_hour_avg_user_pvs` (`hour`, `pages`) VALUES
	('09-18-06', 5.842105263157895),
	('09-18-07', 10.306122448979592),
	('09-18-08', 15.906976744186046),
	('09-18-09', 9.221476510067115),
	('09-18-10', 5.308411214953271),
	('09-18-11', 10.574074074074074),
	('09-18-12', 11.942307692307692),
	('09-18-13', 7.47887323943662),
	('09-18-14', 8.290322580645162),
	('09-18-15', 10.541666666666666),
	('09-18-16', 5.10752688172043),
	('09-18-17', 6.945454545454545),
	('09-18-18', 6.238095238095238),
	('09-18-19', 4.698795180722891),
	('09-18-20', 6.0285714285714285),
	('09-18-21', 4.840909090909091),
	('09-18-22', 6.75),
	('09-18-23', 10.052631578947368),
	('09-19-00', 8),
	('09-19-01', 7.714285714285714),
	('09-19-02', 10.11111111111111),
	('09-19-03', 8.238805970149254),
	('09-19-04', 10.345454545454546),
	('09-19-05', 11.25),
	('09-19-06', 5);
/*!40000 ALTER TABLE `each_hour_avg_user_pvs` ENABLE KEYS */;

-- 导出  表 weblog.each_hour_every_refer_counts 结构
CREATE TABLE IF NOT EXISTS `each_hour_every_refer_counts` (
  `refer_host` varchar(64) DEFAULT NULL,
  `month` varchar(64) DEFAULT NULL,
  `day` varchar(64) DEFAULT NULL,
  `hour` varchar(64) DEFAULT NULL,
  `ref_host_cnts` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_hour_every_refer_counts 的数据：0 rows
/*!40000 ALTER TABLE `each_hour_every_refer_counts` DISABLE KEYS */;
INSERT INTO `each_hour_every_refer_counts` (`refer_host`, `month`, `day`, `hour`, `ref_host_cnts`) VALUES
	('blog.fens.me', '09', '18', ' 06', 68),
	('www.angularjs.cn', '09', '18', ' 06', 3),
	('www.google.com', '09', '18', ' 06', 2),
	('cos.name', '09', '18', ' 06', 1),
	('www.baidu.com', '09', '18', ' 06', 1),
	('blog.fens.me', '09', '18', ' 07', 711),
	('www.google.com.hk', '09', '18', ' 07', 20),
	('www.angularjs.cn', '09', '18', ' 07', 20),
	('www.dataguru.cn', '09', '18', ' 07', 10),
	('r.dataguru.cn', '09', '18', ' 07', 6),
	('www.fens.me', '09', '18', ' 07', 6),
	('cnodejs.org', '09', '18', ' 07', 5),
	('cos.name', '09', '18', ' 07', 5),
	('www.google.com', '09', '18', ' 07', 3),
	('blog.chinaunix.net', '09', '18', ' 07', 2),
	('f.dataguru.cn', '09', '18', ' 07', 2),
	('it.dataguru.cn', '09', '18', ' 07', 2),
	('www.weibo.com', '09', '18', ' 07', 1),
	('www.google.fr', '09', '18', ' 07', 1),
	('www.baidu.com', '09', '18', ' 07', 1),
	('image.baidu.com', '09', '18', ' 07', 1),
	('74.125.128.160', '09', '18', ' 07', 1),
	('blog.fens.me', '09', '18', ' 08', 1556),
	('www.fens.me', '09', '18', ' 08', 26),
	('www.baidu.com', '09', '18', ' 08', 15),
	('cnodejs.org', '09', '18', ' 08', 13),
	('cos.name', '09', '18', ' 08', 13),
	('www.google.com.hk', '09', '18', ' 08', 9),
	('www.dataguru.cn', '09', '18', ' 08', 7),
	('angularjs.cn', '09', '18', ' 08', 6),
	('www.angularjs.cn', '09', '18', ' 08', 4),
	('f.dataguru.cn', '09', '18', ' 08', 4),
	('www.google.com.tw', '09', '18', ' 08', 3),
	('blog.csdn.net', '09', '18', ' 08', 3),
	('www.google.com', '09', '18', ' 08', 3),
	('www.itpub.net', '09', '18', ' 08', 2),
	('cn.bing.com', '09', '18', ' 08', 1),
	('blog.fens.me', '09', '18', ' 09', 1047),
	('www.baidu.com', '09', '18', ' 09', 27),
	('www.google.com.hk', '09', '18', ' 09', 11),
	('www.dataguru.cn', '09', '18', ' 09', 9),
	('blog.fens.me.', '09', '18', ' 09', 9),
	('angularjs.cn', '09', '18', ' 09', 8),
	('r.dataguru.cn', '09', '18', ' 09', 8),
	('www.fens.me', '09', '18', ' 09', 7),
	('www.angularjs.cn', '09', '18', ' 09', 5),
	('redir.yy.duowan.com', '09', '18', ' 09', 3),
	('www.google.com', '09', '18', ' 09', 2),
	('cnodejs.org', '09', '18', ' 09', 2),
	('weibo.com', '09', '18', ' 09', 1),
	('www.google.com.tw', '09', '18', ' 09', 1),
	('www.100rmb.info', '09', '18', ' 09', 1),
	('cos.name', '09', '18', ' 09', 1),
	('www.w3c.com.cn', '09', '18', ' 09', 1),
	('www.google.co.th', '09', '18', ' 09', 1),
	('www.ruanyifeng.com', '09', '18', ' 09', 1),
	('blog.fens.me', '09', '18', ' 10', 307),
	('www.baidu.com', '09', '18', ' 10', 15),
	('www.angularjs.cn', '09', '18', ' 10', 7),
	('www.fens.me', '09', '18', ' 10', 5),
	('100rmb.info', '09', '18', ' 10', 3),
	('www.google.com.hk', '09', '18', ' 10', 2),
	('tongji.baidu.com', '09', '18', ' 10', 2),
	('f.dataguru.cn', '09', '18', ' 10', 1),
	('fens.me', '09', '18', ' 10', 1),
	('www.fens.me', '09', '19', ' 00', 13),
	('h2w.iask.cn', '09', '19', ' 00', 6),
	('angularjs.cn', '09', '19', ' 00', 3),
	('www.google.com.hk', '09', '19', ' 00', 3),
	('cnodejs.org', '09', '19', ' 00', 1),
	('www.leonarding.com', '09', '19', ' 00', 1),
	('www.itpub.net', '09', '19', ' 00', 1),
	('blog.fens.me', '09', '19', ' 01', 89),
	('cos.name', '09', '19', ' 01', 3),
	('www.angularjs.cn', '09', '19', ' 01', 2),
	('www.google.com.tw', '09', '19', ' 01', 2),
	('cnodejs.org', '09', '19', ' 01', 1),
	('www.google.com.hk', '09', '19', ' 01', 1),
	('mp.weixin.qq.com', '09', '19', ' 01', 1),
	('h2w.iask.cn', '09', '19', ' 01', 1),
	('weibo.com', '09', '19', ' 01', 1),
	('blog.fens.me', '09', '19', ' 02', 311),
	('www.google.com', '09', '19', ' 02', 3),
	('www.google.com.hk', '09', '19', ' 02', 3),
	('r.mail.qq.com', '09', '19', ' 02', 3),
	('freemined.com', '09', '19', ' 02', 2),
	('angularjs.cn', '09', '19', ' 02', 2),
	('it.dataguru.cn', '09', '19', ' 02', 2),
	('www.dataguru.cn', '09', '19', ' 02', 2),
	('cos.name', '09', '19', ' 02', 1),
	('www.google.com.tw', '09', '19', ' 02', 1),
	('cnodejs.org', '09', '19', ' 02', 1),
	('blog.fens.me', '09', '19', ' 03', 276),
	('cos.name', '09', '19', ' 03', 8),
	('www.angularjs.cn', '09', '19', ' 03', 7),
	('www.fens.me', '09', '19', ' 03', 6),
	('www.diffbot.com', '09', '19', ' 03', 4),
	('www.100rmb.info', '09', '19', ' 03', 2),
	('www.baidu.com', '09', '19', ' 03', 1),
	('f.dataguru.cn', '09', '19', ' 03', 1),
	('leonarding.com', '09', '19', ' 03', 1),
	('michaelhsu.tw', '09', '19', ' 03', 1),
	('mp.weixin.qq.com', '09', '19', ' 03', 1),
	('news.google.com', '09', '19', ' 03', 1),
	('www.dataguru.cn', '09', '19', ' 03', 1),
	('angularjs.cn', '09', '19', ' 03', 1),
	('www.google.com', '09', '19', ' 03', 1),
	('www.google.com.sg', '09', '19', ' 03', 1),
	('blog.fens.me', '09', '19', ' 04', 257),
	('www.100rmb.info', '09', '19', ' 04', 62),
	('www.fens.me', '09', '19', ' 04', 14),
	('www.angularjs.cn', '09', '19', ' 04', 6),
	('www.dataguru.cn', '09', '19', ' 04', 6),
	('www.google.com.hk', '09', '19', ' 04', 4),
	('blog.csdn.net', '09', '19', ' 04', 2),
	('www.google.com', '09', '19', ' 04', 2),
	('cos.name', '09', '19', ' 04', 2),
	('cnodejs.org', '09', '19', ' 04', 1),
	('blog.fens.me', '09', '19', ' 05', 336),
	('www.google.com.hk', '09', '19', ' 05', 5),
	('cos.name', '09', '19', ' 05', 4),
	('angularjs.cn', '09', '19', ' 05', 4),
	('it.dataguru.cn', '09', '19', ' 05', 1),
	('disqus.com', '09', '19', ' 05', 1),
	('www.angularjs.cn', '09', '19', ' 05', 1),
	('blog.fens.me', '09', '19', ' 06', 61),
	('www.baidu.com', '09', '19', ' 06', 13),
	('cos.name', '09', '19', ' 06', 1),
	('www.angularjs.cn', '09', '19', ' 06', 1),
	('www.baidu.com', '09', '18', ' 15', 1),
	('comp.freemined.com', '09', '18', ' 15', 1),
	('www.w3c.com.cn', '09', '18', ' 15', 1),
	('mp.weixin.qq.com', '09', '18', ' 15', 1),
	('download.freemined.com', '09', '18', ' 15', 1),
	('blog.fens.me', '09', '18', ' 16', 181),
	('www.baidu.com', '09', '18', ' 16', 40),
	('comp.freemined.com', '09', '18', ' 16', 10),
	('www.fens.me', '09', '18', ' 16', 8),
	('fens.me', '09', '18', ' 16', 6),
	('cos.name', '09', '18', ' 16', 5),
	('www.google.com.hk', '09', '18', ' 16', 3),
	('www.angularjs.cn', '09', '18', ' 16', 2),
	('www.leonarding.com', '09', '18', ' 16', 1),
	('www.google.com', '09', '18', ' 16', 1),
	('www.100rmb.info', '09', '18', ' 16', 1),
	('weibo.com', '09', '18', ' 16', 1),
	('image.baidu.com', '09', '18', ' 16', 1),
	('cnodejs.org', '09', '18', ' 16', 1),
	('www.dataguru.cn', '09', '18', ' 16', 1),
	('freemined.com', '09', '18', ' 16', 1),
	('blog.fens.me', '09', '18', ' 17', 104),
	('cos.name', '09', '18', ' 17', 3),
	('www.google.com.hk', '09', '18', ' 17', 1),
	('www.angularjs.cn', '09', '18', ' 17', 1),
	('www.google.com.tw', '09', '18', ' 17', 1),
	('www.fens.me', '09', '18', ' 17', 1),
	('blog.fens.me', '09', '18', ' 18', 68),
	('r.mail.qq.com', '09', '18', ' 18', 3),
	('cnodejs.org', '09', '18', ' 18', 2),
	('mo.wanzn.cn', '09', '18', ' 18', 1),
	('www.google.com', '09', '18', ' 18', 1),
	('weibo.com', '09', '18', ' 18', 1),
	('mp.weixin.qq.com', '09', '18', ' 18', 1),
	('fens.me', '09', '18', ' 18', 1),
	('blog.fens.me', '09', '18', ' 19', 122),
	('www.leonarding.com', '09', '18', ' 19', 88),
	('cnodejs.org', '09', '18', ' 19', 4),
	('www.google.com.hk', '09', '18', ' 19', 2),
	('www.google.com.tw', '09', '18', ' 19', 2),
	('100RMB.INFO', '09', '18', ' 19', 1),
	('blog.fens.me', '09', '18', ' 20', 34),
	('www.leonarding.com', '09', '18', ' 20', 9),
	('comp.freemined.com', '09', '18', ' 20', 2),
	('www.google.ca', '09', '18', ' 20', 1),
	('www.angularjs.cn', '09', '18', ' 20', 1),
	('blog.fens.me', '09', '18', ' 21', 27),
	('cos.name', '09', '18', ' 21', 2),
	('whois.domaintools.com', '09', '18', ' 21', 1),
	('h2w.iask.cn', '09', '18', ' 21', 1),
	('blog.fens.me', '09', '18', ' 22', 133),
	('www.fens.me', '09', '18', ' 22', 2),
	('www.google.com.hk', '09', '18', ' 22', 1),
	('mp.weixin.qq.com', '09', '18', ' 22', 1),
	('blog.fens.me', '09', '18', ' 23', 168),
	('www.fens.me', '09', '18', ' 23', 4),
	('cos.name', '09', '18', ' 23', 2),
	('weibo.com', '09', '18', ' 23', 1),
	('203.208.46.145', '09', '18', ' 23', 1),
	('f.dataguru.cn', '09', '18', ' 23', 1),
	('angularjs.cn', '09', '18', ' 23', 1),
	('whois.domaintools.com', '09', '18', ' 23', 1),
	('www.google.com', '09', '18', ' 23', 1),
	('blog.fens.me', '09', '19', ' 00', 111),
	('angularjs.cn', '09', '18', ' 10', 1),
	('cloud.feedly.com', '09', '18', ' 10', 1),
	('www.google.com.au', '09', '18', ' 10', 1),
	('cos.name', '09', '18', ' 10', 1),
	('it.dataguru.cn', '09', '18', ' 10', 1),
	('cnodejs.org', '09', '18', ' 10', 1),
	('blog.fens.me', '09', '18', ' 11', 245),
	('fens.me', '09', '18', ' 11', 12),
	('www.angularjs.cn', '09', '18', ' 11', 7),
	('cos.name', '09', '18', ' 11', 4),
	('cnodejs.org', '09', '18', ' 11', 3),
	('www.baidu.com', '09', '18', ' 11', 2),
	('weibo.com', '09', '18', ' 11', 1),
	('mp.weixin.qq.com', '09', '18', ' 11', 1),
	('www.google.com.hk', '09', '18', ' 11', 1),
	('www.leonarding.com', '09', '18', ' 11', 1),
	('blog.fens.me', '09', '18', ' 12', 397),
	('cnodejs.org', '09', '18', ' 12', 3),
	('www.angularjs.cn', '09', '18', ' 12', 2),
	('www.google.com.hk', '09', '18', ' 12', 2),
	('www.dataguru.cn', '09', '18', ' 12', 2),
	('f.dataguru.cn', '09', '18', ' 12', 2),
	('www.fens.me', '09', '18', ' 12', 2),
	('203.208.46.145', '09', '18', ' 12', 1),
	('angularjs.cn', '09', '18', ' 12', 1),
	('woman.seopower.su', '09', '18', ' 12', 1),
	('www.leonarding.com', '09', '18', ' 12', 1),
	('mp.weixin.qq.com', '09', '18', ' 12', 1),
	('cos.name', '09', '18', ' 12', 1),
	('blog.fens.me', '09', '18', ' 13', 243),
	('www.baidu.com', '09', '18', ' 13', 27),
	('cos.name', '09', '18', ' 13', 6),
	('www.angularjs.cn', '09', '18', ' 13', 5),
	('www.dataguru.cn', '09', '18', ' 13', 3),
	('angularjs.cn', '09', '18', ' 13', 2),
	('mp.weixin.qq.com', '09', '18', ' 13', 2),
	('f.dataguru.cn', '09', '18', ' 13', 2),
	('cnodejs.org', '09', '18', ' 13', 2),
	('www.fens.me', '09', '18', ' 13', 2),
	('42.121.84.157', '09', '18', ' 13', 1),
	('50.116.27.194', '09', '18', ' 13', 1),
	('www.google.com.hk', '09', '18', ' 13', 1),
	('www.google.com', '09', '18', ' 13', 1),
	('www.google.it', '09', '18', ' 13', 1),
	('blog.fens.me', '09', '18', ' 14', 259),
	('www.angularjs.cn', '09', '18', ' 14', 6),
	('www.dataguru.cn', '09', '18', ' 14', 5),
	('cos.name', '09', '18', ' 14', 4),
	('f.dataguru.cn', '09', '18', ' 14', 3),
	('cnodejs.org', '09', '18', ' 14', 3),
	('www.google.com.hk', '09', '18', ' 14', 3),
	('mp.weixin.qq.com', '09', '18', ' 14', 3),
	('disqus.com', '09', '18', ' 14', 1),
	('www.google.com', '09', '18', ' 14', 1),
	('www.linkedin.com', '09', '18', ' 14', 1),
	('blog.fens.me', '09', '18', ' 15', 477),
	('www.google.com.hk', '09', '18', ' 15', 9),
	('cos.name', '09', '18', ' 15', 8),
	('www.angularjs.cn', '09', '18', ' 15', 5),
	('f.dataguru.cn', '09', '18', ' 15', 3),
	('www.google.com.tw', '09', '18', ' 15', 3),
	('www.dataguru.cn', '09', '18', ' 15', 3),
	('cnodejs.org', '09', '18', ' 15', 3),
	('angularjs.cn', '09', '18', ' 15', 2),
	('www.fens.me', '09', '18', ' 15', 2);
/*!40000 ALTER TABLE `each_hour_every_refer_counts` ENABLE KEYS */;

-- 导出  表 weblog.each_hour_ip_count 结构
CREATE TABLE IF NOT EXISTS `each_hour_ip_count` (
  `hour` varchar(64) DEFAULT NULL,
  `ips` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_hour_ip_count 的数据：25 rows
/*!40000 ALTER TABLE `each_hour_ip_count` DISABLE KEYS */;
INSERT INTO `each_hour_ip_count` (`hour`, `ips`) VALUES
	('09-18-06', 19),
	('09-18-07', 98),
	('09-18-08', 129),
	('09-18-09', 149),
	('09-18-10', 107),
	('09-18-11', 54),
	('09-18-12', 52),
	('09-18-13', 71),
	('09-18-14', 62),
	('09-18-15', 72),
	('09-18-16', 93),
	('09-18-17', 55),
	('09-18-18', 42),
	('09-18-19', 83),
	('09-18-20', 35),
	('09-18-21', 44),
	('09-18-22', 52),
	('09-18-23', 38),
	('09-19-00', 39),
	('09-19-01', 42),
	('09-19-02', 57),
	('09-19-03', 67),
	('09-19-04', 55),
	('09-19-05', 48),
	('09-19-06', 30);
/*!40000 ALTER TABLE `each_hour_ip_count` ENABLE KEYS */;

-- 导出  表 weblog.each_hour_pvs 结构
CREATE TABLE IF NOT EXISTS `each_hour_pvs` (
  `hour` varchar(64) DEFAULT NULL,
  `pvs` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_hour_pvs 的数据：25 rows
/*!40000 ALTER TABLE `each_hour_pvs` DISABLE KEYS */;
INSERT INTO `each_hour_pvs` (`hour`, `pvs`) VALUES
	('09-18-06', 150),
	('09-18-07', 540),
	('09-18-08', 569),
	('09-18-09', 552),
	('09-18-10', 546),
	('09-18-11', 324),
	('09-18-12', 312),
	('09-18-13', 382),
	('09-18-14', 351),
	('09-18-15', 213),
	('09-18-16', 211),
	('09-18-17', 390),
	('09-18-18', 262),
	('09-18-19', 382),
	('09-18-20', 475),
	('09-18-21', 759),
	('09-18-22', 514),
	('09-18-23', 531),
	('09-19-00', 621),
	('09-19-01', 571),
	('09-19-02', 568),
	('09-19-03', 1374),
	('09-19-04', 2052),
	('09-19-05', 1010),
	('09-19-06', 111);
/*!40000 ALTER TABLE `each_hour_pvs` ENABLE KEYS */;

-- 导出  表 weblog.each_hour_top3_refer_host 结构
CREATE TABLE IF NOT EXISTS `each_hour_top3_refer_host` (
  `hour` varchar(64) DEFAULT NULL,
  `toporder` varchar(64) DEFAULT NULL,
  `ref_host` varchar(512) DEFAULT NULL,
  `ref_host_cnts` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.each_hour_top3_refer_host 的数据：75 rows
/*!40000 ALTER TABLE `each_hour_top3_refer_host` DISABLE KEYS */;
INSERT INTO `each_hour_top3_refer_host` (`hour`, `toporder`, `ref_host`, `ref_host_cnts`) VALUES
	('0918 12', '2', 'cnodejs.org', '3'),
	('0918 12', '3', 'www.dataguru.cn', '2'),
	('0918 13', '1', 'blog.fens.me', '243'),
	('0918 13', '2', 'www.baidu.com', '27'),
	('0918 13', '3', 'cos.name', '6'),
	('0918 14', '1', 'blog.fens.me', '259'),
	('0918 14', '2', 'www.angularjs.cn', '6'),
	('0918 14', '3', 'www.dataguru.cn', '5'),
	('0918 15', '1', 'blog.fens.me', '477'),
	('0918 15', '2', 'www.google.com.hk', '9'),
	('0918 15', '3', 'cos.name', '8'),
	('0918 16', '1', 'blog.fens.me', '181'),
	('0918 16', '2', 'www.baidu.com', '40'),
	('0918 16', '3', 'comp.freemined.com', '10'),
	('0918 17', '1', 'blog.fens.me', '104'),
	('0918 17', '2', 'cos.name', '3'),
	('0918 17', '3', 'www.google.com.hk', '1'),
	('0918 18', '1', 'blog.fens.me', '68'),
	('0919 00', '3', 'h2w.iask.cn', '6'),
	('0919 01', '1', 'blog.fens.me', '89'),
	('0919 01', '2', 'cos.name', '3'),
	('0919 01', '3', 'www.angularjs.cn', '2'),
	('0919 02', '1', 'blog.fens.me', '311'),
	('0919 02', '2', 'www.google.com', '3'),
	('0919 02', '3', 'www.google.com.hk', '3'),
	('0919 03', '1', 'blog.fens.me', '276'),
	('0919 03', '2', 'cos.name', '8'),
	('0919 03', '3', 'www.angularjs.cn', '7'),
	('0919 04', '1', 'blog.fens.me', '257'),
	('0919 04', '2', 'www.100rmb.info', '62'),
	('0919 04', '3', 'www.fens.me', '14'),
	('0919 05', '1', 'blog.fens.me', '336'),
	('0919 05', '2', 'www.google.com.hk', '5'),
	('0919 05', '3', 'angularjs.cn', '4'),
	('0919 06', '1', 'blog.fens.me', '61'),
	('0919 06', '2', 'www.baidu.com', '13'),
	('0919 06', '3', 'cos.name', '1'),
	('0918 06', '1', 'blog.fens.me', '68'),
	('0918 06', '2', 'www.angularjs.cn', '3'),
	('0918 06', '3', 'www.google.com', '2'),
	('0918 07', '1', 'blog.fens.me', '711'),
	('0918 07', '2', 'www.angularjs.cn', '20'),
	('0918 07', '3', 'www.google.com.hk', '20'),
	('0918 08', '1', 'blog.fens.me', '1556'),
	('0918 08', '2', 'www.fens.me', '26'),
	('0918 08', '3', 'www.baidu.com', '15'),
	('0918 09', '1', 'blog.fens.me', '1047'),
	('0918 09', '2', 'www.baidu.com', '27'),
	('0918 09', '3', 'www.google.com.hk', '11'),
	('0918 10', '1', 'blog.fens.me', '307'),
	('0918 10', '2', 'www.baidu.com', '15'),
	('0918 10', '3', 'www.angularjs.cn', '7'),
	('0918 11', '1', 'blog.fens.me', '245'),
	('0918 11', '2', 'fens.me', '12'),
	('0918 11', '3', 'www.angularjs.cn', '7'),
	('0918 12', '1', 'blog.fens.me', '397'),
	('0918 18', '2', 'r.mail.qq.com', '3'),
	('0918 18', '3', 'cnodejs.org', '2'),
	('0918 19', '1', 'blog.fens.me', '122'),
	('0918 19', '2', 'www.leonarding.com', '88'),
	('0918 19', '3', 'cnodejs.org', '4'),
	('0918 20', '1', 'blog.fens.me', '34'),
	('0918 20', '2', 'www.leonarding.com', '9'),
	('0918 20', '3', 'comp.freemined.com', '2'),
	('0918 21', '1', 'blog.fens.me', '27'),
	('0918 21', '2', 'cos.name', '2'),
	('0918 21', '3', 'h2w.iask.cn', '1'),
	('0918 22', '1', 'blog.fens.me', '133'),
	('0918 22', '2', 'www.fens.me', '2'),
	('0918 22', '3', 'www.google.com.hk', '1'),
	('0918 23', '1', 'blog.fens.me', '168'),
	('0918 23', '2', 'www.fens.me', '4'),
	('0918 23', '3', 'cos.name', '2'),
	('0919 00', '1', 'blog.fens.me', '111'),
	('0919 00', '2', 'www.fens.me', '13');
/*!40000 ALTER TABLE `each_hour_top3_refer_host` ENABLE KEYS */;

-- 导出  表 weblog.returning_user 结构
CREATE TABLE IF NOT EXISTS `returning_user` (
  `ip` varchar(64) DEFAULT NULL,
  `sessions` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='2';

-- 正在导出表  weblog.returning_user 的数据：2 rows
/*!40000 ALTER TABLE `returning_user` DISABLE KEYS */;
INSERT INTO `returning_user` (`ip`, `sessions`) VALUES
	('220.181.89.174', 3),
	('66.249.66.84', 3);
/*!40000 ALTER TABLE `returning_user` ENABLE KEYS */;

-- 导出  表 weblog.step_radio 结构
CREATE TABLE IF NOT EXISTS `step_radio` (
  `step` varchar(64) DEFAULT NULL,
  `user_count` int(11) DEFAULT NULL,
  `abs_radio` double DEFAULT NULL,
  `rel_radio` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.step_radio 的数据：4 rows
/*!40000 ALTER TABLE `step_radio` DISABLE KEYS */;
INSERT INTO `step_radio` (`step`, `user_count`, `abs_radio`, `rel_radio`) VALUES
	('step1', 4716, 1, 1),
	('step2', 4592, 0.97, 0.97),
	('step3', 3929, 0.83, 0.86),
	('step4', 2841, 0.6, 0.72);
/*!40000 ALTER TABLE `step_radio` ENABLE KEYS */;

-- 导出  表 weblog.top10_access_users 结构
CREATE TABLE IF NOT EXISTS `top10_access_users` (
  `rank` int(11) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.top10_access_users 的数据：10 rows
/*!40000 ALTER TABLE `top10_access_users` DISABLE KEYS */;
INSERT INTO `top10_access_users` (`rank`, `ip`, `count`) VALUES
	(1, '101.226.68.137', 972),
	(2, '163.177.71.12', 972),
	(3, '183.195.232.138', 971),
	(4, '58.215.204.118', 849),
	(5, '111.192.165.229', 334),
	(6, '114.252.89.91', 294),
	(7, '66.249.66.84', 246),
	(8, '220.181.89.174', 172),
	(9, '111.194.118.58', 160),
	(10, '222.70.152.149', 160);
/*!40000 ALTER TABLE `top10_access_users` ENABLE KEYS */;

-- 导出  表 weblog.user_avg_access_valid_times 结构
CREATE TABLE IF NOT EXISTS `user_avg_access_valid_times` (
  `count` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  weblog.user_avg_access_valid_times 的数据：1 rows
/*!40000 ALTER TABLE `user_avg_access_valid_times` DISABLE KEYS */;
INSERT INTO `user_avg_access_valid_times` (`count`) VALUES
	(1.4339622641509433);
/*!40000 ALTER TABLE `user_avg_access_valid_times` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
