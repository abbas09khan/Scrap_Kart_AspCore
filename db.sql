/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.24-MariaDB : Database - scrapkart
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`scrapkart` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `scrapkart`;

/*Table structure for table `myproducts` */

DROP TABLE IF EXISTS `myproducts`;

CREATE TABLE `myproducts` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `Price` double DEFAULT 0,
  `Description` varchar(200) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Status` varchar(10) DEFAULT 'Pending',
  `UID` int(11) DEFAULT 1,
  `State` varchar(20) DEFAULT 'Delhi',
  `Category` varchar(50) DEFAULT 'Category',
  `SubCategory` varchar(50) DEFAULT 'SubCategory',
  `Quantity` bigint(20) DEFAULT 0,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `myproducts` */

insert  into `myproducts`(`PID`,`ProductName`,`Type`,`Price`,`Description`,`Brand`,`Status`,`UID`,`State`,`Category`,`SubCategory`,`Quantity`) values (1,'Denver Deodrant Combo','deodrant',220,'The rare blend is the reminiscence of our prowess in the art of perfumery to achieve premium scents.','Denver','Pending',1,'Delhi','personal healthcare','SubCategory',0),(2,'Black Red Striped Casual Shirt','shirt',1399,NULL,'H&M','Pending',1,'Delhi','clothing','SubCategory',0),(3,'Blue Denim Jeans','jeans',1499,NULL,'Spykar','Pending',1,'Delhi','clothing','SubCategory',0),(4,'Polka dots Red Casual Shirt','shirt',899,NULL,'Diverse','Pending',1,'Delhi','clothing','SubCategory',0),(5,'Plain Black Slim fit Jeans','jeans',2099,NULL,'Levi\'s','Pending',1,'Delhi','clothing','SubCategory',0),(6,'Stylish Men Cap','cap',299,NULL,'HRX','Pending',1,'Delhi','clothing','SubCategory',0),(7,'Floral Print Men Shirt','shirt',999,NULL,'GAP','Pending',1,'Delhi','clothing','SubCategory',0),(8,'Women Top+Denim Jacket Combo','combo',2699,NULL,'Levi\'s','Pending',1,'Delhi','clothing','SubCategory',0),(9,'Black Checkered White Top','shirt',1449,NULL,'Shein','Pending',1,'Delhi','clothing','SubCategory',0),(10,'Printed Loose T-shirt','tshirt',899,NULL,'GAP','Pending',1,'Delhi','clothing','SubCategory',0),(11,'Blue Jumpsuit','jumpsuit',1600,NULL,'Shein','Pending',1,'Delhi','clothing','SubCategory',0),(12,'Floral Print Women Top','shirt',799,NULL,'Zara','Pending',1,'Delhi','clothing','SubCategory',0),(13,'Dettol Original Handwash','sanitizer',149,NULL,'Dettol','Pending',1,'Delhi','personal healthcare','SubCategory',0),(14,'Disposable Masks','mask',99,NULL,'Mankind','Pending',1,'Delhi','personal healthcare','SubCategory',0),(15,'Wow Shampoo+Conditioner Combo','shampoo',849,NULL,'Wow Skin Sciences','Pending',1,'Delhi','personal healthcare','SubCategory',0),(16,'Nivea Maximum Hydration Lotion','lotion',199,NULL,'Nivea','Pending',1,'Delhi','personal healthcare','SubCategory',0),(17,'Iphone 13 Pro Max 128','mobile phone',129000,NULL,'Apple','Pending',1,'Delhi','gadgets and accessories','SubCategory',0),(18,'Apple Watch Series 4','smart watch',29999,NULL,'Apple','Pending',1,'Delhi','gadgets and accessories','SubCategory',0),(19,'Extra Bass Wireless Headphone','headphones',18999,NULL,'Sony','Pending',1,'Delhi','gadgets and accessories','SubCategory',0),(20,'DJI Mavic Pro','drone',111805,NULL,'DJI','Pending',1,'Delhi','gadgets and accessories','SubCategory',0),(21,'Siemens Fully Automatic Washing Machine','washing machine',36599,NULL,'Siemens','Pending',1,'Delhi','Home Appliances','SubCategory',0),(22,'Havells Steam Iron','iron',2099,NULL,'Havells','Pending',1,'Delhi','Home Appliances','SubCategory',0),(23,'Samsung Side by Side 545 litre Refrigerator','refrigerator',79999,NULL,'Samsung','Pending',1,'Delhi','Home Appliances','SubCategory',0),(24,'Borosil Juicer Mixer Grinder','mixer juicer',3699,NULL,'Borosil','Pending',1,'Delhi','Home Appliances','SubCategory',0),(25,'Apple Airpods','headphone',10999,NULL,'Apple','Pending',1,'Delhi','gadgets and accessories','SubCategory',0),(26,'HP Pavillion 360 flodable i9 intel core processor laptop','laptop',148999,NULL,'HP','Pending',1,'Delhi','computers and printers','SubCategory',0),(27,'Play Station 5 ','game',59999,NULL,'Sony','Pending',1,'Delhi','computers and printers','SubCategory',0),(28,'Panasonic 14 litre Convection Microwave','microwave',16499,NULL,'Panasonic','Pending',1,'Delhi','Home Appliances','SubCategory',0),(29,'Samsung Galaxy S22','mobile phone',59999,NULL,'Samsung','Pending',1,'Delhi','gadgets and accessories','SubCategory',0),(30,'MI Horizon 32\' LED TV','television',24499,NULL,'Xiaomi','Pending',1,'Delhi','Home Appliances','SubCategory',0);

/*Table structure for table `orderinfo` */

DROP TABLE IF EXISTS `orderinfo`;

CREATE TABLE `orderinfo` (
  `OIID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PID` bigint(20) DEFAULT NULL,
  `Quantity` int(20) DEFAULT NULL,
  `TotalPrice` double DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT 'Product',
  `Price` double DEFAULT 0,
  `OID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OIID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `orderinfo` */

