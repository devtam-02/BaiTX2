-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: devshop
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,2,1,'hoanhao1512'),(2,3,3,'hoanhao1512'),(3,2,2,'hoanhao1512'),(4,1,5,'hoanhao1512'),(9,2,2,'devtam2x2'),(11,2,25,'devtam2x2'),(12,1,25,'devTam'),(13,4,1,'devTam'),(14,1,2,'devTam');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Áo'),(2,'Quần'),(3,'Giày'),(4,'Mũ'),(5,'Kính');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `country` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fullname` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `note` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment_method` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`),
  CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Nguyen Xa','2023-03-12','Ha Noi','nguyentrongtam2x2@gmail.com','Nguyen Trong Tam','nothing','Payment on delivery','0328419491','Pending',120000,'devtam2x2'),(2,'Cam Lac, Cam Xuyen','2023-06-04','Ha Tinh','nguyentrongtam2x2@gmail.com','Nguyen Trong Tam','no thing','Payment on delivery','0328419491','Pending',990000,'devTam'),(3,'Cam Xuyen','2023-06-04','Ha Tinh','nguyentrongtam2x2@gmail.com','Nguyen Trong Tam','no thing','Payment on delivery','0328419491','Pending',1790000,'devTam'),(4,'1234','2023-06-06','hatinh','nguyentrongtam2x2@gmail.com','Nguyen Trong Tam','hehe','Payment on delivery','0328419491','Pending',1790000,'devTam'),(5,'1234','2023-06-06','hatinh','nguyentrongtam2x2@gmail.com','Nguyen Trong Tam','hehe','Payment on delivery','0328419491','Pending',1790000,'devTam');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs234mi6jususbx4b37k44cipy` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKs234mi6jususbx4b37k44cipy` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,32),(2,1,2,25),(3,1,3,25),(4,1,3,1),(5,1,3,2),(6,1,4,25),(7,1,4,1),(8,1,4,2),(9,1,5,25),(10,1,5,1),(11,1,5,2);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` varchar(11111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `is_selling` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `product_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sold` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2022-11-21','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,500000,'Men\'s Jacket AKHTK306 Nguyen Trong Tam Design',97,23,1),(2,'2022-11-21','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,300000,'Men\'s polo shirt POTTK333',97,13,1),(3,'2022-11-11','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,360000,'Men\'s polo shirt POHTK313',100,20,1),(4,'2022-10-10','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,549000,'Men\'s jeans QJDTK323',100,90,2),(5,'2022-03-09','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,520000,'Men\'s jeans QJDTK320',100,10,2),(6,'2022-10-10','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,230000,'Men\'s shorts QSGTK312',100,75,2),(7,'2022-08-04','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,750000,'GIACN226 Men\'s Shoes',100,80,3),(8,'2022-11-11','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,720000,'Men\'s shoes GIACN302',100,50,3),(9,'2022-10-10','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,520000,'Men\'s shoes GIACN308',100,10,3),(10,'2022-03-09','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,249000,'Men\'s fashion hat MLTTK301',100,100,4),(11,'2022-10-10','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,250000,'Panama Men\'s Fashion Hat 18EM250',200,310,4),(12,'2022-08-04','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,180000,'Men\'s Fashion Caps 16HM180',100,10,4),(13,'2022-07-04','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,999000,'UNISEX high-end eyewear ELLY – EKU148',100,30,5),(14,'2022-05-30','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,899000,'High-end eyewear ELLY – EKU141',40,50,5),(15,'2022-01-29','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,690000,'High-end eyewear ELLY HOMME – EKM133',80,70,5),(16,'2022-11-21','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,250000,'Code sl applique hoodie - bright green',100,20,1),(17,'2022-01-21','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,220000,'Riviera short sleeve shirt - sepia floral',100,70,1),(18,'2022-10-02','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,190000,'Graphic crew neck tee - white',100,20,1),(19,'2022-10-09','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,900000,'Plain regular long lounge pant - black',100,90,2),(20,'2022-11-07','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,180000,'QATTK301 Mens Pants',100,20,2),(21,'2022-11-06','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,100000,'Mens SHORT Pants QSVTK805',100,200,2),(22,'2022-07-29','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,370000,'GIACN312 Mens Shoes',100,20,3),(23,'2022-10-30','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,120000,'GIACN235 Mens Shoes',100,20,3),(24,'2022-09-12','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,510000,'SNEKER SPORTY SHOES G1011',100,100,3),(25,'2022-12-14','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,990000,'Men fashion hat MTRTK306',96,94,4),(26,'2022-11-16','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,100000,'Mens Fashion Caps Caps 16HM180',100,20,4),(27,'2022-10-23','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,190000,'Mens fashion hat MLTTK301',100,70,4),(28,'2022-09-27','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,230000,'Gentle Monster Loful Sunglasses 01 56 -19 Black',100,10,5),(29,'2022-04-06','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,760000,'MarcJacobs MARC192FS-IPR-9O',100,20,5),(30,'2022-03-30','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,520000,'Anti-blue light sunglasses',100,90,5),(31,'2022-03-30','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,520000,'Blazer jacket ABZTK303',100,90,1),(32,'2022-12-09','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,120000,'Men\'s shirt STDTK341',99,81,1),(33,'2022-11-03','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,340000,'Men\'s T-shirt APHTK358',100,130,1),(34,'2022-10-17','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,370000,'QGNTK308 jogger pants',100,200,2),(35,'2022-09-11','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,910000,'Men\'s shorts QSNTK302',100,10,2),(36,'2022-01-18','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,200000,'Men\'s jeans QJDTK235',100,20,2),(37,'2022-10-29','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,820000,'GIACN209 Men\'s Shoes',100,70,3),(38,'2022-07-24','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,670000,'Men\'s SHOES GIACN101',100,50,3),(39,'2022-05-23','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,710000,'GIACN SHOES 115',100,90,3),(40,'2022-03-25','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,200000,'Men\'s fashion hat MLTTK304',100,90,4),(41,'2022-01-19','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,560000,'Men\'s fashion hat MLTTK303',100,78,4),(42,'2022-01-15','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,120000,'Men\'s Fashion Caps Caps 16HM180',100,120,4),(44,'2022-08-16','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,120000,'MUJOSH glass',100,50,5),(45,'2022-03-11','Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.',1,1,240000,'MAX&Co glass',100,500,5),(71,'2023-12-16','nothingdăddagfdgbvc',1,1,123,'heheđawa',12,0,1),(72,'2023-12-16','dfafsf',0,1,12,'đuawađưa',2,0,1),(73,'2023-12-16','dfafsf',1,1,12,'đuawađưa',2,0,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`),
  CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (25,'https://360boutique.vn/wp-content/uploads/2022/06/GIACN308-5.jpg',9),(26,'https://360boutique.vn/wp-content/uploads/2022/06/GIACN308-6.jpg',9),(27,'https://360boutique.vn/wp-content/uploads/2022/06/GIACN308-5.jpg',9),(28,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK301-2.jpg',10),(29,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK301-3.jpg',10),(30,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK301-4.jpg',10),(31,'https://360boutique.vn/wp-content/uploads/2018/08/18Em250.jpg',11),(32,'https://360boutique.vn/wp-content/uploads/2018/08/18EM280-2.jpg',11),(33,'https://360boutique.vn/wp-content/uploads/2018/08/18EM280-2.jpg',11),(34,'https://360boutique.vn/wp-content/uploads/2018/08/16HM180-4.jpg',12),(35,'https://360boutique.vn/wp-content/uploads/2018/08/16HM180-5.jpg',12),(36,'https://360boutique.vn/wp-content/uploads/2018/08/16HM180-3.jpg',12),(37,'https://cdn.elly.vn/uploads/2022/06/16104911/kinh-mat-unisex-cao-cap-elly-eku148-26.jpg',13),(38,'https://cdn.elly.vn/uploads/2022/06/16104809/kinh-mat-unisex-cao-cap-elly-eku148-18-2.jpg',13),(39,'https://cdn.elly.vn/uploads/2022/06/16104721/kinh-mat-unisex-cao-cap-elly-eku148-12-2.jpg',13),(40,'https://cdn.elly.vn/uploads/2022/07/12224407/kinh-mat-nu-thoi-trang-cao-cap-EKU141-11.jpg',14),(41,'https://cdn.elly.vn/uploads/2022/07/12224306/kinh-mat-nu-thoi-trang-cao-cap-EKU141-3-510x510.jpg',14),(42,'https://cdn.elly.vn/uploads/2022/07/12224258/kinh-mat-nu-thoi-trang-cao-cap-EKU141-2.jpg',14),(43,'https://cdn.elly.vn/uploads/2021/06/23231113/kinh-mat-nu-thoi-trang-cao-cap-Elly-Ek133-0-510x510.jpg',15),(44,'https://cdn.elly.vn/uploads/2021/06/18224937/z3648822848148_ff75fe182aa2d2fb59e42cf4bcb934b2.jpg',15),(45,'https://cdn.elly.vn/uploads/2021/06/23231156/kinh-mat-nu-thoi-trang-cao-cap-Elly-Ek133-6.jpg',15),(49,'https://360boutique.vn/wp-content/uploads/2022/07/SHNTK323-QKLTK306-1.jpg',17),(50,'https://360boutique.vn/wp-content/uploads/2022/07/SHNTK323-QKLTK306-5.jpg',17),(51,'https://360boutique.vn/wp-content/uploads/2022/07/SHNTK323-QKLTK306-2.jpg',17),(52,'https://360boutique.vn/wp-content/uploads/2021/12/AHHTK210-1.jpg',18),(53,'https://360boutique.vn/wp-content/uploads/2021/12/AHHTK210-3.jpg',18),(54,'https://360boutique.vn/wp-content/uploads/2021/12/AHHTK210-2.jpg',18),(55,'https://360boutique.vn/wp-content/uploads/2021/12/AHHTK210-6.jpg',18),(56,'https://360boutique.vn/wp-content/uploads/2022/11/QGGTK311-1.jpg',19),(57,'https://360boutique.vn/wp-content/uploads/2022/11/QGGTK311-1.jpg',19),(58,'https://360boutique.vn/wp-content/uploads/2022/11/QGGTK311-3.jpg',19),(59,'https://360boutique.vn/wp-content/uploads/2022/04/QATTK301-2.jpg',20),(60,'https://360boutique.vn/wp-content/uploads/2022/04/QATTK301-5.jpg',20),(61,'https://360boutique.vn/wp-content/uploads/2022/04/QATTK301-4.jpg',20),(62,'https://360boutique.vn/wp-content/uploads/2022/07/QSNTK306-4.jpg',21),(63,'https://360boutique.vn/wp-content/uploads/2022/07/QSNTK306-5.jpg',21),(64,'https://360boutique.vn/wp-content/uploads/2022/07/QSNTK306-6.jpg',21),(65,'https://360boutique.vn/wp-content/uploads/2022/10/GIACN312-1.jpg',22),(66,'https://360boutique.vn/wp-content/uploads/2022/10/GIACN312-3.jpg',22),(67,'https://360boutique.vn/wp-content/uploads/2022/10/GIACN312-2.jpg',22),(68,'https://360boutique.vn/wp-content/uploads/2022/03/GIACN235-2.jpg',23),(69,'https://360boutique.vn/wp-content/uploads/2022/03/GIACN235-3.jpg',23),(70,'https://360boutique.vn/wp-content/uploads/2022/03/GIACN235-4.jpg',23),(71,'https://360boutique.vn/wp-content/uploads/2018/08/G1011-750k-2-copy-Copy.jpg',24),(72,'https://360boutique.vn/wp-content/uploads/2018/08/G1011-750k-3-copy-Copy.jpg',24),(80,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK301-11.jpg',27),(81,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK301-12.jpg',27),(82,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK301-10.jpg',27),(83,'https://i5.walmartimages.com/asr/3f03248d-4501-426a-b3a0-67b623a7b6f1_1.abfbdef9da932a016410c2a6434de724.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',28),(84,'https://i5.walmartimages.com/asr/d968e44f-8589-41d1-8c8d-59f753e59c35_1.95650280ecc167a019cb222c80b0fbef.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',28),(85,'https://i5.walmartimages.com/asr/5d9809b4-3cfb-4bf5-bf69-da58600236e6_1.85a7dfbb9d57a27c42a7aef4a638bd5b.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',28),(86,'https://i5.walmartimages.com/asr/ff582578-b104-498d-b763-d67d65546693.ec6def46b9737499a8ee96ddb555c19b.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',29),(87,'https://i5.walmartimages.com/asr/14abc3bc-dd02-439a-8ddf-0cdfdf88adf5.309714af395966532b878c660484f56c.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',29),(88,'https://i5.walmartimages.com/asr/0d992eea-340c-4290-a68e-82a34002816c.bd177b7423cdab5afb169c56f30d3b17.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',29),(89,'https://i5.walmartimages.com/asr/2338cd59-aa29-4179-bf4a-c2ec35abe5ff.d18e5ac7fa473ed5bf9d18697f67782b.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',30),(90,'https://i5.walmartimages.com/asr/2338cd59-aa29-4179-bf4a-c2ec35abe5ff.d18e5ac7fa473ed5bf9d18697f67782b.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',30),(91,'https://i5.walmartimages.com/asr/49130cc9-4cda-4745-8b2d-99e1771e794d.33e91f9f7715a68eabeba08d2ceac6cf.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',30),(92,'https://360boutique.vn/wp-content/uploads/2022/09/ABZTK303-QATTK310-6.jpg',31),(93,'https://360boutique.vn/wp-content/uploads/2022/09/ABZTK303-QATTK310-7.jpg',31),(94,'https://360boutique.vn/wp-content/uploads/2022/09/ABZTK303-QATTK310-8.jpg',31),(99,'https://360boutique.vn/wp-content/uploads/2022/07/APHTK358-1.jpg',33),(100,'https://360boutique.vn/wp-content/uploads/2022/07/APHTK358-5.jpg',33),(101,'https://360boutique.vn/wp-content/uploads/2022/07/APHTK358-2.jpg',33),(102,'https://360boutique.vn/wp-content/uploads/2022/11/ApTTK360-QGNTK308-7.jpg',34),(103,'https://360boutique.vn/wp-content/uploads/2022/11/ApTTK360-QGNTK308-4.jpg',34),(104,'https://360boutique.vn/wp-content/uploads/2022/11/ApTTK360-QGNTK308-2.jpg',34),(105,'https://360boutique.vn/wp-content/uploads/2022/03/QSNTK302-5.jpg',35),(106,'https://360boutique.vn/wp-content/uploads/2022/03/QSNTK302-5.jpg',35),(107,'https://360boutique.vn/wp-content/uploads/2022/03/QSNTK302-7.jpg',35),(108,'https://360boutique.vn/wp-content/uploads/2021/12/QJDTK235-1.jpg',36),(109,'https://360boutique.vn/wp-content/uploads/2021/12/QJDTK235-2.jpg',36),(110,'https://360boutique.vn/wp-content/uploads/2021/12/QJDTK235-3.jpg',36),(111,'https://360boutique.vn/wp-content/uploads/2021/04/GIACN209-1.jpg',37),(112,'https://360boutique.vn/wp-content/uploads/2021/04/GIACN209-2.jpg',37),(113,'https://360boutique.vn/wp-content/uploads/2021/04/GIACN209-3.jpg',37),(114,'https://360boutique.vn/wp-content/uploads/2020/09/GIACN101-7.jpg',38),(115,'https://360boutique.vn/wp-content/uploads/2020/09/GIACN101-6.jpg',38),(116,'https://360boutique.vn/wp-content/uploads/2020/09/GIACN101-5.jpg',38),(117,'https://360boutique.vn/wp-content/uploads/2020/09/GIACN115-1.jpg',39),(118,'https://360boutique.vn/wp-content/uploads/2020/09/GIACN115-4.jpg',39),(119,'https://360boutique.vn/wp-content/uploads/2020/09/GIACN115-3.jpg',39),(120,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK304-10.jpg',40),(121,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK304-9.jpg',40),(122,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK304-8.jpg',40),(123,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK303-8.jpg',41),(124,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK303-7.jpg',41),(125,'https://360boutique.vn/wp-content/uploads/2022/06/MLTTK303-5.jpg',41),(126,'https://360boutique.vn/wp-content/uploads/2018/08/16HM180-50.jpg',42),(127,'https://360boutique.vn/wp-content/uploads/2018/08/16HM180-49.jpg',42),(131,'https://product.hstatic.net/1000284478/product/cpc2_mj101fh052_1_12aa1dd7550f49ce8f52e4189b15478e_large.jpg',44),(132,'https://product.hstatic.net/1000284478/product/slc3_mj101fh052_1_b17573f903a54e2596326573c9a91fe2_large.jpg',44),(133,'https://product.hstatic.net/1000284478/product/bkc1_mj101fh052_1_0a67bf652c7e466f9417ad37e0244d99_large.jpg',44),(134,'https://product.hstatic.net/1000284478/product/1_4804041803_1_dafff5d31a2c4eeca56b8441344b08e7_large.jpg',45),(135,'https://product.hstatic.net/1000284478/product/2_4804041803_1_17006b97fedf46b2bb293256f074e570_large.jpg',45),(136,'https://product.hstatic.net/1000284478/product/2_4804041803_2_b8fc0c2f8cda4a468e1e61b732e57563_large.jpg',45),(138,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1681918866/pqio7tjbksyln2e8kqbe.jpg',1),(164,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693488861/ogegoynfujkmxnma9rsq.jpg',2),(165,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693488940/knsm8shl5g0iy8v6oxiv.jpg',3),(167,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489198/pchx8ng1ke6ei393pusy.png',5),(168,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489266/wsdmb4bjp69csrxhdcz6.jpg',6),(169,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489266/hutw85wpoxarkunlieer.jpg',6),(170,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489362/vgbgl1mwdhi3gfkeywjw.jpg',25),(171,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489476/ixvx56cnfznkyvcgkmjz.png',32),(172,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489579/mnyfsx7hmeaypyahiwie.png',16),(173,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489661/mhrsoc9x5ixg0sgza7ft.png',26),(174,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693489736/nukja0rleec6ah70mmpk.png',8),(175,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693499880/tarzohpcouzydnhyyahl.webp',7),(176,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1693499882/jxc7iu4j0o0lmuavz5qr.webp',7),(177,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1697027147/bcz9slqahh0jxodih2tq.jpg',4),(178,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1702731126/dpzvsbaaooagynu3osz8.jpg',71),(179,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1702731307/fvwcldseumrtrapsubfq.jpg',73),(180,'http://res.cloudinary.com/dqvhfr35a/image/upload/v1702731723/qf6mexyaj84lyjxq4xad.jpg',3);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_accessed`
--

DROP TABLE IF EXISTS `tbl_accessed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_accessed` (
  `id` int NOT NULL,
  `accessed_date` date DEFAULT NULL,
  `count` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_accessed`
--

LOCK TABLES `tbl_accessed` WRITE;
/*!40000 ALTER TABLE `tbl_accessed` DISABLE KEYS */;
INSERT INTO `tbl_accessed` VALUES (1,'2023-12-20',356),(2,'2023-12-20',546),(3,'2023-12-20',236),(4,'2023-12-20',346),(5,'2023-12-21',236),(6,'2023-12-21',645),(7,'2023-12-21',345);
/*!40000 ALTER TABLE `tbl_accessed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bought`
--

DROP TABLE IF EXISTS `tbl_bought`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bought` (
  `id` int NOT NULL,
  `bought_date` date DEFAULT NULL,
  `count` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_bought_product` (`product_id`),
  CONSTRAINT `FK_tbl_bought_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bought`
--

LOCK TABLES `tbl_bought` WRITE;
/*!40000 ALTER TABLE `tbl_bought` DISABLE KEYS */;
INSERT INTO `tbl_bought` VALUES (1,'2023-12-20',356,2),(2,'2023-12-20',124,1),(3,'2023-12-20',217,4),(4,'2023-12-20',73,3),(5,'2023-12-20',131,5),(6,'2023-12-21',213,3),(7,'2023-12-21',239,2),(8,'2023-12-21',226,1);
/*!40000 ALTER TABLE `tbl_bought` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_viewed`
--

DROP TABLE IF EXISTS `tbl_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_viewed` (
  `id` int NOT NULL,
  `viewed_date` date DEFAULT NULL,
  `count` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_viewed_product` (`product_id`),
  CONSTRAINT `FK_tbl_viewed_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_viewed`
--

LOCK TABLES `tbl_viewed` WRITE;
/*!40000 ALTER TABLE `tbl_viewed` DISABLE KEYS */;
INSERT INTO `tbl_viewed` VALUES (1,'2023-12-20',400,2),(2,'2023-12-20',254,1),(3,'2023-12-20',367,4),(4,'2023-12-20',113,3),(5,'2023-12-20',251,5),(6,'2023-12-21',356,3),(7,'2023-12-21',356,2),(8,'2023-12-21',356,1);
/*!40000 ALTER TABLE `tbl_viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `avatar` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `login_type` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','nguyentrongtam2x2@gmail.com','default','YWRtaW4=','0328419491','admin','Nguyen Trong Tam'),('devTam','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','nguyentrongtam2x2@gmail.com','default','RGV2MjJ4MjI=',NULL,'user','Nguyen Trong Tam'),('devtam2x2','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','nguyentrongtam2x2@gmail.com','default','RGV2MjJ4MjI=',NULL,'user','Nguyen Trong Tam'),('hoanhao1512','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','haovo1512@gmail.com','default','MQ==','0799197703','user','Võ Hoàn Hảo'),('nguyentrongtam','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','nguyentrongtam2x2@gmail.com','default','RGV2MjJ4MjI=',NULL,'user','Nguyen Trong Tam');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-22  0:55:28
