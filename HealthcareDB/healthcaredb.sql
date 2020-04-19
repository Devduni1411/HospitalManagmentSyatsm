-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2020 at 07:08 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcaredb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppointmentId` int(10) NOT NULL,
  `fullName` varchar(30) NOT NULL,
  `gender` char(8) NOT NULL,
  `mobileNumber` char(10) NOT NULL,
  `age` char(3) NOT NULL,
  `address` varchar(30) NOT NULL,
  `emailAddress` varchar(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointmentId`, `fullName`, `gender`, `mobileNumber`, `age`, `address`, `emailAddress`, `type`) VALUES
(1, 'Gimhani kaushalya', 'Male', '0718963582', '22', 'kandy', 'kau@gmail.com', 'skin test'),
(2, 'Maneesha', 'female', '0715289456', '25', 'Colombo', 'manee@gmail.com', 'Skin Type'),
(4, 'chethana', 'female', '0741236549', '60', 'kandy', 'chethi@gmail.com', 'brain wash');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `dID` int(12) NOT NULL,
  `dName` varchar(30) NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phoneNo` int(10) NOT NULL,
  `specialization` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`dID`, `dName`, `address`, `email`, `phoneNo`, `specialization`) VALUES
(3, 'Trishan', 'Akuress', 'Trishan@gmail.com', 775623178, 'heart'),
(4, 'nisal', 'colombo', 'nisal@gmail.com', 714567345, 'surgeon');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalID` int(10) NOT NULL,
  `hospitalNo` char(5) NOT NULL,
  `hospitalName` varchar(40) NOT NULL,
  `hospitalAddress` varchar(50) NOT NULL,
  `hospitalPhone` char(10) NOT NULL,
  `hospitalEmail` varchar(40) NOT NULL,
  `hospitalPassword` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalID`, `hospitalNo`, `hospitalName`, `hospitalAddress`, `hospitalPhone`, `hospitalEmail`, `hospitalPassword`) VALUES
(9, 'H0021', 'Apeksha', 'Malabe, Colombo', '0754909560', 'apeksha@gmail.com', 'ccc@123'),
(11, 'H0017', 'Asiri Hospitals', '132/A , peradeniya Road,Kandy', '0813685478', 'asiri@gmail.com', 'asiri@86'),
(12, 'H0018', 'Nursing Homes', '23/A,ampitiya,Kandy', '0816985712', 'nursing@gmail.com', 'nursing@1');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` char(10) NOT NULL,
  `nic` char(10) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `fname`, `lname`, `address`, `email`, `phone`, `nic`, `dob`, `username`, `password`) VALUES
(1, 'Chethana', 'Bandara', 'Malabe, Colombo', 'chethanageeth@gmail.com', '0754909560', '982201241V', '1998.08.07', 'cheythi', 'ccc@123'),
(22, 'Sachini', 'Uththara', 'Pallegama, Ampitiya', 'sachi.c@gmail.com', '0715950814', '985545621V', '1998.09.10', 'sachi', 'sach@123'),
(23, 'Maneesha', 'Chanchala', 'Pallegama, Ampitiya', 'maneesha@gmail.com', '0715950548', '985541521V', '1998.10.10', 'mani', 'mani@123'),
(28, 'Kaushalya', 'Wickramasingha', 'Doragamuwa, Kandy', 'gima.wicky@gmail.com', '0711254789', '975548965V', '1997.05.07', 'kaushi', 'kaunari@123');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pid` int(11) NOT NULL,
  `pname` varchar(30) NOT NULL,
  `ano` varchar(20) NOT NULL,
  `adate` varchar(20) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `cardno` varchar(20) NOT NULL,
  `expmonth` varchar(20) NOT NULL,
  `expyear` varchar(20) NOT NULL,
  `cvv` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pid`, `pname`, `ano`, `adate`, `amount`, `cname`, `cardno`, `expmonth`, `expyear`, `cvv`) VALUES
(2, 'devduni', 'a03', '2333', 400.00, 'visa', '234567', 'may', '2045', '788'),
(15, 'prabath', '1243', '2-2-2020', 400.00, 'master', '1111-2222-3333-4444', 'may', '2017', '456'),
(17, 'sachini', 'A20', '2-2-2020', 400.00, 'master', '221245673', 'july', '2024', '789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppointmentId`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`dID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AppointmentId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
