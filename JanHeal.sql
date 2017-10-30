-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 20, 2017 at 10:09 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `BhamaHeal`
--

-- --------------------------------------------------------

--
-- Table structure for table `agevscore`
--

CREATE TABLE `agevscore` (
  `Id` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `Health_Score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agevscore`
--

INSERT INTO `agevscore` (`Id`, `Age`, `Health_Score`) VALUES
(1, 20, 9),
(2, 18, 5);

-- --------------------------------------------------------

--
-- Table structure for table `basic`
--

CREATE TABLE `basic` (
  `id` int(11) NOT NULL,
  `bhamashah` varchar(50) NOT NULL,
  `aadhar` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `basic`
--

INSERT INTO `basic` (`id`, `bhamashah`, `aadhar`, `name`) VALUES
(1, '123', '987', 'Ronak');

-- --------------------------------------------------------

--
-- Table structure for table `health_one`
--

CREATE TABLE `health_one` (
  `id` int(11) NOT NULL,
  `bhamashah` varchar(50) NOT NULL,
  `aadhar` varchar(50) NOT NULL,
  `cholestrol` varchar(100) NOT NULL,
  `blood` varchar(50) NOT NULL,
  `hb` varchar(50) NOT NULL,
  `rbc` varchar(50) NOT NULL,
  `platelets` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `health_one`
--

INSERT INTO `health_one` (`id`, `bhamashah`, `aadhar`, `cholestrol`, `blood`, `hb`, `rbc`, `platelets`) VALUES
(1, '987', '123', '242', 'B+', '15', '5', '350000');

-- --------------------------------------------------------

--
-- Table structure for table `health_two`
--

CREATE TABLE `health_two` (
  `id` int(11) NOT NULL,
  `bhamashah` varchar(50) NOT NULL,
  `aadhar` varchar(50) NOT NULL,
  `lefteye` varchar(50) NOT NULL,
  `righteye` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `bmi` varchar(50) NOT NULL,
  `sugar` varchar(50) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `health_two`
--

INSERT INTO `health_two` (`id`, `bhamashah`, `aadhar`, `lefteye`, `righteye`, `height`, `weight`, `bmi`, `sugar`, `remarks`) VALUES
(1, '987', '123', '1', '2', '180', '75', '25', '150', 'He\'s Awesome');

-- --------------------------------------------------------

--
-- Table structure for table `otp_table`
--

CREATE TABLE `otp_table` (
  `id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `otp` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `otp_table`
--

INSERT INTO `otp_table` (`id`, `number`, `otp`) VALUES
(1, '7838822862', '6335');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `bhamashah` varchar(50) NOT NULL,
  `aadhar` varchar(50) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rloc`
--

CREATE TABLE `rloc` (
  `id` int(11) NOT NULL,
  `disease` varchar(100) NOT NULL,
  `people` varchar(50) NOT NULL,
  `region` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rloc`
--

INSERT INTO `rloc` (`id`, `disease`, `people`, `region`) VALUES
(1, 'TB', '3', 'ajmer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agevscore`
--
ALTER TABLE `agevscore`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `basic`
--
ALTER TABLE `basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_one`
--
ALTER TABLE `health_one`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_two`
--
ALTER TABLE `health_two`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_table`
--
ALTER TABLE `otp_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rloc`
--
ALTER TABLE `rloc`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agevscore`
--
ALTER TABLE `agevscore`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `basic`
--
ALTER TABLE `basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `health_one`
--
ALTER TABLE `health_one`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `health_two`
--
ALTER TABLE `health_two`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `otp_table`
--
ALTER TABLE `otp_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rloc`
--
ALTER TABLE `rloc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;