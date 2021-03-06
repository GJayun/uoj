CREATE DATABASE  IF NOT EXISTS `jayun` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jayun`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: jayun
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `best_ac_submissions`
--

DROP TABLE IF EXISTS `best_ac_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `best_ac_submissions` (
  `problem_id` int NOT NULL,
  `submitter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_id` int NOT NULL,
  `used_time` int NOT NULL,
  `used_memory` int NOT NULL,
  `tot_size` int NOT NULL,
  `shortest_id` int NOT NULL,
  `shortest_used_time` int NOT NULL,
  `shortest_used_memory` int NOT NULL,
  `shortest_tot_size` int NOT NULL,
  PRIMARY KEY (`problem_id`,`submitter`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `best_ac_submissions`
--

LOCK TABLES `best_ac_submissions` WRITE;
/*!40000 ALTER TABLE `best_ac_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `best_ac_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_time` datetime NOT NULL,
  `poster` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_md` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zan` int NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'B',
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `jayun_type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `jayun_passwd` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (8,'???????????????????????????','[]\n<section><p>?????????????????????????????? Markdown</p>\r\n</section>\n<section><p>?????????????????????????????? Markdown</p>\r\n</section>\n<section><p>?????????????????????????????? Markdown</p>\r\n</section>\n<section><section><p>????????????????????????</p>\r\n</section><section><p>????????????????????????</p>\r\n</section></section>\n','2022-06-05 20:25:51','Jayun','---\r\n- |\r\n  ?????????????????????????????? Markdown\r\n- |\r\n  ?????????????????????????????? Markdown\r\n- |\r\n  ?????????????????????????????? Markdown\r\n- children:\r\n  - |\r\n    ????????????????????????\r\n  - |\r\n    ????????????????????????\r\n...',1,0,'S',0,'N',''),(12,'Enjoy Markdown! coding now...','<p>Enjoy Markdown! coding now...</p>\r\n','2022-06-11 15:27:46','Eason_Gu','Enjoy Markdown! coding now...',0,0,'B',0,'N',''),(13,'?????????','<p>gjy</p>\r\n','2022-06-14 22:03:53','QuantAsk','gjy',0,1,'B',1,'N',''),(10,'test','<h1>UVA1619 ???????????? Feel Good</h1>\r\n<p>134</p>\r\n\r\n<h2>??????</h2>\r\n<p><a href=\"https://www.luogu.com.cn/problem/UVA1619\">UVA1619 ???????????? Feel Good (luogu.com.cn)</a></p>\r\n<h2>????????????</h2>\r\n<p>??????????????? $n$ ???????????? $n$ ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>\r\n<h2>??????</h2>\r\n<p>?????????????????????????????????????????????????????????????????????????????????</p>\r\n<p>??????????????????????????????????????? $\\mathrm{sum}_{i}$???</p>\r\n<p>???????????????????????? $\\max\\limits_{i=1}^{n}(\\mathrm{sum}_{r_{i-1}}-\\mathrm{sum}_{l_i})\\cdot a_i$??????</p>\r\n<p>???????????????????????????UVa ?????? SPJ???????????????????????????????????????????????????????????????????????? UVa ???????????????????????????????????????????????????????????????????????????????????????</p>\r\n<h2>??????</h2>\r\n<pre><code class=\"sh_cpp\">const int N = 1e5 + 10;\r\n\r\ninline ll Read() {\r\n    ll x = 0, f = 1;\r\n    char c = getchar();\r\n    while (c != \'-\' &amp;&amp; (c &lt; \'0\' || c &gt; \'9\')) c = getchar();\r\n    if (c == \'-\') f = -f, c = getchar();\r\n    while (c &gt;= \'0\' &amp;&amp; c &lt;= \'9\') x = (x &lt;&lt; 3) + (x &lt;&lt; 1) + c - \'0\', c = getchar();\r\n    return x * f;\r\n}\r\n\r\nint n;\r\nll a[N], l[N], r[N], s[N], q[N];\r\nll ans, ansl, ansr;\r\n\r\nint main() {\r\n//    freopen(\".in\", \"r\", stdin);\r\n//    freopen(\".out\", \"w\", stdout);\r\n    for (bool flag = 0; scanf (\"%d\", &amp;n) != EOF; ) {\r\n        flag? putchar(10): flag = 1;\r\n        for (int i = 1; i &lt;= n; i++) \r\n            a[i] = Read(), \r\n            s[i] = s[i - 1] + a[i];\r\n        ans = a[1], ansl = ansr = 1;\r\n        int t = 0; q[0] = 0;\r\n        for (int i = 1; i &lt;= n; i++) {\r\n            for (; t &amp;&amp; a[q[t]] &gt;= a[i]; t--);\r\n            l[i] = q[t], q[++t] = i;\r\n        }\r\n        t = 0; q[0] = n + 1;\r\n        for (int i = n; i; i--)  {\r\n            for (; t &amp;&amp; a[q[t]] &gt;= a[i]; t--);\r\n            r[i] = q[t], q[++t] = i;\r\n        }\r\n        for (int i = 1; i &lt;= n; i++) {\r\n            ll tmp = a[i] * (s[r[i] - 1] - s[l[i]]);\r\n            if (ans &lt; tmp || (ans == tmp &amp;&amp; r[i] - l[i] - 1 &lt; ansr - ansl + 1))\r\n                ans = tmp, ansl = l[i] + 1, ansr = r[i] - 1;\r\n        }\r\n        printf (\"%lld\\n%lld %lld\\n\", ans, ansl, ansr);\r\n    }\r\n    return 0;\r\n}</code></pre>\r\n','2022-06-05 22:41:19','Jayun','# UVA1619 ???????????? Feel Good\n\n<p>134</p>\n\n## ??????\n\n[UVA1619 ???????????? Feel Good (luogu.com.cn)](https://www.luogu.com.cn/problem/UVA1619)\n\n## ????????????\n\n??????????????? $n$ ???????????? $n$ ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\n\n## ?????? \n\n?????????????????????????????????????????????????????????????????????????????????\n\n??????????????????????????????????????? $\\mathrm{sum}_{i}$???\n\n???????????????????????? $\\max\\limits_{i=1}^{n}(\\mathrm{sum}_{r_{i-1}}-\\mathrm{sum}_{l_i})\\cdot a_i$??????\n\n???????????????????????????UVa ?????? SPJ???????????????????????????????????????????????????????????????????????? UVa ???????????????????????????????????????????????????????????????????????????????????????\n\n## ??????\n\n```cpp\nconst int N = 1e5 + 10;\n\ninline ll Read() {\n	ll x = 0, f = 1;\n	char c = getchar();\n	while (c != \'-\' && (c < \'0\' || c > \'9\')) c = getchar();\n	if (c == \'-\') f = -f, c = getchar();\n	while (c >= \'0\' && c <= \'9\') x = (x << 3) + (x << 1) + c - \'0\', c = getchar();\n	return x * f;\n}\n\nint n;\nll a[N], l[N], r[N], s[N], q[N];\nll ans, ansl, ansr;\n\nint main() {\n//	freopen(\".in\", \"r\", stdin);\n//	freopen(\".out\", \"w\", stdout);\n	for (bool flag = 0; scanf (\"%d\", &n) != EOF; ) {\n		flag? putchar(10): flag = 1;\n		for (int i = 1; i <= n; i++) \n			a[i] = Read(), \n			s[i] = s[i - 1] + a[i];\n		ans = a[1], ansl = ansr = 1;\n		int t = 0; q[0] = 0;\n		for (int i = 1; i <= n; i++) {\n			for (; t && a[q[t]] >= a[i]; t--);\n			l[i] = q[t], q[++t] = i;\n		}\n		t = 0; q[0] = n + 1;\n		for (int i = n; i; i--)  {\n			for (; t && a[q[t]] >= a[i]; t--);\n			r[i] = q[t], q[++t] = i;\n		}\n		for (int i = 1; i <= n; i++) {\n			ll tmp = a[i] * (s[r[i] - 1] - s[l[i]]);\n			if (ans < tmp || (ans == tmp && r[i] - l[i] - 1 < ansr - ansl + 1))\n				ans = tmp, ansl = l[i] + 1, ansr = r[i] - 1;\n		}\n		printf (\"%lld\\n%lld %lld\\n\", ans, ansl, ansr);\n	}\n	return 0;\n}\n```',1,0,'B',0,'N','');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_comments`
--

DROP TABLE IF EXISTS `blogs_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_time` datetime NOT NULL,
  `poster` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zan` int NOT NULL,
  `reply_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_comments`
--

LOCK TABLES `blogs_comments` WRITE;
/*!40000 ALTER TABLE `blogs_comments` DISABLE KEYS */;
INSERT INTO `blogs_comments` VALUES (8,10,'???','2022-06-16 20:52:26','Jayun',0,0),(7,8,'6','2022-06-14 22:04:54','QuantAsk',0,0),(5,8,'@\r\noh','2022-06-10 13:31:56','Jayun',0,0),(6,10,'<span class=\"uoj-username\" data-rating=\"1500\">@Jayun</span> ????????????','2022-06-10 14:54:04','Eason_Gu',0,0),(9,10,'duck??????','2022-06-21 13:05:55','Jayun',0,6),(10,10,'**a**','2022-06-21 13:07:42','Jayun',0,0),(11,10,'?????? <span class=\"uoj-username\" data-rating=\"1500\">@Jayun</span>???test','2022-06-21 14:26:39','Jayun',0,6),(12,10,'**a**','2022-06-21 14:47:38','Jayun',0,0),(13,10,'&lt;p&gt;?????? <span class=\"uoj-username\" data-rating=\"1500\">@Jayun</span>??????test&lt;/p&gt;\r\n','2022-06-21 15:08:19','Jayun',0,6),(14,10,'<p>?????? <span class=\"uoj-username\" data-rating=\"1500\">@Jayun</span>???</p>\r\n','2022-06-21 15:09:36','Jayun',0,6),(15,10,'<p>?????????</p>\r\n','2022-06-21 18:42:58','Jayun',0,8),(16,10,'<p>&lt;p&gt;123&lt;/p&gt;</p>\r\n','2022-06-21 20:03:44','Jayun',0,0),(17,10,'<p></p><p>123</p><div>456</div>\r\n','2022-06-21 20:06:35','Jayun',0,0),(18,10,'<p>test</p>\r\n','2022-06-21 20:06:52','Jayun',1,0),(19,10,'<p><strong>a</strong></p>\r\n','2022-06-21 20:07:18','Jayun',0,0),(20,10,'<p>$a$</p>\r\n','2022-06-21 20:07:25','Jayun',0,0),(21,10,'<p><span class=\"uoj-username\" data-rating=\"1500\">@Jayun</span> ????????????</p>\r\n','2022-06-21 20:22:33','Jayun',0,0),(22,10,'<p>a</p>\r\n','2022-06-21 21:46:25','Jayun',0,0),(23,10,'<p>a</p>\r\n','2022-06-21 21:46:54','Jayun',0,0),(24,10,'<p>a</p>\r\n','2022-06-21 21:47:48','QuantAsk',0,0),(25,10,'','2022-06-21 21:48:50','QuantAsk',0,0),(26,10,'','2022-06-21 22:07:19','Jayun',0,0),(27,10,'<p>a</p>\r\n','2022-06-22 18:32:38','Jayun',0,23),(28,10,'<p>test</p>\r\n','2022-06-22 19:40:30','Jayun',0,0),(29,10,'<p>@</p>\r\n','2022-06-22 20:06:50','Jayun',0,0),(30,10,'<p>@</p>\r\n','2022-06-22 20:06:59','Jayun',0,29);
/*!40000 ALTER TABLE `blogs_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_tags`
--

DROP TABLE IF EXISTS `blogs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int NOT NULL,
  `tag` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`blog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_tags`
--

LOCK TABLES `blogs_tags` WRITE;
/*!40000 ALTER TABLE `blogs_tags` DISABLE KEYS */;
INSERT INTO `blogs_tags` VALUES (102,10,96),(96,8,33);
/*!40000 ALTER TABLE `blogs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `click_zans`
--

DROP TABLE IF EXISTS `click_zans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `click_zans` (
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int NOT NULL,
  `val` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`type`,`target_id`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `click_zans`
--

LOCK TABLES `click_zans` WRITE;
/*!40000 ALTER TABLE `click_zans` DISABLE KEYS */;
INSERT INTO `click_zans` VALUES ('B','Jayun',3,1),('P','Jayun',1,1),('B','Jayun',10,1),('BC','Jayun',18,1);
/*!40000 ALTER TABLE `click_zans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests`
--

DROP TABLE IF EXISTS `contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `start_time` datetime NOT NULL,
  `last_min` int NOT NULL,
  `player_num` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `extra_config` varchar(200) NOT NULL,
  `zan` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests`
--

LOCK TABLES `contests` WRITE;
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;
/*!40000 ALTER TABLE `contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests_asks`
--

DROP TABLE IF EXISTS `contests_asks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests_asks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contest_id` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `post_time` datetime NOT NULL,
  `reply_time` datetime NOT NULL,
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests_asks`
--

LOCK TABLES `contests_asks` WRITE;
/*!40000 ALTER TABLE `contests_asks` DISABLE KEYS */;
/*!40000 ALTER TABLE `contests_asks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests_notice`
--

DROP TABLE IF EXISTS `contests_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests_notice` (
  `contest_id` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` varchar(500) NOT NULL,
  `time` datetime NOT NULL,
  KEY `contest_id` (`contest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests_notice`
--

LOCK TABLES `contests_notice` WRITE;
/*!40000 ALTER TABLE `contests_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `contests_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests_permissions`
--

DROP TABLE IF EXISTS `contests_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests_permissions` (
  `username` varchar(20) NOT NULL,
  `contest_id` int NOT NULL,
  PRIMARY KEY (`username`,`contest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests_permissions`
--

LOCK TABLES `contests_permissions` WRITE;
/*!40000 ALTER TABLE `contests_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `contests_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests_problems`
--

DROP TABLE IF EXISTS `contests_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests_problems` (
  `problem_id` int NOT NULL,
  `contest_id` int NOT NULL,
  PRIMARY KEY (`problem_id`,`contest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests_problems`
--

LOCK TABLES `contests_problems` WRITE;
/*!40000 ALTER TABLE `contests_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `contests_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests_registrants`
--

DROP TABLE IF EXISTS `contests_registrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests_registrants` (
  `username` varchar(20) NOT NULL,
  `user_rating` int NOT NULL,
  `contest_id` int NOT NULL,
  `has_participated` tinyint(1) NOT NULL,
  `rank` int NOT NULL,
  PRIMARY KEY (`contest_id`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests_registrants`
--

LOCK TABLES `contests_registrants` WRITE;
/*!40000 ALTER TABLE `contests_registrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `contests_registrants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests_submissions`
--

DROP TABLE IF EXISTS `contests_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests_submissions` (
  `contest_id` int NOT NULL,
  `submitter` varchar(20) NOT NULL,
  `problem_id` int NOT NULL,
  `submission_id` int NOT NULL,
  `score` int NOT NULL,
  `penalty` int NOT NULL,
  PRIMARY KEY (`contest_id`,`submitter`,`problem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests_submissions`
--

LOCK TABLES `contests_submissions` WRITE;
/*!40000 ALTER TABLE `contests_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `contests_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countdown`
--

DROP TABLE IF EXISTS `countdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countdown` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countdown_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown`
--

LOCK TABLES `countdown` WRITE;
/*!40000 ALTER TABLE `countdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_test_submissions`
--

DROP TABLE IF EXISTS `custom_test_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_test_submissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int unsigned NOT NULL,
  `submit_time` datetime NOT NULL,
  `submitter` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `judge_time` datetime DEFAULT NULL,
  `result` blob NOT NULL,
  `status` varchar(20) NOT NULL,
  `status_details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_test_submissions`
--

LOCK TABLES `custom_test_submissions` WRITE;
/*!40000 ALTER TABLE `custom_test_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_test_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hacks`
--

DROP TABLE IF EXISTS `hacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hacks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int unsigned NOT NULL,
  `contest_id` int unsigned DEFAULT NULL,
  `submission_id` int unsigned NOT NULL,
  `hacker` varchar(20) NOT NULL,
  `owner` varchar(20) NOT NULL,
  `input` varchar(150) NOT NULL,
  `input_type` char(20) NOT NULL,
  `submit_time` datetime NOT NULL,
  `judge_time` datetime DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `details` blob NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submission_id` (`submission_id`),
  KEY `is_hidden` (`is_hidden`,`problem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hacks`
--

LOCK TABLES `hacks` WRITE;
/*!40000 ALTER TABLE `hacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `hacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `important_blogs`
--

DROP TABLE IF EXISTS `important_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `important_blogs` (
  `blog_id` int NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `important_blogs`
--

LOCK TABLES `important_blogs` WRITE;
/*!40000 ALTER TABLE `important_blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `important_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `judger_info`
--

DROP TABLE IF EXISTS `judger_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judger_info` (
  `judger_name` varchar(50) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ip` char(20) NOT NULL,
  PRIMARY KEY (`judger_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `judger_info`
--

LOCK TABLES `judger_info` WRITE;
/*!40000 ALTER TABLE `judger_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `judger_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `submission_requirement` text,
  `hackable` tinyint(1) NOT NULL DEFAULT '0',
  `extra_config` varchar(500) NOT NULL DEFAULT '{"view_content_type":"ALL","view_details_type":"ALL"}',
  `zan` int NOT NULL,
  `ac_num` int NOT NULL DEFAULT '0',
  `submit_num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (6,'New Problem',0,'{}',0,'{\"view_content_type\":\"ALL\",\"view_details_type\":\"ALL\"}',0,0,0),(7,'New Problem',1,'{}',0,'{\"view_content_type\":\"ALL\",\"view_details_type\":\"ALL\"}',0,0,0),(5,'New Problem',1,'{}',0,'{\"view_content_type\":\"ALL\",\"view_details_type\":\"ALL\"}',0,0,0);
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems_contents`
--

DROP TABLE IF EXISTS `problems_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems_contents` (
  `id` int NOT NULL,
  `statement` mediumtext NOT NULL,
  `statement_md` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems_contents`
--

LOCK TABLES `problems_contents` WRITE;
/*!40000 ALTER TABLE `problems_contents` DISABLE KEYS */;
INSERT INTO `problems_contents` VALUES (7,'',''),(5,'',''),(6,'','');
/*!40000 ALTER TABLE `problems_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems_permissions`
--

DROP TABLE IF EXISTS `problems_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems_permissions` (
  `username` varchar(20) NOT NULL,
  `problem_id` int NOT NULL,
  PRIMARY KEY (`username`,`problem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems_permissions`
--

LOCK TABLES `problems_permissions` WRITE;
/*!40000 ALTER TABLE `problems_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `problems_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems_tags`
--

DROP TABLE IF EXISTS `problems_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `problem_id` int NOT NULL,
  `tag` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `problem_id` (`problem_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems_tags`
--

LOCK TABLES `problems_tags` WRITE;
/*!40000 ALTER TABLE `problems_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `problems_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_requests`
--

DROP TABLE IF EXISTS `search_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `remote_addr` varchar(50) NOT NULL,
  `type` enum('search','autocomplete') NOT NULL,
  `cache_id` int NOT NULL,
  `q` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `result` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remote_addr` (`remote_addr`,`created_at`),
  KEY `created_at` (`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_requests`
--

LOCK TABLES `search_requests` WRITE;
/*!40000 ALTER TABLE `search_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int unsigned NOT NULL,
  `contest_id` int unsigned DEFAULT NULL,
  `submit_time` datetime NOT NULL,
  `submitter` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `language` varchar(15) NOT NULL,
  `tot_size` int NOT NULL,
  `judge_time` datetime DEFAULT NULL,
  `result` blob NOT NULL,
  `status` varchar(20) NOT NULL,
  `result_error` varchar(20) DEFAULT NULL,
  `score` int DEFAULT NULL,
  `used_time` int NOT NULL DEFAULT '0',
  `used_memory` int NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL,
  `status_details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_hidden` (`is_hidden`,`problem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `zh_cn` varchar(40) NOT NULL,
  `en` varchar(40) NOT NULL,
  `color` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Special Judge','Special Checker','violet'),(2,'?????????','Network Flow','pink'),(3,'?????????','Strings','pink'),(4,'KMP','KMP','olive'),(5,'?????????','Self-Balancing  Tree','olive'),(6,'????????????','Data Structure','pink'),(7,'?????????','Data Structures in Tree Nodes','olive'),(8,'??????','Math','pink'),(9,'??????','Matrices','olive'),(10,'?????????','Maximum Flow','olive'),(11,'?????????','Cost Flow','olive'),(12,'????????? / ???????????????','Polynomial/Formal Power Series','olive'),(13,'DFT?????? NTT??????FFT','DFT (NTT-included) & FFT','olive'),(14,'?????????','Disjoint Set','olive'),(15,'??????','Number Theory','pink'),(16,'????????????','Multiplicative Inverse','olive'),(17,'????????????','Suffix Array','olive'),(18,'????????????','3-variable Partial Order','olive'),(19,'?????????','Linear Basis','olive'),(20,'??????????????????','Lower-and-upper-bounded Flow Network','olive'),(21,'??????','Graph Theory','pink'),(22,'???????????????','Bipartite Matching','olive'),(23,'?????????','Minimum Cut','olive'),(24,'?????????????????????','Maximum Weight Closure','olive'),(25,'????????? 24 ???','24 Network Flows Problems','blue'),(26,'??????','Greedy','pink'),(27,'DP','DP','pink'),(28,'????????????','????????????','olive'),(29,'?????????','Shortest Path','olive'),(30,'??????????????????','M??bius Inversion','olive'),(31,'SDOI','SDOI','blue'),(32,'2016','2016','blue'),(33,'2017','2017','blue'),(34,'Link-Cut Tree','Link-Cut Tree','olive'),(35,'DFS ???','DFS Order','olive'),(36,'?????????','Segment Tree','olive'),(37,'??????','Binary Search','pink'),(38,'????????????','Fractional Programming','pink'),(39,'???????????????','Probability & Expectation','olive'),(40,'????????????','Gaussian Elimination','olive'),(41,'AC ?????????','AC Automation','olive'),(42,'??????','Original','blue'),(43,'SCOI','SCOI','blue'),(44,'2015','2015','blue'),(45,'??????','Offline','olive'),(46,'????????????','Heavy-Light Decomposition','olive'),(47,'set','set','olive'),(48,'?????? DP','DP on tree','olive'),(49,'????????????','Computational Geometry','pink'),(50,'????????????',' Halfplane Intersection','olive'),(51,'??????','Binary Lifting','olive'),(52,'????????? DP','Contour DP','olive'),(53,'?????????','Binary System','pink'),(54,'??????','XOR','pink'),(55,'?????????','Division on Tree Nodes','olive'),(56,'?????????','Trie','olive'),(57,'HNOI','HNOI','blue'),(58,'SHOI','SHOI','blue'),(59,'??????','Ternary Search','olive'),(60,'????????????','Inclusion-Exclusion Principle','olive'),(61,'????????????','Combinatorics','olive'),(62,'???????????????','Matrix-Tree Theorem','olive'),(63,'?????????','?????????','olive'),(64,'K-D Tree','K-D Tree','olive'),(65,'ZJOI','ZJOI','blue'),(66,'???????????????','Suffix Automata','olive'),(67,'????????????','Convex Hull Trick','olive'),(68,'??????','Search','pink'),(69,'????????????','Pruning','olive'),(70,'?????? DP','Plug-like DP','olive'),(71,'????????????????????????','Block Division','olive'),(72,'RMQ','RMQ','olive'),(73,'???????????????','MST','olive'),(74,'?????????','Tree Decomposition','olive'),(75,'?????????','Automation','olive'),(76,'POI','POI','blue'),(77,'2011','2011','blue'),(78,'?????????','?????????','olive'),(79,'NOI','NOI','blue'),(80,'????????????','Yali HS Training Camp','blue'),(81,'??????','Construct','pink'),(82,'?????????','Game Theory','pink'),(83,'???','Heap','olive'),(84,'2-SAT','2-SAT','olive'),(85,'?????? DP','Backpack','olive'),(86,'???????????????','???????????????','olive'),(87,'??????','Enumeration','olive'),(88,'CQOI','CQOI','blue'),(89,'?????? DP','Digit DP','olive'),(90,'????????????????????????','Extended Euclidean Algorithm','olive'),(91,'???????????????','Integer Factorization','olive'),(92,'?????????','Mergeable Heap','olive'),(93,'Gomory???Hu ???',' Gomory???Hu Tree','olive'),(94,'????????????','????????????','olive'),(95,'???????????????','D&C on Segment Tree','olive'),(96,'?????????','Monotonic Stack','olive'),(97,'????????????','Monotonic Queue','olive'),(98,'JSOI','JSOI','blue'),(99,'???????????????','Huffman Coding','olive'),(100,'SNOI','SNOI','blue'),(101,'????????????','Topological Sorting','olive'),(102,'?????????','Cactus','olive'),(103,'?????? DP','DP on Intervals','olive'),(104,'Hash','Hash','olive'),(105,'??????','Recursion','pink'),(106,'BJOI','BJOI','blue'),(107,'FJOI','FJOI','blue'),(108,'2014','2014','blue'),(109,'????????????','Presistency','olive'),(110,'?????????','Partition Tree','olive'),(111,'?????????','?????????','olive'),(112,'?????????','Planar Graph','olive'),(113,'BFS ???','BFS Tree','olive'),(114,'DFS ???','DFS Tree','olive'),(115,'?????????','?????????','olive'),(116,'HAOI','HAOI','blue'),(117,'CTSC','CTSC','blue'),(118,'????????????','Young Tableau','olive'),(119,'A*','A*','olive'),(120,'?????????','Randomize','pink'),(121,'????????????','Approximation Algorithm','pink'),(122,'????????????','Simulated Annealing','olive'),(123,'?????????','Hill Climbing','olive'),(124,'??????','Virtual Tree','olive'),(125,'FWT','FWT','olive'),(126,'???????????? / ?????????','Generating Function','olive'),(127,'Manacher','Manacher','olive'),(128,'JXOI','JXOI','blue'),(129,'??????????????????','Shandong Team Training','blue'),(130,'LibreOJ ?? Round','LibreOJ ?? Round','blue'),(131,'???????????????','Regex','olive'),(132,'Codeforces','Codeforces','blue'),(133,'hash ???','Hash Table','olive'),(134,'????????????','Discrete Logarithm','olive'),(135,'??????','Simulating','pink'),(136,'??????','Physics','olive'),(137,'THUWC','THUWC','blue'),(138,'?????????','Coordinate Compression','olive'),(139,'????????????','Sliding Window','olive'),(140,'?????????????????????','Euclidean-like Algorithm','olive'),(141,'Taylor ??????','Taylor Expansion','olive'),(142,'WC','WC','blue'),(143,'????????????','Low-level Optimization','pink'),(144,'Top Tree','Top Tree','olive'),(145,'THUSC','THUSC','blue'),(146,'?????????','Prefix Sum','olive'),(147,'????????????','Euler Circults','olive'),(148,'???????????????','Heuristic Merging','olive'),(149,'2012','2012','blue'),(150,'????????????','Binary Indexed Tree','olive'),(151,'bitset','bitset','olive'),(152,'????????????','Implementation','pink'),(153,'LibreOJ NOI Round','LibreOJ NOI Round','blue'),(154,'???????????? / Kruskal ?????????','Cartesian Tree','olive'),(155,'?????????','Tree with an Additional Edge','olive'),(156,'??????','Convex Hull','olive'),(157,'Pr??fer ??????','Pr??fer Sequence','olive'),(158,'???????????????','???????????????','olive'),(159,'??????','D&C','pink'),(160,'2013','2013','blue'),(161,'2010','2010','blue'),(162,'?????? 2010','Earlier than 2010','blue'),(163,'LibreOJ Round','LibreOJ Round','blue'),(164,'AtCoder','AtCoder','blue'),(165,'????????????','Connected Component','olive'),(166,'LibreOJ NOIP Round','LibreOJ NOIP Round','blue'),(167,'APIO','APIO','blue'),(168,'???????????????','Complexity Analysis','pink'),(169,'NOIP','NOIP','blue'),(170,'????????????','Principle of Compilers','pink'),(171,'???????????????','Mapping and Inversion','pink'),(172,'????????????','THU Training Camp','blue'),(173,'????????????','Linear Programming','pink'),(174,'JOI','JOI','blue'),(175,'???????????????','Partizan Games','pink'),(176,'????????????','Surreal Number','olive'),(177,'BestCoder','BestCoder','blue'),(178,'??????','Difference','pink'),(179,'????????????','Difference on Tree','olive'),(180,'Berlekamp-Massey ??????','Berlekamp-Massey Algorithm','olive'),(181,'???????????????','Set Power Series','olive'),(182,'2018','2018','blue'),(183,'CodePlus','CodePlus','blue'),(184,'hzwer ??????','@hzwer Problem Set','blue'),(185,'LCA','LCA','olive'),(186,'CEOI','CEOI','blue'),(187,'IOI','IOI','blue'),(188,'?????????????????????','Heuristic Merging on Tree','olive'),(189,'BalticOI','BalticOI','blue'),(190,'AHOI','AHOI','blue'),(191,'Special Round','Special Round','blue'),(192,'USACO Contest','USACO Contest','blue'),(193,'USACO Training','USACO Training','blue'),(194,'TJOI','TJOI','blue'),(195,'HEOI','HEOI','blue'),(196,'JLOI','JLOI','blue'),(197,'?????????','?????????','olive'),(198,'????????????','Semantic Analysis','olive'),(199,'PKUWC','PKUWC','blue'),(200,'LNOI','LNOI','blue'),(201,'?????????','Sweep Line Algorithm','olive'),(202,'Voronoi ???','Voronoi Diagram','olive'),(203,'???????????????','???????????????','blue'),(204,'??????','Matroid','olive'),(205,'THUPC','THUPC','blue'),(206,'ICPC','ICPC','blue'),(207,'World Final','World Final','blue'),(208,'NEERC','NEERC','blue'),(209,'?????????','High Precision','pink'),(210,'BalkanOI','BalkanOI','blue'),(211,'Catalan ???','Catalan Number','olive'),(212,'??????????????????','System of Difference Constraints','olive'),(213,'??????','Negative-Weight Cycle','olive'),(214,'k ??????','K-th Shortest Path','olive'),(215,'?????????','Fast Exponentiation Algorithm','olive'),(216,'??????????????????','Chinese Remainder Theorem','olive'),(217,'Baby Step Giant Step','Baby Step Giant Step','olive'),(218,'CCO','CCO','blue'),(219,'ROI','ROI','blue'),(220,'????????????','Steiner Tree','olive'),(221,'CCC','CCC','blue'),(222,'COCI','COCI','blue'),(223,'eJOI','eJOI','blue'),(224,'JOISC','JOISC','blue'),(225,'CzechOI','CzechOI','blue'),(226,'2019','2019','blue'),(227,'Project Euler','Project Euler','blue'),(228,'????????????','Multi-Provincial Contest','blue'),(229,'GZOI','GZOI','blue'),(230,'GXOI','GXOI','blue'),(231,'????????????','Retroactive Data Structure','olive'),(232,'BJWC','BJWC','blue'),(233,'?????? CodeM','Meituan CodeM','blue'),(234,'EC Final','EC Final','blue'),(235,'COI','COI','blue'),(236,'ad hoc','ad hoc','pink'),(237,'CSP','CSP','blue'),(238,'PA','PA','blue'),(239,'2020','2020','blue'),(240,'???????????????','Segment Tree Merging','olive'),(241,'ROIR','ROIR','blue'),(242,'2021','2021','blue'),(243,'??????????????????','Lagrange Inversion Formula','olive'),(244,'LGV ??????','LGV Lemma','olive'),(245,'2022','2022','blue'),(246,'????????????','????????????','blue'),(247,'SXOI','SXOI','blue'),(248,'CDQ ??????','CDQ\'s Divide-and-conquer','olive'),(249,'?????????','WHK','blue');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `usergroup` char(1) NOT NULL DEFAULT 'U',
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `svn_password` char(10) NOT NULL,
  `rating` int NOT NULL DEFAULT '1500',
  `qq` bigint NOT NULL,
  `sex` char(1) NOT NULL DEFAULT 'U',
  `ac_num` int NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remote_addr` varchar(50) NOT NULL,
  `http_x_forwarded_for` varchar(50) NOT NULL,
  `remember_token` char(60) NOT NULL,
  `motto` varchar(200) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `rating` (`rating`,`username`),
  KEY `ac_num` (`ac_num`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('U','Eason_Gu','2757537146@qq.com','eb4b32de47d9a2c8ca0bbe56fc5c741d','WZXjYQdBR4',1500,0,'U',0,'2022-06-10 06:51:35','127.0.0.1','','NVI3Y0RdJJZA8jVEiNN3IJIAAUfEKBHlsYGWORcftLvZTyAccrZ3u1EOCbQ4',''),('S','Jayun','1549583553@qq.com','732996cd70a4a88913d27fdd92c1d6a5','SpOOlJV9a4',1500,0,'U',0,'2022-06-08 13:50:22','127.0.0.1','','d8KTKui0n2F2Lnc5IluziTQEuzrhhPeTrEu6PYTXubDROFwASbt1NwiMJvrM','??????????????????????????????'),('U','QuantAsk','2538120705@qq.com','3d82f877eb20a9e05df35aff349e6af0','tMIKf674pr',1500,0,'U',0,'2022-06-14 14:03:15','127.0.0.1','','','');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_msg`
--

DROP TABLE IF EXISTS `user_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_msg` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(20) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `message` varchar(5000) NOT NULL,
  `send_time` datetime NOT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_msg`
--

LOCK TABLES `user_msg` WRITE;
/*!40000 ALTER TABLE `user_msg` DISABLE KEYS */;
INSERT INTO `user_msg` VALUES (1,'Jayun','Eason_Gu','Hi','2022-06-11 15:37:15','2022-06-11 15:37:35'),(2,'Eason_Gu','Jayun','Hi','2022-06-11 15:37:47','2022-06-11 15:37:51'),(3,'Eason_Gu','Jayun','?????????????????????\n','2022-06-11 15:38:02','2022-06-11 15:38:14'),(4,'Jayun','Eason_Gu','fsadfa4s56df4as6df4sd','2022-06-11 15:38:14','2022-06-11 15:38:14');
/*!40000 ALTER TABLE `user_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_system_msg`
--

DROP TABLE IF EXISTS `user_system_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_system_msg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` datetime NOT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_system_msg`
--

LOCK TABLES `user_system_msg` WRITE;
/*!40000 ALTER TABLE `user_system_msg` DISABLE KEYS */;
INSERT INTO `user_system_msg` VALUES (3,'???????????????','??????????????? test ????????????????????????<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Jayun','2022-06-10 14:54:04','2022-06-21 22:01:51'),(4,'?????????????????????','??????????????????????????? test ???<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Jayun','2022-06-10 14:54:04','2022-06-21 22:01:51'),(5,'?????????????????????','??????????????????????????? ??????????????????????????? ???<a href=\"/blog/jayun/post/8#comment-7\">??????????????????</a>','Jayun','2022-06-14 22:04:54','2022-06-21 22:01:51'),(6,'?????????????????????','??????????????????????????? test ???????????? ???<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Eason_Gu','2022-06-21 13:05:55',NULL),(7,'???????????????','??????????????? test ????????????????????????<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Jayun','2022-06-21 14:26:39','2022-06-21 22:01:51'),(8,'?????????????????????','??????????????????????????? test ???????????? ???<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Eason_Gu','2022-06-21 14:26:39',NULL),(9,'???????????????','??????????????? test ????????????????????????<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Jayun','2022-06-21 15:08:19','2022-06-21 22:01:51'),(10,'?????????????????????','??????????????????????????? test ???????????? ???<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Eason_Gu','2022-06-21 15:08:19',NULL),(11,'???????????????','??????????????? test ????????????????????????<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Jayun','2022-06-21 15:09:36','2022-06-21 22:01:51'),(12,'?????????????????????','??????????????????????????? test ???????????? ???<a href=\"/blog/jayun/post/10#comment-6\">??????????????????</a>','Eason_Gu','2022-06-21 15:09:36',NULL),(13,'???????????????','??????????????? test ????????????????????????<a href=\"/blog/jayun/post/10#comment-21\">??????????????????</a>','Jayun','2022-06-21 20:22:33','2022-06-21 22:01:51'),(14,'?????????????????????','??????????????????????????? test ???<a href=\"/blog/jayun/post/10#comment-24\">??????????????????</a>','Jayun','2022-06-21 21:47:48','2022-06-21 22:01:51'),(15,'?????????????????????','??????????????????????????? test ???<a href=\"/blog/jayun/post/10#comment-25\">??????????????????</a>','Jayun','2022-06-21 21:48:50','2022-06-21 22:01:51');
/*!40000 ALTER TABLE `user_system_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jayun'
--

--
-- Dumping routines for database 'jayun'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-25 14:08:26
