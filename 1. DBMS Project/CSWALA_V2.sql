-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2024 at 08:54 AM
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
-- Table structure for table `Announcements`
--

CREATE TABLE `Announcements` (
  `Announcement_id` int(11) NOT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Posted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Assignments`
--

CREATE TABLE `Assignments` (
  `Assignment_id` int(11) NOT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AuditLogs`
--

CREATE TABLE `AuditLogs` (
  `Log_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Action` varchar(255) DEFAULT NULL,
  `Performed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Badges`
--

CREATE TABLE `Badges` (
  `Badge_id` int(11) NOT NULL,
  `Badge_name` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `certificatedetails`
-- (See below for the actual view)
--
CREATE TABLE `certificatedetails` (
`Certificate_id` int(11)
,`User_Name` varchar(255)
,`Course_Title` varchar(255)
,`Issue_date` timestamp
,`Status` varchar(50)
);

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

--
-- Triggers `Certificates`
--
DELIMITER $$
CREATE TRIGGER `Log_Certificate_Issuance` AFTER INSERT ON `Certificates` FOR EACH ROW BEGIN
    INSERT INTO AuditLogs (User_id, Action, Performed_at)
    VALUES (NEW.User_id, CONCAT('Certificate issued for Course ID ', NEW.Course_id), NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ChatMessages`
--

CREATE TABLE `ChatMessages` (
  `Message_id` int(11) NOT NULL,
  `Sender_id` int(11) DEFAULT NULL,
  `Receiver_id` int(11) DEFAULT NULL,
  `Message_text` text DEFAULT NULL,
  `Sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CoursePrerequisites`
--

CREATE TABLE `CoursePrerequisites` (
  `Course_id` int(11) NOT NULL,
  `Prerequisite_course_id` int(11) NOT NULL
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
-- Table structure for table `FAQs`
--

CREATE TABLE `FAQs` (
  `FAQ_id` int(11) NOT NULL,
  `Question` varchar(255) DEFAULT NULL,
  `Answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Options`
--

CREATE TABLE `Options` (
  `Option_id` int(11) NOT NULL,
  `Question_id` int(11) DEFAULT NULL,
  `Option_text` text DEFAULT NULL,
  `Is_correct` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `paymentdetails`
-- (See below for the actual view)
--
CREATE TABLE `paymentdetails` (
`Payment_id` int(11)
,`User_Name` varchar(255)
,`Course_Title` varchar(255)
,`Amount` decimal(10,2)
,`Payment_date` timestamp
,`Payment_status` varchar(50)
);

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

--
-- Triggers `Payments`
--
DELIMITER $$
CREATE TRIGGER `Log_Failed_Payments` AFTER UPDATE ON `Payments` FOR EACH ROW BEGIN
    IF NEW.Payment_status = 'Failed' THEN
        INSERT INTO AuditLogs (User_id, Action, Performed_at)
        VALUES (NEW.User_id, CONCAT('Payment failed for Course ID ', NEW.Course_id), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ProgressTracking`
--

CREATE TABLE `ProgressTracking` (
  `Progress_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Percentage_completed` decimal(5,2) DEFAULT NULL,
  `Last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `ProgressTracking`
--
DELIMITER $$
CREATE TRIGGER `Complete_Enrollment` AFTER UPDATE ON `ProgressTracking` FOR EACH ROW BEGIN
    IF NEW.Percentage_completed = 100 THEN
        UPDATE Enrollments SET Status = 'Completed' WHERE User_id = NEW.User_id AND Course_id = NEW.Course_id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Notify_Low_Course_Completion` AFTER UPDATE ON `ProgressTracking` FOR EACH ROW BEGIN
    DECLARE avg_progress DECIMAL(5, 2);
    SELECT AVG(Percentage_completed) INTO avg_progress FROM ProgressTracking WHERE Course_id = NEW.Course_id;
    IF avg_progress < 50 THEN
        INSERT INTO AuditLogs (Action, Performed_at)
        VALUES (CONCAT('Average progress for Course ID ', NEW.Course_id, ' dropped below 50%'), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `User_Logs` AFTER UPDATE ON `ProgressTracking` FOR EACH ROW BEGIN
    INSERT INTO AuditLogs (User_id, Action, Performed_at)
    VALUES (NEW.User_id, CONCAT('Updated progress to ', NEW.Percentage_completed, '% in Course ID ', NEW.Course_id), NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `Question_id` int(11) NOT NULL,
  `Quiz_id` int(11) DEFAULT NULL,
  `Question_text` text DEFAULT NULL,
  `Question_type` enum('MCQ','True/False','Short Answer') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Quizzes`
--

CREATE TABLE `Quizzes` (
  `Quiz_id` int(11) NOT NULL,
  `Course_id` int(11) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Reports`
--

CREATE TABLE `Reports` (
  `Report_id` int(11) NOT NULL,
  `Report_type` enum('User','Course','Feedback','Bug') DEFAULT NULL,
  `Reported_by` int(11) DEFAULT NULL,
  `Details` text DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Submissions`
--

CREATE TABLE `Submissions` (
  `Submission_id` int(11) NOT NULL,
  `Assignment_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Grade` decimal(5,2) DEFAULT NULL,
  `Feedback` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserBadges`
--

CREATE TABLE `UserBadges` (
  `User_id` int(11) NOT NULL,
  `Badge_id` int(11) NOT NULL,
  `Awarded_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserQuizAttempts`
--

CREATE TABLE `UserQuizAttempts` (
  `Attempt_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Quiz_id` int(11) DEFAULT NULL,
  `Score` decimal(5,2) DEFAULT NULL,
  `Attempt_date` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, 'Apra Rani Das', 'newemail@example.com', 'Apra2323', '2024-11-10 15:21:05', '2024-11-24 04:21:18'),
(2, 'K. Tuhin', 'tuhin@diu.edu', 'TunTunMasi69', '2024-11-10 15:21:05', '2024-11-10 15:21:05'),
(3, 'Shahriar Ovi', 'ovi@diu.edu', 'GulliBoi445', '2024-11-10 15:21:05', '2024-11-10 15:21:05'),
(4, 'Antur Khan', 'antur@diu.edu', 'Noobmaster69', '2024-11-10 15:21:05', '2024-11-10 15:21:05'),
(5, 'John Doe', 'john.doe@example.com', 'password123', '2024-11-24 04:21:18', '2024-11-24 04:21:18');

--
-- Triggers `Users`
--
DELIMITER $$
CREATE TRIGGER `Log_User_Deletion` AFTER DELETE ON `Users` FOR EACH ROW BEGIN
    INSERT INTO AuditLogs (User_id, Action, Performed_at)
    VALUES (OLD.User_id, CONCAT('User with email ', OLD.Email, ' was deleted'), NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_user_insert` AFTER INSERT ON `Users` FOR EACH ROW BEGIN
    INSERT INTO User_Logs (User_id, Action)
    VALUES (NEW.User_id, 'User Created');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_user_update` AFTER UPDATE ON `Users` FOR EACH ROW BEGIN
    INSERT INTO User_Logs (User_id, Action)
    VALUES (NEW.User_id, 'User Updated');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `User_Logs`
--

CREATE TABLE `User_Logs` (
  `Log_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Action` varchar(50) DEFAULT NULL,
  `Log_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `User_Logs`
--

INSERT INTO `User_Logs` (`Log_id`, `User_id`, `Action`, `Log_time`) VALUES
(1, 5, 'User Created', '2024-11-24 04:21:18'),
(2, 1, 'User Updated', '2024-11-24 04:21:18');

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

-- --------------------------------------------------------

--
-- Structure for view `certificatedetails`
--
DROP TABLE IF EXISTS `certificatedetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cswala`.`certificatedetails`  AS SELECT `cswala`.`certificates`.`Certificate_id` AS `Certificate_id`, `cswala`.`users`.`Name` AS `User_Name`, `cswala`.`courses`.`Title` AS `Course_Title`, `cswala`.`certificates`.`Issue_date` AS `Issue_date`, `cswala`.`certificates`.`Status` AS `Status` FROM ((`cswala`.`certificates` join `cswala`.`users` on(`cswala`.`certificates`.`User_id` = `cswala`.`users`.`User_id`)) join `cswala`.`courses` on(`cswala`.`certificates`.`Course_id` = `cswala`.`courses`.`Course_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `paymentdetails`
--
DROP TABLE IF EXISTS `paymentdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cswala`.`paymentdetails`  AS SELECT `cswala`.`payments`.`Payment_id` AS `Payment_id`, `cswala`.`users`.`Name` AS `User_Name`, `cswala`.`courses`.`Title` AS `Course_Title`, `cswala`.`payments`.`Amount` AS `Amount`, `cswala`.`payments`.`Payment_date` AS `Payment_date`, `cswala`.`payments`.`Payment_status` AS `Payment_status` FROM ((`cswala`.`payments` join `cswala`.`users` on(`cswala`.`payments`.`User_id` = `cswala`.`users`.`User_id`)) join `cswala`.`courses` on(`cswala`.`payments`.`Course_id` = `cswala`.`courses`.`Course_id`)) ;

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
-- Indexes for table `Announcements`
--
ALTER TABLE `Announcements`
  ADD PRIMARY KEY (`Announcement_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `Assignments`
--
ALTER TABLE `Assignments`
  ADD PRIMARY KEY (`Assignment_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `AuditLogs`
--
ALTER TABLE `AuditLogs`
  ADD PRIMARY KEY (`Log_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `Badges`
--
ALTER TABLE `Badges`
  ADD PRIMARY KEY (`Badge_id`);

--
-- Indexes for table `Certificates`
--
ALTER TABLE `Certificates`
  ADD PRIMARY KEY (`Certificate_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `ChatMessages`
--
ALTER TABLE `ChatMessages`
  ADD PRIMARY KEY (`Message_id`),
  ADD KEY `Sender_id` (`Sender_id`),
  ADD KEY `Receiver_id` (`Receiver_id`);

--
-- Indexes for table `CoursePrerequisites`
--
ALTER TABLE `CoursePrerequisites`
  ADD PRIMARY KEY (`Course_id`,`Prerequisite_course_id`),
  ADD KEY `Prerequisite_course_id` (`Prerequisite_course_id`);

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
-- Indexes for table `FAQs`
--
ALTER TABLE `FAQs`
  ADD PRIMARY KEY (`FAQ_id`);

--
-- Indexes for table `Options`
--
ALTER TABLE `Options`
  ADD PRIMARY KEY (`Option_id`),
  ADD KEY `Question_id` (`Question_id`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `ProgressTracking`
--
ALTER TABLE `ProgressTracking`
  ADD PRIMARY KEY (`Progress_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`Question_id`),
  ADD KEY `Quiz_id` (`Quiz_id`);

--
-- Indexes for table `Quizzes`
--
ALTER TABLE `Quizzes`
  ADD PRIMARY KEY (`Quiz_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `Reports`
--
ALTER TABLE `Reports`
  ADD PRIMARY KEY (`Report_id`),
  ADD KEY `Reported_by` (`Reported_by`);

--
-- Indexes for table `Submissions`
--
ALTER TABLE `Submissions`
  ADD PRIMARY KEY (`Submission_id`),
  ADD KEY `Assignment_id` (`Assignment_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `UserBadges`
--
ALTER TABLE `UserBadges`
  ADD PRIMARY KEY (`User_id`,`Badge_id`),
  ADD KEY `Badge_id` (`Badge_id`);

--
-- Indexes for table `UserQuizAttempts`
--
ALTER TABLE `UserQuizAttempts`
  ADD PRIMARY KEY (`Attempt_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Quiz_id` (`Quiz_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `User_Logs`
--
ALTER TABLE `User_Logs`
  ADD PRIMARY KEY (`Log_id`);

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
-- AUTO_INCREMENT for table `Announcements`
--
ALTER TABLE `Announcements`
  MODIFY `Announcement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Assignments`
--
ALTER TABLE `Assignments`
  MODIFY `Assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AuditLogs`
--
ALTER TABLE `AuditLogs`
  MODIFY `Log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Badges`
--
ALTER TABLE `Badges`
  MODIFY `Badge_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Certificates`
--
ALTER TABLE `Certificates`
  MODIFY `Certificate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ChatMessages`
--
ALTER TABLE `ChatMessages`
  MODIFY `Message_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `FAQs`
--
ALTER TABLE `FAQs`
  MODIFY `FAQ_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Options`
--
ALTER TABLE `Options`
  MODIFY `Option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `Payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ProgressTracking`
--
ALTER TABLE `ProgressTracking`
  MODIFY `Progress_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `Question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Quizzes`
--
ALTER TABLE `Quizzes`
  MODIFY `Quiz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Reports`
--
ALTER TABLE `Reports`
  MODIFY `Report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Submissions`
--
ALTER TABLE `Submissions`
  MODIFY `Submission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserQuizAttempts`
--
ALTER TABLE `UserQuizAttempts`
  MODIFY `Attempt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `User_Logs`
--
ALTER TABLE `User_Logs`
  MODIFY `Log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Videos`
--
ALTER TABLE `Videos`
  MODIFY `Video_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Announcements`
--
ALTER TABLE `Announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `Assignments`
--
ALTER TABLE `Assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `AuditLogs`
--
ALTER TABLE `AuditLogs`
  ADD CONSTRAINT `auditlogs_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`);

--
-- Constraints for table `Certificates`
--
ALTER TABLE `Certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `ChatMessages`
--
ALTER TABLE `ChatMessages`
  ADD CONSTRAINT `chatmessages_ibfk_1` FOREIGN KEY (`Sender_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `chatmessages_ibfk_2` FOREIGN KEY (`Receiver_id`) REFERENCES `Users` (`User_id`);

--
-- Constraints for table `CoursePrerequisites`
--
ALTER TABLE `CoursePrerequisites`
  ADD CONSTRAINT `courseprerequisites_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`),
  ADD CONSTRAINT `courseprerequisites_ibfk_2` FOREIGN KEY (`Prerequisite_course_id`) REFERENCES `Courses` (`Course_id`);

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
-- Constraints for table `Options`
--
ALTER TABLE `Options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`Question_id`) REFERENCES `Questions` (`Question_id`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `ProgressTracking`
--
ALTER TABLE `ProgressTracking`
  ADD CONSTRAINT `progresstracking_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `progresstracking_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `Questions`
--
ALTER TABLE `Questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`Quiz_id`) REFERENCES `Quizzes` (`Quiz_id`);

--
-- Constraints for table `Quizzes`
--
ALTER TABLE `Quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);

--
-- Constraints for table `Reports`
--
ALTER TABLE `Reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`Reported_by`) REFERENCES `Users` (`User_id`);

--
-- Constraints for table `Submissions`
--
ALTER TABLE `Submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`Assignment_id`) REFERENCES `Assignments` (`Assignment_id`),
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`);

--
-- Constraints for table `UserBadges`
--
ALTER TABLE `UserBadges`
  ADD CONSTRAINT `userbadges_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `userbadges_ibfk_2` FOREIGN KEY (`Badge_id`) REFERENCES `Badges` (`Badge_id`);

--
-- Constraints for table `UserQuizAttempts`
--
ALTER TABLE `UserQuizAttempts`
  ADD CONSTRAINT `userquizattempts_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `userquizattempts_ibfk_2` FOREIGN KEY (`Quiz_id`) REFERENCES `Quizzes` (`Quiz_id`);

--
-- Constraints for table `Videos`
--
ALTER TABLE `Videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Courses` (`Course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
