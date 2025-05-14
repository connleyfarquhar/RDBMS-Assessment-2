-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 12:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastburgers`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custID` int(11) NOT NULL,
  `custName` varchar(30) DEFAULT NULL,
  `custpayType` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custID`, `custName`, `custpayType`) VALUES
(1, 'Nolan Keller', 'Cash'),
(2, 'Thea Calhoun', 'Cash'),
(3, 'Richard Hahn', 'Card'),
(4, 'Fallon Brady', 'Card'),
(5, 'Rory Raymond', 'Cash'),
(6, 'Amora Booth', 'Card');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `menuID` int(11) DEFAULT NULL,
  `itemName` varchar(50) DEFAULT NULL,
  `itemPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemID`, `menuID`, `itemName`, `itemPrice`) VALUES
(1, 1, 'Sausage Wrap', 5),
(2, 1, 'Bacon Roll', 4),
(3, 1, 'Scrambled Eggs', 3),
(4, 1, 'Pancakes and syrup', 5),
(5, 2, 'Jimmy Burger', 3),
(6, 2, '20 Chicken Pieces', 3),
(7, 2, '4 Cheese Dippers', 3),
(8, 2, 'Nutella Pancake', 3),
(9, 2, 'Coffee Vanilla', 3),
(10, 3, 'Jasper Burger', 8),
(11, 3, '4 Chicken Pieces', 10),
(12, 3, '4 Cheese Delights', 3),
(13, 3, 'Monty Burger', 6),
(14, 3, 'Vegetarian Burger', 5),
(15, 3, 'Large Fries', 3),
(16, 3, 'Small Fries', 2),
(17, 3, 'Coffee Vanilla', 2);

-- --------------------------------------------------------

--
-- Table structure for table `itemstock`
--

CREATE TABLE `itemstock` (
  `itemID` int(11) NOT NULL,
  `outletID` int(11) NOT NULL,
  `itemstockAmount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itemstock`
--

INSERT INTO `itemstock` (`itemID`, `outletID`, `itemstockAmount`) VALUES
(1, 1, 54),
(2, 1, 14),
(11, 1, 66),
(14, 1, 112),
(15, 1, 221);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menuID` int(11) NOT NULL,
  `menuType` varchar(20) DEFAULT NULL,
  `menuStart` date DEFAULT NULL,
  `menuEnd` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuID`, `menuType`, `menuStart`, `menuEnd`) VALUES
(1, 'breakfast', '2024-01-01', '2024-12-31'),
(2, 'savers', '2024-01-01', '2024-01-31'),
(3, 'standard', '2024-01-31', '2024-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `orderDate` datetime DEFAULT NULL,
  `custID` int(11) DEFAULT NULL,
  `outletID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `staffID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `orderDate`, `custID`, `outletID`, `itemID`, `staffID`) VALUES
(1, '2024-04-06 08:19:00', 1, 1, 1, 1),
(2, '2024-03-19 11:00:00', 2, 1, 8, 3),
(3, '2024-04-06 08:19:00', 3, 1, 2, 3),
(4, '2024-03-19 11:00:00', 4, 1, 8, 4),
(5, '2024-04-06 08:19:00', 5, 1, 8, 4),
(6, '2024-03-19 11:00:00', 6, 1, 14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `outletID` int(11) NOT NULL,
  `outletLocation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`outletID`, `outletLocation`) VALUES
(1, 'Dundee Scotland');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shiftID` int(11) NOT NULL,
  `shiftDate` date DEFAULT NULL,
  `shiftStart` time DEFAULT NULL,
  `shiftEnd` time DEFAULT NULL,
  `staffID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shiftID`, `shiftDate`, `shiftStart`, `shiftEnd`, `staffID`) VALUES
(1, '2024-09-14', '07:00:00', '09:00:00', 1),
(2, '2024-09-15', '07:00:00', '18:00:00', 2),
(3, '2024-09-14', '07:00:00', '18:00:00', 3),
(4, '2024-09-17', '08:00:00', '19:00:00', 4),
(5, '2024-09-22', '09:00:00', '19:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL,
  `staffSurname` varchar(50) DEFAULT NULL,
  `staffRole` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `staffSurname`, `staffRole`) VALUES
(1, 'Doe', 'Cashier'),
(2, 'Mata', 'Cook'),
(3, 'Green', 'Cashier'),
(4, 'Ramsay', 'Manager'),
(5, 'Jackson', 'Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `menuID` (`menuID`);

--
-- Indexes for table `itemstock`
--
ALTER TABLE `itemstock`
  ADD PRIMARY KEY (`itemID`,`outletID`),
  ADD KEY `outletID` (`outletID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `custID` (`custID`),
  ADD KEY `outletID` (`outletID`),
  ADD KEY `orderItemFK` (`itemID`) USING BTREE,
  ADD KEY `staffID` (`staffID`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`outletID`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shiftID`),
  ADD KEY `staffID` (`staffID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`);

--
-- Constraints for table `itemstock`
--
ALTER TABLE `itemstock`
  ADD CONSTRAINT `itemstock_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`),
  ADD CONSTRAINT `itemstock_ibfk_2` FOREIGN KEY (`outletID`) REFERENCES `outlet` (`outletID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_item` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`outletID`) REFERENCES `outlet` (`outletID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
