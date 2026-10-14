-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: BusBookingSystem
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_ID` int NOT NULL,
  `Booking_Date` date NOT NULL,
  `Booking_Time` time NOT NULL,
  `Booking_Status` enum('ACTIVE','CANCELLED') NOT NULL DEFAULT 'ACTIVE',
  `Person_ID` int NOT NULL,
  `Trip_ID` int NOT NULL,
  `Seat_ID` int NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `Person_ID` (`Person_ID`),
  KEY `Trip_ID` (`Trip_ID`),
  KEY `Seat_ID` (`Seat_ID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Trip_ID`) REFERENCES `trip` (`Trip_ID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`Seat_ID`) REFERENCES `seat` (`Seat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2026-10-12','10:00:00','ACTIVE',101,1001,101),(2,'2026-10-12','10:05:00','ACTIVE',102,1001,102),(3,'2026-10-12','10:10:00','ACTIVE',103,1002,201),(4,'2026-10-12','10:15:00','ACTIVE',104,1002,202),(5,'2026-10-12','10:20:00','ACTIVE',105,1003,301),(6,'2026-10-12','10:25:00','CANCELLED',106,1003,302),(7,'2026-10-12','10:30:00','ACTIVE',107,1004,401),(8,'2026-10-12','10:35:00','ACTIVE',108,1004,402),(9,'2026-10-12','10:40:00','ACTIVE',109,1005,103),(10,'2026-10-12','10:45:00','ACTIVE',110,1006,203);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `Bus_ID` int NOT NULL,
  `Bus_No` varchar(20) NOT NULL,
  `Total_No_of_Seats` int NOT NULL,
  `Driver_ID` int NOT NULL,
  PRIMARY KEY (`Bus_ID`),
  UNIQUE KEY `Bus_No` (`Bus_No`),
  KEY `Driver_ID` (`Driver_ID`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`),
  CONSTRAINT `bus_chk_1` CHECK ((`Total_No_of_Seats` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'BUS-101',40,1),(2,'BUS-102',35,2),(3,'BUS-103',30,3),(4,'BUS-104',40,4);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_scholar`
--

DROP TABLE IF EXISTS `day_scholar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_scholar` (
  `Person_ID` int NOT NULL,
  PRIMARY KEY (`Person_ID`),
  CONSTRAINT `day_scholar_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `student` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_scholar`
--

LOCK TABLES `day_scholar` WRITE;
/*!40000 ALTER TABLE `day_scholar` DISABLE KEYS */;
/*!40000 ALTER TABLE `day_scholar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `Driver_ID` int NOT NULL,
  `Driver_Name` varchar(100) NOT NULL,
  `License_Number` varchar(50) NOT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Driver_ID`),
  UNIQUE KEY `License_Number` (`License_Number`),
  UNIQUE KEY `Phone_Number` (`Phone_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Rajesh Kumar','DL0420200012345','9876500001'),(2,'Suresh Yadav','DL0420200012346','9876500002'),(3,'Vijay Singh','DL0420200012347','9876500003'),(4,'Mohan Lal','DL0420200012348','9876500004');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `Person_ID` int NOT NULL,
  PRIMARY KEY (`Person_ID`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (108),(109),(110);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosteller`
--

DROP TABLE IF EXISTS `hosteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosteller` (
  `Person_ID` int NOT NULL,
  PRIMARY KEY (`Person_ID`),
  CONSTRAINT `hosteller_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `student` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosteller`
--

LOCK TABLES `hosteller` WRITE;
/*!40000 ALTER TABLE `hosteller` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passes_through`
--

DROP TABLE IF EXISTS `passes_through`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passes_through` (
  `Route_ID` int NOT NULL,
  `Stop_ID` int NOT NULL,
  `Stop_Order` int NOT NULL,
  PRIMARY KEY (`Route_ID`,`Stop_ID`),
  UNIQUE KEY `Route_ID` (`Route_ID`,`Stop_Order`),
  KEY `Stop_ID` (`Stop_ID`),
  CONSTRAINT `passes_through_ibfk_1` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`),
  CONSTRAINT `passes_through_ibfk_2` FOREIGN KEY (`Stop_ID`) REFERENCES `stop` (`Stop_ID`),
  CONSTRAINT `passes_through_chk_1` CHECK ((`Stop_Order` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passes_through`
--

LOCK TABLES `passes_through` WRITE;
/*!40000 ALTER TABLE `passes_through` DISABLE KEYS */;
INSERT INTO `passes_through` VALUES (1,2,1),(1,6,2),(1,1,3),(2,3,1),(2,4,2),(2,1,3),(3,6,1),(3,8,2),(3,5,3),(4,7,1),(4,2,2),(4,1,3);
/*!40000 ALTER TABLE `passes_through` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `Person_ID` int NOT NULL,
  `Person_Name` varchar(100) NOT NULL,
  `Stop_ID` int DEFAULT NULL,
  PRIMARY KEY (`Person_ID`),
  KEY `Stop_ID` (`Stop_ID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`Stop_ID`) REFERENCES `stop` (`Stop_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (101,'Rahul Sharma',1),(102,'Priya Verma',2),(103,'Aman Gupta',3),(104,'Sneha Singh',4),(105,'Karan Mehta',5),(106,'Anjali Patel',6),(107,'Rohit Kumar',7),(108,'Neha Joshi',8),(109,'Arjun Rao',1),(110,'Pooja Das',3);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `Route_ID` int NOT NULL,
  `Route_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Route_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'City Center Route'),(2,'Railway Station Route'),(3,'Market Route'),(4,'Airport Road Route');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `Seat_ID` int NOT NULL,
  `Bus_ID` int NOT NULL,
  `Seat_Number` int NOT NULL,
  PRIMARY KEY (`Seat_ID`),
  UNIQUE KEY `Bus_ID` (`Bus_ID`,`Seat_Number`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`Bus_ID`) REFERENCES `bus` (`Bus_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (101,1,1),(102,1,2),(103,1,3),(104,1,4),(105,1,5),(201,2,1),(202,2,2),(203,2,3),(204,2,4),(205,2,5),(301,3,1),(302,3,2),(303,3,3),(304,3,4),(305,3,5),(401,4,1),(402,4,2),(403,4,3),(404,4,4),(405,4,5);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stop`
--

DROP TABLE IF EXISTS `stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop` (
  `Stop_ID` int NOT NULL,
  `Stop_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Stop_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop`
--

LOCK TABLES `stop` WRITE;
/*!40000 ALTER TABLE `stop` DISABLE KEYS */;
INSERT INTO `stop` VALUES (1,'Main Gate'),(2,'City Center'),(3,'Railway Station'),(4,'Bus Stand'),(5,'College Hostel'),(6,'Market Square'),(7,'Airport Road'),(8,'Library Junction');
/*!40000 ALTER TABLE `stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Person_ID` int NOT NULL,
  PRIMARY KEY (`Person_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (101),(102),(103),(104),(105),(106),(107);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `Trip_ID` int NOT NULL,
  `Trip_Date` date NOT NULL,
  `Departure_Time` time NOT NULL,
  `Bus_ID` int NOT NULL,
  `Route_ID` int NOT NULL,
  PRIMARY KEY (`Trip_ID`),
  KEY `Bus_ID` (`Bus_ID`),
  KEY `Route_ID` (`Route_ID`),
  CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`Bus_ID`) REFERENCES `bus` (`Bus_ID`),
  CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1001,'2026-10-14','07:30:00',1,1),(1002,'2026-10-14','08:00:00',2,2),(1003,'2026-10-14','08:30:00',3,3),(1004,'2026-10-14','09:00:00',4,4),(1005,'2026-10-15','07:30:00',1,1),(1006,'2026-10-15','08:00:00',2,2);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-14  7:31:17
