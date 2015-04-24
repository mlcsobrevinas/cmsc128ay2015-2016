-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2015 at 12:29 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cmsc128`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_username` varchar(30) NOT NULL,
  `account_password` varchar(30) NOT NULL,
  `emp_num` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_username` (`account_username`),
  KEY `emp_num` (`emp_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_username`, `account_password`, `emp_num`) VALUES
(1, 'mary', '123', 201220694),
(2, '201412345', '2520141234515', 201412345);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `grading_period` varchar(10) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `student_days_tardy` int(11) NOT NULL,
  `student_days_present` int(11) NOT NULL,
  `school_days` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  KEY `batch_id` (`batch_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`grading_period`, `batch_id`, `student_days_tardy`, `student_days_present`, `school_days`, `student_id`) VALUES
('First', 0, 12, 0, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `batch_id` int(11) NOT NULL,
  `student_year` varchar(20) NOT NULL,
  `section` varchar(20) NOT NULL,
  `adviser` varchar(50) NOT NULL,
  `start_of_academic_year` year(4) NOT NULL,
  `end_of_academic_year` year(4) NOT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `student_year`, `section`, `adviser`, `start_of_academic_year`, `end_of_academic_year`) VALUES
(0, 'First', 'Hello', 'moooreee', 2014, 2015);

-- --------------------------------------------------------

--
-- Table structure for table `batch_student_reference`
--

CREATE TABLE IF NOT EXISTS `batch_student_reference` (
  `batch_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `total_school_days` int(11) NOT NULL,
  `total_days_present` int(11) NOT NULL,
  `total_days_tardy` int(11) NOT NULL,
  KEY `batch_id` (`batch_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `Emp_num` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `Admin_flag` tinyint(1) DEFAULT NULL,
  `Subj_teacher_flag` tinyint(1) DEFAULT NULL,
  `Adviser_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Emp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_num`, `name`, `designation`, `Admin_flag`, `Subj_teacher_flag`, `Adviser_flag`) VALUES
(0, 'Mary Kristene D. Clarino', 'adviser', 0, 0, 1),
(201212345, 'Harry', 'admin', 1, 0, 0),
(201220694, 'Mary Kristene D. Clarino', 'adviser', 0, 0, 1),
(201412345, 'Paolo Javelona', 'adviser', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_card`
--

CREATE TABLE IF NOT EXISTS `report_card` (
  `Report_card_id` int(11) NOT NULL,
  `Student_ave_grade` float NOT NULL,
  `Student_id` int(11) NOT NULL,
  `Emp_num` int(11) NOT NULL,
  PRIMARY KEY (`Report_card_id`),
  KEY `Student_id` (`Student_id`,`Emp_num`),
  KEY `Emp_num` (`Emp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `Student_id` int(11) NOT NULL,
  `Student_name` varchar(50) NOT NULL,
  `Student_sex` varchar(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `curriculum` varchar(30) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_id`, `Student_name`, `Student_sex`, `status`, `address`, `nationality`, `curriculum`, `birthdate`) VALUES
(0, 'Mary', '1', '1', '1', '1', '1', '1996-04-23'),
(199514352, 'hipolito hipulpol', 'M', 'suspended', 'batong malake, los banos', 'Filipino', 'vocational', '1985-06-10'),
(200317354, 'jupol jupolito', 'M', 'still enrolled', 'batong maliit, los banos', 'Filipino', 'vocational', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `student_subject_reference`
--

CREATE TABLE IF NOT EXISTS `student_subject_reference` (
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `Final_grade` int(11) NOT NULL,
  `Subject_action` varchar(20) NOT NULL,
  KEY `student_id` (`student_id`,`subject_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `Subject_id` int(11) NOT NULL,
  `Subject_type` varchar(20) NOT NULL,
  `Subject_unit` int(11) NOT NULL,
  `Subject_name` varchar(20) NOT NULL,
  `Time_slot_start` time NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Emp_num` int(11) NOT NULL,
  `Time_slot_end` int(11) NOT NULL,
  PRIMARY KEY (`Subject_id`),
  KEY `Student_id` (`Emp_num`),
  KEY `Emp_num` (`Emp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Subject_id`, `Subject_type`, `Subject_unit`, `Subject_name`, `Time_slot_start`, `Description`, `Emp_num`, `Time_slot_end`) VALUES
(0, 'Normal', 3, 'Math 17', '03:00:00', 'Math', 201220694, 4);

-- --------------------------------------------------------

--
-- Table structure for table `subject_grade`
--

CREATE TABLE IF NOT EXISTS `subject_grade` (
  `grading_period` varchar(20) NOT NULL,
  `grade` float NOT NULL,
  `Subject_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  KEY `Subject_id` (`Subject_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject_section`
--

CREATE TABLE IF NOT EXISTS `subject_section` (
  `Subject_id` int(11) NOT NULL,
  `section_name` varchar(20) NOT NULL,
  KEY `Subject_id` (`Subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `emp_num_fk` FOREIGN KEY (`emp_num`) REFERENCES `employee` (`Emp_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `batch_id_fk` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_id_fk4` FOREIGN KEY (`student_id`) REFERENCES `student` (`Student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `batch_student_reference`
--
ALTER TABLE `batch_student_reference`
  ADD CONSTRAINT `batch_to_student_fk` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_id_fk7` FOREIGN KEY (`student_id`) REFERENCES `student` (`Student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_card`
--
ALTER TABLE `report_card`
  ADD CONSTRAINT `emp_num_fk2` FOREIGN KEY (`Emp_num`) REFERENCES `employee` (`Emp_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_id_fk2` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_subject_reference`
--
ALTER TABLE `student_subject_reference`
  ADD CONSTRAINT `student_id_fk6` FOREIGN KEY (`student_id`) REFERENCES `student` (`Student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_id_student_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`Subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `emp_num_fk3` FOREIGN KEY (`Emp_num`) REFERENCES `employee` (`Emp_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject_grade`
--
ALTER TABLE `subject_grade`
  ADD CONSTRAINT `student_id_fk3` FOREIGN KEY (`student_id`) REFERENCES `student` (`Student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_id_fk` FOREIGN KEY (`Subject_id`) REFERENCES `subject` (`Subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject_section`
--
ALTER TABLE `subject_section`
  ADD CONSTRAINT `subject_id_fk2` FOREIGN KEY (`Subject_id`) REFERENCES `subject` (`Subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
