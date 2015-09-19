-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2015 at 11:06 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hpippm`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`ID`, `state_id`, `name`) VALUES
(1, 253, 'Example 1'),
(2, 253, 'Example 2');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `image_url` varchar(555) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `image_url`) VALUES
(0, 'Data Before Company Split', 'http://dic.nicovideo.jp/oekaki/414775.png'),
(1, 'Enterprise', 'http://www.amfibi.company/us/222852/image.jpg'),
(2, 'Inc', 'https://3.bp.blogspot.com/-g6327ySIdrA/VIWOu-y1BgI/AAAAAAAAAG4/2859Ox1snYk/s50-c/hp.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`ID`, `Name`, `short_name`) VALUES
(1, 'USA', 'US'),
(2, 'Canada', 'CA'),
(3, 'France', 'FR'),
(4, 'India', 'IN'),
(5, 'Costa Rica', 'CR'),
(6, 'China', 'CN'),
(7, 'United Kingdom', 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `employee_name` varchar(255) NOT NULL COMMENT 'name of the employee',
  `employee_salary` double NOT NULL COMMENT 'salary of the employee',
  `employee_position` varchar(255) NOT NULL COMMENT 'position of the employee',
  `employee_city` varchar(255) NOT NULL COMMENT 'city of the employee',
  `employee_extension` int(11) NOT NULL COMMENT 'extension of the employee',
  `employee_joining_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'joining date of the employee',
  `employee_age` int(11) NOT NULL COMMENT 'age of the employee',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='datatable demo' AUTO_INCREMENT=58 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `employee_salary`, `employee_position`, `employee_city`, `employee_extension`, `employee_joining_date`, `employee_age`) VALUES
