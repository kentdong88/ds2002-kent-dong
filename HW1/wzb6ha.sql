-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 08, 2024 at 10:56 PM
-- Server version: 8.0.36
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wzb6ha`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `CategoryId` int NOT NULL,
  `CategoryName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`CategoryId`, `CategoryName`) VALUES
(1, 'Appetizer'),
(2, 'Main Course'),
(3, 'Beverage');

-- --------------------------------------------------------

--
-- Table structure for table `CustomerOrder`
--

CREATE TABLE `CustomerOrder` (
  `OrderId` int NOT NULL,
  `MenuId` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `CustomerOrder`
--

INSERT INTO `CustomerOrder` (`OrderId`, `MenuId`, `Quantity`, `OrderDate`) VALUES
(1, 1, 2, '2024-09-01'),
(2, 2, 1, '2024-09-01'),
(3, 5, 1, '2024-09-01'),
(4, 3, 3, '2024-09-02'),
(5, 4, 2, '2024-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `Menu`
--

CREATE TABLE `Menu` (
  `MenuId` int NOT NULL,
  `ItemName` varchar(100) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  `CategoryId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Menu`
--

INSERT INTO `Menu` (`MenuId`, `ItemName`, `Price`, `CategoryId`) VALUES
(1, 'Spring Rolls', 5.00, 1),
(2, 'Kung Pao Chicken', 12.50, 2),
(3, 'Sweet and Sour Pork', 10.00, 2),
(4, 'Wonton Soup', 6.00, 1),
(5, 'Green Tea', 3.00, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `CustomerOrder`
--
ALTER TABLE `CustomerOrder`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `MenuId` (`MenuId`);

--
-- Indexes for table `Menu`
--
ALTER TABLE `Menu`
  ADD PRIMARY KEY (`MenuId`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CustomerOrder`
--
ALTER TABLE `CustomerOrder`
  ADD CONSTRAINT `CustomerOrder_ibfk_1` FOREIGN KEY (`MenuId`) REFERENCES `Menu` (`MenuId`);

--
-- Constraints for table `Menu`
--
ALTER TABLE `Menu`
  ADD CONSTRAINT `Menu_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`CategoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
