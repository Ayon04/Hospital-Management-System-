-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2024 at 06:50 PM
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
-- Database: `hospital_managemest_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `staff_ID` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `credited_date` date DEFAULT NULL,
  `credited_amount` int(11) DEFAULT NULL,
  `debited_date` date DEFAULT NULL,
  `debited_amount` int(11) DEFAULT NULL,
  `current_balance` int(11) GENERATED ALWAYS AS (`credited_amount` - `debited_amount`) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `staff_ID`, `salary`, `credited_date`, `credited_amount`, `debited_date`, `debited_amount`) VALUES
(100, 1014, 15000, '2024-03-01', 15000, '2024-03-05', 12000),
(102, 1031, 17000, '2024-03-01', 17000, '2024-03-08', 10000),
(104, 1032, 18000, '2024-03-01', 18000, '2024-03-10', 18000),
(107, 1029, 20000, '2024-03-01', 20000, '2024-03-19', 18000),
(108, 1028, 22000, '2024-03-01', 22000, '2024-03-12', 21000),
(109, 1039, 17000, '2024-05-10', 17000, '2024-05-12', 7000);

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `admission_ID` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `room_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `admission_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admission`
--

INSERT INTO `admission` (`admission_ID`, `patient_name`, `room_no`, `status`, `admission_date`) VALUES
(135, 'Nishat Rahaman', '102-AC', 'Admitted', '2024-05-07'),
(138, 'Akash Kumar', '102-AC', 'Admitted', '2024-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `admission_bill`
--

CREATE TABLE `admission_bill` (
  `bill_ID` int(11) NOT NULL,
  `admission_ID` int(11) DEFAULT NULL,
  `present_status` varchar(255) DEFAULT NULL,
  `released_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admission_bill`
--

INSERT INTO `admission_bill` (`bill_ID`, `admission_ID`, `present_status`, `released_date`, `amount`) VALUES
(10028, 135, 'Released', '2024-05-13', 16000);

-- --------------------------------------------------------

--
-- Table structure for table `appiontment`
--

CREATE TABLE `appiontment` (
  `appointment_ID` int(11) NOT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `patient_age` int(11) DEFAULT NULL,
  `mobile_no` varchar(11) DEFAULT NULL,
  `appiontment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appiontment`
--

INSERT INTO `appiontment` (`appointment_ID`, `patient_name`, `doctor_name`, `patient_age`, `mobile_no`, `appiontment_date`) VALUES
(8, 'Ayon Ghosh', 'Dr.Altaf Hossion', 23, '01896587458', '2024-05-09'),
(9, 'Nibir Hasan', 'Dr.Wasim Khan', 28, '01705608506', '2024-05-09'),
(10, 'Md.Ratul Hossian', 'Dr.Tupma Rani Das', 27, '01974589999', '2024-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `staff_ID` int(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `working_day` int(11) DEFAULT NULL,
  `present_day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`staff_ID`, `month`, `working_day`, `present_day`) VALUES
(1014, 'April 2024', 22, 18),
(1031, 'April 2024', 22, 20),
(1032, 'April 2024', 22, 19),
(1028, 'April 2024', 22, 20),
(1029, 'April 2024', 22, 18);

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `test_ID` int(11) NOT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_age` int(11) DEFAULT NULL,
  `mobile_no` varchar(11) DEFAULT NULL,
  `doc_ref` varchar(255) DEFAULT NULL,
  `test_name` varchar(255) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `test_fee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`test_ID`, `patient_name`, `patient_age`, `mobile_no`, `doc_ref`, `test_name`, `delivery_date`, `test_fee`) VALUES
(1009, 'Asan Khan', 33, '01985745858', 'Dr.Wasim Khan', 'MRI', '2024-05-15', 3400),
(1011, 'Sakib Hasan', 48, '01698574586', 'Dr.Faria Binte Kamal', 'CT Scan', '2024-05-17', 3100),
(1012, 'Nasim Hasan', 32, '01985745866', 'Dr.Liakat Ali', 'Endoscopy', '2024-05-16', 1600);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_view`
-- (See below for the actual view)
--
CREATE TABLE `employee_view` (
`staff_ID` int(11)
,`username` varchar(20)
,`password` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `application_ID` int(11) NOT NULL,
  `staff_ID` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `date_for_leave` date DEFAULT NULL,
  `application_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`application_ID`, `staff_ID`, `reason`, `comments`, `date_for_leave`, `application_status`) VALUES
(17, 1029, 'Emergency', 'xfsdfdsfsdfsdf', '2024-04-26', NULL),
(24, 1035, 'Sickness', 'asasas', '2024-05-06', NULL),
(25, 1036, 'Sickness', 'dsadfsfdsfsdf', '2024-05-07', NULL),
(27, 1014, 'Sickness', 'asASaASasAS', '2024-05-09', NULL),
(45, 1039, 'Sickness', 'fsdfdsf', '2024-05-01', NULL),
(55, 1040, 'Others', 'rerwer', '2024-05-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_ID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile_no` varchar(11) NOT NULL,
  `area` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `profile_picture` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_ID`, `username`, `full_name`, `password`, `gender`, `email`, `mobile_no`, `area`, `address`, `profile_picture`) VALUES
(1014, 'akashkumar', 'Akash Kumar Ghosh', 'abc222', 'male', 'ghakash@gmail.com', '01987452145', 'Patuakhali,Barishal', '       dasdasdasdasd                              ', NULL),
(1028, 'sihab40', 'Sihab Hasan', 'ss1122', 'male', 'shihab6@gmail.com', '01987458588', 'Dhaka North,Dhaka', 'kuril sd dd', ''),
(1029, 'kabya22', 'Kabya Das', 'hello22', 'male', 'kabya23@gmail.com', '01987452145', 'Dhaka,Dhaka Sought', 'fdsgdgfd drgdfgdfgdfg ftfdgfdg', NULL),
(1031, 'priya44', 'Priyanka  Ghosh', 'ayon5566', 'female', 'priya44@gmail.com', '01874589658', 'Khulna,Jessore', 'dsad sfdssafdad', NULL),
(1032, 'yasin87', 'Yasin Arafat', 'yasin33', 'male', 'yasin77@gmail.com', '01987451456', 'Chattogram,Cox&#039;s Bazar', 'dsa fdd fsdf', NULL),
(1033, 'nazmul99', 'Nazmul Islam', 'nazmul88', 'male', 'nazmul09@gmail.com', '01874589659', 'Chattogram,Cox&#039;s Bazar', 'aaaaaaaaaaaaaa', NULL),
(1035, 'niloy22', 'Niloy  Ahmed', 'qqq111', 'male', 'niloy54@gmail.com', '01874589669', 'Chattogram,Rangamati', 'asasasas', NULL),
(1036, 'sajid33', 'Md. Sajid  Khan', 'vvv5555', 'male', 'sajid7689@gmail.com', '01987458568', 'Khulna,Jessore', 'asgAYGSASGDSAVBDD', NULL),
(1037, 'nasim44', 'Nasim Khan', 'www333', 'male', 'nasim9080@gmail.com', '01874569858', 'Rajshahi,Natore', 'aaabbccddeeff', NULL),
(1039, 'tasnim88', 'Fariya Tasnim', 'www222', 'female', 'tasnim909@gmail.com', '01698745896', 'Barishal,Bhola', '          asasasasas                              ', NULL),
(1040, 'ayon44', 'Ayon  Ghosh', 'ayon11', 'male', 'ghoshayon125@gmail.com', '01813775261', 'Dhaka,Dhaka North', 'dsdsdasdsad asfdsaddsd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`username`, `password`) VALUES
('user6', 'password6'),
('user7', 'password7'),
('user8', 'password8'),
('user9', '12354');

-- --------------------------------------------------------

--
-- Structure for view `employee_view`
--
DROP TABLE IF EXISTS `employee_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_view`  AS SELECT `staff`.`staff_ID` AS `staff_ID`, `staff`.`username` AS `username`, `staff`.`password` AS `password` FROM `staff` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `staff_ID` (`staff_ID`);

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`admission_ID`);

--
-- Indexes for table `admission_bill`
--
ALTER TABLE `admission_bill`
  ADD PRIMARY KEY (`bill_ID`),
  ADD KEY `admission_ID` (`admission_ID`);

--
-- Indexes for table `appiontment`
--
ALTER TABLE `appiontment`
  ADD PRIMARY KEY (`appointment_ID`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD KEY `staff_ID` (`staff_ID`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`test_ID`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`application_ID`),
  ADD KEY `staff_ID` (`staff_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_ID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `admission`
--
ALTER TABLE `admission`
  MODIFY `admission_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `admission_bill`
--
ALTER TABLE `admission_bill`
  MODIFY `bill_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10029;

--
-- AUTO_INCREMENT for table `appiontment`
--
ALTER TABLE `appiontment`
  MODIFY `appointment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `test_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `application_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1041;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`);

--
-- Constraints for table `admission_bill`
--
ALTER TABLE `admission_bill`
  ADD CONSTRAINT `admission_bill_ibfk_1` FOREIGN KEY (`admission_ID`) REFERENCES `admission` (`admission_ID`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`);

--
-- Constraints for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD CONSTRAINT `leave_applications_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
