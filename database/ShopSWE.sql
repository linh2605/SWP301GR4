-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sportshoponline
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blogId` int NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(200) DEFAULT NULL,
  `content` text,
  `createAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `createBy` int DEFAULT NULL,
  `img` text,
  PRIMARY KEY (`blogId`),
  KEY `blog_ibfk_1` (`createBy`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`createBy`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Top 10 Running Shoes','The Novablast 4 stands out in the all-rounder game, bringing a whole new level of comfort while sustaining stability, responsiveness, and reliable durability. Novablast 4 repeatedly excels in our lab tests and actual runs, rightfully claiming its throne as the ultimate running shoe.\n\nIndulging in this shoe is an absolute delight. The ultra-stacked midsole is our main star as it oozes divine levels of comfort for double-digit miles. Our durometer confirmed our sensations, as it measured 28.7% softer than average. Despite its plush nature, the cushion brings out a vibrant and responsive ride for faster days.\n\nOur runs feel stable regardless of our pace. Novablast 4 offers an extra width of 9.6/4.7 mm in the forefoot and heel to ensure we land securely no matter our foot strike. We can run mindlessly as the midsole flows with our movements. Our flex test confirms it’s 13.5% more adaptive than average.\n\nNovablast 4 proves its durability as the midsole had minor creasing and the outsole barely had scratches after long miles of running against hard pavements. We didn’t feel any difference in terms of performance, showing it’s a reliable and long-lasting running partner.\n\nWhile Novablast 4 can go fast, we feel it lacks the explosive power of a racer. For PB-chasers, exploring other options might be the way to go.','2024-05-31 13:36:42',1,'1'),(2,'How to Choose the Right Sportswear','Tips and tricks for selecting the best sportswear.','2024-05-31 13:36:42',2,'2'),(3,'Benefits of Morning Exercise','Discover the benefits of exercising in the morning.','2024-05-31 13:36:42',3,'3'),(4,'Healthy Eating Tips for Athletes','Guide to maintaining a healthy diet as an athlete.','2024-05-31 13:36:42',4,'4'),(5,'The Ultimate Guide to Marathon Training','A comprehensive guide to prepare for your first marathon','2024-05-31 13:36:42',5,'5'),(6,'Top 5 Diets for Athletes','An overview of the best diets to enhance athletic performance.','2024-05-31 13:36:42',6,'6'),(7,'Effective Stretching Techniques','Learn the best stretching techniques to prevent injuries.','2024-05-31 13:36:42',7,'7'),(8,'Choosing the Right Fitness Gear','Tips for selecting the best gear for your workouts.','2024-05-31 13:36:42',8,'8');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `BrandID` int NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(50) NOT NULL,
  `BrandDesc` text,
  PRIMARY KEY (`BrandID`),
  UNIQUE KEY `BrandName` (`BrandName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Nike','Leading sports brand known for its athletic footwear, apparel, and equipment.'),(2,'Adidas','Global brand known for sportswear and accessories.'),(3,'Puma','International brand famous for sports and lifestyle products.');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `CategoryDesc` text,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Footwear','Various types of athletic and casual footwear.'),(2,'Apparel','Sports clothing and accessories.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `ContactID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Message` text,
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `DiscountID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`DiscountID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,1,20.00,'2024-05-31','2024-06-30',1),(2,2,15.00,'2024-05-31','2024-06-30',1);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Rating` int NOT NULL,
  `Content` text,
  `Image` text,
  `FeedbackDate` date NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `feedback_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,2,1,5,'Great running shoes!','feedback1.jpg','2024-05-31',1),(2,2,2,4,'Very comfortable.','feedback2.jpg','2024-05-31',1);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `ImageID` int NOT NULL AUTO_INCREMENT,
  `Image` text,
  `ProductID` int NOT NULL,
  PRIMARY KEY (`ImageID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'https://vinsport.vn/wp-content/uploads/2020/09/Bo-quan-ao-the-thao-thoi-trang-khong-logo-adidas-3-ba-la-nhieu-mau-xanh.jpg',1),(2,'https://vinsport.vn/wp-content/uploads/2020/09/Bo-quan-ao-the-thao-thoi-trang-khong-logo-adidas-3-ba-la-nhieu-mau-trang-tui.jpg',2),(3,'https://vn-test-11.slatic.net/p/1a1f9f9e41c4466efd5c7f525be5a531.jpg',3),(4,'https://s4.shopbay.vn/files/285/ao-training-tuyen-duc-euro-2021-60f2633744fdd.jpg',4),(5,'https://filebroker-cdn.lazada.vn/kf/S4a20d1b337bd477c941ef4d0941d2f06u.jpg',5),(6,'https://vinsport.vn/my_uploads/2022/06/Bo-do-quan-ao-da-bong-hang-da-banh-clb-bara-barcelona-soc-xanh-vang-cam-logo-theu-me-thai-0.jpg',6),(7,'https://vinsport.vn/wp-content/uploads/2023/09/Bo-quan-ao-bong-da-Chelsea-23-24-san-nha-mau-xanh-tim-than-full-logo-nike-nam-2023-2024.jpg',7),(8,'https://www.sport9.vn/images/thumbs/002/0021514_bo-quan-ao-bong-da-doi-tuyen-quoc-gia-italia-mau-trang-xanh.jpeg?preset=large&watermark=default',8),(9,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX3IMmKcKmcTGp_D77ZMzIGFOS4wcRh2jgvA&s',9),(10,'https://vn-live-01.slatic.net/p/6438dc96529edd2a5cf1f8695bb21a2a.jpg',10),(11,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgPhK6GcA9gsh8UU7St-0TZtoXPB5Jp5zxCQ&s',11),(12,'https://bizweb.dktcdn.net/thumb/grande/100/180/757/products/4648116quan-ao-bong-da-khong-logo-puma-speed-trang-jpeg.jpg?v=1487739238467',12),(13,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1WsLVPdcginDSYszp9SOMPLODhRYlJN3xuvvVdL5gKgoKOYI2qrZClxvOxMDj4Jn5Ez4&usqp=CAU',13),(14,'https://vinsport.vn/my_uploads/2022/07/Bo-quan-ao-bong-da-doi-tuyen-quoc-gia-y-italia-jersey-trang-vien-xanh-moi-puma.jpg',14),(15,'https://down-vn.img.susercontent.com/file/f3c40a83a5aecf9c66a79e49bcec88b9',15),(16,'https://www.sport9.vn/images/uploaded/blog%206/adidas-x-crazyfast%20(5).jpg',16),(17,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAQQGa7vw6cl38KplcicwiDbBsaShchzyfgw&s',17),(18,'https://product.hstatic.net/1000402257/product/giay_da_bong_predator_freak_3_d2c203ca889d401ea32ada3bf5fdfcc7_grande.jpg',18),(19,'https://pos.nvncdn.com/6a2bd9-54198/ps/20230817_hTUI4Zvic7.jpeg',19),(20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUqx6s_irzOMvHUcHr6T8auKmkXk5bnYdL0Q&s',20),(21,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNNWzdyVcGB8wxoiMK6I52z8IztY-QWes5QQ&s',21),(22,'https://product.hstatic.net/1000061481/product/anh_sp_add_web_3-02-02-02_d327c394fb334b45a65d6ef60c6a9042_1024x1024.jpg',22),(23,'https://img.websosanh.vn/v2/users/root_product/images/giay-da-bong-nike-vapor-cv0978/j7qsz1xuhh03y.jpg',23),(24,'https://thuhiensport.com/wp-content/uploads/2019/04/giay-da-bong-nike.jpg',24),(25,'https://zocker.vn/pic/Images/Module/News/images/tai-sao-nen-chon-giay-da-bong-san-co-nhan-tao-nike-4.jpg',25),(26,'https://product.hstatic.net/200000601263/product/374e8129a09e400698398657ad80eeb9_6927eaab7a054094979292f6ece54cba.jpg',26),(27,'https://product.hstatic.net/200000601263/product/75b9d8dc4f5a44a8b8608e31f86a9a31_07cd36b015b24068bf825568d73bd8dd.jpg',27),(28,'https://bizweb.dktcdn.net/100/340/988/products/giay-da-bong-38-4201c148-5c3d-4c2b-b837-74d5505bbf0c.jpg?v=1625903205387',28),(29,'https://giaydabongtot.com/wp-content/uploads/2023/03/IMG_E0526.jpg',29),(30,'https://giaydabongtot.com/wp-content/uploads/2023/02/IMG_E0530-1000x1000.jpg',30);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `FullName` text,
  `OrderDate` date DEFAULT NULL,
  `DeliverDate` date DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `Email` text,
  `Address` text,
  `PaymentMethodID` int DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `StatusID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `PaymentMethodID` (`PaymentMethodID`),
  KEY `StatusID` (`StatusID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`StatusID`) REFERENCES `orderstatus` (`StatusID`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,'John Doe','2024-05-31','2024-06-07','4445556666','john.doe@example.com','456 John St.',1,420.00,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `orderdetail_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,1,2,240.00),(2,1,2,1,180.00);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `StatusID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'Pending','Order is pending.'),(2,'Shipped','Order has been shipped.');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `PaymentMethodID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Credit Card','Payment via credit card.'),(2,'PayPal','Payment via PayPal.');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) NOT NULL,
  `ProductPrice` decimal(10,2) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `ProductRating` int DEFAULT NULL,
  `ProductDesc` text NOT NULL,
  `BrandID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductName` (`ProductName`),
  KEY `BrandID` (`BrandID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`BrandID`) REFERENCES `brand` (`BrandID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`),
  CONSTRAINT `product_chk_1` CHECK ((`ProductPrice` >= 0)),
  CONSTRAINT `product_chk_2` CHECK ((`Stock` >= 0)),
  CONSTRAINT `product_chk_3` CHECK ((`ProductRating` between 0 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Adidas Shirt 1',180.00,50,4,'Adidas Shirt',2,2),(2,'Adidas Shirt 2',185.00,50,4,'Adidas Shirt',2,2),(3,'Adidas Shirt 3',190.00,50,4,'Adidas Shirt',2,2),(4,'Adidas Shirt 4',195.00,50,4,'Adidas Shirt',2,2),(5,'Adidas Shirt 5',200.00,50,4,'Adidas Shirt',2,2),(6,'Nike Shirt 1',180.00,50,4,'Nike Shirt',1,1),(7,'Nike Shirt 2',185.00,50,4,'Nike Shirt',1,1),(8,'Nike Shirt 3',190.00,50,4,'Nike Shirt',1,1),(9,'Nike Shirt 4',195.00,50,4,'Nike Shirt',1,1),(10,'Nike Shirt 5',200.00,50,4,'Nike Shirt',1,1),(11,'Puma Shirt 1',180.00,50,4,'Puma Shirt',3,1),(12,'Puma Shirt 2',185.00,50,4,'Puma Shirt',3,1),(13,'Puma Shirt 3',190.00,50,4,'Puma Shirt',3,1),(14,'Puma Shirt 4',195.00,50,4,'Puma Shirt',3,1),(15,'Puma Shirt 5',200.00,50,4,'Puma Shirt',3,1),(16,'Adidas Shoes 1',220.00,50,5,'Adidas Shoes',2,2),(17,'Adidas Shoes 2',225.00,50,5,'Adidas Shoes',2,2),(18,'Adidas Shoes 3',230.00,50,5,'Adidas Shoes',2,2),(19,'Adidas Shoes 4',235.00,50,5,'Adidas Shoes',2,2),(20,'Adidas Shoes 5',240.00,50,5,'Adidas Shoes',2,2),(21,'Nike Shoes 1',220.00,50,5,'Nike Shoes',1,1),(22,'Nike Shoes 2',225.00,50,5,'Nike Shoes',1,1),(23,'Nike Shoes 3',230.00,50,5,'Nike Shoes',1,1),(24,'Nike Shoes 4',235.00,50,5,'Nike Shoes',1,1),(25,'Nike Shoes 5',240.00,50,5,'Nike Shoes',1,1),(26,'Puma Shoes 1',220.00,50,5,'Puma Shoes',3,1),(27,'Puma Shoes 2',225.00,50,5,'Puma Shoes',3,1),(28,'Puma Shoes 3',230.00,50,5,'Puma Shoes',3,1),(29,'Puma Shoes 4',235.00,50,5,'Puma Shoes',3,1),(30,'Puma Shoes 5',240.00,50,5,'Puma Shoes',3,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `ProductID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `SubCategoryID` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SubCategoryID` (`SubCategoryID`),
  CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `productcategory_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `productcategory_ibfk_3` FOREIGN KEY (`SubCategoryID`) REFERENCES `subcategory` (`SubCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,1,NULL),(2,1,NULL),(3,1,NULL),(4,1,NULL),(5,1,NULL),(6,1,NULL),(7,1,NULL),(8,1,NULL),(9,1,NULL),(10,1,NULL),(11,1,NULL),(12,1,NULL),(13,1,NULL),(14,1,NULL),(15,1,NULL),(16,2,NULL),(17,2,NULL),(18,2,NULL),(19,2,NULL),(20,2,NULL),(21,2,NULL),(22,2,NULL),(23,2,NULL),(24,2,NULL),(25,2,NULL),(26,2,NULL),(27,2,NULL),(28,2,NULL),(29,2,NULL),(30,2,NULL);
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund` (
  `OrderDetailID` int NOT NULL,
  `RefundDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Reason` text,
  `Image` text,
  `RefundStatus` int DEFAULT NULL,
  `DeclineReason` text,
  PRIMARY KEY (`OrderDetailID`),
  CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`OrderDetailID`) REFERENCES `orderdetail` (`OrderDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (1,'2024-05-31 13:36:42','Size too small',NULL,0,NULL),(2,'2024-05-31 13:36:42','Changed mind',NULL,0,NULL);
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) NOT NULL,
  `RoleDesc` text,
  PRIMARY KEY (`RoleID`),
  UNIQUE KEY `RoleName` (`RoleName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','Administrator with full access.'),(2,'Marketing','Marketing personnel with access to marketing operations.'),(3,'Sale','Sales personnel with access to sales operations.'),(4,'Customer','Regular customer with limited access.');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `SubCategoryID` int NOT NULL AUTO_INCREMENT,
  `SubCategoryName` varchar(50) NOT NULL,
  `SubCategoryDesc` text,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`SubCategoryID`),
  UNIQUE KEY `SubCategoryName` (`SubCategoryName`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Running Shoes','Shoes designed for running.',1),(2,'Basketball Shoes','Shoes designed for playing basketball.',1),(3,'Jackets','Sports jackets for various activities.',2);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(50) NOT NULL,
  `SupplierEmail` varchar(50) DEFAULT NULL,
  `SupplierPhone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Global Sports Supplies','contact@globalsports.com','123-456-7890'),(2,'SportGear Inc.','info@sportgear.com','987-654-3210');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `RoleID` int NOT NULL,
  `Avatar` text,
  `FullName` varchar(50) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','adminpass',1,'avatar1.jpg','Admin User','Male','111-222-3333','admin@example.com','123 Admin St.'),(2,'johndoe','johnpass',4,'avatar2.jpg','John Doe','Male','444-555-6666','john.doe@example.com','456 John St.'),(3,'sale1','sale1pass',3,'avatar3.jpg','Alice Brown','Female','222-333-4444','alice.brown@example.com','100 Sale St.'),(4,'sale2','sale2pass',3,'avatar4.jpg','Bob Smith','Male','333-444-5555','bob.smith@example.com','101 Sale St.'),(5,'sale3','sale3pass',3,'avatar5.jpg','Carol Johnson','Female','444-555-6666','carol.johnson@example.com','102 Sale St.'),(6,'sale4','sale4pass',3,'avatar6.jpg','David Lee','Male','555-666-7777','david.lee@example.com','103 Sale St.'),(7,'sale5','sale5pass',3,'avatar7.jpg','Eva Davis','Female','666-777-8888','eva.davis@example.com','104 Sale St.'),(8,'marketing1','marketing1pass',2,'avatar8.jpg','Fiona Harris','Female','777-888-9999','fiona.harris@example.com','200 Marketing St.'),(9,'marketing2','marketing2pass',2,'avatar9.jpg','George Clark','Male','888-999-0000','george.clark@example.com','201 Marketing St.'),(10,'marketing3','marketing3pass',2,'avatar10.jpg','Hannah Scott','Female','999-000-1111','hannah.scott@example.com','202 Marketing St.'),(11,'marketing4','marketing4pass',2,'avatar11.jpg','Ian Adams','Male','000-111-2222','ian.adams@example.com','203 Marketing St.'),(12,'marketing5','marketing5pass',2,'avatar12.jpg','Jackie Thompson','Female','111-222-3333','jackie.thompson@example.com','204 Marketing St.'),(13,'StarPacusa1','nCyvT+mCGRvQFM4uf1O254Io32A=',4,NULL,'Vũ Quang Linh','Other',NULL,'vuquanglinhfuhn@gmail.com',NULL),(14,'trungnguyen','nCyvT+mCGRvQFM4uf1O254Io32A=',4,NULL,'Nguyen Duc Trung','Other','123abc','zzakonlovezzz@gmail.com','HN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercart`
--

DROP TABLE IF EXISTS `usercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercart` (
  `UserCartID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`UserCartID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `usercart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `usercart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `usercart_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart`
--

LOCK TABLES `usercart` WRITE;
/*!40000 ALTER TABLE `usercart` DISABLE KEYS */;
INSERT INTO `usercart` VALUES (1,2,1,1,180.00),(2,2,2,1,185.00),(3,2,3,1,190.00),(4,2,4,1,195.00),(5,2,5,1,200.00),(6,2,6,1,180.00),(7,2,7,1,185.00),(8,2,8,1,190.00),(9,2,9,1,195.00),(10,2,10,1,200.00),(11,2,11,1,180.00),(12,2,12,1,185.00),(13,2,13,1,190.00),(14,2,14,1,195.00),(15,2,15,1,200.00),(16,2,16,1,220.00),(17,2,17,1,225.00),(18,2,18,1,230.00),(19,2,19,1,235.00),(20,2,20,1,240.00),(21,2,21,1,220.00),(22,2,22,1,225.00),(23,2,23,1,230.00),(24,2,24,1,235.00),(25,2,25,1,240.00),(26,2,26,1,220.00),(27,2,27,1,225.00),(28,2,28,1,230.00),(29,2,29,1,235.00),(30,2,30,1,240.00);
/*!40000 ALTER TABLE `usercart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userswishlist`
--

DROP TABLE IF EXISTS `userswishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userswishlist` (
  `UserID` int NOT NULL,
  `ProductID` int NOT NULL,
  PRIMARY KEY (`UserID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `userswishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `userswishlist_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userswishlist`
--

LOCK TABLES `userswishlist` WRITE;
/*!40000 ALTER TABLE `userswishlist` DISABLE KEYS */;
INSERT INTO `userswishlist` VALUES (2,1),(2,2);
/*!40000 ALTER TABLE `userswishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 16:11:48
