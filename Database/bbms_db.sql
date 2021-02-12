-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 03:03 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup`
--

CREATE TABLE `bloodgroup` (
  `Id` int(11) NOT NULL,
  `BloodGroup` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodgroup`
--

INSERT INTO `bloodgroup` (`Id`, `BloodGroup`) VALUES
(3, 'A+'),
(4, 'B+'),
(5, 'AB-'),
(6, 'B-'),
(7, 'A-'),
(8, 'AB+'),
(9, 'O+'),
(10, 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `donation_id` int(100) NOT NULL,
  `ddate` datetime NOT NULL,
  `units` int(100) NOT NULL,
  `detail` varchar(800) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `Location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`donation_id`, `ddate`, `units`, `detail`, `userId`, `Location`) VALUES
(2, '2020-12-17 00:00:00', 0, 'vxvz', 'nazrul', 'vxzv'),
(3, '2020-12-17 00:00:00', 5, 'gdfg', 'samia', 'gdg'),
(4, '2021-01-01 00:00:00', 1, 'Donation for help', 'rinki', 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Address` varchar(300) NOT NULL,
  `LastDonateDate` date NOT NULL,
  `EntryDate` date NOT NULL DEFAULT current_timestamp(),
  `BloodGroupId` int(11) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Age` varchar(20) NOT NULL,
  `UserId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`ID`, `Name`, `Email`, `Phone`, `Address`, `LastDonateDate`, `EntryDate`, `BloodGroupId`, `Gender`, `Age`, `UserId`) VALUES
(14, 'nazrul islam', 'gdsgsg', '5345345345', 'ggdg', '0000-00-00', '2020-12-31', 4, 'Male', '23', 'nazrul'),
(15, 'samia', 'dgg', '242424', 'gdgdg', '0000-00-00', '2020-12-31', 5, 'Male', '23', 'samia'),
(16, 'Rinki Kanam', 'rinki@gmail.com', '01818181139', 'Shwrapara, Dhaka', '0000-00-00', '2020-12-31', 4, 'Female', '24', 'rinki');

-- --------------------------------------------------------

--
-- Table structure for table `requestes`
--

CREATE TABLE `requestes` (
  `req_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bgroup` int(100) NOT NULL,
  `reqdate` datetime NOT NULL,
  `detail` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requestes`
--

INSERT INTO `requestes` (`req_id`, `name`, `gender`, `age`, `mobile`, `email`, `bgroup`, `reqdate`, `detail`) VALUES
(3, 'Nazrul Islam', 'Male', '26', '01840028377', 'nazrulbspi5@gmail.com', 4, '2021-01-01 00:00:00', 'Need blood');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `UserName`, `Password`, `Name`, `Role`, `UserId`) VALUES
(2, 'admin', 'admin', 'Administrator', 'Admin', ''),
(5, 'nazrul', '123', 'nazrul islam', 'Donor', ''),
(6, 'samia', '123', 'samia', 'Donor', ''),
(7, 'rinki', '123', 'Rinki Kanam', 'Donor', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodgroup`
--
ALTER TABLE `bloodgroup`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`donation_id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `requestes`
--
ALTER TABLE `requestes`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloodgroup`
--
ALTER TABLE `bloodgroup`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `donation_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `requestes`
--
ALTER TABLE `requestes`
  MODIFY `req_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
