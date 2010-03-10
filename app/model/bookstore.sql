-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  `link` varchar(1024) NOT NULL,
  `approved` int(11) NOT NULL DEFAULT '0',
  `downloaded` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'WordPress-Help-Sheet.pdf','http://wpcandy.com/wp-content/uploads/WordPress-Help-Sheet.pdf',1,0,1268226684),(2,'WordPress-Security-Rode.pdf','http://www.nercomp.org/data/media/WordPress%20Security-Rode.pdf',1,0,1268226698);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtx_users`
--

DROP TABLE IF EXISTS `gtx_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtx_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `lastlogin` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `hash` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtx_users`
--

LOCK TABLES `gtx_users` WRITE;
/*!40000 ALTER TABLE `gtx_users` DISABLE KEYS */;
INSERT INTO `gtx_users` VALUES (1,'admin','90c35956d4faa35792c54a0771b58b49','admin@site.com','0','0','admin','61497afc07c9028e785ca346a935cd62');
/*!40000 ALTER TABLE `gtx_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexes`
--

DROP TABLE IF EXISTS `indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` int(11) NOT NULL,
  `stem` varchar(256) NOT NULL,
  `count` int(11) NOT NULL,
  `wpm` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=540 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexes`
--

LOCK TABLES `indexes` WRITE;
/*!40000 ALTER TABLE `indexes` DISABLE KEYS */;
INSERT INTO `indexes` VALUES (1,2,'indx-wordpress',57,52150),(2,2,'indx-com',40,36596),(3,2,'indx-secur',35,32021),(4,2,'indx-http',29,26532),(5,2,'indx-2009',27,24702),(6,2,'indx-rode',25,22872),(7,2,'indx-randal',25,22872),(8,2,'indx-rodework',24,21957),(9,2,'indx-wp',18,16468),(10,2,'indx-php',15,13723),(11,2,'indx-net',15,13723),(12,2,'indx-user',14,12808),(13,2,'indx-blogsecur',11,10064),(14,2,'indx-file',10,9149),(15,2,'indx-instal',10,9149),(16,2,'indx-plug',9,8234),(17,2,'indx-access',9,8234),(18,2,'indx-content',9,8234),(19,2,'indx-account',8,7319),(20,2,'indx-plugin',8,7319),(21,2,'indx-comment',8,7319),(22,2,'indx-databas',8,7319),(23,2,'indx-www',8,7319),(24,2,'indx-creat',7,6404),(25,2,'indx-admin',7,6404),(26,2,'indx-us',7,6404),(27,2,'indx-config',7,6404),(28,2,'indx-search',6,5489),(29,2,'indx-server',6,5489),(30,2,'indx-restrict',6,5489),(31,2,'indx-set',6,5489),(32,2,'indx-name',6,5489),(33,2,'indx-blog',5,4574),(34,2,'indx-web',5,4574),(35,2,'indx-vulner',5,4574),(36,2,'indx-onli',5,4574),(37,2,'indx-theme',5,4574),(38,2,'indx-htaccess',5,4574),(39,2,'indx-add',5,4574),(40,2,'indx-not',5,4574),(41,2,'indx-through',5,4574),(42,2,'indx-manag',4,3659),(43,2,'indx-limit',4,3659),(44,2,'indx-lorel',4,3659),(45,2,'indx-html',4,3659),(46,2,'indx-up',4,3659),(47,2,'indx-wai',4,3659),(48,2,'indx-default',4,3659),(49,2,'indx-upload',4,3659),(50,2,'indx-secunia',4,3659),(51,2,'indx-2008',4,3659),(52,2,'indx-tip',4,3659),(53,2,'indx-org',4,3659),(54,2,'indx-9',4,3659),(55,2,'indx-advisori',4,3659),(56,2,'indx-with',4,3659),(57,2,'indx-directori',4,3659),(58,2,'indx-2',4,3659),(59,2,'indx-1',4,3659),(60,2,'indx-configur',4,3659),(61,2,'indx-requir',3,2744),(62,2,'indx-your',3,2744),(63,2,'indx-how',3,2744),(64,2,'indx-write',3,2744),(65,2,'indx-implement',3,2744),(66,2,'indx-includ',3,2744),(67,2,'indx-tool',3,2744),(68,2,'indx-keep',3,2744),(69,2,'indx-db',3,2744),(70,2,'indx-address',3,2744),(71,2,'indx-10',3,2744),(72,2,'indx-back',3,2744),(73,2,'indx-11',3,2744),(74,2,'indx-standard',3,2744),(75,2,'indx-softwar',3,2744),(76,2,'indx-thi',3,2744),(77,2,'indx-updat',3,2744),(78,2,'indx-nvd',3,2744),(79,2,'indx-best',3,2744),(80,2,'indx-no',3,2744),(81,2,'indx-from',3,2744),(82,2,'indx-run',3,2744),(83,2,'indx-repositori',3,2744),(84,2,'indx-maximum',3,2744),(85,2,'indx-step',3,2744),(86,2,'indx-easi',3,2744),(87,2,'indx-alwai',3,2744),(88,2,'indx-spambam',3,2744),(89,2,'indx-export',3,2744),(90,2,'indx-part',3,2744),(91,2,'indx-data',3,2744),(92,2,'indx-kierznowski',2,1829),(93,2,'indx-7',2,1829),(94,2,'indx-hendri',2,1829),(95,2,'indx-improv',2,1829),(96,2,'indx-wpsecur',2,1829),(97,2,'indx-01',2,1829),(98,2,'indx-autom',2,1829),(99,2,'indx-blogbuildingu',2,1829),(100,2,'indx-hack',2,1829),(101,2,'indx-download',2,1829),(102,2,'indx-should',2,1829),(103,2,'indx-resourc',2,1829),(104,2,'indx-noup',2,1829),(105,2,'indx-maintain',2,1829),(106,2,'indx-line',2,1829),(107,2,'indx-lee',2,1829),(108,2,'indx-develop',2,1829),(109,2,'indx-such',2,1829),(110,2,'indx-role',2,1829),(111,2,'indx-permiss',2,1829),(112,2,'indx-function',2,1829),(113,2,'indx-more',2,1829),(114,2,'indx-backup',2,1829),(115,2,'indx-list',2,1829),(116,2,'indx-consid',2,1829),(117,2,'indx-wpid',2,1829),(118,2,'indx-detect',2,1829),(119,2,'indx-spam',2,1829),(120,2,'indx-program',2,1829),(121,2,'indx-version',2,1829),(122,2,'indx-control',2,1829),(123,2,'indx-whitepap',2,1829),(124,2,'indx-special',2,1829),(125,2,'indx-ftp',2,1829),(126,2,'indx-author',2,1829),(127,2,'indx-own',2,1829),(128,2,'indx-main',2,1829),(129,2,'indx-design',2,1829),(130,2,'indx-type',2,1829),(131,2,'indx-wpdesign',2,1829),(132,2,'indx-manual',2,1829),(133,2,'indx-david',2,1829),(134,2,'indx-custom',2,1829),(135,2,'indx-licens',2,1829),(136,2,'indx-readm',2,1829),(137,2,'indx-unneed',2,1829),(138,2,'indx-remov',2,1829),(139,2,'indx-tt',2,1829),(140,2,'indx-txt',2,1829),(141,2,'indx-check',2,1829),(142,2,'indx-scare',2,1829),(143,2,'indx-etc',2,1829),(144,2,'indx-renam',2,1829),(145,2,'indx-site',2,1829),(146,2,'indx-bogu',2,1829),(147,2,'indx-forc',2,1829),(148,2,'indx-3',2,1829),(149,2,'indx-tabl',2,1829),(150,2,'indx-apach',2,1829),(151,2,'indx-do',2,1829),(152,2,'indx-log',2,1829),(153,2,'indx-1893250',2,1829),(154,2,'indx-ip',2,1829),(155,2,'indx-04',2,1829),(156,2,'indx-footprint',2,1829),(157,2,'indx-archiv',2,1829),(158,2,'indx-other',2,1829),(159,2,'indx-specif',2,1829),(160,2,'indx-have',2,1829),(161,2,'indx-securityfocu',2,1829),(162,2,'indx-allow',2,1829),(163,2,'indx-ma',2,1829),(164,2,'indx-inject',2,1829),(165,2,'indx-most',2,1829),(166,2,'indx-simplehelp',2,1829),(167,2,'indx-09',2,1829),(168,2,'indx-principl',2,1829),(169,2,'indx-prevent',2,1829),(170,2,'indx-reaction',2,1829),(171,2,'indx-sql',2,1829),(172,2,'indx-predict',2,1829),(173,2,'indx-local',1,914),(174,2,'indx-like',1,914),(175,2,'indx-23',1,914),(176,2,'indx-mainten',1,914),(177,2,'indx-via',1,914),(178,2,'indx-mullenweg',1,914),(179,2,'indx-review',1,914),(180,2,'indx-ilfilosofo',1,914),(181,2,'indx-panel',1,914),(182,2,'indx-nist',1,914),(183,2,'indx-transfer',1,914),(184,2,'indx-matt',1,914),(185,2,'indx-also',1,914),(186,2,'indx-structur',1,914),(187,2,'indx-phpmyadmin',1,914),(188,2,'indx-full',1,914),(189,2,'indx-emb',1,914),(190,2,'indx-sec',1,914),(191,2,'indx-pg',1,914),(192,2,'indx-intrus',1,914),(193,2,'indx-intrud',1,914),(194,2,'indx-20',1,914),(195,2,'indx-video',1,914),(196,2,'indx-registr',1,914),(197,2,'indx-email',1,914),(198,2,'indx-emploi',1,914),(199,2,'indx-captcha',1,914),(200,2,'indx-devic',1,914),(201,2,'indx-system',1,914),(202,2,'indx-onlin',1,914),(203,2,'indx-toronto',1,914),(204,2,'indx-vimeo',1,914),(205,2,'indx-22',1,914),(206,2,'indx-wordcamp',1,914),(207,2,'indx-jaquith',1,914),(208,2,'indx-21',1,914),(209,2,'indx-anti',1,914),(210,2,'indx-page',1,914),(211,2,'indx-scanner',1,914),(212,2,'indx-new',1,914),(213,2,'indx-140707',1,914),(214,2,'indx-mark',1,914),(215,2,'indx-impact',1,914),(216,2,'indx-enabl',1,914),(217,2,'indx-problogdesign',1,914),(218,2,'indx-nation',1,914),(219,2,'indx-weblog',1,914),(220,2,'indx-collect',1,914),(221,2,'indx-measur',1,914),(222,2,'indx-pro',1,914),(223,2,'indx-co',1,914),(224,2,'indx-complianc',1,914),(225,2,'indx-u',1,914),(226,2,'indx-govern',1,914),(227,2,'indx-jeff',1,914),(228,2,'indx-chandler',1,914),(229,2,'indx-ross',1,914),(230,2,'indx-mckillop',1,914),(231,2,'indx-protocol',1,914),(232,2,'indx-30',1,914),(233,2,'indx-moder',1,914),(234,2,'indx-scap',1,914),(235,2,'indx-audiocast',1,914),(236,2,'indx-base',1,914),(237,2,'indx-weblogtoolscollect',1,914),(238,2,'indx-2007',1,914),(239,2,'indx-03',1,914),(240,2,'indx-vanfossen',1,914),(241,2,'indx-primari',1,914),(242,2,'indx-gov',1,914),(243,2,'indx-extra',1,914),(244,2,'indx-repres',1,914),(245,2,'indx-product',1,914),(246,2,'indx-read',1,914),(247,2,'indx-metric',1,914),(248,2,'indx-devloung',1,914),(249,2,'indx-code',1,914),(250,2,'indx-look',1,914),(251,2,'indx-offici',1,914),(252,2,'indx-codex',1,914),(253,2,'indx-misconfigur',1,914),(254,2,'indx-subscrib',1,914),(255,2,'indx-vuln',1,914),(256,2,'indx-present',1,914),(257,2,'indx-philipp',1,914),(258,2,'indx-checklist',1,914),(259,2,'indx-heinz',1,914),(260,2,'indx-24',1,914),(261,2,'indx-refer',1,914),(262,2,'indx-view',1,914),(263,2,'indx-flaw',1,914),(264,2,'indx-28',1,914),(265,2,'indx-relat',1,914),(266,2,'indx-util',1,914),(267,2,'indx-url',1,914),(268,2,'indx-at',1,914),(269,2,'indx-5',1,914),(270,2,'indx-inact',1,914),(271,2,'indx-least',1,914),(272,2,'indx-option',1,914),(273,2,'indx-script',1,914),(274,2,'indx-yourself',1,914),(275,2,'indx-deni',1,914),(276,2,'indx-public',1,914),(277,2,'indx-minim',1,914),(278,2,'indx-httrack',1,914),(279,2,'indx-when',1,914),(280,2,'indx-activ',1,914),(281,2,'indx-4',1,914),(282,2,'indx-reset',1,914),(283,2,'indx-avoid',1,914),(284,2,'indx-fantastico',1,914),(285,2,'indx-dreamhost',1,914),(286,2,'indx-wpconfig',1,914),(287,2,'indx-sampl',1,914),(288,2,'indx-latest',1,914),(289,2,'indx-enter',1,914),(290,2,'indx-password',1,914),(291,2,'indx-kei',1,914),(292,2,'indx-appropri',1,914),(293,2,'indx-8',1,914),(294,2,'indx-644',1,914),(295,2,'indx-host',1,914),(296,2,'indx-commerci',1,914),(297,2,'indx-common',1,914),(298,2,'indx-6',1,914),(299,2,'indx-775',1,914),(300,2,'indx-folder',1,914),(301,2,'indx-suffici',1,914),(302,2,'indx-lifecycl',1,914),(303,2,'indx-what',1,914),(304,2,'indx-effort',1,914),(305,2,'indx-veri',1,914),(306,2,'indx-properli',1,914),(307,2,'indx-faculti',1,914),(308,2,'indx-student',1,914),(309,2,'indx-gener',1,914),(310,2,'indx-complic',1,914),(311,2,'indx-spammer',1,914),(312,2,'indx-attract',1,914),(313,2,'indx-trust',1,914),(314,2,'indx-offer',1,914),(315,2,'indx-univers',1,914),(316,2,'indx-domain',1,914),(317,2,'indx-high',1,914),(318,2,'indx-internet',1,914),(319,2,'indx-volum',1,914),(320,2,'indx-consider',1,914),(321,2,'indx-regular',1,914),(322,2,'indx-level',1,914),(323,2,'indx-servic',1,914),(324,2,'indx-regularli',1,914),(325,2,'indx-agreement',1,914),(326,2,'indx-expect',1,914),(327,2,'indx-forev',1,914),(328,2,'indx-stai',1,914),(329,2,'indx-place',1,914),(330,2,'indx-monitor',1,914),(331,2,'indx-practic',1,914),(332,2,'indx-myphpadmin',1,914),(333,2,'indx-mysql',1,914),(334,2,'indx-core',1,914),(335,2,'indx-brows',1,914),(336,2,'indx-messag',1,914),(337,2,'indx-error',1,914),(338,2,'indx-ssl',1,914),(339,2,'indx-note',1,914),(340,2,'indx-granular',1,914),(341,2,'indx-get',1,914),(342,2,'indx-dai',1,914),(343,2,'indx-over',1,914),(344,2,'indx-im',1,914),(345,2,'indx-de',1,914),(346,2,'indx-gefunden',1,914),(347,2,'indx-everi',1,914),(348,2,'indx-editor',1,914),(349,2,'indx-guess',1,914),(350,2,'indx-thei',1,914),(351,2,'indx-hacker',1,914),(352,2,'indx-better',1,914),(353,2,'indx-command',1,914),(354,2,'indx-18',1,914),(355,2,'indx-select',1,914),(356,2,'indx-support',1,914),(357,2,'indx-topic',1,914),(358,2,'indx-akismet',1,914),(359,2,'indx-problem',1,914),(360,2,'indx-huge',1,914),(361,2,'indx-turn',1,914),(362,2,'indx-off',1,914),(363,2,'indx-all',1,914),(364,2,'indx-selfregistr',1,914),(365,2,'indx-19',1,914),(366,2,'indx-delet',1,914),(367,2,'indx-but',1,914),(368,2,'indx-work',1,914),(369,2,'indx-200087',1,914),(370,2,'indx-seem',1,914),(371,2,'indx-ok',1,914),(372,2,'indx-rememb',1,914),(373,2,'indx-fewest',1,914),(374,2,'indx-exploit',1,914),(375,2,'indx-number',1,914),(376,2,'indx-behavior',1,914),(377,2,'indx-12',1,914),(378,2,'indx-uncom',1,914),(379,2,'indx-will',1,914),(380,2,'indx-our',1,914),(381,2,'indx-edit',1,914),(382,2,'indx-prefer',1,914),(383,2,'indx-complet',1,914),(384,2,'indx-after',1,914),(385,2,'indx-then',1,914),(386,2,'indx-initi',1,914),(387,2,'indx-out',1,914),(388,2,'indx-first',1,914),(389,2,'indx-wpcontent',1,914),(390,2,'indx-siteaddress',1,914),(391,2,'indx-hello',1,914),(392,2,'indx-them',1,914),(393,2,'indx-13',1,914),(394,2,'indx-did',1,914),(395,2,'indx-you',1,914),(396,2,'indx-execut',1,914),(397,2,'indx-hide',1,914),(398,2,'indx-tag',1,914),(399,2,'indx-header',1,914),(400,2,'indx-17',1,914),(401,2,'indx-chang',1,914),(402,2,'indx-16',1,914),(403,2,'indx-wpinclud',1,914),(404,2,'indx-rang',1,914),(405,2,'indx-14',1,914),(406,2,'indx-certain',1,914),(407,2,'indx-friendli',1,914),(408,2,'indx-15',1,914),(409,2,'indx-held',1,914),(410,1,'indx-php',68,157772),(411,1,'indx-post',23,53364),(412,1,'indx-file',21,48723),(413,1,'indx-page',18,41763),(414,1,'indx-link',15,34802),(415,1,'indx-url',13,30162),(416,1,'indx-site',13,30162),(417,1,'indx-content',13,30162),(418,1,'indx-bloginfo',12,27842),(419,1,'indx-wp',7,16241),(420,1,'indx-get',7,16241),(421,1,'indx-list',7,16241),(422,1,'indx-specif',7,16241),(423,1,'indx-comment',6,13921),(424,1,'indx-header',6,13921),(425,1,'indx-search',5,11600),(426,1,'indx-templat',5,11600),(427,1,'indx-footer',5,11600),(428,1,'indx-titl',5,11600),(429,1,'indx-categori',4,9280),(430,1,'indx-if',4,9280),(431,1,'indx-sidebar',4,9280),(432,1,'indx-archiv',4,9280),(433,1,'indx-next',4,9280),(434,1,'indx-name',4,9280),(435,1,'indx-singl',3,6960),(436,1,'indx-version',3,6960),(437,1,'indx-previou',3,6960),(438,1,'indx-regist',3,6960),(439,1,'indx-queri',3,6960),(440,1,'indx-1',3,6960),(441,1,'indx-style',3,6960),(442,1,'indx-edit',2,4640),(443,1,'indx-p',2,4640),(444,1,'indx-meta',2,4640),(445,1,'indx-id',2,4640),(446,1,'indx-permalink',2,4640),(447,1,'indx-time',2,4640),(448,1,'indx-d',2,4640),(449,1,'indx-x',2,4640),(450,1,'indx-author',2,4640),(451,1,'indx-calendar',2,4640),(452,1,'indx-messag',2,4640),(453,1,'indx-close',2,4640),(454,1,'indx-function',2,4640),(455,1,'indx-charset',2,4640),(456,1,'indx-2',2,4640),(457,1,'indx-includ',2,4640),(458,1,'indx-descript',2,4640),(459,1,'indx-sheet',2,4640),(460,1,'indx-displai',2,4640),(461,1,'indx-wordpress',2,4640),(462,1,'indx-rss2',2,4640),(463,1,'indx-form',2,4640),(464,1,'indx-pingback',2,4640),(465,1,'indx-atom',2,4640),(466,1,'indx-index',2,4640),(467,1,'indx-load',2,4640),(468,1,'indx-snippet',2,4640),(469,1,'indx-locat',2,4640),(470,1,'indx-while',2,4640),(471,1,'indx-html',2,4640),(472,1,'indx-have',2,4640),(473,1,'indx-css',2,4640),(474,1,'indx-login',1,2320),(475,1,'indx-valu',1,2320),(476,1,'indx-logout',1,2320),(477,1,'indx-loginout',1,2320),(478,1,'indx-r',1,2320),(479,1,'indx-go',1,2320),(480,1,'indx-ltd',1,2320),(481,1,'indx-print',1,2320),(482,1,'indx-out',1,2320),(483,1,'indx-wpcandi',1,2320),(484,1,'indx-h',1,2320),(485,1,'indx-squar',1,2320),(486,1,'indx-more',1,2320),(487,1,'indx-num',1,2320),(488,1,'indx-replac',1,2320),(489,1,'indx-with',1,2320),(490,1,'indx-administr',1,2320),(491,1,'indx-timer',1,2320),(492,1,'indx-stop',1,2320),(493,1,'indx-echo',1,2320),(494,1,'indx-rest',1,2320),(495,1,'indx-onli',1,2320),(496,1,'indx-into',1,2320),(497,1,'indx-divid',1,2320),(498,1,'indx-cut',1,2320),(499,1,'indx-off',1,2320),(500,1,'indx-add',1,2320),(501,1,'indx-user',1,2320),(502,1,'indx-2007',1,2320),(503,1,'indx-show',1,2320),(504,1,'indx-endif',1,2320),(505,1,'indx-endwhil',1,2320),(506,1,'indx-basic',1,2320),(507,1,'indx-help',1,2320),(508,1,'indx-y',1,2320),(509,1,'indx-liquid',1,2320),(510,1,'indx-cat',1,2320),(511,1,'indx-popup',1,2320),(512,1,'indx-error',1,2320),(513,1,'indx-home',1,2320),(514,1,'indx-exact',1,2320),(515,1,'indx-theme',1,2320),(516,1,'indx-type',1,2320),(517,1,'indx-paramet',1,2320),(518,1,'indx-searchform',1,2320),(519,1,'indx-stylesheet',1,2320),(520,1,'indx-404',1,2320),(521,1,'indx-nav',1,2320),(522,1,'indx-extra',1,2320),(523,1,'indx-from',1,2320),(524,1,'indx-format',1,2320),(525,1,'indx-07',1,2320),(526,1,'indx-blogrol',1,2320),(527,1,'indx-built',1,2320),(528,1,'indx-ani',1,2320),(529,1,'indx-templatepath',1,2320),(530,1,'indx-18',1,2320),(531,1,'indx-08',1,2320),(532,1,'indx-custom',1,2320),(533,1,'indx-postnam',1,2320),(534,1,'indx-stuff',1,2320),(535,1,'indx-check',1,2320),(536,1,'indx-there',1,2320),(537,1,'indx-date',1,2320),(538,1,'indx-avail',1,2320),(539,1,'indx-b',1,2320);
/*!40000 ALTER TABLE `indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(256) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-03-10 19:23:54