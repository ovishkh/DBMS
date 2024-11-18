-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2024 at 04:24 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CSWALA`
--

-- --------------------------------------------------------

--
-- Table structure for table `AdminPanel`
--

CREATE TABLE `AdminPanel` (
  `Admin_id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Certificates`
--

CREATE TABLE `Certificates` (
  `Certificate_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Issue_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Certificate_url` varchar(255) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Courses`
--

CREATE TABLE `Courses` (
  `Course_id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Teacher_id` int(11) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Enrollments`
--

CREATE TABLE `Enrollments` (
  `Enrollment_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Enrollment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `Payment_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Payment_status` varchar(50) DEFAULT NULL,
  `Transaction_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `User_id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`User_id`, `Name`, `Email`, `Password`, `Created_at`, `Updated_at`) VALUES
(1, 'Apra Rani Das', 'apra@diu.edu', 'Apra2323', '2024-11-10 15:21:05', '2024-11-10 15:21:05'),
(2, 'K. Tuhin', 'tuhin@diu.edu', 'TunTunMasi69', '2024-11-10 15:21:05', '2024-11-10 15:21:05'),
(3, 'Shahriar Ovi', 'ovi@diu.edu', 'GulliBoi445', '2024-11-10 15:21:05', '2024-11-10 15:21:05'),
(4, 'Antur Khan', 'antur@diu.edu', 'Noobmaster69', '2024-11-10 15:21:05', '2024-11-10 15:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `Videos`
--

CREATE TABLE `Videos` (
  `Video_id` int(11) NOT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Video_url` varchar(255) NOT NULL,
  `Duration` time DEFAULT NULL,
  `Upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Thumbnail_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AdminPanel`
--
ALTER TABLE `AdminPanel`
  ADD PRIMARY KEY (`Admin_id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Certificates`
--
ALTER TABLE `Certificates`
  ADD PRIMARY KEY (`Certificate_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`Course_id`),
  ADD KEY `Teacher_id` (`Teacher_id`);

--
-- Indexes for table `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD PRIMARY KEY (`Enrollment_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Videos`
--
ALTER TABLE `Videos`
  ADD PRIMARY KEY (`Video_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AdminPanel`
--
ALTER TABLE `AdminPanel`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Certificates`
--
ALTER TABLE `Certificates`
  MODIFY `Certificate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Courses`
--
ALTER TABLE `Courses`
  MODIFY `Course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Enrollments`
--
ALTER TABLE `Enrollments`
  MODIFY `Enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `Payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Videos`
--
ALTER TABLE `Videos`
  MODIFY `Video_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Certificates`
--
ALTER TABLE `Certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `Courses`
--
ALTER TABLE `Courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Teacher_id`) REFERENCES `Users` (`User_id`);

--
-- Constraints for table `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `Videos`
--
ALTER TABLE `Videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
