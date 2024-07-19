-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookshoponline
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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `Bio` text,
  PRIMARY KEY (`AuthorID`),
  UNIQUE KEY `AuthorName` (`AuthorName`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'John Smith','Designer of soccer shoes'),(2,'Jane Doe','Expert in soccer apparel design'),(3,'Michael Brown','Renowned soccer shoe designer'),(4,'Emily Johnson','Specialist in designing soccer clothing'),(5,'Chris Lee','Creative designer of sports footwear'),(6,'Patricia Williams','Innovative soccer apparel designer'),(7,'David Jones','Expert in athletic shoe design'),(8,'Sarah Davis','Designer of modern soccer gear'),(9,'James Martinez','Creative soccer clothing designer'),(10,'Laura Wilson','Specialist in sports shoe design'),(11,'Daniel Anderson','Renowned designer of soccer kits'),(12,'Megan Thomas','Expert in designing sports attire'),(13,'Joshua Taylor','Innovative soccer shoe designer'),(14,'Sophia White','Creative designer of athletic clothing'),(15,'Brandon Harris','Specialist in soccer apparel'),(16,'Ava Clark','Expert in designing soccer footwear'),(17,'Ryan Lewis','Innovative soccer clothing designer'),(18,'Olivia Robinson','Creative sports shoe designer'),(19,'Ethan Walker','Designer of modern soccer apparel'),(20,'Isabella Young','Renowned designer of soccer gear'),(21,'Mason Allen','Specialist in sports apparel design'),(22,'Amelia King','Creative designer of soccer footwear'),(23,'Lucas Scott','Expert in soccer shoe design'),(24,'Mia Green','Innovative designer of athletic apparel'),(25,'Henry Adams','Renowned soccer apparel designer'),(26,'Emma Baker','Specialist in designing soccer shoes'),(27,'Alexander Gonzalez','Creative designer of soccer clothing'),(28,'Sophia Nelson','Innovative sports shoe designer'),(29,'Benjamin Carter','Expert in soccer gear design'),(30,'Chloe Mitchell','Creative soccer apparel designer'),(31,'William Perez','Designer of modern sports footwear'),(32,'Grace Roberts','Renowned designer of soccer clothing'),(33,'Jack Turner','Specialist in soccer shoe design'),(34,'Lily Phillips','Innovative designer of athletic gear'),(35,'Michael Campbell','Creative sports apparel designer'),(36,'Emily Parker','Expert in designing soccer shoes'),(37,'Christopher Evans','Renowned soccer clothing designer'),(38,'Mia Edwards','Innovative designer of soccer footwear'),(39,'Matthew Collins','Creative designer of athletic apparel'),(40,'Isabella Stewart','Specialist in soccer gear design'),(41,'Andrew Sanchez','Expert in designing sports shoes'),(42,'Sophia Morris','Innovative designer of soccer clothing'),(43,'Joshua Rogers','Creative designer of athletic footwear'),(44,'Ava Reed','Renowned designer of soccer apparel'),(45,'Daniel Cook','Specialist in designing soccer shoes'),(46,'Emma Morgan','Innovative sports apparel designer'),(47,'Ryan Bell','Creative designer of soccer footwear');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text NOT NULL,
  `img` text,
  `author_id` int NOT NULL,
  `post_date` date DEFAULT NULL,
  `blog_category` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `views` int NOT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `fk_blog_category` (`blog_category`),
  CONSTRAINT `fk_blog_category` FOREIGN KEY (`blog_category`) REFERENCES `categoryblog` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Bài đăng số 1','Nội dung cho bài đăng số 1. Đây là bài viết thứ nhất về một chủ đề nào đó.','https://media-cdn-v2.laodong.vn/storage/newsportal/2023/8/26/1233821/Giai-Nhi-1--Nang-Tre.jpg',101,'2024-07-17',1,1,0,_binary ''),(2,'Bài đăng số 2','Nội dung cho bài đăng số 2. Đây là bài viết thứ hai với nội dung khác về một chủ đề khác.','https://media-cdn-v2.laodong.vn/storage/newsportal/2023/8/26/1233821/Giai-Nhi-1--Nang-Tre.jpg',102,'2024-07-18',1,1,0,_binary ''),(3,'Cuộc sống ở thành phố lớn và những thách thức của nó','Trải qua cuộc sống ở thành phố lớn, con người phải đối mặt với nhiều thách thức khác nhau. Những bài viết này sẽ giúp bạn khám phá những cảm xúc, những trải nghiệm thực tế từ cuộc sống đô thị hiện đại.','https://dsdhome.vn/uploads/products/phong-cach-song-ben-vung-4.jpg',101,'2024-07-17',1,1,0,_binary ''),(4,'Những bí mật tâm linh mà bạn chưa từng biết đến','Khám phá những bí mật tâm linh kỳ bí, những câu chuyện chưa từng kể từ các vùng quê hẻo lánh đến những thành phố sầm uất.','https://suckhoedoisong.qltns.mediacdn.vn/Images/duylinh/2017/06/08/02tamlinh_resize.jpg',102,'2024-07-18',2,1,0,_binary ''),(5,'Phong cách sống tự nhiên và lối sống bền vững','Cùng khám phá phong cách sống tự nhiên, những lối sống bền vững đang được ưa chuộng trên khắp thế giới. Từ việc tái chế đến sử dụng năng lượng tái tạo, hãy để chúng tôi dẫn bạn qua những hành trình kỳ diệu của những người tiên phong.','https://dsdhome.vn/uploads/products/phong-cach-song-ben-vung-4.jpg',103,'2024-07-19',1,1,0,_binary ''),(6,'Mẹo vặt giúp bạn tiết kiệm thời gian trong cuộc sống hàng ngày','Những mẹo vặt đơn giản nhưng hiệu quả sẽ giúp bạn tiết kiệm thời gian và nâng cao chất lượng cuộc sống. Từ việc quản lý thời gian đến sắp xếp công việc, hãy cùng khám phá các bí quyết từ những người thành công.','https://dsdhome.vn/uploads/products/phong-cach-song-ben-vung-4.jpg',104,'2024-07-20',2,1,0,_binary ''),(7,'Cẩm nang du lịch: Điểm đến lý tưởng cho mùa hè này','Bạn đang băn khoăn không biết nên đi đâu cho mùa hè này? Hãy cùng chúng tôi khám phá các địa điểm du lịch lý tưởng, từ biển xanh đến núi non hùng vĩ, sẽ là điểm đến không thể bỏ lỡ!','https://dsdhome.vn/uploads/products/phong-cach-song-ben-vung-4.jpg',105,'2024-07-21',3,1,0,_binary '');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `BookTitle` varchar(100) NOT NULL,
  `BookCost` float DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `BookRate` int DEFAULT NULL,
  `BookDesc` text NOT NULL,
  `AuthorID` int DEFAULT NULL,
  `PublisherID` int DEFAULT NULL,
  `BookStatus` int DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  UNIQUE KEY `BookTitle` (`BookTitle`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`AuthorID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`PublisherID`) REFERENCES `publisher` (`PublisherID`),
  CONSTRAINT `book_chk_1` CHECK ((`BookCost` >= 0)),
  CONSTRAINT `book_chk_2` CHECK ((`Stock` >= 0)),
  CONSTRAINT `book_chk_3` CHECK ((`BookRate` between 0 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Brazil Home Shirt',19.99,50,5,'Official home shirt of the Brazil national football team for the current season',1,5,1),(2,'Germany Away Shirt',29.99,8,4,'Official away shirt of the Germany national football team, designed for comfort and style',2,4,1),(3,'Argentina Third Kit',14.99,20,4,'Special third kit for the Argentina national football team, featuring a unique design',3,5,1),(4,'France Home Shirt',24.99,37,5,'Classic home shirt of the France national football team, representing the team\'s heritage',1,2,1),(5,'Italy Away Shirt',8.25,49,3,'Away shirt of the Italy national football team with a modern and sleek design',4,1,1),(6,'Spain Third Kit',8,40,5,'Third kit of the Spain national football team, designed for top performance and style',5,4,1),(7,'England Home Shirt',9.99,45,3,'Home shirt of the England national football team with the latest technology for maximum comfort',6,4,1),(8,'Netherlands Away Shirt',59.99,40,5,'Away shirt of the Netherlands national football team, combining tradition and innovation',7,2,1),(9,'Portugal Home Shirt',8.99,40,5,'Home shirt of the Portugal national football team, showcasing the team\'s iconic colors',8,3,1),(10,'Belgium Third Kit',10.99,40,4,'Third kit of the Belgium national football team with a bold and modern design',9,4,1),(11,'Manchester United Home Shirt',8.99,59,5,'Official home shirt of Manchester United for the current season',10,3,1),(12,'Real Madrid Away Shirt',19.99,30,4,'Official away shirt of Real Madrid, designed for comfort and style',11,3,1),(13,'Barcelona Third Kit',12.99,40,5,'Special third kit for FC Barcelona, featuring a unique design',12,6,1),(14,'Liverpool Home Shirt',25,35,5,'Classic Liverpool home shirt, representing the club\'s heritage',9,2,1),(15,'Juventus Away Shirt',22,40,4,'Juventus away shirt with a modern and sleek design',42,5,1),(16,'Chelsea Third Kit',23,30,4,'Chelsea\'s third kit, designed for top performance and style',1,4,1),(17,'Paris Saint-Germain Home Shirt',26,45,5,'PSG home shirt with the latest technology for maximum comfort',13,6,1),(18,'Bayern Munich Away Shirt',24,50,4,'Bayern Munich away shirt, combining tradition and innovation',47,4,1),(19,'Arsenal Home Shirt',21,38,4,'Arsenal home shirt, showcasing the club\'s iconic colors',19,3,1),(20,'Inter Milan Third Kit',27,32,5,'Inter Milan third kit with a bold and modern design',28,6,1),(21,'Plain Red Football Shirt',20,50,4,'High-quality plain red football shirt without any logos or branding',24,5,1),(22,'Plain Blue Football Shirt',22,40,4,'Durable plain blue football shirt designed for comfort and performance',8,6,1),(23,'Plain White Football Shirt',24,35,4,'Classic plain white football shirt suitable for any team',19,4,1),(24,'Plain Black Football Shirt',26,37,5,'Stylish plain black football shirt, perfect for training or matches',13,5,1),(25,'Plain Green Football Shirt',23,42,4,'Vibrant plain green football shirt, ideal for outdoor play',21,2,1),(26,'Los Angeles Lakers Home Jersey',28,36,5,'Official home jersey of the Los Angeles Lakers for the current season',38,5,1),(27,'Chicago Bulls Away Jersey',21,50,4,'Official away jersey of the Chicago Bulls, designed for comfort and style',9,2,1),(28,'Golden State Warriors Third Jersey',25,33,5,'Special third jersey for the Golden State Warriors, featuring a unique design',15,5,1),(29,'Miami Heat Home Jersey',20,45,4,'Classic home jersey of the Miami Heat, representing the team\'s heritage',7,1,1),(30,'Boston Celtics Away Jersey',22,40,4,'Away jersey of the Boston Celtics with a modern and sleek design',4,1,1),(31,'Nike Court Dri-FIT Tennis Shirt',27,37,5,'High-performance tennis shirt by Nike, featuring Dri-FIT technology for maximum comfort',44,2,1),(32,'Adidas Freelift Tennis Polo',25,42,4,'Adidas tennis polo with Freelift design for enhanced range of motion',44,6,1),(33,'Under Armour Tech Tennis Tee',23,35,4,'Under Armour tennis tee with lightweight and breathable fabric',7,5,1),(34,'Wilson Team Tennis Shirt',26,39,5,'Classic Wilson tennis shirt, perfect for team play and training',26,5,1),(35,'Lacoste Sport Tennis Polo',22,50,4,'Elegant tennis polo by Lacoste, combining style and performance',43,6,1),(36,'Babolat Performance Tennis Shirt',24,45,4,'High-quality performance tennis shirt by Babolat, designed for comfort and durability',14,3,1),(37,'Yonex Tournament Tennis Shirt',21,38,4,'Yonex tennis shirt, perfect for tournaments and competitive play',21,5,1),(38,'Fila Heritage Tennis Polo',20,50,4,'Fila tennis polo with heritage design, blending classic style with modern performance',32,1,1),(39,'New Balance Tournament Tennis Top',25,40,5,'New Balance tennis top, providing excellent breathability and comfort',33,2,1),(40,'Head Vision Tennis Shirt',28,35,5,'Head Vision tennis shirt, offering high performance and stylish design',2,6,1),(41,'Nike Windrunner Jacket',22,37,4,'Classic Nike Windrunner jacket, ideal for all weather conditions',22,1,1),(42,'Adidas Tiro 21 Track Jacket',23,42,4,'Adidas Tiro 21 track jacket, perfect for training and casual wear',24,2,1),(43,'Under Armour Storm Jacket',21,30,4,'Under Armour Storm jacket, designed to repel water and keep you dry',23,3,1),(44,'Puma Teamfinal Training Jacket',24,45,4,'Puma Teamfinal training jacket, offering great comfort and style',31,3,1),(45,'Reebok Classics Vector Track Jacket',27,35,5,'Reebok Classics Vector track jacket, a timeless piece for your wardrobe',7,2,1),(46,'Nike Dri-FIT Long Sleeve Shirt',20,50,4,'Nike Dri-FIT long sleeve shirt, providing sweat-wicking performance and comfort',33,3,1),(47,'Adidas Own The Run Long Sleeve Tee',22,40,4,'Adidas Own The Run long sleeve tee, perfect for running and workouts',4,2,1),(48,'Under Armour Tech Long Sleeve Shirt',23,35,4,'Under Armour Tech long sleeve shirt, lightweight and breathable for maximum comfort',4,2,1),(49,'Puma Long Sleeve Running Top',24,42,4,'Puma long sleeve running top, designed for optimal performance and style',41,2,1),(50,'Reebok Long Sleeve Training Shirt',25,38,5,'Reebok long sleeve training shirt, offering comfort and flexibility for workouts',38,3,1),(51,'Nike Tiempo Legend 8 TF',26,45,5,'Nike Tiempo Legend 8 TF football shoes, designed for turf surfaces with excellent grip and comfort',7,5,1),(52,'Adidas X Ghosted TF',20,50,4,'Adidas X Ghosted TF football shoes, lightweight and perfect for fast movements on turf',35,1,1),(53,'Puma Future Z 1.1 TF',22,40,4,'Puma Future Z 1.1 TF football shoes, providing exceptional fit and agility for turf play',28,3,1),(54,'New Balance Audazo V5 TF',23,35,4,'New Balance Audazo V5 TF football shoes, ideal for precise control and quick turns on turf',22,6,1),(55,'Mizuno Rebula Cup TF',24,42,4,'Mizuno Rebula Cup TF football shoes, offering comfort and durability for turf games',23,6,1),(56,'Umbro Speciali Eternal TF',25,38,5,'Umbro Speciali Eternal TF football shoes, combining classic design with modern technology for turf',44,1,1),(57,'Asics DS Light TF',26,45,5,'Asics DS Light TF football shoes, providing lightweight performance and excellent traction on turf',21,3,1),(58,'Joma Top Flex TF',20,50,4,'Joma Top Flex TF football shoes, designed for flexibility and comfort on turf surfaces',44,5,1),(59,'Diadora Capitano TF',22,40,4,'Diadora Capitano TF football shoes, offering durability and control for turf play',37,2,1),(60,'Hummel Aerocharge TF',23,35,4,'Hummel Aerocharge TF football shoes, providing explosive speed and great grip on turf',14,4,1),(61,'Nike Phantom GT2 AG',24,42,4,'Nike Phantom GT2 AG football shoes, designed for artificial grass with superior control and agility',30,5,1),(62,'Adidas Predator Freak AG',25,38,5,'Adidas Predator Freak AG football shoes, offering excellent grip and power on artificial grass',6,3,1),(63,'Puma Ultra 1.2 AG',26,45,5,'Puma Ultra 1.2 AG football shoes, lightweight and perfect for fast play on artificial grass',38,4,1),(64,'New Balance Furon V6 AG',20,50,4,'New Balance Furon V6 AG football shoes, designed for speed and precision on artificial grass',44,5,1),(65,'Mizuno Morelia Neo AG',22,40,4,'Mizuno Morelia Neo AG football shoes, offering classic style with modern performance for artificial grass',15,2,1),(66,'Umbro Velocita AG',23,35,4,'Umbro Velocita AG football shoes, providing excellent speed and traction on artificial grass',28,1,1),(67,'Asics Lethal Speed AG',24,42,4,'Asics Lethal Speed AG football shoes, designed for agility and comfort on artificial grass',15,3,1),(68,'Joma Propulsion AG',25,38,5,'Joma Propulsion AG football shoes, lightweight and durable for artificial grass play',28,5,1),(69,'Diadora Brasil Elite AG',26,45,5,'Diadora Brasil Elite AG football shoes, combining tradition with modern technology for artificial grass',11,4,1),(70,'Hummel Rapid X AG',20,50,4,'Hummel Rapid X AG football shoes, providing explosive performance and great grip on artificial grass',41,2,1),(71,'Nike Lunar Gato II',22,40,4,'Nike Lunar Gato II futsal shoes, designed for indoor play with excellent cushioning and grip',14,1,1),(72,'Adidas Top Sala',23,35,4,'Adidas Top Sala futsal shoes, offering lightweight performance and great control for indoor play',31,3,1),(73,'Puma Invicto Sala',24,42,4,'Puma Invicto Sala futsal shoes, providing durability and comfort for futsal games',33,1,1),(74,'Kelme Precision',25,38,5,'Kelme Precision futsal shoes, known for their excellent touch and flexibility on indoor courts',20,2,1),(75,'Munich Gresca',26,45,5,'Munich Gresca futsal shoes, offering superb grip and control for indoor futsal play',38,1,1),(76,'Nike Air Zoom Pegasus 38',20,50,4,'Nike Air Zoom Pegasus 38 running shoes, offering responsive cushioning and support for daily runs',24,2,1),(77,'Adidas Ultraboost 21',22,40,4,'Adidas Ultraboost 21 running shoes, providing exceptional energy return and comfort',10,3,1),(78,'Asics Gel-Kayano 27',23,35,4,'Asics Gel-Kayano 27 running shoes, designed for stability and support during long runs',14,1,1),(79,'Brooks Ghost 13',24,42,4,'Brooks Ghost 13 running shoes, offering smooth transitions and soft cushioning for a comfortable run',33,3,1),(80,'New Balance Fresh Foam 1080v11',25,38,5,'New Balance Fresh Foam 1080v11 running shoes, providing plush cushioning and a smooth ride',32,4,1),(81,'Saucony Ride 14',26,45,5,'Saucony Ride 14 running shoes, delivering a balanced and comfortable running experience',20,3,1),(82,'Hoka One One Clifton 7',20,50,4,'Hoka One One Clifton 7 running shoes, known for their lightweight and maximal cushioning',38,3,1),(83,'Mizuno Wave Rider 24',22,40,4,'Mizuno Wave Rider 24 running shoes, offering responsive cushioning and a stable ride',27,1,1),(84,'Under Armour HOVR Sonic 4',23,35,4,'Under Armour HOVR Sonic 4 running shoes, providing energy return and comfort for long runs',21,3,1),(85,'Altra Escalante 2.5',24,42,4,'Altra Escalante 2.5 running shoes, featuring a zero-drop platform and comfortable cushioning for natural running',19,2,1),(86,'Adidas Tango Rosario',25,38,5,'Adidas Tango Rosario soccer ball, ideal for training and match play with durable construction',7,4,1),(87,'Nike Premier League Flight',26,45,5,'Nike Premier League Flight soccer ball, designed for professional-level performance and accuracy',37,5,1),(88,'Puma TeamFINAL 21.1',20,50,4,'Puma TeamFINAL 21.1 soccer ball, offering excellent flight stability and control',24,5,1),(89,'Select Brilliant Super TB',22,40,4,'Select Brilliant Super TB soccer ball, known for its top-quality materials and construction',20,6,1),(90,'Wilson NCAA Forte FYbrid II',23,35,4,'Wilson NCAA Forte FYbrid II soccer ball, perfect for collegiate-level play with superior performance',29,2,1),(91,'Mikasa SWL62',24,42,4,'Mikasa SWL62 soccer ball, designed for durability and consistent performance',36,2,1),(92,'Umbro Neo Pro',25,38,5,'Umbro Neo Pro soccer ball, featuring advanced technology for precise flight and control',41,4,1),(93,'Mitre Delta Max',26,45,5,'Mitre Delta Max soccer ball, offering excellent durability and performance for all levels of play',23,1,1),(94,'Molten VG-5000',20,50,4,'Molten VG-5000 soccer ball, known for its high-quality materials and consistent flight',17,5,1),(95,'Erima Hybrid Match',22,40,4,'Erima Hybrid Match soccer ball, combining traditional and innovative design for optimal performance',17,2,1),(96,'Mikasa V200W',23,35,4,'Mikasa V200W volleyball, official FIVB game ball with excellent flight stability and control',26,4,1),(97,'Molten FLISTATEC V5M5000',24,42,4,'Molten FLISTATEC V5M5000 volleyball, known for its superior performance and durability',34,4,1),(98,'Wilson AVP Official Beach Volleyball',25,38,5,'Wilson AVP official beach volleyball, designed for professional-level play on the sand',35,2,1),(99,'Tachikara SV5WSC Sensi-Tec',26,45,5,'Tachikara SV5WSC Sensi-Tec volleyball, featuring a soft-touch cover for improved feel and control',23,2,1),(100,'Spalding King of the Beach',20,50,4,'Spalding King of the Beach volleyball, ideal for competitive beach play with durable construction',25,6,1),(101,'Spalding NBA Official Game Ball',22,40,4,'Spalding NBA official game ball, used by the professional league and known for its quality',25,5,1),(102,'Wilson Evolution Game Ball',23,35,4,'Wilson Evolution game ball, offering a soft feel and excellent grip for indoor play',4,4,1),(103,'Molten BG4500',24,42,4,'Molten BG4500 basketball, FIBA approved with superior performance and durability',35,2,1),(104,'Baden Elite Indoor Game Ball',25,38,5,'Baden Elite indoor game ball, designed for top-level play with consistent bounce and control',15,2,1),(105,'Under Armour 495 Indoor/Outdoor Ball',26,45,5,'Under Armour 495 indoor/outdoor basketball, offering versatility and durability for all courts',13,3,1),(106,'Wilson US Open Tennis Ball',20,50,4,'Wilson US Open tennis ball, official ball of the US Open with excellent performance and durability',13,4,1),(107,'Penn Championship Tennis Ball',22,40,4,'Penn Championship tennis ball, known for its consistent bounce and long-lasting durability',24,3,1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookcategory`
--

DROP TABLE IF EXISTS `bookcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookcategory` (
  `BookID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `SubCategoryID` int DEFAULT NULL,
  PRIMARY KEY (`BookID`,`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SubCategoryID` (`SubCategoryID`),
  CONSTRAINT `bookcategory_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  CONSTRAINT `bookcategory_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `bookcategory_ibfk_3` FOREIGN KEY (`SubCategoryID`) REFERENCES `subcategory` (`SubCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookcategory`
--

LOCK TABLES `bookcategory` WRITE;
/*!40000 ALTER TABLE `bookcategory` DISABLE KEYS */;
INSERT INTO `bookcategory` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,2),(12,1,2),(13,1,2),(14,1,2),(15,1,2),(16,1,2),(17,1,2),(18,1,2),(19,1,2),(20,1,2),(21,1,3),(22,1,3),(23,1,3),(24,1,3),(25,1,3),(26,1,4),(27,1,4),(28,1,4),(29,1,4),(30,1,4),(31,1,5),(32,1,5),(33,1,5),(34,1,5),(35,1,5),(36,1,6),(37,1,6),(38,1,6),(39,1,6),(40,1,6),(41,1,7),(42,1,7),(43,1,7),(44,1,7),(45,1,7),(46,2,8),(47,2,8),(48,2,8),(49,2,8),(50,2,8),(51,2,8),(52,2,8),(53,2,9),(54,2,9),(55,2,9),(56,2,9),(57,2,9),(58,2,9),(59,2,9),(60,2,9),(61,2,9),(62,2,9),(63,2,9),(64,2,9),(65,2,9),(66,2,10),(67,2,10),(68,2,10),(69,2,10),(70,2,10),(71,2,11),(72,2,11),(73,2,11),(74,2,11),(75,2,11),(76,2,11),(77,2,11),(78,2,11),(79,2,11),(80,2,11),(81,2,11),(82,2,11),(83,2,11),(84,2,11),(85,2,11),(86,3,12),(87,3,12),(88,3,12),(89,3,12),(90,3,12),(91,3,12),(92,3,12),(93,3,12),(94,3,12),(95,3,12),(96,3,13),(97,3,13),(98,3,13),(99,3,13),(100,3,13),(101,3,14),(102,3,14),(103,3,14),(104,3,14),(105,3,14),(106,3,15),(107,3,15);
/*!40000 ALTER TABLE `bookcategory` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Clothes','Various types of clothing for sports and casual wear.'),(2,'Shoes','Different types of shoes for sports and casual wear.'),(3,'Ball','Various types of balls used in different sports.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoryblog`
--

DROP TABLE IF EXISTS `categoryblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoryblog` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryblog`
--

LOCK TABLES `categoryblog` WRITE;
/*!40000 ALTER TABLE `categoryblog` DISABLE KEYS */;
INSERT INTO `categoryblog` VALUES (1,'Du lịch'),(2,'Cẩm Nang'),(3,'Khác');
/*!40000 ALTER TABLE `categoryblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `mess` varchar(3500) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `BookID` int DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`DiscountID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `fbID` int NOT NULL AUTO_INCREMENT,
  `fbCusID` int NOT NULL,
  `fbProID` int NOT NULL,
  `fbStar` int NOT NULL,
  `fbContent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `fbImage` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `fbDate` date NOT NULL,
  `fbStatus` int NOT NULL,
  PRIMARY KEY (`fbID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,2,11,4,'trung ngu','','2024-07-19',1);
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
  `BookID` int NOT NULL,
  PRIMARY KEY (`ImageID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=2065 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (11,'assets/img/book_images/2_1.jpg',2),(12,'assets/img/book_images/2_2.jpg',2),(13,'assets/img/book_images/2_3.jpg',2),(14,'assets/img/book_images/2_4.jpg',2),(15,'assets/img/book_images/2_5.jpg',2),(16,'assets/img/book_images/3_1.jpg',3),(17,'assets/img/book_images/3_2.jpg',3),(18,'assets/img/book_images/3_3.jpg',3),(19,'assets/img/book_images/3_4.jpg',3),(20,'assets/img/book_images/3_5.jpg',3),(21,'assets/img/book_images/4_1.jpg',4),(22,'assets/img/book_images/4_2.jpg',4),(23,'assets/img/book_images/4_3.jpg',4),(24,'assets/img/book_images/4_4.jpg',4),(25,'assets/img/book_images/4_5.jpg',4),(26,'assets/img/book_images/5_1.jpg',5),(27,'assets/img/book_images/5_2.jpg',5),(28,'assets/img/book_images/5_3.jpg',5),(29,'assets/img/book_images/5_4.jpg',5),(30,'assets/img/book_images/5_5.jpg',5),(31,'assets/img/book_images/6_1.jpg',6),(32,'assets/img/book_images/6_2.jpg',6),(33,'assets/img/book_images/6_3.jpg',6),(34,'assets/img/book_images/6_4.jpg',6),(35,'assets/img/book_images/6_5.jpg',6),(36,'assets/img/book_images/7_1.jpg',7),(37,'assets/img/book_images/7_2.jpg',7),(38,'assets/img/book_images/7_3.jpg',7),(39,'assets/img/book_images/7_4.jpg',7),(40,'assets/img/book_images/7_5.jpg',7),(41,'assets/img/book_images/8_1.jpg',8),(42,'assets/img/book_images/8_2.jpg',8),(43,'assets/img/book_images/8_3.jpg',8),(44,'assets/img/book_images/8_4.jpg',8),(45,'assets/img/book_images/8_5.jpg',8),(46,'assets/img/book_images/9_1.jpg',9),(47,'assets/img/book_images/9_2.jpg',9),(48,'assets/img/book_images/9_3.jpg',9),(49,'assets/img/book_images/9_4.jpg',9),(50,'assets/img/book_images/9_5.jpg',9),(51,'assets/img/book_images/10_1.jpg',10),(52,'assets/img/book_images/10_2.jpg',10),(53,'assets/img/book_images/10_3.jpg',10),(54,'assets/img/book_images/10_4.jpg',10),(55,'assets/img/book_images/10_5.jpg',10),(56,'assets/img/book_images/11_1.jpg',11),(57,'assets/img/book_images/11_2.jpg',11),(58,'assets/img/book_images/11_3.jpg',11),(59,'assets/img/book_images/11_4.jpg',11),(60,'assets/img/book_images/11_5.jpg',11),(61,'assets/img/book_images/12_1.jpg',12),(62,'assets/img/book_images/12_2.jpg',12),(63,'assets/img/book_images/12_3.jpg',12),(64,'assets/img/book_images/12_4.jpg',12),(65,'assets/img/book_images/12_5.jpg',12),(66,'assets/img/book_images/13_1.jpg',13),(67,'assets/img/book_images/13_2.jpg',13),(68,'assets/img/book_images/13_3.jpg',13),(69,'assets/img/book_images/13_4.jpg',13),(70,'assets/img/book_images/13_5.jpg',13),(71,'assets/img/book_images/14_1.jpg',14),(72,'assets/img/book_images/14_2.jpg',14),(73,'assets/img/book_images/14_3.jpg',14),(74,'assets/img/book_images/14_4.jpg',14),(75,'assets/img/book_images/14_5.jpg',14),(76,'assets/img/book_images/15_1.jpg',15),(77,'assets/img/book_images/15_2.jpg',15),(78,'assets/img/book_images/15_3.jpg',15),(79,'assets/img/book_images/15_4.jpg',15),(80,'assets/img/book_images/15_5.jpg',15),(81,'assets/img/book_images/16_1.jpg',16),(82,'assets/img/book_images/16_2.jpg',16),(83,'assets/img/book_images/16_3.jpg',16),(84,'assets/img/book_images/16_4.jpg',16),(85,'assets/img/book_images/16_5.jpg',16),(86,'assets/img/book_images/17_1.jpg',17),(87,'assets/img/book_images/17_2.jpg',17),(88,'assets/img/book_images/17_3.jpg',17),(89,'assets/img/book_images/17_4.jpg',17),(90,'assets/img/book_images/17_5.jpg',17),(91,'assets/img/book_images/18_1.jpg',18),(92,'assets/img/book_images/18_2.jpg',18),(93,'assets/img/book_images/18_3.jpg',18),(94,'assets/img/book_images/18_4.jpg',18),(95,'assets/img/book_images/18_5.jpg',18),(96,'assets/img/book_images/19_1.jpg',19),(97,'assets/img/book_images/19_2.jpg',19),(98,'assets/img/book_images/19_3.jpg',19),(99,'assets/img/book_images/19_4.jpg',19),(100,'assets/img/book_images/19_5.jpg',19),(101,'assets/img/book_images/20_1.jpg',20),(102,'assets/img/book_images/20_2.jpg',20),(103,'assets/img/book_images/20_3.jpg',20),(104,'assets/img/book_images/20_4.jpg',20),(105,'assets/img/book_images/20_5.jpg',20),(106,'assets/img/book_images/21_1.jpg',21),(107,'assets/img/book_images/21_2.jpg',21),(108,'assets/img/book_images/21_3.jpg',21),(109,'assets/img/book_images/21_4.jpg',21),(110,'assets/img/book_images/21_5.jpg',21),(111,'assets/img/book_images/22_1.jpg',22),(112,'assets/img/book_images/22_2.jpg',22),(113,'assets/img/book_images/22_3.jpg',22),(114,'assets/img/book_images/22_4.jpg',22),(115,'assets/img/book_images/22_5.jpg',22),(116,'assets/img/book_images/23_1.jpg',23),(117,'assets/img/book_images/23_2.jpg',23),(118,'assets/img/book_images/23_3.jpg',23),(119,'assets/img/book_images/23_4.jpg',23),(120,'assets/img/book_images/23_5.jpg',23),(121,'assets/img/book_images/24_1.jpg',24),(122,'assets/img/book_images/24_2.jpg',24),(123,'assets/img/book_images/24_3.jpg',24),(124,'assets/img/book_images/24_4.jpg',24),(125,'assets/img/book_images/24_5.jpg',24),(126,'assets/img/book_images/25_1.jpg',25),(127,'assets/img/book_images/25_2.jpg',25),(128,'assets/img/book_images/25_3.jpg',25),(129,'assets/img/book_images/25_4.jpg',25),(130,'assets/img/book_images/25_5.jpg',25),(131,'assets/img/book_images/26_1.jpg',26),(132,'assets/img/book_images/26_2.jpg',26),(133,'assets/img/book_images/26_3.jpg',26),(134,'assets/img/book_images/26_4.jpg',26),(135,'assets/img/book_images/26_5.jpg',26),(136,'assets/img/book_images/27_1.jpg',27),(137,'assets/img/book_images/27_2.jpg',27),(138,'assets/img/book_images/27_3.jpg',27),(139,'assets/img/book_images/27_4.jpg',27),(140,'assets/img/book_images/27_5.jpg',27),(141,'assets/img/book_images/28_1.jpg',28),(142,'assets/img/book_images/28_2.jpg',28),(143,'assets/img/book_images/28_3.jpg',28),(144,'assets/img/book_images/28_4.jpg',28),(145,'assets/img/book_images/28_5.jpg',28),(146,'assets/img/book_images/29_1.jpg',29),(147,'assets/img/book_images/29_2.jpg',29),(148,'assets/img/book_images/29_3.jpg',29),(149,'assets/img/book_images/29_4.jpg',29),(150,'assets/img/book_images/29_5.jpg',29),(151,'assets/img/book_images/30_1.jpg',30),(152,'assets/img/book_images/30_2.jpg',30),(153,'assets/img/book_images/30_3.jpg',30),(154,'assets/img/book_images/30_4.jpg',30),(155,'assets/img/book_images/30_5.jpg',30),(156,'assets/img/book_images/31_1.jpg',31),(157,'assets/img/book_images/31_2.jpg',31),(158,'assets/img/book_images/31_3.jpg',31),(159,'assets/img/book_images/31_4.jpg',31),(160,'assets/img/book_images/31_5.jpg',31),(161,'assets/img/book_images/32_1.jpg',32),(162,'assets/img/book_images/32_2.jpg',32),(163,'assets/img/book_images/32_3.jpg',32),(164,'assets/img/book_images/32_4.jpg',32),(165,'assets/img/book_images/32_5.jpg',32),(166,'assets/img/book_images/33_1.jpg',33),(167,'assets/img/book_images/33_2.jpg',33),(168,'assets/img/book_images/33_3.jpg',33),(169,'assets/img/book_images/33_4.jpg',33),(170,'assets/img/book_images/33_5.jpg',33),(171,'assets/img/book_images/34_1.jpg',34),(172,'assets/img/book_images/34_2.jpg',34),(173,'assets/img/book_images/34_3.jpg',34),(174,'assets/img/book_images/34_4.jpg',34),(175,'assets/img/book_images/34_5.jpg',34),(176,'assets/img/book_images/35_1.jpg',35),(177,'assets/img/book_images/35_2.jpg',35),(178,'assets/img/book_images/35_3.jpg',35),(179,'assets/img/book_images/35_4.jpg',35),(180,'assets/img/book_images/35_5.jpg',35),(181,'assets/img/book_images/36_1.jpg',36),(182,'assets/img/book_images/36_2.jpg',36),(183,'assets/img/book_images/36_3.jpg',36),(184,'assets/img/book_images/36_4.jpg',36),(185,'assets/img/book_images/36_5.jpg',36),(186,'assets/img/book_images/37_1.jpg',37),(187,'assets/img/book_images/37_2.jpg',37),(188,'assets/img/book_images/37_3.jpg',37),(189,'assets/img/book_images/37_4.jpg',37),(190,'assets/img/book_images/37_5.jpg',37),(191,'assets/img/book_images/38_1.jpg',38),(192,'assets/img/book_images/38_2.jpg',38),(193,'assets/img/book_images/38_3.jpg',38),(194,'assets/img/book_images/38_4.jpg',38),(195,'assets/img/book_images/38_5.jpg',38),(196,'assets/img/book_images/39_1.jpg',39),(197,'assets/img/book_images/39_2.jpg',39),(198,'assets/img/book_images/39_3.jpg',39),(199,'assets/img/book_images/39_4.jpg',39),(200,'assets/img/book_images/39_5.jpg',39),(201,'assets/img/book_images/40_1.jpg',40),(202,'assets/img/book_images/40_2.jpg',40),(203,'assets/img/book_images/40_3.jpg',40),(204,'assets/img/book_images/40_4.jpg',40),(205,'assets/img/book_images/40_5.jpg',40),(206,'assets/img/book_images/41_1.jpg',41),(207,'assets/img/book_images/41_2.jpg',41),(208,'assets/img/book_images/41_3.jpg',41),(209,'assets/img/book_images/41_4.jpg',41),(210,'assets/img/book_images/41_5.jpg',41),(211,'assets/img/book_images/42_1.jpg',42),(212,'assets/img/book_images/42_2.jpg',42),(213,'assets/img/book_images/42_3.jpg',42),(214,'assets/img/book_images/42_4.jpg',42),(215,'assets/img/book_images/42_5.jpg',42),(216,'assets/img/book_images/43_1.jpg',43),(217,'assets/img/book_images/43_2.jpg',43),(218,'assets/img/book_images/43_3.jpg',43),(219,'assets/img/book_images/43_4.jpg',43),(220,'assets/img/book_images/43_5.jpg',43),(221,'assets/img/book_images/44_1.jpg',44),(222,'assets/img/book_images/44_2.jpg',44),(223,'assets/img/book_images/44_3.jpg',44),(224,'assets/img/book_images/44_4.jpg',44),(225,'assets/img/book_images/44_5.jpg',44),(226,'assets/img/book_images/45_1.jpg',45),(227,'assets/img/book_images/45_2.jpg',45),(228,'assets/img/book_images/45_3.jpg',45),(229,'assets/img/book_images/45_4.jpg',45),(230,'assets/img/book_images/45_5.jpg',45),(231,'assets/img/book_images/46_1.jpg',46),(232,'assets/img/book_images/46_2.jpg',46),(233,'assets/img/book_images/46_3.jpg',46),(234,'assets/img/book_images/46_4.jpg',46),(235,'assets/img/book_images/46_5.jpg',46),(236,'assets/img/book_images/47_1.jpg',47),(237,'assets/img/book_images/47_2.jpg',47),(238,'assets/img/book_images/47_3.jpg',47),(239,'assets/img/book_images/47_4.jpg',47),(240,'assets/img/book_images/47_5.jpg',47),(241,'assets/img/book_images/48_1.jpg',48),(242,'assets/img/book_images/48_2.jpg',48),(243,'assets/img/book_images/48_3.jpg',48),(244,'assets/img/book_images/48_4.jpg',48),(245,'assets/img/book_images/48_5.jpg',48),(246,'assets/img/book_images/49_1.jpg',49),(247,'assets/img/book_images/49_2.jpg',49),(248,'assets/img/book_images/49_3.jpg',49),(249,'assets/img/book_images/49_4.jpg',49),(250,'assets/img/book_images/49_5.jpg',49),(251,'assets/img/book_images/50_1.jpg',50),(252,'assets/img/book_images/50_2.jpg',50),(253,'assets/img/book_images/50_3.jpg',50),(254,'assets/img/book_images/50_4.jpg',50),(255,'assets/img/book_images/50_5.jpg',50),(256,'assets/img/book_images/51_1.jpg',51),(257,'assets/img/book_images/51_2.jpg',51),(258,'assets/img/book_images/51_3.jpg',51),(259,'assets/img/book_images/51_4.jpg',51),(260,'assets/img/book_images/51_5.jpg',51),(261,'assets/img/book_images/52_1.jpg',52),(262,'assets/img/book_images/52_2.jpg',52),(263,'assets/img/book_images/52_3.jpg',52),(264,'assets/img/book_images/52_4.jpg',52),(265,'assets/img/book_images/52_5.jpg',52),(276,'assets/img/book_images/1_1.jpg',1),(277,'assets/img/book_images/1_2.jpg',1),(278,'assets/img/book_images/1_3.jpg',1),(279,'assets/img/book_images/1_4.jpg',1),(280,'assets/img/book_images/1_5.jpg',1),(281,'assets/img/book_images/53_1.jpg',53),(282,'assets/img/book_images/53_2.jpg',53),(283,'assets/img/book_images/53_3.jpg',53),(284,'assets/img/book_images/53_4.jpg',53),(285,'assets/img/book_images/53_5.jpg',53),(286,'assets/img/book_images/54_1.jpg',54),(287,'assets/img/book_images/54_2.jpg',54),(288,'assets/img/book_images/54_3.jpg',54),(289,'assets/img/book_images/54_4.jpg',54),(290,'assets/img/book_images/54_5.jpg',54),(291,'assets/img/book_images/55_1.jpg',55),(292,'assets/img/book_images/55_2.jpg',55),(293,'assets/img/book_images/55_3.jpg',55),(294,'assets/img/book_images/55_4.jpg',55),(295,'assets/img/book_images/55_5.jpg',55),(296,'assets/img/book_images/56_1.jpg',56),(297,'assets/img/book_images/56_2.jpg',56),(298,'assets/img/book_images/56_3.jpg',56),(299,'assets/img/book_images/56_4.jpg',56),(300,'assets/img/book_images/56_5.jpg',56),(301,'assets/img/book_images/57_1.jpg',57),(302,'assets/img/book_images/57_2.jpg',57),(303,'assets/img/book_images/57_3.jpg',57),(304,'assets/img/book_images/57_4.jpg',57),(305,'assets/img/book_images/57_5.jpg',57),(306,'assets/img/book_images/58_1.jpg',58),(307,'assets/img/book_images/58_2.jpg',58),(308,'assets/img/book_images/58_3.jpg',58),(309,'assets/img/book_images/58_4.jpg',58),(310,'assets/img/book_images/58_5.jpg',58),(311,'assets/img/book_images/59_1.jpg',59),(312,'assets/img/book_images/59_2.jpg',59),(313,'assets/img/book_images/59_3.jpg',59),(314,'assets/img/book_images/59_4.jpg',59),(315,'assets/img/book_images/59_5.jpg',59),(316,'assets/img/book_images/60_1.jpg',60),(317,'assets/img/book_images/60_2.jpg',60),(318,'assets/img/book_images/60_3.jpg',60),(319,'assets/img/book_images/60_4.jpg',60),(320,'assets/img/book_images/60_5.jpg',60),(321,'assets/img/book_images/61_1.jpg',61),(322,'assets/img/book_images/61_2.jpg',61),(323,'assets/img/book_images/61_3.jpg',61),(324,'assets/img/book_images/61_4.jpg',61),(325,'assets/img/book_images/61_5.jpg',61),(326,'assets/img/book_images/62_1.jpg',62),(327,'assets/img/book_images/62_2.jpg',62),(328,'assets/img/book_images/62_3.jpg',62),(329,'assets/img/book_images/62_4.jpg',62),(330,'assets/img/book_images/62_5.jpg',62),(331,'assets/img/book_images/63_1.jpg',63),(332,'assets/img/book_images/63_2.jpg',63),(333,'assets/img/book_images/63_3.jpg',63),(334,'assets/img/book_images/63_4.jpg',63),(335,'assets/img/book_images/63_5.jpg',63),(336,'assets/img/book_images/64_1.jpg',64),(337,'assets/img/book_images/64_2.jpg',64),(338,'assets/img/book_images/64_3.jpg',64),(339,'assets/img/book_images/64_4.jpg',64),(340,'assets/img/book_images/64_5.jpg',64),(341,'assets/img/book_images/65_1.jpg',65),(342,'assets/img/book_images/65_2.jpg',65),(343,'assets/img/book_images/65_3.jpg',65),(344,'assets/img/book_images/65_4.jpg',65),(345,'assets/img/book_images/65_5.jpg',65),(346,'assets/img/book_images/66_1.jpg',66),(347,'assets/img/book_images/66_2.jpg',66),(348,'assets/img/book_images/66_3.jpg',66),(349,'assets/img/book_images/66_4.jpg',66),(350,'assets/img/book_images/66_5.jpg',66),(351,'assets/img/book_images/67_1.jpg',67),(352,'assets/img/book_images/67_2.jpg',67),(353,'assets/img/book_images/67_3.jpg',67),(354,'assets/img/book_images/67_4.jpg',67),(355,'assets/img/book_images/67_5.jpg',67),(356,'assets/img/book_images/68_1.jpg',68),(357,'assets/img/book_images/68_2.jpg',68),(358,'assets/img/book_images/68_3.jpg',68),(359,'assets/img/book_images/68_4.jpg',68),(360,'assets/img/book_images/68_5.jpg',68),(361,'assets/img/book_images/69_1.jpg',69),(362,'assets/img/book_images/69_2.jpg',69),(363,'assets/img/book_images/69_3.jpg',69),(364,'assets/img/book_images/69_4.jpg',69),(365,'assets/img/book_images/69_5.jpg',69),(366,'assets/img/book_images/70_1.jpg',70),(367,'assets/img/book_images/70_2.jpg',70),(368,'assets/img/book_images/70_3.jpg',70),(369,'assets/img/book_images/70_4.jpg',70),(370,'assets/img/book_images/70_5.jpg',70),(371,'assets/img/book_images/71_1.jpg',71),(372,'assets/img/book_images/71_2.jpg',71),(373,'assets/img/book_images/71_3.jpg',71),(374,'assets/img/book_images/71_4.jpg',71),(375,'assets/img/book_images/71_5.jpg',71),(376,'assets/img/book_images/72_1.jpg',72),(377,'assets/img/book_images/72_2.jpg',72),(378,'assets/img/book_images/72_3.jpg',72),(379,'assets/img/book_images/72_4.jpg',72),(380,'assets/img/book_images/72_5.jpg',72),(381,'assets/img/book_images/73_1.jpg',73),(382,'assets/img/book_images/73_2.jpg',73),(383,'assets/img/book_images/73_3.jpg',73),(384,'assets/img/book_images/73_4.jpg',73),(385,'assets/img/book_images/73_5.jpg',73),(386,'assets/img/book_images/74_1.jpg',74),(387,'assets/img/book_images/74_2.jpg',74),(388,'assets/img/book_images/74_3.jpg',74),(389,'assets/img/book_images/74_4.jpg',74),(390,'assets/img/book_images/74_5.jpg',74),(391,'assets/img/book_images/75_1.jpg',75),(392,'assets/img/book_images/75_2.jpg',75),(393,'assets/img/book_images/75_3.jpg',75),(394,'assets/img/book_images/75_4.jpg',75),(395,'assets/img/book_images/75_5.jpg',75),(396,'assets/img/book_images/76_1.jpg',76),(397,'assets/img/book_images/76_2.jpg',76),(398,'assets/img/book_images/76_3.jpg',76),(399,'assets/img/book_images/76_4.jpg',76),(400,'assets/img/book_images/76_5.jpg',76),(401,'assets/img/book_images/77_1.jpg',77),(402,'assets/img/book_images/77_2.jpg',77),(403,'assets/img/book_images/77_3.jpg',77),(404,'assets/img/book_images/77_4.jpg',77),(405,'assets/img/book_images/77_5.jpg',77),(406,'assets/img/book_images/78_1.jpg',78),(407,'assets/img/book_images/78_2.jpg',78),(408,'assets/img/book_images/78_3.jpg',78),(409,'assets/img/book_images/78_4.jpg',78),(410,'assets/img/book_images/78_5.jpg',78),(411,'assets/img/book_images/79_1.jpg',79),(412,'assets/img/book_images/79_2.jpg',79),(413,'assets/img/book_images/79_3.jpg',79),(414,'assets/img/book_images/79_4.jpg',79),(415,'assets/img/book_images/79_5.jpg',79),(416,'assets/img/book_images/80_1.jpg',80),(417,'assets/img/book_images/80_2.jpg',80),(418,'assets/img/book_images/80_3.jpg',80),(419,'assets/img/book_images/80_4.jpg',80),(420,'assets/img/book_images/80_5.jpg',80),(421,'assets/img/book_images/81_1.jpg',81),(422,'assets/img/book_images/81_2.jpg',81),(423,'assets/img/book_images/81_3.jpg',81),(424,'assets/img/book_images/81_4.jpg',81),(425,'assets/img/book_images/81_5.jpg',81),(426,'assets/img/book_images/82_1.jpg',82),(427,'assets/img/book_images/82_2.jpg',82),(428,'assets/img/book_images/82_3.jpg',82),(429,'assets/img/book_images/82_4.jpg',82),(430,'assets/img/book_images/82_5.jpg',82),(431,'assets/img/book_images/83_1.jpg',83),(432,'assets/img/book_images/83_2.jpg',83),(433,'assets/img/book_images/83_3.jpg',83),(434,'assets/img/book_images/83_4.jpg',83),(435,'assets/img/book_images/83_5.jpg',83),(436,'assets/img/book_images/84_1.jpg',84),(437,'assets/img/book_images/84_2.jpg',84),(438,'assets/img/book_images/84_3.jpg',84),(439,'assets/img/book_images/84_4.jpg',84),(440,'assets/img/book_images/84_5.jpg',84),(441,'assets/img/book_images/85_1.jpg',85),(442,'assets/img/book_images/85_2.jpg',85),(443,'assets/img/book_images/85_3.jpg',85),(444,'assets/img/book_images/85_4.jpg',85),(445,'assets/img/book_images/85_5.jpg',85),(446,'assets/img/book_images/86_1.jpg',86),(447,'assets/img/book_images/86_2.jpg',86),(448,'assets/img/book_images/86_3.jpg',86),(449,'assets/img/book_images/86_4.jpg',86),(450,'assets/img/book_images/86_5.jpg',86),(451,'assets/img/book_images/87_1.jpg',87),(452,'assets/img/book_images/87_2.jpg',87),(453,'assets/img/book_images/87_3.jpg',87),(454,'assets/img/book_images/87_4.jpg',87),(455,'assets/img/book_images/87_5.jpg',87),(456,'assets/img/book_images/88_1.jpg',88),(457,'assets/img/book_images/88_2.jpg',88),(458,'assets/img/book_images/88_3.jpg',88),(459,'assets/img/book_images/88_4.jpg',88),(460,'assets/img/book_images/88_5.jpg',88),(461,'assets/img/book_images/89_1.jpg',89),(462,'assets/img/book_images/89_2.jpg',89),(463,'assets/img/book_images/89_3.jpg',89),(464,'assets/img/book_images/89_4.jpg',89),(465,'assets/img/book_images/89_5.jpg',89),(466,'assets/img/book_images/90_1.jpg',90),(467,'assets/img/book_images/90_2.jpg',90),(468,'assets/img/book_images/90_3.jpg',90),(469,'assets/img/book_images/90_4.jpg',90),(470,'assets/img/book_images/90_5.jpg',90),(471,'assets/img/book_images/91_1.jpg',91),(472,'assets/img/book_images/91_2.jpg',91),(473,'assets/img/book_images/91_3.jpg',91),(474,'assets/img/book_images/91_4.jpg',91),(475,'assets/img/book_images/91_5.jpg',91),(476,'assets/img/book_images/92_1.jpg',92),(477,'assets/img/book_images/92_2.jpg',92),(478,'assets/img/book_images/92_3.jpg',92),(479,'assets/img/book_images/92_4.jpg',92),(480,'assets/img/book_images/92_5.jpg',92),(481,'assets/img/book_images/93_1.jpg',93),(482,'assets/img/book_images/93_2.jpg',93),(483,'assets/img/book_images/93_3.jpg',93),(484,'assets/img/book_images/93_4.jpg',93),(485,'assets/img/book_images/93_5.jpg',93),(486,'assets/img/book_images/94_1.jpg',94),(487,'assets/img/book_images/94_2.jpg',94),(488,'assets/img/book_images/94_3.jpg',94),(489,'assets/img/book_images/94_4.jpg',94),(490,'assets/img/book_images/94_5.jpg',94),(491,'assets/img/book_images/95_1.jpg',95),(492,'assets/img/book_images/95_2.jpg',95),(493,'assets/img/book_images/95_3.jpg',95),(494,'assets/img/book_images/95_4.jpg',95),(495,'assets/img/book_images/95_5.jpg',95),(496,'assets/img/book_images/96_1.jpg',96),(497,'assets/img/book_images/96_2.jpg',96),(498,'assets/img/book_images/96_3.jpg',96),(499,'assets/img/book_images/96_4.jpg',96),(500,'assets/img/book_images/96_5.jpg',96),(501,'assets/img/book_images/97_1.jpg',97),(502,'assets/img/book_images/97_2.jpg',97),(503,'assets/img/book_images/97_3.jpg',97),(504,'assets/img/book_images/97_4.jpg',97),(505,'assets/img/book_images/97_5.jpg',97),(506,'assets/img/book_images/98_1.jpg',98),(507,'assets/img/book_images/98_2.jpg',98),(508,'assets/img/book_images/98_3.jpg',98),(509,'assets/img/book_images/98_4.jpg',98),(510,'assets/img/book_images/98_5.jpg',98),(511,'assets/img/book_images/99_1.jpg',99),(512,'assets/img/book_images/99_2.jpg',99),(513,'assets/img/book_images/99_3.jpg',99),(514,'assets/img/book_images/99_4.jpg',99),(515,'assets/img/book_images/99_5.jpg',99),(516,'assets/img/book_images/100_1.jpg',100),(517,'assets/img/book_images/100_2.jpg',100),(518,'assets/img/book_images/100_3.jpg',100),(519,'assets/img/book_images/100_4.jpg',100),(520,'assets/img/book_images/100_5.jpg',100),(521,'assets/img/book_images/101_1.jpg',101),(522,'assets/img/book_images/101_2.jpg',101),(523,'assets/img/book_images/101_3.jpg',101),(524,'assets/img/book_images/101_4.jpg',101),(525,'assets/img/book_images/101_5.jpg',101),(526,'assets/img/book_images/102_1.jpg',102),(527,'assets/img/book_images/102_2.jpg',102),(528,'assets/img/book_images/102_3.jpg',102),(529,'assets/img/book_images/102_4.jpg',102),(530,'assets/img/book_images/102_5.jpg',102),(531,'assets/img/book_images/103_1.jpg',103),(532,'assets/img/book_images/103_2.jpg',103),(533,'assets/img/book_images/103_3.jpg',103),(534,'assets/img/book_images/103_4.jpg',103),(535,'assets/img/book_images/103_5.jpg',103),(536,'assets/img/book_images/104_1.jpg',104),(537,'assets/img/book_images/104_2.jpg',104),(538,'assets/img/book_images/104_3.jpg',104),(539,'assets/img/book_images/104_4.jpg',104),(540,'assets/img/book_images/104_5.jpg',104),(541,'assets/img/book_images/105_1.jpg',105),(542,'assets/img/book_images/105_2.jpg',105),(543,'assets/img/book_images/105_3.jpg',105),(544,'assets/img/book_images/105_4.jpg',105),(545,'assets/img/book_images/105_5.jpg',105),(546,'assets/img/book_images/106_1.jpg',106),(547,'assets/img/book_images/106_2.jpg',106),(548,'assets/img/book_images/106_3.jpg',106),(549,'assets/img/book_images/106_4.jpg',106),(550,'assets/img/book_images/106_5.jpg',106),(551,'assets/img/book_images/107_1.jpg',107),(552,'assets/img/book_images/107_2.jpg',107),(553,'assets/img/book_images/107_3.jpg',107),(554,'assets/img/book_images/107_4.jpg',107),(555,'assets/img/book_images/107_5.jpg',107);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `CusFullname` text,
  `OrderDate` date DEFAULT NULL,
  `DeliverDate` date DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `CusEmail` text,
  `Address` text,
  `PayMethodID` int DEFAULT NULL,
  `TotalPrice` float DEFAULT NULL,
  `StatusID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PayMethodID` (`PayMethodID`),
  KEY `StatusID` (`StatusID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`PayMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`StatusID`) REFERENCES `orderstatus` (`StatusID`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
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
  `BookID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`ID`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `StatusID` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'Wait for package','Order placed'),(2,'Wait for shipment','Order is in transit'),(3,'Delivered','Order shipped');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `PaymentMethodID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Cash','Payment using cash'),(2,'VNPAY','Payment using VNPAY account');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `PublisherID` int NOT NULL AUTO_INCREMENT,
  `PublisherName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `PublisherEmail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `PublisherPhone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Nike','contact@nike.com','123-456-7890'),(2,'Adidas','contact@adidas.com','234-567-8901'),(3,'Puma','contact@puma.com','345-678-9012'),(4,'Under Armour','contact@underarmour.com','456-789-0123'),(5,'Reebok','contact@reebok.com','567-890-1234'),(6,'New Balance','contact@newbalance.com','678-901-2345');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','Controls and oversees the entire system, responsible for system settings, user management, and data statistics.'),(2,'Marketing','Manages inventory of books, manages book details, refunds, discounts, feedback, and wishlist of customers about books, and assists with customer inquiries'),(3,'Sale','Manages order list and order details'),(4,'Customer','Searches for books, reads reviews, places orders, makes payments, refunds, adds books to wishlist, and can provide feedback.');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `orders` int DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Team shirt','Shirts designed for team sports',1),(2,'Club shirt','Shirts representing various clubs',1),(3,'Shirt without logo','Plain shirts without any logos',1),(4,'Volleyball shirt','Shirts designed for volleyball players',1),(5,'Tennis shirt','Shirts designed for tennis players',1),(6,'Jacket','Jackets for sports and casual wear',1),(7,'Long Sleeve Shirt','Long sleeve shirts for various activities',1),(8,'TF spikes','Spikes designed for TF (Turf Field) surfaces',2),(9,'AG spike shoes','Shoes with spikes for AG (Artificial Grass) surfaces',2),(10,'Futsal shoes','Shoes designed for futsal',2),(11,'Sport shoes','General sports shoes for various activities',2),(12,'Soccer ball','Balls used in soccer',3),(13,'Volleyball','Balls used in volleyball',3),(14,'Basketball ball','Balls used in basketball',3),(15,'Tennis ball','Balls used in tennis',3);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
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
  `UserFullName` varchar(50) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `UserPhone` varchar(20) DEFAULT NULL,
  `UserEmail` varchar(50) DEFAULT NULL,
  `UserAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `UserEmail` (`UserEmail`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','de/EELwjsNDdXaxj5sBz0CQGwBk=',1,'data:image/png;base64,UklGRswLAABXRUJQVlA4IMALAADwfQCdASpYAlgCPlEokEajoqGhIhUYCHAKCWlu4XdOAPblopP3MbPsf9R/xXbD/e+Wp3Ubs9pv1FfeeuPsN+KWgj+pN8qzN/qfWNmg9UWvM0APzt5+n/j/ovQ39F/s78Bv8v/ufpd+w/91vZu/YD//gzaMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuMAupqAK8QuL0jPxk4J/T40dFlLjc6jQGozdGODo4Kb3HWACvELjALqagCuoWuyxs+wZpzD2peOt8nUoG4wrABXiFxgF1NQBXh/Frvz0TDcVX/gf5jUBY/2GMQuMAupqAK8QuL/pEACHw0zumy6lOLb3wRbaZ3U1AFeIXE/DYOJrlM7qaLaohGNS3gArxC4wC6moArwf0/Ph6dI/xO80oVADk8AK8QuMAupqAK8QtzOqn+0VXV/4ux0vWeBXWACvELjALqagCuoTkb3cAHBrSpp4mOc3mQma+XU1AFeIXGAXU1AFeDkHlYCC1rg5LV23CMcb9lkrrABXiFxgF1NQBXUjAgVX+34MqjUpOE32baID80WHMTUoP1/q3DfzRP0tYU4TeBxwV1KrpeYuMAupqAK8QuL/q0YnCC0VSdaT09C97yCXAytjv1RNTv+3ITTr1hWBFc2I7IPcSRgF1NQBXiFxf9WnQtq3G+J3wYUn7qCy6bwa5rhrxC4wC6moArwcmUd1uke+CLbTOjDrAbPot5DfBdTUAV4hcYBRvzcVJdzO6moArwcaO7XQ4p1NQBXiFxgFxDXvRmQEW2OhtWGA03ikZkNW8nJAl69AK8QuMAupqAK8QuMAupqAK8QsyApQMAA==','Admin','Male',NULL,'admin@gr6.com',NULL),(2,'johndoe','de/EELwjsNDdXaxj5sBz0CQGwBk=',4,NULL,'John Doe','Male',NULL,'johndoe@example.com',NULL),(3,'janedoe','de/EELwjsNDdXaxj5sBz0CQGwBk=',4,NULL,'Jane Doe','Female',NULL,'janedoe@example.com',NULL),(4,'dhcongminh','asdfasdf',4,'','docongminh','Male',NULL,'dhcongminh@gmail.com',NULL),(5,'dhcongminhh','de/EELwjsNDdXaxj5sBz0CQGwBk=',4,'assets/profile.png','docongnminh','Other',NULL,'dohoangcongminh@gmail.com',NULL),(6,'dhcongminhhh','asdfasdf',1,'','docongminh','Male','','',''),(7,'asdfasdf','de/EELwjsNDdXaxj5sBz0CQGwBk=',2,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `UserID` int DEFAULT NULL,
  `BookID` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `TotalPrice` float DEFAULT NULL,
  PRIMARY KEY (`UserCartID`),
  KEY `UserID` (`UserID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `usercart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `usercart_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart`
--

LOCK TABLES `usercart` WRITE;
/*!40000 ALTER TABLE `usercart` DISABLE KEYS */;
INSERT INTO `usercart` VALUES (1,2,3,1,14.99),(2,2,2,1,29.99),(3,2,11,1,8.99);
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
  `BookID` int NOT NULL,
  PRIMARY KEY (`UserID`,`BookID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `userswishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `userswishlist_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userswishlist`
--

LOCK TABLES `userswishlist` WRITE;
/*!40000 ALTER TABLE `userswishlist` DISABLE KEYS */;
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
set global max_connections = 1000;
-- Dump completed on 2024-07-19 12:59:32
