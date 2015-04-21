-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2015 at 03:48 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `homeaccounter`
--
CREATE DATABASE IF NOT EXISTS `homeaccounter` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `homeaccounter`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `account_name`, `description`) VALUES
(1, '1235656', 'asdggh'),
(2, 'TD Debit 00001', 'Debit Card in TD CANADA TRUST'),
(3, 'TD Visa', ''),
(4, 'AC1289865', 'New account');

-- --------------------------------------------------------

--
-- Table structure for table `expences`
--

CREATE TABLE IF NOT EXISTS `expences` (
  `expence_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_ammount` decimal(8,2) NOT NULL,
  `exp_date` date DEFAULT NULL,
  `exp_category_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`expence_id`),
  KEY `expence_account_fk` (`account_id`),
  KEY `expence_category_fk` (`exp_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `expences`
--

INSERT INTO `expences` (`expence_id`, `exp_ammount`, `exp_date`, `exp_category_id`, `account_id`) VALUES
(1, '20.00', '2015-04-17', 5, 1),
(2, '100.00', '2015-04-03', 1, 2),
(3, '100.00', '2015-04-18', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE IF NOT EXISTS `exp_categories` (
  `exp_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_category_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`exp_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_categories`
--

INSERT INTO `exp_categories` (`exp_category_id`, `exp_category_name`) VALUES
(1, 'Groseries'),
(2, 'Home Rent'),
(3, 'Car Insurance'),
(4, 'Eating Out'),
(5, 'Taxes/Fees'),
(6, 'Mobile phone'),
(7, 'Clother'),
(8, 'Education'),
(9, 'Fun'),
(10, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE IF NOT EXISTS `incomes` (
  `income_id` int(11) NOT NULL AUTO_INCREMENT,
  `inc_ammount` decimal(8,2) NOT NULL,
  `inc_date` date DEFAULT NULL,
  `inc_category_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`income_id`),
  KEY `income_category_fk` (`inc_category_id`),
  KEY `income_account` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`income_id`, `inc_ammount`, `inc_date`, `inc_category_id`, `account_id`) VALUES
(1, '1.00', '2015-04-12', 1, 1),
(2, '1500.00', '2015-04-12', 1, 1),
(3, '500.00', '0012-02-12', 1, 1),
(5, '2133.00', '2015-04-17', 1, 2),
(6, '100.00', '2015-04-17', 1, 1),
(7, '10.00', '2015-04-10', 1, 1),
(14, '45644.00', '2015-04-07', 2, 1),
(15, '36333.00', '2015-04-07', 2, 2),
(16, '433453.00', '2015-04-14', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `inc_categories`
--

CREATE TABLE IF NOT EXISTS `inc_categories` (
  `inc_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `inc_category_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`inc_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `inc_categories`
--

INSERT INTO `inc_categories` (`inc_category_id`, `inc_category_name`) VALUES
(1, 'Salary'),
(2, 'Gift'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_user_uq` (`username`,`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `password`) VALUES
(1, 'Pavlo', 'Gudzenko', 'pavlentiy', 'GudPav');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expences`
--
ALTER TABLE `expences`
  ADD CONSTRAINT `expence_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `expence_category_fk` FOREIGN KEY (`exp_category_id`) REFERENCES `exp_categories` (`exp_category_id`);

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `income_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `income_category_fk` FOREIGN KEY (`inc_category_id`) REFERENCES `inc_categories` (`inc_category_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