insert  into `orderinfo`(`OIID`,`PID`,`Quantity`,`TotalPrice`,`ProductName`,`Price`,`OID`) values (1,1,2,598,'Product',299,20),(2,2,2,798,'Product',399,20),(3,3,3,2277,'Product',759,20),(4,1,1,299,'Product',299,21),(5,2,1,399,'Product',399,21),(6,3,1,759,'Product',759,21),(7,1,1,299,'Product',299,22),(8,2,1,399,'Product',399,22),(9,3,1,759,'Product',759,22),(10,1,1,299,'Product',299,23),(11,2,1,399,'Product',399,23),(12,3,1,759,'Product',759,23),(13,1,1,299,'Product',299,24),(14,2,1,399,'Product',399,24),(15,3,1,759,'Product',759,24),(16,1,2,598,'Product',299,25),(17,2,2,798,'Product',399,25),(18,3,2,1518,'Product',759,25),(19,1,1,299,'Product',299,26),(20,2,1,399,'Product',399,26),(21,1,2,598,'Product',299,27),(22,2,3,1197,'Product',399,27),(23,1,1,299,'Product',299,28),(24,2,1,399,'Product',399,28),(25,1,1,299,'Product',299,29),(26,2,1,399,'Product',399,29),(27,1,1,299,'Product',299,30),(28,2,1,399,'Product',399,30),(29,1,1,299,'Product',299,31),(30,2,1,399,'Product',399,31),(31,3,1,759,'Product',759,31),(32,4,1,664,'Product',664,31);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNumber` int(11) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT 'Customer Name',
  `CustomerEmail` varchar(50) DEFAULT 'customer@gmail.com',
  `CustomerMobile` varchar(10) DEFAULT '0000000000',
  `CustomerAddress` varchar(250) DEFAULT 'No-Address',
  `BillAmount` bigint(20) DEFAULT 0,
  `OrderDate` date DEFAULT NULL,
  `Status` varchar(10) DEFAULT 'Pending',
  `UID` bigint(20) DEFAULT 1,
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`OID`,`OrderNumber`,`CustomerName`,`CustomerEmail`,`CustomerMobile`,`CustomerAddress`,`BillAmount`,`OrderDate`,`Status`,`UID`) values (16,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',2094,'2023-04-04','Pending',1),(17,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',2914,'2023-04-04','Pending',1),(18,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',2914,'2023-04-04','Pending',1),(19,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',2914,'2023-04-04','Pending',1),(20,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',3673,'2023-04-04','Pending',1),(21,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',1457,'2023-04-04','Pending',1),(22,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',1457,'2023-04-11','Pending',1),(23,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',1457,'2023-04-11','Pending',1),(24,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',1457,'2023-04-23','Pending',1),(25,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',2914,'2023-04-23','Pending',1),(26,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',698,'2023-04-23','Pending',1),(27,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',1795,'2023-04-23','Pending',1),(28,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',698,'2023-04-23','Pending',1),(29,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',698,'2023-04-23','Pending',2),(30,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',698,'2023-04-23','Pending',2),(31,NULL,'Customer Name','customer@gmail.com','0000000000','No-Address',2121,'2023-04-23','Pending',2);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) DEFAULT NULL,
  `Price` double DEFAULT 0,
  `Description` varchar(200) DEFAULT NULL,
  `UID` int(11) DEFAULT 1,
  `Category` varchar(50) DEFAULT 'Category',
  `Quantity` bigint(20) DEFAULT 0,
  `Brand` varchar(100) DEFAULT 'No Brand',
  `AddedOn` date DEFAULT '2020-01-01',
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`PID`,`ProductName`,`Price`,`Description`,`UID`,`Category`,`Quantity`,`Brand`,`AddedOn`) values (1,'Lakme Absolute',299,NULL,1,'Face',0,'No Brand','2020-01-01'),(2,'ColorBar',399,NULL,1,'Face',0,'No Brand','2020-01-01'),(3,'Minimizing Primer Sugar',759,NULL,1,'Face',0,'No Brand','2020-01-01'),(4,'Aquaholic Hydrating Primer',664,NULL,1,'Face',0,'No Brand','2020-01-01'),(5,'Maybelline Fit me ',699,NULL,1,'Face',0,'No Brand','2020-01-01'),(6,'Sugar Contour',759,NULL,1,'Face',0,'No Brand','2020-01-01'),(7,'Maybelline Fit me Compact',180,NULL,1,'Face',0,'No Brand','2020-01-01'),(8,'Lakme Face It Compact',134,NULL,1,'Face',0,'No Brand','2020-01-01'),(9,'Maybelline Concealer',399,NULL,1,'Face',0,'No Brand','2020-01-01'),(10,'Lakme 9To5 Liquid Concealer',299,NULL,1,'Face',0,'No Brand','2020-01-01'),(11,'Faces Canada',139,NULL,1,'Face',0,'No Brand','2020-01-01'),(12,'Mamaearth Foundation',557,NULL,1,'Face',0,'No Brand','2020-01-01'),(13,'Lakme Liquid Foundation',130,NULL,1,'Face',0,'No Brand','2020-01-01'),(14,'Colorbar Amino Skin Foundation',960,NULL,1,'Face',0,'No Brand','2020-01-01'),(15,'Nivea(Sun Protect and Moisturizers)',450,NULL,1,'Skin',0,'No Brand','2020-01-01'),(16,'Joy(Sun block & anti-tan lotion)',250,NULL,1,'Skin',0,'No Brand','2020-01-01'),(17,'Lakme (Sun expert)',500,NULL,1,'Skin',0,'No Brand','2020-01-01'),(18,'BodyCare(Sunscream)',300,NULL,1,'Skin',0,'No Brand','2020-01-01'),(19,'Lotus Herbals(Safe sun)',200,NULL,1,'Skin',0,'No Brand','2020-01-01'),(20,'Swiss Beauty (Skin care serum)',250,NULL,1,'Skin',0,'No Brand','2020-01-01'),(21,'Lakme Absolute(Brightening serum)',450,NULL,1,'Skin',0,'No Brand','2020-01-01'),(22,'Deyga(Rose glow serum)',250,NULL,1,'Skin',0,'No Brand','2020-01-01'),(23,'Natural Vibes(Vitamin C serum)',150,NULL,1,'Skin',0,'No Brand','2020-01-01'),(24,'A+(High-Dose Ratinoid serum)',430,NULL,1,'Skin',0,'No Brand','2020-01-01'),(25,'Nivea(Soft moisturizing cream)',350,NULL,1,'Skin',0,'No Brand','2020-01-01'),(26,'CeraVa(Facial moisturizer)',200,NULL,1,'Skin',0,'No Brand','2020-01-01'),(27,'Neutrogena(Oil-free moisturizer)',250,NULL,1,'Skin',0,'No Brand','2020-01-01'),(28,'Clean & Clear(Dual action Moisturizer)',340,NULL,1,'Skin',0,'No Brand','2020-01-01'),(29,'Cetaphil(Daily hydrating Moisturizer)',400,NULL,1,'Skin',0,'No Brand','2020-01-01'),(30,'Biotique(Deep cleansing fashwash)',350,NULL,1,'Skin',0,'No Brand','2020-01-01'),(31,'Pond\'s(Sopt-less Glow fashwash)',420,NULL,1,'Skin',0,'No Brand','2020-01-01'),(32,'Nivea(Purifying fashwash)',300,NULL,1,'Skin',0,'No Brand','2020-01-01'),(33,'Himalaya(Purifying neem fashwash)',230,NULL,1,'Skin',0,'No Brand','2020-01-01'),(34,'Clean & Clear(Foaming fashwash)',245,NULL,1,'Skin',0,'No Brand','2020-01-01'),(35,'Himalaya(Intensive Care Lotion)',200,NULL,1,'Skin',0,'No Brand','2020-01-01'),(36,'Parashute(Deep nourish bodylotion)',150,NULL,1,'Skin',0,'No Brand','2020-01-01'),(37,'Nivea(Bodylotion)',350,NULL,1,'Skin',0,'No Brand','2020-01-01'),(38,'Joy(Honey & Almonds lotion)',190,NULL,1,'Skin',0,'No Brand','2020-01-01'),(39,'Vaseline(Cocoa glow)',185,NULL,1,'Skin',0,'No Brand','2020-01-01'),(40,'Real Technique(Pack of 4 with blender)',530,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(41,'Round Blending Brushes( Pack of 3)',400,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(42,'e.l.f Brushes(Pack of 5)',550,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(43,'Fenty Beauty (Round brush)',250,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(44,'The Musk ( Eye shadow brush)',150,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(45,'Inovera(Makeup bag)',300,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(46,'Bagsmart(Makeup bag)',350,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(47,'Bella bag(Portable & waterproof)',400,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(48,'Cosmetic Bag(Slim & Portable)',250,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(49,'Herschel(makeup kit)',200,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(50,'Parada(Perfume spray)',300,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(51,'Valentino(Rose Essence)',250,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(52,'Layer\'s Wottagirl!',150,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(53,'Miss Dior(Blooming Bouquet)',280,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(54,'Engage',180,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(55,'Peach & Black(Dryer ,Curler $ Styler)',400,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(56,'VEU Hair Styling Tools',450,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(57,'5in1 Air Wrap(Dryer,Curler,Styler)',620,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(58,'Havells(Multi-stylers kit 5 in 1)',650,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(59,'Dyson Corrale(Hair straightener)',750,NULL,1,'Tools Accessories',0,'No Brand','2020-01-01'),(60,'TRESemme Keratin Smooth',462,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(61,'LOREAL Dream length Restoring ',519,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(62,'Dove Intense Repair',158,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(63,'mamaearth Onion Shampoo',349,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(64,'TRESemme Smooth Shine',282,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(65,'LOREAL Dream length Detangling',199,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(66,'Dove Intense Repair',149,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(67,'mamaearth Onion Conditioner',349,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(68,'LOREAL 6 OIL NOURISH ',498,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(69,'mamaearth Hair Oil',399,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(70,'Dove hair threapy NOURISHING ',1487,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(71,'LOREAL ELSEVE Hair Serum',599,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(72,'TRESemme HAIR SERUM',280,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(73,'mamaearth Onion Scalp Serum',349,NULL,1,'Hair Care',0,'No Brand','2020-01-01'),(74,'Lakme Insta Eye Liner ',150,NULL,1,'Eye',0,'No Brand','2020-01-01'),(75,'Lakme Pen Liner',349,NULL,1,'Eye',0,'No Brand','2020-01-01'),(76,'Maybelline New York Liner',249,NULL,1,'Eye',0,'No Brand','2020-01-01'),(77,'Mac Liner',640,NULL,1,'Eye',0,'No Brand','2020-01-01'),(78,'Mayballine Pen Liner',420,NULL,1,'Eye',0,'No Brand','2020-01-01'),(79,'Lakme Mascara',399,NULL,1,'Eye',0,'No Brand','2020-01-01'),(80,'Maybelline Hypercurl Mascara ',260,NULL,1,'Eye',0,'No Brand','2020-01-01'),(81,'Maybelline Mascara',320,NULL,1,'Eye',0,'No Brand','2020-01-01'),(82,'Sugar Mascara',499,NULL,1,'Eye',0,'No Brand','2020-01-01'),(83,'Colorbar',350,NULL,1,'Eye',0,'No Brand','2020-01-01'),(84,'Lakme Lipstick',299,NULL,1,'Lips',0,'No Brand','2020-01-01'),(85,'Mayballine Lipstick',349,NULL,1,'Lips',0,'No Brand','2020-01-01'),(86,'Mac Lipstick',1050,NULL,1,'Lips',0,'No Brand','2020-01-01'),(87,'Rene Lipstick',249,NULL,1,'Lips',0,'No Brand','2020-01-01'),(88,'Sugar Lipstick',699,NULL,1,'Lips',0,'No Brand','2020-01-01'),(89,'Lakme Insta cool Kajal',192,NULL,1,'Eye',0,'No Brand','2020-01-01'),(90,'Lakme Eyeconic Kajal',230,NULL,1,'Eye',0,'No Brand','2020-01-01'),(91,'Maybelline Kajal',172,NULL,1,'Eye',0,'No Brand','2020-01-01'),(92,'Mac Kajal',460,NULL,1,'Eye',0,'No Brand','2020-01-01'),(93,'Colorbar Kajal',200,NULL,1,'Eye',0,'No Brand','2020-01-01'),(94,'Lakme Lipliner',220,NULL,1,'Lips',0,'No Brand','2020-01-01'),(95,'Sugar Lipliner ',349,NULL,1,'Lips',0,'No Brand','2020-01-01'),(96,'Huda Beauty Lipliner',400,NULL,1,'Lips',0,'No Brand','2020-01-01'),(97,'Nykaa Lipliner',249,NULL,1,'Lips',0,'No Brand','2020-01-01'),(98,'Mac Lipliner',500,NULL,1,'Lips',0,'No Brand','2020-01-01'),(99,'Maybelline Lip Balm',220,NULL,1,'Lips',0,'No Brand','2020-01-01'),(100,'Lakme Lip Balm ',199,NULL,1,'Lips',0,'No Brand','2020-01-01'),(101,'Himalaya Lip Balm ',45,NULL,1,'Lips',0,'No Brand','2020-01-01'),(102,'Vaseline',25,NULL,1,'Lips',0,'No Brand','2020-01-01'),(103,'Nivea Lip Balm',45,NULL,1,'Lips',0,'No Brand','2020-01-01'),(104,'Lakme face sheer Blusher',352,NULL,1,'Face',0,'No Brand','2020-01-01'),(105,'Marie Claire Blush',215,NULL,1,'Face',0,'No Brand','2020-01-01'),(106,'Sugar Blusher',759,NULL,1,'Face',0,'No Brand','2020-01-01'),(107,'Faces Canada Compact',159,NULL,1,'Face',0,'No Brand','2020-01-01'),(108,'Pac Banana HD Powder',745,NULL,1,'Face',0,'No Brand','2020-01-01'),(109,'Sugar Banana Compact',569,NULL,1,'Face',0,'No Brand','2020-01-01'),(110,'Swiss Beauty Concealer',456,NULL,1,'Face',0,'No Brand','2020-01-01'),(111,'Mattlook ultimate cover concealer',191,NULL,1,'Face',0,'No Brand','2020-01-01'),(112,'Maybelline newyork FitMe Foundation',345,NULL,1,'Face',0,'No Brand','2020-01-01'),(113,'Seven Seas silk Foundation',214,NULL,1,'Face',0,'No Brand','2020-01-01'),(114,'Face Fwd Highlighter Stick',759,NULL,1,'Face',0,'No Brand','2020-01-01'),(115,'my Glam Duo Palette',370,NULL,1,'Face',0,'No Brand','2020-01-01'),(116,'Sugar Highlighter',379,NULL,1,'Face',0,'No Brand','2020-01-01'),(117,'Miss Clair',386,NULL,1,'Face',0,'No Brand','2020-01-01'),(118,'La Colors Highlight and Contour',325,NULL,1,'Face',0,'No Brand','2020-01-01'),(119,'Colorbar Face Blush',259,NULL,1,'Faces',0,'No Brand','2020-01-01');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT 'UserName',
  `Email` varchar(50) DEFAULT NULL,
  `PWD` varchar(50) NOT NULL,
  `Mobile` varchar(10) DEFAULT NULL,
  `GUID` varchar(50) DEFAULT NULL,
  `Address` varchar(250) DEFAULT 'Address',
  `DOB` datetime NOT NULL,
  `IsVerified` tinyint(1) NOT NULL,
  `Status` varchar(10) DEFAULT 'Pending',
  `UserType` varchar(10) DEFAULT 'User',
  `ZipCode` varchar(6) DEFAULT '000000',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`UID`,`UserName`,`Email`,`PWD`,`Mobile`,`GUID`,`Address`,`DOB`,`IsVerified`,`Status`,`UserType`,`ZipCode`) values (1,'Admin','admin@gmail.com','aa','9988776655','guid','My Home Address','2023-02-19 14:54:28',1,'Approved','Admin','000000'),(2,'Normal User','user@gmail.com','aa','9898989898',NULL,'user Home Location','2023-03-13 12:01:53',0,'Approved','User','112211'),(3,'Rishi','rishi@gmail.com','aa','8989898767',NULL,'Lucknow','2023-04-02 13:09:08',1,'Approved','User','000000'),(4,'Yogi','yogi@gmail.com','aa','9898989898',NULL,NULL,'0001-01-01 00:00:00',0,'Approved','User','000000'),(5,'test','yogi2@gmail.com','aa','9898989822',NULL,NULL,'0001-01-01 00:00:00',0,'Approved','User','000000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