(1, 'Tiger Nixon', 320800, 'System Architect', 'Edinburgh', 5421, '2011-04-24 12:30:00', 61),
(2, 'Garrett Winters', 170750, 'Accountant', 'Tokyo', 8422, '2011-07-24 12:30:00', 63),
(3, 'Ashton Cox', 86000, 'Junior Technical Author', 'San Francisco', 1562, '2009-01-11 12:30:00', 66),
(4, 'Cedric Kelly', 433060, 'Senior Javascript Developer', 'Edinburgh', 6224, '2012-03-28 12:30:00', 22),
(5, 'Airi Satou', 162700, 'Accountant', 'Tokyo', 5407, '2008-11-27 12:30:00', 33),
(6, 'Brielle Williamson', 372000, 'Integration Specialist', 'New York', 4804, '2012-12-01 12:30:00', 61),
(7, 'Herrod Chandler', 137500, 'Sales Assistant', 'San Francisco', 9608, '2012-08-05 12:30:00', 59),
(8, 'Rhona Davidson', 327900, 'Integration Specialist', 'Tokyo', 6200, '2010-10-13 12:30:00', 55),
(9, 'Colleen Hurst', 205500, 'Javascript Developer', 'San Francisco', 2360, '2009-09-14 12:30:00', 39),
(10, 'Sonya Frost', 103600, 'Software Engineer', 'Edinburgh', 1667, '2008-12-12 12:30:00', 23),
(11, 'Jena Gaines', 90560, 'Office Manager', 'London', 3814, '2008-12-18 12:30:00', 30),
(12, 'Quinn Flynn', 342000, 'Support Lead', 'Edinburgh', 9497, '2013-03-02 12:30:00', 22),
(13, 'Charde Marshall', 470600, 'Regional Director', 'San Francisco', 6741, '2008-10-15 12:30:00', 36),
(14, 'Haley Kennedy', 313500, 'Senior Marketing Designer', 'London', 3597, '2012-12-17 12:30:00', 43),
(15, 'Tatyana Fitzpatrick', 385750, 'Regional Director', 'London', 1965, '2010-03-16 12:30:00', 19),
(16, 'Michael Silva', 198500, 'Marketing Designer', 'London', 1581, '2012-11-26 12:30:00', 66),
(17, 'Paul Byrd', 725000, 'Chief Financial Officer (CFO)', 'New York', 3059, '2010-06-08 12:30:00', 64),
(18, 'Gloria Little', 237500, 'Systems Administrator', 'New York', 1721, '2009-04-09 12:30:00', 59),
(19, 'Bradley Greer', 132000, 'Software Engineer', 'London', 2558, '2012-10-12 12:30:00', 41),
(20, 'Dai Rios', 217500, 'Personnel Lead', 'Edinburgh', 2290, '2012-09-25 12:30:00', 35),
(21, 'Jenette Caldwell', 345000, 'Development Lead', 'New York', 1937, '2011-09-02 12:30:00', 30),
(22, 'Yuri Berry', 675000, 'Chief Marketing Officer (CMO)', 'New York', 6154, '2009-06-24 12:30:00', 40),
(23, 'Caesar Vance', 106450, 'Pre-Sales Support', 'New York', 8330, '2011-12-11 12:30:00', 21),
(24, 'Doris Wilder', 85600, 'Sales Assistant', 'Sidney', 3023, '2010-09-19 12:30:00', 23),
(25, 'Angelica Ramos', 1200000, 'Chief Executive Officer (CEO)', 'London', 5797, '2009-10-08 12:30:00', 47),
(26, 'Gavin Joyce', 92575, 'Developer', 'Edinburgh', 8822, '2010-12-21 12:30:00', 42),
(27, 'Jennifer Chang', 357650, 'Regional Director', 'Singapore', 9239, '2010-11-13 12:30:00', 28),
(28, 'Brenden Wagner', 206850, 'Software Engineer', 'San Francisco', 1314, '2011-06-06 12:30:00', 28),
(29, 'Fiona Green', 850000, 'Chief Operating Officer (COO)', 'San Francisco', 2947, '2010-03-10 12:30:00', 48),
(30, 'Shou Itou', 163000, 'Regional Marketing', 'Tokyo', 8899, '2011-08-13 12:30:00', 20),
(31, 'Michelle House', 95400, 'Integration Specialist', 'Sidney', 2769, '2011-06-01 12:30:00', 37),
(32, 'Suki Burks', 114500, 'Developer', 'London', 6832, '2009-10-21 12:30:00', 53),
(33, 'Prescott Bartlett', 145000, 'Technical Author', 'London', 3606, '2011-05-06 12:30:00', 27),
(34, 'Gavin Cortez', 235500, 'Team Leader', 'San Francisco', 2860, '2008-10-25 12:30:00', 22),
(35, 'Martena Mccray', 324050, 'Post-Sales support', 'Edinburgh', 8240, '2011-03-08 12:30:00', 46),
(36, 'Unity Butler', 85675, 'Marketing Designer', 'San Francisco', 5384, '2009-12-08 12:30:00', 47),
(37, 'Howard Hatfield', 164500, 'Office Manager', 'San Francisco', 7031, '2008-12-15 12:30:00', 51),
(38, 'Hope Fuentes', 109850, 'Secretary', 'San Francisco', 6318, '2010-02-11 12:30:00', 41),
(39, 'Vivian Harrell', 452500, 'Financial Controller', 'San Francisco', 9422, '2009-02-13 12:30:00', 62),
(40, 'Timothy Mooney', 136200, 'Office Manager', 'London', 7580, '2008-12-10 12:30:00', 37),
(41, 'Jackson Bradshaw', 645750, 'Director', 'New York', 1042, '2008-09-25 12:30:00', 65),
(42, 'Olivia Liang', 234500, 'Support Engineer', 'Singapore', 2120, '2011-02-02 12:30:00', 64),
(43, 'Bruno Nash', 163500, 'Software Engineer', 'London', 6222, '2011-05-02 12:30:00', 38),
(44, 'Sakura Yamamoto', 139575, 'Support Engineer', 'Tokyo', 9383, '2009-08-18 12:30:00', 37),
(45, 'Thor Walton', 98540, 'Developer', 'New York', 8327, '2013-08-10 12:30:00', 61),
(46, 'Finn Camacho', 87500, 'Support Engineer', 'San Francisco', 2927, '2009-07-06 12:30:00', 47),
(47, 'Serge Baldwin', 138575, 'Data Coordinator', 'Singapore', 8352, '2012-04-08 12:30:00', 64),
(48, 'Zenaida Frank', 125250, 'Software Engineer', 'New York', 7439, '2010-01-03 12:30:00', 63),
(49, 'Zorita Serrano', 115000, 'Software Engineer', 'San Francisco', 4389, '2012-05-31 12:30:00', 56),
(50, 'Jennifer Acosta', 75650, 'Junior Javascript Developer', 'Edinburgh', 3431, '2013-01-31 12:30:00', 43),
(51, 'Cara Stevens', 145600, 'Sales Assistant', 'New York', 3990, '2011-12-05 12:30:00', 46),
(52, 'Hermione Butler', 356250, 'Regional Director', 'London', 1016, '2011-03-20 12:30:00', 47),
(53, 'Lael Greer', 103500, 'Systems Administrator', 'London', 6733, '2009-02-26 12:30:00', 21),
(54, 'Jonas Alexander', 86500, 'Developer', 'San Francisco', 8196, '2010-07-13 12:30:00', 30),
(55, 'Shad Decker', 183000, 'Regional Director', 'Edinburgh', 6373, '2008-11-12 12:30:00', 51),
(56, 'Michael Bruce', 183000, 'Javascript Developer', 'Singapore', 5384, '2011-06-26 12:30:00', 29),
(57, 'Donna Snider', 112000, 'Customer Support', 'New York', 4226, '2011-01-24 12:30:00', 27);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `city` varchar(100) NOT NULL,
  `site_id` varchar(100) NOT NULL,
  `companyID` int(11) unsigned NOT NULL,
  `completion_date` date NOT NULL,
  `active_ipp` int(11) NOT NULL DEFAULT '1',
  `description` text,
  `total_excess_furniture` decimal(10,2) NOT NULL DEFAULT '0.00',
  `disposed_in_landfill_tons` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sold_tons` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sold_net_cash` decimal(10,2) NOT NULL DEFAULT '0.00',
  `recycled_tons` decimal(10,2) NOT NULL DEFAULT '0.00',
  `recycled_net_cash` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reuse_tons` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reuse_saved` decimal(10,2) NOT NULL DEFAULT '0.00',
  `donation_tons` decimal(10,2) NOT NULL DEFAULT '0.00',
  `donation_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_cost_to_dispose` decimal(10,2) NOT NULL DEFAULT '0.00',
  `actual_cost_dispose` decimal(10,2) NOT NULL DEFAULT '0.00',
  `disposal_avoidance_saving` decimal(10,2) NOT NULL DEFAULT '5555.00',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` int(1) NOT NULL DEFAULT '0',
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  KEY `companyID` (`companyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `state_id`, `country_id`, `city`, `site_id`, `companyID`, `completion_date`, `active_ipp`, `description`, `total_excess_furniture`, `disposed_in_landfill_tons`, `sold_tons`, `sold_net_cash`, `recycled_tons`, `recycled_net_cash`, `reuse_tons`, `reuse_saved`, `donation_tons`, `donation_value`, `total_cost_to_dispose`, `actual_cost_dispose`, `disposal_avoidance_saving`, `created_date`, `is_archived`, `account_id`) VALUES
(2, 285, 0, '', 'NCR01', 0, '2012-03-07', 0, 'Rdeployed 9 workstations from Charlotte to Raleigh', '1.57', '0.00', '0.00', '0.00', '0.00', '0.00', '1.57', '9000.00', '0.00', '0.00', '750.00', '0.00', '5555.00', '2014-12-15 20:50:33', 1, 1),
(3, 261, 0, 'orlando', 'abc03', 0, '2012-03-31', 1, 'test test', '103.16', '56.00', '84.00', '2000.00', '0.30', '500.00', '0.60', '1200.00', '0.85', '5000.00', '1200.00', '250.00', '5555.00', '2014-12-16 13:47:18', 1, 1),
(4, 261, 0, 'orlando', 'abc05', 0, '2013-02-05', 1, 'test', '3.16', '0.56', '0.84', '1800.00', '0.20', '1000.00', '0.60', '1000.00', '0.96', '600.00', '2400.00', '2200.00', '5555.00', '2014-12-17 00:59:58', 1, 1),
(5, 256, 0, 'sdfsdf', 'sdsdf', 2, '2013-05-06', 1, 'sdfsd', '3.16', '0.56', '0.84', '1800.00', '0.20', '1000.00', '0.60', '1000.00', '0.96', '600.00', '2400.00', '2200.00', '5555.00', '2014-12-17 01:02:38', 1, 1),
(6, 256, 0, 'asdf', 'asdf', 0, '2014-12-02', 1, 'Redeployed 18 Workstations Miami Florida', '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '5555.00', '2014-12-17 01:14:52', 1, 1),
(8, 272, 1, 'Bethesda', 'NSB01', 0, '2012-03-31', 1, 'Redeployed 15 workstations from Bethesda to Alexandria', '2.63', '0.00', '0.00', '0.00', '0.00', '0.00', '2.63', '15000.00', '0.00', '0.00', '750.00', '0.00', '5555.00', '2015-01-14 12:19:03', 0, 1),
(9, 301, 1, 'Monona', 'WIM01', 1, '2012-04-30', 1, 'Redeployed 70 workstations from Monona to Janesville Phase1', '12.25', '0.00', '0.00', '0.00', '0.00', '0.00', '12.25', '70000.00', '0.00', '0.00', '7500.00', '0.00', '5555.00', '2015-01-14 12:19:17', 0, 1),
(11, 303, 2, 'Ottawa', 'OCO01', 0, '2012-05-31', 1, 'Redeployed 70 chairs from Ottawa to Calgary', '1.75', '0.00', '0.00', '0.00', '0.00', '0.00', '1.75', '14000.00', '0.00', '0.00', '750.00', '0.00', '5555.00', '2015-01-14 12:19:57', 0, 1),
(12, 272, 1, 'Bethesda', 'NSB01', 0, '2012-05-31', 1, 'Redeployed 26 workstations from Bethesda to Herndon', '8.40', '0.00', '0.00', '0.00', '0.00', '0.00', '8.40', '26000.00', '0.00', '0.00', '1500.00', '0.00', '5555.00', '2015-02-08 14:52:11', 0, 1),
(13, 273, 1, 'Cambridge', 'CMB01', 0, '2012-06-30', 1, 'Decommissioned office and sold 17 workstations, 8 private offices, 2 conference roome, lateral files and seating', '1.75', '0.00', '1.75', '700.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '3500.00', '0.00', '5555.00', '2015-01-14 12:20:56', 0, 1),
(14, 279, 1, 'Omaha', 'OMA01', 0, '2012-07-31', 1, 'Decommissioned fourth floor 157 workstations recycled Phase 1', '47.10', '0.00', '0.00', '0.00', '47.10', '2400.00', '0.00', '0.00', '0.00', '0.00', '5887.00', '0.00', '0.00', '2015-02-13 20:04:04', 0, 1),
(15, 279, 1, 'Omaha', 'OMA01', 0, '2012-07-31', 1, 'Decommissioned Phase 1 sold 70 workstations ans task chairs', '12.25', '0.00', '12.25', '4737.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2675.00', '0.00', '5555.00', '2015-01-14 12:21:39', 0, 1),
(16, 301, 1, 'Monona', 'WIM01', 0, '2012-06-30', 1, 'Decommissioned office sold 280 workstations and task chairs Phase 2', '49.00', '0.00', '49.00', '16026.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10500.00', '0.00', '0.00', '2015-02-13 20:03:19', 0, 1),
(17, 285, 1, 'Cary', 'OWR01', 0, '2012-07-31', 0, 'LM sold Cary NC furniture using IPP/PM program inventory', '24.45', '0.00', '24.45', '7500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '34250.00', '0.00', '5555.00', '2015-01-14 12:21:53', 0, 1),
(18, 295, 1, 'Plano', 'PDC01', 0, '2012-07-31', 1, 'Sold 1,448 task chairs during Phase 1 chair exchange', '36.20', '0.00', '36.20', '17385.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '9040.00', '0.00', '5555.00', '2015-01-14 12:22:12', 0, 1),
(19, 279, 1, 'Omaha', 'OMA01', 0, '2012-07-31', 1, 'Redeployed 50 task chairs to Des Moines Phase 1 decommissioning', '1.25', '0.00', '0.00', '0.00', '0.00', '0.00', '1.25', '8750.00', '0.00', '0.00', '750.00', '0.00', '5555.00', '2015-01-14 12:22:28', 0, 1),
(20, 295, 1, 'Plano', 'PDC01', 0, '2012-09-30', 1, 'Sold 1,400 task chairs during Phase 2 chair exchange', '35.00', '0.00', '35.00', '4800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '9000.00', '0.00', '5555.00', '2015-01-14 12:22:43', 0, 1),
(21, 310, 1, 'Mississauga ', 'MIS01', 0, '2012-10-31', 1, 'Sold 650 task chairs during chair exchange', '16.25', '0.00', '16.25', '11736.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '14500.00', '0.00', '5555.00', '2015-01-14 12:22:56', 0, 1),
(22, 253, 1, 'Plano', 'PDC01', 0, '2012-10-31', 1, 'donated to a for profit careteria furniture', '9.80', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '9.80', '1250.00', '18500.00', '0.00', '5555.00', '2015-01-14 12:23:07', 0, 1),
(23, 287, 1, 'Dayton', 'OHD01', 0, '2012-10-31', 0, 'Phaes 1 recycled 60 workstations, 120 lat files ans sold 85 lat files', '23.25', '0.00', '4.25', '4215.00', '19.00', '1815.00', '0.00', '0.00', '0.00', '0.00', '12500.00', '0.00', '0.00', '2015-02-13 20:06:09', 0, 1),
(24, 290, 1, 'Camp Hill', 'CPH01', 0, '2012-10-31', 1, 'Sold 159 task chairs during chair exchange', '9.25', '0.00', '9.25', '2544.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1500.00', '0.00', '5555.00', '2015-01-14 12:23:28', 0, 1),
(25, 272, 1, 'Bethesda', 'NSB01', 0, '2012-10-31', 0, 'Redeployed 25 workstations from Bethesda to Herndon', '4.37', '0.00', '0.00', '0.00', '0.00', '0.00', '4.37', '25000.00', '0.00', '0.00', '3800.00', '0.00', '5555.00', '2015-01-14 12:23:40', 0, 1),
(26, 272, 1, 'Bethesda', 'NSB01', 0, '2012-10-31', 0, 'Redeployed 8 workstations from Bethesda to Herndon', '1.40', '0.00', '0.00', '0.00', '0.00', '0.00', '1.40', '8000.00', '0.00', '0.00', '1500.00', '0.00', '5555.00', '2015-01-14 12:23:51', 0, 1),
(27, 287, 1, 'Dayton', 'OHD01', 0, '2012-11-30', 0, 'Phase 2 Sold 495 workstations, 761 chairs, 110 lat files. Recycled 7 large trees and 7 dumpsters of steel.', '150.87', '0.00', '73.87', '7544.00', '77.00', '2100.00', '0.00', '0.00', '0.00', '0.00', '35100.00', '0.00', '5555.00', '2015-01-14 12:24:01', 0, 1),
(28, 268, 1, 'Overland Park', 'OPP01', 0, '2012-11-30', 0, 'Sold 140 workstations and seating. donated to a for profit seating and tables.', '40.63', '0.00', '35.03', '10619.00', '0.00', '0.00', '0.00', '0.00', '5.60', '375.00', '11063.00', '0.00', '5555.00', '2015-01-14 12:24:11', 0, 1),
(29, 253, 1, 'Cincinnati', 'OKS01', 0, '2012-12-31', 1, 'Sold 174 workstations and 350 chairs. Recycled 250 chairs, 60 tables, 20 lat files and 2 refridgerators.', '49.60', '0.00', '40.70', '7117.00', '8.90', '2000.00', '0.00', '0.00', '0.00', '0.00', '16050.00', '0.00', '5555.00', '2015-01-14 12:24:44', 0, 1),
(30, 310, 2, 'Oshawa', 'OKS01', 0, '2013-01-31', 1, 'Recycled 130 workstations and 67 lat files. Donated 170 task chairs.', '28.93', '0.00', '0.00', '0.00', '28.93', '566.00', '0.00', '0.00', '0.00', '0.00', '17550.00', '0.00', '5555.00', '2015-01-14 12:25:15', 0, 1),
(31, 265, 1, 'Downers Grove', 'DGO01', 0, '2012-11-30', 1, 'Redeployed 16 training tabled to Newark DE', '0.40', '0.00', '0.00', '0.00', '0.00', '0.00', '0.40', '8000.00', '0.00', '0.00', '750.00', '0.00', '5555.00', '2015-01-14 12:24:21', 0, 1),
(32, 265, 1, 'Downers Grove', 'DGO01', 0, '2012-11-30', 1, 'Redeployed 40 task chairs to St. Petersburg FL', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1.00', '7000.00', '0.00', '0.00', '875.00', '0.00', '5555.00', '2015-01-14 12:24:32', 0, 1),
(33, 287, 1, 'Westerville', 'WTV01', 0, '2013-03-30', 1, 'Sold 130 workstations, 98 lat files, 8 private offices ans conf rooms. Donated 400 chairs.', '33.17', '0.00', '23.17', '3061.00', '0.00', '0.00', '0.00', '0.00', '10.00', '2000.00', '12300.00', '0.00', '5555.00', '2015-01-23 20:32:01', 0, 1),
(34, 287, 1, 'Dublin', 'OGC01', 0, '2013-04-30', 1, 'Data Center decom 10 workstations 12 lat files and 16 chairs donated. 150 computer racks recycled. ', '11.46', '0.00', '0.00', '0.00', '9.21', '1715.00', '0.00', '0.00', '2.25', '450.00', '8137.00', '500.00', '5555.00', '2015-02-11 15:09:01', 0, 1),
(35, 317, 1, 'Washington', 'WAS03', 0, '2013-03-31', 1, 'Donated 40 workstations and 40 chairs. Redeployed 3 workstations and 3 conference rooms to 800 K St.', '10.53', '0.00', '0.00', '0.00', '0.00', '0.00', '0.90', '6000.00', '9.63', '1200.00', '3000.00', '0.00', '5555.00', '2015-01-14 15:28:26', 0, 1),
(36, 257, 1, 'San Ramon', 'SRM01', 0, '2013-03-31', 0, 'Donated 79 workstations, 49 lat files, 125 chairs and training tables', '20.80', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '20.80', '3090.00', '13143.00', '0.00', '5555.00', '2015-02-17 02:09:37', 0, 3),
(37, 310, 2, 'Toronto', 'LBT01', 0, '2013-03-31', 0, 'Sold 120 workstations', '36.00', '0.00', '36.00', '2495.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '6750.00', '0.00', '5555.00', '2015-01-14 15:29:31', 0, 1),
(38, 317, 1, 'Washington', 'WHG01', 0, '2013-04-30', 1, 'Donated 4 workstations, 18 private offices, 25 lat files and 50 chairs.', '7.70', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '7.70', '1050.00', '3000.00', '0.00', '5555.00', '2015-01-14 15:30:45', 0, 1),
(39, 262, 1, 'Alpharetta', 'ALF01', 0, '2013-06-30', 1, 'Recycled 200 workstations, 28 conference rooms 315 chairs and 260 lat files. Redeployed 31 workstations and 52 KI towers.', '61.05', '0.00', '0.00', '0.00', '53.02', '3119.00', '8.03', '63650.00', '0.00', '0.00', '44025.00', '0.00', '5555.00', '2015-01-14 15:31:08', 0, 1),
(40, 264, 1, 'Boise', 'BOI08', 0, '2013-06-30', 0, 'Donated 20 workstations during 1,035 workstation removal avoiding tranport and unload.', '3.50', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '3.50', '500.00', '1400.00', '0.00', '5555.00', '2015-01-14 15:31:30', 0, 1),
(41, 303, 2, 'Oshawa', 'OSK01', 0, '2013-07-31', 1, 'Donated 151 workstations and chairs.', '30.20', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '30.20', '4530.00', '6600.00', '0.00', '5555.00', '2015-01-14 15:33:22', 0, 1),
(42, 288, 1, 'Tulsa', 'MCG01', 0, '2013-07-31', 1, 'Donated 1451 chairs and 260 lat files.', '56.53', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '56.53', '9855.00', '13950.00', '0.00', '5555.00', '2015-01-14 15:46:41', 0, 1),
(43, 309, 2, 'Sydney', 'WSY01', 0, '2013-06-30', 1, 'Sold 123 workstations and chairs. Recycled 40 tables and 150 lockers. Redeployed 10 workstations to Victoria.', '36.03', '0.00', '24.60', '1500.00', '9.68', '658.00', '1.75', '10000.00', '0.00', '0.00', '29500.00', '0.00', '5555.00', '2015-01-14 15:32:21', 0, 1),
(44, 290, 1, 'King of Prussia', 'KOP01', 0, '2013-06-30', 1, 'Redeployed 250 BCS workstations and chairs to Wayne and Littleton.', '48.63', '0.00', '0.00', '0.00', '0.00', '0.00', '48.63', '95000.00', '0.00', '0.00', '5250.00', '0.00', '5555.00', '2015-01-14 15:32:46', 0, 1),
(45, 290, 1, 'Wayne', 'WWA01', 0, '2013-06-30', 1, 'Donated 134 workstations filing and seating', '43.45', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '43.45', '3350.00', '5250.00', '0.00', '5555.00', '2015-01-14 15:32:59', 0, 1),
(46, 310, 2, 'Toronto', 'LBT01', 0, '2013-06-30', 0, 'Sold seating and private offices', '13.25', '0.00', '13.25', '1033.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '6000.00', '0.00', '5555.00', '2015-01-23 20:33:19', 0, 1),
(47, 310, 2, 'Toronto', 'LBT01', 0, '2013-10-31', 0, 'Redeployed furniture and art work to Markham.', '3.93', '0.00', '0.00', '0.00', '0.00', '0.00', '3.93', '25900.00', '0.00', '0.00', '1500.00', '0.00', '5555.00', '2015-01-14 15:47:02', 0, 1),
(48, 262, 1, 'Alpharetta', 'ALF01', 0, '2013-10-31', 1, 'Sold 500 task chairs during chair exchange', '12.50', '0.00', '1.50', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '3000.00', '0.00', '1000.00', '2015-02-09 14:22:05', 0, 1),
(49, 295, 0, 'Plano', 'PDC01', 0, '2013-10-31', 1, 'Recycled 450 task chairs during chair exchange', '11.25', '0.00', '0.00', '0.00', '11.25', '581.00', '0.00', '0.00', '0.00', '0.00', '3000.00', '0.00', '5555.00', '2014-12-20 14:17:10', 0, 1),
(50, 288, 0, 'Tulsa', 'MCG01', 0, '2013-10-31', 1, 'recycled 580 task chairs during chair exchange', '14.50', '0.00', '0.00', '0.00', '14.50', '704.00', '0.00', '0.00', '0.00', '0.00', '3000.00', '0.00', '5555.00', '2014-12-20 14:22:45', 0, 1),
(51, 257, 0, 'Palo Alto', 'PAL01', 0, '2013-10-31', 1, 'Recycled 238 task chairs during chair exchange', '5.95', '0.00', '0.00', '0.00', '5.95', '450.00', '0.00', '0.00', '0.00', '0.00', '1500.00', '0.00', '5555.00', '2014-12-20 14:22:22', 0, 1),
(52, 310, 2, 'Toronto', 'LBT01', 0, '2013-11-30', 0, 'Recycled 125 workstations, 350 chairs, 22 private offices and 57 lat files.', '33.65', '0.00', '0.00', '0.00', '33.65', '625.00', '0.00', '0.00', '0.00', '0.00', '6750.00', '0.00', '5555.00', '2015-01-14 15:46:01', 0, 1),
(53, 257, 1, 'Rancho Cordova', 'ORC01', 0, '2013-11-30', 0, 'Redployed 60 workstations to Victoria, BC, Canada.', '10.50', '0.00', '0.00', '0.00', '0.00', '0.00', '10.50', '60000.00', '0.00', '0.00', '3375.00', '0.00', '5555.00', '2015-02-17 02:10:12', 0, 3),
(54, 285, 1, 'Raleigh', 'NCR01', 0, '2013-12-31', 1, 'Sold 200 workstations and chairs. Recycled lat files and shelving.', '63.62', '0.00', '40.00', '7750.00', '23.62', '1874.00', '0.00', '0.00', '0.00', '0.00', '17570.00', '0.00', '5555.00', '2015-01-14 15:45:16', 0, 1),
(55, 273, 1, 'Hingham', 'HGM01', 0, '2014-01-31', 1, 'Recycled 13 workstations, 96 tables, 89 chairs and 100 lat files.', '8.68', '0.00', '0.00', '0.00', '8.68', '1550.00', '0.00', '0.00', '0.00', '0.00', '6000.00', '0.00', '5555.00', '2015-01-14 15:44:56', 0, 1),
(56, 274, 1, 'Pontiac', 'PNT01', 0, '2014-01-31', 1, 'Sold 95 chairs', '2.37', '0.00', '2.37', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1400.00', '0.00', '5555.00', '2015-01-14 15:44:41', 0, 1),
(57, 287, 1, 'Dublin', 'OGC01', 0, '2014-01-31', 1, 'Sold 228 workstations, 40 private offices and conf rooma, 350 chairs and lat files.', '86.65', '0.00', '86.65', '2025.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '12994.00', '0.00', '5555.00', '2015-01-14 15:35:55', 0, 1),
(58, 253, 1, 'Charlotte', 'CHW01', 0, '2014-03-31', 1, 'Recycled 130 workstations, 20 private offices and conf rooms, 116 chairs, 75 lat files and misc tables.', '34.49', '0.00', '0.00', '0.00', '34.49', '2705.00', '0.00', '0.00', '0.00', '0.00', '10500.00', '0.00', '5555.00', '2015-01-14 15:35:41', 0, 1),
(59, 288, 1, 'Tulsa', 'MCG01', 0, '2014-04-30', 1, 'Recycled 600 lat files, 400 chairs and 250 panels. ', '45.75', '0.00', '0.00', '0.00', '45.75', '5328.00', '0.00', '0.00', '0.00', '0.00', '12000.00', '0.00', '5555.00', '2015-01-14 15:35:28', 0, 1),
(60, 258, 1, 'Louisville', 'LCO01', 0, '2014-04-30', 0, 'Sold 206 workstations, 7 private offices, 202 chairs, 201 files and 42 tables.', '54.47', '0.00', '54.47', '12727.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '34800.00', '0.00', '5555.00', '2015-01-14 15:35:14', 0, 1),
(61, 310, 2, 'STREETSVILLE', 'MIS02', 0, '2014-06-30', 1, 'Recycled 42 workstations, 50 chairs, 4 lat files and mics steel. ', '10.45', '0.00', '0.00', '0.00', '10.45', '775.00', '0.00', '0.00', '0.00', '0.00', '2756.00', '0.00', '5555.00', '2015-01-14 15:34:59', 0, 1),
(62, 253, 1, 'Montgomery', 'MGY04', 0, '2014-09-30', 1, 'Recycled 36 workstations, 150 chairs, 26 lat files and 25 shelving units. Redeployed 13 workstations. ', '13.00', '0.00', '0.00', '0.00', '10.73', '906.00', '2.27', '13000.00', '0.00', '0.00', '5437.00', '0.00', '5555.00', '2015-01-14 15:34:45', 0, 1),
(63, 257, 1, 'Sunnyvale', 'SVP01', 0, '2014-10-31', 1, 'Sold 427 workstations, 800 task chairs, 195 conf and cafe tables, 350 conf chairs, and 180 lat files. donated 646 workstations.', '235.37', '0.00', '122.32', '40858.00', '0.00', '0.00', '0.00', '0.00', '113.05', '16500.00', '80156.00', '0.00', '5555.00', '2015-02-09 09:22:54', 0, 3),
(64, 301, 1, 'Madison', 'MWH01', 0, '2014-11-30', 1, 'Recycled Madison furniture warehouse of approximately 100 workstations, 22 lat files and misc furniture parts. disposed of 345 tops.', '19.96', '2.31', '0.00', '0.00', '17.65', '1982.00', '0.00', '0.00', '0.00', '0.00', '6000.00', '900.00', '0.00', '2015-04-19 15:14:04', 0, 1),
(65, 269, 1, 'Louisville', 'LSA01', 0, '2015-03-30', 0, 'donated 114 workstations, 15 Private Offices and conference rooms and 189 task and conference chairs', '28.70', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '28.70', '3775.00', '8456.00', '0.00', '5555.00', '2015-04-15 15:15:54', 0, 1),
(66, 257, 0, 'Palo Alto', 'PAL01', 0, '2015-03-30', 1, 'Recycled 116 workstations from 1U & 2U', '20.60', '0.00', '0.00', '0.00', '20.60', '3021.00', '0.00', '0.00', '0.00', '0.00', '14175.00', '0.00', '5555.00', '2015-04-15 15:24:16', 0, 1),
(68, 303, 2, 'Calgery', 'CLG01', 0, '2015-04-30', 1, 'Removed 88 call center workstations to recycling and disposal', '7.15', '2.78', '0.00', '0.00', '4.37', '0.00', '0.00', '0.00', '0.00', '0.00', '1650.00', '600.00', '5555.00', '2015-05-12 12:51:04', 0, 1),
(69, 257, 1, 'Palo Alto', 'PAL01', 0, '2015-04-30', 1, 'removed 201 workstations from 3U and some ancillary furniture and recycled them', '42.20', '0.00', '0.00', '0.00', '39.20', '4004.00', '0.00', '0.00', '3.00', '795.00', '20719.00', '0.00', '5555.00', '2015-06-23 17:37:40', 0, 1),
(70, 262, 0, 'Alpharetta', 'ALF01', 0, '2015-05-31', 1, 'Redeployed 211 workstations w/o peds to BOI. Recycled balance', '35.41', '0.00', '0.00', '0.00', '3.76', '376.00', '31.65', '158250.00', '0.00', '0.00', '11900.00', '0.00', '5555.00', '2015-05-28 11:27:35', 0, 1),
(71, 301, 1, 'Brookfield', 'BOK01', 0, '2015-07-31', 1, 'Donated 20 workstations, conference, private offices and lobby furniture', '4.87', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '4.87', '675.00', '1090.00', '0.00', '5555.00', '2015-07-29 16:59:28', 0, 1),
(72, 288, 1, 'Tulsa ', 'MGG01', 0, '2015-07-31', 1, 'Recycled the balance of parts equal to 50 workstations after 350 workstation restack install', '6.91', '0.00', '0.00', '0.00', '6.91', '414.00', '0.00', '0.00', '0.00', '0.00', '2591.00', '0.00', '5555.00', '2015-09-12 17:35:26', 0, 1),
(73, 253, 6, 'Khulna', 'WMAH02', 1, '2015-09-07', 1, 'Anything for testing.......... :)', '12.00', '132.00', '123.00', '123.00', '1.00', '3.00', '123.00', '123.00', '123.00', '13.00', '21.00', '123.00', '3123.00', '2015-09-18 09:22:04', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_ID` int(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_ID` (`country_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=318 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `country_ID`, `name`, `code`, `latitude`, `longitude`, `created_date`) VALUES
(253, 1, 'Alabama', 'AL', 32.3182, -86.9023, '2014-11-17 06:06:11'),
(254, 1, 'Alaska', 'AK', 64.2008, -149.494, '2014-11-17 06:06:12'),
(255, 1, 'Arizona', 'AZ', 34.0489, -111.094, '2014-11-17 06:06:12'),
(256, 1, 'Arkansas', 'AR', 35.201, -91.8318, '2014-11-17 06:06:12'),
(257, 1, 'California', 'CA', 36.7783, -119.418, '2014-11-17 06:06:12'),
(258, 1, 'Colorado', 'CO', 32.3882, -100.865, '2014-11-17 06:06:12'),
(259, 1, 'Connecticut', 'CT', 41.6032, -73.0877, '2014-11-17 06:06:12'),
(260, 1, 'Delaware', 'DE', 38.9108, -75.5277, '2014-11-17 06:06:12'),
(261, 1, 'Florida', 'FL', 27.6648, -81.5158, '2014-11-17 06:06:12'),
(262, 1, 'Georgia', 'GA', 32.1656, -82.9001, '2014-11-17 06:06:12'),
(263, 1, 'Hawaii', 'HI', 19.8968, -155.583, '2014-11-17 06:06:12'),
(264, 1, 'Idaho', 'ID', 44.0682, -114.742, '2014-11-17 06:06:12'),
(265, 1, 'Illinois', 'IL', 40.6331, -89.3985, '2014-11-17 06:06:12'),
(266, 1, 'Indiana', 'IN', 40.2672, -86.1349, '2014-11-17 06:06:12'),
(267, 1, 'Iowa', 'IA', 41.878, -93.0977, '2014-11-17 06:06:12'),
(268, 1, 'Kansas', 'KS', 39.0119, -98.4842, '2014-11-17 06:06:12'),
(269, 1, 'Kentucky', 'KY', 37.8393, -84.27, '2014-11-17 06:06:12'),
(270, 1, 'Louisiana', 'LA', 30.9843, -91.9623, '2014-11-17 06:06:12'),
(271, 1, 'Maine', 'ME', 45.2538, -69.4455, '2014-11-17 06:06:12'),
(272, 1, 'Maryland', 'MD', 39.0458, -76.6413, '2014-11-17 06:06:12'),
(273, 1, 'Massachusetts', 'MA', 42.4072, -71.3824, '2014-11-17 06:06:12'),
(274, 1, 'Michigan', 'MI', 44.3148, -85.6024, '2014-11-17 06:06:12'),
(275, 1, 'Minnesota', 'MN', 46.7296, -94.6859, '2014-11-17 06:06:12'),
(276, 1, 'Mississippi', 'MS', 32.3547, -89.3985, '2014-11-17 06:06:12'),
(277, 1, 'Missouri', 'MO', 37.9643, -91.8318, '2014-11-17 06:06:12'),
(278, 1, 'Montana', 'MT', 46.8797, -110.363, '2014-11-17 06:06:12'),
(279, 1, 'Nebraska', 'NE', 41.4925, -99.9018, '2014-11-17 06:06:12'),
(280, 1, 'Nevada', 'NV', 38.8026, -116.419, '2014-11-17 06:06:12'),
(281, 1, 'New Hampshire', 'NH', 43.1939, -71.5724, '2014-11-17 06:06:12'),
(282, 1, 'New Jersey', 'NJ', 40.0583, -74.4057, '2014-11-17 06:06:12'),
(283, 1, 'New Mexico', 'NM', 34.5199, -105.87, '2014-11-17 06:06:12'),
(284, 1, 'New York', 'NY', 40.8537, -74.2257, '2014-11-17 06:06:12'),
(285, 1, 'North Carolina', 'NC', 35.7596, -79.0193, '2014-11-17 06:06:12'),
(286, 1, 'North Dakota', 'ND', 47.5515, -101.002, '2014-11-17 06:06:12'),
(287, 1, 'Ohio', 'OH', 40.4173, -82.9071, '2014-11-17 06:06:12'),
(288, 1, 'Oklahoma', 'OK', 35.4676, -97.5164, '2014-11-17 06:06:12'),
(289, 1, 'Oregon', 'OR', 43.8041, -120.554, '2014-11-17 06:06:12'),
(290, 1, 'Pennsylvania', 'PA', 41.2033, -77.1945, '2014-11-17 06:06:12'),
(291, 1, 'Rhode Island', 'RI', 41.5801, -71.4774, '2014-11-17 06:06:12'),
(292, 1, 'South Carolina', 'SC', 33.8361, -81.1637, '2014-11-17 06:06:12'),
(293, 1, 'South Dakota', 'SD', 43.9695, -99.9018, '2014-11-17 06:06:12'),
(294, 1, 'Tennessee', 'TN', 35.5175, -86.5804, '2014-11-17 06:06:12'),
(295, 1, 'Texas', 'TX', 31.9686, -99.9018, '2014-11-17 06:06:12'),
(296, 1, 'Utah', 'UT', 39.321, -111.094, '2014-11-17 06:06:12'),
(297, 1, 'Vermont', 'VT', 44.5588, -72.5778, '2014-11-17 06:06:12'),
(298, 1, 'Virginia', 'VA', 37.4316, -78.6569, '2014-11-17 06:06:12'),
(299, 1, 'Washington', 'WA', 38.9072, -77.0369, '2014-11-17 06:06:12'),
(300, 1, 'West Virginia', 'WV', 38.5976, -80.4549, '2014-11-17 06:06:12'),
(301, 1, 'Wisconsin', 'WI', 43.7844, -88.7879, '2014-11-17 06:06:12'),
(302, 1, 'Wyoming', 'WY', 43.076, -107.29, '2014-11-17 06:06:12'),
(303, 2, 'Alberta', 'AB', 53.9333, -116.576, '2014-11-17 06:06:12'),
(304, 2, 'British Columbia', 'BC', 53.7267, -127.648, '2014-11-17 06:06:12'),
(305, 2, 'Manitoba', 'MB', 53.7609, -98.8139, '2014-11-17 06:06:12'),
(306, 2, 'New Brunswick', 'NB', 46.5653, -66.4619, '2014-11-17 06:06:12'),
(307, 2, 'Newfoundland and Labrador', 'NL', 53.1355, -57.6604, '2014-11-17 06:06:12'),
(309, 2, 'Nova Scotia', 'NS', 44.682, -63.7443, '2014-11-17 06:06:12'),
(310, 2, 'Ontario', 'ON', 51.2538, -85.3232, '2014-11-17 06:06:12'),
(311, 2, 'Prince Edward Island', 'PE', 46.5107, -63.4168, '2014-11-17 06:06:12'),
(312, 2, 'Quebec', 'QC', 46.8033, -71.2428, '2014-11-17 06:06:12'),
(313, 2, 'Saskatchewan', 'SK', 52.9399, -106.451, '2014-11-17 06:06:12'),
(314, 2, 'Northwest Territories', 'NT', 64.8255, -124.846, '2014-11-17 06:06:12'),
(315, 2, 'Nunavut', 'NU', 70.2998, -83.1076, '2014-11-17 06:06:12'),
(316, 1, 'Yukon', 'YT', 35.5067, -97.7625, '2014-11-17 06:06:12'),
(317, 1, 'District of Columbia', 'DC', 38.8993, -77.0146, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `companyID` int(11) unsigned NOT NULL,
  `permission` int(1) NOT NULL DEFAULT '1',
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `login_name` varchar(40) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`),
  KEY `companyID` (`companyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `companyID`, `permission`, `first_name`, `last_name`, `login_name`, `created_at`, `status`, `updated_at`) VALUES
(1, 'help@pcsaved.com', '', '$2y$10$p/Ohm.CwAWbPyz2ELLRSb.aOin52VJAbQ8px8w6ZqrC8xTzCRwJVe', 0, -1, 'Administrator', '', 'admin', '2015-04-12 12:18:50', 1, '0000-00-00 00:00:00'),
(4, 'HPIPPPMgreen', '', '$2y$10$o6ty.T5FtCN4qlqYX5ype.Xu/OP1ttnQ9Gmgtsfg9USdMcnr69hhy', 0, 1, 'HPIPPPMgreen', '', 'HPIPPM', '2015-02-17 00:00:00', 1, '0000-00-00 00:00:00'),
(21, 'support@pcsaved.com', '', '$2y$10$Ae67y5RfVrdf8tqOFOlJuOPKs85M97efrfXGWu2/hrgdZ9UNGiicG', 0, 1, 'HP ', 'Associate', 'furniture1', '2015-04-14 19:04:49', 1, '0000-00-00 00:00:00'),
(22, 'help@pcsaved.com', '', '$2y$10$apBcgBFX1Q89VttN8QhpLOPugZTNcvkx0/4FBFbA.n3t5JcUFA7AS', 0, 1, 'HP', 'INC', 'furnituregreen', '2015-08-30 15:31:45', 1, '0000-00-00 00:00:00'),
(23, 'help@pcsaved.com', '', '$2y$10$bjFhvyHolTX9eo2cyXJuqeVGeoukvbZu.GV4RieqTDz4nozR3.MbS', 0, 1, 'HP', 'ENTERPRISE', 'green furniture', '2015-08-30 15:34:02', 1, '0000-00-00 00:00:00'),
(24, 'help@pcsaved.com', '', '$2y$10$3df74y6fIZo301WsR9loJe6mr77Lk2HnG0SAUTWSMwFP3HFO3z.7W', 0, -1, 'Roman', 'Larionov', 'PCSAVED.COM', '2015-08-30 15:42:53', 1, '0000-00-00 00:00:00'),
(28, 'abrarjahin@live.com', 'Piash', '$2y$10$oKiS4fCEQEp4CpdJAxWWUePhxrmzqKyuM1igJYfKsOQmop5zV4DBC', 1, 1, 'Abrar', 'Jahin', 'abrarjahin', '2015-09-19 08:53:14', 1, '2015-09-19 08:53:14');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`);

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`country_ID`) REFERENCES `country` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
