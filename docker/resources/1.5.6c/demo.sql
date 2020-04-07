-- MySQL dump 10.13  Distrib 5.6.47, for Linux (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.6.47

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
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (1,1,'m','JustaDemo','Bill','Smith','123 Any Avenue','','12345','Here','',223,12);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_format`
--

LOCK TABLES `address_format` WRITE;
/*!40000 ALTER TABLE `address_format` DISABLE KEYS */;
INSERT INTO `address_format` VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country'),(6,'$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country','$postcode / $country'),(7,'$firstname $lastname$cr$streets$cr$city $state $postcode$cr$country','$city $state / $country');
/*!40000 ALTER TABLE `address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(255) NOT NULL DEFAULT '',
  `prev_pass1` varchar(255) NOT NULL DEFAULT '',
  `prev_pass2` varchar(255) NOT NULL DEFAULT '',
  `prev_pass3` varchar(255) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `reset_token` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'root','root@root.com',1,'$2y$10$c2jz6NYtw9yQOglQI15npOSbNqIBxlI4Y1.MsA26bHlQiNalLdxKi','$2y$10$mcBab/3nHpDTqzCHc3BUKOzuSTt7S9T.lePAe/chyPlIpne./D6qu','','','2020-04-03 08:34:44','','2020-04-03 08:32:39','2020-04-03 08:34:44','172.22.0.1',0,0,'2020-04-03 08:34:30','172.22.0.1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_activity_log`
--

DROP TABLE IF EXISTS `admin_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob,
  `logmessage` mediumtext NOT NULL,
  `severity` varchar(9) NOT NULL DEFAULT 'info',
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_flagged_zen` (`flagged`),
  KEY `idx_ip_zen` (`ip_address`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_activity_log`
--

LOCK TABLES `admin_activity_log` WRITE;
/*!40000 ALTER TABLE `admin_activity_log` DISABLE KEYS */;
INSERT INTO `admin_activity_log` VALUES (1,'2020-04-03 08:33:04',0,'Log found to be empty. Logging started.','','172.22.0.1',0,'','','Log found to be empty. Logging started.','notice'),(2,'2020-04-03 08:33:04',0,'alert_page.php ','','172.22.0.1',0,'','‹Ž\0','Accessed page [alert_page.php]','info'),(3,'2020-04-03 08:34:21',0,'login.php ','camefrom=index.php','172.22.0.1',0,'','‹Ž\0','Accessed page [login.php]','info'),(4,'2020-04-03 08:34:22',0,'login.php ','camefrom=index.php','172.22.0.1',0,'','‹Ž\0','Accessed page [login.php]','info'),(5,'2020-04-03 08:34:30',0,'login.php root','camefrom=index.php','172.22.0.1',0,'','«VJL.ÉÌÏS²RJÉOMML5J31170L1KK14MML2MM3KLNL4524SÒQJLÉÍÌ‹ÏKÌMê(ÊÏ/Š—&åf–\0ùÁF-\0','Accessed page [login.php] with action=doeeae2f44701d6fd15eab5ef6acaa5216. Review page_parameters and postdata for details.','info'),(6,'2020-04-03 08:34:44',0,'login.php ','','172.22.0.1',0,'','«VJL.ÉÌÏS²R**NMML5J31170L1KK14MML2MM3KLNL4524SÒQJLÉÍÌ‹ÏKÌMÕ%¨\Zhd~~	PSqiRnf	aÔ\0','Accessed page [login.php] with action=rseeae2f44701d6fd15eab5ef6acaa5216. Review page_parameters and postdata for details.','info'),(7,'2020-04-03 08:34:44',0,'login.php ','','172.22.0.1',1,'','«VJL.ÉÌÏS²R**NMML5J31170L1KK14MML2MM3KLNL4524SÒQJLÉÍÌ‹ÏKÌMÕ%¨\Zhd~~	PSqiRnf	aÔ\0','Account password change saved.','warning'),(8,'2020-04-03 08:34:44',1,'index.php','','172.22.0.1',0,'','‹Ž\0','Accessed page [index.php]','info'),(9,'2020-04-03 08:35:27',1,'index.php','action=update','172.22.0.1',0,'','«V*.É/JÏKÌMU²R\nHLOÌ+É,V‰*é@eóËóR‹¤Q%âSs3s€ÒPiC/9?¨¶*?/5>9¿4¯¤¨2>3¨ÒÐÒ&á›ÂÍLLI)J-.Š‚¡àtZLQLž#DÄt†˜bd\0\rQª\0','Accessed page [index.php] with action=update. Review page_parameters and postdata for details.','info'),(10,'2020-04-03 08:35:27',1,'index.php','','172.22.0.1',0,'','‹Ž\0','Accessed page [index.php]','info');
/*!40000 ALTER TABLE `admin_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_menus`
--

DROP TABLE IF EXISTS `admin_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menus` (
  `menu_key` varchar(191) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menus`
--

LOCK TABLES `admin_menus` WRITE;
/*!40000 ALTER TABLE `admin_menus` DISABLE KEYS */;
INSERT INTO `admin_menus` VALUES ('configuration','BOX_HEADING_CONFIGURATION',1),('catalog','BOX_HEADING_CATALOG',2),('modules','BOX_HEADING_MODULES',3),('customers','BOX_HEADING_CUSTOMERS',4),('taxes','BOX_HEADING_LOCATION_AND_TAXES',5),('localization','BOX_HEADING_LOCALIZATION',6),('reports','BOX_HEADING_REPORTS',7),('tools','BOX_HEADING_TOOLS',8),('gv','BOX_HEADING_GV_ADMIN',9),('access','BOX_HEADING_ADMIN_ACCESS',10),('extras','BOX_HEADING_EXTRAS',11);
/*!40000 ALTER TABLE `admin_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_notifications` (
  `notification_key` varchar(40) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `dismissed` char(1) DEFAULT NULL,
  UNIQUE KEY `notification_key` (`notification_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_pages`
--

DROP TABLE IF EXISTS `admin_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_pages` (
  `page_key` varchar(191) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(255) NOT NULL DEFAULT '',
  `page_params` varchar(255) NOT NULL DEFAULT '',
  `menu_key` varchar(191) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_pages`
--

LOCK TABLES `admin_pages` WRITE;
/*!40000 ALTER TABLE `admin_pages` DISABLE KEYS */;
INSERT INTO `admin_pages` VALUES ('configMyStore','BOX_CONFIGURATION_MY_STORE','FILENAME_CONFIGURATION','gID=1','configuration','Y',1),('configMinimumValues','BOX_CONFIGURATION_MINIMUM_VALUES','FILENAME_CONFIGURATION','gID=2','configuration','Y',2),('configMaximumValues','BOX_CONFIGURATION_MAXIMUM_VALUES','FILENAME_CONFIGURATION','gID=3','configuration','Y',3),('configImages','BOX_CONFIGURATION_IMAGES','FILENAME_CONFIGURATION','gID=4','configuration','Y',4),('configCustomerDetails','BOX_CONFIGURATION_CUSTOMER_DETAILS','FILENAME_CONFIGURATION','gID=5','configuration','Y',5),('configShipping','BOX_CONFIGURATION_SHIPPING_PACKAGING','FILENAME_CONFIGURATION','gID=7','configuration','Y',6),('configProductListing','BOX_CONFIGURATION_PRODUCT_LISTING','FILENAME_CONFIGURATION','gID=8','configuration','Y',7),('configStock','BOX_CONFIGURATION_STOCK','FILENAME_CONFIGURATION','gID=9','configuration','Y',8),('configLogging','BOX_CONFIGURATION_LOGGING','FILENAME_CONFIGURATION','gID=10','configuration','Y',9),('configEmail','BOX_CONFIGURATION_EMAIL_OPTIONS','FILENAME_CONFIGURATION','gID=12','configuration','Y',10),('configAttributes','BOX_CONFIGURATION_ATTRIBUTE_OPTIONS','FILENAME_CONFIGURATION','gID=13','configuration','Y',11),('configGzipCompression','BOX_CONFIGURATION_GZIP_COMPRESSION','FILENAME_CONFIGURATION','gID=14','configuration','Y',12),('configSessions','BOX_CONFIGURATION_SESSIONS','FILENAME_CONFIGURATION','gID=15','configuration','Y',13),('configRegulations','BOX_CONFIGURATION_REGULATIONS','FILENAME_CONFIGURATION','gID=11','configuration','Y',14),('configGvCoupons','BOX_CONFIGURATION_GV_COUPONS','FILENAME_CONFIGURATION','gID=16','configuration','Y',15),('configCreditCards','BOX_CONFIGURATION_CREDIT_CARDS','FILENAME_CONFIGURATION','gID=17','configuration','Y',16),('configProductInfo','BOX_CONFIGURATION_PRODUCT_INFO','FILENAME_CONFIGURATION','gID=18','configuration','Y',17),('configLayoutSettings','BOX_CONFIGURATION_LAYOUT_SETTINGS','FILENAME_CONFIGURATION','gID=19','configuration','Y',18),('configWebsiteMaintenance','BOX_CONFIGURATION_WEBSITE_MAINTENANCE','FILENAME_CONFIGURATION','gID=20','configuration','Y',19),('configNewListing','BOX_CONFIGURATION_NEW_LISTING','FILENAME_CONFIGURATION','gID=21','configuration','Y',20),('configFeaturedListing','BOX_CONFIGURATION_FEATURED_LISTING','FILENAME_CONFIGURATION','gID=22','configuration','Y',21),('configAllListing','BOX_CONFIGURATION_ALL_LISTING','FILENAME_CONFIGURATION','gID=23','configuration','Y',22),('configIndexListing','BOX_CONFIGURATION_INDEX_LISTING','FILENAME_CONFIGURATION','gID=24','configuration','Y',23),('configDefinePageStatus','BOX_CONFIGURATION_DEFINE_PAGE_STATUS','FILENAME_CONFIGURATION','gID=25','configuration','Y',24),('configEzPagesSettings','BOX_CONFIGURATION_EZPAGES_SETTINGS','FILENAME_CONFIGURATION','gID=30','configuration','Y',25),('categories','BOX_CATALOG_CATEGORY','FILENAME_CATEGORIES','','catalog','N',18),('categoriesProductListing','BOX_CATALOG_CATEGORIES_PRODUCTS','FILENAME_CATEGORY_PRODUCT_LISTING','','catalog','Y',1),('productTypes','BOX_CATALOG_PRODUCT_TYPES','FILENAME_PRODUCT_TYPES','','catalog','Y',2),('priceManager','BOX_CATALOG_PRODUCTS_PRICE_MANAGER','FILENAME_PRODUCTS_PRICE_MANAGER','','catalog','Y',3),('optionNames','BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER','FILENAME_OPTIONS_NAME_MANAGER','','catalog','Y',4),('optionValues','BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER','FILENAME_OPTIONS_VALUES_MANAGER','','catalog','Y',5),('attributes','BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER','FILENAME_ATTRIBUTES_CONTROLLER','','catalog','Y',6),('downloads','BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER','FILENAME_DOWNLOADS_MANAGER','','catalog','Y',7),('optionNameSorter','BOX_CATALOG_PRODUCT_OPTIONS_NAME','FILENAME_PRODUCTS_OPTIONS_NAME','','catalog','Y',8),('optionValueSorter','BOX_CATALOG_PRODUCT_OPTIONS_VALUES','FILENAME_PRODUCTS_OPTIONS_VALUES','','catalog','Y',9),('manufacturers','BOX_CATALOG_MANUFACTURERS','FILENAME_MANUFACTURERS','','catalog','Y',10),('reviews','BOX_CATALOG_REVIEWS','FILENAME_REVIEWS','','catalog','Y',11),('specials','BOX_CATALOG_SPECIALS','FILENAME_SPECIALS','','catalog','Y',12),('featured','BOX_CATALOG_FEATURED','FILENAME_FEATURED','','catalog','Y',13),('salemaker','BOX_CATALOG_SALEMAKER','FILENAME_SALEMAKER','','catalog','Y',14),('productsExpected','BOX_CATALOG_PRODUCTS_EXPECTED','FILENAME_PRODUCTS_EXPECTED','','catalog','Y',15),('product','BOX_CATALOG_PRODUCT','FILENAME_PRODUCT','','catalog','N',16),('productsToCategories','BOX_CATALOG_PRODUCTS_TO_CATEGORIES','FILENAME_PRODUCTS_TO_CATEGORIES','','catalog','N',17),('payment','BOX_MODULES_PAYMENT','FILENAME_MODULES','set=payment','modules','Y',1),('shipping','BOX_MODULES_SHIPPING','FILENAME_MODULES','set=shipping','modules','Y',2),('orderTotal','BOX_MODULES_ORDER_TOTAL','FILENAME_MODULES','set=ordertotal','modules','Y',3),('customers','BOX_CUSTOMERS_CUSTOMERS','FILENAME_CUSTOMERS','','customers','Y',1),('orders','BOX_CUSTOMERS_ORDERS','FILENAME_ORDERS','','customers','Y',2),('groupPricing','BOX_CUSTOMERS_GROUP_PRICING','FILENAME_GROUP_PRICING','','customers','Y',3),('paypal','BOX_CUSTOMERS_PAYPAL','FILENAME_PAYPAL','','customers','Y',4),('invoice','BOX_CUSTOMERS_INVOICE','FILENAME_ORDERS_INVOICE','','customers','N',5),('packingslip','BOX_CUSTOMERS_PACKING_SLIP','FILENAME_ORDERS_PACKINGSLIP','','customers','N',6),('countries','BOX_TAXES_COUNTRIES','FILENAME_COUNTRIES','','taxes','Y',1),('zones','BOX_TAXES_ZONES','FILENAME_ZONES','','taxes','Y',2),('geoZones','BOX_TAXES_GEO_ZONES','FILENAME_GEO_ZONES','','taxes','Y',3),('taxClasses','BOX_TAXES_TAX_CLASSES','FILENAME_TAX_CLASSES','','taxes','Y',4),('taxRates','BOX_TAXES_TAX_RATES','FILENAME_TAX_RATES','','taxes','Y',5),('currencies','BOX_LOCALIZATION_CURRENCIES','FILENAME_CURRENCIES','','localization','Y',1),('languages','BOX_LOCALIZATION_LANGUAGES','FILENAME_LANGUAGES','','localization','Y',2),('ordersStatus','BOX_LOCALIZATION_ORDERS_STATUS','FILENAME_ORDERS_STATUS','','localization','Y',3),('reportCustomers','BOX_REPORTS_ORDERS_TOTAL','FILENAME_STATS_CUSTOMERS','','reports','Y',1),('reportReferrals','BOX_REPORTS_CUSTOMERS_REFERRALS','FILENAME_STATS_CUSTOMERS_REFERRALS','','reports','Y',2),('reportLowStock','BOX_REPORTS_PRODUCTS_LOWSTOCK','FILENAME_STATS_PRODUCTS_LOWSTOCK','','reports','Y',3),('reportProductsSold','BOX_REPORTS_PRODUCTS_PURCHASED','FILENAME_STATS_PRODUCTS_PURCHASED','','reports','Y',4),('reportProductsViewed','BOX_REPORTS_PRODUCTS_VIEWED','FILENAME_STATS_PRODUCTS_VIEWED','','reports','Y',5),('templateSelect','BOX_TOOLS_TEMPLATE_SELECT','FILENAME_TEMPLATE_SELECT','','tools','Y',1),('layoutController','BOX_TOOLS_LAYOUT_CONTROLLER','FILENAME_LAYOUT_CONTROLLER','','tools','Y',2),('banners','BOX_TOOLS_BANNER_MANAGER','FILENAME_BANNER_MANAGER','','tools','Y',3),('mail','BOX_TOOLS_MAIL','FILENAME_MAIL','','tools','Y',4),('newsletters','BOX_TOOLS_NEWSLETTER_MANAGER','FILENAME_NEWSLETTERS','','tools','Y',5),('server','BOX_TOOLS_SERVER_INFO','FILENAME_SERVER_INFO','','tools','Y',6),('whosOnline','BOX_TOOLS_WHOS_ONLINE','FILENAME_WHOS_ONLINE','','tools','Y',7),('storeManager','BOX_TOOLS_STORE_MANAGER','FILENAME_STORE_MANAGER','','tools','Y',9),('developersToolKit','BOX_TOOLS_DEVELOPERS_TOOL_KIT','FILENAME_DEVELOPERS_TOOL_KIT','','tools','Y',10),('ezpages','BOX_TOOLS_EZPAGES','FILENAME_EZPAGES_ADMIN','','tools','Y',11),('definePagesEditor','BOX_TOOLS_DEFINE_PAGES_EDITOR','FILENAME_DEFINE_PAGES_EDITOR','','tools','Y',12),('sqlPatch','BOX_TOOLS_SQLPATCH','FILENAME_SQLPATCH','','tools','Y',13),('couponAdmin','BOX_COUPON_ADMIN','FILENAME_COUPON_ADMIN','','gv','Y',1),('couponRestrict','BOX_COUPON_RESTRICT','FILENAME_COUPON_RESTRICT','','gv','N',1),('gvQueue','BOX_GV_ADMIN_QUEUE','FILENAME_GV_QUEUE','','gv','Y',2),('gvMail','BOX_GV_ADMIN_MAIL','FILENAME_GV_MAIL','','gv','Y',3),('gvSent','BOX_GV_ADMIN_SENT','FILENAME_GV_SENT','','gv','Y',4),('profiles','BOX_ADMIN_ACCESS_PROFILES','FILENAME_PROFILES','','access','Y',1),('users','BOX_ADMIN_ACCESS_USERS','FILENAME_USERS','','access','Y',2),('pageRegistration','BOX_ADMIN_ACCESS_PAGE_REGISTRATION','FILENAME_ADMIN_PAGE_REGISTRATION','','access','Y',3),('adminlogs','BOX_ADMIN_ACCESS_LOGS','FILENAME_ADMIN_ACTIVITY','','access','Y',4),('recordArtists','BOX_CATALOG_RECORD_ARTISTS','FILENAME_RECORD_ARTISTS','','extras','Y',1),('recordCompanies','BOX_CATALOG_RECORD_COMPANY','FILENAME_RECORD_COMPANY','','extras','Y',2),('musicGenre','BOX_CATALOG_MUSIC_GENRE','FILENAME_MUSIC_GENRE','','extras','Y',3),('mediaManager','BOX_CATALOG_MEDIA_MANAGER','FILENAME_MEDIA_MANAGER','','extras','Y',4),('mediaTypes','BOX_CATALOG_MEDIA_TYPES','FILENAME_MEDIA_TYPES','','extras','Y',5),('reportSalesWithGraphs','BOX_REPORTS_SALES_REPORT_GRAPHS','FILENAME_STATS_SALES_REPORT_GRAPHS','','reports','Y',15);
/*!40000 ALTER TABLE `admin_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_pages_to_profiles`
--

DROP TABLE IF EXISTS `admin_pages_to_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(191) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_pages_to_profiles`
--

LOCK TABLES `admin_pages_to_profiles` WRITE;
/*!40000 ALTER TABLE `admin_pages_to_profiles` DISABLE KEYS */;
INSERT INTO `admin_pages_to_profiles` VALUES (2,'currencies'),(2,'customers'),(2,'gvMail'),(2,'gvQueue'),(2,'gvSent'),(2,'invoice'),(2,'orders'),(2,'packingslip'),(2,'paypal'),(2,'reportCustomers'),(2,'reportLowStock'),(2,'reportProductsSold'),(2,'reportProductsViewed'),(2,'reportReferrals'),(2,'whosOnline');
/*!40000 ALTER TABLE `admin_pages_to_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_profiles`
--

DROP TABLE IF EXISTS `admin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_profiles`
--

LOCK TABLES `admin_profiles` WRITE;
/*!40000 ALTER TABLE `admin_profiles` DISABLE KEYS */;
INSERT INTO `admin_profiles` VALUES (1,'Superuser'),(2,'Order Processing');
/*!40000 ALTER TABLE `admin_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorizenet`
--

DROP TABLE IF EXISTS `authorizenet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` varchar(32) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorizenet`
--

LOCK TABLES `authorizenet` WRITE;
/*!40000 ALTER TABLE `authorizenet` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorizenet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(255) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Zen Cart','https://www.zen-cart.com','banners/zencart_468_60_02.gif','Wide-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(2,'Zen Cart the art of e-commerce','https://www.zen-cart.com','banners/125zen_logo.gif','SideBox-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(3,'Zen Cart the art of e-commerce','https://www.zen-cart.com','banners/125x125_zen_logo.gif','SideBox-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(4,'if you have to think ... you haven\'t been Zenned!','https://www.zen-cart.com','banners/think_anim.gif','Wide-Banners','',0,NULL,NULL,'2004-01-12 20:53:18',NULL,1,1,1,0),(5,'Zen Cart the art of e-commerce','https://www.zen-cart.com','banners/bw_zen_88wide.gif','BannersAll','',0,NULL,NULL,'2005-05-13 10:54:38',NULL,1,1,1,10),(6,'Zen Cart','https://www.zen-cart.com','','Wide-Banners','<script><!--//<![CDATA[\r\n   var loc = \'//pan.zen-cart.com/display/group/1/\';\r\n   var rd = Math.floor(Math.random()*99999999999);\r\n   document.write (\"<scr\"+\"ipt src=\'\"+loc);\r\n   document.write (\'?rd=\' + rd);\r\n   document.write (\"\'></scr\"+\"ipt>\");\r\n//]]>--></script>',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(7,'Credit Card Processing','https://www.zen-cart.com/partners/square_promo','banners/cardsvcs_468x60.gif','Wide-Banners','',0,NULL,NULL,'2005-05-13 10:54:38',NULL,1,1,1,0);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_history`
--

LOCK TABLES `banners_history` WRITE;
/*!40000 ALTER TABLE `banners_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'categories/category_hardware.gif',0,1,'2003-12-23 03:18:19','2004-05-21 00:32:17',1),(2,'categories/category_software.gif',0,2,'2003-12-23 03:18:19','2004-05-22 21:14:57',1),(3,'categories/category_dvd_movies.gif',0,3,'2003-12-23 03:18:19','2004-05-21 00:22:39',1),(4,'categories/subcategory_graphic_cards.gif',1,0,'2003-12-23 03:18:19',NULL,1),(5,'categories/subcategory_printers.gif',1,0,'2003-12-23 03:18:19',NULL,1),(6,'categories/subcategory_monitors.gif',1,0,'2003-12-23 03:18:19',NULL,1),(7,'categories/subcategory_speakers.gif',1,0,'2003-12-23 03:18:19',NULL,1),(8,'categories/subcategory_keyboards.gif',1,0,'2003-12-23 03:18:19',NULL,1),(9,'categories/subcategory_mice.gif',1,0,'2003-12-23 03:18:19','2004-05-21 00:34:10',1),(10,'categories/subcategory_action.gif',3,0,'2003-12-23 03:18:19','2004-05-21 00:39:17',1),(11,'categories/subcategory_science_fiction.gif',3,0,'2003-12-23 03:18:19',NULL,1),(12,'categories/subcategory_comedy.gif',3,0,'2003-12-23 03:18:19',NULL,1),(13,'categories/subcategory_cartoons.gif',3,0,'2003-12-23 03:18:19','2004-05-21 00:23:13',1),(14,'categories/subcategory_thriller.gif',3,0,'2003-12-23 03:18:19',NULL,1),(15,'categories/subcategory_drama.gif',3,0,'2003-12-23 03:18:19',NULL,1),(16,'categories/subcategory_memory.gif',1,0,'2003-12-23 03:18:19',NULL,1),(17,'categories/subcategory_cdrom_drives.gif',1,0,'2003-12-23 03:18:19',NULL,1),(18,'categories/subcategory_simulation.gif',2,0,'2003-12-23 03:18:19',NULL,1),(19,'categories/subcategory_action_games.gif',2,0,'2003-12-23 03:18:19',NULL,1),(20,'categories/subcategory_strategy.gif',2,0,'2003-12-23 03:18:19',NULL,1),(21,'categories/gv_25.gif',0,4,'2003-12-23 03:18:19','2004-05-21 00:26:06',1),(22,'categories/box_of_color.gif',0,5,'2003-12-23 03:18:19','2004-05-21 00:28:43',1),(23,'waybkgnd.gif',0,500,'2003-12-28 02:26:19','2003-12-29 23:21:35',1),(24,'categories/category_free.gif',0,600,'2003-12-28 11:48:46','2004-01-02 19:13:45',1),(25,'sample_image.gif',0,515,'2003-12-31 02:39:17','2004-01-24 01:49:12',1),(27,'sample_image.gif',49,10,'2004-01-04 14:13:08','2004-01-24 16:16:23',1),(28,'sample_image.gif',0,510,'2004-01-04 17:13:47','2004-01-05 23:54:23',1),(31,'sample_image.gif',48,30,'2004-01-04 23:16:46','2004-01-24 01:48:29',1),(32,'sample_image.gif',48,40,'2004-01-05 01:34:56','2004-01-24 01:48:36',1),(33,'categories/subcategory.gif',0,700,'2004-01-05 02:08:31','2004-05-20 10:35:31',1),(34,'categories/subcategory.gif',33,10,'2004-01-05 02:08:50','2004-05-20 10:35:57',1),(35,'categories/subcategory.gif',33,20,'2004-01-05 02:09:01','2004-01-24 00:07:33',1),(36,'categories/subcategory.gif',33,30,'2004-01-05 02:09:12','2004-01-24 00:07:41',1),(37,'categories/subcategory.gif',35,10,'2004-01-05 02:09:28','2004-01-24 00:22:39',1),(38,'categories/subcategory.gif',35,20,'2004-01-05 02:09:39','2004-01-24 00:22:46',1),(39,'categories/subcategory.gif',35,30,'2004-01-05 02:09:49','2004-01-24 00:22:53',1),(40,'categories/subcategory.gif',34,10,'2004-01-05 02:17:27','2004-05-20 10:36:19',1),(41,'categories/subcategory.gif',36,10,'2004-01-05 02:21:02','2004-01-24 00:23:04',1),(42,'categories/subcategory.gif',36,30,'2004-01-05 02:21:14','2004-01-24 00:23:18',1),(43,'categories/subcategory.gif',34,20,'2004-01-05 02:21:29','2004-01-24 00:21:37',1),(44,'categories/subcategory.gif',36,20,'2004-01-05 02:21:47','2004-01-24 00:23:11',1),(45,'sample_image.gif',48,10,'2004-01-05 23:54:56','2004-01-24 01:48:22',1),(46,'sample_image.gif',50,10,'2004-01-06 00:01:48','2004-01-24 01:39:56',1),(47,'sample_image.gif',48,20,'2004-01-06 03:09:57','2004-01-24 01:48:05',1),(48,'sample_image.gif',0,1000,'2004-01-07 02:24:07','2004-01-07 02:44:26',1),(49,'sample_image.gif',0,1100,'2004-01-07 02:27:31','2004-01-07 02:44:34',1),(50,'sample_image.gif',0,1200,'2004-01-07 02:28:18','2004-01-07 02:47:19',1),(51,'sample_image.gif',50,20,'2004-01-07 02:33:55','2004-01-24 01:40:05',1),(52,'sample_image.gif',49,20,'2004-01-24 16:09:35','2004-01-24 16:16:33',1),(53,'categories/subcategory.gif',0,1500,'2004-04-25 23:07:41',NULL,1),(54,'categories/subcategory.gif',0,1510,'2004-04-26 12:02:35','2004-05-20 11:45:20',1),(55,'categories/subcategory.gif',54,0,'2004-04-28 01:48:47','2004-05-20 11:45:51',1),(56,'categories/subcategory.gif',54,0,'2004-04-28 01:49:16','2004-04-28 01:53:14',1),(57,'categories/subcategory.gif',54,0,'2004-05-01 01:29:13',NULL,1),(58,'categories/subcategory.gif',54,110,'2004-05-02 12:35:02','2004-05-18 10:46:13',1),(60,'categories/subcategory.gif',54,0,'2004-05-02 23:45:21',NULL,1),(61,'categories/subcategory.gif',54,100,'2004-05-18 10:13:46','2004-05-18 10:46:02',1),(62,'sample_image.gif',0,1520,'2003-12-23 03:18:19','2004-05-22 21:14:57',1),(63,'categories/subcategory.gif',0,1530,'2003-12-23 03:18:19','2004-07-12 17:45:24',1),(64,'categories/subcategory.gif',0,1550,'2004-07-12 15:22:27',NULL,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_description`
--

LOCK TABLES `categories_description` WRITE;
/*!40000 ALTER TABLE `categories_description` DISABLE KEYS */;
INSERT INTO `categories_description` VALUES (1,1,'Hardware','We offer a variety of Hardware from printers to graphics cards and mice to keyboards.'),(2,1,'Software','Select from an exciting list of software titles. <br /><br />Not seeing a title that you are looking for?'),(3,1,'DVD Movies','We offer a variety of DVD movies enjoyable for the whole family.<br /><br />Please browse the various categories to find your favorite movie today!'),(4,1,'Graphics Cards',''),(5,1,'Printers',''),(6,1,'Monitors',''),(7,1,'Speakers',''),(8,1,'Keyboards',''),(9,1,'Mice','Pick the right mouse for your individual computer needs!<br /><br />Contact Us if you are looking for a particular mouse that we do not currently have in stock.'),(10,1,'Action','<p>Get into the action with our Action collection of DVD movies!<br /><br />Don\'t miss the excitement and order your\'s today!<br /><br /></p>'),(11,1,'Science Fiction',''),(12,1,'Comedy',''),(13,1,'Cartoons','Something you can enjoy with children of all ages!'),(14,1,'Thriller',''),(15,1,'Drama',''),(16,1,'Memory',''),(17,1,'CDROM Drives',''),(18,1,'Simulation',''),(19,1,'Action',''),(20,1,'Strategy',''),(60,1,'Downloads',''),(58,1,'Real Sale',''),(21,1,'Gift Certificates','Send a Gift Certificate today!<br /><br />Gift Certificates are good for anything in the store.'),(57,1,'Text Pricing',''),(56,1,'Attributes',''),(22,1,'Big Linked','All of these products are &quot;Linked Products&quot;.<br /><br />This means that they appear in more than one Category.<br /><br />However, you only have to maintain the product in one place.<br /><br />The Master Product is used for pricing purposes.'),(55,1,'Discount Qty','<p>Discount Quantities can be set for Products or on the individual attributes.<br /><br />Discounts on the Product do NOT reflect on the attributes price.<br /><br />Only discounts based on Special and Sale Prices are applied to attribute prices.</p>'),(23,1,'Test Examples',''),(24,1,'Free Call Stuff',''),(25,1,'Test 10% by Attrib',''),(27,1,'$5.00 off',''),(28,1,'Test 10%',''),(31,1,'10% off Skip',''),(32,1,'10% off Price',''),(47,1,'10% off Attrib',''),(33,1,'A Top Level Cat','<p>This is a top level category description.</p>'),(34,1,'SubLevel 2 A','This is a sublevel category description.'),(35,1,'SubLevel 2 B',''),(36,1,'SubLevel 2 C',''),(37,1,'Sub Sub Cat 2B1',''),(38,1,'Sub Sub Cat 2B2',''),(39,1,'Sub Sub Cat 2B3',''),(40,1,'Sub Sub Cat 2A1','This is a sub-sub level category description.'),(41,1,'Sub Sub Cat 2C1',''),(42,1,'Sub Sub Cat 2C3',''),(43,1,'Sub Sub Cat 2A2',''),(44,1,'Sub Sub Cat 2C2',''),(45,1,'10% off',''),(46,1,'Set $100',''),(48,1,'Sale Percentage',''),(49,1,'Sale Deduction',''),(50,1,'Sale New Price',''),(51,1,'Set $100 Skip',''),(52,1,'$5.00 off Skip',''),(53,1,'Big Unlinked',''),(54,1,'New v1.2','<p>The New Products show many of the newest features that have been added to Zen Cart.<br /><br />Take the time to review these and the other Demo Products to better understand all the options and features that Zen Cart has to offer.</p>'),(61,1,'Real',''),(62,1,'Music',''),(63,1,'Documents','Documents can now be added to the category tree. For example you may want to add servicing/Technical documents. Or use Documents as an integrated FAQ system on your site. The implemetation here is fairly spartan, but could be expanded to offer PDF downloads, links to purchaseable download files. The possibilities are endless and left to your imagination.'),(64,1,'Mixed Product Types','This is a category with mixed product types.\r\n\r\nThis includes both products and documents. There are two types of documents - Documents that are for reading and Documents that are for reading and purchasing.');
/*!40000 ALTER TABLE `categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(180) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  `val_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=547 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Store Name','STORE_NAME','Pagantis Store','The name of my store',1,1,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(2,'Store Owner','STORE_OWNER','Pagantis','The name of my store owner',1,2,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(3,'Telephone - Customer Service','STORE_TELEPHONE_CUSTSERVICE','','Enter a telephone number for customers to reach your Customer Service department. This number may be sent as part of payment transaction details.',1,3,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(4,'Country','STORE_COUNTRY','195','The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>',1,6,NULL,'2020-04-03 08:32:39','zen_get_country_name','zen_cfg_pull_down_country_list(',NULL),(5,'Zone','STORE_ZONE','161','The zone my store is located in',1,7,NULL,'2020-04-03 08:32:39','zen_cfg_get_zone_name','zen_cfg_pull_down_zone_list(',NULL),(6,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'asc\', \'desc\'), ',NULL),(7,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), ',NULL),(8,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(9,'Language Selector','LANGUAGE_DEFAULT_SELECTOR','Default','Should the default language be based on the Store preferences, or the customer\'s browser settings?<br /><br />Default: Store\'s default settings',1,11,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'Default\', \'Browser\'), ',NULL),(10,'Use Search-Engine Safe URLs (still in development)','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',6,12,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(11,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(12,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'and\', \'or\'), ',NULL),(13,'Store Address and Phone','STORE_NAME_ADDRESS','Store Name\r\nAddress\r\nCountry\r\nPhone','This is the Store Name, Address and Phone used on printable documents and displayed online',1,7,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_textarea(',NULL),(14,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(15,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(16,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','Display prices with tax included (true) or add the tax at the end (false)',1,21,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(17,'Display Prices with Tax in Admin','DISPLAY_PRICE_WITH_TAX_ADMIN','false','Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)',1,21,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(18,'Basis of Product Tax','STORE_PRODUCT_TAX_BASIS','Shipping','On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',1,21,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(19,'Basis of Shipping Tax','STORE_SHIPPING_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module',1,21,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(20,'Sales Tax Display Status','STORE_TAX_DISPLAY_STATUS','0','Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On',1,21,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(21,'Show Split Tax Lines','SHOW_SPLIT_TAX_CHECKOUT','false','If multiple tax rates apply, show each rate as a separate line at checkout',1,22,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(22,'PA-DSS Admin Session Timeout Enforced?','PADSS_ADMIN_SESSION_TIMEOUT_ENFORCED','1','PA-DSS Compliance requires that any Admin login sessions expire after 15 minutes of inactivity. <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>',1,30,'2020-04-03 08:32:39','2020-04-03 08:32:39',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(23,'PA-DSS Strong Password Rules Enforced?','PADSS_PWD_EXPIRY_ENFORCED','1','PA-DSS Compliance requires that admin passwords must be changed after 90 days and cannot re-use the last 4 passwords. <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>',1,30,'2020-04-03 08:32:39','2020-04-03 08:32:39',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(24,'PA-DSS Ajax Checkout?','PADSS_AJAX_CHECKOUT','1','PA-DSS Compliance requires that for some inbuilt payment methods, that we use ajax to draw the checkout confirmation screen. While this will only happen if one of those payment methods is actually present, some people may want the traditional checkout flow <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>',1,30,'2020-04-03 08:32:39','2020-04-03 08:32:39',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(25,'Admin Session Time Out in Seconds','SESSION_TIMEOUT_ADMIN','900','Enter the time in seconds.<br />Max allowed is 900 for PCI Compliance Reasons.<br /> Default=900<br />Example: 900= 15 min <br /><br />Note: Too few seconds can result in timeout issues when adding/editing products',1,40,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(26,'Admin Set max_execution_time for processes','GLOBAL_SET_TIME_LIMIT','60','Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process',1,42,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(27,'Show if version update available','SHOW_VERSION_UPDATE_IN_HEADER','true','Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)',1,44,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(28,'Store Status','STORE_STATUS','0','What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices',1,25,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(29,'Server Uptime','DISPLAY_SERVER_UPTIME','true','Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don\'t display)',1,46,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(30,'Missing Page Check','MISSING_PAGE_CHECK','Page Not Found','Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to \'index\'<br />Off = Don\'t check for missing pages<br />Page Not Found = display the Page-Not-Found page',1,48,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),',NULL),(31,'cURL Proxy Status','CURL_PROXY_REQUIRED','False','Does your host require that you use a proxy for cURL communication?',6,50,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(32,'cURL Proxy Address','CURL_PROXY_SERVER_DETAILS','','If you have a hosting service that requires use of a proxy to talk to external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: 127.0.0.1:3128',6,51,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(33,'HTML Editor','HTML_EDITOR_PREFERENCE','NONE','Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions',1,110,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_pull_down_htmleditors(',NULL),(34,'Show Category Counts - Admin','SHOW_COUNTS_ADMIN','true','Show Category Counts in Admin?',1,19,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(35,'Show linked status for categories','SHOW_CATEGORY_PRODUCTS_LINKED_STATUS','true','Show Category products linked status?',1,19,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(36,'Currency Conversion Ratio','CURRENCY_UPLIFT_RATIO','1.05','When auto-updating currencies, what \"uplift\" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.',1,55,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(37,'Currency Exchange Rate: Primary Source','CURRENCY_SERVER_PRIMARY','ecb','Where to request external currency updates from (Primary source)<br><br>Additional sources can be installed via plugins.',1,55,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_pull_down_exchange_rate_sources(',NULL),(38,'Currency Exchange Rate: Secondary Source','CURRENCY_SERVER_BACKUP','boc','Where to request external currency updates from (Secondary source)<br><br>Additional sources can be installed via plugins.',1,55,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_pull_down_exchange_rate_sources(',NULL),(39,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(40,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(41,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(42,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(43,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(44,'Company','ENTRY_COMPANY_MIN_LENGTH','0','Minimum length of company name',2,6,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(45,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(46,'City','ENTRY_CITY_MIN_LENGTH','2','Minimum length of city',2,8,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(47,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(48,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone number',2,10,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(49,'Password','ENTRY_PASSWORD_MIN_LENGTH','7','Minimum length of password',2,11,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(50,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(51,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(52,'Credit Card CVV Number','CC_CVV_MIN_LENGTH','3','Minimum length of credit card CVV number',2,13,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(53,'Product Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of product review text',2,14,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(54,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(55,'Also Purchased Products','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(56,'Nick Name','ENTRY_NICK_MIN_LENGTH','3','Minimum length of Nick Name',2,1,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(57,'Admin Usernames','ADMIN_NAME_MINIMUM_LENGTH','4','Minimum length of admin usernames (must be 4 or more)',2,18,NULL,'2020-04-03 08:32:39',NULL,NULL,'{\"error\":\"TEXT_MIN_ADMIN_USER_LENGTH\",\"id\":\"FILTER_VALIDATE_INT\",\"options\":{\"options\":{\"min_range\":4}}}'),(58,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(59,'Admin Search Results Per Page','MAX_DISPLAY_SEARCH_RESULTS','20','Number of products to list on an Admin search result page',3,2,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(60,'Prev/Next Navigation Page Links (Desktop)','MAX_DISPLAY_PAGE_LINKS','5','Number of numbered pagination links to display.',3,3,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(61,'Prev/Next Navigation Page Links (Mobile)','MAX_DISPLAY_PAGE_LINKS_MOBILE','3','Number of numbered pagination links to display on Mobile devices (assuming your template supports mobile-specific settings)',3,3,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(62,'Products on Special ','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Number of products on special to display',3,4,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(63,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Number of new products to display in a category',3,5,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(64,'Upcoming Products ','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Number of \'upcoming\' products to display',3,6,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(65,'Manufacturers List - Scroll Box Size/Style','MAX_MANUFACTURERS_LIST','3','Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(66,'Manufacturers List - Verify Product Exist','PRODUCTS_MANUFACTURERS_STATUS','1','Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on',3,7,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(67,'Music Genre List - Scroll Box Size/Style','MAX_MUSIC_GENRES_LIST','3','Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(68,'Record Company List - Scroll Box Size/Style','MAX_RECORD_COMPANY_LIST','3','Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(69,'Length of Record Company Name','MAX_DISPLAY_RECORD_COMPANY_NAME_LEN','15','Used in record companies box; maximum length of record company name to display. Longer names will be truncated.',3,8,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(70,'Length of Music Genre Name','MAX_DISPLAY_MUSIC_GENRES_NAME_LEN','15','Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.',3,8,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(71,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.',3,8,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(72,'New Product Reviews Per Page','MAX_DISPLAY_NEW_REVIEWS','6','Number of new reviews to display on each page',3,9,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(73,'Random Product Reviews for SideBox','MAX_RANDOM_SELECT_REVIEWS','1','Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,10,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(74,'Random New Products for SideBox','MAX_RANDOM_SELECT_NEW','3','Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,11,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(75,'Random Products On Special for SideBox','MAX_RANDOM_SELECT_SPECIALS','2','Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,12,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(76,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(77,'New Products Listing- Number Per Page','MAX_DISPLAY_PRODUCTS_NEW','10','Number of new products listed per page',3,14,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(78,'Best Sellers For Box','MAX_DISPLAY_BESTSELLERS','10','Number of best sellers to display in box',3,15,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(79,'Also Purchased Products','MAX_DISPLAY_ALSO_PURCHASED','6','Number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(80,'Recent Purchases Box- NOTE: box is disabled ','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Number of products to display in the recent purchases box',3,17,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(81,'Customer Order History List Per Page','MAX_DISPLAY_ORDER_HISTORY','10','Number of orders to display in the order history list in \'My Account\'',3,18,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(82,'Maximum Display of Customers on Customers Page','MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER','20','',3,19,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(83,'Maximum Display of Orders on Orders Page','MAX_DISPLAY_SEARCH_RESULTS_ORDERS','20','',3,20,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(84,'Maximum Display of Products on Reports','MAX_DISPLAY_SEARCH_RESULTS_REPORTS','20','',3,21,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(85,'Maximum Categories Products Display List','MAX_DISPLAY_RESULTS_CATEGORIES','10','Number of products to list per screen',3,22,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(86,'Products Listing- Number Per Page','MAX_DISPLAY_PRODUCTS_LISTING','10','Maximum Number of Products to list per page on main page',3,30,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(87,'Products Attributes - Option Names and Values Display','MAX_ROW_LISTS_OPTIONS','10','Maximum number of option names and values to display in the products attributes page',3,24,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(88,'Products Attributes - Attributes Controller Display','MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER','30','Maximum number of attributes to display in the Attributes Controller page',3,25,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(89,'Products Attributes - Downloads Manager Display','MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER','30','Maximum number of attributes downloads to display in the Downloads Manager page',3,26,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(90,'Featured Products - Number to Display Admin','MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN','10','Number of featured products to list per screen - Admin',3,27,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(91,'Maximum Display of Featured Products - Main Page','MAX_DISPLAY_SEARCH_RESULTS_FEATURED','9','Number of featured products to list on main page',3,28,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(92,'Maximum Display of Featured Products Page','MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS','10','Number of featured products to list per screen',3,29,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(93,'Random Featured Products for SideBox','MAX_RANDOM_SELECT_FEATURED_PRODUCTS','2','Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,30,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(94,'Maximum Display of Specials Products - Main Page','MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX','9','Number of special products to list on main page',3,31,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(95,'New Product Listing - Limited to ...','SHOW_NEW_PRODUCTS_LIMIT','0','Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days',3,40,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), ',NULL),(96,'Maximum Display of Products All Page','MAX_DISPLAY_PRODUCTS_ALL','10','Number of products to list per screen',3,45,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(97,'Maximum Display of Language Flags in Language Side Box','MAX_LANGUAGE_FLAGS_COLUMNS','3','Number of Language Flags per Row',3,50,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(98,'Maximum File Upload Size','MAX_FILE_UPLOAD_SIZE','2048000','What is the Maximum file size for uploads?<br />Default= 2048000',3,60,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(99,'Allowed Filename Extensions for uploading','UPLOAD_FILENAME_EXTENSIONS','jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip','List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: \"jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip\"',3,61,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_textarea(',NULL),(100,'Maximum Orders Detail Display on Admin Orders Listing','MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING','0','Maximum number of Order Details<br />0 = Unlimited',3,65,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(101,'Maximum PayPal IPN Display on Admin Listing','MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN','20','Maximum number of PayPal IPN Lisings in Admin<br />Default is 20',3,66,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(102,'Maximum Display Columns Products to Multiple Categories Manager','MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS','3','Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default',3,70,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(103,'Maximum Display EZ-Pages','MAX_DISPLAY_SEARCH_RESULTS_EZPAGE','20','Maximum Display EZ-Pages<br />20 = Default',3,71,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(104,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(105,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(106,'Heading Image Width - Admin','HEADING_IMAGE_WIDTH','57','The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin',4,3,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(107,'Heading Image Height - Admin','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin',4,4,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(108,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(109,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(110,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(111,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(112,'Image - Shopping Cart Status','IMAGE_SHOPPING_CART_STATUS','1','Show product image in the shopping cart?<br />0= off 1= on',4,9,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(113,'Image - Shopping Cart Width','IMAGE_SHOPPING_CART_WIDTH','50','Default = 50',4,10,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(114,'Image - Shopping Cart Height','IMAGE_SHOPPING_CART_HEIGHT','40','Default = 40',4,11,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(115,'Category Icon Image Width - Product Info Pages','CATEGORY_ICON_IMAGE_WIDTH','57','The pixel width of Category Icon heading images for Product Info Pages',4,13,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(116,'Category Icon Image Height - Product Info Pages','CATEGORY_ICON_IMAGE_HEIGHT','40','The pixel height of Category Icon heading images for Product Info Pages',4,14,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(117,'Top Subcategory Image Width','SUBCATEGORY_IMAGE_TOP_WIDTH','150','The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories',4,15,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(118,'Top Subcategory Image Height','SUBCATEGORY_IMAGE_TOP_HEIGHT','85','The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories',4,16,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(119,'Product Info - Image Width','MEDIUM_IMAGE_WIDTH','150','The pixel width of Product Info images',4,20,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(120,'Product Info - Image Height','MEDIUM_IMAGE_HEIGHT','120','The pixel height of Product Info images',4,21,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(121,'Product Info - Image Medium Suffix','IMAGE_SUFFIX_MEDIUM','_MED','Product Info Medium Image Suffix<br />Default = _MED',4,22,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(122,'Product Info - Image Large Suffix','IMAGE_SUFFIX_LARGE','_LRG','Product Info Large Image Suffix<br />Default = _LRG',4,23,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(123,'Product Info - Number of Additional Images per Row','IMAGES_AUTO_ADDED','3','Product Info - Enter the number of additional images to display per row<br />Default = 3',4,30,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(124,'Image - Product Listing Width','IMAGE_PRODUCT_LISTING_WIDTH','100','Default = 100',4,40,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(125,'Image - Product Listing Height','IMAGE_PRODUCT_LISTING_HEIGHT','80','Default = 80',4,41,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(126,'Image - Product New Listing Width','IMAGE_PRODUCT_NEW_LISTING_WIDTH','100','Default = 100',4,42,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(127,'Image - Product New Listing Height','IMAGE_PRODUCT_NEW_LISTING_HEIGHT','80','Default = 80',4,43,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(128,'Image - New Products Width','IMAGE_PRODUCT_NEW_WIDTH','100','Default = 100',4,44,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(129,'Image - New Products Height','IMAGE_PRODUCT_NEW_HEIGHT','80','Default = 80',4,45,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(130,'Image - Featured Products Width','IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH','100','Default = 100',4,46,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(131,'Image - Featured Products Height','IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT','80','Default = 80',4,47,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(132,'Image - Product All Listing Width','IMAGE_PRODUCT_ALL_LISTING_WIDTH','100','Default = 100',4,48,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(133,'Image - Product All Listing Height','IMAGE_PRODUCT_ALL_LISTING_HEIGHT','80','Default = 80',4,49,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(134,'Product Image - No Image Status','PRODUCTS_IMAGE_NO_IMAGE_STATUS','1','Use automatic No Image when none is added to product<br />0= off<br />1= On',4,60,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(135,'Product Image - No Image picture','PRODUCTS_IMAGE_NO_IMAGE','no_picture.gif','Use automatic No Image when none is added to product<br />Default = no_picture.gif',4,61,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(136,'Image - Use Proportional Images on Products and Categories','PROPORTIONAL_IMAGES_STATUS','1','Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on',4,75,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(137,'Email Salutation','ACCOUNT_GENDER','false','Display salutation choice during account creation and with account information',5,1,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(138,'Date of Birth','ACCOUNT_DOB','false','Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require',5,2,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(139,'Company','ACCOUNT_COMPANY','true','Display company field during account creation and with account information',5,3,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(140,'Address Line 2','ACCOUNT_SUBURB','true','Display address line 2 field during account creation and with account information',5,4,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(141,'State','ACCOUNT_STATE','true','Display state field during account creation and with account information',5,5,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(142,'State - Always display as pulldown?','ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN','false','When state field is displayed, should it always be a pulldown menu?',5,5,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(143,'Create Account Default Country ID','SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY','223','Set Create Account Default Country ID to:<br />Default is 223',5,6,NULL,'2020-04-03 08:32:39','zen_get_country_name','zen_cfg_pull_down_country_list_none(',NULL),(144,'Fax Number','ACCOUNT_FAX_NUMBER','true','Display fax number field during account creation and with account information',5,10,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(145,'Show Newsletter Checkbox','ACCOUNT_NEWSLETTER_STATUS','1','Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>',5,45,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(146,'Customer Default Email Preference','ACCOUNT_EMAIL_PREFERENCE','0','Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />',5,46,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(147,'Customer Product Notification Status','CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS','1','Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately',5,50,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(148,'Customer Shop Status - View Shop and Prices','CUSTOMERS_APPROVAL','0','Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.',5,55,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(149,'Customer Approval Status - Authorization Pending','CUSTOMERS_APPROVAL_AUTHORIZATION','0','Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders',5,65,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(150,'Customer Authorization: filename','CUSTOMERS_AUTHORIZATION_FILENAME','customers_authorization','Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization',5,66,NULL,'2020-04-03 08:32:39',NULL,'',NULL),(151,'Customer Authorization: Hide Header','CUSTOMERS_AUTHORIZATION_HEADER_OFF','false','Customer Authorization: Hide Header <br />(true=hide false=show)',5,67,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(152,'Customer Authorization: Hide Column Left','CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF','false','Customer Authorization: Hide Column Left <br />(true=hide false=show)',5,68,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(153,'Customer Authorization: Hide Column Right','CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF','false','Customer Authorization: Hide Column Right <br />(true=hide false=show)',5,69,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(154,'Customer Authorization: Hide Footer','CUSTOMERS_AUTHORIZATION_FOOTER_OFF','false','Customer Authorization: Hide Footer <br />(true=hide false=show)',5,70,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(155,'Customer Authorization: Hide Prices','CUSTOMERS_AUTHORIZATION_PRICES_OFF','false','Customer Authorization: Hide Prices <br />(true=hide false=show)',5,71,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(156,'Customers Referral Status','CUSTOMERS_REFERRAL_STATUS','0','Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer',5,80,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(157,'Installed Modules','MODULE_PAYMENT_INSTALLED','freecharger.php;moneyorder.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: freecharger.php;cod.php;paypal.php)',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(158,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(159,'Installed Modules','MODULE_SHIPPING_INSTALLED','flat.php;freeshipper.php;item.php;storepickup.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(160,'Enable Free Shipping','MODULE_SHIPPING_FREESHIPPER_STATUS','True','Do you want to offer Free shipping?',6,0,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(161,'Pickup Locations','MODULE_SHIPPING_STOREPICKUP_LOCATIONS_LIST','Walk In','Enter a list of locations, separated by semicolons (;).<br>Optionally you may specify a fee/surcharge for each location by adding a comma and an amount. If no amount is specified, then the generic Shipping Cost amount from the next setting will be applied.<br><br>Examples:<br>121 Main Street;20 Church Street<br>Sunnyside,4.00;Lee Park,5.00;High Street,0.00<br>Dallas;Tulsa,5.00;Phoenix,0.00<br>For multilanguage use, see the define-statement in the language file for this module.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(162,'Free Shipping Cost','MODULE_SHIPPING_FREESHIPPER_COST','0.00','What is the Shipping cost?',6,6,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(163,'Handling Fee','MODULE_SHIPPING_FREESHIPPER_HANDLING','0','Handling fee for this shipping method.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(164,'Tax Class','MODULE_SHIPPING_FREESHIPPER_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2020-04-03 08:32:39','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(165,'Shipping Zone','MODULE_SHIPPING_FREESHIPPER_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2020-04-03 08:32:39','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(166,'Sort Order','MODULE_SHIPPING_FREESHIPPER_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(167,'Enable Store Pickup Shipping','MODULE_SHIPPING_STOREPICKUP_STATUS','True','Do you want to offer In Store rate shipping?',6,0,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(168,'Shipping Cost','MODULE_SHIPPING_STOREPICKUP_COST','0.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(169,'Tax Class','MODULE_SHIPPING_STOREPICKUP_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2020-04-03 08:32:39','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(170,'Tax Basis','MODULE_SHIPPING_STOREPICKUP_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',6,0,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\'), ',NULL),(171,'Shipping Zone','MODULE_SHIPPING_STOREPICKUP_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2020-04-03 08:32:39','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(172,'Sort Order','MODULE_SHIPPING_STOREPICKUP_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(173,'Enable Item Shipping','MODULE_SHIPPING_ITEM_STATUS','True','Do you want to offer per item rate shipping?',6,0,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(174,'Shipping Cost','MODULE_SHIPPING_ITEM_COST','2.50','The shipping cost will be multiplied by the number of items in an order that uses this shipping method.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(175,'Handling Fee','MODULE_SHIPPING_ITEM_HANDLING','0','Handling fee for this shipping method.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(176,'Tax Class','MODULE_SHIPPING_ITEM_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2020-04-03 08:32:39','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(177,'Tax Basis','MODULE_SHIPPING_ITEM_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',6,0,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(178,'Shipping Zone','MODULE_SHIPPING_ITEM_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2020-04-03 08:32:39','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(179,'Sort Order','MODULE_SHIPPING_ITEM_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(180,'Enable Free Charge Module','MODULE_PAYMENT_FREECHARGER_STATUS','True','Do you want to accept Free Charge payments?',6,1,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(181,'Sort order of display.','MODULE_PAYMENT_FREECHARGER_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(182,'Payment Zone','MODULE_PAYMENT_FREECHARGER_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2020-04-03 08:32:39','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(183,'Set Order Status','MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID','2','Set the status of orders made with this payment module to this value',6,0,NULL,'2020-04-03 08:32:39','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(184,'Enable Check/Money Order Module','MODULE_PAYMENT_MONEYORDER_STATUS','True','Do you want to accept Check/Money Order payments?',6,1,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(185,'Make Payable to:','MODULE_PAYMENT_MONEYORDER_PAYTO','the Store Owner/Website Name','Who should payments be made payable to?',6,1,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(186,'Sort order of display.','MODULE_PAYMENT_MONEYORDER_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(187,'Payment Zone','MODULE_PAYMENT_MONEYORDER_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2020-04-03 08:32:39','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(188,'Set Order Status','MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2020-04-03 08:32:39','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(189,'Include Tax','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX','false','Include Tax value in amount before discount calculation?',6,6,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(190,'This module is installed','MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS','true','',6,1,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\'), ',NULL),(191,'Sort Order','MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER','290','Sort order of display.',6,2,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(192,'Include Shipping','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING','false','Include Shipping value in amount before discount calculation?',6,5,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(193,'Re-calculate Tax','MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX','Standard','Re-Calculate Tax',6,7,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), ',NULL),(194,'Tax Class','MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS','0','Use the following tax class when treating Group Discount as Credit Note.',6,0,NULL,'2020-04-03 08:32:39','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(195,'Enable Flat Shipping','MODULE_SHIPPING_FLAT_STATUS','True','Do you want to offer flat rate shipping?',6,0,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(196,'Shipping Cost','MODULE_SHIPPING_FLAT_COST','5.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(197,'Tax Class','MODULE_SHIPPING_FLAT_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2020-04-03 08:32:39','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(198,'Tax Basis','MODULE_SHIPPING_FLAT_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',6,0,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(199,'Shipping Zone','MODULE_SHIPPING_FLAT_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2020-04-03 08:32:39','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(200,'Sort Order','MODULE_SHIPPING_FLAT_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(201,'Default Currency','DEFAULT_CURRENCY','USD','Default Currency',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(202,'Default Language','DEFAULT_LANGUAGE','en','Default Language',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(203,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(204,'Admin configuration_key shows','ADMIN_CONFIGURATION_KEY_ON','0','Manually switch to value of 1 to see the configuration_key name in configuration displays',6,0,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(205,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','195','Select the country of origin to be used in shipping quotes.',7,1,NULL,'2020-04-03 08:32:39','zen_get_country_name','zen_cfg_pull_down_country_list(',NULL),(206,'Postal Code','SHIPPING_ORIGIN_ZIP','NONE','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.',7,2,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(207,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(208,'Package Tare Small to Medium - added percentage:weight','SHIPPING_BOX_WEIGHT','0:3','What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0',7,4,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(209,'Larger packages - added packaging percentage:weight','SHIPPING_BOX_PADDING','10:0','What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0',7,5,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(210,'Display Number of Boxes and Weight Status','SHIPPING_BOX_WEIGHT_DISPLAY','3','Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight',7,15,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(211,'Shipping Estimator Display Settings for Shopping Cart','SHOW_SHIPPING_ESTIMATOR_BUTTON','1','<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page',7,20,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(212,'Display Order Comments on Admin Invoice','ORDER_COMMENTS_INVOICE','1','Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order',7,25,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(213,'Display Order Comments on Admin Packing Slip','ORDER_COMMENTS_PACKING_SLIP','1','Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order',7,26,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(214,'Order Free Shipping 0 Weight Status','ORDER_WEIGHT_ZERO_STATUS','0','If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.',7,15,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(215,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(216,'Display Product Manufacturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(217,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(218,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(219,'Display Product Price/Add to Cart','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price/Add to Cart',8,5,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(220,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(221,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(222,'Display Product Price/Add to Cart Column Width','PRODUCTS_LIST_PRICE_WIDTH','125','Define the width of the Price/Add to Cart column<br />Default= 125',8,8,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(223,'Display Category/Manufacturer Filter (0=off; 1=on)','PRODUCT_LIST_FILTER','1','Do you want to display the Category/Manufacturer Filter?',8,9,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(224,'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','3','Sets the location of the Prev/Next Split Page Navigation',8,10,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ',NULL),(225,'Display Product Listing Default Sort Order','PRODUCT_LISTING_DEFAULT_SORT_ORDER','','Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a',8,15,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(226,'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)','PRODUCT_LIST_PRICE_BUY_NOW','1','Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product',8,20,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(227,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',8,25,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(228,'Display Product Description','PRODUCT_LIST_DESCRIPTION','150','Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',8,30,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(229,'Product Listing Ascending Sort Order','PRODUCT_LIST_SORT_ORDER_ASCENDING','+','What do you want to use to indicate Sort Order Ascending?<br />Default = +',8,40,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_textarea_small(',NULL),(230,'Product Listing Descending Sort Order','PRODUCT_LIST_SORT_ORDER_DESCENDING','-','What do you want to use to indicate Sort Order Descending?<br />Default = -',8,41,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_textarea_small(',NULL),(231,'Include Product Listing Alpha Sorter Dropdown','PRODUCT_LIST_ALPHA_SORTER','true','Do you want to include an Alpha Filter dropdown on the Product Listing?',8,50,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(232,'Include Product Listing Sub Categories Image','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS','true','Do you want to include the Sub Categories Image on the Product Listing?',8,52,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(233,'Include Product Listing Top Categories Image','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP','true','Do you want to include the Top Categories Image on the Product Listing?',8,53,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(234,'Show SubCategories on Main Page while navigating','PRODUCT_LIST_CATEGORY_ROW_STATUS','1','Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on',8,60,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(235,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(236,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(237,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(238,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(239,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2020-04-03 08:32:39',NULL,NULL,NULL),(240,'Products status in Catalog when out of stock should be set to','SHOW_PRODUCTS_SOLD_OUT','0','Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON',9,10,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(241,'Show Sold Out Image in place of Add to Cart','SHOW_PRODUCTS_SOLD_OUT_IMAGE','1','Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on',9,11,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(242,'Product Quantity Decimals','QUANTITY_DECIMALS','0','Allow how many decimals on Quantity<br /><br />0= off',9,15,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(243,'Show Shopping Cart - Delete Checkboxes or Delete Button','SHOW_SHOPPING_CART_DELETE','3','Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox',9,20,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ',NULL),(244,'Show Shopping Cart - Update Cart Button Location','SHOW_SHOPPING_CART_UPDATE','3','Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products',9,22,NULL,'2020-04-03 08:32:39',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ',NULL),(245,'Show New Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS','1','Show New Products on empty Shopping Cart Page<br />0= off or set the sort order',9,30,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(246,'Show Featured Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS','2','Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order',9,31,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(247,'Show Special Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS','3','Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order',9,32,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(248,'Show Upcoming Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_UPCOMING','4','Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order',9,33,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(249,'Show Notice of Combining Shopping Cart on Login','SHOW_SHOPPING_CART_COMBINED','1','When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart',9,35,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(250,'Log Page Parse Time','STORE_PAGE_PARSE_TIME','false','Record (to a log file) the time it takes to parse a page',10,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(251,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/www/logs/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(252,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(253,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','false','Display the page parse time on the bottom of each page<br />(Note: This DISPLAYS them. You do NOT need to LOG them to merely display them on your site.)',10,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(254,'Log Database Queries','STORE_DB_TRANSACTIONS','false','Record the database queries to files in the system /logs/ folder. USE WITH CAUTION. This can seriously degrade your site performance and blow out your disk space storage quotas.<br><strong>Enabling this makes your site NON-COMPLIANT with PCI DSS rules, thus invalidating any certification.</strong>',10,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(255,'E-Mail Transport Method','EMAIL_TRANSPORT','PHP','Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>\"sendmail-f\"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.',12,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),',NULL),(256,'SMTP Email Account Mailbox','EMAIL_SMTPAUTH_MAILBOX','YourEmailAccountNameHere','Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.',12,101,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(257,'SMTP Email Account Password','EMAIL_SMTPAUTH_PASSWORD','YourPasswordHere','Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.',12,101,NULL,'2020-04-03 08:32:40','zen_cfg_password_display',NULL,NULL),(258,'SMTP Email Mail Host','EMAIL_SMTPAUTH_MAIL_SERVER','mail.EnterYourDomain.com','Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.',12,101,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(259,'SMTP Email Mail Server Port','EMAIL_SMTPAUTH_MAIL_SERVER_PORT','25','Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.<br><br>Default: 25<br>Typical values are:<br>25 - normal unencrypted SMTP<br>587 - encrypted SMTP<br>465 - older MS SMTP port',12,101,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(260,'Send E-Mails','SEND_EMAILS','true','Send out e-mails?<br>Normally this is set to true.<br>Set to false to suppress ALL outgoing email messages from this store, such as when working with a test copy of your store offline.',12,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(261,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'LF\', \'CRLF\'),',NULL),(262,'Enable HTML Emails?','EMAIL_USE_HTML','false','Send emails in HTML format if recipient has enabled it in their preferences.',12,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(263,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',6,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(264,'Email Archiving Active?','EMAIL_ARCHIVE','false','If you wish to have email messages archived/stored when sent, set this to \"true\".',12,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(265,'E-Mail Friendly-Errors','EMAIL_FRIENDLY_ERRORS','true','Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.',12,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(266,'Email Address (Displayed to Contact you)','STORE_OWNER_EMAIL_ADDRESS','pagantis@pagantis.com','Email address of Store Owner.  Used as \"display only\" when informing customers of how to contact you.',12,10,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(267,'Email Address (sent FROM)','EMAIL_FROM','pagantis@pagantis.com','Address from which email messages will be \"sent\" by default. Can be over-ridden at compose-time in admin modules.',12,11,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(268,'Emails must send from known domain?','EMAIL_SEND_MUST_BE_STORE','Yes','Does your mailserver require that all outgoing emails have their \"from\" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the \"from\" address on all outgoing mail.',12,11,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), ',NULL),(269,'Email Admin Format?','ADMIN_EXTRA_EMAIL_FORMAT','TEXT','Please select the Admin extra email format (Note: Enable HTML Emails must be on for HTML option to work)',12,12,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), ',NULL),(270,'Send Copy of Order Confirmation Emails To','SEND_EXTRA_ORDER_EMAILS_TO','pagantis@pagantis.com','Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,12,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(271,'Send Copy of Create Account Emails To - Status','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS','0','Send copy of Create Account Status<br />0= off 1= on',12,13,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(272,'Send Copy of Create Account Emails To','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO','pagantis@pagantis.com','Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,14,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(273,'Send Copy of Customer GV Send Emails To - Status','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS','0','Send copy of Customer GV Send Status<br />0= off 1= on',12,17,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(274,'Send Copy of Customer GV Send Emails To','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO','pagantis@pagantis.com','Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,18,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(275,'Send Copy of Admin GV Mail Emails To - Status','SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin GV Mail Status<br />0= off 1= on',12,19,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(276,'Send Copy of Customer Admin GV Mail Emails To','SEND_EXTRA_GV_ADMIN_EMAILS_TO','pagantis@pagantis.com','Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,20,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(277,'Send Copy of Admin Discount Coupon Mail Emails To - Status','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on',12,21,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(278,'Send Copy of Customer Admin Discount Coupon Mail Emails To','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO','pagantis@pagantis.com','Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,22,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(279,'Send Copy of Admin Orders Status Emails To - Status','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin Orders Status Status<br />0= off 1= on',12,23,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(280,'Send Copy of Admin Orders Status Emails To','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO','pagantis@pagantis.com','Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,24,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(281,'Send Notice of Pending Reviews Emails To - Status','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS','0','Send copy of Pending Reviews Status<br />0= off 1= on',12,25,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(282,'Send Notice of Pending Reviews Emails To','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO','pagantis@pagantis.com','Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,26,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(283,'Set \"Contact Us\" Email Dropdown List','CONTACT_US_LIST','','On the \"Contact Us\" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,40,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_textarea(',NULL),(284,'Contact Us - Show Store Name and Address','CONTACT_US_STORE_NAME_ADDRESS','1','Include Store Name and Address<br />0= off 1= on',12,50,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(285,'Send Low Stock Emails','SEND_LOWSTOCK_EMAIL','0','When stock level is at or below low stock level send an email<br />0= off<br />1= on',12,60,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(286,'Send Low Stock Emails To','SEND_EXTRA_LOW_STOCK_EMAILS_TO','pagantis@pagantis.com','When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,61,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(287,'Display \"Newsletter Unsubscribe\" Link?','SHOW_NEWSLETTER_UNSUBSCRIBE_LINK','true','Show \"Newsletter Unsubscribe\" link in the \"Information\" side-box?',12,70,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(288,'Audience-Select Count Display','AUDIENCE_SELECT_DISPLAY_COUNTS','true','When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>',12,90,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(289,'Enable Downloads','DOWNLOAD_ENABLED','true','Enable the products download functions.',13,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(290,'Download by Redirect','DOWNLOAD_BY_REDIRECT','true','Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true',13,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(291,'Download by streaming','DOWNLOAD_IN_CHUNKS','false','If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.',13,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(292,'Download Expiration (Number of Days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2020-04-03 08:32:40',NULL,'',NULL),(293,'Number of Downloads Allowed - Per Product','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2020-04-03 08:32:40',NULL,'',NULL),(294,'Downloads Controller Update Status Value','DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE','4','What orders_status resets the Download days and Max Downloads - Default is 4',13,10,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(295,'Downloads Controller Order Status Value >= lower value','DOWNLOADS_CONTROLLER_ORDERS_STATUS','2','Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.',13,12,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(296,'Downloads Controller Order Status Value <= upper value','DOWNLOADS_CONTROLLER_ORDERS_STATUS_END','4','Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.',13,13,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(297,'Enable Price Factor','ATTRIBUTES_ENABLED_PRICE_FACTOR','true','Enable the Attributes Price Factor.',13,25,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(298,'Enable Qty Price Discount','ATTRIBUTES_ENABLED_QTY_PRICES','true','Enable the Attributes Quantity Price Discounts.',13,26,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(299,'Enable Attribute Images','ATTRIBUTES_ENABLED_IMAGES','true','Enable the Attributes Images.',13,28,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(300,'Enable Text Pricing by word or letter','ATTRIBUTES_ENABLED_TEXT_PRICES','true','Enable the Attributes Text Pricing by word or letter.',13,35,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(301,'Text Pricing - Spaces are Free','TEXT_SPACES_FREE','1','On Text pricing Spaces are Free<br /><br />0= off 1= on',13,36,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(302,'Read Only option type - Ignore for Add to Cart','PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED','1','When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON',13,37,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(303,'Enable GZip Compression','GZIP_LEVEL','0','0= off 1= on',14,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(304,'Session Directory','SESSION_WRITE_DIRECTORY','/tmp','This should point to the folder specified in your DIR_FS_SQL_CACHE setting in your configure.php files.',15,1,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(305,'Cookie Domain','SESSION_USE_FQDN','True','If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.',15,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(306,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(307,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(308,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(309,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(310,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(311,'Recreate Session','SESSION_RECREATE','True','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(312,'IP to Host Conversion Status','SESSION_IP_TO_HOST_ADDRESS','true','Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails',15,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(313,'Length of the redeem code','SECURITY_CODE_LENGTH','10','Enter the length of the redeem code<br />The longer the more secure',16,1,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(314,'Default Order Status For Zero Balance Orders','DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID','2','When an order\'s balance is zero, this order status will be assigned to it.',16,0,NULL,'2020-04-03 08:32:40','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(315,'New Signup Discount Coupon ID#','NEW_SIGNUP_DISCOUNT_COUPON','','Select the coupon<br />',16,75,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_coupon_id(',NULL),(316,'New Signup Gift Voucher Amount','NEW_SIGNUP_GIFT_VOUCHER_AMOUNT','','Leave blank for none<br />Or enter an amount ie. 10 for $10.00',16,76,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(317,'Maximum Discount Coupons Per Page','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS','20','Number of Discount Coupons to list per Page',16,81,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(318,'Maximum Discount Coupon Report Results Per Page','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS','20','Number of Discount Coupons to list on Reports Page',16,81,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(319,'Credit Card Enable Status - VISA','CC_ENABLED_VISA','1','Accept VISA 0= off 1= on',17,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(320,'Credit Card Enable Status - MasterCard','CC_ENABLED_MC','1','Accept MasterCard 0= off 1= on',17,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(321,'Credit Card Enable Status - AmericanExpress','CC_ENABLED_AMEX','0','Accept AmericanExpress 0= off 1= on',17,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(322,'Credit Card Enable Status - Diners Club','CC_ENABLED_DINERS_CLUB','0','Accept Diners Club 0= off 1= on',17,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(323,'Credit Card Enable Status - Discover Card','CC_ENABLED_DISCOVER','0','Accept Discover Card 0= off 1= on',17,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(324,'Credit Card Enable Status - JCB','CC_ENABLED_JCB','0','Accept JCB 0= off 1= on',17,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(325,'Credit Card Enable Status - AUSTRALIAN BANKCARD','CC_ENABLED_AUSTRALIAN_BANKCARD','0','Accept AUSTRALIAN BANKCARD 0= off 1= on',17,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(326,'Credit Card Enable Status - SOLO','CC_ENABLED_SOLO','0','Accept SOLO Card 0= off 1= on',17,8,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(327,'Credit Card Enable Status - Debit','CC_ENABLED_DEBIT','0','Accept Debit Cards 0= off 1= on<br>NOTE: This is not deeply integrated at this time, and this setting may be redundant if your payment modules do not yet specifically have code to honour this switch.',17,9,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(328,'Credit Card Enable Status - Maestro','CC_ENABLED_MAESTRO','0','Accept MAESTRO Card 0= off 1= on',17,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(329,'Credit Card Enabled - Show on Payment','SHOW_ACCEPTED_CREDIT_CARDS','0','Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.',17,50,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(330,'This module is installed','MODULE_ORDER_TOTAL_GV_STATUS','true','',6,1,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(331,'Sort Order','MODULE_ORDER_TOTAL_GV_SORT_ORDER','840','Sort order of display.',6,2,NULL,'2003-10-30 22:16:40',NULL,NULL,NULL),(332,'Queue Purchases','MODULE_ORDER_TOTAL_GV_QUEUE','true','Do you want to queue purchases of the Gift Voucher?',6,3,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(333,'Include Shipping','MODULE_ORDER_TOTAL_GV_INC_SHIPPING','true','Include Shipping in calculation',6,5,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(334,'Include Tax','MODULE_ORDER_TOTAL_GV_INC_TAX','true','Include Tax in calculation.',6,6,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(335,'Re-calculate Tax','MODULE_ORDER_TOTAL_GV_CALC_TAX','None','Re-Calculate Tax',6,7,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),',NULL),(336,'Tax Class','MODULE_ORDER_TOTAL_GV_TAX_CLASS','0','Use the following tax class when treating Gift Voucher as Credit Note.',6,0,NULL,'2003-10-30 22:16:40','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(337,'Credit including Tax','MODULE_ORDER_TOTAL_GV_CREDIT_TAX','false','Add tax to purchased Gift Voucher when crediting to Account',6,8,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(338,'Set Order Status','MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID','0','Set the status of orders made where GV covers full payment',6,0,NULL,'2020-04-03 08:32:40','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(339,'This module is installed','MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS','true','',6,1,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(340,'Sort Order','MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER','400','Sort order of display.',6,2,NULL,'2003-10-30 22:16:43',NULL,NULL,NULL),(341,'Allow Low Order Fee','MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE','false','Do you want to allow low order fees?',6,3,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(342,'Order Fee For Orders Under','MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER','50','Add the low order fee to orders under this amount.',6,4,NULL,'2003-10-30 22:16:43','currencies->format',NULL,NULL),(343,'Order Fee','MODULE_ORDER_TOTAL_LOWORDERFEE_FEE','5','For Percentage Calculation - include a % Example: 10%<br />For a flat amount just enter the amount - Example: 5 for $5.00',6,5,NULL,'2003-10-30 22:16:43','',NULL,NULL),(344,'Attach Low Order Fee On Orders Made','MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION','both','Attach low order fee for orders sent to the set destination.',6,6,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),',NULL),(345,'Tax Class','MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS','0','Use the following tax class on the low order fee.',6,7,NULL,'2003-10-30 22:16:43','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(346,'No Low Order Fee on Virtual Products','MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL','false','Do not charge Low Order Fee when cart is Virtual Products Only',6,8,NULL,'2004-04-20 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(347,'No Low Order Fee on Gift Vouchers','MODULE_ORDER_TOTAL_LOWORDERFEE_GV','false','Do not charge Low Order Fee when cart is Gift Vouchers Only',6,9,NULL,'2004-04-20 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(348,'This module is installed','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','',6,1,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(349,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','200','Sort order of display.',6,2,NULL,'2003-10-30 22:16:46',NULL,NULL,NULL),(350,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','Do you want to allow free shipping?',6,3,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(351,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','Provide free shipping for orders over the set amount.',6,4,NULL,'2003-10-30 22:16:46','currencies->format',NULL,NULL),(352,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),',NULL),(353,'This module is installed','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:49',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(354,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','100','Sort order of display.',6,2,NULL,'2003-10-30 22:16:49',NULL,NULL,NULL),(355,'This module is installed','MODULE_ORDER_TOTAL_TAX_STATUS','true','',6,1,NULL,'2003-10-30 22:16:52',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(356,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','300','Sort order of display.',6,2,NULL,'2003-10-30 22:16:52',NULL,NULL,NULL),(357,'This module is installed','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:55',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(358,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','999','Sort order of display.',6,2,NULL,'2003-10-30 22:16:55',NULL,NULL,NULL),(359,'Tax Class','MODULE_ORDER_TOTAL_COUPON_TAX_CLASS','0','Use the following tax class when treating Discount Coupon as Credit Note.',6,0,NULL,'2003-10-30 22:16:36','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(360,'Include Tax','MODULE_ORDER_TOTAL_COUPON_INC_TAX','false','Include Tax in calculation.',6,6,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(361,'Sort Order','MODULE_ORDER_TOTAL_COUPON_SORT_ORDER','280','Sort order of display.',6,2,NULL,'2003-10-30 22:16:36',NULL,NULL,NULL),(362,'Include Shipping','MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING','false','Include Shipping in calculation',6,5,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(363,'This module is installed','MODULE_ORDER_TOTAL_COUPON_STATUS','true','',6,1,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(364,'Re-calculate Tax','MODULE_ORDER_TOTAL_COUPON_CALC_TAX','Standard','Re-Calculate Tax',6,7,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),',NULL),(365,'Admin Demo Status','ADMIN_DEMO','0','Admin Demo should be on?<br />0= off 1= on',6,0,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(366,'Product option type Select','PRODUCTS_OPTIONS_TYPE_SELECT','0','The number representing the Select type of product option.',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(367,'Text product option type','PRODUCTS_OPTIONS_TYPE_TEXT','1','Numeric value of the text product option type',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(368,'Radio button product option type','PRODUCTS_OPTIONS_TYPE_RADIO','2','Numeric value of the radio button product option type',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(369,'Check box product option type','PRODUCTS_OPTIONS_TYPE_CHECKBOX','3','Numeric value of the check box product option type',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(370,'File product option type','PRODUCTS_OPTIONS_TYPE_FILE','4','Numeric value of the file product option type',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(371,'ID for text and file products options values','PRODUCTS_OPTIONS_VALUES_TEXT_ID','0','Numeric value of the products_options_values_id used by the text and file attributes.',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(372,'Upload prefix','UPLOAD_PREFIX','upload_','Prefix used to differentiate between upload options and other options',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(373,'Text prefix','TEXT_PREFIX','txt_','Prefix used to differentiate between text option values and other option values',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(374,'Read Only option type','PRODUCTS_OPTIONS_TYPE_READONLY','5','Numeric value of the file product option type',6,NULL,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,NULL,NULL),(375,'login mode https','SSLPWSTATUSCHECK','0:0','System setting. Do not edit.',6,99,'2020-04-03 08:33:02','2020-04-03 08:32:40',NULL,NULL,NULL),(376,'Products Info - Products Option Name Sort Order','PRODUCTS_OPTIONS_SORT_ORDER','0','Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name',18,35,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(377,'Products Info - Product Option Value of Attributes Sort Order','PRODUCTS_OPTIONS_SORT_BY_PRICE','1','Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name',18,36,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(378,'Product Info - Show Option Values Name Below Attributes Image','PRODUCT_IMAGES_ATTRIBUTES_NAMES','1','Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on',18,41,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(379,'Product Info - Show Sales Discount Savings Status','SHOW_SALE_DISCOUNT_STATUS','1','Product Info - Show the amount of discount savings?<br />0= off 1= on',18,45,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(380,'Product Info - Show Sales Discount Savings Dollars or Percentage','SHOW_SALE_DISCOUNT','1','Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off',18,46,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'1\', \'2\'), ',NULL),(381,'Product Info - Show Sales Discount Savings Percentage Decimals','SHOW_SALE_DISCOUNT_DECIMALS','0','Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0',18,47,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(382,'Product Info - Price is Free Image or Text Status','OTHER_IMAGE_PRICE_IS_FREE_ON','1','Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image',18,50,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(383,'Product Info - Price is Call for Price Image or Text Status','PRODUCTS_PRICE_IS_CALL_IMAGE_ON','1','Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image',18,51,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(384,'Product Quantity Box Status - Adding New Products','PRODUCTS_QTY_BOX_STATUS','1','What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1',18,55,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(385,'Product Reviews Require Approval','REVIEWS_APPROVAL','1','Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on',18,62,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(386,'Meta Tags - Include Product Model in Title','META_TAG_INCLUDE_MODEL','1','Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on',18,69,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(387,'Meta Tags - Include Product Price in Title','META_TAG_INCLUDE_PRICE','1','Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on',18,70,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(388,'Meta Tags Generated Description Maximum Length?','MAX_META_TAG_DESCRIPTION_LENGTH','50','Set Generated Meta Tag Description Maximum Length to (words) Default 50:',18,71,NULL,'2020-04-03 08:32:40','','',NULL),(389,'Also Purchased Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS','3','Also Purchased Products Columns per Row<br />0= off or set the sort order',18,72,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(390,'Previous Next - Navigation Bar Position','PRODUCT_INFO_PREVIOUS_NEXT','1','Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page',18,21,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Top of Page\'), array(\'id\'=>\'2\', \'text\'=>\'Bottom of Page\'), array(\'id\'=>\'3\', \'text\'=>\'Both Top & Bottom of Page\')),',NULL),(391,'Previous Next - Sort Order','PRODUCT_INFO_PREVIOUS_NEXT_SORT','1','Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order',18,22,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Product ID\'), array(\'id\'=>\'1\', \'text\'=>\'Name\'), array(\'id\'=>\'2\', \'text\'=>\'Product Model\'), array(\'id\'=>\'3\', \'text\'=>\'Product Price - Name\'), array(\'id\'=>\'4\', \'text\'=>\'Product Price - Model\'), array(\'id\'=>\'5\', \'text\'=>\'Product Name - Model\'), array(\'id\'=>\'6\', \'text\'=>\'Product Sort Order\')),',NULL),(392,'Previous Next - Button and Image Status','SHOW_PREVIOUS_NEXT_STATUS','0','Button and Product Image status settings are:<br />0= Off<br />1= On',18,20,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(393,'Previous Next - Button and Image Settings','SHOW_PREVIOUS_NEXT_IMAGES','0','Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only',18,21,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Button Only\'), array(\'id\'=>\'1\', \'text\'=>\'Button and Product Image\'), array(\'id\'=>\'2\', \'text\'=>\'Product Image Only\')),',NULL),(394,'Previous Next - Image Width?','PREVIOUS_NEXT_IMAGE_WIDTH','50','Previous/Next Image Width?',18,22,NULL,'2020-04-03 08:32:40','','',NULL),(395,'Previous Next - Image Height?','PREVIOUS_NEXT_IMAGE_HEIGHT','40','Previous/Next Image Height?',18,23,NULL,'2020-04-03 08:32:40','','',NULL),(396,'Previous Next - Navigation Includes Category Position','PRODUCT_INFO_CATEGORIES','1','Product\'s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right',18,20,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Align Left\'), array(\'id\'=>\'2\', \'text\'=>\'Align Center\'), array(\'id\'=>\'3\', \'text\'=>\'Align Right\')),',NULL),(397,'Previous Next - Navigation Includes Category Name and Image Status','PRODUCT_INFO_CATEGORIES_IMAGE_STATUS','2','Product\'s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank',18,20,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Category Name and Image Always\'), array(\'id\'=>\'1\', \'text\'=>\'Category Name only\'), array(\'id\'=>\'2\', \'text\'=>\'Category Name and Image when not blank\')),',NULL),(398,'Column Width - Left Boxes','BOX_WIDTH_LEFT','150px','Width of the Left Column Boxes<br />px may be included<br />Default = 150px',19,1,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(399,'Column Width - Right Boxes','BOX_WIDTH_RIGHT','150px','Width of the Right Column Boxes<br />px may be included<br />Default = 150px',19,2,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(400,'Bread Crumbs Navigation Separator','BREAD_CRUMBS_SEPARATOR','&nbsp;::&nbsp;','Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;',19,3,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(401,'Define Breadcrumb Status','DEFINE_BREADCRUMB_STATUS','1','Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only',19,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(402,'Bestsellers - Number Padding','BEST_SELLERS_FILLER','&nbsp;','What do you want to Pad the numbers with?<br />Default = &amp;nbsp;',19,5,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(403,'Bestsellers - Truncate Product Names','BEST_SELLERS_TRUNCATE','35','What size do you want to truncate the Product Names?<br />Default = 35',19,6,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(404,'Bestsellers - Truncate Product Names followed by ...','BEST_SELLERS_TRUNCATE_MORE','true','When truncated Product Names follow with ...<br />Default = true',19,7,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(405,'Categories Box - Show Specials Link','SHOW_CATEGORIES_BOX_SPECIALS','true','Show Specials Link in the Categories Box',19,8,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(406,'Categories Box - Show Products New Link','SHOW_CATEGORIES_BOX_PRODUCTS_NEW','true','Show Products New Link in the Categories Box',19,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(407,'Shopping Cart Box Status','SHOW_SHOPPING_CART_BOX_STATUS','1','Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart',19,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(408,'Categories Box - Show Featured Products Link','SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS','true','Show Featured Products Link in the Categories Box',19,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(409,'Categories Box - Show Products All Link','SHOW_CATEGORIES_BOX_PRODUCTS_ALL','true','Show Products All Link in the Categories Box',19,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(410,'Column Left Status - Global','COLUMN_LEFT_STATUS','1','Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override',19,15,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(411,'Column Right Status - Global','COLUMN_RIGHT_STATUS','1','Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override',19,16,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(412,'Column Width - Left','COLUMN_WIDTH_LEFT','150px','Width of the Left Column<br />px may be included<br />Default = 150px',19,20,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(413,'Column Width - Right','COLUMN_WIDTH_RIGHT','150px','Width of the Right Column<br />px may be included<br />Default = 150px',19,21,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(414,'Categories Separator between links Status','SHOW_CATEGORIES_SEPARATOR_LINK','1','Show Category Separator between Category Names and Links?<br />0= off<br />1= on',19,24,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(415,'Categories Separator between the Category Name and Count','CATEGORIES_SEPARATOR','-&gt;','What separator do you want between the Category name and the count?<br />Default = -&amp;gt;',19,25,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(416,'Categories Separator between the Category Name and Sub Categories','CATEGORIES_SEPARATOR_SUBS','|_&nbsp;','What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;',19,26,NULL,'2004-03-25 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(417,'Categories Count Prefix','CATEGORIES_COUNT_PREFIX','&nbsp;(','What do you want to Prefix the count with?<br />Default= (',19,27,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(418,'Categories Count Suffix','CATEGORIES_COUNT_SUFFIX',')','What do you want as a Suffix to the count?<br />Default= )',19,28,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(419,'Categories SubCategories Indent','CATEGORIES_SUBCATEGORIES_INDENT','&nbsp;&nbsp;','What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;',19,29,NULL,'2004-06-24 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(420,'Categories with 0 Products Status','CATEGORIES_COUNT_ZERO','0','Show Category Count for 0 Products?<br />0= off<br />1= on',19,30,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(421,'Split Categories Box','CATEGORIES_SPLIT_DISPLAY','True','Split the categories box display by product type',19,31,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(422,'Shopping Cart - Show Totals','SHOW_TOTALS_IN_CART','1','Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount',19,31,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(423,'Customer Greeting - Show on Index Page','SHOW_CUSTOMER_GREETING','1','Always Show Customer Greeting on Index?<br />0= off<br />1= on',19,40,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(424,'Categories - Always Show on Main Page','SHOW_CATEGORIES_ALWAYS','0','Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level',19,45,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(425,'Main Page - Opens with Category','CATEGORIES_START_MAIN','0','0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10',19,46,NULL,'2020-04-03 08:32:40','','',NULL),(426,'Categories - Always Open to Show SubCategories','SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS','1','Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected',19,47,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(427,'Banner Display Groups - Header Position 1','SHOW_BANNERS_GROUP_SET1','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none',19,55,NULL,'2020-04-03 08:32:40','','',NULL),(428,'Banner Display Groups - Header Position 2','SHOW_BANNERS_GROUP_SET2','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none',19,56,NULL,'2020-04-03 08:32:40','','',NULL),(429,'Banner Display Groups - Header Position 3','SHOW_BANNERS_GROUP_SET3','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none',19,57,NULL,'2020-04-03 08:32:40','','',NULL),(430,'Banner Display Groups - Footer Position 1','SHOW_BANNERS_GROUP_SET4','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none',19,65,NULL,'2020-04-03 08:32:40','','',NULL),(431,'Banner Display Groups - Footer Position 2','SHOW_BANNERS_GROUP_SET5','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none',19,66,NULL,'2020-04-03 08:32:40','','',NULL),(432,'Banner Display Groups - Footer Position 3','SHOW_BANNERS_GROUP_SET6','Wide-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none',19,67,NULL,'2020-04-03 08:32:40','','',NULL),(433,'Banner Display Groups - Side Box banner_box','SHOW_BANNERS_GROUP_SET7','SideBox-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none',19,70,NULL,'2020-04-03 08:32:40','','',NULL),(434,'Banner Display Groups - Side Box banner_box2','SHOW_BANNERS_GROUP_SET8','SideBox-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none',19,71,NULL,'2020-04-03 08:32:40','','',NULL),(435,'Banner Display Group - Side Box banner_box_all','SHOW_BANNERS_GROUP_SET_ALL','BannersAll','The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none',19,72,NULL,'2020-04-03 08:32:40','','',NULL),(436,'Footer - Show IP Address status','SHOW_FOOTER_IP','1','Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?',19,80,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(437,'Product Discount Quantities - Add how many blank discounts?','DISCOUNT_QTY_ADD','5','How many blank discount quantities should be added for Product Pricing?',19,90,NULL,'2020-04-03 08:32:40','','',NULL),(438,'Product Discount Quantities - Display how many per row?','DISCOUNT_QUANTITY_PRICES_COLUMN','5','How many discount quantities should show per row on Product Info Pages?',19,95,NULL,'2020-04-03 08:32:40','','',NULL),(439,'Categories/Products Display Sort Order','CATEGORIES_PRODUCTS_SORT_ORDER','0','Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name',19,100,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), ',NULL),(440,'Option Names and Values Global Add, Copy and Delete Features Status','OPTION_NAMES_VALUES_GLOBAL_STATUS','1','Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />(Default=1)',19,110,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(441,'Categories-Tabs Menu ON/OFF','CATEGORIES_TABS_STATUS','1','Categories-Tabs<br />This enables the display of your store\'s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs',19,112,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(442,'Site Map - include My Account Links?','SHOW_ACCOUNT_LINKS_ON_SITE_MAP','No','Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false',19,115,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'Yes\', \'No\'), ',NULL),(443,'Skip 1-prod Categories','SKIP_SINGLE_PRODUCT_CATEGORIES','True','Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True',19,120,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(444,'Use split-login page','USE_SPLIT_LOGIN_MODE','False','The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False',19,121,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(445,'CSS Buttons','IMAGE_USE_CSS_BUTTONS','Yes','CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.',19,147,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), ',NULL),(446,'<strong>Down for Maintenance: ON/OFF</strong>','DOWN_FOR_MAINTENANCE','false','Down for Maintenance <br />(true=on false=off)',20,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(447,'Down for Maintenance: filename','DOWN_FOR_MAINTENANCE_FILENAME','down_for_maintenance','Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance',20,2,NULL,'2020-04-03 08:32:40',NULL,'',NULL),(448,'Down for Maintenance: Hide Header','DOWN_FOR_MAINTENANCE_HEADER_OFF','false','Down for Maintenance: Hide Header <br />(true=hide false=show)',20,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(449,'Down for Maintenance: Hide Column Left','DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF','false','Down for Maintenance: Hide Column Left <br />(true=hide false=show)',20,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(450,'Down for Maintenance: Hide Column Right','DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF','false','Down for Maintenance: Hide Column Right <br />(true=hide false=show)',20,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(451,'Down for Maintenance: Hide Footer','DOWN_FOR_MAINTENANCE_FOOTER_OFF','false','Down for Maintenance: Hide Footer <br />(true=hide false=show)',20,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(452,'Down for Maintenance: Hide Prices','DOWN_FOR_MAINTENANCE_PRICES_OFF','false','Down for Maintenance: Hide Prices <br />(true=hide false=show)',20,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(453,'Down For Maintenance (exclude this IP-Address)','EXCLUDE_ADMIN_IP_FOR_MAINTENANCE','your IP (ADMIN)','This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.',20,8,'2003-03-21 13:43:22','2003-03-21 21:20:07',NULL,NULL,NULL),(454,'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF','WARN_BEFORE_DOWN_FOR_MAINTENANCE','false','Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the \'Down For Maintenance: ON/OFF\' to true this will automaticly be updated to false',20,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(455,'Date and hours for notice before maintenance','PERIOD_BEFORE_DOWN_FOR_MAINTENANCE','15/05/2003  2-3 PM','Date and hours for notice before maintenance website, enter date and hours for maintenance website',20,10,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL,NULL),(456,'Display when webmaster has enabled maintenance','DISPLAY_MAINTENANCE_TIME','false','Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />',20,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(457,'Display website maintenance period','DISPLAY_MAINTENANCE_PERIOD','false','Display Website maintenance period <br />(true=on false=off)<br />',20,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(458,'Website maintenance period','TEXT_MAINTENANCE_PERIOD_TIME','2h00','Enter Website Maintenance period (hh:mm)',20,13,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL,NULL),(459,'Confirm Terms and Conditions During Checkout Procedure','DISPLAY_CONDITIONS_ON_CHECKOUT','false','Show the Terms and Conditions during the checkout procedure which the customer must agree to.',11,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(460,'Confirm Privacy Notice During Account Creation Procedure','DISPLAY_PRIVACY_CONDITIONS','false','Show the Privacy Notice during the account creation procedure which the customer must agree to.',11,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(461,'Display Product Image','PRODUCT_NEW_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,1,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(462,'Display Product Quantity','PRODUCT_NEW_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,2,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(463,'Display Product Buy Now Button','PRODUCT_NEW_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,3,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(464,'Display Product Name','PRODUCT_NEW_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,4,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(465,'Display Product Model','PRODUCT_NEW_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,5,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(466,'Display Product Manufacturer Name','PRODUCT_NEW_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,6,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(467,'Display Product Price','PRODUCT_NEW_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,7,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(468,'Display Product Weight','PRODUCT_NEW_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,8,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(469,'Display Product Date Added','PRODUCT_NEW_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,9,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(470,'Display Product Description','PRODUCT_NEW_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',21,10,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(471,'Display Product Display - Default Sort Order','PRODUCT_NEW_LIST_SORT_DEFAULT','6','What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',21,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ',NULL),(472,'Default Products New Group ID','PRODUCT_NEW_LIST_GROUP_ID','21','Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?',21,12,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(473,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',21,25,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(474,'Mask Upcoming Products from being include as New Products','SHOW_NEW_PRODUCTS_UPCOMING_MASKED','0','Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on',21,30,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(475,'Display Product Image','PRODUCT_FEATURED_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,1,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(476,'Display Product Quantity','PRODUCT_FEATURED_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,2,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(477,'Display Product Buy Now Button','PRODUCT_FEATURED_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,3,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(478,'Display Product Name','PRODUCT_FEATURED_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,4,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(479,'Display Product Model','PRODUCT_FEATURED_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,5,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(480,'Display Product Manufacturer Name','PRODUCT_FEATURED_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,6,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(481,'Display Product Price','PRODUCT_FEATURED_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,7,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(482,'Display Product Weight','PRODUCT_FEATURED_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,8,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(483,'Display Product Date Added','PRODUCT_FEATURED_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,9,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(484,'Display Product Description','PRODUCT_FEATURED_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',22,10,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(485,'Display Product Display - Default Sort Order','PRODUCT_FEATURED_LIST_SORT_DEFAULT','1','What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',22,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ',NULL),(486,'Default Featured Products Group ID','PRODUCT_FEATURED_LIST_GROUP_ID','22','Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?',22,12,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(487,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',22,25,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(488,'Display Product Image','PRODUCT_ALL_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,1,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(489,'Display Product Quantity','PRODUCT_ALL_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,2,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(490,'Display Product Buy Now Button','PRODUCT_ALL_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,3,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(491,'Display Product Name','PRODUCT_ALL_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,4,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(492,'Display Product Model','PRODUCT_ALL_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,5,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(493,'Display Product Manufacturer Name','PRODUCT_ALL_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,6,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(494,'Display Product Price','PRODUCT_ALL_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,7,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(495,'Display Product Weight','PRODUCT_ALL_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,8,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(496,'Display Product Date Added','PRODUCT_ALL_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,9,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(497,'Display Product Description','PRODUCT_ALL_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',23,10,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(498,'Display Product Display - Default Sort Order','PRODUCT_ALL_LIST_SORT_DEFAULT','1','What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',23,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ',NULL),(499,'Default Products All Group ID','PRODUCT_ALL_LIST_GROUP_ID','23','Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?',23,12,NULL,'2020-04-03 08:32:40',NULL,NULL,NULL),(500,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',23,25,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(501,'Show New Products on Main Page','SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS','1','Show New Products on Main Page<br />0= off or set the sort order',24,65,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(502,'Show Featured Products on Main Page','SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS','2','Show Featured Products on Main Page<br />0= off or set the sort order',24,66,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(503,'Show Special Products on Main Page','SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS','3','Show Special Products on Main Page<br />0= off or set the sort order',24,67,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(504,'Show Upcoming Products on Main Page','SHOW_PRODUCT_INFO_MAIN_UPCOMING','4','Show Upcoming Products on Main Page<br />0= off or set the sort order',24,68,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(505,'Show New Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS','1','Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,70,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(506,'Show Featured Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS','2','Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,71,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(507,'Show Special Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS','3','Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,72,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(508,'Show Upcoming Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_UPCOMING','4','Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,73,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(509,'Show New Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS','1','Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,75,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(510,'Show Featured Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS','2','Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,76,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(511,'Show Special Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS','3','Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,77,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(512,'Show Upcoming Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_UPCOMING','4','Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,78,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(513,'Show New Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS','1','Show New Products below Product Listing<br />0= off or set the sort order',24,85,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(514,'Show Featured Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS','2','Show Featured Products below Product Listing<br />0= off or set the sort order',24,86,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(515,'Show Special Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS','3','Show Special Products below Product Listing<br />0= off or set the sort order',24,87,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(516,'Show Upcoming Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING','4','Show Upcoming Products below Product Listing<br />0= off or set the sort order',24,88,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(517,'New Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS','3','New Products Columns per Row',24,95,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(518,'Featured Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS','3','Featured Products Columns per Row',24,96,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(519,'Special Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS','3','Special Products Columns per Row',24,97,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(520,'Filter Product Listing for Current Top Level Category When Enabled','SHOW_PRODUCT_INFO_ALL_PRODUCTS','1','Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ',24,100,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(521,'Define Main Page Status','DEFINE_MAIN_PAGE_STATUS','1','Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,60,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(522,'Define Contact Us Status','DEFINE_CONTACT_US_STATUS','1','Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,61,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(523,'Define Privacy Status','DEFINE_PRIVACY_STATUS','1','Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,62,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(524,'Define Shipping & Returns','DEFINE_SHIPPINGINFO_STATUS','1','Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,63,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(525,'Define Conditions of Use','DEFINE_CONDITIONS_STATUS','1','Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,64,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(526,'Define Checkout Success','DEFINE_CHECKOUT_SUCCESS_STATUS','1','Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,65,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(527,'Define Discount Coupon','DEFINE_DISCOUNT_COUPON_STATUS','1','Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,66,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(528,'Define Site Map Status','DEFINE_SITE_MAP_STATUS','1','Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,67,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(529,'Define Page-Not-Found Status','DEFINE_PAGE_NOT_FOUND_STATUS','1','Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON',25,67,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(530,'Define Page 2','DEFINE_PAGE_2_STATUS','1','Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,82,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(531,'Define Page 3','DEFINE_PAGE_3_STATUS','1','Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,83,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(532,'Define Page 4','DEFINE_PAGE_4_STATUS','1','Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,84,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(533,'EZ-Pages Display Status - HeaderBar','EZPAGES_STATUS_HEADER','1','Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(534,'EZ-Pages Display Status - FooterBar','EZPAGES_STATUS_FOOTER','1','Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(535,'EZ-Pages Display Status - Sidebox','EZPAGES_STATUS_SIDEBOX','1','Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,12,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(536,'EZ-Pages Header Link Separator','EZPAGES_SEPARATOR_HEADER','&nbsp;::&nbsp;','EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;',30,20,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_textarea_small(',NULL),(537,'EZ-Pages Footer Link Separator','EZPAGES_SEPARATOR_FOOTER','&nbsp;::&nbsp;','EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;',30,21,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_textarea_small(',NULL),(538,'EZ-Pages Prev/Next Buttons','EZPAGES_SHOW_PREV_NEXT_BUTTONS','2','Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1=\"Continue\"<br />2=\"Prev/Continue/Next\"<br /><br />Default setting: 2.',30,30,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(539,'EZ-Pages Table of Contents for Chapters Status','EZPAGES_SHOW_TABLE_CONTENTS','1','Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON',30,35,'2020-04-03 08:32:40','2020-04-03 08:32:40',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(540,'EZ-Pages Pages to disable headers','EZPAGES_DISABLE_HEADER_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"header\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.',30,40,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_textarea_small(',NULL),(541,'EZ-Pages Pages to disable footers','EZPAGES_DISABLE_FOOTER_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"footer\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.',30,41,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_textarea_small(',NULL),(542,'EZ-Pages Pages to disable left-column','EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"left\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.',30,42,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_textarea_small(',NULL),(543,'EZ-Pages Pages to disable right-column','EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"right\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.',30,43,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_textarea_small(',NULL),(544,'Convert currencies for Text emails','CURRENCIES_TRANSLATIONS','&pound;,Â£:&euro;,â‚¬:&reg;,Â®:&trade;,â„¢','What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;',12,120,NULL,'2003-11-21 00:00:00',NULL,'zen_cfg_textarea_small(',NULL),(545,'Use root path for cookie path','SESSION_USE_ROOT_COOKIE_PATH','False','Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(546,'Add period prefix to cookie domain','SESSION_ADD_PERIOD_PREFIX','True','Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_group`
--

LOCK TABLES `configuration_group` WRITE;
/*!40000 ALTER TABLE `configuration_group` DISABLE KEYS */;
INSERT INTO `configuration_group` VALUES (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Regulations','Regulation options',16,1),(12,'E-Mail Options','General settings for E-Mail transport and HTML E-Mails',12,1),(13,'Attribute Settings','Configure products attributes settings',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1),(16,'GV Coupons','Gift Vouchers and Coupons',16,1),(17,'Credit Cards','Credit Cards Accepted',17,1),(18,'Product Info','Product Info Display Options',18,1),(19,'Layout Settings','Layout Options',19,1),(20,'Website Maintenance','Website Maintenance Options',20,1),(21,'New Listing','New Products Listing',21,1),(22,'Featured Listing','Featured Products Listing',22,1),(23,'All Listing','All Products Listing',23,1),(24,'Index Listing','Index Products Listing',24,1),(25,'Define Page Status','Define Pages Options Settings',25,1),(30,'EZ-Pages Settings','EZ-Pages Settings',30,1);
/*!40000 ALTER TABLE `configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter_history`
--

LOCK TABLES `counter_history` WRITE;
/*!40000 ALTER TABLE `counter_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (240,'Ã…land Islands','AX','ALA',1,1),(1,'Afghanistan','AF','AFG',1,1),(2,'Albania','AL','ALB',1,1),(3,'Algeria','DZ','DZA',1,1),(4,'American Samoa','AS','ASM',1,1),(5,'Andorra','AD','AND',1,1),(6,'Angola','AO','AGO',1,1),(7,'Anguilla','AI','AIA',1,1),(8,'Antarctica','AQ','ATA',1,1),(9,'Antigua and Barbuda','AG','ATG',1,1),(10,'Argentina','AR','ARG',1,1),(11,'Armenia','AM','ARM',1,1),(12,'Aruba','AW','ABW',1,1),(13,'Australia','AU','AUS',7,1),(14,'Austria','AT','AUT',5,1),(15,'Azerbaijan','AZ','AZE',1,1),(16,'Bahamas','BS','BHS',1,1),(17,'Bahrain','BH','BHR',1,1),(18,'Bangladesh','BD','BGD',1,1),(19,'Barbados','BB','BRB',1,1),(20,'Belarus','BY','BLR',1,1),(21,'Belgium','BE','BEL',5,1),(22,'Belize','BZ','BLZ',1,1),(23,'Benin','BJ','BEN',1,1),(24,'Bermuda','BM','BMU',1,1),(25,'Bhutan','BT','BTN',1,1),(26,'Bolivia','BO','BOL',1,1),(27,'Bosnia and Herzegowina','BA','BIH',1,1),(28,'Botswana','BW','BWA',1,1),(29,'Bouvet Island','BV','BVT',1,1),(30,'Brazil','BR','BRA',1,1),(31,'British Indian Ocean Territory','IO','IOT',1,1),(32,'Brunei Darussalam','BN','BRN',1,1),(33,'Bulgaria','BG','BGR',1,1),(34,'Burkina Faso','BF','BFA',1,1),(35,'Burundi','BI','BDI',1,1),(36,'Cambodia','KH','KHM',1,1),(37,'Cameroon','CM','CMR',1,1),(38,'Canada','CA','CAN',2,1),(39,'Cape Verde','CV','CPV',1,1),(40,'Cayman Islands','KY','CYM',1,1),(41,'Central African Republic','CF','CAF',1,1),(42,'Chad','TD','TCD',1,1),(43,'Chile','CL','CHL',1,1),(44,'China','CN','CHN',1,1),(45,'Christmas Island','CX','CXR',1,1),(46,'Cocos (Keeling) Islands','CC','CCK',1,1),(47,'Colombia','CO','COL',1,1),(48,'Comoros','KM','COM',1,1),(49,'Congo','CG','COG',1,1),(50,'Cook Islands','CK','COK',1,1),(51,'Costa Rica','CR','CRI',1,1),(52,'CÃ´te d\'Ivoire','CI','CIV',1,1),(53,'Croatia','HR','HRV',1,1),(54,'Cuba','CU','CUB',1,1),(55,'Cyprus','CY','CYP',1,1),(56,'Czech Republic','CZ','CZE',1,1),(57,'Denmark','DK','DNK',1,1),(58,'Djibouti','DJ','DJI',1,1),(59,'Dominica','DM','DMA',1,1),(60,'Dominican Republic','DO','DOM',1,1),(61,'Timor-Leste','TL','TLS',1,1),(62,'Ecuador','EC','ECU',1,1),(63,'Egypt','EG','EGY',1,1),(64,'El Salvador','SV','SLV',1,1),(65,'Equatorial Guinea','GQ','GNQ',1,1),(66,'Eritrea','ER','ERI',1,1),(67,'Estonia','EE','EST',1,1),(68,'Ethiopia','ET','ETH',1,1),(69,'Falkland Islands (Malvinas)','FK','FLK',1,1),(70,'Faroe Islands','FO','FRO',1,1),(71,'Fiji','FJ','FJI',1,1),(72,'Finland','FI','FIN',1,1),(73,'France','FR','FRA',1,1),(75,'French Guiana','GF','GUF',1,1),(76,'French Polynesia','PF','PYF',1,1),(77,'French Southern Territories','TF','ATF',1,1),(78,'Gabon','GA','GAB',1,1),(79,'Gambia','GM','GMB',1,1),(80,'Georgia','GE','GEO',1,1),(81,'Germany','DE','DEU',5,1),(82,'Ghana','GH','GHA',1,1),(83,'Gibraltar','GI','GIB',1,1),(84,'Greece','GR','GRC',1,1),(85,'Greenland','GL','GRL',1,1),(86,'Grenada','GD','GRD',1,1),(87,'Guadeloupe','GP','GLP',1,1),(88,'Guam','GU','GUM',1,1),(89,'Guatemala','GT','GTM',1,1),(90,'Guinea','GN','GIN',1,1),(91,'Guinea-bissau','GW','GNB',1,1),(92,'Guyana','GY','GUY',1,1),(93,'Haiti','HT','HTI',1,1),(94,'Heard and Mc Donald Islands','HM','HMD',1,1),(95,'Honduras','HN','HND',1,1),(96,'Hong Kong','HK','HKG',1,1),(97,'Hungary','HU','HUN',1,1),(98,'Iceland','IS','ISL',1,1),(99,'India','IN','IND',1,1),(100,'Indonesia','ID','IDN',1,1),(101,'Iran (Islamic Republic of)','IR','IRN',1,1),(102,'Iraq','IQ','IRQ',1,1),(103,'Ireland','IE','IRL',1,1),(104,'Israel','IL','ISR',1,1),(105,'Italy','IT','ITA',5,1),(106,'Jamaica','JM','JAM',1,1),(107,'Japan','JP','JPN',1,1),(108,'Jordan','JO','JOR',1,1),(109,'Kazakhstan','KZ','KAZ',1,1),(110,'Kenya','KE','KEN',1,1),(111,'Kiribati','KI','KIR',1,1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1,1),(113,'Korea, Republic of','KR','KOR',1,1),(114,'Kuwait','KW','KWT',1,1),(115,'Kyrgyzstan','KG','KGZ',1,1),(116,'Lao People\'s Democratic Republic','LA','LAO',1,1),(117,'Latvia','LV','LVA',1,1),(118,'Lebanon','LB','LBN',1,1),(119,'Lesotho','LS','LSO',1,1),(120,'Liberia','LR','LBR',1,1),(121,'Libya','LY','LBY',1,1),(122,'Liechtenstein','LI','LIE',1,1),(123,'Lithuania','LT','LTU',1,1),(124,'Luxembourg','LU','LUX',1,1),(125,'Macao','MO','MAC',1,1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1,1),(127,'Madagascar','MG','MDG',1,1),(128,'Malawi','MW','MWI',1,1),(129,'Malaysia','MY','MYS',1,1),(130,'Maldives','MV','MDV',1,1),(131,'Mali','ML','MLI',1,1),(132,'Malta','MT','MLT',1,1),(133,'Marshall Islands','MH','MHL',1,1),(134,'Martinique','MQ','MTQ',1,1),(135,'Mauritania','MR','MRT',1,1),(136,'Mauritius','MU','MUS',1,1),(137,'Mayotte','YT','MYT',1,1),(138,'Mexico','MX','MEX',1,1),(139,'Micronesia, Federated States of','FM','FSM',1,1),(140,'Moldova','MD','MDA',1,1),(141,'Monaco','MC','MCO',1,1),(142,'Mongolia','MN','MNG',1,1),(143,'Montserrat','MS','MSR',1,1),(144,'Morocco','MA','MAR',1,1),(145,'Mozambique','MZ','MOZ',1,1),(146,'Myanmar','MM','MMR',1,1),(147,'Namibia','NA','NAM',1,1),(148,'Nauru','NR','NRU',1,1),(149,'Nepal','NP','NPL',1,1),(150,'Netherlands','NL','NLD',5,1),(151,'Bonaire, Sint Eustatius and Saba','BQ','BES',1,1),(152,'New Caledonia','NC','NCL',1,1),(153,'New Zealand','NZ','NZL',1,1),(154,'Nicaragua','NI','NIC',1,1),(155,'Niger','NE','NER',1,1),(156,'Nigeria','NG','NGA',1,1),(157,'Niue','NU','NIU',1,1),(158,'Norfolk Island','NF','NFK',1,1),(159,'Northern Mariana Islands','MP','MNP',1,1),(160,'Norway','NO','NOR',1,1),(161,'Oman','OM','OMN',1,1),(162,'Pakistan','PK','PAK',1,1),(163,'Palau','PW','PLW',1,1),(164,'Panama','PA','PAN',1,1),(165,'Papua New Guinea','PG','PNG',1,1),(166,'Paraguay','PY','PRY',1,1),(167,'Peru','PE','PER',1,1),(168,'Philippines','PH','PHL',1,1),(169,'Pitcairn','PN','PCN',1,1),(170,'Poland','PL','POL',1,1),(171,'Portugal','PT','PRT',1,1),(172,'Puerto Rico','PR','PRI',1,1),(173,'Qatar','QA','QAT',1,1),(174,'RÃ©union','RE','REU',1,1),(175,'Romania','RO','ROU',1,1),(176,'Russian Federation','RU','RUS',1,1),(177,'Rwanda','RW','RWA',1,1),(178,'Saint Kitts and Nevis','KN','KNA',1,1),(179,'Saint Lucia','LC','LCA',1,1),(180,'Saint Vincent and the Grenadines','VC','VCT',1,1),(181,'Samoa','WS','WSM',1,1),(182,'San Marino','SM','SMR',1,1),(183,'Sao Tome and Principe','ST','STP',1,1),(184,'Saudi Arabia','SA','SAU',1,1),(185,'Senegal','SN','SEN',1,1),(186,'Seychelles','SC','SYC',1,1),(187,'Sierra Leone','SL','SLE',1,1),(188,'Singapore','SG','SGP',4,1),(189,'Slovakia (Slovak Republic)','SK','SVK',1,1),(190,'Slovenia','SI','SVN',1,1),(191,'Solomon Islands','SB','SLB',1,1),(192,'Somalia','SO','SOM',1,1),(193,'South Africa','ZA','ZAF',1,1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1,1),(195,'Spain','ES','ESP',3,1),(196,'Sri Lanka','LK','LKA',1,1),(197,'St. Helena','SH','SHN',1,1),(198,'St. Pierre and Miquelon','PM','SPM',1,1),(199,'Sudan','SD','SDN',1,1),(200,'Suriname','SR','SUR',1,1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1,1),(202,'Swaziland','SZ','SWZ',1,1),(203,'Sweden','SE','SWE',5,1),(204,'Switzerland','CH','CHE',1,1),(205,'Syrian Arab Republic','SY','SYR',1,1),(206,'Taiwan','TW','TWN',1,1),(207,'Tajikistan','TJ','TJK',1,1),(208,'Tanzania, United Republic of','TZ','TZA',1,1),(209,'Thailand','TH','THA',1,1),(210,'Togo','TG','TGO',1,1),(211,'Tokelau','TK','TKL',1,1),(212,'Tonga','TO','TON',1,1),(213,'Trinidad and Tobago','TT','TTO',1,1),(214,'Tunisia','TN','TUN',1,1),(215,'Turkey','TR','TUR',1,1),(216,'Turkmenistan','TM','TKM',1,1),(217,'Turks and Caicos Islands','TC','TCA',1,1),(218,'Tuvalu','TV','TUV',1,1),(219,'Uganda','UG','UGA',1,1),(220,'Ukraine','UA','UKR',1,1),(221,'United Arab Emirates','AE','ARE',1,1),(222,'United Kingdom','GB','GBR',6,1),(223,'United States','US','USA',2,1),(224,'United States Minor Outlying Islands','UM','UMI',1,1),(225,'Uruguay','UY','URY',1,1),(226,'Uzbekistan','UZ','UZB',1,1),(227,'Vanuatu','VU','VUT',1,1),(228,'Vatican City State (Holy See)','VA','VAT',1,1),(229,'Venezuela','VE','VEN',1,1),(230,'Viet Nam','VN','VNM',1,1),(231,'Virgin Islands (British)','VG','VGB',1,1),(232,'Virgin Islands (U.S.)','VI','VIR',1,1),(233,'Wallis and Futuna Islands','WF','WLF',1,1),(234,'Western Sahara','EH','ESH',1,1),(235,'Yemen','YE','YEM',1,1),(236,'Serbia','RS','SRB',1,1),(238,'Zambia','ZM','ZMB',1,1),(239,'Zimbabwe','ZW','ZWE',1,1),(241,'Palestine, State of','PS','PSE',1,1),(242,'Montenegro','ME','MNE',1,1),(243,'Guernsey','GG','GGY',1,1),(244,'Isle of Man','IM','IMN',1,1),(245,'Jersey','JE','JEY',1,1),(246,'South Sudan','SS','SSD',1,1),(247,'CuraÃ§ao','CW','CUW',1,1),(248,'Sint Maarten (Dutch part)','SX','SXM',1,1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_email_track`
--

DROP TABLE IF EXISTS `coupon_email_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_email_track`
--

LOCK TABLES `coupon_email_track` WRITE;
/*!40000 ALTER TABLE `coupon_email_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_email_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_gv_customer`
--

DROP TABLE IF EXISTS `coupon_gv_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_gv_customer`
--

LOCK TABLES `coupon_gv_customer` WRITE;
/*!40000 ALTER TABLE `coupon_gv_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_gv_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_gv_queue`
--

DROP TABLE IF EXISTS `coupon_gv_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_gv_queue`
--

LOCK TABLES `coupon_gv_queue` WRITE;
/*!40000 ALTER TABLE `coupon_gv_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_gv_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_redeem_track`
--

DROP TABLE IF EXISTS `coupon_redeem_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_redeem_track`
--

LOCK TABLES `coupon_redeem_track` WRITE;
/*!40000 ALTER TABLE `coupon_redeem_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_redeem_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_restrict`
--

DROP TABLE IF EXISTS `coupon_restrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_restrict`
--

LOCK TABLES `coupon_restrict` WRITE;
/*!40000 ALTER TABLE `coupon_restrict` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_restrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  `coupon_calc_base` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_order_limit` int(4) NOT NULL DEFAULT '0',
  `coupon_is_valid_for_sales` tinyint(1) NOT NULL DEFAULT '1',
  `coupon_product_count` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons_description`
--

DROP TABLE IF EXISTS `coupons_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(64) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons_description`
--

LOCK TABLES `coupons_description` WRITE;
/*!40000 ALTER TABLE `coupons_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(32) DEFAULT NULL,
  `symbol_right` varchar(32) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` decimal(14,6) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$','','.',',','2',1.000000,'2020-04-03 08:32:40'),(2,'Euro','EUR','&euro;','','.',',','2',0.773000,'2020-04-03 08:32:40'),(3,'GB Pound','GBP','&pound;','','.',',','2',0.672600,'2020-04-03 08:32:40'),(4,'Canadian Dollar','CAD','$','','.',',','2',1.104200,'2020-04-03 08:32:40'),(5,'Australian Dollar','AUD','$','','.',',','2',1.178900,'2020-04-03 08:32:40');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(255) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'m','Bill','Smith','2001-01-01 00:00:00','root@localhost.com','',1,'12345','','d95e8fa7f20a009372eb3477473fcd34:1c','0',0,'TEXT',0,'','',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket`
--

LOCK TABLES `customers_basket` WRITE;
/*!40000 ALTER TABLE `customers_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket_attributes`
--

LOCK TABLES `customers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `customers_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_info`
--

LOCK TABLES `customers_info` WRITE;
/*!40000 ALTER TABLE `customers_info` DISABLE KEYS */;
INSERT INTO `customers_info` VALUES (1,'0001-01-01 00:00:00',0,'2004-01-21 01:35:28','0001-01-01 00:00:00',0);
/*!40000 ALTER TABLE `customers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_cache`
--

DROP TABLE IF EXISTS `db_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_cache`
--

LOCK TABLES `db_cache` WRITE;
/*!40000 ALTER TABLE `db_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_archive`
--

DROP TABLE IF EXISTS `email_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_archive`
--

LOCK TABLES `email_archive` WRITE;
/*!40000 ALTER TABLE `email_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpages`
--

DROP TABLE IF EXISTS `ezpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_visible` int(1) NOT NULL DEFAULT '0',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpages`
--

LOCK TABLES `ezpages` WRITE;
/*!40000 ALTER TABLE `ezpages` DISABLE KEYS */;
INSERT INTO `ezpages` VALUES (1,'','',1,0,0,0,1,10,0,0,10,0,0,10),(2,'','',0,0,0,0,1,0,0,0,30,0,0,10),(3,'','',0,1,0,0,0,0,10,0,0,0,0,0),(5,'','',0,1,0,0,0,0,20,0,0,0,0,0),(6,'','',1,1,1,0,0,50,50,50,0,0,0,0),(7,'index.php?main_page=account','',0,0,1,0,0,0,0,10,0,0,1,0),(8,'index.php?main_page=site_map','',0,1,1,0,0,0,40,20,0,0,0,0),(9,'index.php?main_page=privacy','',1,0,1,0,0,30,0,40,0,0,0,0),(10,'','http://www.zen-cart.com',1,0,0,0,0,60,0,0,0,1,0,0),(11,'index.php?main_page=index&cPath=21','',0,1,0,0,0,0,60,0,0,0,0,0),(12,'index.php?main_page=index&cPath=3_10','',0,0,1,0,0,0,0,60,0,0,0,0),(13,'','http://www.google.com',0,1,0,0,0,0,70,0,0,1,0,0),(14,'','',0,0,0,0,1,0,0,0,20,0,0,10);
/*!40000 ALTER TABLE `ezpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpages_content`
--

DROP TABLE IF EXISTS `ezpages_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpages_content` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `pages_html_text` text,
  UNIQUE KEY `idx_ezpages_content` (`pages_id`,`languages_id`),
  KEY `idx_lang_id_zen` (`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpages_content`
--

LOCK TABLES `ezpages_content` WRITE;
/*!40000 ALTER TABLE `ezpages_content` DISABLE KEYS */;
INSERT INTO `ezpages_content` VALUES (1,1,'EZPages','This is the main page listed under the Link EZPages in the Header<br /><br />\r\n\r\n<strong>See: What is EZPages? Link for detailed use of EZPages</strong><br /><br />\r\n\r\nThis Link could show in the Header, Footer or Sidebox or a combination of all three locations.<br /><br />\r\n\r\nThe Chapter and TOC settings are for using this Page in combination with other Pages.<br /><br />\r\n\r\nThe other Pages can be shown either *only* with this Link in the Chapter and TOC or as their own Link in the Header, Footer or Sidebox, depending on how you would like them to appear on your site.<br /><br />\r\n\r\nThere is no true \"Master\" Link, other than the Links you actually have configured to display. But any Link in a Chapter can be displayed in any of the 3 locations for the Header, Footer or Sidebox or not at all, where it only appears together with the other Links in the Chapter.'),(2,1,'A New Page','This is another page that is linked to the Chapter 10 via the Chapter number used and is sorted based on the TOC Order.<br /><br />\r\n\r\nThere is not a link to this page via the Header, Footer nor the Sidebox.<br /><br />\r\n\r\nThis page is only seen if the \"main\" link is selected and then it will show in the TOC listing.<br /><br />\r\n\r\nThis is a handy way to have numerous links that are related but only show one main link to get to them all.<br /><br />'),(3,1,'Another New Page','This is yet another new page or link that is part of Chapter 10<br /><br />\r\n\r\nThe numbering of the Chapters can be done in any manner. But, by number in increments such as 10, 20, 30, etc. you can later insert pages, or links, as needed within the existing pages.<br /><br />\r\n\r\nThere is no limit to the number of pages, or links, that can be grouped together using the Chapter.<br /><br />\r\n\r\nThe display of the Previous/Next and TOC listing is a setting that can be turned on or off.'),(4,1,'My Link','This is a single page link that will be shown in the Sidebox.<br /><br />\r\n\r\nThere are no additional pages or links associated with this page as there is no Chapter.<br /><br />\r\n\r\nLater, if you want to expand on this link you can add a Chapter and TOC settings and build a group.<br /><br />\r\n\r\nNotice that the Previous/Next and TOC automatically disable when there isn\'t a Chapter. Even with a Chapter, there must be more than one (1) related link or page in the group before these will display.'),(5,1,'Anything','The title or link names can be anything that you would like to use.<br /><br />\r\n\r\nYou decide on the content and the link name relative to that content.<br /><br />\r\n\r\nThen, define where you want the link to show: Header, Footer or Sidebox or as a combination of these three locations.<br /><br />\r\n\r\nThe content of the page can be anything you like. Be sure that your content is valid in regard to table and stylesheet rules.<br /><br />\r\n\r\nYou can even set up the links to go to Secure or Non-Secure pages as well as open in the same or a new window.<br /><br />\r\n\r\nLinks can also be setup to use internal or external links vs the HTML Content. See: examples below in the Link URL settings.'),(6,1,'Shared','This link is a \"shared\" link between the Header, Footer and Sidebox.<br /><br />\r\n\r\nThe number on the order was set to 50 on all of the settings just for the sake of an easier notation on entering it.<br /><br />\r\n\r\nThe order can be the same or different for the three locations.<br /><br />\r\n\r\nIf you wanted to really get creative, you could also have this as part of a Chapter not related to the link order.<br /><br />'),(7,1,'My Account',''),(8,1,'Site Map',''),(9,1,'Privacy Notice',''),(10,1,'Zen Cart',''),(11,1,'Gift Certificates',''),(12,1,'Action DVDs',''),(13,1,'Google',''),(14,1,'What is EZ-Pages?','<span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Summary</span><br /><br /><span style=\"font-weight: bold;\">EZ-Pages</span> is a fast, easy way of creating links and additional pages.<br /><br />The additional Pages can be for:<br /><ul><li>New Pages</li><li>Internal Links</li><li>External Links</li><li>Secure or Non-Secure pages</li><li>Same or New Window</li></ul>In Addition, there is the ability to create &quot;related&quot; links in the format of a Chapter (group) and its TOC (related pages/links).<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Link Naming</span><br /><br />Links are named by the Page Title. All Links need a Page Title in order to function.<br /><br />If you forget to add a Page Title, then you will not be able to add the Link.<br /><br />If you do not assign an Order for the Header, Sidebox or Footer, then the Link will not display even if you have a Page Title.<br /><br /><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">Link Placement</span><br /><br /></span>While you have the option of adding Additional Links to the Header, Footer and Sidebox with EZ-Pages, you are not limited to these three Link locations. Links can be in one or more locations simply by enabling the Order for the Location(s) where the Link should appear..<br /><br />The Link Location Status for the Header, Footer and Sidebox is controlled simply by setting these to Yes or No for each setting. Then, set the Order in which the Link should appear for each location.<br /><br />This means that if you were to set Header to Yes 30 and Sidebox to Yes 50 then the link would appear in both the Header and Sidebox in the Order of your Links.<br /><br />The Order numbering method is up to you. Numbering using 10, 20, 30, etc. will allow you to sort the Links and add additional Links later.<br /><br />Note: a 0 value for the Order will disable the Link from displaying.<br /><br /><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">Open in New Window and Secure Pages</span><br /></span><br />With EZ-Pages, each Link can take you to the same, main window for your shop; or, you can have the Link open a brand new New Window. In addition, there is an option for making the Link open as a Secure Page or a Non-Secure Page.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Chapter and TOC</span><br style=\"font-weight: bold; color: rgb(255, 0, 0);\" /><br />The Chapter and TOC, or Table of Contents, are a unique method of building Multiple Links that interact together.<br /><br />While these Links still follow the rules of the Header, Footer and Sidebox placement, the difference is that only one of the Links, the Main Link, needs to be displayed anywhere on the site.<br /><br />If you had, for example, 5 related Links, you could add the first Link as the Main Link by setting its location to the Header, Footer or Sidebox and set its Order, as usual.<br /><br />Next, you need to assign a Chapter or Group number to the Link. This Chapter holds the related Links together.<br /><br />Then, set the TOC or Table of Contents setting. This is a secondary Sort Order for within the Chapter.<br /><br />Again, you can display any of the Links within a Chapter, as well as making any of these Links the Main Link. Whether the Links all show, or just one or more of the Links show, the Chapter is the key to grouping these Links together in the TOC or Previous/Next. <br /><br /><span style=\"font-weight: bold; font-style: italic;\">NOTE: While all Links within a Chapter will display together, you can have the different Links display in the Header, Footer or Sidebox on their own. Or, you can have the additional Links only display when the Main Link or one of the Additional Links within the Chapter has been opened.</span><br style=\"font-weight: bold; font-style: italic;\" /><br />The versitility of EZ-Pages will make adding new Links and Pages extreamly easy for the beginner as well as the advance user.<br /><br />NOTE: Browser-based HTML editors will sometimes add the opening and closing tags for the &lt;html&gt;, &lt;head&gt; and &lt;body&gt; to the file you are working on.<br /><br />These are already added to the pages via EZ-Pages.<br /><br /><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">External Link URL</span><br /><br />External Link URLs are links to outside pages not within your shop. These can be to any valid URL such as:<br /><br />http://www.sashbox.net<br /><br />You need to include the full URL path to any External Link URL. You may also mark these to open in a New Window or the Same Window.<br /><br /><span style=\"color: rgb(255, 0, 0); font-weight: bold;\">Internal Link URL</span><br /><br />Internal Link URLs are links to internal pages within your shop. These can be to any valid URL, but should be written as relative links such as:<br /><br />index.php?main_page=index&amp;cPath=21<br /><br />The above Link would take you to the Category for categories_id 21<br /><br />While these links can be the Full URL to an Internal Link, it is best to write as a Relative Link so that if you change domains, are work on a temporary domain or an IP Address, the Link will remain valid if moved to another domain, IP Address, etc.<br /><br />Internal Links can also open in a New Window or the Same Window or be for Secure or Non-Secure Pages.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">EZ-Pages Additional Pages vs Internal Links vs External Links</span><br /><br />The Type of Link that you create is based on an order of precidence, where HTML Content will superceed both the Internal Link and the External Link values.<br /><br />The External Link URL will superceed the Internal Link URL.<br /><br />If you try to set a combination of HTML Content, Internal Link and/or External Link, the Link will be flagged in the listing with a read icon to alert you to your mistake.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">WARNING ...</span><br /><br />When using Editors such as TinyMCE or CKEditor, if you press enter in the HTML Content area <br /> will be added. These will be detected as &quot;content&quot; and will override any Internal Link URL or External Link URL.<br /><br /><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">Admin Only Display</span><br /><br />Sometimes, when working on EZ-Pages, you will want to be able to work on a Live Site and see the results of your work, but not allow the Customers to see this until you are done.<br /><br />There are 3 settings in the Configuration ... EZ-Pages Settings for the Header, Footer and Sidebox  Status:<br /><ul><li>OFF</li><li>ON</li><li>Admin Only</li></ul>The Admin Only setting is controlled by the IP Address(es) set in the Website Maintenance.<br /><br />This can be very handy when needing to work on a Live Site but not wanting customers to see the work in progress.<br /><br />');
/*!40000 ALTER TABLE `ezpages_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured`
--

DROP TABLE IF EXISTS `featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured`
--

LOCK TABLES `featured` WRITE;
/*!40000 ALTER TABLE `featured` DISABLE KEYS */;
INSERT INTO `featured` VALUES (1,34,'2004-02-21 16:34:31','2004-02-21 16:34:31','0001-01-01','2004-02-21 16:34:31',1,'0001-01-01'),(2,8,'2004-02-21 17:04:54','2004-02-21 22:31:52','2004-02-27','2004-04-25 22:50:50',0,'2004-02-21'),(3,12,'2004-02-21 17:10:49','2004-02-21 17:10:49','0001-01-01','2004-02-21 17:10:49',1,'0001-01-01'),(4,27,'2004-02-21 22:30:53',NULL,'0001-01-01',NULL,1,'0001-01-01'),(5,26,'2004-02-21 22:31:24',NULL,'0001-01-01',NULL,1,'0001-01-01'),(6,40,'2004-05-13 22:50:33',NULL,'0001-01-01',NULL,1,'0001-01-01'),(7,171,'2004-07-12 15:47:22',NULL,'0001-01-01',NULL,1,'0001-01-01'),(8,172,'2004-07-12 15:47:29',NULL,'0001-01-01',NULL,1,'0001-01-01'),(9,168,'2004-07-12 15:47:37',NULL,'0001-01-01',NULL,1,'0001-01-01'),(10,169,'2004-07-12 15:47:45',NULL,'0001-01-01',NULL,1,'0001-01-01');
/*!40000 ALTER TABLE `featured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_uploaded`
--

DROP TABLE IF EXISTS `files_uploaded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Must always have either a sesskey or customers_id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_uploaded`
--

LOCK TABLES `files_uploaded` WRITE;
/*!40000 ALTER TABLE `files_uploaded` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_uploaded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_zones`
--

LOCK TABLES `geo_zones` WRITE;
/*!40000 ALTER TABLE `geo_zones` DISABLE KEYS */;
INSERT INTO `geo_zones` VALUES (1,'Florida','Florida local sales tax zone',NULL,'2020-04-03 08:32:40');
/*!40000 ALTER TABLE `geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `get_terms_to_filter`
--

DROP TABLE IF EXISTS `get_terms_to_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `get_terms_to_filter` (
  `get_term_name` varchar(191) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `get_terms_to_filter`
--

LOCK TABLES `get_terms_to_filter` WRITE;
/*!40000 ALTER TABLE `get_terms_to_filter` DISABLE KEYS */;
INSERT INTO `get_terms_to_filter` VALUES ('manufacturers_id','TABLE_MANUFACTURERS','manufacturers_name'),('music_genre_id','TABLE_MUSIC_GENRE','music_genre_name'),('record_company_id','TABLE_RECORD_COMPANY','record_company_name');
/*!40000 ALTER TABLE `get_terms_to_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_pricing`
--

DROP TABLE IF EXISTS `group_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_pricing`
--

LOCK TABLES `group_pricing` WRITE;
/*!40000 ALTER TABLE `group_pricing` DISABLE KEYS */;
INSERT INTO `group_pricing` VALUES (1,'Group 10',10.00,NULL,'2004-04-29 00:21:04');
/*!40000 ALTER TABLE `group_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','icon.gif','english',1);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_boxes`
--

DROP TABLE IF EXISTS `layout_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_boxes`
--

LOCK TABLES `layout_boxes` WRITE;
/*!40000 ALTER TABLE `layout_boxes` DISABLE KEYS */;
INSERT INTO `layout_boxes` VALUES (1,'default_template_settings','banner_box_all.php',1,1,5,0,0),(2,'default_template_settings','banner_box.php',1,0,300,1,127),(3,'default_template_settings','banner_box2.php',1,1,15,1,15),(4,'default_template_settings','best_sellers.php',1,1,30,70,1),(5,'default_template_settings','categories.php',1,0,10,10,1),(6,'default_template_settings','currencies.php',0,1,80,60,0),(7,'default_template_settings','document_categories.php',1,0,0,0,0),(8,'default_template_settings','ezpages.php',1,1,-1,2,1),(9,'default_template_settings','featured.php',1,0,45,0,0),(10,'default_template_settings','information.php',1,0,50,40,1),(11,'default_template_settings','languages.php',0,1,70,50,0),(12,'default_template_settings','manufacturers.php',1,0,30,20,1),(13,'default_template_settings','manufacturer_info.php',1,1,35,95,1),(14,'default_template_settings','more_information.php',1,0,200,200,1),(15,'default_template_settings','music_genres.php',1,1,0,0,0),(16,'default_template_settings','order_history.php',1,1,0,0,0),(17,'default_template_settings','product_notifications.php',1,1,55,85,1),(18,'default_template_settings','record_companies.php',1,1,0,0,0),(19,'default_template_settings','reviews.php',1,0,40,0,0),(20,'default_template_settings','search.php',1,1,10,0,0),(21,'default_template_settings','search_header.php',0,0,0,0,1),(22,'default_template_settings','shopping_cart.php',1,1,20,30,1),(23,'default_template_settings','specials.php',1,1,45,0,0),(24,'default_template_settings','whats_new.php',1,0,20,0,0),(25,'default_template_settings','whos_online.php',1,1,200,200,1),(26,'template_default','banner_box_all.php',1,1,5,0,0),(27,'template_default','banner_box.php',1,0,300,1,127),(28,'template_default','banner_box2.php',1,1,15,1,15),(29,'template_default','best_sellers.php',1,1,30,70,1),(30,'template_default','categories.php',1,0,10,10,1),(31,'template_default','currencies.php',0,1,80,60,0),(32,'template_default','ezpages.php',1,1,-1,2,1),(33,'template_default','featured.php',1,0,45,0,0),(34,'template_default','information.php',1,0,50,40,1),(35,'template_default','languages.php',0,1,70,50,0),(36,'template_default','manufacturers.php',1,0,30,20,1),(37,'template_default','manufacturer_info.php',1,1,35,95,1),(38,'template_default','more_information.php',1,0,200,200,1),(39,'template_default','my_broken_box.php',1,0,0,0,0),(40,'template_default','order_history.php',1,1,0,0,0),(41,'template_default','product_notifications.php',1,1,55,85,1),(42,'template_default','reviews.php',1,0,40,0,0),(43,'template_default','search.php',1,1,10,0,0),(44,'template_default','search_header.php',0,0,0,0,1),(45,'template_default','shopping_cart.php',1,1,20,30,1),(46,'template_default','specials.php',1,1,45,0,0),(47,'template_default','whats_new.php',1,0,20,0,0),(48,'template_default','whos_online.php',1,1,200,200,1),(49,'classic','banner_box.php',1,0,300,1,127),(50,'classic','banner_box2.php',1,1,15,1,15),(51,'classic','banner_box_all.php',1,1,5,0,0),(52,'classic','best_sellers.php',1,1,30,70,1),(53,'classic','categories.php',1,0,10,10,1),(54,'classic','currencies.php',0,1,80,60,0),(55,'classic','document_categories.php',1,0,0,0,0),(56,'classic','ezpages.php',1,1,-1,2,1),(57,'classic','featured.php',1,0,45,0,0),(58,'classic','information.php',1,0,50,40,1),(59,'classic','languages.php',0,1,70,50,0),(60,'classic','manufacturers.php',1,0,30,20,1),(61,'classic','manufacturer_info.php',1,1,35,95,1),(62,'classic','more_information.php',1,0,200,200,1),(63,'classic','music_genres.php',1,1,0,0,0),(64,'classic','order_history.php',1,1,0,0,0),(65,'classic','product_notifications.php',1,1,55,85,1),(66,'classic','record_companies.php',1,1,0,0,0),(67,'classic','reviews.php',1,0,40,0,0),(68,'classic','search.php',1,1,10,0,0),(69,'classic','search_header.php',0,0,0,0,1),(70,'classic','shopping_cart.php',1,1,20,30,1),(71,'classic','specials.php',1,1,45,0,0),(72,'classic','whats_new.php',1,0,20,0,0),(73,'classic','whos_online.php',1,1,200,200,1),(74,'responsive_classic','banner_box.php',1,0,300,1,127),(75,'responsive_classic','banner_box2.php',1,1,15,1,15),(76,'responsive_classic','banner_box_all.php',1,1,5,0,0),(77,'responsive_classic','best_sellers.php',1,1,30,70,1),(78,'responsive_classic','categories.php',1,0,10,10,1),(79,'responsive_classic','currencies.php',0,1,80,60,0),(80,'responsive_classic','document_categories.php',1,0,0,0,0),(81,'responsive_classic','ezpages.php',1,1,-1,2,1),(82,'responsive_classic','featured.php',1,0,45,0,0),(83,'responsive_classic','information.php',1,0,50,40,1),(84,'responsive_classic','languages.php',0,1,70,50,0),(85,'responsive_classic','manufacturers.php',1,0,30,20,1),(86,'responsive_classic','manufacturer_info.php',1,1,35,95,1),(87,'responsive_classic','more_information.php',1,0,200,200,1),(88,'responsive_classic','music_genres.php',1,1,0,0,0),(89,'responsive_classic','order_history.php',1,1,0,0,0),(90,'responsive_classic','product_notifications.php',1,1,55,85,1),(91,'responsive_classic','record_companies.php',1,1,0,0,0),(92,'responsive_classic','reviews.php',1,0,40,0,0),(93,'responsive_classic','search.php',1,1,10,0,0),(94,'responsive_classic','search_header.php',0,0,0,0,1),(95,'responsive_classic','shopping_cart.php',1,1,20,30,1),(96,'responsive_classic','specials.php',1,1,45,0,0),(97,'responsive_classic','whats_new.php',1,0,20,0,0),(98,'responsive_classic','whos_online.php',1,1,200,200,1);
/*!40000 ALTER TABLE `layout_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Matrox','manufacturers/manufacturer_matrox.gif','2003-12-23 03:18:19',NULL),(2,'Microsoft','manufacturers/manufacturer_microsoft.gif','2003-12-23 03:18:19',NULL),(3,'Warner','manufacturers/manufacturer_warner.gif','2003-12-23 03:18:19',NULL),(4,'Fox','manufacturers/manufacturer_fox.gif','2003-12-23 03:18:19',NULL),(5,'Logitech','manufacturers/manufacturer_logitech.gif','2003-12-23 03:18:19',NULL),(6,'Canon','manufacturers/manufacturer_canon.gif','2003-12-23 03:18:19',NULL),(7,'Sierra','manufacturers/manufacturer_sierra.gif','2003-12-23 03:18:19',NULL),(8,'GT Interactive','manufacturers/manufacturer_gt_interactive.gif','2003-12-23 03:18:19',NULL),(9,'Hewlett Packard','manufacturers/manufacturer_hewlett_packard.gif','2003-12-23 03:18:19',NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers_info`
--

LOCK TABLES `manufacturers_info` WRITE;
/*!40000 ALTER TABLE `manufacturers_info` DISABLE KEYS */;
INSERT INTO `manufacturers_info` VALUES (1,1,'http://www.matrox.com',0,NULL),(2,1,'http://www.microsoft.com',0,NULL),(3,1,'http://www.warner.com',0,NULL),(4,1,'http://www.fox.com',0,NULL),(5,1,'http://www.logitech.com',0,NULL),(6,1,'http://www.canon.com',0,NULL),(7,1,'http://www.sierra.com',0,NULL),(8,1,'http://www.infogrames.com',0,NULL),(9,1,'http://www.hewlettpackard.com',0,NULL);
/*!40000 ALTER TABLE `manufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_clips`
--

DROP TABLE IF EXISTS `media_clips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_clips`
--

LOCK TABLES `media_clips` WRITE;
/*!40000 ALTER TABLE `media_clips` DISABLE KEYS */;
INSERT INTO `media_clips` VALUES (1,1,1,'thehunter.mp3','2004-06-01 20:57:43','0001-01-01 00:00:00'),(6,2,1,'thehunter.mp3','2004-07-13 00:45:09','0001-01-01 00:00:00');
/*!40000 ALTER TABLE `media_clips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_manager`
--

DROP TABLE IF EXISTS `media_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_manager`
--

LOCK TABLES `media_manager` WRITE;
/*!40000 ALTER TABLE `media_manager` DISABLE KEYS */;
INSERT INTO `media_manager` VALUES (1,'Russ Tippins - The Hunter','2004-06-01 20:57:43','2004-06-01 20:42:53'),(2,'Help!','2004-07-13 01:01:14','2004-07-12 17:57:45');
/*!40000 ALTER TABLE `media_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_to_products`
--

DROP TABLE IF EXISTS `media_to_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_to_products`
--

LOCK TABLES `media_to_products` WRITE;
/*!40000 ALTER TABLE `media_to_products` DISABLE KEYS */;
INSERT INTO `media_to_products` VALUES (1,166),(2,169);
/*!40000 ALTER TABLE `media_to_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'MP3','.mp3');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_tags_categories_description`
--

DROP TABLE IF EXISTS `meta_tags_categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_tags_categories_description`
--

LOCK TABLES `meta_tags_categories_description` WRITE;
/*!40000 ALTER TABLE `meta_tags_categories_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tags_categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_tags_products_description`
--

DROP TABLE IF EXISTS `meta_tags_products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_tags_products_description`
--

LOCK TABLES `meta_tags_products_description` WRITE;
/*!40000 ALTER TABLE `meta_tags_products_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tags_products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_genre`
--

DROP TABLE IF EXISTS `music_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_genre`
--

LOCK TABLES `music_genre` WRITE;
/*!40000 ALTER TABLE `music_genre` DISABLE KEYS */;
INSERT INTO `music_genre` VALUES (1,'Rock','2004-06-01 20:53:26',NULL),(2,'Jazz','2004-06-01 20:53:45',NULL);
/*!40000 ALTER TABLE `music_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(15,4) DEFAULT NULL,
  `order_tax` decimal(15,4) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  `order_weight` float DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  `products_weight` float DEFAULT NULL,
  `products_virtual` tinyint(1) DEFAULT NULL,
  `product_is_always_free_shipping` tinyint(1) DEFAULT NULL,
  `products_quantity_order_min` float DEFAULT NULL,
  `products_quantity_order_units` float DEFAULT NULL,
  `products_quantity_order_max` float DEFAULT NULL,
  `products_quantity_mixed` tinyint(1) DEFAULT NULL,
  `products_mixed_discount_quantity` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_attributes`
--

LOCK TABLES `orders_products_attributes` WRITE;
/*!40000 ALTER TABLE `orders_products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  `products_attributes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_download`
--

LOCK TABLES `orders_products_download` WRITE;
/*!40000 ALTER TABLE `orders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status`
--

LOCK TABLES `orders_status` WRITE;
/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
INSERT INTO `orders_status` VALUES (1,1,'Pending'),(2,1,'Processing'),(3,1,'Delivered'),(4,1,'Update');
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  `updated_by` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status_history`
--

LOCK TABLES `orders_status_history` WRITE;
/*!40000 ALTER TABLE `orders_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_total`
--

LOCK TABLES `orders_total` WRITE;
/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `mc_fee` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `payment_gross` decimal(15,4) DEFAULT NULL,
  `payment_fee` decimal(15,4) DEFAULT NULL,
  `settle_amount` decimal(15,4) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(15,4) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payment_status`
--

DROP TABLE IF EXISTS `paypal_payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payment_status`
--

LOCK TABLES `paypal_payment_status` WRITE;
/*!40000 ALTER TABLE `paypal_payment_status` DISABLE KEYS */;
INSERT INTO `paypal_payment_status` VALUES (1,'Completed'),(2,'Pending'),(3,'Failed'),(4,'Denied'),(5,'Refunded'),(6,'Canceled_Reversal'),(7,'Reversed');
/*!40000 ALTER TABLE `paypal_payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payment_status_history`
--

DROP TABLE IF EXISTS `paypal_payment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payment_status_history`
--

LOCK TABLES `paypal_payment_status_history` WRITE;
/*!40000 ALTER TABLE `paypal_payment_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payment_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_session`
--

DROP TABLE IF EXISTS `paypal_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_session`
--

LOCK TABLES `paypal_session` WRITE;
/*!40000 ALTER TABLE `paypal_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_testing`
--

DROP TABLE IF EXISTS `paypal_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_testing`
--

LOCK TABLES `paypal_testing` WRITE;
/*!40000 ALTER TABLE `paypal_testing` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_testing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_music_extra`
--

DROP TABLE IF EXISTS `product_music_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_music_extra`
--

LOCK TABLES `product_music_extra` WRITE;
/*!40000 ALTER TABLE `product_music_extra` DISABLE KEYS */;
INSERT INTO `product_music_extra` VALUES (166,1,0,1),(169,1,1,2);
/*!40000 ALTER TABLE `product_music_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type_layout`
--

DROP TABLE IF EXISTS `product_type_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(180) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type_layout`
--

LOCK TABLES `product_type_layout` WRITE;
/*!40000 ALTER TABLE `product_type_layout` DISABLE KEYS */;
INSERT INTO `product_type_layout` VALUES (1,'Show Model Number','SHOW_PRODUCT_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',1,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(2,'Show Weight','SHOW_PRODUCT_INFO_WEIGHT','1','Display Weight on Product Info 0= off 1= on',1,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(3,'Show Attribute Weight','SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',1,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(4,'Show Manufacturer','SHOW_PRODUCT_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',1,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(5,'Show Quantity in Shopping Cart','SHOW_PRODUCT_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',1,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(6,'Show Quantity in Stock','SHOW_PRODUCT_INFO_QUANTITY','1','Display Quantity in Stock on Product Info 0= off 1= on',1,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(7,'Show Product Reviews Count','SHOW_PRODUCT_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',1,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(8,'Show Product Reviews Button','SHOW_PRODUCT_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',1,8,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(9,'Show Date Available','SHOW_PRODUCT_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',1,9,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(10,'Show Date Added','SHOW_PRODUCT_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',1,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(11,'Show Product URL','SHOW_PRODUCT_INFO_URL','1','Display URL on Product Info 0= off 1= on',1,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(12,'Show Product Additional Images','SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',1,13,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(13,'Show Starting At text on Price','SHOW_PRODUCT_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',1,12,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(14,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',1,16,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(15,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',1,100,NULL,'2020-04-03 08:32:40','',''),(16,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',1,101,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(17,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',1,102,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(18,'Show Model Number','SHOW_PRODUCT_MUSIC_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',2,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(19,'Show Weight','SHOW_PRODUCT_MUSIC_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',2,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(20,'Show Attribute Weight','SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',2,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(21,'Show Artist','SHOW_PRODUCT_MUSIC_INFO_ARTIST','1','Display Artists Name on Product Info 0= off 1= on',2,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(22,'Show Music Genre','SHOW_PRODUCT_MUSIC_INFO_GENRE','1','Display Music Genre on Product Info 0= off 1= on',2,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(23,'Show Record Company','SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY','1','Display Record Company on Product Info 0= off 1= on',2,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(24,'Show Quantity in Shopping Cart','SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',2,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(25,'Show Quantity in Stock','SHOW_PRODUCT_MUSIC_INFO_QUANTITY','0','Display Quantity in Stock on Product Info 0= off 1= on',2,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(26,'Show Product Reviews Count','SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',2,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(27,'Show Product Reviews Button','SHOW_PRODUCT_MUSIC_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',2,8,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(28,'Show Date Available','SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',2,9,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(29,'Show Date Added','SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',2,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(30,'Show Starting At text on Price','SHOW_PRODUCT_MUSIC_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',2,12,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(31,'Show Product Additional Images','SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',2,13,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(32,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',2,16,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(33,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',2,100,NULL,'2020-04-03 08:32:40','',''),(34,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',2,101,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(35,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',2,102,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(36,'Show Product Reviews Count','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',3,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(37,'Show Product Reviews Button','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',3,8,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(38,'Show Date Available','SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',3,9,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(39,'Show Date Added','SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',3,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(40,'Show Product URL','SHOW_DOCUMENT_GENERAL_INFO_URL','1','Display URL on Product Info 0= off 1= on',3,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(41,'Show Product Additional Images','SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',3,13,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(42,'Show Model Number','SHOW_DOCUMENT_PRODUCT_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',4,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(43,'Show Weight','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',4,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(44,'Show Attribute Weight','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',4,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(45,'Show Manufacturer','SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',4,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(46,'Show Quantity in Shopping Cart','SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',4,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(47,'Show Quantity in Stock','SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY','0','Display Quantity in Stock on Product Info 0= off 1= on',4,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(48,'Show Product Reviews Count','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',4,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(49,'Show Product Reviews Button','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',4,8,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(50,'Show Date Available','SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',4,9,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(51,'Show Date Added','SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',4,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(52,'Show Product URL','SHOW_DOCUMENT_PRODUCT_INFO_URL','1','Display URL on Product Info 0= off 1= on',4,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(53,'Show Product Additional Images','SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',4,13,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(54,'Show Starting At text on Price','SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',4,12,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(55,'Product Free Shipping Image Status - Catalog','SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',4,16,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(56,'Product Price Tax Class Default - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',4,100,NULL,'2020-04-03 08:32:40','',''),(57,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',4,101,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(58,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',4,102,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(59,'Show Model Number','SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',5,1,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(60,'Show Weight','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',5,2,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(61,'Show Attribute Weight','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',5,3,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(62,'Show Manufacturer','SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',5,4,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(63,'Show Quantity in Shopping Cart','SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',5,5,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(64,'Show Quantity in Stock','SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY','1','Display Quantity in Stock on Product Info 0= off 1= on',5,6,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(65,'Show Product Reviews Count','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',5,7,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(66,'Show Product Reviews Button','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',5,8,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(67,'Show Date Available','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE','0','Display Date Available on Product Info 0= off 1= on',5,9,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(68,'Show Date Added','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',5,10,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(69,'Show Product URL','SHOW_PRODUCT_FREE_SHIPPING_INFO_URL','1','Display URL on Product Info 0= off 1= on',5,11,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(70,'Show Product Additional Images','SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',5,13,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(71,'Show Starting At text on Price','SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',5,12,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(72,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','1','Show the Free Shipping image/text in the catalog?',5,16,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(73,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',5,100,NULL,'2020-04-03 08:32:40','',''),(74,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',5,101,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(75,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','1','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',5,102,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(76,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',1,50,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(77,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',1,51,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(78,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',1,52,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(79,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',1,53,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(80,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',1,54,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(81,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',2,50,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(82,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',2,51,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(83,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',2,52,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(84,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',2,53,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(85,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',2,54,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(86,'Show Metatags Title Default - Document Title','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS','1','Display Document Title in Meta Tags Title 0= off 1= on',3,50,NULL,'2020-04-03 08:32:40',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(87,'Show Metatags Title Default - Document Name','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Document Name in Meta Tags Title 0= off 1= on',3,51,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(88,'Show Metatags Title Default - Document Tagline','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Document Tagline in Meta Tags Title 0= off 1= on',3,54,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(89,'Show Metatags Title Default - Document Title','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','Display Document Title in Meta Tags Title 0= off 1= on',4,50,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(90,'Show Metatags Title Default - Document Name','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Document Name in Meta Tags Title 0= off 1= on',4,51,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(91,'Show Metatags Title Default - Document Model','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','Display Document Model in Meta Tags Title 0= off 1= on',4,52,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(92,'Show Metatags Title Default - Document Price','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','Display Document Price in Meta Tags Title 0= off 1= on',4,53,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(93,'Show Metatags Title Default - Document Tagline','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Document Tagline in Meta Tags Title 0= off 1= on',4,54,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(94,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',5,50,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(95,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',5,51,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(96,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',5,52,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(97,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',5,53,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(98,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',5,54,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(99,'PRODUCT Attribute is Display Only - Default','DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',1,200,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(100,'PRODUCT Attribute is Free - Default','DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE','1','PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',1,201,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(101,'PRODUCT Attribute is Default - Default','DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT','0','PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',1,202,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(102,'PRODUCT Attribute is Discounted - Default','DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',1,203,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(103,'PRODUCT Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',1,204,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(104,'PRODUCT Attribute is Required - Default','DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED','0','PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',1,205,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(105,'PRODUCT Attribute Price Prefix - Default','DEFAULT_PRODUCT_PRICE_PREFIX','1','PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',1,206,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(106,'PRODUCT Attribute Weight Prefix - Default','DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',1,207,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(107,'MUSIC Attribute is Display Only - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY','0','MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',2,200,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(108,'MUSIC Attribute is Free - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE','1','MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',2,201,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(109,'MUSIC Attribute is Default - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT','0','MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',2,202,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(110,'MUSIC Attribute is Discounted - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED','1','MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',2,203,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(111,'MUSIC Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED','1','MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',2,204,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(112,'MUSIC Attribute is Required - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED','0','MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',2,205,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(113,'MUSIC Attribute Price Prefix - Default','DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX','1','MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',2,206,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(114,'MUSIC Attribute Weight Prefix - Default','DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',2,207,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(115,'DOCUMENT GENERAL Attribute is Display Only - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY','0','DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',3,200,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(116,'DOCUMENT GENERAL Attribute is Free - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE','1','DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',3,201,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(117,'DOCUMENT GENERAL Attribute is Default - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT','0','DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',3,202,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(118,'DOCUMENT GENERAL Attribute is Discounted - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED','1','DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',3,203,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(119,'DOCUMENT GENERAL Attribute is Included in Base Price - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED','1','DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',3,204,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(120,'DOCUMENT GENERAL Attribute is Required - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED','0','DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',3,205,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(121,'DOCUMENT GENERAL Attribute Price Prefix - Default','DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX','1','DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',3,206,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(122,'DOCUMENT GENERAL Attribute Weight Prefix - Default','DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',3,207,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(123,'DOCUMENT PRODUCT Attribute is Display Only - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',4,200,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(124,'DOCUMENT PRODUCT Attribute is Free - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE','1','DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',4,201,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(125,'DOCUMENT PRODUCT Attribute is Default - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT','0','DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',4,202,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(126,'DOCUMENT PRODUCT Attribute is Discounted - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',4,203,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(127,'DOCUMENT PRODUCT Attribute is Included in Base Price - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',4,204,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(128,'DOCUMENT PRODUCT Attribute is Required - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED','0','DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',4,205,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(129,'DOCUMENT PRODUCT Attribute Price Prefix - Default','DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX','1','DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',4,206,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(130,'DOCUMENT PRODUCT Attribute Weight Prefix - Default','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',4,207,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(131,'PRODUCT FREE SHIPPING Attribute is Display Only - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY','0','PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',5,201,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(132,'PRODUCT FREE SHIPPING Attribute is Free - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE','1','PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',5,201,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(133,'PRODUCT FREE SHIPPING Attribute is Default - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT','0','PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',5,202,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(134,'PRODUCT FREE SHIPPING Attribute is Discounted - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED','1','PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',5,203,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(135,'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED','1','PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',5,204,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(136,'PRODUCT FREE SHIPPING Attribute is Required - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED','0','PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',5,205,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(137,'PRODUCT FREE SHIPPING Attribute Price Prefix - Default','DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX','1','PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',5,206,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(138,'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',5,207,NULL,'2020-04-03 08:32:41',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
/*!40000 ALTER TABLE `product_type_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types`
--

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;
INSERT INTO `product_types` VALUES (1,'Product - General','product',1,'Y','','2020-04-03 08:32:40','2020-04-03 08:32:40'),(2,'Product - Music','product_music',1,'Y','','2020-04-03 08:32:40','2020-04-03 08:32:40'),(3,'Document - General','document_general',3,'N','','2020-04-03 08:32:40','2020-04-03 08:32:40'),(4,'Document - Product','document_product',3,'Y','','2020-04-03 08:32:40','2020-04-03 08:32:40'),(5,'Product - Free Shipping','product_free_shipping',1,'Y','','2020-04-03 08:32:40','2020-04-03 08:32:40');
/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types_to_category`
--

DROP TABLE IF EXISTS `product_types_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types_to_category`
--

LOCK TABLES `product_types_to_category` WRITE;
/*!40000 ALTER TABLE `product_types_to_category` DISABLE KEYS */;
INSERT INTO `product_types_to_category` VALUES (3,63),(4,63),(2,62);
/*!40000 ALTER TABLE `product_types_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(255) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,31,'MG200MMS','matrox/mg200mms.gif',299.9900,0,'2003-11-03 12:32:17','2004-04-26 23:57:34',NULL,23,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,299.9900,4,1,0,0,0,0,0),(2,1,31,'MG400-32MB','matrox/mg400-32mb.gif',499.9900,0,'2003-11-03 12:32:17',NULL,NULL,23,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,499.9900,4,1,0,0,0,0,0),(3,1,500,'MSIMPRO','microsoft/msimpro.gif',49.9900,0,'2003-11-03 12:32:17',NULL,NULL,7,1,1,2,1,1,1,0,0,0,0,0,1,0,0,0,0,39.9900,9,1,0,0,0,0,0),(4,1,12,'DVD-RPMK','dvd/replacement_killers.gif',42.0000,0,'2003-11-03 12:32:17',NULL,NULL,23,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,42.0000,10,1,0,0,0,0,0),(5,1,15,'DVD-BLDRNDC','dvd/blade_runner.gif',35.9900,0,'2003-11-03 12:32:17','2003-12-23 00:44:28',NULL,7,1,1,3,2,1,1,0,0,0,0,0,1,0,0,0,0,30.0000,11,1,0,0,0,0,0),(6,1,8,'DVD-MATR','dvd/the_matrix.gif',39.9900,0,'2019-12-25 08:32:42','2003-12-23 00:48:28',NULL,7,1,1,3,2,1,1,0,0,0,0,0,1,0,0,0,0,30.0000,10,1,0,0,0,0,0),(7,1,500,'DVD-YGEM','dvd/youve_got_mail.gif',34.9900,0,'2003-11-03 12:32:17','2004-04-27 14:53:17',NULL,7,1,1,3,5,1,1,0,0,0,0,0,1,0,0,0,0,34.9900,12,1,0,0,0,0,0),(8,1,499,'DVD-ABUG','dvd/a_bugs_life.gif',35.9900,0,'2003-11-03 12:32:17','2004-04-27 14:52:54',NULL,7,1,1,3,6,1,1,0,0,0,0,0,1,0,10,1,1,35.9900,13,1,0,0,0,0,0),(9,1,10,'DVD-UNSG','dvd/under_siege.gif',29.9900,0,'2003-11-03 12:32:17','2004-05-17 13:35:27',NULL,7,1,1,3,0,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,10,1,0,0,0,0,0),(10,1,9,'DVD-UNSG2','dvd/under_siege2.gif',29.9900,0,'2003-11-03 12:32:17',NULL,NULL,7,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,10,1,0,0,0,0,0),(11,1,10,'DVD-FDBL','dvd/fire_down_below.gif',29.9900,0,'2003-11-03 12:32:17','2003-12-23 00:43:40',NULL,7,1,1,3,0,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,10,1,0,0,0,0,0),(12,1,9,'DVD-DHWV','dvd/die_hard_3.gif',39.9900,0,'2003-11-03 12:32:17','2004-05-16 00:34:33',NULL,7,1,1,4,6,1,1,0,0,0,0,0,1,0,0,0,0,39.9900,10,1,0,0,0,0,0),(13,1,10,'DVD-LTWP','dvd/lethal_weapon.gif',34.9900,0,'2003-11-03 12:32:17','2004-04-27 00:07:35',NULL,7,1,1,3,0,1,1,0,0,0,0,0,1,0,0,0,0,34.9900,10,1,0,0,0,0,0),(14,1,9,'DVD-REDC','dvd/red_corner.gif',32.0000,0,'2003-11-03 12:32:17','2003-12-23 00:47:39',NULL,7,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,32.0000,15,1,0,0,0,0,0),(15,1,9,'DVD-FRAN','dvd/frantic.gif',35.0000,0,'2003-11-03 12:32:17','2003-12-23 00:43:55',NULL,7,1,1,3,1,1,1,0,0,0,0,0,1,0,0,0,0,35.0000,14,1,0,0,0,0,0),(16,1,9,'DVD-CUFI','dvd/courage_under_fire.gif',38.9900,0,'2003-11-03 12:32:17','2003-12-23 00:42:57','2020-04-15 08:32:42',7,1,1,4,1,1,1,0,0,0,0,0,1,0,0,0,0,29.9900,15,1,0,0,0,0,0),(17,1,10,'DVD-SPEED','dvd/speed.gif',39.9900,0,'2003-11-03 12:32:17','2003-12-23 00:47:51',NULL,7,1,1,4,0,1,1,0,0,0,0,0,1,0,0,0,0,39.9900,10,1,0,0,0,0,0),(18,1,10,'DVD-SPEED2','dvd/speed_2.gif',42.0000,0,'2003-11-03 12:32:17',NULL,NULL,7,1,1,4,0,1,1,0,0,0,0,0,1,0,0,0,0,42.0000,10,1,0,0,0,0,0),(19,1,10,'DVD-TSAB','dvd/theres_something_about_mary.gif',49.9900,0,'2019-12-25 08:32:42','2003-12-23 00:49:00',NULL,7,1,1,4,0,1,1,0,0,0,0,0,1,0,0,0,0,49.9900,12,1,0,0,0,0,0),(20,1,8,'DVD-BELOVED','dvd/beloved.gif',54.9900,0,'2003-11-03 12:32:17','2003-12-23 00:42:34',NULL,7,1,1,3,2,1,1,0,0,0,0,0,1,0,0,0,0,54.9900,15,1,0,0,0,0,0),(21,1,16,'PC-SWAT3','sierra/swat_3.gif',79.9900,0,'2003-11-03 12:32:17','2004-04-27 14:51:00',NULL,7,1,1,7,0,1,1,0,0,0,0,0,1,0,0,0,0,79.9900,18,1,0,0,0,0,0),(22,1,13,'PC-UNTM','gt_interactive/unreal_tournament.gif',89.9900,0,'2003-11-03 12:32:17','2003-12-23 00:49:29',NULL,7,1,1,8,9,1,1,0,0,0,0,0,1,0,0,0,0,89.9900,19,1,0,0,0,0,0),(23,1,16,'PC-TWOF','gt_interactive/wheel_of_time.gif',99.9900,0,'2003-11-03 12:32:17','2003-12-23 00:48:50',NULL,10,1,1,8,0,1,1,0,0,0,0,0,1,0,0,0,0,99.9900,20,1,0,0,0,0,0),(24,1,16,'PC-DISC','gt_interactive/disciples.gif',90.0000,0,'2003-11-03 12:32:17','2003-12-23 00:43:24',NULL,8,1,1,8,1,1,1,0,0,0,0,0,1,0,0,0,0,90.0000,20,1,0,0,0,0,0),(25,1,16,'MSINTKB','microsoft/intkeyboardps2.gif',69.9900,0,'2003-11-03 12:32:17','2004-01-04 03:02:41',NULL,8,1,1,2,0,1,1,0,0,0,0,0,1,0,0,0,0,69.9900,8,1,0,0,0,0,0),(26,1,9,'MSIMEXP','microsoft/imexplorer.gif',64.9500,0,'2003-11-03 12:32:17','2004-05-03 01:47:47',NULL,8,1,1,2,17,1,1,0,0,0,0,0,1,0,0,0,0,64.9500,9,1,0,0,0,0,0),(27,1,70,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.9900,0,'2003-11-03 12:32:17','2003-12-23 00:45:03',NULL,45,1,1,9,1,1,1,0,0,0,0,0,1,0,0,0,0,499.9900,5,1,0,0,0,0,0),(28,1,999,'GIFT005','gift_certificates/gv_5.gif',5.0000,1,'2003-11-03 12:32:17','2004-01-10 02:57:18',NULL,0,1,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0,5.0000,21,1,0,0,0,0,0),(29,1,985,'GIFT 010','gift_certificates/gv_10.gif',10.0000,1,'2003-11-03 12:32:17','2003-12-28 14:51:36',NULL,0,1,0,0,15,1,1,0,0,0,0,0,1,0,0,0,0,10.0000,21,1,0,0,0,0,0),(30,1,992,'GIFT025','gift_certificates/gv_25.gif',25.0000,1,'2003-11-03 12:32:17',NULL,NULL,0,1,0,0,8,1,1,0,0,0,0,0,1,0,0,0,0,25.0000,21,1,0,0,0,0,0),(31,1,997,'GIFT050','gift_certificates/gv_50.gif',50.0000,1,'2003-11-03 12:32:17',NULL,NULL,0,1,0,0,4,1,1,0,0,0,0,0,1,0,0,0,0,50.0000,21,1,0,0,0,0,0),(32,1,995,'GIFT100','gift_certificates/gv_100.gif',100.0000,1,'2003-11-03 12:32:17',NULL,NULL,0,1,0,0,5,1,1,0,0,0,0,0,1,0,0,0,0,100.0000,21,1,0,0,0,0,0),(34,1,796,'DVD-ABUG','dvd/a_bugs_life.gif',35.9900,0,'2020-03-14 08:32:42','2004-01-01 14:16:01','2020-05-06 08:32:42',7,1,1,3,5,1,1,0,0,0,0,0,1,0,0,0,0,35.9900,22,1,0,0,0,0,0),(36,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2003-12-24 14:29:11','2004-01-03 01:51:12',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,499.0000,25,1,0,0,0,0,0),(100,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2004-01-08 14:06:13','2004-01-08 14:06:50',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,374.2500,25,1,0,0,0,0,0),(39,1,997,'TESTFREE','free.gif',100.0000,0,'2003-12-25 16:33:13','2004-01-11 02:29:16',NULL,1,1,1,0,3,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,24,1,0,0,0,0,0),(40,1,999,'TESTCALL','call_for_price.jpg',100.0000,0,'2003-12-25 17:42:15','2004-01-04 13:08:08','2020-04-30 08:32:42',1,1,1,0,0,1,1,0,0,1,1,0,1,0,0,0,0,100.0000,24,1,0,0,0,0,0),(41,1,999,'TESTCALL','call_for_price.jpg',100.0000,0,'2003-12-25 19:13:35','2004-09-27 13:33:33',NULL,1,1,1,0,0,1,1,0,0,1,1,0,1,0,0,0,0,100.0000,28,0,0,0,0,0,0),(42,1,998,'TESTFREE','free.gif',100.0000,0,'2003-12-25 19:14:16','2003-12-25 19:15:00',NULL,1,1,1,0,1,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,28,1,0,0,0,0,0),(43,1,999,'TESTFREEATTRIB','free.gif',100.0000,0,'2003-12-25 20:44:06','2004-01-21 16:23:29',NULL,0,1,1,0,0,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,24,1,0,0,0,0,0),(44,1,999,'TESTMINUNITSNOMIX','sample_image.gif',100.0000,0,'2003-12-25 21:38:59','2004-01-22 13:15:41',NULL,1,1,1,0,0,4,2,0,0,0,0,0,1,0,0,0,0,90.0000,22,1,0,0,0,0,0),(46,1,981,'TESTMINUNITSMIX','sample_image.gif',100.0000,0,'2003-12-25 21:53:07','2003-12-29 02:00:50',NULL,1,1,1,0,18,4,2,0,0,0,1,0,1,0,0,0,0,90.0000,22,1,0,0,0,0,0),(47,1,9996,'GIFT','gift_certificates/gv.gif',0.0000,1,'2020-03-14 08:32:42','2004-09-29 20:11:51',NULL,0,1,0,0,4,1,1,1,0,0,1,0,1,0,0,0,0,5.0000,21,1,0,0,0,0,0),(48,1,9990,'TEST1','1_small.jpg',39.0000,0,'2003-12-28 02:27:47','2004-01-11 02:56:37',NULL,1,1,1,0,10,1,1,0,0,0,1,0,1,0,0,0,0,39.0000,23,1,0,0,0,0,0),(49,1,900,'TEST2','2_small.jpg',20.0000,0,'2003-12-28 02:28:42','2003-12-29 23:00:27',NULL,0.5,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,20.0000,23,1,0,0,0,0,0),(50,1,1000,'TEST3','3_small.jpg',75.0000,0,'2003-12-28 02:29:37','2003-12-29 23:01:04',NULL,1.5,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,75.0000,23,1,0,0,0,0,0),(51,1,998,'Free1','b_g_grid.gif',25.0000,0,'2003-12-28 11:51:05','2004-01-21 17:03:32',NULL,10,1,1,0,2,1,1,0,1,0,1,1,1,0,0,0,0,0.0000,24,1,0,0,0,0,0),(52,1,997,'Free2','b_p_grid.gif',0.0000,1,'2003-12-28 12:24:58','2004-01-21 17:01:18',NULL,2,1,1,0,2,1,1,0,1,0,1,0,1,0,0,0,0,0.0000,24,1,0,0,0,0,0),(53,1,991,'MINUNITSMIX','b_c_grid.gif',25.0000,0,'2003-12-28 23:26:44','2004-01-11 02:22:35',NULL,1,1,1,0,6,6,3,0,0,0,1,0,1,0,0,0,0,20.0000,23,1,0,0,0,0,0),(54,1,991,'MINUNITSNOMIX','waybkgnd.gif',25.0000,0,'2003-12-29 23:19:13','2004-01-11 02:23:08',NULL,1,1,1,0,0,6,3,0,0,0,0,0,1,0,0,0,0,25.0000,23,1,0,0,0,0,0),(55,1,991,'MINUNITSMIXSALE','b_b_grid.gif',25.0000,0,'2003-12-31 11:11:46','2004-01-11 02:26:28',NULL,1,1,1,0,0,6,3,0,0,0,1,0,1,0,0,0,0,25.0000,28,1,0,0,0,0,0),(56,1,991,'MINUNITSNOMIXSALE','b_w_grid.gif',25.0000,0,'2003-12-31 11:13:08','2004-01-11 02:26:49',NULL,1,1,1,0,0,6,3,0,0,0,0,0,1,0,0,0,0,25.0000,28,1,0,0,0,0,0),(57,1,998,'TESTFREEALL','free.gif',0.0000,0,'2020-01-24 08:32:42','2004-01-21 16:55:19',NULL,1,1,1,0,1,1,1,0,1,0,1,1,1,0,0,0,0,0.0000,24,1,0,0,0,0,0),(59,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2003-12-31 14:36:57','2003-12-31 14:37:05',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,300.0000,23,1,0,0,0,0,0),(60,1,699,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.7500,0,'2004-01-02 01:34:55','2004-01-02 01:41:37',NULL,45,1,1,9,1,1,1,0,0,0,0,0,1,0,0,0,0,499.7500,28,1,0,0,0,0,0),(61,1,699,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.7500,0,'2004-01-02 01:44:09','2004-01-02 01:45:45',NULL,45,1,1,9,1,1,1,0,0,0,0,0,1,0,0,0,0,499.7500,28,1,0,0,0,0,0),(101,1,1000,'Test120-90off-10','test_demo.jpg',0.0000,0,'2004-01-08 14:11:32','2004-01-08 14:17:09',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,80.0000,47,1,0,0,0,0,0),(109,1,1000,'HIDEQTYBOX','1_small.jpg',75.0000,0,'2004-01-21 22:01:20','2004-01-22 11:21:12',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,1,0,0,0,75.0000,23,1,0,0,0,0,0),(78,1,1000,'Test25-10AttrAll','test_demo.jpg',0.0000,0,'2004-01-04 01:09:46','2004-01-04 01:30:12',NULL,0,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,112.5000,25,1,0,0,0,0,0),(79,1,1000,'Test25-AttrAll','test_demo.jpg',0.0000,0,'2004-01-04 01:28:52','2004-01-04 01:33:55',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,150.0000,23,1,0,0,0,0,0),(74,1,700,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',0.0000,0,'2004-01-02 15:34:49','2004-01-02 15:35:17',NULL,45,1,1,9,0,1,1,1,0,0,0,0,1,0,0,0,0,399.2000,23,1,0,0,0,0,0),(76,1,1000,'Test25-10','test_demo.jpg',100.0000,0,'2004-01-03 23:08:33',NULL,NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,75.0000,28,1,0,0,0,0,0),(80,1,1000,'Test25','test_demo.jpg',100.0000,0,'2004-01-04 01:31:06','2004-01-04 13:35:47',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,23,1,0,0,0,0,0),(84,1,999,'Test120','test_demo.jpg',120.0000,0,'2004-01-04 15:05:10','2004-01-06 15:27:39',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,0,0,0,120.0000,23,1,0,0,0,0,0),(82,1,1000,'Test120-5','test_demo.jpg',120.0000,0,'2004-01-04 14:50:38','2004-01-04 17:09:03',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,115.0000,27,1,0,0,0,0,0),(83,1,1000,'Test120-90-5','test_demo.jpg',120.0000,0,'2004-01-04 15:01:53','2004-01-06 10:02:11',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,85.0000,27,1,0,0,0,0,0),(85,1,1000,'Test90','test_demo.jpg',120.0000,0,'2004-01-04 15:19:00','2004-01-06 10:00:35',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,23,1,0,0,0,0,0),(88,1,1000,'Test120-90-10-Skip','test_demo.jpg',120.0000,0,'2004-01-05 00:14:31','2004-01-06 09:58:08',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,31,1,0,0,0,0,0),(89,1,1000,'Test120-90-10-Skip','test_demo.jpg',120.0000,0,'2004-01-05 00:41:40','2004-01-06 09:57:42',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,108.0000,31,1,0,0,0,0,0),(95,1,1000,'Test120-25-New100-Skip','test_demo.jpg',120.0000,0,'2004-01-07 02:35:44','2004-01-07 02:37:27',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,51,1,0,0,0,0,0),(90,1,999,'Test120-90-10','test_demo.jpg',120.0000,0,'2004-01-05 23:55:18','2004-01-06 00:08:58',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,45,1,0,0,0,0,0),(92,1,1000,'Test120-90off-10','test_demo.jpg',120.0000,0,'2004-01-05 23:58:54','2004-01-06 00:09:28',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,120.0000,45,1,0,0,0,0,0),(93,1,1000,'Test120-New100','test_demo.jpg',120.0000,0,'2004-01-06 00:02:32','2004-01-06 00:04:25',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,46,1,0,0,0,0,0),(94,1,1000,'Test120-25-New100','test_demo.jpg',120.0000,0,'2004-01-06 00:04:31','2004-01-06 00:07:08',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,46,1,0,0,0,0,0),(96,1,1000,'Test120-New100-Off-Skip','test_demo.jpg',120.0000,0,'2004-01-07 02:36:52','2004-01-07 02:37:29',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,100.0000,51,1,0,0,0,0,0),(97,1,1000,'Test120-90-10-Price','test_demo.jpg',120.0000,0,'2004-01-07 11:26:34','2004-01-07 11:27:24',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,108.0000,32,1,0,0,0,0,0),(98,1,1000,'Test120-90off-10-Price','test_demo.jpg',120.0000,0,'2004-01-07 11:28:16','2004-01-07 11:29:57',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,108.0000,32,1,0,0,0,0,0),(99,1,997,'FreeShipping','small_00.jpg',25.0000,0,'2004-01-07 13:27:30','2004-01-21 01:48:48',NULL,5,1,1,0,3,1,1,0,0,0,1,1,1,0,0,0,0,25.0000,23,1,0,0,0,0,0),(104,1,1000,'HIDEQTY','1_small.jpg',75.0000,0,'2004-01-11 03:02:51','2004-01-22 11:21:36',NULL,1,1,1,0,0,1,1,0,0,0,1,0,0,0,0,0,0,75.0000,23,1,0,0,0,0,0),(105,1,999,'MAXSAMPLE-1','waybkgnd.gif',50.0000,0,'2004-01-11 14:10:59','2004-01-11 14:36:00',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,1,0,0,0,50.0000,22,1,0,0,0,0,0),(106,1,1000,'MAXSAMPLE-3','waybkgnd.gif',50.0000,0,'2004-01-11 14:36:08','2004-01-11 15:32:56',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,3,0,0,0,50.0000,22,1,0,0,0,0,0),(107,1,995,'FreeShippingNoWeight','small_00.jpg',25.0000,0,'2004-01-21 01:41:22','2004-01-21 02:01:54',NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,25.0000,23,1,0,0,0,0,0),(108,1,0,'SoldOut','small_00.jpg',25.0000,0,'2004-01-21 01:53:20',NULL,NULL,3,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,25.0000,23,1,0,0,0,0,0),(110,1,1000,'Test120-5SKIP','test_demo.jpg',120.0000,0,'2004-01-24 16:09:52','2004-01-24 16:15:25',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,115.0000,52,1,0,0,0,0,0),(111,1,1000,'Test120-90-5SKIP','test_demo.jpg',120.0000,0,'2004-01-24 16:10:12','2004-01-24 16:15:27',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,90.0000,52,1,0,0,0,0,0),(112,1,998,'Test2','',25.0000,0,'2004-04-26 02:24:57','2004-04-26 02:25:44',NULL,1,1,1,0,2,1,1,0,0,0,1,0,1,0,2,0,0,25.0000,53,1,0,0,0,0,0),(113,1,994,'Test4','',25.0000,0,'2004-04-26 02:25:03','2004-04-26 02:25:35',NULL,1,1,1,0,6,1,1,0,0,0,1,0,1,0,4,0,0,25.0000,53,1,0,0,0,0,0),(114,1,998,'Test5','',25.0000,0,'2004-04-26 02:25:53','2004-04-26 02:26:15',NULL,1,1,1,0,2,1,1,0,0,0,1,0,1,0,5,0,0,25.0000,53,1,0,0,0,0,0),(115,1,999,'Test1','',25.0000,0,'2004-04-26 02:26:23','2004-05-06 21:50:19',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,1,0,0,25.0000,53,1,0,0,0,0,0),(116,1,997,'Test8','',25.0000,0,'2004-04-26 02:26:54','2004-04-26 02:27:18',NULL,1,1,1,0,3,1,1,0,0,0,1,0,1,0,8,0,0,25.0000,53,1,0,0,0,0,0),(117,1,995,'Test3','',25.0000,0,'2004-04-26 02:27:24','2004-10-03 12:20:14',NULL,1,1,1,0,5,1,1,0,0,0,1,0,1,0,3,0,0,25.0000,53,1,0,0,0,0,0),(118,1,999,'Test10','',25.0000,0,'2004-04-26 02:27:52','2004-04-26 02:28:14',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,10,0,0,25.0000,53,1,0,0,0,0,0),(119,1,1000,'Test6','',25.0000,0,'2004-04-26 02:28:22','2004-10-06 18:26:25',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,6,0,0,25.0000,53,1,0,0,0,0,0),(120,1,1000,'Test7','',25.0000,0,'2004-04-26 02:29:03','2004-04-26 02:29:23',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,7,0,0,25.0000,53,1,0,0,0,0,0),(121,1,999,'Test12','',25.0000,0,'2004-04-26 02:29:36','2004-04-28 13:02:47',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,12,0,0,25.0000,53,1,0,0,0,0,0),(122,1,998,'Test9','',25.0000,0,'2004-04-26 02:30:12','2004-04-26 02:30:32',NULL,1,1,1,0,2,1,1,0,0,0,1,0,1,0,9,0,0,25.0000,53,1,0,0,0,0,0),(123,1,999,'Test11','',25.0000,0,'2004-04-26 02:30:41','2004-04-26 02:31:04',NULL,1,1,1,0,1,1,1,0,0,0,1,0,1,0,11,0,0,25.0000,53,1,0,0,0,0,0),(130,1,1000,'Special','2_small.jpg',15.0000,0,'2004-04-28 02:19:53','2004-10-06 00:05:34',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,1,10.0000,55,1,0,0,0,0,0),(127,1,1000,'Normal','small_00.jpg',15.0000,0,'2004-04-28 01:51:35','2004-04-28 14:23:29',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,0,15.0000,55,1,0,0,0,0,0),(131,1,1000,'PERWORDREQ','',0.0000,0,'2020-02-13 08:32:42','2004-05-07 21:30:23',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,5.0000,57,1,0,0,0,0,0),(132,1,997,'GolfClub','9_small.jpg',0.0000,0,'2004-05-02 12:36:12','2004-05-02 18:04:36',NULL,1,1,1,0,3,1,1,1,0,0,1,0,1,0,0,0,0,14.4500,58,1,0,0,0,0,0),(133,1,1000,'DOWNLOAD2','2_small.jpg',49.9900,0,'2020-03-27 08:32:42','2004-05-03 00:06:58',NULL,0,1,1,0,2,1,1,0,0,0,1,0,1,0,0,0,0,49.9900,60,1,0,0,0,0,0),(134,1,1000,'PERLETTERREQ','',0.0000,0,'2020-02-13 08:32:42','2004-05-07 21:29:50',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,5.0000,57,1,0,0,0,0,0),(154,1,10000,'ROPE','9_small.jpg',1.0000,0,'2004-05-16 21:08:08','2004-07-12 17:18:46',NULL,0,1,1,0,0,10,1,0,0,0,1,0,1,0,0,0,0,1.0000,58,0,0,0,0,0,0),(155,1,1000,'PRICEFACTOR','sample_image.gif',10.0000,0,'2004-05-17 23:03:10','2004-07-12 17:21:04',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,10.0000,56,1,0,0,0,0,0),(156,1,1000,'PRICEFACTOROFF','sample_image.gif',10.0000,0,'2004-05-17 23:05:24','2004-05-17 23:10:12',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,10.0000,56,1,0,0,0,0,0),(157,1,1000,'PRICEFACTOROFFATTR','sample_image.gif',10.0000,0,'2004-05-17 23:10:18','2004-05-17 23:13:48',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,10.0000,56,1,0,0,0,0,0),(158,1,1000,'ONETIME','b_b_grid.gif',45.0000,0,'2004-05-17 23:22:08',NULL,NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,45.0000,56,1,0,0,0,0,0),(159,1,10000,'ATTQTYPRICE','b_c_grid.gif',25.0000,0,'2004-05-17 23:29:31','2004-05-17 23:49:56',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,25.0000,56,1,0,0,0,0,0),(160,1,997,'GolfClub','9_small.jpg',0.0000,0,'2020-02-13 08:32:42','2004-05-18 10:15:16',NULL,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,14.4500,61,1,0,0,0,0,0),(165,1,10000,'ROPE','9_small.jpg',1.0000,0,'2004-05-18 10:42:50','2004-07-12 17:18:12',NULL,0,1,1,0,0,10,1,0,0,0,1,0,1,0,0,0,0,1.0000,61,0,0,0,0,0,0),(166,2,10000,'RTBHUNTER','sooty.jpg',4.9900,0,'2020-03-27 08:32:42','2004-05-18 10:43:00',NULL,3,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,3.0000,62,1,0,0,0,0,0),(167,3,0,'','',0.0000,0,'2004-05-18 10:42:50','2004-10-06 00:39:10',NULL,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0.0000,63,1,0,0,0,0,0),(168,1,1000,'PGT','samples/1_small.jpg',3.9500,0,'2020-04-03 08:32:42','2004-07-12 16:26:08',NULL,1,1,1,0,0,1,1,0,0,0,1,0,1,0,10,0,0,3.9500,64,1,0,0,0,0,0),(169,2,1000,'PMT','samples/2_small.jpg',3.9500,0,'2020-04-03 08:32:42','2004-07-12 16:29:01',NULL,1,1,1,NULL,0,1,1,0,0,0,1,0,1,0,20,0,0,3.9500,64,1,0,0,0,0,0),(170,3,0,'','samples/3_small.jpg',0.0000,0,'2020-04-03 08:32:42','2004-09-27 23:11:25',NULL,0,1,0,0,0,1,1,0,0,0,0,0,0,0,30,0,0,0.0000,64,1,0,0,0,0,0),(171,4,1000,'DPT','samples/4_small.jpg',0.9346,0,'2020-03-27 08:32:42','2004-07-12 17:46:49',NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,40,0,0,0.9300,64,1,0,0,0,0,0),(172,5,1000,'PFS','samples/5_small.jpg',3.9500,0,'2020-03-27 08:32:42','2004-07-12 23:08:43',NULL,5,1,0,0,0,1,1,0,0,0,1,1,1,0,50,0,0,3.9500,64,1,0,0,0,0,0),(173,1,1000,'Book','b_g_grid.gif',0.0000,0,'2004-09-24 23:54:34','2004-09-26 02:50:59',NULL,0,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,0,52.5000,61,1,0,0,0,0,0),(174,1,999,'TESTCALL','call_for_price.jpg',0.0000,0,'2020-01-24 08:32:42','2004-09-27 13:28:54','2020-04-20 08:32:42',1,1,1,0,0,1,1,0,0,1,1,0,1,0,0,0,0,0.0000,24,0,0,0,0,0,0),(175,1,1000,'Normal','1_small.jpg',60.0000,0,'2004-09-27 23:32:52','2004-10-05 17:13:20',NULL,2,1,1,0,0,1,1,0,0,0,0,0,1,0,0,1,0,60.0000,55,1,0,0,0,0,0),(176,1,1000,'Normal','small_00.jpg',100.0000,0,'2004-10-05 16:45:25','2004-10-05 16:47:22',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,0,100.0000,55,1,0,0,0,0,0),(177,1,1000,'Special','2_small.jpg',100.0000,0,'2004-10-05 16:47:45','2004-10-06 00:05:48',NULL,2,1,1,0,0,1,1,0,0,0,1,0,1,0,0,1,1,75.0000,55,1,0,0,0,0,0),(179,1,1000,'DOWNLOAD1','1_small.jpg',39.0000,0,'2004-10-06 00:08:33','2004-10-06 00:18:51',NULL,0,1,1,0,0,1,1,0,0,0,1,0,1,0,0,0,0,39.0000,60,1,0,0,0,0,0),(178,1,1000,'Normal','1_small.jpg',60.0000,0,'2004-10-05 16:54:52','2004-10-05 17:15:02',NULL,2,1,1,0,0,1,1,0,0,0,0,0,1,0,0,1,0,50.0000,55,1,0,0,0,0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(255) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes` VALUES (1,1,4,1,0.0000,'',10,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(2,1,4,2,50.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(3,1,4,3,70.0000,'+',30,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(4,1,3,5,0.0000,'+',10,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(5,1,3,6,100.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(6,2,4,3,10.0000,'-',30,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(7,2,4,4,0.0000,'+',40,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(8,2,3,6,0.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(9,2,3,7,120.0000,'+',30,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(10,26,3,8,0.0000,'+',20,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(11,26,3,9,6.0000,'+',10,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(26,22,5,10,0.0000,'+',10,0,7,'-',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(27,22,5,13,0.0000,'+',1000,0,0,'',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(85,34,1,25,0.2000,'+',20,0,0.1,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(65,34,13,35,5.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(64,34,13,36,2.0000,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(63,34,13,34,1.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(56,34,7,0,0.2500,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(55,34,8,0,0.2500,'+',0,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(54,34,11,0,1.0000,'+',0,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(53,34,9,0,0.7500,'+',0,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(52,34,10,0,0.5000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(410,54,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(47,34,6,23,0.0000,'+',10,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(46,34,6,22,1.0000,'+',20,0,2,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(45,34,6,14,36.9900,'+',30,0,9,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(394,50,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(393,50,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(426,55,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(44,34,2,18,0.0000,'+',30,0,0,'+',0,1,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(43,34,2,20,0.0000,'+',40,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(425,55,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(42,34,2,19,0.0000,'+',10,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(41,34,2,21,0.0000,'+',20,0,0,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(40,34,1,17,0.3000,'+',30,0,0.1,'',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(39,34,1,16,0.1000,'+',10,0,0.1,'',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(38,34,1,15,0.4000,'+',50,0,0,'',0,0,1,'attributes/a_bugs_life_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(48,34,5,24,1.0000,'+',10,0,2,'+',0,0,1,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(968,100,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(422,36,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(101,36,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(102,36,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(103,36,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(104,36,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(105,36,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(106,36,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(967,100,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(966,100,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(965,100,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(964,100,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(963,100,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(962,100,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(119,43,1,16,5.0000,'+',10,1,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(120,43,1,17,6.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(121,43,1,29,7.0000,'+',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(122,43,2,21,0.0000,'+',20,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(123,43,2,18,1.0000,'+',30,1,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(124,43,2,20,2.0000,'+',40,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(125,44,1,16,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(126,44,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(127,44,1,29,0.0000,'+',80,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(128,44,2,21,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(129,44,2,18,1.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(130,44,2,20,2.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(141,46,2,18,1.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(140,46,2,21,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(139,46,1,29,0.0000,'+',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(138,46,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(137,46,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(142,46,2,20,2.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(143,44,2,37,0.0000,'+',5,0,0,'+',1,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(144,46,2,37,0.0000,'+',5,1,0,'+',1,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(160,47,14,38,5.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(161,47,14,39,10.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(162,47,14,41,15.0000,'+',15,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(163,47,14,43,100.0000,'+',100,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(164,47,14,40,25.0000,'+',25,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(165,47,14,42,50.0000,'+',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(407,49,1,26,0.0000,'+',40,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(401,53,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(406,49,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(405,49,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(86,34,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(311,48,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(310,48,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(308,48,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(309,48,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(307,48,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(306,48,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(398,53,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(399,53,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(395,50,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(390,50,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(400,53,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(397,53,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(392,50,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(391,50,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(403,49,1,15,0.0000,'+',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(396,53,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(404,49,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(87,34,1,27,0.0000,'+',60,0,0.1,'+',0,0,1,'attributes/a_bugs_life_purple.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(88,34,1,28,0.0000,'+',70,0,0,'+',0,0,1,'attributes/a_bugs_life_brown.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(89,34,1,30,0.0000,'+',90,0,0,'+',0,0,1,'attributes/a_bugs_life_white.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(90,34,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/a_bugs_life_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(402,49,1,31,0.0000,'+',100,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(411,54,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(412,54,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(413,54,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(414,54,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(415,54,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(417,46,13,34,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(418,46,13,35,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(419,46,13,36,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(420,46,13,44,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(421,43,1,45,0.0000,'+',5,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(427,55,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(428,55,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(429,55,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(430,55,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(431,56,1,31,0.0000,'+',100,0,0,'+',0,0,1,'attributes/color_silver.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(432,56,1,15,0.0000,'+',50,0,0,'+',0,0,1,'attributes/color_blue.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(433,56,6,23,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(434,56,6,14,19.9900,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(435,56,6,22,4.9900,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(436,56,1,26,0.0000,'+',40,0,0,'+',0,1,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(449,59,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(448,59,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(447,59,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(446,59,4,1,50.0000,'+',10,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(445,59,4,2,75.0000,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(444,59,4,3,100.0000,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(450,59,4,46,0.0000,'+',5,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(451,60,4,3,100.0000,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(452,60,4,2,75.0000,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(453,60,4,1,50.0000,'+',10,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(454,60,1,29,10.0000,'+',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(455,60,1,30,0.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(456,60,1,15,20.0000,'+',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(457,60,4,46,0.0000,'+',5,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(458,61,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(459,61,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(460,61,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(461,61,1,29,10.0000,'+',80,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(462,61,1,30,0.0000,'',90,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(463,61,1,15,20.0000,'+',50,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(464,61,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(972,101,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(971,101,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(970,101,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(969,101,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(991,110,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(988,109,5,52,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(987,109,5,10,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(990,110,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(483,74,4,2,75.0000,'+',20,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(482,74,4,3,100.0000,'+',30,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(484,74,4,1,50.0000,'+',10,0,1,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(485,74,1,29,519.0000,'',80,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(486,74,1,30,499.0000,'',90,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(487,74,1,15,539.0000,'',50,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(488,74,4,46,0.0000,'+',5,0,0,'+',0,1,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(505,76,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(504,76,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(503,76,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(502,76,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(501,76,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(500,76,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(499,76,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(496,46,10,0,0.7500,'+',0,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(497,46,9,0,0.5000,'+',0,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(498,46,11,0,0.2500,'+',0,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(506,76,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(507,76,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(508,78,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(509,78,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(510,78,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(511,78,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(512,78,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(513,78,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(514,78,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(515,78,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(516,78,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(517,79,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(518,79,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(519,79,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(520,79,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(521,79,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(522,79,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(523,79,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(524,79,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(525,79,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(526,80,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(527,80,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(528,80,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(529,80,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(530,80,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(531,80,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(532,80,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(533,80,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(534,80,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(570,84,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(569,84,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(568,84,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(567,84,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(566,84,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(565,84,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(564,84,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(563,84,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(562,84,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(678,82,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(677,82,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(676,82,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(675,82,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(674,82,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(673,82,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(694,83,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(693,83,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(692,83,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(691,83,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(690,83,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(689,83,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(571,85,1,16,100.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(572,85,1,25,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(573,85,1,17,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(574,85,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(575,85,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(576,85,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(577,85,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(578,85,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(579,85,13,36,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(879,88,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(878,88,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(877,88,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(876,88,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(873,88,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(874,88,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(875,88,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(895,89,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(894,89,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(893,89,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(892,89,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(889,89,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(890,89,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(891,89,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(806,90,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(805,90,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(804,90,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(803,90,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(802,90,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(801,90,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(822,92,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(821,92,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(820,92,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(819,92,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(818,92,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(817,92,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(710,93,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(709,93,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(708,93,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(707,93,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(706,93,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(705,93,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(726,94,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(725,94,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(724,94,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(723,94,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(722,94,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(721,94,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(661,84,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(662,84,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(663,84,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(668,84,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(669,84,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(671,84,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(679,82,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(672,84,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(680,82,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(681,82,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(682,82,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(683,82,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(684,82,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(685,82,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(686,82,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(687,82,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(688,82,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(695,83,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(696,83,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(697,83,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(698,83,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(699,83,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(700,83,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(701,83,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(702,83,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(703,83,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(704,83,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(711,93,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(712,93,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(713,93,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(714,93,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(715,93,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(716,93,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(717,93,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(718,93,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(719,93,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(720,93,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(727,94,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(728,94,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(729,94,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(730,94,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(731,94,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(732,94,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(733,94,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(734,94,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(735,94,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(736,94,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(872,88,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(871,88,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(870,88,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(868,88,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(869,88,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(867,88,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(866,88,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(888,89,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(887,89,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(886,89,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(884,89,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(885,89,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(883,89,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(882,89,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(807,90,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(808,90,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(809,90,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(810,90,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(811,90,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(812,90,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(813,90,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(814,90,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(815,90,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(816,90,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(823,92,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(824,92,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(825,92,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(826,92,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(827,92,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(828,92,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(829,92,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(830,92,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(831,92,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(832,92,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(865,88,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(881,89,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(880,88,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(896,89,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(897,95,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(898,95,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(899,95,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(900,95,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(901,95,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(902,95,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(903,95,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(904,95,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(905,95,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(906,95,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(907,95,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(908,95,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(909,95,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(910,95,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(911,95,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(912,95,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(913,96,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(914,96,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(915,96,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(916,96,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(917,96,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(918,96,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(919,96,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(920,96,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(921,96,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(922,96,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(923,96,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(924,96,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(925,96,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(926,96,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(927,96,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(928,96,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(929,97,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(930,97,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(931,97,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(932,97,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(933,97,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(934,97,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(935,97,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(936,97,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(937,97,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(938,97,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(939,97,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(940,97,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(941,97,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(942,97,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(943,97,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(944,97,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(945,98,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(946,98,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(947,98,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(948,98,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(949,98,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(950,98,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(951,98,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(952,98,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(953,98,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(954,98,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(955,98,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(956,98,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(957,98,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(958,98,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(959,98,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(960,98,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(973,101,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(974,101,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(975,101,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(976,101,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(977,101,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(978,101,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(979,101,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(980,101,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(981,101,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(982,101,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(983,101,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(984,101,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(992,110,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(993,110,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(994,110,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(995,110,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(996,110,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(997,110,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(998,110,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(999,110,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1000,110,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1001,110,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1002,110,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1003,110,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1004,110,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1005,110,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1006,111,1,16,100.0000,'+',10,0,0,'+',0,0,1,'attributes/color_red.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1007,111,1,25,50.0000,'+',20,0,0,'+',0,0,1,'attributes/color_orange.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1008,111,1,17,75.0000,'+',30,0,0,'+',0,0,1,'attributes/color_yellow.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1009,111,2,21,50.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1010,111,2,20,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1011,111,2,18,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1012,111,13,35,75.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1013,111,13,34,100.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1014,111,13,36,40.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1015,111,1,26,40.0000,'+',40,0,0,'+',0,0,1,'attributes/color_green.gif',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1016,111,2,19,40.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1017,111,13,47,50.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1018,111,13,48,0.0000,'+',5,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1019,111,15,49,0.0000,'+',20,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1020,111,15,50,0.0000,'+',30,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1021,111,15,51,0.0000,'+',10,0,0,'+',0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.0000,0,0.0000,0,0),(1027,131,1,16,5.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1028,131,1,26,5.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1025,131,10,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0500,0,0.0000,0,1),(1029,131,1,17,5.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1030,131,9,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0500,3,0.0000,0,1),(1031,132,16,53,14.4500,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1032,132,16,54,14.4500,'+',40,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1033,132,16,55,14.4500,'+',50,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1034,132,16,56,14.4500,'+',60,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1035,132,16,57,14.4500,'+',90,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1036,132,16,58,14.4500,'+',200,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1037,132,16,61,14.4500,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1038,132,16,59,14.4500,'+',70,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1039,132,16,60,14.4500,'+',80,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1040,133,5,10,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1041,133,17,62,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1042,133,17,63,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1043,133,5,64,0.0000,'+',100,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1044,133,5,52,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1045,134,10,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0200,0,1),(1046,134,1,16,5.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1047,134,1,26,5.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1048,134,1,17,5.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,1),(1049,134,9,0,0.0000,'+',0,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0200,3,1),(1050,154,18,65,0.0000,'+',10,0,0.25,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1051,154,18,66,1.5000,'+',20,0,0.75,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1052,155,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,1.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1053,155,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,2.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1054,155,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,3.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1055,156,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,1.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1056,156,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,2.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1057,156,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,3.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1058,157,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,1.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1059,157,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,2.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1060,157,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,3.0000,1.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1061,158,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,5.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1062,158,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,10.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1063,158,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,15.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1064,159,1,16,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'1:11,3:10.00,6:9.00,9:8.00,12:7.00,15:6.00','',0.0000,0,0.0000,0,0),(1065,159,1,26,0.0000,'+',40,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'3:11.00,6:10.00,9:9.00,12:8.00,15:7.00','',0.0000,0,0.0000,0,0),(1066,159,1,17,0.0000,'+',30,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'3:10.50,6:9.50,9:8.50,12:7.50,15:6.50','',0.0000,0,0.0000,0,0),(1071,160,16,55,14.4500,'+',50,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1070,160,16,54,14.4500,'+',40,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1069,160,16,53,14.4500,'+',30,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1072,160,16,56,14.4500,'+',60,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1073,160,16,57,14.4500,'+',90,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1074,160,16,58,14.4500,'+',200,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1075,160,16,61,14.4500,'+',20,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1076,160,16,59,14.4500,'+',70,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1077,160,16,60,14.4500,'+',80,0,1,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1090,165,18,65,0.0000,'+',10,0,0.25,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1091,165,18,66,1.5000,'+',20,0,0.75,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1088,171,17,63,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1089,171,17,62,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1092,172,19,67,0.0000,'+',10,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1093,173,5,10,20.0000,'',10,0,0,'+',0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1094,173,5,64,20.0000,'',100,0,0,'+',0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1095,173,5,68,52.5000,'',5,0,1,'',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1096,175,1,16,100.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1097,175,1,26,100.0000,'+',40,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1098,178,1,16,100.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1099,178,1,26,100.0000,'+',40,0,0,'+',0,0,0,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1100,179,17,63,0.0000,'+',20,0,0,'+',0,0,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0),(1103,179,17,62,0.0000,'+',10,0,0,'+',0,1,1,'',1,0.0000,0.0000,0.0000,0.0000,0.0000,'','',0.0000,0,0.0000,0,0);
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes_download`
--

LOCK TABLES `products_attributes_download` WRITE;
/*!40000 ALTER TABLE `products_attributes_download` DISABLE KEYS */;
INSERT INTO `products_attributes_download` VALUES (26,'unreal.zip',7,3),(1040,'test.zip',7,5),(1041,'test2.zip',7,5),(1042,'test2.zip',7,5),(1043,'test.zip',7,5),(1044,'test.zip',7,5),(1088,'ms_word_sample.zip',7,5),(1089,'pdf_sample.zip',7,5),(1093,'test.zip',7,5),(1094,'test2.zip',7,5),(1100,'ms_word_sample.zip',7,5),(1103,'pdf_sample.zip',7,5);
/*!40000 ALTER TABLE `products_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (1,1,'Matrox G200 MMS','Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.','www.matrox.com/mga/products/g200_mms/home.cfm',0),(2,1,'Matrox G400 32MB','Dramatically Different High Performance Graphics<br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br />Key features:<ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>','www.matrox.com/mga/products/mill_g400/home.htm',0),(3,1,'Microsoft IntelliMouse Pro','Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.','www.microsoft.com/hardware/mouse/intellimouse.asp',0),(4,1,'The Replacement Killers','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.replacement-killers.com',0),(5,1,'Blade Runner - Director\'s Cut Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.bladerunner.com',0),(6,1,'The Matrix Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch.\r\n<br />\r\nAudio: Dolby Surround.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 131 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Making Of.','www.thematrix.com',0),(7,1,'You\'ve Got Mail Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch, Spanish. <br />Subtitles: English, Deutsch, Spanish, French, Nordic, Polish. <br />Audio: Dolby Digital 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 115 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.youvegotmail.com',0),(8,1,'A Bug\'s Life Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Digital 5.1 / Dolby Surround Stereo. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 91 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0),(9,1,'Under Siege Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 98 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(10,1,'Under Siege 2 - Dark Territory','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(11,1,'Fire Down Below Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(12,1,'Die Hard With A Vengeance Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 122 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(13,1,'Lethal Weapon Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(14,1,'Red Corner Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 117 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(15,1,'Frantic Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 115 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(16,1,'Courage Under Fire Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(17,1,'Speed Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(18,1,'Speed 2: Cruise Control','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 120 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(19,1,'There\'s Something About Mary Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 114 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(20,1,'Beloved Linked','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 164 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0),(21,1,'SWAT 3: Close Quarters Battle Linked','Windows 95/98<br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and &quot;When needed&quot; to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!','www.swat3.com',0),(22,1,'Unreal Tournament Linked','From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.','www.unrealtournament.net',0),(23,1,'The Wheel Of Time Linked','The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.','www.wheeloftime.com',0),(24,1,'Disciples: Sacred Lands Linked','A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.','',0),(25,1,'Microsoft Internet Keyboard PS/2','The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!','',0),(26,1,'Microsoft IntelliMouse Explorer','Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!','www.microsoft.com/hardware/mouse/explorer.asp',0),(27,1,'Hewlett Packard LaserJet 1100Xi Linked','HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(28,1,'Gift Certificate $  5.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(29,1,'Gift Certificate $ 10.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(30,1,'Gift Certificate $ 25.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(31,1,'Gift Certificate $ 50.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(32,1,'Gift Certificate $100.00','Purchase a Gift Certificate today to share with your family, friends or business associates!','',0),(34,1,'A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition','A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition\r\n<br />\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Digital 5.1 / Dolby Surround Stereo.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 91 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0),(36,1,'Hewlett Packard - by attributes SALE','The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(57,1,'A Free Product - All','This is a free product where there are no prices at all.\r\n<br /><br />\r\n\r\nThe Always Free Shipping is also turned ON.\r\n<br /><br />\r\n\r\nIf this is bought separately, the Zen Cart Free Charge payment module will show if there is no charges on shipping.\r\n<br /><br />\r\n\r\nIf other products are purchased with a price or shipping charge, then the Zen Cart Free Charge payment module will not show and the shipping will be applied accordingly.','',0),(101,1,'TEST $120 Sale 10% Special off','Product is Priced by Attributes.\r\n<br /><br />\r\n\r\nAttribute Option Group: Color and Size are used for pricing by marking these as Included in Base Price.\r\n<br /><br />\r\n\r\nGift Options has everything marked included in base price also, but because None is set to $0.00 that groups lowest price is $0.00 so it is not affecting the Base Price.\r\n<br /><br />\r\n\r\nIf None was not part of this group and you did not want to include those prices, you would mark all of the Gift Option Attributes to NOT be included in the Base Price.\r\n<br /><br />\r\n\r\nProduct Product is $0.00\r\n<br /><br />\r\n\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(100,1,'Hewlett Packard - by attributes SALE with Special','The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(39,1,'A Free Product','This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nWhile this is a FREE product, this does have Shipping.','',0),(40,1,'A Call for Price Product','This is a Call for Price product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />','',0),(41,1,'A Call for Price Product SALE','This is a Call for Price product that is also on special and has a Sale price via Sale Maker.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons automatically change to Call for Price, which is defined as: TEXT_CALL_FOR_PRICE\r\n<br /><br />\r\n\r\nThis link will take the customer to the Contact Us page.\r\n<br /><br />','',0),(42,1,'A Free Product - SALE','This is a free product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br />','',0),(43,1,'A Free Product with Attributes','This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nAttributes can be added that can optionally be set to free or not free\r\n<br /><br />\r\n\r\nThe Color Red attribute is priced at $5.00 but marked as a Free Attribute when the Product is Free\r\n<br /><br />\r\n\r\nThe Size Medium attribute is priced at $1.00 but marked as a Free Attribute when Product is Free','',0),(44,1,'A Mixed OFF Product with Attributes','This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is OFF this means you CANNOT mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nThe Size Option Value: Select from Below ... is a Display Only Attribute. \r\n<br /><br />\r\n\r\nThis means that the product cannot be added to the Shopping Cart if that Option Value is selected. If it is still selected, then an error is triggered when the Add to Cart is pressed with a warning to the customer on what the error is.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.','',0),(46,1,'A Mixed ON Product with Attributes','This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is ON this means you CAN mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nSelect from Below is a Display Only Attribute. This means that it cannot be added to the cart. If it is, then an error is triggered.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.','',0),(47,1,'Gift Certificates by attributes','Priced by Attributes Gift Certificates.','',0),(48,1,'Test 1','This is a test product for copying and deleting attributes.\r\n<br /><br />\r\nAll of the images for this product are in the main /images directory and /large directory.\r\n<br /><br />\r\nThe main products_image is called 1_small.jpg\r\n<br /><br />\r\nThere are additional images for this product that will auto load located in /images called:<br />\r\n1_small_01.jpg<br />\r\n1_small_02.jpg<br />\r\n1_small_03.jpg<br />\r\n<br />\r\nThe large additional images are in /images/large called:<br />\r\n1_small_01_LRG.jpg<br />\r\n1_small_02_LRG.jpg<br />\r\n1_small_03_LRG.jpg<br />\r\n\r\n<br /><br />\r\n\r\nThe naming conventions for the additional images do not require that they be numeric. Using the numberic system helps establish the sort order of the images and how they will display.\r\n<br /><br />\r\n\r\nWhat is important is that all the additional images be located in the same directory and start with the same name: 1_small and end in the same extenion: .jpg\r\n<br /><br />\r\n\r\nThe additional large images need to be located in the /large directory and use the same name plus the Large image suffix, defined in the Admin ... Images ... in this case _LRG\r\n<br /><br />','',0),(49,1,'Test 2','This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the Attributes from the Test 1 product to Test 2.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does have a Large image located in /large\r\n<br /><br />\r\n\r\nThis uses the same name: 2_small plus the large image suffix _LRG plus the matching extension .jpg to give the new name: /images/large/2_small_LRG.jpg\r\n<br /><br />','',0),(50,1,'Test 3','This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the attributes from the Test 2 product to Test 3.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does NOT have a Large image located in /large\r\n<br /><br />\r\n\r\nThis means that when you click on the image for enlarge, unless the original image is larger than the small image settings you will see the same image in the popup.\r\n<br /><br />','',0),(51,1,'Free Ship & Payment Virtual weight 10','Free Shipping and Payment\r\n<br /><br />\r\n\r\nThe Price is set to 25.00 ... but what makes it Free is that this product has been marked as:\r\n<br />\r\nProduct is Free: Yes\r\n<br /><br />\r\n\r\nThis would allow the product to be listed with a price, but the actual charge is $0.00\r\n<br /><br />\r\n\r\nThe weight is set to 10 but could be set to 0. What really makes it truely Free Shipping is that it has been marked to be Always Free Shipping.\r\n<br /><br />\r\n\r\nAlways Free shipping is set to: Yes<br />\r\nThis will not charge for shipping, but requres a shipping address.\r\n<br /><br />\r\n\r\nBecause there is no shipping and the price is 0, the Zen Cart Free Charge comes up for the payment module and the other payment modules vanish.\r\n<br /><br />\r\n\r\nYou can change the text on the Zen Cart Free Charge module to read as you would prefer.\r\n<br /><br />\r\n\r\nNote: if you add products that incur a charge or shipping charge, then the Zen Cart Free Charge payment module will vanish and the regular payment modules will show.','',0),(52,1,'Free Ship & Payment Virtual','Product Price is set to 0\r\n<br /><br />\r\n\r\nPayment weight is set to 2 ...\r\n<br /><br />\r\n\r\nVirtual is ON ... this will skip shipping address\r\n<br /><br />','',0),(53,1,'Min and Units MIX','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON','',0),(54,1,'Min and Units NOMIX','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF','',0),(55,1,'Min and Units MIX - Sale','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON\r\n<br /><br />\r\n\r\nThis product has been placed on Sale via Sale Maker','',0),(56,1,'Min and Units NOMIX - Sale','This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF\r\n<br /><br />\r\n\r\nThis product has been put on Sale via Sale Maker.','',0),(59,1,'Hewlett Packard - by attributes','The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(60,1,'Hewlett Packard - Sale with Attributes on Sale','The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked to be discounted also.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(61,1,'Hewlett Packard - Sale with Attributes NOT on Sale','The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked NOT to be discounted.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(111,1,'TEST $120 Special $90.00 Sale -$5.00 Skip','Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25% - Specials are Skipped\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(110,1,'TEST $120 Sale -$5.00 Skip','Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\nSpecials are skipped\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(109,1,'Hide Quantity Box Methods','This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nWhile Quantity Box Shows is set to YES, the Product Qty Max has been set to 1\r\n\r\nThis will add only 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nThe reason for this is that this is a download. As a download, there is never a reason to allow more than quantity 1 to be ordered.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nTwo methods are available to trigger the Hide Quantity Box.\r\n<br /><br />\r\n\r\nMethod 1: Set Quantity Box Shows to NO\r\n<br /><br />\r\n\r\nMethod 2: Set Qty Maximum to 1\r\n<br /><br />\r\n\r\nIn either case, you will only be able to add qty 1 to the shopping cart and the quantity box will not show.\r\n<br /><br />','',0),(133,1,'Multiple Downloads','<p>This product is set up to have multiple downloads.</p><p>The Product Price is $49.99</p><p>The attributes are setup with two Option Names, one for each download to allow for two downloads at the same time.</p><p>The first Download is listed under:</p><p>Option Name: Version<br />Option Value: Download Windows - English<br />Option Value: Download Windows - Spanish<br />Option Value: DownloadMAC - English<br /></p><p>The second Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value:MS Word- English</p>','',0),(134,1,'Per letter - required','<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter with 3 letters free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>','',0),(74,1,'Hewlett Packard - by attributes with Special% no SALE','The Product Price is set to 0.00 Special is set to 20%\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are, their prices before the Special discount is applied:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00\r\n<br /><br />\r\n\r\nThe Specials Price is a flat $100 discount. This $100 discount is applied to all attributes marked attributes_discounted Yes.','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0),(130,1,'Special Product','<p>This is a Special product priced at $15 with a $10 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(131,1,'Per word - required','<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word with 3 words Free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>','',0),(132,1,'Golf Clubs','<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>','',0),(85,1,'TEST $120 Special $90','Product is $120\r\n<br /><br />\r\n\r\nThere is a $90.00 or 25% Special and no sale on this product.\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(78,1,'TEST 25% special 10% Sale Attribute Priced','Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />','',0),(79,1,'TEST 25% Special Attribute Priced','Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />','',0),(80,1,'TEST 25% Special','Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />','',0),(84,1,'TEST $120','Product is $120\r\n<br /><br />\r\n\r\nThere is no special and no sale on this product.\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75<br />\r\n- Green $40\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nX-Small $40.00<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- None<br /> \r\n- Embossed Collector\'s Tin $40.00<br />\r\n- Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nFeatures: <br />\r\nQuality Design<br />\r\nCustom Handling<br />\r\nSame Day Shipping<br />\r\n<br /><br />\r\n\r\nNOTE: Select from below ... is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\n\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\n\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />\r\n\r\nNOTE: None is similar to Display Only, but this can be used when for when no option value is required.\r\n<br /><br />\r\n\r\nIts value is set the value to $0.00 and it is NOT marked Display Only. \r\n<br /><br />\r\n\r\nBecause its value is $0.00 if included in the Attributes Based Price on products Priced by Attributes, this Options group would not have any value included in the calculated price.\r\n<br /><br />\r\n\r\nNOTE: The Option Name: Featured is a READ ONLY Option Type\r\n<br /><br />\r\nRead-only attributes can be used to display repetitive information or any property that occurs on multiple products and are set up like any other type of attribute. They do not get added to the Shopping Cart and are not included in any order\'s information. When using the \"Attribute Controller\", each read-only attribute should have its Base Price button set to off.\r\n<br /><br />','',0),(82,1,'TEST $120 Sale -$5.00','Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(83,1,'TEST $120 Special $90.00 Sale -$5.00','Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25%\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(76,1,'TEST 25% special 10% Sale','Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />','',0),(106,1,'A Maximum Sample of 3','This product only allows Quantity 1 because the Products Qty Maximum is set to 3.\r\n<br /><br />\r\n\r\nThis means there will be a Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 3 to the Shopping Cart.\r\n<br /><br />','',0),(104,1,'Hide Quantity Box','This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nThis will add 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nBecause the Image name is: 1_small.jpg<br />\r\nand stored in the /images directory ...\r\n<br /><br />\r\n\r\nThe other matching images will show:\r\n<br /><br />\r\n/images/1_small_00.jpg<br />\r\n/images/1_small_02.jpg<br />\r\n/images/1_small_03.jpg\r\n<br /><br />\r\n\r\nThe matching large images from /images/large will show:\r\n<br /><br />\r\n/images/large/1_small_00_LRG.jpg<br />\r\n/images/large/1_small_02_LRG.jpg<br />\r\n/images/large/1_small_03_LRG.jpg\r\n<br /><br />\r\n\r\nA matching image must begin with the same exact name as the Product Image and end in the same extension.\r\n<br /><br />\r\n\r\nThese will then auto load.\r\n<br /><br />','',0),(105,1,'A Maximum Sample of 1','This product only allows Quantity 1 because the Products Qty Maximum is set to 1.\r\n<br /><br />\r\n\r\nThis means there will be no Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 1 to the Shopping Cart.\r\n<br /><br />','',0),(88,1,'TEST $120 Sale Special $90 Skip','Product is $120\r\n<br /><br />\r\nSpecial is $105\r\n<br /><br />\r\nSale Price is $90 or 25% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(89,1,'TEST $120 Sale 10% Special off Skip','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(90,1,'TEST $120 Sale 10% Special','Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(92,1,'TEST $120 Sale 10% Special off','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(93,1,'TEST $120 Special off Sale New Price $100','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(94,1,'TEST $120 Special 25% Sale New Price $100','Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(95,1,'TEST $120 Special 25% Sale New Price $100 Skip Specials','Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(96,1,'TEST $120 Special off Sale New Price $100 Skip Specials','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(97,1,'TEST $120 Sale 10% Special - Apply to price','Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(98,1,'TEST $120 Sale 10% Special off - Apply to Price','Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />','',0),(99,1,'Free Shipping Product with Weight','This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 5\r\n<br /><br />\r\n\r\nWhile the weight is set to 5, it has the Always Free Shipping set to YES and the Free Shipping Module is installed.\r\n<br /><br />','',0),(107,1,'Free Shipping Product without Weight','This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 0\r\n<br /><br />\r\n\r\nIt has the Always Free Shipping set to NO and the Free Shipping Module is installed but it will still ship for Free.\r\n<br /><br />\r\n\r\nIn the Configruation settings for Shipping/Packaging ... Order Free Shipping 0 Weight Status has been defined to be Free Shipping.\r\n<br /><br />\r\n\r\nNOTE: if that setting is changed, then this product will NOT ship for free, even though the weight is set to 0.\r\n<br /><br />','',0),(108,1,'A Sold Out Product','This product is Sold Out because the product quantity is <= 0\r\n<br /><br />\r\n\r\nBecause the Configuration Settings in Stock are defined that Sold Out Products are not disabled and Sold Out cannot be purchased, the add to cart buttons are changed to either the large or small Sold Out image.\r\n<br /><br />\r\n\r\nIf you change the Configuration Settings in Stock, then you will be able to purchase this product, even though it is Sold Out.\r\n<br /><br />','',0),(112,1,'Test Two','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(113,1,'Test Four','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(114,1,'Test Five','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(115,1,'Test One','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(116,1,'Test Eight','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(117,1,'<strong>Test<br /> Three</strong>','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(118,1,'Test Ten','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(119,1,'Test Six','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(120,1,'Test Seven','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(121,1,'Test Twelve','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(122,1,'Test Nine','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(123,1,'Test Eleven','This is a test product to fill this category with more 12 randomly entered products to invoke the split page results on products that are not linked, have no specials, sales, etc.','',0),(127,1,'Normal Product','<p>This is a normal product priced at $15</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(154,1,'Rope','<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>','',0),(155,1,'Price Factor','<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor</p><p>Red is $10<br />Yellow is $20<br />Green is $30</p><p>This makes the total price $10 + the price factor of the attribute.</p>','',0),(156,1,'Price Factor Offset','<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor and Price Factor Offset</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price $10 + the price factor * $10 - price factor offset * $10 for the attributes.</p>','',0),(157,1,'Price Factor Offset by Attribute','<p>This product is priced at $10.00</p><p>It is marked Price by Attributes.</p><p>The attributes are priced using the Price Factor and Price Factor Offset. </p><p>The actual Product Price is used just to compute the Price Factor.</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price the price factor * $10 - price factor offset * $10 for the attributes.</p>','',0),(158,1,'One Time Charge','<p>This product is $45 with a one time charge set on the colors.</p><p>Red $5<br />Yellow is $10<br />Green is $15</p>','',0),(159,1,'Attribute Quantity Discount','<p>Attribute qty discounts are attribute prices based on qty ordered.</p><p>Enter them as: </p><p>Red:<br />3:10.00,6:9.00,9:8.00,12:7.00,15:6.00</p><p>Yellow<br />3:10.50,6:9.50,9:8.50,12:7.50,15:6.50</p><p>Green:<br />3:11.00,6:10.00,9:9.00,12:8.00,15:7.00</p><p>A table will also show on the page to display these discounts as well as an indicator that qty discounts are available.</p>','',0),(160,1,'Golf Clubs','<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>','',0),(165,1,'Rope','<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>','',0),(166,1,'Russ Tippins Band - The Hunter','','',0),(167,1,'Test Document','This is a test document','',0),(168,1,'Sample of Product General Type','Product General Type are your regular products.\r\n\r\nThere are no special needs or layout issues to work with.','',0),(169,1,'Sample of Product Music Type','The Product Music Type is specially designed for music media.\r\n\r\nThis can offer a lot more flexibility than the Product General.','',0),(170,1,'Sample of Document General Type','Document General Type is used for Products that are actually Documents.\r\n\r\nThese cannot be added to the cart but can be configured for the Document Sidebox. If your Document Sidebox is not showing, go to the Layout Controller and turn it on for your template.','',0),(171,1,'Sample of Document Product Type','Document Product Type is used for Documents that are also available for sale. <br /><br />You might wish to display brief peices of the Document then offer it for sale. <br /><br />This Product Type is also handy for downloadable Documents or Documents available either on CD or by download. <br /><br />The Document Product Type could be used in the Document Sidebox or the Categories Sidebox depending on how you configure its master categories id. <br /><br />This product has also been added as a linked product to the Document Category. This will allow it to show in both the Category and Document Sidebox. While not marked specifically for the master product type id related to the Product Types, it now is in a Product Type set for Document General so it will show in both boxes.','',0),(172,1,'Sample of Product Free Shipping Type','<p>Product Free Shipping can be setup to highlight the Free Shipping aspect of the product. <br /><br />These pages include a Free Shipping Image on them. <br /><br />You can define the ALWAYS_FREE_SHIPPING_ICON in the language file. This can be Text, Image, Text/Image Combo or nothing. <br /><br />The weight does not matter on Always Free Shipping if you set Always Free Shipping to Yes. <br /><br />Be sure to have the Free Shipping Module Turned on! Otherwise, if this is the only product in the cart, it will not be able to be shipped. <br /><br />Notice that this is defined with a weight of 5lbs. But because of the Always Free Shipping being set to Y there will be no shipping charges for this product. <br /><br />You do not have to use the Product Free Shipping product type just to use Always Free Shipping. But the reason you may want to do this is so that the layout of the Product Free Shipping product info page can be layout specifically for the Free Shipping aspect of the product. <br /><br />This includes a READONLY attribute for Option Name: Shipping and Option Value: Free Shipping Included. READONLY attributes do not show on the options for the order.</p>','',0),(173,1,'Book','This Book is sold as a Book that is shipped to the customer or as a Download.<br /><br />\r\n\r\nOnly the Book itself is on Special. The Downloadable versions are not on Special.<br /><br />\r\n\r\nThis Book under Categories/Products is set to:<br /><br />\r\n\r\nProduct Priced by Attributes: Yes<br />\r\nProducts Price: 0.00<br />\r\nWeight: 0<br /><br />\r\n\r\nAn Option Name of: Version (type is dropdown)<br /><br />\r\nOption Values of: Book Hard Cover<br /><br />\r\nDownload: MAC English<br /><br />\r\nDownload: Windows English<br /><br />\r\n\r\nThe Attributes are set as:<br />\r\nOption Name: Version<br />\r\nOption Value: Book Hard Cover<br />\r\nPrice Prefix is blank<br />\r\nPrice: 52.50<br />\r\nWeight Prefix is blank\r\nWeight: 1<br />\r\nInclude in Base Price When Priced by Attributes Yes<br />\r\nApply Discounts Used by Product Special/Sale: Yes<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: MAC English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: Windows: English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0<br />\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nIt is on Special for $47.50<br /><br />','',0),(174,1,'A Call No Price','This is a Call for Price product with no price<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />','',0),(175,1,'Qty Discounts by 1','<p>This is a normal product priced at $60</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>','',0),(176,1,'Normal Product by the dozen','<p>This is a normal product priced at $100</p><p>There are quantity discounts setup which will be discounted from the Products Price by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(177,1,'Special Product by the dozen','<p>This is a Special product priced at $100 with a $75 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price discounted by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>','',0),(178,1,'Qty Discounts by 1 Special','<p>This is a normal product priced at $60 with a special of $50</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>','',0),(179,1,'Single Download','<p>This product is set up to have a single download.</p><p>The Product Price is $39.99</p><p>The attributes are setup with 1 Option Name, for the download to allow for one download but of various types.</p><p>The Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value: MS Word - English</p>','',0);
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_discount_quantity`
--

DROP TABLE IF EXISTS `products_discount_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_discount_quantity`
--

LOCK TABLES `products_discount_quantity` WRITE;
/*!40000 ALTER TABLE `products_discount_quantity` DISABLE KEYS */;
INSERT INTO `products_discount_quantity` VALUES (4,127,12,10.0000),(3,127,9,8.0000),(2,127,6,7.0000),(1,8,3,10.0000),(1,127,3,5.0000),(4,130,12,10.0000),(3,130,9,8.0000),(2,130,6,7.0000),(1,130,3,5.0000),(9,175,9,10.0000),(8,175,8,9.0000),(7,175,7,8.0000),(6,175,6,7.0000),(5,175,5,6.0000),(4,175,4,5.0000),(3,175,3,4.0000),(2,175,2,3.0000),(1,175,10,11.0000),(3,178,3,4.0000),(2,178,2,3.0000),(1,178,10,11.0000),(6,177,36,30.0000),(5,176,48,30.0000),(4,176,36,20.0000),(3,176,24,10.0000),(2,176,12,5.0000),(1,176,60,40.0000),(5,177,24,20.0000),(4,177,12,10.0000),(3,177,6,5.0000),(2,177,60,50.0000),(1,177,48,40.0000),(4,178,4,5.0000),(5,178,5,6.0000),(6,178,6,7.0000),(7,178,7,8.0000),(8,178,8,9.0000),(9,178,9,10.0000);
/*!40000 ALTER TABLE `products_discount_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_notifications`
--

LOCK TABLES `products_notifications` WRITE;
/*!40000 ALTER TABLE `products_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(255) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options`
--

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;
INSERT INTO `products_options` VALUES (1,1,'Color',10,2,32,'',32,5,0,1),(2,1,'Size',20,0,32,'',32,5,0,1),(3,1,'Model',30,0,32,'',32,5,0,1),(4,1,'Memory',50,0,32,'',32,5,0,1),(5,1,'Version',40,0,32,'',32,5,0,1),(6,1,'Media Type',60,0,32,'',32,5,0,1),(17,1,'Documentation',45,0,32,NULL,32,5,0,1),(16,1,'Irons',800,3,32,'',32,5,0,1),(7,1,'Logo Back',310,4,64,'',32,5,0,1),(8,1,'Logo Front',300,4,64,'You may upload your own image file(s)',32,5,0,1),(9,1,'Line 2',410,1,64,'',40,5,0,1),(10,1,'Line 1',400,1,64,'Enter your text up to 64 characters, punctuation and spaces',40,5,0,1),(11,1,'Line 3',420,1,64,'',40,5,0,1),(12,1,'Line 4',430,1,64,'',40,5,0,1),(13,1,'Gift Options',70,3,32,'Special Option Options Available:',32,5,0,1),(14,1,'Amount',200,2,32,'',32,5,0,1),(15,1,'Features',700,5,32,'&nbsp;',32,5,0,1),(18,1,'Length',70,0,32,'',32,5,0,1),(19,1,'Shipping',600,5,32,'',32,0,0,1);
/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_types`
--

DROP TABLE IF EXISTS `products_options_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Track products_options_types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_types`
--

LOCK TABLES `products_options_types` WRITE;
/*!40000 ALTER TABLE `products_options_types` DISABLE KEYS */;
INSERT INTO `products_options_types` VALUES (0,'Dropdown'),(1,'Text'),(2,'Radio'),(3,'Checkbox'),(4,'File'),(5,'Read Only');
/*!40000 ALTER TABLE `products_options_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values`
--

LOCK TABLES `products_options_values` WRITE;
/*!40000 ALTER TABLE `products_options_values` DISABLE KEYS */;
INSERT INTO `products_options_values` VALUES (0,1,'TEXT',0),(1,1,'4 mb',10),(2,1,'8 mb',20),(3,1,'16 mb',30),(4,1,'32 mb',40),(5,1,'Value',10),(6,1,'Premium',20),(7,1,'Deluxe',30),(8,1,'PS/2',20),(9,1,'USB',10),(10,1,'Download: Windows - English',10),(13,1,'Box: Windows - English',1000),(14,1,'DVD/VHS Combo Pak',30),(15,1,'Blue',50),(16,1,'Red',10),(17,1,'Yellow',30),(18,1,'Medium',30),(63,1,'MS Word - English',20),(19,1,'X-Small',10),(62,1,'PDF - English',10),(61,1,'2 Iron',20),(20,1,'Large',40),(60,1,'8 Iron',80),(59,1,'7 Iron',70),(21,1,'Small',20),(58,1,'Wedge',200),(57,1,'9 Iron',90),(22,1,'VHS',20),(23,1,'DVD',10),(56,1,'6 Iron',60),(55,1,'5 Iron',50),(24,1,'20th Century',10),(54,1,'4 Iron',40),(53,1,'3 Iron',30),(25,1,'Orange',20),(26,1,'Green',40),(27,1,'Purple',60),(28,1,'Brown',70),(29,1,'Black',80),(30,1,'White',90),(31,1,'Silver',100),(32,1,'Gold',110),(64,1,'Download: MAC - English',100),(34,1,'Wrapping',40),(35,1,'Autographed Memorabilia Card',30),(36,1,'Collector\'s Tin',20),(37,1,'Select from below ...',5),(38,1,'$5.00',5),(39,1,'$10.00',10),(40,1,'$25.00',25),(41,1,'$15.00',15),(42,1,'$50.00',50),(43,1,'$100.00',100),(44,1,'Select from below ...',5),(45,1,'NONE',5),(46,1,'None',5),(47,1,'Embossed Collector\'s Tin',10),(49,1,'Custom Handling',20),(48,1,'None',5),(50,1,'Same Day Shipping',30),(51,1,'Quality Design',10),(52,1,'Download: Windows - Spanish',20),(65,1,'per Foot',10),(66,1,'per Yard',20),(67,1,'Free Shipping Included!',10),(68,1,'Book Hard Cover',5);
/*!40000 ALTER TABLE `products_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values_to_products_options`
--

LOCK TABLES `products_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `products_options_values_to_products_options` DISABLE KEYS */;
INSERT INTO `products_options_values_to_products_options` VALUES (1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,5,10),(13,5,13),(14,6,14),(15,1,15),(16,1,16),(17,1,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,6,22),(23,6,23),(24,5,24),(61,8,0),(60,7,0),(59,12,0),(58,11,0),(57,10,0),(56,9,0),(35,1,25),(36,1,26),(37,1,27),(38,1,28),(39,1,29),(40,1,30),(41,1,31),(42,1,32),(89,5,64),(55,13,36),(54,13,35),(53,13,34),(62,2,37),(63,14,38),(64,14,39),(65,14,40),(66,14,41),(67,14,42),(68,14,43),(69,13,44),(70,1,45),(71,4,46),(72,13,47),(73,13,48),(74,15,49),(75,15,50),(76,15,51),(77,5,52),(78,16,53),(79,16,54),(80,16,55),(81,16,56),(82,16,57),(83,16,58),(84,16,59),(85,16,60),(86,16,61),(87,17,62),(88,17,63),(90,18,65),(91,18,66),(92,19,67),(93,5,68);
/*!40000 ALTER TABLE `products_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_to_categories`
--

LOCK TABLES `products_to_categories` WRITE;
/*!40000 ALTER TABLE `products_to_categories` DISABLE KEYS */;
INSERT INTO `products_to_categories` VALUES (1,4),(2,4),(3,9),(4,10),(5,11),(5,22),(6,10),(6,22),(7,12),(7,22),(8,13),(8,22),(9,10),(9,22),(10,10),(11,10),(11,22),(12,10),(12,22),(13,10),(13,22),(14,15),(14,22),(15,14),(15,22),(16,15),(16,22),(17,10),(17,22),(18,10),(19,12),(19,22),(20,15),(20,22),(21,18),(21,22),(22,19),(22,22),(23,20),(23,22),(24,20),(24,22),(25,8),(26,9),(27,5),(27,22),(28,21),(29,21),(30,21),(31,21),(32,21),(34,22),(36,25),(39,24),(40,24),(41,28),(42,28),(43,24),(44,22),(46,22),(47,21),(48,23),(49,23),(50,23),(51,24),(52,24),(53,23),(54,23),(55,28),(56,28),(57,24),(59,23),(60,28),(61,28),(74,23),(76,28),(78,25),(79,23),(80,23),(82,27),(83,27),(84,23),(85,23),(88,31),(89,31),(90,45),(92,45),(93,46),(94,46),(95,51),(96,51),(97,32),(98,32),(99,23),(100,25),(101,47),(104,23),(105,22),(106,22),(107,23),(108,23),(109,23),(110,52),(111,52),(112,53),(113,53),(114,53),(115,53),(116,53),(117,53),(118,53),(119,53),(120,53),(121,53),(122,53),(123,53),(127,55),(130,55),(131,57),(132,58),(133,60),(134,57),(154,58),(155,56),(156,56),(157,56),(158,56),(159,56),(160,61),(165,61),(166,62),(167,63),(168,64),(169,64),(170,64),(171,63),(171,64),(172,64),(173,61),(174,24),(175,55),(176,55),(177,55),(178,55),(179,60);
/*!40000 ALTER TABLE `products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_version`
--

DROP TABLE IF EXISTS `project_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Database Version Tracking';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_version`
--

LOCK TABLES `project_version` WRITE;
/*!40000 ALTER TABLE `project_version` DISABLE KEYS */;
INSERT INTO `project_version` VALUES (1,'Zen-Cart Main','1','5.6c','','','','','New Installation-v156c','2020-04-03 08:32:41'),(2,'Zen-Cart Database','1','5.6','','','','','New Installation-v156c','2020-04-03 08:32:41');
/*!40000 ALTER TABLE `project_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_version_history`
--

DROP TABLE IF EXISTS `project_version_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Database Version Tracking History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_version_history`
--

LOCK TABLES `project_version_history` WRITE;
/*!40000 ALTER TABLE `project_version_history` DISABLE KEYS */;
INSERT INTO `project_version_history` VALUES (1,'Zen-Cart Main','1','5.6c','','New Installation-v156c','2020-04-03 08:32:41'),(2,'Zen-Cart Database','1','5.6','','New Installation-v156c','2020-04-03 08:32:41');
/*!40000 ALTER TABLE `project_version_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_builder`
--

DROP TABLE IF EXISTS `query_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Stores queries for re-use in Admin email and report modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_builder`
--

LOCK TABLES `query_builder` WRITE;
/*!40000 ALTER TABLE `query_builder` DISABLE KEYS */;
INSERT INTO `query_builder` VALUES (1,'email','All Customers','Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).','select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address',''),(2,'email,newsletters','All Newsletter Subscribers','Returns name and email address of newsletter subscribers','select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'',''),(3,'email,newsletters','Dormant Customers (>3months) (Subscribers)','Subscribers who HAVE purchased something, but have NOT purchased for at least three months.','select max(o.date_purchased) as date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address, c.customers_lastname, c.customers_firstname HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC',''),(4,'email,newsletters','Active customers in past 3 months (Subscribers)','Newsletter subscribers who are also active customers (purchased something) in last 3 months.','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address, c.customers_lastname, c.customers_firstname order by c.customers_lastname, c.customers_firstname ASC',''),(5,'email,newsletters','Active customers in past 3 months (Regardless of subscription status)','All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address, c.customers_lastname, c.customers_firstname order by c.customers_lastname, c.customers_firstname ASC',''),(6,'email,newsletters','Administrator','Just the email account of the current administrator','select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id',''),(7,'email,newsletters','Customers who have never completed a purchase','For sending newsletter to all customers who registered but have never completed a purchase','SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL','');
/*!40000 ALTER TABLE `query_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_artists`
--

DROP TABLE IF EXISTS `record_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_artists`
--

LOCK TABLES `record_artists` WRITE;
/*!40000 ALTER TABLE `record_artists` DISABLE KEYS */;
INSERT INTO `record_artists` VALUES (1,'The Russ Tippins Band','sooty.jpg','2004-06-01 20:53:00',NULL);
/*!40000 ALTER TABLE `record_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_artists_info`
--

DROP TABLE IF EXISTS `record_artists_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_artists_info`
--

LOCK TABLES `record_artists_info` WRITE;
/*!40000 ALTER TABLE `record_artists_info` DISABLE KEYS */;
INSERT INTO `record_artists_info` VALUES (1,1,'www.russtippins.com/',0,NULL);
/*!40000 ALTER TABLE `record_artists_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_company`
--

DROP TABLE IF EXISTS `record_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_company`
--

LOCK TABLES `record_company` WRITE;
/*!40000 ALTER TABLE `record_company` DISABLE KEYS */;
INSERT INTO `record_company` VALUES (1,'HMV Group',NULL,'2004-07-09 14:11:52',NULL);
/*!40000 ALTER TABLE `record_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_company_info`
--

DROP TABLE IF EXISTS `record_company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_company_info`
--

LOCK TABLES `record_company_info` WRITE;
/*!40000 ALTER TABLE `record_company_info` DISABLE KEYS */;
INSERT INTO `record_company_info` VALUES (1,1,'www.hmvgroup.com',0,NULL);
/*!40000 ALTER TABLE `record_company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,19,1,'Bill Smith',5,'2003-12-23 03:18:19','0001-01-01 00:00:00',11,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_description`
--

LOCK TABLES `reviews_description` WRITE;
/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
INSERT INTO `reviews_description` VALUES (1,1,'This really is a very funny but old movie!');
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salemaker_sales`
--

DROP TABLE IF EXISTS `salemaker_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(128) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salemaker_sales`
--

LOCK TABLES `salemaker_sales` WRITE;
/*!40000 ALTER TABLE `salemaker_sales` DISABLE KEYS */;
INSERT INTO `salemaker_sales` VALUES (1,0,'10% off Sale',10.0000,1,1.0000,1000.0000,2,'25,28,45,47,58',',25,28,45,47,58,','2003-12-23','2008-02-21','2003-12-23','2004-05-18','2020-04-03'),(3,0,'Mice 20%',20.0000,1,1.0000,1000.0000,2,'9',',9,','2003-12-24','2004-04-21','2003-12-31','2003-12-31','2004-04-25'),(6,1,'$5.00 off',5.0000,0,0.0000,0.0000,2,'27',',27,','0001-01-01','0001-01-01','2004-01-04','2004-01-05','2004-01-04'),(7,1,'10% Skip Specials',10.0000,1,0.0000,0.0000,1,'31',',31,','0001-01-01','0001-01-01','2004-01-04','2004-05-18','2004-01-04'),(8,1,'10% Apply to Price',10.0000,1,0.0000,0.0000,0,'32',',32,','0001-01-01','0001-01-01','2004-01-05','2004-05-18','2004-01-05'),(9,1,'New Price $100',100.0000,2,0.0000,0.0000,2,'46',',46,','0001-01-01','0001-01-01','2004-01-06','2004-01-07','2004-01-06'),(10,1,'New Price $100 Skip Special',100.0000,2,0.0000,0.0000,1,'51',',51,','0001-01-01','0001-01-01','2004-01-07','2004-01-07','2004-01-07'),(11,1,'$5.00 off Skip Specials',5.0000,0,0.0000,0.0000,1,'52',',52,','0001-01-01','0001-01-01','2004-01-24','2004-01-24','2004-01-24');
/*!40000 ALTER TABLE `salemaker_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sesskey` varchar(191) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('53dbe94898cca032e37d2876b044a5c2',1585903684,'c2VjdXJpdHlUb2tlbnxzOjMyOiI0ODZiODVkOWQzMWRmMjU1NzRmYjE4MjA0ZTQ5NTNkZiI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjs='),('9f1eaa1f635f65fb9c602b5f43b0b56b',1585903828,'c2VjdXJpdHlUb2tlbnxzOjMyOiJlZWFlMmY0NDcwMWQ2ZmQxNWVhYjVlZjZhY2FhNTIxNiI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjthZG1pbl9pZHxzOjE6IjEiOw=='),('f403fe6aa5f13c38a48d7dfbe1f6560d',1585903784,'c2VjdXJpdHlUb2tlbnxzOjMyOiJlZWFlMmY0NDcwMWQ2ZmQxNWVhYjVlZjZhY2FhNTIxNiI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjthZG1pbl9pZHxzOjE6IjEiOw==');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
INSERT INTO `specials` VALUES (1,3,39.9900,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(2,5,30.0000,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(3,6,30.0000,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(4,16,29.9900,'2003-12-23 03:18:19','0001-01-01 00:00:00','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(5,41,90.0000,'2003-12-25 19:15:47','2004-09-27 13:33:33','2008-02-21','2020-04-03 08:33:03',0,'0001-01-01'),(6,42,95.0000,'2003-12-25 19:15:57','2004-01-04 13:07:27','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(7,44,90.0000,'2003-12-25 21:54:50',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(8,46,90.0000,'2003-12-25 21:55:01',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(9,53,20.0000,'2003-12-28 23:59:03',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(10,39,75.0000,'2003-12-31 02:03:59','2004-02-21 00:36:40','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(40,100,374.2500,'2004-01-08 14:07:31',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(42,111,90.0000,'2004-01-24 16:14:19',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(14,74,399.2000,'2004-01-02 15:35:30','2004-01-02 17:38:43','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(29,78,112.5000,'2004-01-04 01:12:14',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(27,59,300.0000,'2004-01-03 01:51:50',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(28,76,75.0000,'2004-01-03 23:09:36',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(32,85,90.0000,'2004-01-04 15:19:59','2004-01-06 09:59:59','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(31,83,90.0000,'2004-01-04 15:03:07','2004-01-06 10:02:25','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(34,88,90.0000,'2004-01-05 00:16:22','2004-01-06 09:59:30','0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(35,90,90.0000,'2004-01-05 23:57:20',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(36,94,90.0000,'2004-01-06 00:07:34',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(39,97,90.0000,'2004-01-07 11:29:03',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(38,95,90.0000,'2004-01-07 02:39:58',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01'),(44,130,10.0000,'2004-04-28 02:46:44',NULL,'0001-01-01',NULL,1,'0001-01-01'),(45,173,47.5000,'2004-09-24 23:57:05',NULL,'2004-09-28','2004-09-28 18:48:42',0,'0001-01-01'),(46,166,3.0000,'2004-10-03 20:24:53',NULL,'0001-01-01',NULL,1,'0001-01-01'),(47,177,75.0000,'2004-10-05 16:49:33',NULL,'0001-01-01',NULL,1,'0001-01-01'),(48,178,50.0000,'2004-10-05 16:56:46',NULL,'0001-01-01',NULL,1,'0001-01-01'),(50,40,75.0000,'2004-01-08 14:07:31',NULL,'0001-01-01','0001-01-01 00:00:00',1,'0001-01-01');
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'Taxable Goods','The following types of products are included: non-food, services, etc',NULL,'2020-04-03 08:32:40');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (1,1,1,1,7.0000,'FL TAX 7.0%','2020-04-03 08:32:40','2020-04-03 08:32:40');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_select`
--

DROP TABLE IF EXISTS `template_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_select`
--

LOCK TABLES `template_select` WRITE;
/*!40000 ALTER TABLE `template_select` DISABLE KEYS */;
INSERT INTO `template_select` VALUES (1,'responsive_classic','0');
/*!40000 ALTER TABLE `template_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_exceptions`
--

DROP TABLE IF EXISTS `upgrade_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(128) DEFAULT NULL,
  `reason` text,
  `errordate` datetime DEFAULT NULL,
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_exceptions`
--

LOCK TABLES `upgrade_exceptions` WRITE;
/*!40000 ALTER TABLE `upgrade_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `upgrade_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(191) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whos_online`
--

LOCK TABLES `whos_online` WRITE;
/*!40000 ALTER TABLE `whos_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `whos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(7,223,'AA','Armed Forces Americas'),(9,223,'AE','Armed Forces Europe'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,163,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NL','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-WÃ¼rttemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','ThÃ¼ringen'),(95,14,'WI','Wien'),(96,14,'NO','NiederÃ¶sterreich'),(97,14,'OO','OberÃ¶sterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','KÃ¤rnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubnden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','ZÃ¼rich'),(130,195,'A CoruÃ±a','A CoruÃ±a'),(131,195,'Ãlava','Ãlava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'AlmerÃ­a','AlmerÃ­a'),(135,195,'Asturias','Asturias'),(136,195,'Ãvila','Ãvila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'CÃ¡ceres','CÃ¡ceres'),(142,195,'CÃ¡diz','CÃ¡diz'),(143,195,'Cantabria','Cantabria'),(144,195,'CastellÃ³n','CastellÃ³n'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'CÃ³rdoba','CÃ³rdoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'GuipÃºzcoa','GuipÃºzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'JaÃ©n','JaÃ©n'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'LeÃ³n','LeÃ³n'),(159,195,'LÃ©rida','LÃ©rida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'MÃ¡laga','MÃ¡laga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza'),(182,13,'ACT','Australian Capital Territory'),(183,13,'NSW','New South Wales'),(184,13,'NT','Northern Territory'),(185,13,'QLD','Queensland'),(186,13,'SA','South Australia'),(187,13,'TAS','Tasmania'),(188,13,'VIC','Victoria'),(189,13,'WA','Western Australia'),(190,105,'AG','Agrigento'),(191,105,'AL','Alessandria'),(192,105,'AN','Ancona'),(193,105,'AO','Aosta'),(194,105,'AR','Arezzo'),(195,105,'AP','Ascoli Piceno'),(196,105,'AT','Asti'),(197,105,'AV','Avellino'),(198,105,'BA','Bari'),(199,105,'BT','Barletta Andria Trani'),(200,105,'BL','Belluno'),(201,105,'BN','Benevento'),(202,105,'BG','Bergamo'),(203,105,'BI','Biella'),(204,105,'BO','Bologna'),(205,105,'BZ','Bolzano'),(206,105,'BS','Brescia'),(207,105,'BR','Brindisi'),(208,105,'CA','Cagliari'),(209,105,'CL','Caltanissetta'),(210,105,'CB','Campobasso'),(211,105,'CI','Carbonia-Iglesias'),(212,105,'CE','Caserta'),(213,105,'CT','Catania'),(214,105,'CZ','Catanzaro'),(215,105,'CH','Chieti'),(216,105,'CO','Como'),(217,105,'CS','Cosenza'),(218,105,'CR','Cremona'),(219,105,'KR','Crotone'),(220,105,'CN','Cuneo'),(221,105,'EN','Enna'),(222,105,'FM','Fermo'),(223,105,'FE','Ferrara'),(224,105,'FI','Firenze'),(225,105,'FG','Foggia'),(226,105,'FC','ForlÃ¬ Cesena'),(227,105,'FR','Frosinone'),(228,105,'GE','Genova'),(229,105,'GO','Gorizia'),(230,105,'GR','Grosseto'),(231,105,'IM','Imperia'),(232,105,'IS','Isernia'),(233,105,'AQ','Aquila'),(234,105,'SP','La Spezia'),(235,105,'LT','Latina'),(236,105,'LE','Lecce'),(237,105,'LC','Lecco'),(238,105,'LI','Livorno'),(239,105,'LO','Lodi'),(240,105,'LU','Lucca'),(241,105,'MC','Macerata'),(242,105,'MN','Mantova'),(243,105,'MS','Massa Carrara'),(244,105,'MT','Matera'),(245,105,'VS','Medio Campidano'),(246,105,'ME','Messina'),(247,105,'MI','Milano'),(248,105,'MO','Modena'),(249,105,'MB','Monza e Brianza'),(250,105,'NA','Napoli'),(251,105,'NO','Novara'),(252,105,'NU','Nuoro'),(253,105,'OG','Ogliastra'),(254,105,'OT','Olbia-Tempio'),(255,105,'OR','Oristano'),(256,105,'PD','Padova'),(257,105,'PA','Palermo'),(258,105,'PR','Parma'),(259,105,'PG','Perugia'),(260,105,'PV','Pavia'),(261,105,'PU','Pesaro Urbino'),(262,105,'PE','Pescara'),(263,105,'PC','Piacenza'),(264,105,'PI','Pisa'),(265,105,'PT','Pistoia'),(266,105,'PN','Pordenone'),(267,105,'PZ','Potenza'),(268,105,'PO','Prato'),(269,105,'RG','Ragusa'),(270,105,'RA','Ravenna'),(271,105,'RC','Reggio Calabria'),(272,105,'RE','Reggio Emilia'),(273,105,'RI','Rieti'),(274,105,'RN','Rimini'),(275,105,'RM','Roma'),(276,105,'RO','Rovigo'),(277,105,'SA','Salerno'),(278,105,'SS','Sassari'),(279,105,'SV','Savona'),(280,105,'SI','Siena'),(281,105,'SR','Siracusa'),(282,105,'SO','Sondrio'),(283,105,'TA','Taranto'),(284,105,'TE','Teramo'),(285,105,'TR','Terni'),(286,105,'TO','Torino'),(287,105,'TP','Trapani'),(288,105,'TN','Trento'),(289,105,'TV','Treviso'),(290,105,'TS','Trieste'),(291,105,'UD','Udine'),(292,105,'VA','Varese'),(293,105,'VE','Venezia'),(294,105,'VB','Verbania'),(295,105,'VC','Vercelli'),(296,105,'VR','Verona'),(297,105,'VV','Vibo Valentia'),(298,105,'VI','Vicenza'),(299,105,'VT','Viterbo');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones_to_geo_zones`
--

LOCK TABLES `zones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `zones_to_geo_zones` DISABLE KEYS */;
INSERT INTO `zones_to_geo_zones` VALUES (1,223,18,1,NULL,'2020-04-03 08:32:40');
/*!40000 ALTER TABLE `zones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-03  8:36:17
