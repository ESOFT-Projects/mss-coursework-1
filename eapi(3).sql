-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2018 at 04:25 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_foam` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `name`, `short_foam`) VALUES
(1, 'Other', 'Other'),
(2, 'Colombo International Container Terminal', 'CICT'),
(3, 'Colombo Port Service', 'CPS'),
(4, 'Colombo Logistic', 'Colombo Logistic'),
(5, 'ZPMC', 'ZPMC'),
(6, 'MPL', 'MPL'),
(7, 'ILS', 'ILS'),
(8, 'Bell Vantage', 'Ball Vantage'),
(9, 'SHA Cleaning', 'Sha Cleaning'),
(10, 'Watch Guard', 'Watch Guard'),
(11, 'CICIL Lanka', 'CICIL Lanka'),
(12, 'Nawaloka', 'Nawaloka'),
(13, 'DW Services', 'DW Services and Suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `hod` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `company_id`, `title`, `hod`, `user_id`, `email`) VALUES
(1, 2, 'IT', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(2, 2, 'Finance', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(3, 2, 'Administration', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(4, 2, 'Commercial & Marketing', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(5, 2, 'Operations', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(6, 2, 'HR', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(7, 2, 'Legal', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(8, 2, 'HSE & Security', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(9, 2, 'Engineering', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(10, 2, 'Other', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk'),
(11, 2, 'CICT-GHO', 'Nishantha Hewawissa', 1, 'nishantha.hewawissa@cict.lk');

-- --------------------------------------------------------

--
-- Table structure for table `hazards`
--

CREATE TABLE `hazards` (
  `hazard_id` int(11) NOT NULL,
  `opinion` varchar(1000) NOT NULL,
  `priority` varchar(50) NOT NULL,
  `datetime` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `area_sub_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `officer_id` int(11) DEFAULT NULL,
  `rectified` char(1) NOT NULL DEFAULT 'N',
  `notified` char(1) NOT NULL DEFAULT 'N',
  `author_id` char(11) DEFAULT NULL,
  `deadline` varchar(50) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazards`
--

INSERT INTO `hazards` (`hazard_id`, `opinion`, `priority`, `datetime`, `created_by`, `area_id`, `area_sub_id`, `type_id`, `officer_id`, `rectified`, `notified`, `author_id`, `deadline`, `longitude`, `latitude`, `address`) VALUES
(1, 'hgfghhff', 'High', '2018-08-31 07:16:42', 1, 1, 1, 4, 1, 'N', 'N', '1', '2018-09-05', '79.8378878', '6.9421554', 'Unnamed Road, Colombo, Western Province, Sri Lanka'),
(2, 'a hazard', 'High', '2018-08-31 11:32:01', 1, 1, 1, 4, NULL, 'N', 'N', NULL, NULL, '79.8378936', '6.9421531', 'Unnamed Road, Colombo, Western Province, Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `hazards_images`
--

CREATE TABLE `hazards_images` (
  `image_id` int(11) NOT NULL,
  `hazard_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazards_images`
--

INSERT INTO `hazards_images` (`image_id`, `hazard_id`, `image`) VALUES
(1, 1, '0.29426302718181296.jpg'),
(2, 2, '0.7135289777090179.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hazards_inspections_extensions_requests`
--

CREATE TABLE `hazards_inspections_extensions_requests` (
  `request_id` int(11) NOT NULL,
  `hazard_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `extended_date` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `approved` char(1) NOT NULL DEFAULT 'N',
  `status` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hazard_areas`
--

CREATE TABLE `hazard_areas` (
  `area_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazard_areas`
--

INSERT INTO `hazard_areas` (`area_id`, `title`, `level`) VALUES
(1, 'Admin Building', 3),
(2, 'Workshop 2', 1),
(3, 'Gate House Area', 1),
(4, 'Workshop 1', 1),
(5, 'Refueling Station', 1),
(6, 'Wharf Area', 1),
(7, 'Yard Area', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hazard_areas_coordinates`
--

CREATE TABLE `hazard_areas_coordinates` (
  `coordinate_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazard_areas_coordinates`
--

INSERT INTO `hazard_areas_coordinates` (`coordinate_id`, `area_id`, `latitude`, `longitude`) VALUES
(1, 1, '6.942377764410986', '79.83837145625841'),
(2, 1, '6.941999683063523', '79.83837145625841'),
(3, 1, '6.942036958702828', '79.83741658984911'),
(4, 1, '6.941893181220671', '79.83740586101305'),
(5, 1, '6.941882531035065', '79.83700889407885'),
(6, 1, '6.94236178914892', '79.83700352966082'),
(7, 2, '6.942356464061456', '79.83697670757067'),
(8, 2, '6.941882531035065', '79.83698743640673'),
(9, 2, '6.941855905569979', '79.83510452567828'),
(10, 2, '6.942052933975909', '79.83510452567828'),
(11, 2, '6.942047608884946', '79.83568388282549'),
(12, 2, '6.942329838623188', '79.83568924724352'),
(13, 3, '6.944241569946928', '79.8263550719231'),
(14, 3, '6.94425222007915', '79.82684323396381'),
(15, 3, '6.943772963890879', '79.82687542047199'),
(16, 3, '6.943756988676192', '79.82712218370136'),
(17, 3, '6.943490735018283', '79.82711681928333'),
(18, 3, '6.943490735018283', '79.8263550719231'),
(19, 4, '6.945289732780765', '79.82722011456576'),
(20, 4, '6.944437723321009', '79.82723620781985'),
(21, 4, '6.944432398257029', '79.82693043599215'),
(22, 4, '6.944682676198752', '79.8266514862546'),
(23, 4, '6.9452418072896105', '79.82663539300052'),
(24, 5, '6.944096858222493', '79.82700738457117'),
(25, 5, '6.944096858222493', '79.82715222385798'),
(26, 5, '6.9438838554621', '79.827154906067'),
(27, 5, '6.9438838554621', '79.82701006678019'),
(28, 6, '6.945776916053274', '79.82754925094457'),
(29, 6, '6.945542613848383', '79.82754925094457'),
(30, 6, '6.94555326395114', '79.83833690330925'),
(31, 6, '6.945808866344892', '79.83834763214531'),
(32, 7, '6.9452152160922775', '79.82735969136684'),
(33, 7, '6.9452152160922775', '79.83821727345912'),
(34, 7, '6.9425313806436275', '79.83826018880336'),
(35, 7, '6.942510080301056', '79.83553506444423'),
(36, 7, '6.942233175759844', '79.83553506444423'),
(37, 7, '6.942233175759844', '79.82738114903896');

-- --------------------------------------------------------

--
-- Table structure for table `hazard_areas_subs`
--

CREATE TABLE `hazard_areas_subs` (
  `area_sub_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazard_areas_subs`
--

INSERT INTO `hazard_areas_subs` (`area_sub_id`, `area_id`, `title`) VALUES
(1, 1, 'Basement & Backyard'),
(2, 1, 'Car park'),
(4, 1, 'Level 1'),
(5, 1, 'Level 2'),
(6, 1, 'Level 3'),
(7, 1, 'Level 4'),
(8, 1, 'Roof Top');

-- --------------------------------------------------------

--
-- Table structure for table `hazard_areas_subs_coordinates`
--

CREATE TABLE `hazard_areas_subs_coordinates` (
  `coordinate_id` int(11) NOT NULL,
  `area_sub_id` int(11) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazard_areas_subs_coordinates`
--

INSERT INTO `hazard_areas_subs_coordinates` (`coordinate_id`, `area_sub_id`, `latitude`, `longitude`) VALUES
(1, 1, '6.942376420759389', '79.83753867457835'),
(2, 1, '6.9423657705847255', '79.83808048079936'),
(3, 1, '6.942184717578387', '79.83808048079936'),
(4, 1, '6.9421873801231', '79.83756013225047'),
(69, 2, '6.942094191049087', '79.83838088820903'),
(66, 2, '6.942357782953565', '79.838375523791'),
(67, 2, '6.9423657705847255', '79.8381046206805'),
(68, 2, '6.942091528503852', '79.83809925626247'),
(13, 4, '6.942376420759389', '79.83753331016032'),
(14, 4, '6.942384408390244', '79.83809120963542'),
(15, 4, '6.942120816500688', '79.83807511638133'),
(16, 4, '6.942115491410499', '79.83751721690624'),
(17, 5, '6.942386005892024', '79.83753545597665'),
(18, 5, '6.942375355717563', '79.83806385115258'),
(19, 5, '6.942186315080841', '79.83809335545175'),
(20, 5, '6.942183652536117', '79.8375435026037'),
(21, 6, '6.942388668435604', '79.83753277376763'),
(22, 6, '6.942380680804826', '79.8381040842878'),
(23, 6, '6.942194302714914', '79.83810140207879'),
(24, 6, '6.942183652536117', '79.83753009155862'),
(25, 7, '6.942396656066242', '79.83752472714059'),
(26, 7, '6.942364705542874', '79.83825697020166'),
(27, 7, '6.942133064183555', '79.8382650168287'),
(28, 7, '6.942178327446628', '79.83753545597665'),
(29, 8, '6.942378018261208', '79.83775807932489'),
(30, 8, '6.942380680804826', '79.83798874930017'),
(31, 8, '6.942290154313233', '79.83799143150918'),
(32, 8, '6.942282166680789', '79.83785732105844'),
(33, 8, '6.942212940527226', '79.83784927443139'),
(34, 8, '6.942223590705363', '79.83764810875527'),
(35, 8, '6.942314117209766', '79.83765079096429'),
(36, 8, '6.942322104841664', '79.83774735048883');

-- --------------------------------------------------------

--
-- Table structure for table `hazard_areas_subs_types`
--

CREATE TABLE `hazard_areas_subs_types` (
  `sub_type_id` int(11) NOT NULL,
  `area_sub_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazard_areas_subs_types`
--

INSERT INTO `hazard_areas_subs_types` (`sub_type_id`, `area_sub_id`, `type_id`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 1, 6),
(4, 1, 7),
(5, 1, 8),
(6, 1, 9),
(7, 1, 10),
(8, 1, 11),
(9, 1, 12),
(10, 1, 13),
(11, 1, 14),
(12, 1, 15),
(13, 1, 16),
(102, 2, 25),
(101, 2, 15),
(100, 2, 14),
(20, 4, 6),
(21, 4, 9),
(22, 4, 15),
(23, 4, 17),
(24, 4, 18),
(25, 4, 19),
(26, 4, 20),
(27, 4, 21),
(28, 4, 22),
(29, 4, 23),
(30, 4, 24),
(31, 5, 6),
(32, 5, 9),
(33, 5, 15),
(34, 5, 17),
(35, 5, 18),
(36, 5, 19),
(37, 5, 20),
(38, 5, 21),
(39, 5, 22),
(40, 5, 23),
(41, 5, 24),
(42, 6, 6),
(43, 6, 9),
(44, 6, 15),
(45, 6, 17),
(46, 6, 18),
(47, 6, 19),
(48, 6, 20),
(49, 6, 21),
(50, 6, 22),
(51, 6, 23),
(52, 6, 24),
(53, 7, 6),
(54, 7, 9),
(55, 7, 15),
(56, 7, 17),
(57, 7, 18),
(58, 7, 19),
(59, 7, 20),
(60, 7, 21),
(61, 7, 22),
(62, 7, 23),
(63, 7, 24),
(64, 8, 6),
(65, 8, 9),
(66, 8, 15),
(67, 8, 17),
(68, 8, 18),
(69, 8, 19),
(70, 8, 20),
(71, 8, 21),
(72, 8, 22),
(73, 8, 23),
(74, 8, 24),
(75, 7, 4),
(76, 7, 5),
(77, 7, 6),
(78, 7, 7),
(79, 7, 4),
(80, 7, 5),
(81, 7, 6),
(82, 7, 7),
(83, 7, 8),
(84, 7, 9),
(85, 7, 4),
(86, 7, 5),
(87, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `hazard_levels`
--

CREATE TABLE `hazard_levels` (
  `level_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `indicate` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazard_levels`
--

INSERT INTO `hazard_levels` (`level_id`, `title`, `indicate`) VALUES
(1, 'High', '#d9534f'),
(2, 'Moderate', '#f0ad4e'),
(3, 'Low', '#428bca');

-- --------------------------------------------------------

--
-- Table structure for table `hazard_types`
--

CREATE TABLE `hazard_types` (
  `type_id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hazard_types`
--

INSERT INTO `hazard_types` (`type_id`, `title`, `description`, `latitude`, `longitude`) VALUES
(4, 'Hygienic food preparation.', 'Admin Building, Basement', '6.94223845446084', '79.83805738681485'),
(5, 'Cleanliness in kitchen area (drain cover, drains, etc.)', 'Admin Building, Basement', '6.944158723835193', '79.8318014294955'),
(6, 'Unsafe electrical components. (Switches, sockets and connections.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(7, 'Availability of fire extinguishers.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(8, 'Proper locking of access door to kitchen.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(9, 'Bathroom defects', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(10, 'Unsafe working by kitchen staff.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(11, 'Proper cloths are worn by kitchen cooking staffs.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(12, 'Good housekeeping.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(13, 'Garbage room.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(14, 'Suspected gatherings.', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(15, 'Unauthorized personnel. Inform security', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(16, 'Overflowing sewerage pits', 'Admin Building, Basement', '6.9422556', '79.8376269'),
(17, 'Availability of security at lobby and his vigilance    ', 'Availability of security at lobby and his vigilance.', '6.9422556', '79.8376269'),
(18, 'Proper locking of access doors.', 'Proper locking of access doors.', '6.9422556', '79.8376269'),
(19, 'Operator vigilance at CCTV room.', 'Operator vigilance at CCTV room.', '6.9422556', '79.8376269'),
(20, 'Availability of fire extinguishers at locations.', 'Admin Building, Other Floors', '6.9422556', '79.8376269'),
(21, 'Roof top area.', 'Admin Building, Other Floors', '6.9422556', '79.8376269'),
(22, 'Proper locking of access doors of all floors.', 'Admin Building, Other Floors', '6.9422556', '79.8376269'),
(23, 'Water and electricity preserving.', 'Admin Building, Other Floors', '6.9422556', '79.8376269'),
(24, 'Damages to building fittings.', 'Admin Building, Other Floors', '6.9422556', '79.8376269'),
(25, 'Availability and vigilance of back gate and front guard room security.', 'Admin Building, Car Park', '6.9422556', '79.8376269'),
(26, 'Cleanliness in work shop area.', 'Admin Building, Car Park', '6.9422556', '79.8376269'),
(27, 'PPE worn by all workshop staffs the other staffs using the workshop area.', 'Admin Building, Car Park', '6.9422556', '79.8376269'),
(28, 'Unsafe behaviors.', 'Unsafe behaviors.', '6.9422556', '79.8376269'),
(29, 'Availability of fire extinguishers at designated locations.', 'Availability of fire extinguishers at designated locations.', '6.9422556', '79.8376269'),
(30, 'Construction related issues.', 'Construction related issues.', '6.9422556', '79.8376269'),
(31, 'Overflowing sewerage treatment plant 1.', 'Overflowing sewerage treatment plant 1.', '6.9422556', '79.8376269'),
(32, 'Availability of unauthorized persons. Inform security.', 'Availability of unauthorized persons. Inform security.', '6.9422556', '79.8376269'),
(33, 'Smoking.', 'Smoking.', '6.9422556', '79.8376269'),
(34, 'Cleanliness and safe working environment at container repair shed.', 'Cleanliness and safe working environment at container repair shed.', '6.9422556', '79.8376269'),
(35, 'Waste management at engineering waste collection point.', 'Waste management at engineering waste collection point.', '6.9422556', '79.8376269'),
(36, 'RTG maintenance area.', 'RTG maintenance area.', '6.9422556', '79.8376269'),
(37, 'Drains.', 'Drains.', '6.9422556', '79.8376269'),
(38, 'Substation 2', 'Substation 2', '6.9422556', '79.8376269'),
(39, 'Running of air conditioners.', 'Running of air conditioners.', '6.9422556', '79.8376269'),
(40, 'Pump house area.', 'Pump house area.', '6.9422556', '79.8376269'),
(41, 'Parking of unauthorized vehicles.', 'Parking of unauthorized vehicles.', '6.9422556', '79.8376269'),
(42, 'Bathroom condition', 'Bathroom condition', '6.9422556', '79.8376269'),
(43, 'Washing bay area. Activities and cleanliness.', 'Washing bay area. Activities and cleanliness.', '6.9422556', '79.8376269'),
(44, 'PPE worn by gate house staff/tallymen/lashers and security or any other outside workers.', 'PPE worn by gate house staff/tallymen/lashers and security or any other outside workers.', '6.9422556', '79.8376269'),
(45, 'Availability of security OIC and staff.', 'Availability of security OIC and staff.', '6.9422556', '79.8376269'),
(46, 'Condition of truck assistant rest room.', 'Condition of truck assistant rest room.', '6.9422556', '79.8376269'),
(47, 'Using correct truck lanes.', 'Using correct truck lanes.', '6.9422556', '79.8376269'),
(48, 'Parking of trucks without obstructing pedestrian crossing.', 'Parking of trucks without obstructing pedestrian crossing.', '6.9422556', '79.8376269'),
(49, 'Truck drivers walking across truck lanes or getting down from the trucks for card swiping.', 'Truck drivers walking across truck lanes or getting down from the trucks for card swiping.', '6.9422556', '79.8376269'),
(50, 'Behavior of truck drivers and assistants.', 'Behavior of truck drivers and assistants.', '6.9422556', '79.8376269'),
(51, 'Condition of trucks entering terminal (head lights, body condition)', 'Condition of trucks entering terminal (head lights, body condition)', '6.9422556', '79.8376269'),
(52, 'Parking Area and Ground floor', 'Parking Area and Ground floor', '6.9422556', '79.8376269'),
(53, 'PPE worn by all workshop staffs the other staffs using the workshop area.', 'PPE worn by all workshop staffs the other staffs using the workshop area.', '6.9422556', '79.8376269'),
(54, 'Proper securing of overhead crane.', 'Proper securing of overhead crane.', '6.9422556', '79.8376269'),
(55, 'Overflowing sewerage treatment plant 2.', 'Overflowing sewerage treatment plant 2.', '6.9422556', '79.8376269'),
(56, 'Availability of unauthorized persons.', 'Availability of unauthorized persons.', '6.9422556', '79.8376269'),
(57, 'Proper waste disposal at waste collection area.', 'Proper waste disposal at waste collection area.', '6.9422556', '79.8376269'),
(58, 'Cleanliness of ground floor service bays and main vehicle service bay.', 'Cleanliness of ground floor service bays and main vehicle service bay.', '6.9422556', '79.8376269'),
(59, 'RTG maintenance area.', 'RTG maintenance area.', '6.9422556', '79.8376269'),
(60, 'Sewerage Treatment Plant 2.', 'Sewerage Treatment Plant 2.', '6.9422556', '79.8376269'),
(61, 'Equipment parking area.', 'Equipment parking area.', '6.9422556', '79.8376269'),
(62, 'Security around central stores and unauthorized movements.', 'Security around central stores and unauthorized movements.', '6.9422556', '79.8376269'),
(63, 'Smoking and alcohol.', 'Smoking and alcohol.', '6.9422556', '79.8376269'),
(64, 'Rest room condition.', 'Rest room condition.', '6.9422556', '79.8376269'),
(65, 'Use of roof top.', 'Use of roof top.', '6.9422556', '79.8376269'),
(66, 'Employees sleeping other than rest rooms.', 'Employees sleeping other than rest rooms.', '6.9422556', '79.8376269'),
(67, 'Availability of duty personnel.', 'Availability of duty personnel.', '6.9422556', '79.8376269'),
(68, 'Wearing of PPE.', 'Wearing of PPE.', '6.9422556', '79.8376269'),
(69, 'Using mobile phones.', 'Using mobile phones.', '6.9422556', '79.8376269'),
(70, 'Drivers behavior.', 'Drivers behavior.', '6.9422556', '79.8376269'),
(71, 'Fuelling procedure', 'Fuelling procedure', '6.9422556', '79.8376269'),
(72, 'Position of gangway.', 'Position of gangway.', '6.9422556', '79.8376269'),
(73, 'Availability of safety net beneath gangway.', 'Availability of safety net beneath gangway.', '6.9422556', '79.8376269'),
(74, 'Gang way doesnt cross the QC moving path or rail.', 'Gang way doesnt cross the QC moving path or rail.', '6.9422556', '79.8376269'),
(75, 'Positioning of QCs during vessel berthing and sailing.', 'Positioning of QCs during vessel berthing and sailing.', '6.9422556', '79.8376269'),
(76, 'Lashers using safety helmet, safety shoes, good visible overall, gloves and retractable safety harness and other gears as required.', 'Lashers using safety helmet, safety shoes, good visible overall, gloves and retractable safety harness and other gears as required.', '6.9422556', '79.8376269'),
(77, 'Deck controllers using PPE and safety behavior and their safe positioning on board.', 'Deck controllers using PPE and safety behavior and their safe positioning on board.', '6.9422556', '79.8376269'),
(78, 'Proper storing of lashing gears causing risk to deck controllers and lashers.', 'Proper storing of lashing gears causing risk to deck controllers and lashers.', '6.9422556', '79.8376269'),
(79, 'Availability of the safety rails onboard.', 'Availability of the safety rails onboard.', '6.9422556', '79.8376269'),
(80, 'Unlashing / Lashing Procedures by lashers.', 'Unlashing / Lashing Procedures by lashers.', '6.9422556', '79.8376269'),
(81, 'Unsafe behaviors of lashers.', 'Unsafe behaviors of lashers.', '6.9422556', '79.8376269'),
(82, 'Unsafe berthing ropes.', 'Unsafe berthing ropes.', '6.9422556', '79.8376269'),
(83, 'Tank containers not transporting on normal ITV trailers.', 'Tank containers not transporting on normal ITV trailers.', '6.9422556', '79.8376269'),
(84, 'Containers not stacked properly corner fitting to corner fitting.', 'Containers not stacked properly corner fitting to corner fitting.', '6.9422556', '79.8376269'),
(85, 'No single tower over 4 high stacking.', 'No single tower over 4 high stacking.', '6.9422556', '79.8376269'),
(86, 'Outsource contractors (rework teams, construction workers, yard cleaners) behavior.', 'Outsource contractors (rework teams, construction workers, yard cleaners) behavior.', '6.9422556', '79.8376269'),
(87, 'Terminal users walking across yard stacking.', 'Terminal users walking across yard stacking.', '6.9422556', '79.8376269'),
(88, 'Traffic violations by all terminal users. (Speeding above 30 Kmph, improper parking, opposite traffic flow driving, littering etc.)', 'Traffic violations by all terminal users. (Speeding above 30 Kmph, improper parking, opposite traffic flow driving, littering etc.)', '6.9422556', '79.8376269'),
(89, 'Position of barricades in yard stacks.', 'Position of barricades in yard stacks.', '6.9422556', '79.8376269'),
(90, 'RTG operators change over.', 'RTG operators change over.', '6.9422556', '79.8376269'),
(91, 'Reefer containers in other stacks. Re confirm such reefer containers contain dry cargo.', 'Reefer containers in other stacks. Re confirm such reefer containers contain dry cargo.', '6.9422556', '79.8376269'),
(92, 'DG containers (with DG labels) stacked apart from DG stacks.', 'DG containers (with DG labels) stacked apart from DG stacks.', '6.9422556', '79.8376269'),
(93, 'OOG stacking with proper supervision.', 'OOG stacking with proper supervision.', '6.9422556', '79.8376269'),
(94, 'Stack markings and numbering condition.', 'Stack markings and numbering condition.', '6.9422556', '79.8376269'),
(95, 'Reach stacker/Empty stacker/Fork lift operation.', 'Reach stacker/Empty stacker/Fork lift operation.', '6.9422556', '79.8376269'),
(96, 'Availability of yard controller for RTG lane changing.', 'Availability of yard controller for RTG lane changing.', '6.9422556', '79.8376269'),
(97, 'External truck drivers traffic rule adherence and behavior in the yard. (Getting down and walking and littering in the yard)', 'External truck drivers traffic rule adherence and behavior in the yard. (Getting down and walking and littering in the yard)', '6.9422556', '79.8376269'),
(98, 'Littering by external parties.', 'Littering by external parties.', '6.9422556', '79.8376269'),
(99, 'CICT subcontractors traffic rule adherence.', 'CICT subcontractors traffic rule adherence.', '6.9422556', '79.8376269'),
(100, 'Construction related defects and damages to yard property.', 'Construction related defects and damages to yard property.', '6.9422556', '79.8376269'),
(101, 'Damaged man hole and pit covers. Barricade immediately.', 'Damaged man hole and pit covers. Barricade immediately.', '6.9422556', '79.8376269'),
(102, 'Condition of fire boxes and above ground fire hydrants.', 'Condition of fire boxes and above ground fire hydrants.', '6.9422556', '79.8376269'),
(103, 'Substation 1 and 3 surroundings.', 'Substation 1 and 3 surroundings.', '6.9422556', '79.8376269'),
(104, 'Yard lighting conditions', 'Yard lighting conditions', '6.9422556', '79.8376269'),
(105, 'Yard controller behavior', 'Yard controller behavior', '6.9422556', '79.8376269'),
(106, 'Wearing of PPEs', 'Wearing of PPEs', '6.9422556', '79.8376269'),
(107, 'Hygienic conditions', 'Hygienic conditions', '6.9422556', '79.8376269'),
(108, 'Lasher behavior.', 'Lasher behavior.', '6.9422556', '79.8376269'),
(109, 'Toilet bathroom defects.', 'Toilet bathroom defects.', '6.9422556', '79.8376269'),
(110, 'Waste disposal.', 'Waste disposal.', '6.9422556', '79.8376269'),
(111, 'No over 3 high stacking at DG blocks.', 'No over 3 high stacking at DG blocks.', '6.9422556', '79.8376269'),
(112, 'No DG tanks mixed with GPS on the same row.', 'No DG tanks mixed with GPS on the same row.', '6.9422556', '79.8376269'),
(113, 'No single tower over 4 high stacking.', 'No single tower over 4 high stacking.', '6.9422556', '79.8376269'),
(114, 'Leakage', 'Leakage', '6.9422556', '79.8376269'),
(115, 'Smoke', 'Smoke', '6.9422556', '79.8376269'),
(116, 'Fire', 'Fire', '6.9422556', '79.8376269'),
(117, 'Condition of fire boxes and above ground fire hydrants.', 'Condition of fire boxes and above ground fire hydrants.', '6.9422556', '79.8376269'),
(118, 'Yard lighting conditions', 'Yard lighting conditions', '6.9422556', '79.8376269'),
(119, 'Spary rod condition.', 'Spary rod condition.', '6.9422556', '79.8376269');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sent_at` varchar(50) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message`, `user_id`, `sent_at`, `origin_id`, `destination_id`) VALUES
(1, 'You have assigned an inspection task. Deadline 2018-08-31 , Admin Building, Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 07:19:16', 1, 1),
(2, 'You have assigned a new role plan from 2018-08-01 to 2018-08-31', 1, '2018-08-31 07:20:27', 1, 1),
(3, 'You have two days left to start new role plan . Starts from 2018-08-29 To 2018-09-05', 1, '2018-08-31 12:55:35', 1, 1),
(4, 'You have two days left to finish role plan . Started from 2018-08-31 To 2018-09-02', 1, '2018-08-31 13:01:04', 1, 1),
(5, 'You have two days left to finish hazard inspection on Admin Building,Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 13:02:36', 1, 1),
(6, 'You have haazrd overdue non inspection @ Admin Building,Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 13:02:59', 1, 1),
(7, 'You have haazrd overdue non inspection @ Admin Building,Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 13:03:12', 1, 1),
(8, 'You have haazrd overdue non inspection @ Admin Building,Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 13:04:49', 1, 1),
(9, 'You have two days left to finish hazard inspection on Admin Building,Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 13:05:56', 1, 1),
(10, 'You have two days left to finish hazard inspection on Admin Building,Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 13:06:49', 1, 1),
(11, 'You have haazrd overdue non inspection @ Admin Building,Basement & Backyard, Hygienic food preparation.', 1, '2018-08-31 13:08:09', 1, 1),
(12, 'You have role plan overdue non inspection @ 2018-08-01 To 2018-08-29', 1, '2018-08-31 13:10:38', 1, 1),
(13, 'You have role plan overdue non inspection @ 2018-08-01 To 2018-08-29', 1, '2018-08-31 13:11:02', 1, 1),
(14, 'You have role plan overdue non inspection @ 2018-08-01 To 2018-08-29', 1, '2018-08-31 13:15:33', 1, 1),
(15, 'Hello', 1, '2018-09-10 18:18:23', 1, 1),
(16, 'Hello', 1, '2018-09-10 18:18:48', 1, 1),
(17, 'Hello', 1, '2018-09-10 18:19:19', 1, 1),
(18, 'Hello', 1, '2018-09-10 18:20:29', 1, 1),
(19, 'Hello', 1, '2018-09-10 18:22:00', 1, 1),
(20, 'Hello', 1, '2018-09-10 18:22:26', 1, 1),
(21, 'Hello', 1, '2018-09-10 18:22:41', 1, 1),
(22, 'Hello', 1, '2018-09-10 18:23:03', 1, 1),
(23, 'Hello', 1, '2018-09-10 18:23:27', 1, 1),
(24, 'Hello', 1, '2018-09-10 18:24:13', 1, 1),
(25, 'Hello', 1, '2018-09-10 18:24:13', 1, 1),
(26, 'Hello', 1, '2018-09-10 18:24:14', 1, 1),
(27, 'Hello', 1, '2018-09-10 18:24:36', 1, 1),
(28, 'Hello', 1, '2018-09-10 18:24:36', 1, 1),
(29, 'Hello', 1, '2018-09-10 18:24:36', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages_notices`
--

CREATE TABLE `messages_notices` (
  `notice_id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages_notices`
--

INSERT INTO `messages_notices` (`notice_id`, `message`, `datetime`, `origin_id`, `destination_id`, `status`) VALUES
(1, 'Nishantha Hewawissa, has been report a new hazard.', '2018-08-31 07:16:51', 1, 0, 'Y'),
(2, 'Nishantha Hewawissa, has been report a new violation.', '2018-08-31 11:14:22', 1, 0, 'Y'),
(3, 'Nishantha Hewawissa, has submit his review.', '2018-08-31 11:24:56', 1, 0, 'Y'),
(4, 'Nishantha Hewawissa, has been report a new hazard.', '2018-08-31 11:32:10', 1, 0, 'Y'),
(5, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-04 04:43:29', 1, 0, 'Y'),
(6, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-04 06:21:23', 1, 0, 'Y'),
(7, 'Nishantha Hewawissa, has been completed task at Admin Building, Car park, Suspected gatherings.', '2018-09-17 13:53:00', 1, 1, 'Y'),
(8, 'Nishantha Hewawissa, has been completed task at Admin Building, Car park, Suspected gatherings.', '2018-09-17 13:57:44', 1, 1, 'Y'),
(9, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-17 20:34:43', 1, 0, 'Y'),
(10, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-17 21:23:08', 1, 0, 'Y'),
(11, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-17 21:25:31', 1, 0, 'Y'),
(12, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-17 21:28:21', 1, 0, 'N'),
(13, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-18 07:03:28', 1, 0, 'N'),
(14, 'Nishantha Hewawissa, has been report a new violation.', '2018-09-18 08:59:55', 1, 0, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `messages_notices_mails`
--

CREATE TABLE `messages_notices_mails` (
  `notice_id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(32, '2014_10_12_000000_create_users_table', 1),
(33, '2014_10_12_100000_create_password_resets_table', 1),
(34, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(35, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(36, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(37, '2016_06_01_000004_create_oauth_clients_table', 1),
(38, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(39, '2017_12_13_075756_create_products_table', 1),
(40, '2017_12_13_075940_create_reviews_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('f82edf8e34de0072f84e550f241ff34e388e76691971aed551f423362abfe4b57ede5dacaa583b12', 1, 2, NULL, '[]', 0, '2017-12-26 04:08:57', '2017-12-26 04:08:57', '2037-12-26 09:38:56'),
('e45f914bf9dd077af370776716980232581f7fff001964c2f01edaca677dee8a450717a837132879', 1, 2, NULL, '[]', 0, '2017-12-26 04:09:36', '2017-12-26 04:09:36', '2037-12-26 09:39:36'),
('d485a3efba3a5e2b4446614a3a7972d196826f5774b1f77f3aa53cbd4fc62e0438b369c0f5acc759', 1, 2, NULL, '[]', 0, '2018-06-27 22:55:05', '2018-06-27 22:55:05', '2038-06-28 04:25:05'),
('040d4d8d5eaf0f889ba31d12a3bcd6e399b1e2cf2c5806caac44540cc9c33de8828bac16c39a83d0', 1, 2, NULL, '[]', 0, '2018-06-27 22:57:39', '2018-06-27 22:57:39', '2038-06-28 04:27:39'),
('eb225dc769d1eb3ca87a11b79f7858560670bf376318a110ac1128ead2d7da521f89051613ea4b94', 1, 2, NULL, '[]', 0, '2018-06-28 01:57:02', '2018-06-28 01:57:02', '2038-06-28 07:27:02'),
('3ff207ce4f3eb720081657b722d83d0fd1a0fbf603ae24a7ae4e052b724ee5c3a495554efd06ff8e', 1, 2, NULL, '[]', 0, '2018-07-04 06:48:20', '2018-07-04 06:48:20', '2038-07-04 12:18:19'),
('3c6475c55cb43fc0514e74bb84a3de5cb67161d50eaaaef16bff64936cd5599f831e1e0988affd0c', 1, 2, NULL, '[]', 0, '2018-07-04 06:52:41', '2018-07-04 06:52:41', '2038-07-04 12:22:41'),
('1ccc17a8888df505a6abf47878f05c04a55596ce30bb00d1ebd775dbb0ad908a12733667386d6873', 1, 2, NULL, '[]', 0, '2018-07-04 06:53:25', '2018-07-04 06:53:25', '2038-07-04 12:23:24'),
('3f319f7d3365c091cdde06d96e69234427c88ad28b954a99399b7dc8be62f7df56eb0e6406835b07', 1, 2, NULL, '[]', 0, '2018-07-04 06:53:42', '2018-07-04 06:53:42', '2038-07-04 12:23:41'),
('2340d306a2afa31e105f36e6c20d1b04f9e2922b5a9b1a3577fabb3a3d7da9b07d841631090f95d7', 1, 2, NULL, '[]', 0, '2018-07-04 06:54:22', '2018-07-04 06:54:22', '2038-07-04 12:24:22'),
('95528d25b6cf2bb9faf08dad7de2a6fe57042febc9f778e8104f540b1b225bd6867b8a8d14fec160', 1, 2, NULL, '[]', 0, '2018-07-04 06:56:30', '2018-07-04 06:56:30', '2038-07-04 12:26:30'),
('3a1e78782539adb47c9b82405c23530418fcee7f53cf19e74bdbc6bfe2d2af5529be8afb7f37c436', 1, 2, NULL, '[]', 0, '2018-07-04 06:59:27', '2018-07-04 06:59:27', '2038-07-04 12:29:27'),
('1ead6a1109fcd81991a7bcf0cea74cb2a4cba60471b58e59ad887f6ea2472b1ffcf5798b321b54d6', 1, 2, NULL, '[]', 0, '2018-07-04 07:01:06', '2018-07-04 07:01:06', '2038-07-04 12:31:06'),
('28929042c308592a8701eb55c63078c15fa9a63fb46afb8e78ff0518c9d9f7932cd6c56e27a9ecae', 1, 2, NULL, '[]', 0, '2018-07-04 07:01:34', '2018-07-04 07:01:34', '2038-07-04 12:31:34'),
('1b75bd68822e90712260d0527f8ec4e7be55de2bb2ab0fe4e937ec0958b2a4020f853ad85ddf46d7', 1, 2, NULL, '[]', 0, '2018-07-04 07:01:39', '2018-07-04 07:01:39', '2038-07-04 12:31:39'),
('589614b5b7a4b7f2d0e73f079de224ee1653cfd3d06ab9ee8025f351acffd3741dbfb7ac874f4b4e', 1, 2, NULL, '[]', 0, '2018-07-04 07:08:57', '2018-07-04 07:08:57', '2038-07-04 12:38:57'),
('933f924c52df080cf8f40f7e17e4c2997b9f550e68d20d36fa2df35e3e01fa13a4856925070cc449', 1, 2, NULL, '[]', 0, '2018-07-04 07:09:21', '2018-07-04 07:09:21', '2038-07-04 12:39:21'),
('20c49f190218744f3439f8da46f6bed0ed70d112ad1164d63c62e806f6c9f4d814e221c5cb6eb764', 1, 2, NULL, '[]', 0, '2018-07-04 07:29:47', '2018-07-04 07:29:47', '2038-07-04 12:59:47'),
('9f553ca8d75dd2584549bb983d9d1bc4f5638442f219f33e928333ed71b21e70a6a200624ad72ca0', 1, 2, NULL, '[]', 0, '2018-07-04 07:36:49', '2018-07-04 07:36:49', '2038-07-04 13:06:49'),
('0460e0a15ba46e48a9379cbb95f7fdfafcbf300b9aa10689b857c456c61d99237ff77fe9c7052129', 1, 2, NULL, '[]', 0, '2018-07-04 07:36:54', '2018-07-04 07:36:54', '2038-07-04 13:06:54'),
('3e01e87aad4042f29aceb07642c12ca96de8823db12272c056a882e21e6a52967a9796d3945445fb', 1, 2, NULL, '[]', 0, '2018-07-04 07:37:22', '2018-07-04 07:37:22', '2038-07-04 13:07:22'),
('7bf7723244cadcc0cd6897cdd5fe1b6f8fe132cee7c7ee148b57a08cc0c0b3b112ab0a2de2abcdd5', 1, 2, NULL, '[]', 0, '2018-07-04 07:37:38', '2018-07-04 07:37:38', '2038-07-04 13:07:38'),
('068009ed951071146e7596e48d75476a8d34f9ebc77a8efbc30dcde1f6ef299fa6f17c1d34585a12', 1, 2, NULL, '[]', 0, '2018-07-04 21:40:46', '2018-07-04 21:40:46', '2038-07-05 03:10:46'),
('331365bad5d8b2b005ddf12b3f7b210233408dca960b94601661dd157d0f4ea92fa9342d9198adac', 1, 2, NULL, '[]', 0, '2018-07-04 21:49:30', '2018-07-04 21:49:30', '2038-07-05 03:19:29'),
('e30ad9dee4e783b8f9e8a04f92e342d3f9b4587de7a8c591494c4e611256765a994cae78ae7388c9', 1, 2, NULL, '[]', 0, '2018-07-04 21:49:42', '2018-07-04 21:49:42', '2038-07-05 03:19:42'),
('bc8af7494efa28948c862b60f887f5a9a332cdf29f169da283ae5332c2611f096012d38a52063117', 1, 2, NULL, '[]', 0, '2018-07-04 21:50:49', '2018-07-04 21:50:49', '2038-07-05 03:20:49'),
('62d92447b1b1cbecea9ec88c7513a307c3a21cb619d28af7306c49de98b04b90acbd6d3ea95829d4', 1, 2, NULL, '[]', 0, '2018-07-04 21:51:26', '2018-07-04 21:51:26', '2038-07-05 03:21:26'),
('5b23c6293fa22991ddbfc174595bd66750939d1b42685c62eef0e7523ce57c13c2b76af145b647df', 1, 2, NULL, '[]', 0, '2018-07-04 21:52:06', '2018-07-04 21:52:06', '2038-07-05 03:22:06'),
('e27a01fe1b47a071d10fca137830cfe1da242fc64f39241cd9b319b88a8c37b060b7410c6a2b8ec0', 1, 2, NULL, '[]', 0, '2018-07-04 22:00:07', '2018-07-04 22:00:07', '2038-07-05 03:30:07'),
('332237a32d6be3877cea3e507168430aff67fbed3b48dd0519c14aa2533f3c6363d9bba1631355a3', 1, 2, NULL, '[]', 0, '2018-07-04 22:00:13', '2018-07-04 22:00:13', '2038-07-05 03:30:13'),
('77d32c036d6e3336efee85d479e11f2ee5575d7049db93638d269e61cb9d714918fedd097dfe1e9e', 1, 2, NULL, '[]', 0, '2018-07-04 22:00:35', '2018-07-04 22:00:35', '2038-07-05 03:30:35'),
('e3b559814aa331f7e10e4a8249ea169cb81b42e35ea4621bbc7b2a96d6b91c110670f1c2256895c2', 1, 2, NULL, '[]', 0, '2018-07-04 22:00:54', '2018-07-04 22:00:54', '2038-07-05 03:30:53'),
('3e5dcc56c14ec49b67928e73a0f647bd5fe4b8656d5790d4c3c693fcee64049d68ff390daf93edbb', 1, 2, NULL, '[]', 0, '2018-07-04 22:00:57', '2018-07-04 22:00:57', '2038-07-05 03:30:57'),
('598982a5e5a313f6551f7e8f3726c4095cfbc5ec5fdf8086210916eff07f0242307125d52e51c5b1', 1, 2, NULL, '[]', 0, '2018-07-04 22:14:55', '2018-07-04 22:14:55', '2038-07-05 03:44:55'),
('572d96d44d3ec3635c521658fff586fd351b55f783c1c91ab432012c2d5f7dbba4f2d3f5d8dc9863', 1, 2, NULL, '[]', 0, '2018-07-04 22:16:08', '2018-07-04 22:16:08', '2038-07-05 03:46:08'),
('9ee48efe2f902ecd19f0f983d65db3f451a0b836761893c4e7ff47c8eebb91d31af074fa633f4e50', 1, 2, NULL, '[]', 0, '2018-07-04 22:16:20', '2018-07-04 22:16:20', '2038-07-05 03:46:20'),
('40ac5256aae3e27f1b9e1343a49ee9df15c0462b16e2a006ce89a319d9ec25788fa5ad51cc0c6374', 1, 2, NULL, '[]', 0, '2018-07-04 22:17:08', '2018-07-04 22:17:08', '2038-07-05 03:47:08'),
('436f9932dc4fdf793a6f1b68f45eafe9eccb56a1162688f8c38dbd77539ac2dcb3615a5ad260d069', 1, 2, NULL, '[]', 0, '2018-07-04 22:18:58', '2018-07-04 22:18:58', '2038-07-05 03:48:58'),
('8456458e349b747d07f47062b7a1425b8ca46fdcbb897abfa08a1b700e01a5cd142c8184510ec223', 1, 2, NULL, '[]', 0, '2018-07-04 22:24:47', '2018-07-04 22:24:47', '2038-07-05 03:54:47'),
('1679baa6b3d480ab751a48c3cab266e79ab8b7a2266ab7a2ab3fbe64b46958cbfbe3cadf28fd26e9', 1, 2, NULL, '[]', 0, '2018-07-04 22:25:56', '2018-07-04 22:25:56', '2038-07-05 03:55:56'),
('b69e8a3afe76edbf2b3da8dd2272e6f6b5466391aae731763878c54883f645c2c053988f430f5d9c', 1, 2, NULL, '[]', 0, '2018-07-04 22:28:08', '2018-07-04 22:28:08', '2038-07-05 03:58:08'),
('a23b78de5be11695722f189eabf76c0eabf8dd4e74aeda3aeb18f8e56e28e7973a39bc5735787d66', 15, 2, NULL, '[]', 0, '2018-07-04 23:12:45', '2018-07-04 23:12:45', '2038-07-05 04:42:45'),
('fdc961c38ac56591b99f3d1fb5add51e0d52777a5fbc57b4801645933e8959d39a7883ef50ae9394', 1, 2, NULL, '[]', 0, '2018-07-04 23:15:00', '2018-07-04 23:15:00', '2038-07-05 04:45:00'),
('81c4e0d3c86fec537f7002c7000641ce8c93fb72c0f7e7d6637961376ad2283e421cce45dc02ba04', 1, 2, NULL, '[]', 0, '2018-07-04 23:19:39', '2018-07-04 23:19:39', '2038-07-05 04:49:39'),
('67ce2de3f011fc3ac731f01d7bf0365567be8c81f9da31e3c5d81a0d27f79c31867ccb1db53c2c0c', 15, 2, NULL, '[]', 0, '2018-07-04 23:20:14', '2018-07-04 23:20:14', '2038-07-05 04:50:14'),
('20e5ff66b26e6bf1ac363f5447b7edcd2845f923bebd10384c500eca98611cb397e146e1409eae95', 1, 2, NULL, '[]', 0, '2018-07-04 23:20:42', '2018-07-04 23:20:42', '2038-07-05 04:50:42'),
('60bbd455b7680b97de34c832d6f2b2bbcd2ab0f0e9e8646b9edfbce0d5e45c7148935db71d309761', 1, 2, NULL, '[]', 0, '2018-07-04 23:25:22', '2018-07-04 23:25:22', '2038-07-05 04:55:22'),
('f8ef206e4801019e711f780608db53cb89425ed89475a0cd3ea0c14d70c218d1eec86e0f7a10d35a', 15, 2, NULL, '[]', 0, '2018-07-04 23:25:39', '2018-07-04 23:25:39', '2038-07-05 04:55:39'),
('5180b3cbb6b77366c109a8b2a160ff630c17d7460e3e001c7c21beaee2b57102433e8be976fd3515', 1, 2, NULL, '[]', 0, '2018-07-04 23:27:14', '2018-07-04 23:27:14', '2038-07-05 04:57:14'),
('b74e70b9c99b774bb69b2a6df120149b1d005e7feaa918693733fbaf5c8b034f15dfd18a3c158330', 15, 2, NULL, '[]', 0, '2018-07-04 23:27:43', '2018-07-04 23:27:43', '2038-07-05 04:57:42'),
('b543a02d5507fca3b75047c03ca573fb14ff86672e7c581d244f266707f78ee492f9ffb668c8c3cc', 1, 2, NULL, '[]', 0, '2018-07-04 23:39:48', '2018-07-04 23:39:48', '2038-07-05 05:09:48'),
('e1de8e56de450ca05b105abced01b8e5c13cc48713c0b02eb3086db9000c469401c1394df8d09c69', 15, 2, NULL, '[]', 0, '2018-07-04 23:41:10', '2018-07-04 23:41:10', '2038-07-05 05:11:10'),
('bc8f11fdf65d90f620361fdace08073be8c1ba3a42b9d1b14611100419ff8e73d02fd0d3b642d368', 1, 2, NULL, '[]', 0, '2018-07-04 23:41:38', '2018-07-04 23:41:38', '2038-07-05 05:11:38'),
('4d17516445e758bf3921dc102a5f7600f9b9fbc4eb45e2b9b5216c50adcf010d06f031179604c852', 15, 2, NULL, '[]', 0, '2018-07-04 23:41:51', '2018-07-04 23:41:51', '2038-07-05 05:11:51'),
('b4e1b72cc1e239d3885475bea94504b89b4e278e918d21baf990025f5c99e08e1d86b86c6f870703', 1, 2, NULL, '[]', 0, '2018-07-04 23:43:25', '2018-07-04 23:43:25', '2038-07-05 05:13:25'),
('da00f94f9ed96e6937bbe787a195b109ff6afe82a72aa30abd9e41c1a0e6940015d530242aa95383', 15, 2, NULL, '[]', 0, '2018-07-04 23:44:06', '2018-07-04 23:44:06', '2038-07-05 05:14:06'),
('547990883335fae913e8041f173a05adb6af1df42b9559dcec0d5315790dd7320a65af7f5fa67bc7', 1, 2, NULL, '[]', 0, '2018-07-04 23:44:17', '2018-07-04 23:44:17', '2038-07-05 05:14:17'),
('ecd9e02f25ecae99914916556b30b4c5a0ebbdca8674762cd087ac11bb773e2be8060f174e6a1e67', 15, 2, NULL, '[]', 0, '2018-07-04 23:44:29', '2018-07-04 23:44:29', '2038-07-05 05:14:29'),
('10d0fe8040b48d132219b6cc43374ce63819a24941ea44c884b7c32313ad368c56a1c6745a3e151c', 1, 2, NULL, '[]', 0, '2018-07-04 23:44:43', '2018-07-04 23:44:43', '2038-07-05 05:14:43'),
('1af146ec34825ed7febd3a97c88b632c8df0f63d9e486f701cba062a8acfd3af74d2b48415c3b47a', 15, 2, NULL, '[]', 0, '2018-07-04 23:55:28', '2018-07-04 23:55:28', '2038-07-05 05:25:28'),
('5cfe674f86b7cb5bd2a324663f34e1392cc229614fc6cfb07a299bce8e89fda9bda75708383bd3e8', 1, 2, NULL, '[]', 0, '2018-07-04 23:55:43', '2018-07-04 23:55:43', '2038-07-05 05:25:42'),
('485d7fb45fed82c089959a163a47268b27225dea663692cef39354a6fcb180d1299beff64dce5ca1', 15, 2, NULL, '[]', 0, '2018-07-05 00:29:56', '2018-07-05 00:29:56', '2038-07-05 05:59:56'),
('3047d01f491a0a1d48a9f9bbad86299b26ad6f81b3aa6582d5bdd3a759c3687244dff3ed0a0c06d2', 1, 2, NULL, '[]', 0, '2018-07-05 00:30:08', '2018-07-05 00:30:08', '2038-07-05 06:00:08'),
('4935c63ea569323fe513e24b5da802aaaf8238dfbb98838092d50f6a3627b1a4a7b2c6ffc6e1a090', 1, 2, NULL, '[]', 0, '2018-07-05 02:44:43', '2018-07-05 02:44:43', '2038-07-05 08:14:42'),
('3127190c39dbaa7b998a9947b2e37d93b247b152c2b0f728ab996816ee82e7a14c51c1b4216da502', 1, 2, NULL, '[]', 0, '2018-07-05 05:22:42', '2018-07-05 05:22:42', '2038-07-05 10:52:42'),
('58c5d0a0bb6f963c1c437bfda45985d4051e69f00b79eba5a6d443706f67db3a29f565ac815992d9', 1, 2, NULL, '[]', 0, '2018-07-05 05:29:27', '2018-07-05 05:29:27', '2038-07-05 10:59:27'),
('7294e0b29678c9e47ef5623d2041eb396a8543a5bcaab0fa6eae012b4d7053ded2ad982629f3d491', 1, 2, NULL, '[]', 0, '2018-07-05 05:36:10', '2018-07-05 05:36:10', '2038-07-05 11:06:10'),
('0f1088b31b50ae846ea4747b42169b7dedbb37acb42a18330aa48baf781495372765b117272e7eb5', 15, 2, NULL, '[]', 0, '2018-07-05 06:01:11', '2018-07-05 06:01:11', '2038-07-05 11:31:11'),
('470ce83978e538b5a95ec6475fe246bad17c9194e4a853b995d60ba3cdcb26b638d5c4ed00e2a5bb', 1, 2, NULL, '[]', 0, '2018-07-05 06:01:44', '2018-07-05 06:01:44', '2038-07-05 11:31:44'),
('4d9942c5727945e91bd3c6997c2b72348966c05e3f2303d2727804f9d093d00eb2fb4844a13fad51', 15, 2, NULL, '[]', 0, '2018-07-05 22:06:22', '2018-07-05 22:06:22', '2038-07-06 03:36:21'),
('5c2dbe4e45bbfed614f19665a8b6f689d2949087d18c5fe6e1e52a662b5259320bbda19e207e2d1e', 1, 2, NULL, '[]', 0, '2018-07-05 22:08:54', '2018-07-05 22:08:54', '2038-07-06 03:38:54'),
('b3d6b03dfb2996f25b36e781afba535b58a2baa7ff01f3d2cb0df56e4110a53911791dbab835d18d', 1, 2, NULL, '[]', 0, '2018-07-06 04:42:34', '2018-07-06 04:42:34', '2038-07-06 10:12:34'),
('e65c40b66ddf5fae9f5096c5e35a7c4be0a60ed409408733830cc553cd16ae92c8231e166669bcf4', 15, 2, NULL, '[]', 0, '2018-07-06 06:02:07', '2018-07-06 06:02:07', '2038-07-06 11:32:07'),
('89b0c737aba0dffce35b5b792a39a555c8a4ed419d9fd9f76b911b872fec5840506a4ace90377648', 1, 2, NULL, '[]', 0, '2018-07-06 06:03:13', '2018-07-06 06:03:13', '2038-07-06 11:33:13'),
('3458fa066ae4cb34be931e2f5c7e48a92e88f4d075649285522a97bbfae0f54be8f64903ef5aab23', 1, 2, NULL, '[]', 0, '2018-07-08 22:14:57', '2018-07-08 22:14:57', '2038-07-09 03:44:57'),
('2d4ed04e570cd45b63d729e32be8aa85b6cfd5f729a94aeee58fbcb685c25584a0012ac48b0e57ec', 15, 2, NULL, '[]', 0, '2018-07-08 23:57:10', '2018-07-08 23:57:10', '2038-07-09 05:27:10'),
('3901c4fcdd62234f7bb27067fe970b6d650299e3c986e80441849d07f572d04f9933edc3571b0e2a', 1, 2, NULL, '[]', 0, '2018-07-08 23:57:34', '2018-07-08 23:57:34', '2038-07-09 05:27:34'),
('43898cbdcd31886a785f730007c77e195fdcd57733e508b529dbd8b734e553a9d30ee602b02f813f', 15, 2, NULL, '[]', 0, '2018-07-09 00:01:28', '2018-07-09 00:01:28', '2038-07-09 05:31:28'),
('587011ad11e3a24afdb2f05cb7073d4c89946975221b5fdaeba68395ea6015f272a0442c10c59607', 1, 2, NULL, '[]', 0, '2018-07-09 00:02:49', '2018-07-09 00:02:49', '2038-07-09 05:32:49'),
('bf81299e86a2731e25401726f3ff4de413b058d694eb0f2ede8b8df7c00bc7efa0a978d0434e819e', 1, 2, NULL, '[]', 0, '2018-07-09 00:46:52', '2018-07-09 00:46:52', '2038-07-09 06:16:52'),
('3642f1792e7c4f0331f623c1185d462bdc5bffb1b67c605de44c59645ea65250f7c080c51ab5560f', 1, 2, NULL, '[]', 0, '2018-07-10 02:29:51', '2018-07-10 02:29:51', '2038-07-10 07:59:50'),
('c7bd9433ee6e6ad02342b6228264ee873b9f1fd09f612f867981582b7792303fcf3e63b5b170219d', 15, 2, NULL, '[]', 0, '2018-07-10 02:42:23', '2018-07-10 02:42:23', '2038-07-10 08:12:23'),
('542ff057c17af2e7433fe1473893aed728d3a31d598ecb202be9af9624157111dcb9b25399feb76c', 1, 2, NULL, '[]', 0, '2018-07-10 02:42:41', '2018-07-10 02:42:41', '2038-07-10 08:12:41'),
('d383fa503f21c93f9581eb9ec550918910b8cd8310f8728032e6e8d9f7d6181aa4678e3f2b1a90e2', 15, 2, NULL, '[]', 0, '2018-07-11 05:54:07', '2018-07-11 05:54:07', '2038-07-11 11:24:06'),
('47df956431b4a0ba5bf535de1df8e4e02e40eeb3a7c99f68d1a772fef22314485cefb1f62440affb', 1, 2, NULL, '[]', 0, '2018-07-11 05:54:36', '2018-07-11 05:54:36', '2038-07-11 11:24:36'),
('9e592c56e3dc3475c2b2ce93903b8deddcf07c39d83e4e3b3ded3bed0cb8a4e56576dbcc0c99b8f9', 1, 2, NULL, '[]', 0, '2018-07-16 23:08:10', '2018-07-16 23:08:10', '2038-07-17 04:38:10'),
('19f372acd055190ad2f4e729f37a002023b761631aa626d930bb0294f746aef214b02ca2ba04ddd4', 1, 2, NULL, '[]', 0, '2018-07-17 06:43:12', '2018-07-17 06:43:12', '2038-07-17 12:13:09'),
('fc7e929ab4f57a5f7d2160f8636cbebe935c49c2f55206f2bdbc53318e10228a1c85fd05b266066b', 1, 2, NULL, '[]', 0, '2018-07-17 06:43:12', '2018-07-17 06:43:12', '2038-07-17 12:13:10'),
('01c6051d037a65e7676078bf902ac3dd463f3bf28be43d098ccbb636d688f8a49c989c2c5e9709f0', 1, 2, NULL, '[]', 0, '2018-07-17 07:36:38', '2018-07-17 07:36:38', '2038-07-17 13:06:38'),
('0cafaaf74d78356fe92274332a1f5475177c358d7ea2a3186cc46796c2412bb6f2291ea7c0a39657', 1, 2, NULL, '[]', 0, '2018-07-17 08:58:24', '2018-07-17 08:58:24', '2038-07-17 14:28:24'),
('7396a37f1d9999bdd8da40141f353c1266a602c9ab2f40a9cb7ce561fb62604d1b76a55fdbe72862', 15, 2, NULL, '[]', 0, '2018-07-17 09:55:46', '2018-07-17 09:55:46', '2038-07-17 15:25:46'),
('94b77f5438f91b40d2b150d00a5aca8d314a74ea54dc43aad72e091a09d1a4649dc809780a9c99d5', 1, 2, NULL, '[]', 0, '2018-07-17 09:56:24', '2018-07-17 09:56:24', '2038-07-17 15:26:24'),
('a6386098e3f1a4beba4aacfb102390d88c2ae28a8e936c382fec3dc4b7325803d7170744db04eb74', 15, 2, NULL, '[]', 0, '2018-07-19 09:12:12', '2018-07-19 09:12:12', '2038-07-19 14:42:12'),
('424aaafaa2ef6b56cae1115b709bf0d313705fadcd5b141e0241898603cb52ebf2d3bc45902337db', 1, 2, NULL, '[]', 0, '2018-07-19 21:59:04', '2018-07-19 21:59:04', '2038-07-20 03:29:04'),
('b9d682ea291309c5192ef280484479fcda86a5fbc4c25d66467fc3392cefda7381acd7062f1609fa', 1, 2, NULL, '[]', 0, '2018-08-14 05:08:03', '2018-08-14 05:08:03', '2038-08-14 10:38:03'),
('b2ac55d2f0c963b8b950155a416274ee6eabda73786357fd099e4e2234365f4daea1ef14a5cfa994', 1, 2, NULL, '[]', 0, '2018-08-14 09:58:45', '2018-08-14 09:58:45', '2038-08-14 15:28:45'),
('9a001479047aa83d58334d9fe479748198413ffbf86d10f252e1fc3edf3b106a371e8c650147db5e', 1, 2, NULL, '[]', 0, '2018-08-14 10:16:27', '2018-08-14 10:16:27', '2038-08-14 15:46:27'),
('92b221af431d3bf807ab945da8aae1ccfdd3b8d425d43745daf51d3d83acb568cfd5b93226259c10', 1, 2, NULL, '[]', 0, '2018-08-15 02:50:15', '2018-08-15 02:50:15', '2038-08-15 08:20:14'),
('9349916bae91ba8d9d08add3575cd8f7f77cd0c258afc5b7f10aa699d612846b0c05c776e55bebce', 1, 2, NULL, '[]', 0, '2018-08-15 04:10:25', '2018-08-15 04:10:25', '2038-08-15 09:40:25'),
('8a8cb869fb58c8723dafdd5c52443e8c646e8e65d4025084a35f8a0bdff74e28af0696db1744e9f4', 1, 2, NULL, '[]', 0, '2018-08-15 11:58:50', '2018-08-15 11:58:50', '2038-08-15 17:28:49'),
('1d639d49df2d63a355a8cb10ac70b99712f99a6de111a42c49e0fecc44adf4b82c6f7317c81bb175', 1, 2, NULL, '[]', 0, '2018-08-15 20:34:19', '2018-08-15 20:34:19', '2038-08-16 02:04:18'),
('487724ccbcc95e2d67f77673cd3194a4b6bf60fc15ad2bffcd9276eb2997a60148c8c05fef3faf89', 1, 6, NULL, '[]', 0, '2018-08-15 22:11:39', '2018-08-15 22:11:39', '2038-08-16 03:41:39'),
('1f82d9155f5cc14b0e886857467baa3a7d87df003c46926f02c4c998601a50cd1e368143aba45cb2', 1, 2, NULL, '[]', 0, '2018-08-15 22:12:27', '2018-08-15 22:12:27', '2038-08-16 03:42:26'),
('a83e057496e1e8151b1d156c68867e6060b11749c7ffac180c6f8ab4be91ee8012bf7baec03b092f', 1, 2, NULL, '[]', 0, '2018-08-15 22:14:11', '2018-08-15 22:14:11', '2038-08-16 03:44:11'),
('fa207570d9a292ff409feef0e90a61c8f4584adfa77991d64bd997b77a89c45852494f38dc24f4db', 1, 2, NULL, '[]', 0, '2018-08-15 22:14:20', '2018-08-15 22:14:20', '2038-08-16 03:44:20'),
('b73831a5f586ce3fbb12e2e98b58ba2db1d22dd7d96fc524a08bd8d6f9d42e57d2c306c7f2696b5b', 1, 2, NULL, '[]', 0, '2018-08-15 22:15:13', '2018-08-15 22:15:13', '2038-08-16 03:45:12'),
('1df2353a1c2d30e480da2c38611bfb843bc67cb798530312d88ff1266a7e84bfc0f920a20d8ef73c', 1, 2, NULL, '[]', 0, '2018-08-16 01:46:07', '2018-08-16 01:46:07', '2038-08-16 07:16:07'),
('78cf8c4200dab898584e63cda2485fbf7986a16586ac72129e0e3e67903ede42bade82b678523d11', 1, 2, NULL, '[]', 0, '2018-08-18 01:52:08', '2018-08-18 01:52:08', '2038-08-18 07:22:07'),
('c413495759ff3119491bd0a596b5121de689dc81b9e54ca5a6a9c5217c85cbf8f7a9cc4837797fb5', 1, 2, NULL, '[]', 0, '2018-08-18 21:00:23', '2018-08-18 21:00:23', '2038-08-19 02:30:23'),
('9c0cb95336b46229574cb4f4bba74e2230dfcd1fb1c7e69a15deec79f3e395d5dd5cc45a256481c6', 1, 2, NULL, '[]', 0, '2018-08-19 15:34:31', '2018-08-19 15:34:31', '2038-08-19 21:04:29'),
('f51e7f9d4ba763aaa03000e6145dfb230aaf2c086a72a52911f1901c69f29082de183ea2d64a7c2a', 16, 2, NULL, '[]', 0, '2018-08-19 16:37:52', '2018-08-19 16:37:52', '2038-08-19 22:07:52'),
('344531e2fad96538addb646638fc786e12f174ebdb7b504521bd07864a1b2debae61617a5f14ab24', 1, 2, NULL, '[]', 0, '2018-08-19 16:38:13', '2018-08-19 16:38:13', '2038-08-19 22:08:13'),
('13029d484828a318b3261879782bf2dea5cd740be0df341fccc34774a626ca2fdcecb8f58cfc299c', 16, 2, NULL, '[]', 0, '2018-08-19 16:39:08', '2018-08-19 16:39:08', '2038-08-19 22:09:08'),
('b4be4bef8b81d7e7f349ac30e83c295b166534a876fa2ca7da20b0a06dcbaf1c779ea110dd5ce4d9', 1, 2, NULL, '[]', 0, '2018-08-19 16:41:14', '2018-08-19 16:41:14', '2038-08-19 22:11:14'),
('a9a1e2c8a33377a9b88fe997dd632893e9119955771c0b7521d8b6f0a71061244b088dff929e4983', 18, 2, NULL, '[]', 0, '2018-08-19 16:49:19', '2018-08-19 16:49:19', '2038-08-19 22:19:19'),
('27c58694ba0817a372131a6e3ed3aa28a293b6fd51ce1d36b66c8c70ebe384e84b637b5ac3dd0d9c', 1, 2, NULL, '[]', 0, '2018-08-19 16:49:33', '2018-08-19 16:49:33', '2038-08-19 22:19:33'),
('7cd5da9d35e244d88e71b667fab712c5514940da74a2a1be710ca4cdc7c1b48a223dd88106d2fab0', 36, 2, NULL, '[]', 0, '2018-08-21 00:20:54', '2018-08-21 00:20:54', '2038-08-21 05:50:54'),
('1d8777e6afa82e2602fbe832e9799190c83257a6b77a93aec1bf4859ae19447567267ad85e56e10c', 1, 2, NULL, '[]', 0, '2018-08-21 00:21:03', '2018-08-21 00:21:03', '2038-08-21 05:51:03'),
('93f8da5e220144a96c705010431861dbe73d77008ed75aec026000f8f797789c9fd05a009cdc0be0', 1, 2, NULL, '[]', 0, '2018-08-21 05:51:13', '2018-08-21 05:51:13', '2038-08-21 11:21:12'),
('937dddd8d6b60f60a29497ac8f405942d9e09f8e04a22021685a8850f50d6d03f66f74e99dd598f0', 1, 2, NULL, '[]', 0, '2018-08-21 05:54:51', '2018-08-21 05:54:51', '2038-08-21 11:24:51'),
('232b031166447c743076794248a61d354cd63886ff2833ba71b6e92dd7b22ee09173bc9386573313', 47, 2, NULL, '[]', 0, '2018-08-21 22:48:24', '2018-08-21 22:48:24', '2038-08-22 04:18:24'),
('6b6d2ca91f1c0a0ad4b9148ca8a6c84b647dc225ce9b1cd4da9b13bc9c9fe837db16ea12b1ab62c5', 1, 2, NULL, '[]', 0, '2018-08-21 22:48:46', '2018-08-21 22:48:46', '2038-08-22 04:18:46'),
('43291f683517bdfce6978afb2d00c7c30d534ab4df64db1132dc4a6dafe16afb3327770ad72eb77c', 1, 2, NULL, '[]', 0, '2018-08-21 22:50:16', '2018-08-21 22:50:16', '2038-08-22 04:20:16'),
('eecd3885ce2df64b902227a004aaa9bc43d8dd72527d47719e86b643ae1ce34d3372cd578821fc02', 1, 2, NULL, '[]', 0, '2018-08-21 22:58:40', '2018-08-21 22:58:40', '2038-08-22 04:28:40'),
('78d254bcf6d9e75bcc8007ec6b860afa2c9f150b1828b25cae66e4f519a2eee1d1a9d5eab3968fbe', 47, 2, NULL, '[]', 0, '2018-08-21 23:14:09', '2018-08-21 23:14:09', '2038-08-22 04:44:09'),
('6eaf007b6147a1b262ca00e5bbec531d8756fb0355012015b37e4e50515e4fe955b4b06867d41a45', 1, 2, NULL, '[]', 0, '2018-08-21 23:14:22', '2018-08-21 23:14:22', '2038-08-22 04:44:22'),
('9dc0a3e21053bf10033d9b806e9ba1aa5d9b94180b13c3fb4b4be7cf3ef1dbb4ae276e2c8587df15', 50, 2, NULL, '[]', 0, '2018-08-21 23:30:47', '2018-08-21 23:30:47', '2038-08-22 05:00:46'),
('10f9265482e1259a996ac7a12ce9aecf1bdc2e558ddce8b25ce7551d2599544739c4fe05db5768f5', 48, 2, NULL, '[]', 0, '2018-08-21 23:35:08', '2018-08-21 23:35:08', '2038-08-22 05:05:08'),
('9d60a112c7361cff07bf51791715c7ea0c00a7f542ecde9b0274af1ad58131cef6b3212f5de99ae5', 1, 2, NULL, '[]', 0, '2018-08-21 23:43:43', '2018-08-21 23:43:43', '2038-08-22 05:13:42'),
('23fbd1384eaa51ea44ac3ce6a27173def67ac2755f89b96a003d3fa2742bbf8a260e8833adbbf1fd', 48, 2, NULL, '[]', 0, '2018-08-22 01:51:31', '2018-08-22 01:51:31', '2038-08-22 07:21:30'),
('a51f989c26483181e55783a83ffba3ebe79226dffe3e9cb8611e24017edeaf0de88cfc5e4abbda5a', 1, 2, NULL, '[]', 0, '2018-08-22 01:51:42', '2018-08-22 01:51:42', '2038-08-22 07:21:42'),
('d210ca7ac0853289a17997a1929d74f88d0147470bdd301d93fe9ec771cb0843e4c0767bc9d21c68', 1, 2, NULL, '[]', 0, '2018-08-23 21:59:38', '2018-08-23 21:59:38', '2038-08-24 03:29:37'),
('139f6244308fa297ab542c5a1a7b4477427a5f1438981c6c3ebd47ba5359b28fc90da7bc259d2070', 1, 2, NULL, '[]', 0, '2018-08-26 23:03:44', '2018-08-26 23:03:44', '2038-08-27 04:33:44'),
('634a6f8d898728803ceb1a582bab29a9dd8c0667293a786b15fcf99fde71dc72aea74930c8f7f73c', 1, 2, NULL, '[]', 0, '2018-08-30 02:10:40', '2018-08-30 02:10:40', '2038-08-30 07:40:40'),
('8f82e091984a8255ec1c6e2f51c01a1d7a830363a63b575c1919ab8068d530ed5afa12f1414315e2', 1, 2, NULL, '[]', 0, '2018-08-31 01:24:22', '2018-08-31 01:24:22', '2038-08-31 06:54:21'),
('e0fdefeae47f80c391cacfdf8e1c7e32dd21eb3565aa9f204561941f76b7e77f2c4748931189c0f2', 1, 2, NULL, '[]', 0, '2018-08-31 01:26:35', '2018-08-31 01:26:35', '2038-08-31 06:56:34'),
('c9c754b4536cca00c4620c03d3f791bfc73a4a8cf346a8e32398b17f33e56352f11e3028a4e0441b', 1, 2, NULL, '[]', 0, '2018-08-31 01:41:05', '2018-08-31 01:41:05', '2038-08-31 07:11:05'),
('8d2eecf18fc72accc3e1ff47d15f1eff57e8b3b464bf97f294ac5f3571a89555538b85497a1d11c1', 1, 2, NULL, '[]', 0, '2018-08-31 04:12:49', '2018-08-31 04:12:49', '2038-08-31 09:42:48'),
('181e2c64ed929f7d3b9a05ec039f5fe736770222e2e7f354823d3985b94c852c60466e5ed1f16900', 1, 2, NULL, '[]', 0, '2018-09-02 23:19:13', '2018-09-02 23:19:13', '2038-09-03 04:49:12'),
('8c15639ea708144ee53bc2384c52d7f0fee70926f014f9f3171d5c209cddace68e6a60cfcae8f19e', 1, 2, NULL, '[]', 0, '2018-09-03 22:32:55', '2018-09-03 22:32:55', '2038-09-04 04:02:54'),
('4c8ff444119fa8d1d0ddbc11d170367237adcd9b0634e3f1cebda53f584b1b87ea45343d6ba734a8', 1, 2, NULL, '[]', 0, '2018-09-05 05:35:09', '2018-09-05 05:35:09', '2038-09-05 11:05:08'),
('d6661a928949efc5eaca40aedb1923477bd2f7e42d1cf7c30d56c44d953089fce201f59c52f93757', 1, 2, NULL, '[]', 0, '2018-09-08 03:56:49', '2018-09-08 03:56:49', '2038-09-08 09:26:48'),
('d5c4d25fa08ce1e4785290b636f9df5b3f29d3a74f84a904d7f2c2abca6a1f609a3c0a1f68e7faf9', 1, 2, NULL, '[]', 0, '2018-09-09 22:07:05', '2018-09-09 22:07:05', '2038-09-10 03:37:05'),
('7d7f8c77011e4c9edf456a2d91d780264c7f78990f01f79607eb95a2af04317e1253f6ea792359cb', 1, 2, NULL, '[]', 0, '2018-09-09 23:33:20', '2018-09-09 23:33:20', '2038-09-10 05:03:20'),
('11b205a35fcb2c09301efbb98513201aea0e6c3f15e78633cebb58bd1b414b7af24db4a8544b919d', 49, 2, NULL, '[]', 0, '2018-09-12 17:35:05', '2018-09-12 17:35:05', '2038-09-12 23:05:04'),
('eee4c00215c03438a9e599550b87b33af3b873712031961be59c998f0983975ca130d3a0c127cc72', 1, 2, NULL, '[]', 0, '2018-09-13 19:57:37', '2018-09-13 19:57:37', '2038-09-14 01:27:36'),
('1b8b3f2415ff98376c510d9a81ecdb0721a6b7d30a55649f07615f2b94e23cb1872307fe034d7a0b', 1, 2, NULL, '[]', 0, '2018-09-14 04:09:00', '2018-09-14 04:09:00', '2038-09-14 09:38:59'),
('5fc05544845d29e6151f561a5b9d5b5649141092d70913167b184f43e6df09a129cda8739fe4e5e9', 1, 2, NULL, '[]', 0, '2018-09-17 00:51:46', '2018-09-17 00:51:46', '2038-09-17 06:21:46'),
('5de20b4fd25fead996eaeb510c4cc68f2c0e8c78c2656b7833a239ebd536acbce5ec90c16a9f305f', 1, 2, NULL, '[]', 0, '2018-09-17 22:41:11', '2018-09-17 22:41:11', '2038-09-18 04:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'P4ZnQwMIimSiPaptYOXj5pWQB9xP9AUVHHjw5B4k', 'http://192.168.43.166', 1, 0, 0, '2017-12-18 02:20:09', '2017-12-18 02:20:09'),
(2, NULL, 'Laravel Password Grant Client', 'g1oyNBAuJajkVXUEom11TtrwmPohrOrkGtPLjTIO', 'http://192.168.43.166', 0, 1, 0, '2017-12-18 02:20:09', '2017-12-18 02:20:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-12-18 02:20:09', '2017-12-18 02:20:09'),
(2, 3, '2018-06-28 01:53:56', '2018-06-28 01:53:56'),
(3, 5, '2018-08-15 22:09:49', '2018-08-15 22:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('19c64defc57cb371d242f5829f388337248da1f88e802d8f6987e4e9779b8d7e6f305e380d763cd6', 'f82edf8e34de0072f84e550f241ff34e388e76691971aed551f423362abfe4b57ede5dacaa583b12', 0, '2037-12-26 09:38:56'),
('ff2bb738faeb9db0748da93bd36e343a2860c98597e6c714bd60f7c7aa4a3e280569faed7cc2e6ff', 'e45f914bf9dd077af370776716980232581f7fff001964c2f01edaca677dee8a450717a837132879', 0, '2037-12-26 09:39:36'),
('fa84409f96489bb959d92f15765dd34b10bbab32adc78cd9589953120356c98ea73ee9a190214693', 'd485a3efba3a5e2b4446614a3a7972d196826f5774b1f77f3aa53cbd4fc62e0438b369c0f5acc759', 0, '2038-06-28 04:25:05'),
('4089e46afac343699d9efbdd47873ce3dd0af0e4471e6eb4d25d18ebd1eb3e96f3376332011df560', '040d4d8d5eaf0f889ba31d12a3bcd6e399b1e2cf2c5806caac44540cc9c33de8828bac16c39a83d0', 0, '2038-06-28 04:27:39'),
('b01fe15eaa86f6a1341b22a00d27f0cedc48feaa1ba14a42fe683698d8d0f9e0ba4a11d510acf8a0', 'eb225dc769d1eb3ca87a11b79f7858560670bf376318a110ac1128ead2d7da521f89051613ea4b94', 0, '2038-06-28 07:27:02'),
('94358cf1e8950ec9e0f591fd4e705bc8527b7c62e5fca27f5f6c4acdd2fddd29b8593ff8b335eb0b', '3ff207ce4f3eb720081657b722d83d0fd1a0fbf603ae24a7ae4e052b724ee5c3a495554efd06ff8e', 0, '2038-07-04 12:18:19'),
('b252987d53746d734f91f7e8cb799b249e401b7bef4045d0416d379cee1a5c1cb12833b547f7ab5d', '3c6475c55cb43fc0514e74bb84a3de5cb67161d50eaaaef16bff64936cd5599f831e1e0988affd0c', 0, '2038-07-04 12:22:41'),
('376725e56e7f71fdeb8519845a9d7c00343d3fbf939d96cf26ee497004329618480eeb221ee39089', '1ccc17a8888df505a6abf47878f05c04a55596ce30bb00d1ebd775dbb0ad908a12733667386d6873', 0, '2038-07-04 12:23:24'),
('60b44ed098f258ff09f26ed97284903d114be10c4797b3bc5f7288a8d83a6d0f468ef546c36f2cf1', '3f319f7d3365c091cdde06d96e69234427c88ad28b954a99399b7dc8be62f7df56eb0e6406835b07', 0, '2038-07-04 12:23:41'),
('9c81624ec3678485404eb6fafce631f497922369b192b397dda15fc3212134d886c2ee6bf5260821', '2340d306a2afa31e105f36e6c20d1b04f9e2922b5a9b1a3577fabb3a3d7da9b07d841631090f95d7', 0, '2038-07-04 12:24:22'),
('3c7f927aa7c8515933b027517c0d427808771dc1c11c2cb607b78e9b16918c36584d7eba6fb01db1', '95528d25b6cf2bb9faf08dad7de2a6fe57042febc9f778e8104f540b1b225bd6867b8a8d14fec160', 0, '2038-07-04 12:26:30'),
('07b76deafc5d8f9b4f5b8911a55a26b3a6413670ff8e7b104afa48d548d73c538e2208f3c5dc19c4', '3a1e78782539adb47c9b82405c23530418fcee7f53cf19e74bdbc6bfe2d2af5529be8afb7f37c436', 0, '2038-07-04 12:29:27'),
('3472087ab986904e3f7f24d8541dc9040a6e6ad6a55ad2e912e3a7479ee74d0ee12cb9913bfd30c5', '1ead6a1109fcd81991a7bcf0cea74cb2a4cba60471b58e59ad887f6ea2472b1ffcf5798b321b54d6', 0, '2038-07-04 12:31:06'),
('7b6cb5eec75846bbece6245fc41704848f654424f33ce391f66ac87cb4f54f6bcfdda1db74c2c203', '28929042c308592a8701eb55c63078c15fa9a63fb46afb8e78ff0518c9d9f7932cd6c56e27a9ecae', 0, '2038-07-04 12:31:34'),
('4a4e003b984b41f24073d296c99c61b625fe265dc081b63b66f531c2f6558fbfa5ec0980c74e451f', '1b75bd68822e90712260d0527f8ec4e7be55de2bb2ab0fe4e937ec0958b2a4020f853ad85ddf46d7', 0, '2038-07-04 12:31:39'),
('5f962be31c5c5303c0deef242250fdae1ade26c686524b20629aa819acc6032913197897daf0992a', '589614b5b7a4b7f2d0e73f079de224ee1653cfd3d06ab9ee8025f351acffd3741dbfb7ac874f4b4e', 0, '2038-07-04 12:38:57'),
('f2e084e7b1f9f127f0e2c4b52b8233ec7c2cd6375764accf647609c14925a8ec7aef2431f4f7736f', '933f924c52df080cf8f40f7e17e4c2997b9f550e68d20d36fa2df35e3e01fa13a4856925070cc449', 0, '2038-07-04 12:39:21'),
('f57678110fe67ee979a421a4da055dd96c9637f14169dcdad699d0aa705785e3585e690a486aa319', '20c49f190218744f3439f8da46f6bed0ed70d112ad1164d63c62e806f6c9f4d814e221c5cb6eb764', 0, '2038-07-04 12:59:47'),
('43e3e165d93a012e32e6330b237c79db1b9635afcf4a440ab713bd6137c8b58c124634edf088778a', '9f553ca8d75dd2584549bb983d9d1bc4f5638442f219f33e928333ed71b21e70a6a200624ad72ca0', 0, '2038-07-04 13:06:49'),
('b4761da0af1c86439f587e8b2a5c34ac1307ee133daa28c5b2b9190ac13304213f9ab4330a928aac', '0460e0a15ba46e48a9379cbb95f7fdfafcbf300b9aa10689b857c456c61d99237ff77fe9c7052129', 0, '2038-07-04 13:06:54'),
('5e40b65badea7af70574cbf117dd6326f7fc71a9700d3dad17b116d206e53e46971721c15e5a65aa', '3e01e87aad4042f29aceb07642c12ca96de8823db12272c056a882e21e6a52967a9796d3945445fb', 0, '2038-07-04 13:07:22'),
('39bf917a4c591ac6ef8c79a6029d90b0f3981125e79386c5ea7931acdb3b52880c668c8ba7540248', '7bf7723244cadcc0cd6897cdd5fe1b6f8fe132cee7c7ee148b57a08cc0c0b3b112ab0a2de2abcdd5', 0, '2038-07-04 13:07:38'),
('c3afa84ad14810b4e63553680286829372cf94045727cb8f4ecf83620c0274c70b65fe37c645dc46', '068009ed951071146e7596e48d75476a8d34f9ebc77a8efbc30dcde1f6ef299fa6f17c1d34585a12', 0, '2038-07-05 03:10:46'),
('15615494adfc357559c602fb4f1e1242c2ce8a37fecfbbbd0a6b9dbc5464e776b3d90a0c617f2314', '331365bad5d8b2b005ddf12b3f7b210233408dca960b94601661dd157d0f4ea92fa9342d9198adac', 0, '2038-07-05 03:19:29'),
('164ff6bb4edb7649caffcac917450489477d185da2533d8ba11cc477e9d444384ae27b323984f809', 'e30ad9dee4e783b8f9e8a04f92e342d3f9b4587de7a8c591494c4e611256765a994cae78ae7388c9', 0, '2038-07-05 03:19:42'),
('380a6ba037150bcba738927ca6eeb55bcf7e2ae183fbedacfa5d0f717ffa8202681e43ff7b11c353', 'bc8af7494efa28948c862b60f887f5a9a332cdf29f169da283ae5332c2611f096012d38a52063117', 0, '2038-07-05 03:20:49'),
('ff28a5bd6e94af200114356efdad6ef71769929b6b86b0c08bf7439cf087440793d556ef3d4a741c', '62d92447b1b1cbecea9ec88c7513a307c3a21cb619d28af7306c49de98b04b90acbd6d3ea95829d4', 0, '2038-07-05 03:21:26'),
('83697e01021b0b2d277740d7d9bb368854b56b0a150b9b425cec6d64c3d9c5224526bbb8cdf7dd85', '5b23c6293fa22991ddbfc174595bd66750939d1b42685c62eef0e7523ce57c13c2b76af145b647df', 0, '2038-07-05 03:22:06'),
('a6b8f599ed9ef204318f047598826e737632f3ac1fb42232554bf381cae6dc30be1b39454832a573', 'e27a01fe1b47a071d10fca137830cfe1da242fc64f39241cd9b319b88a8c37b060b7410c6a2b8ec0', 0, '2038-07-05 03:30:07'),
('9a3539b2550db9f18627d455d0ea0fc2bd6af078ba08c4c6caa9c360daada7396e742263ca3151d5', '332237a32d6be3877cea3e507168430aff67fbed3b48dd0519c14aa2533f3c6363d9bba1631355a3', 0, '2038-07-05 03:30:13'),
('ea83ecca064a44f8694d8ab0fb17a29c7abc0cf0f5efca63d1b6319b48105a6a8a3c2b46f2a1a583', '77d32c036d6e3336efee85d479e11f2ee5575d7049db93638d269e61cb9d714918fedd097dfe1e9e', 0, '2038-07-05 03:30:35'),
('dd6381406abca2c4244fc19d3a5ec93a1a0c559511bb84bad11f73e74545fc9293feed70cf7de54d', 'e3b559814aa331f7e10e4a8249ea169cb81b42e35ea4621bbc7b2a96d6b91c110670f1c2256895c2', 0, '2038-07-05 03:30:53'),
('7fdb2315807eb6c0d7346710b6baed039bca9fd2b5c16ce766c0c91a235f72cd1f0bf599a01289a1', '3e5dcc56c14ec49b67928e73a0f647bd5fe4b8656d5790d4c3c693fcee64049d68ff390daf93edbb', 0, '2038-07-05 03:30:57'),
('109553a8add7509177d4c496fb7c79beb39a30950a6e6a24208a64e0630dfaa550175fcee9562259', '598982a5e5a313f6551f7e8f3726c4095cfbc5ec5fdf8086210916eff07f0242307125d52e51c5b1', 0, '2038-07-05 03:44:55'),
('5ab6131eaf8756cf56153960785a03567137b5a51cb711f166a369907385a042a00acbf5ceb47101', '572d96d44d3ec3635c521658fff586fd351b55f783c1c91ab432012c2d5f7dbba4f2d3f5d8dc9863', 0, '2038-07-05 03:46:08'),
('f24b38617c2d99f55370b509979d0f578571dc14023996ed08c467f515620b9984618403762b9133', '9ee48efe2f902ecd19f0f983d65db3f451a0b836761893c4e7ff47c8eebb91d31af074fa633f4e50', 0, '2038-07-05 03:46:20'),
('434605be490854dd078a8b225b80c554a955ac28286bd76ce6fbe8ee000b558bb060893fe001d19f', '40ac5256aae3e27f1b9e1343a49ee9df15c0462b16e2a006ce89a319d9ec25788fa5ad51cc0c6374', 0, '2038-07-05 03:47:08'),
('e8c58c354e442ded2bd163eff7110aa3a9bda4a0d0d8587d52a4c0a26cf4e74f224aef10560eca15', '436f9932dc4fdf793a6f1b68f45eafe9eccb56a1162688f8c38dbd77539ac2dcb3615a5ad260d069', 0, '2038-07-05 03:48:58'),
('7e4638c844934dd8ddd22c545a7c5d3e826905e154b3871d4f5ac9f5d577658cc92951cb354f4d5f', '8456458e349b747d07f47062b7a1425b8ca46fdcbb897abfa08a1b700e01a5cd142c8184510ec223', 0, '2038-07-05 03:54:47'),
('ba609118218d1cb6b68abd238f65afb66af2322c3b6f96fd6813174dfed87bca43b0aff0b7b1d848', '1679baa6b3d480ab751a48c3cab266e79ab8b7a2266ab7a2ab3fbe64b46958cbfbe3cadf28fd26e9', 0, '2038-07-05 03:55:56'),
('48fe870bd2623f81d09301ebc67ef1567e481d62d50cf61c01e4a684d426faf7432be2245c941108', 'b69e8a3afe76edbf2b3da8dd2272e6f6b5466391aae731763878c54883f645c2c053988f430f5d9c', 0, '2038-07-05 03:58:08'),
('209b6d3c8970a3d1d03569192ceffc3ceb7a765796c4e7dbfbd9bdcd18ff5e1c48792a77c5559c0c', 'a23b78de5be11695722f189eabf76c0eabf8dd4e74aeda3aeb18f8e56e28e7973a39bc5735787d66', 0, '2038-07-05 04:42:45'),
('dac93fce88ede26039047adc1e87076b9aaa417880a14aaa03a46a137034b63ceb5438f2ed508c14', 'fdc961c38ac56591b99f3d1fb5add51e0d52777a5fbc57b4801645933e8959d39a7883ef50ae9394', 0, '2038-07-05 04:45:00'),
('f86a28a2af37dfe6f08362c4d2ce5a4ae47e89c26ffbe1d0d11b8501faa13e1ba7a98340ff43ab26', '81c4e0d3c86fec537f7002c7000641ce8c93fb72c0f7e7d6637961376ad2283e421cce45dc02ba04', 0, '2038-07-05 04:49:39'),
('4fedfec6c2d0622afc1f600fc63fab92d17fa2755a40bf2e327df74380ffe35924495a0313e4bf1a', '67ce2de3f011fc3ac731f01d7bf0365567be8c81f9da31e3c5d81a0d27f79c31867ccb1db53c2c0c', 0, '2038-07-05 04:50:14'),
('8466490ad2996d727d5af4f61ff7aa0d2be1c0a134dd090b397fa9729da370a728b44875fa8f1711', '20e5ff66b26e6bf1ac363f5447b7edcd2845f923bebd10384c500eca98611cb397e146e1409eae95', 0, '2038-07-05 04:50:42'),
('bb5fc573f21f713f26d102c202590c984fd69fe0c9dadbef4bf908c6bbe5026588eeaf8bb2ac0aec', '60bbd455b7680b97de34c832d6f2b2bbcd2ab0f0e9e8646b9edfbce0d5e45c7148935db71d309761', 0, '2038-07-05 04:55:22'),
('3cbad4efb71d04dc267756e58a38b8e7b5459275ca4088472bfcc9308cde620c3adccc309423ff60', 'f8ef206e4801019e711f780608db53cb89425ed89475a0cd3ea0c14d70c218d1eec86e0f7a10d35a', 0, '2038-07-05 04:55:39'),
('e6158fa537795034bb4d9fb65987fd927e4232596cd7b59867f8324e3fddbcb9563aaefe7f4a7ea9', '5180b3cbb6b77366c109a8b2a160ff630c17d7460e3e001c7c21beaee2b57102433e8be976fd3515', 0, '2038-07-05 04:57:14'),
('58e38873a41ef4f813737c29356c9bde1302402f2d01b2e5fda11d5e611f9f26594f05f88508d866', 'b74e70b9c99b774bb69b2a6df120149b1d005e7feaa918693733fbaf5c8b034f15dfd18a3c158330', 0, '2038-07-05 04:57:42'),
('7be43ad95738f5a7a213b9b864b1fb9766f68f4c2782a516d35e255a814986c3af2ae9ad5e1e549b', 'b543a02d5507fca3b75047c03ca573fb14ff86672e7c581d244f266707f78ee492f9ffb668c8c3cc', 0, '2038-07-05 05:09:48'),
('b7cb1b38c6b48c12b407c714927f0df490d14ee235f2e64b0c2ffa11006cb5fde3a6e5cdc7faf4bf', 'e1de8e56de450ca05b105abced01b8e5c13cc48713c0b02eb3086db9000c469401c1394df8d09c69', 0, '2038-07-05 05:11:10'),
('9eaebfb6a079a4f6c314edca1ac6c580780fa73d1b8851265d89d27bdfc008a6a62e3eea676c851d', 'bc8f11fdf65d90f620361fdace08073be8c1ba3a42b9d1b14611100419ff8e73d02fd0d3b642d368', 0, '2038-07-05 05:11:38'),
('d81bbbe1a8f0128cf4f1d4e765c451465a418c82e8697dfee44b729a0ea0bc3e33ac9ea77c672876', '4d17516445e758bf3921dc102a5f7600f9b9fbc4eb45e2b9b5216c50adcf010d06f031179604c852', 0, '2038-07-05 05:11:51'),
('8bb0b5fce2a38a577ffc55b720d5cc75683ef62ffecbe5a2859c2874f39a80a78328e7be0fb7554e', 'b4e1b72cc1e239d3885475bea94504b89b4e278e918d21baf990025f5c99e08e1d86b86c6f870703', 0, '2038-07-05 05:13:25'),
('76fc82d6f4604dca68bcd9798574246d1d5910d07f18f4546fc77f8383074164a14a9644eb769bf4', 'da00f94f9ed96e6937bbe787a195b109ff6afe82a72aa30abd9e41c1a0e6940015d530242aa95383', 0, '2038-07-05 05:14:06'),
('b9b1cf97d636e4111970dfb5c5600fb0fa0de923cc131b4e13137896e186916dbc1712552377cfe5', '547990883335fae913e8041f173a05adb6af1df42b9559dcec0d5315790dd7320a65af7f5fa67bc7', 0, '2038-07-05 05:14:17'),
('7745158c59f627a674cbb9e6208fcdfadfb847735fbe26b8a83c7d71c277d4eb331a5d06848a3ed3', 'ecd9e02f25ecae99914916556b30b4c5a0ebbdca8674762cd087ac11bb773e2be8060f174e6a1e67', 0, '2038-07-05 05:14:29'),
('8d28d76c9f5b30df75d501f8ed1ec21c81b02d4e48d0b16f17a93fe3e5941ed2d15badc450c021d6', '10d0fe8040b48d132219b6cc43374ce63819a24941ea44c884b7c32313ad368c56a1c6745a3e151c', 0, '2038-07-05 05:14:43'),
('e842e6488cb5db6bd6ab056e0dfd29c7f71653f314c6e4d87a0c658ce2f960548ea493de39c4aa94', '1af146ec34825ed7febd3a97c88b632c8df0f63d9e486f701cba062a8acfd3af74d2b48415c3b47a', 0, '2038-07-05 05:25:28'),
('82db1fd72b8ddbd23d8a2f3e2adc1fa02eca944bd5e72e76debcf5f91cf944d6fc9091fef58e9158', '5cfe674f86b7cb5bd2a324663f34e1392cc229614fc6cfb07a299bce8e89fda9bda75708383bd3e8', 0, '2038-07-05 05:25:42'),
('ef750ac58b6b1b1e457388de96c25d8a4b1c87ace8338fd51945bf9982beb0d3b1db738ef7394c9c', '485d7fb45fed82c089959a163a47268b27225dea663692cef39354a6fcb180d1299beff64dce5ca1', 0, '2038-07-05 05:59:56'),
('a1e249bec4896da1327c9541b09aa034793610b30ec6972de34a3a963d19884b6d4418a8aa645791', '3047d01f491a0a1d48a9f9bbad86299b26ad6f81b3aa6582d5bdd3a759c3687244dff3ed0a0c06d2', 0, '2038-07-05 06:00:08'),
('fea5c963873e33d561a1f5c6ec45e9b28701e0931e12a839eb1392284f77777c2b00fd852340aef1', '4935c63ea569323fe513e24b5da802aaaf8238dfbb98838092d50f6a3627b1a4a7b2c6ffc6e1a090', 0, '2038-07-05 08:14:42'),
('8895d2e09f3b20a346a5297e25b28e96df6f3a459a5d8d2429073fa88e828c65ba37b836aefc2e98', '3127190c39dbaa7b998a9947b2e37d93b247b152c2b0f728ab996816ee82e7a14c51c1b4216da502', 0, '2038-07-05 10:52:42'),
('1013f05a8c99df80244425d38934e4a1abd29a5fcb2b1ee6fbcf62b9419a19edaec5e1667971b066', '58c5d0a0bb6f963c1c437bfda45985d4051e69f00b79eba5a6d443706f67db3a29f565ac815992d9', 0, '2038-07-05 10:59:27'),
('bbdbd44a2a02134aa3dc173fb324bc8e3deeac86e5268df0c70c10220a9344b127bfbaaef061ec66', '7294e0b29678c9e47ef5623d2041eb396a8543a5bcaab0fa6eae012b4d7053ded2ad982629f3d491', 0, '2038-07-05 11:06:10'),
('18bc43578c637f3c8ae941b24c475523a97066797a552062856c2ce69571db739280c16a5bc9c3a9', '0f1088b31b50ae846ea4747b42169b7dedbb37acb42a18330aa48baf781495372765b117272e7eb5', 0, '2038-07-05 11:31:11'),
('34d66a48e0598df0b8a09bd9d2affd4244eac7228a458006c5de183c6928f5440c7ea19ed25d9327', '470ce83978e538b5a95ec6475fe246bad17c9194e4a853b995d60ba3cdcb26b638d5c4ed00e2a5bb', 0, '2038-07-05 11:31:44'),
('0d73b18530f4fbf1ec325c202f9fcacacec7576b7d70d4303dbc540bfea911aa7b39cdec5df981b7', '4d9942c5727945e91bd3c6997c2b72348966c05e3f2303d2727804f9d093d00eb2fb4844a13fad51', 0, '2038-07-06 03:36:21'),
('dcb9d66145636bf90739c78f21610fa41d06263cb543d0f2ea5c8942b738b324ef88edb58562c36b', '5c2dbe4e45bbfed614f19665a8b6f689d2949087d18c5fe6e1e52a662b5259320bbda19e207e2d1e', 0, '2038-07-06 03:38:54'),
('676b9061205291376afccc4fb147484de19f9130ae43d3f349375ee07ea9ca0326e2ae50572f0e84', 'b3d6b03dfb2996f25b36e781afba535b58a2baa7ff01f3d2cb0df56e4110a53911791dbab835d18d', 0, '2038-07-06 10:12:34'),
('f79de216486b094edc5717e7ad78dc883ca7c5e9cac81688b6ef86c19dc7e16e6476ee93b431217e', 'e65c40b66ddf5fae9f5096c5e35a7c4be0a60ed409408733830cc553cd16ae92c8231e166669bcf4', 0, '2038-07-06 11:32:07'),
('54e3592ca60178921c6dd5b4938342ba941ef5e7526da96b767e025ecb2de978a5c4880d50824687', '89b0c737aba0dffce35b5b792a39a555c8a4ed419d9fd9f76b911b872fec5840506a4ace90377648', 0, '2038-07-06 11:33:13'),
('c0ac455e2a7bdfce023294e7b22255961e081bfbae60e3c018c3ea20c2fe0bbd183fbb64615fefe3', '3458fa066ae4cb34be931e2f5c7e48a92e88f4d075649285522a97bbfae0f54be8f64903ef5aab23', 0, '2038-07-09 03:44:57'),
('9a785f23a06bafa8b8928293cd57df3a80c8b68d229b738fe80acce4d096b485f148089c8076807d', '2d4ed04e570cd45b63d729e32be8aa85b6cfd5f729a94aeee58fbcb685c25584a0012ac48b0e57ec', 0, '2038-07-09 05:27:10'),
('83d5221e7be1dcff85424cfc07aeaf4d89272685ae6947b53e03d6a978381c468959ce9f56698340', '3901c4fcdd62234f7bb27067fe970b6d650299e3c986e80441849d07f572d04f9933edc3571b0e2a', 0, '2038-07-09 05:27:34'),
('aa693283fdb48662019f3e08033bbc32302a36ddf8e9e0fb5618756883d7def1bc15cd1faf6fa3b6', '43898cbdcd31886a785f730007c77e195fdcd57733e508b529dbd8b734e553a9d30ee602b02f813f', 0, '2038-07-09 05:31:28'),
('579e2dedfc31ba26362f3ca0e5baddf9e9388320af1f430f021e4ae96bcca7ddee9c56d585f7c8c7', '587011ad11e3a24afdb2f05cb7073d4c89946975221b5fdaeba68395ea6015f272a0442c10c59607', 0, '2038-07-09 05:32:49'),
('3727aa1658cb944b664e0079c4cb8ba79640499107b40ab86679e0443ad1cc97c27b597fd0d80c34', 'bf81299e86a2731e25401726f3ff4de413b058d694eb0f2ede8b8df7c00bc7efa0a978d0434e819e', 0, '2038-07-09 06:16:52'),
('dcb10f87927d564b00e4cddc2ed1d1f878ac892d7583f3805b8178ca3a4951ceec242fc688765d91', '3642f1792e7c4f0331f623c1185d462bdc5bffb1b67c605de44c59645ea65250f7c080c51ab5560f', 0, '2038-07-10 07:59:50'),
('c8df335ee490ad0c9014b3c89428093ff2386333e1d6d1d298744b47b21a135b79231e49fc16f503', 'c7bd9433ee6e6ad02342b6228264ee873b9f1fd09f612f867981582b7792303fcf3e63b5b170219d', 0, '2038-07-10 08:12:23'),
('04de89423761ef334e6cab72d4cf95a2ffd6afb2656193d6d2c946cb677526bf896f089b348c77cf', '542ff057c17af2e7433fe1473893aed728d3a31d598ecb202be9af9624157111dcb9b25399feb76c', 0, '2038-07-10 08:12:41'),
('7f4f039f21b81f8411b3cc7f916d49f2dddbd96c02119e2580dccaed7726fd7efe656311764fdf66', 'd383fa503f21c93f9581eb9ec550918910b8cd8310f8728032e6e8d9f7d6181aa4678e3f2b1a90e2', 0, '2038-07-11 11:24:06'),
('90d4e5cd3b99b6afa09e7a34646d467b05acd4c3075ed8ca5db62844ce8bcdcb2504f3ba2826c274', '47df956431b4a0ba5bf535de1df8e4e02e40eeb3a7c99f68d1a772fef22314485cefb1f62440affb', 0, '2038-07-11 11:24:36'),
('fe7d0083338cd73a83b1e7424a1d7a3d8981349ed67a37b542db93a40db9ff604f6ea99914806d4b', '9e592c56e3dc3475c2b2ce93903b8deddcf07c39d83e4e3b3ded3bed0cb8a4e56576dbcc0c99b8f9', 0, '2038-07-17 04:38:10'),
('57c92332bdf85c0b01c7d5783ce5ea0a30dddd9d90f7b6e05128cfd868184f134492e2ec85d30f5a', '19f372acd055190ad2f4e729f37a002023b761631aa626d930bb0294f746aef214b02ca2ba04ddd4', 0, '2038-07-17 12:13:09'),
('97b319861d2ca6e7cb5ae2c80048df48ebc80cfc58ac88bfa7505ee04fbe8858a3c725dbbdfed610', 'fc7e929ab4f57a5f7d2160f8636cbebe935c49c2f55206f2bdbc53318e10228a1c85fd05b266066b', 0, '2038-07-17 12:13:10'),
('ba75a4860af01fbc17d2504dc992ad0aebb439cbca47b1519c6275a725d298c0c33010755b06647a', '01c6051d037a65e7676078bf902ac3dd463f3bf28be43d098ccbb636d688f8a49c989c2c5e9709f0', 0, '2038-07-17 13:06:38'),
('259a4604ca2b28d49d2432cf585a089bb35a9706925e294960f547b0f5839cf1b6578053448625b4', '0cafaaf74d78356fe92274332a1f5475177c358d7ea2a3186cc46796c2412bb6f2291ea7c0a39657', 0, '2038-07-17 14:28:24'),
('c6f28e58724e6aa987a03d3547d63dcf744b5a777af70a0ebbb500428f00c74442e3cd32aeedd4d2', '7396a37f1d9999bdd8da40141f353c1266a602c9ab2f40a9cb7ce561fb62604d1b76a55fdbe72862', 0, '2038-07-17 15:25:46'),
('f257414b50a03993c675adab9b28d7b8a656affeff152e53c93e0965d7c9c8534487e76b6fc222c8', '94b77f5438f91b40d2b150d00a5aca8d314a74ea54dc43aad72e091a09d1a4649dc809780a9c99d5', 0, '2038-07-17 15:26:24'),
('68abd984919aa792ccd756af96445afe35585b0423398effc6a6847d8eb3001cec9dbfca8d09df48', 'a6386098e3f1a4beba4aacfb102390d88c2ae28a8e936c382fec3dc4b7325803d7170744db04eb74', 0, '2038-07-19 14:42:12'),
('3105be46f6c4e876add256776b0e96e1080215121dee16a6f410c8b23b7902ba4e65941a422f2f5e', '424aaafaa2ef6b56cae1115b709bf0d313705fadcd5b141e0241898603cb52ebf2d3bc45902337db', 0, '2038-07-20 03:29:04'),
('711cb71ca3ab62f528cc59ed2806f1acbaeca940343816ca03b0ea80f3991b8374c71fa503deac9f', 'b9d682ea291309c5192ef280484479fcda86a5fbc4c25d66467fc3392cefda7381acd7062f1609fa', 0, '2038-08-14 10:38:03'),
('0738edd1e2a3e1bc692fcebec55086721990eea0779b31b12542c50ed9f9b164bfde168480a536ea', 'b2ac55d2f0c963b8b950155a416274ee6eabda73786357fd099e4e2234365f4daea1ef14a5cfa994', 0, '2038-08-14 15:28:45'),
('12a01ea80d812d7fcb53dde947541e692e1648df2332446b27f4097c1403cb5b4bd0f231f729f633', '9a001479047aa83d58334d9fe479748198413ffbf86d10f252e1fc3edf3b106a371e8c650147db5e', 0, '2038-08-14 15:46:27'),
('bda2abe2e8c60e25215dad2cc9c919b7d80b2d17a35b39e51b90578a1b003278f2f235becd2f1e75', '92b221af431d3bf807ab945da8aae1ccfdd3b8d425d43745daf51d3d83acb568cfd5b93226259c10', 0, '2038-08-15 08:20:14'),
('b914f121f26fb95a19d51f61860600bd7c31819dcf1f48b9461061a5d26a10c9e98eec40888de8cd', '9349916bae91ba8d9d08add3575cd8f7f77cd0c258afc5b7f10aa699d612846b0c05c776e55bebce', 0, '2038-08-15 09:40:25'),
('14f25d94297cfbd394116b27c03101e89632e62f19d1dd6e9c4d2e0326b68607247017d6ca5212b7', '8a8cb869fb58c8723dafdd5c52443e8c646e8e65d4025084a35f8a0bdff74e28af0696db1744e9f4', 0, '2038-08-15 17:28:49'),
('407d493a34b48931ec4a88797e12188b05352716531358c3014dd47c553244d7dd5863e7e0ab837a', '1d639d49df2d63a355a8cb10ac70b99712f99a6de111a42c49e0fecc44adf4b82c6f7317c81bb175', 0, '2038-08-16 02:04:18'),
('14d072c7b8d5276778e82ebcde45c954c57f4e4b6e9c2b5c93cf940016192b12d37de1ad80367471', '487724ccbcc95e2d67f77673cd3194a4b6bf60fc15ad2bffcd9276eb2997a60148c8c05fef3faf89', 0, '2038-08-16 03:41:39'),
('86716cde7a199f361ce7c75dd9586b3881ff79ea63a3b745daf76875e3867aec347816292ad517a2', '1f82d9155f5cc14b0e886857467baa3a7d87df003c46926f02c4c998601a50cd1e368143aba45cb2', 0, '2038-08-16 03:42:26'),
('63e79f2f3e5b26da4f655c85ab59ffe053a49950c954e3b9d968a7de89898e7f840d6995165f98fb', 'a83e057496e1e8151b1d156c68867e6060b11749c7ffac180c6f8ab4be91ee8012bf7baec03b092f', 0, '2038-08-16 03:44:11'),
('4eafc8e9b38a8654dd101ce6b80f90f329d0be3419fd32c55d11b8b8f34dc3a1b5ba86fd2c33f0bc', 'fa207570d9a292ff409feef0e90a61c8f4584adfa77991d64bd997b77a89c45852494f38dc24f4db', 0, '2038-08-16 03:44:20'),
('3d2fdcbab5980ce0ff9d4b14d876e500e00994930d1905468c249fcdae00889243863f71331de3e9', 'b73831a5f586ce3fbb12e2e98b58ba2db1d22dd7d96fc524a08bd8d6f9d42e57d2c306c7f2696b5b', 0, '2038-08-16 03:45:12'),
('e9ce7648885513a6e3dd219b9a3bcef8bf9b5446046c3c82868c3a543ae62de666f0e5e9157d910d', '1df2353a1c2d30e480da2c38611bfb843bc67cb798530312d88ff1266a7e84bfc0f920a20d8ef73c', 0, '2038-08-16 07:16:07'),
('e5aadaffe4de486d590f73cab79e89e3cce008438f61e07711c59ae9da676be5f8c3173c0c30af8d', '78cf8c4200dab898584e63cda2485fbf7986a16586ac72129e0e3e67903ede42bade82b678523d11', 0, '2038-08-18 07:22:07'),
('2ebc77628ef2f01a4de7104c9fa9721868d701184f5a6a3f2e6e73befc1d2940441f6fb7bae224ba', 'c413495759ff3119491bd0a596b5121de689dc81b9e54ca5a6a9c5217c85cbf8f7a9cc4837797fb5', 0, '2038-08-19 02:30:23'),
('41c8065d33f7dc933627163791ea1ea0f13284d9abe90ada3d52d95c62754ce1c666543502ecc5e9', '9c0cb95336b46229574cb4f4bba74e2230dfcd1fb1c7e69a15deec79f3e395d5dd5cc45a256481c6', 0, '2038-08-19 21:04:29'),
('70bb97c85d15406699de61d2131558efd16eea276ba7a4779a207f48bd1d0d66f3a1583f0e58f2f9', 'f51e7f9d4ba763aaa03000e6145dfb230aaf2c086a72a52911f1901c69f29082de183ea2d64a7c2a', 0, '2038-08-19 22:07:52'),
('bd9061298c3860ce644c114220af19736c2998cbad5545974f56a941b676defa1b7678b3ae9555ed', '344531e2fad96538addb646638fc786e12f174ebdb7b504521bd07864a1b2debae61617a5f14ab24', 0, '2038-08-19 22:08:13'),
('d3657e3c28174e0e8eca5d207926587edf6e30f750ad8ed99e33e1ed0827ad8511c769a3711afc85', '13029d484828a318b3261879782bf2dea5cd740be0df341fccc34774a626ca2fdcecb8f58cfc299c', 0, '2038-08-19 22:09:08'),
('804651aad6facf9657b63259a3fd85e5db3dcdaa48936fcc71e11032dfd79950da0815bf2212d7b7', 'b4be4bef8b81d7e7f349ac30e83c295b166534a876fa2ca7da20b0a06dcbaf1c779ea110dd5ce4d9', 0, '2038-08-19 22:11:14'),
('2516477fd7003b1a2841e73ebe4b351e1a234755d34437c4c38d654c420dbfc60adc8422f7d89945', 'a9a1e2c8a33377a9b88fe997dd632893e9119955771c0b7521d8b6f0a71061244b088dff929e4983', 0, '2038-08-19 22:19:19'),
('bd37051d68d5fd3600dd57ec536067276a027fe60a9c462bbe6413edef9001ba2bb52080aef1ac5f', '27c58694ba0817a372131a6e3ed3aa28a293b6fd51ce1d36b66c8c70ebe384e84b637b5ac3dd0d9c', 0, '2038-08-19 22:19:33'),
('dfa76e3fa084b840fa1c91b147cdf80fb82ad7de4e0a4c91fc1ef61869b66892c9dac95a911fe28c', '7cd5da9d35e244d88e71b667fab712c5514940da74a2a1be710ca4cdc7c1b48a223dd88106d2fab0', 0, '2038-08-21 05:50:54'),
('7d1a91e084b086de5648bf1455156fc78828a72789546072c4934a3a59066f7a332c795b321d2675', '1d8777e6afa82e2602fbe832e9799190c83257a6b77a93aec1bf4859ae19447567267ad85e56e10c', 0, '2038-08-21 05:51:03'),
('bde29ee96679b1c4ca22a0f6c3508a6e2139d9b7795244d697935b438776bfd1ce147c1b9bc649d9', '93f8da5e220144a96c705010431861dbe73d77008ed75aec026000f8f797789c9fd05a009cdc0be0', 0, '2038-08-21 11:21:12'),
('bb18d840e8bd784cb8077b0c8965455d3684d621f8dc619d86f2c9a26256ace65310510f06689669', '937dddd8d6b60f60a29497ac8f405942d9e09f8e04a22021685a8850f50d6d03f66f74e99dd598f0', 0, '2038-08-21 11:24:51'),
('72b6012880a485ba76c325e3ef924edb93c66f86211141cdec0cfc3fa2dcab1d50b7264f9203386d', '232b031166447c743076794248a61d354cd63886ff2833ba71b6e92dd7b22ee09173bc9386573313', 0, '2038-08-22 04:18:24'),
('4e2dcd7785cef402de3602fe5c0b916c51b92c552c0a617d9617e16e1f232276bc38b87fadb24806', '6b6d2ca91f1c0a0ad4b9148ca8a6c84b647dc225ce9b1cd4da9b13bc9c9fe837db16ea12b1ab62c5', 0, '2038-08-22 04:18:46'),
('7194c895c2881e712d64fe8db3e7a3b9750cc497f8fd22349fd8b992ccbab9dfb34babe7798da31a', '43291f683517bdfce6978afb2d00c7c30d534ab4df64db1132dc4a6dafe16afb3327770ad72eb77c', 0, '2038-08-22 04:20:16'),
('7c216d27da135353a9cbb8c35d6979d2348bd304fdfef8a7758de614780fd33b87bba9f98629db3b', 'eecd3885ce2df64b902227a004aaa9bc43d8dd72527d47719e86b643ae1ce34d3372cd578821fc02', 0, '2038-08-22 04:28:40'),
('742d2e0b67621c473968fe9c0f3717112208b025f1ac456d8b6743873b2f8231d442b5b3a63c5bad', '78d254bcf6d9e75bcc8007ec6b860afa2c9f150b1828b25cae66e4f519a2eee1d1a9d5eab3968fbe', 0, '2038-08-22 04:44:09'),
('e57f4ad22dc3368351b092ab42455f9e67cf80d7e56845492839b4cc9cc5202349fd4e21444fa772', '6eaf007b6147a1b262ca00e5bbec531d8756fb0355012015b37e4e50515e4fe955b4b06867d41a45', 0, '2038-08-22 04:44:22'),
('d528e3cd28161815f25b739ed899664f2ea692acb6c8c96c6daac35f69c0f234f914be3fefdba4e6', '9dc0a3e21053bf10033d9b806e9ba1aa5d9b94180b13c3fb4b4be7cf3ef1dbb4ae276e2c8587df15', 0, '2038-08-22 05:00:46'),
('d64450eeea873dd6469abcb1cc1c457dca615cdf7cc44ab1d9d4fc9f95518afcf158f7f9bc078981', '10f9265482e1259a996ac7a12ce9aecf1bdc2e558ddce8b25ce7551d2599544739c4fe05db5768f5', 0, '2038-08-22 05:05:08'),
('0797a6fac014185a664e6807bd6fd48a6af0da04fc1e90a05752f26bb6e4284a75fe114bb3721fb5', '9d60a112c7361cff07bf51791715c7ea0c00a7f542ecde9b0274af1ad58131cef6b3212f5de99ae5', 0, '2038-08-22 05:13:42'),
('3aad1f645f5a8d3cafbb6743925dfa2fd6337f4c5a244d858ec9bc23d76513d1e89e5b7212d13021', '23fbd1384eaa51ea44ac3ce6a27173def67ac2755f89b96a003d3fa2742bbf8a260e8833adbbf1fd', 0, '2038-08-22 07:21:30'),
('6143faed3d59b4542b5e5d7ea5d618c3c0ce4e46fa21fcb45a35e6b0b2ac0caf11ffdd3ba80356a5', 'a51f989c26483181e55783a83ffba3ebe79226dffe3e9cb8611e24017edeaf0de88cfc5e4abbda5a', 0, '2038-08-22 07:21:42'),
('f033c0cbc6781399907d8898fd5942f469b493386edae96c6c13f1380dc30b809593937d8dd87182', 'd210ca7ac0853289a17997a1929d74f88d0147470bdd301d93fe9ec771cb0843e4c0767bc9d21c68', 0, '2038-08-24 03:29:37'),
('1958eb5ba36884496ccf769060fa08aaf2a673376f02ca5e8bccbc2e601beea62f2c91c89e503266', '139f6244308fa297ab542c5a1a7b4477427a5f1438981c6c3ebd47ba5359b28fc90da7bc259d2070', 0, '2038-08-27 04:33:44'),
('76186185a8ea5ac4e8023e0e9b6973e684d54dcb56c1184b14f84e54bd88202eb19f76a1502495fd', '634a6f8d898728803ceb1a582bab29a9dd8c0667293a786b15fcf99fde71dc72aea74930c8f7f73c', 0, '2038-08-30 07:40:40'),
('db1a23e7ac11b7f778e23591e71fef17da33d998252b79be64c00914f1829f8add1506eea874937d', '8f82e091984a8255ec1c6e2f51c01a1d7a830363a63b575c1919ab8068d530ed5afa12f1414315e2', 0, '2038-08-31 06:54:21'),
('452969fe224c3a70f4619e493792c16a2b8c219215a54e14974d1bb275850e26817fa4075ff60ba9', 'e0fdefeae47f80c391cacfdf8e1c7e32dd21eb3565aa9f204561941f76b7e77f2c4748931189c0f2', 0, '2038-08-31 06:56:34'),
('d22fb17cfa6804b5c99492358858cf78a14286e4efe89008e407aa63b2c5d0b1c59033cb988bd2f5', 'c9c754b4536cca00c4620c03d3f791bfc73a4a8cf346a8e32398b17f33e56352f11e3028a4e0441b', 0, '2038-08-31 07:11:05'),
('b18b3557fc04fbfa28cdd7ad8a3eaf685abd6ec36c5e8b47a28e77a9bd79dac09593e2c2f8a9c182', '8d2eecf18fc72accc3e1ff47d15f1eff57e8b3b464bf97f294ac5f3571a89555538b85497a1d11c1', 0, '2038-08-31 09:42:48'),
('c7f7b0af5616e1f08e720854d97f4af55f2919d7220f9a1db41c774eb89d74e8a31b0eae537afef9', '181e2c64ed929f7d3b9a05ec039f5fe736770222e2e7f354823d3985b94c852c60466e5ed1f16900', 0, '2038-09-03 04:49:12'),
('ece325a9211b51ad7b3e34d35ab5fa8429c95f7470dbdf205adc37cfbef24cb71ef048e25a4fe849', '8c15639ea708144ee53bc2384c52d7f0fee70926f014f9f3171d5c209cddace68e6a60cfcae8f19e', 0, '2038-09-04 04:02:54'),
('93b9f38b4819d9192d61ec5c994909453abcbd83c0631851da0e1b9e5a378541ea37027d073effbb', '4c8ff444119fa8d1d0ddbc11d170367237adcd9b0634e3f1cebda53f584b1b87ea45343d6ba734a8', 0, '2038-09-05 11:05:09'),
('dafcea5664dfa20ac20e0ed55815fbc3380be7fde2b04175c8673683c2a161bb98f910756f02e2f8', 'd6661a928949efc5eaca40aedb1923477bd2f7e42d1cf7c30d56c44d953089fce201f59c52f93757', 0, '2038-09-08 09:26:48'),
('0e480621f73a7da9ee21e389733794f1f5347a915e687a28ea8254a42d3c9eada8bd3e9bc89d6039', 'd5c4d25fa08ce1e4785290b636f9df5b3f29d3a74f84a904d7f2c2abca6a1f609a3c0a1f68e7faf9', 0, '2038-09-10 03:37:05'),
('64d0090d3180b95c03b1f8a19d457a16bdbc58934580ab864e3a8e490b8c9cec9456a521a41f8286', '7d7f8c77011e4c9edf456a2d91d780264c7f78990f01f79607eb95a2af04317e1253f6ea792359cb', 0, '2038-09-10 05:03:20'),
('2c4003b6e58673061f6fc9158eb4191da3d0598bb0b73bba9e3427a0e5f841e5742dc0a1980a1f37', '11b205a35fcb2c09301efbb98513201aea0e6c3f15e78633cebb58bd1b414b7af24db4a8544b919d', 0, '2038-09-12 23:05:04'),
('d82cba851fdec1cbfaf2fe83c8d467cddd0e6c8b96a43194abe6f812b439deef174d2f655cff8a5e', 'eee4c00215c03438a9e599550b87b33af3b873712031961be59c998f0983975ca130d3a0c127cc72', 0, '2038-09-14 01:27:36'),
('d6624423fbded8afe55514677098953d57f6e7a85bdd498980d89e61d3a12d8faf43c4ccffa5c598', '1b8b3f2415ff98376c510d9a81ecdb0721a6b7d30a55649f07615f2b94e23cb1872307fe034d7a0b', 0, '2038-09-14 09:38:59'),
('0ba816621e5f4e392cd7f7e54c900e67523e26807d427cec7b42b8b346395513a4aa173344d2ae4d', '5fc05544845d29e6151f561a5b9d5b5649141092d70913167b184f43e6df09a129cda8739fe4e5e9', 0, '2038-09-17 06:21:46'),
('28aa4bec196d26bfe65c4e6978e28aae38113ec5e99cb044175c8fb78f90502dedbbbfe83bd34e0f', '5de20b4fd25fead996eaeb510c4cc68f2c0e8c78c2656b7833a239ebd536acbce5ec90c16a9f305f', 0, '2038-09-18 04:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `function` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `visibility` varchar(255) NOT NULL DEFAULT 'private',
  `parent` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `title`, `icon`, `url`, `method`, `controller`, `function`, `route`, `visibility`, `parent`) VALUES
(22, 'Hazard Area', 'fa fa-warning', '/hazard-area', 'get', 'MainController', 'hazard_area', 'web', 'public', 54),
(2, 'Dashboard', 'fa fa-home', '/home', 'get', 'MainController', 'index', 'web', 'public', NULL),
(3, 'Log In', 'fa fa-user', '/login', 'get', 'MainController', 'login', 'web', 'public', NULL),
(4, 'Register', 'fa fa-key', '/register', 'get', 'MainController', 'register', 'web', 'public', 6),
(6, 'Users', 'fa fa-user', '/users', 'get', 'MainController', 'users', 'web', 'public', NULL),
(7, 'Read Users', 'fa fa-user', '/cast-users', 'post', 'UserController', 'cast_users', 'web', 'private', NULL),
(8, 'API Users', 'fa fa-user', '/users', 'get', 'UserController', 'users', 'api', 'private', NULL),
(9, 'Read Pages', 'fa fa-user', '/read-pages', 'post', 'MainController', 'read_pages', 'web', 'private', NULL),
(10, 'First', 'fa fa-home', '/', 'get', 'MainController', 'index', 'web', 'private', NULL),
(14, 'Profile', 'fa fa-gear', '/profile', 'get', 'MainController', 'profile', 'web', 'public', NULL),
(17, 'Read Mails', 'fa fa-envelope', '/cast-mails', 'post', 'MailController', 'cast_mails', 'web', 'private', NULL),
(16, 'Mail Box', 'fa fa-envelope', '/mail-box', 'get', 'MainController', 'mail_box', 'web', 'public', NULL),
(18, 'API Mails', 'fa fa-envelope', '/mails', 'get', 'MailController', 'mails', 'api', 'private', NULL),
(19, 'Delete Mails', 'fa fa-envelope', '/cast-mails-delete', 'post', 'MailController', 'cast_mails_delete', 'web', 'private', NULL),
(20, 'Cast Users Lite Q', 'fa fa-user', '/read-liteq-cc', 'post', 'UserController', 'read_liteq_cc', 'web', 'private', NULL),
(21, 'Cast Users Lite Q', 'fa fa-user', '/read-liteq-to', 'post', 'UserController', 'read_liteq_to', 'web', 'private', NULL),
(25, 'Read Areas', 'fa fa-envelope', '/cast-areas', 'post', 'HazardAreaController', 'cast_areas', 'web', 'private', NULL),
(23, 'API Hazard Areas', 'fa fa-warning', '/areas', 'get', 'HazardAreaController', 'area', 'api', 'private', NULL),
(24, 'Terminal', 'fa fa-fire', '/terminal', 'get', 'MainController', 'terminal', 'web', 'public', 54),
(26, 'Read Hazard Levels', 'fa fa-user', '/hazard-levels', 'get', 'HazardAreaController', 'hazard_levels', 'web', 'private', NULL),
(29, 'Cast Plans', 'fa fa-user', '/cast-plans', 'post', 'SpecialPlanController', 'cast_plans', 'web', 'private', NULL),
(30, 'Read Tasks', 'fa fa-user', '/read-tasks', 'post', 'SpecialPlanController', 'read_tasks', 'web', 'private', NULL),
(31, 'Read Routes', 'fa fa-user', '/read-routes', 'post', 'SpecialPlanController', 'read_routes', 'web', 'private', NULL),
(33, 'Violations', 'fa fa-ban', '/violations', 'get', 'MainController', 'violations', 'web', 'public', NULL),
(34, 'Reports', 'fa fa-file-text', '/violation-reports', 'get', 'MainController', 'violation_reports', 'web', 'public', 33),
(35, 'Read Violations', 'fa fa-user', '/cast-violations', 'post', 'ViolationController', 'cast_violations', 'web', 'private', NULL),
(36, 'API Violation', 'fa fa-user', '/violations', 'get', 'ViolationController', 'index', 'api', 'private', NULL),
(37, 'API Violation Images', 'fa fa-image', '/violation-images', 'post', 'ViolationImageController', 'index', 'api', 'private', NULL),
(38, 'Read Violation Actions', 'fa fa-user', '/read-violation-actions', 'get', 'ViolationController', 'read_violation_actions', 'web', 'private', NULL),
(39, 'Export PDF', 'fa fa-print', '/export-violation', 'post', 'ViolationController', 'export_violation', 'web', 'private', NULL),
(40, 'Read Markers', 'fa fa-user', '/read-markers', 'post', 'HazardAreaController', 'read_markers', 'web', 'private', NULL),
(41, 'Login App', 'fa fa-user', '/in', 'post', 'UserController', 'in', 'web', 'private', NULL),
(42, 'APP Fetch Users', 'fa fa-users', '/user-list', 'get', 'UserController', 'user_list', 'web', 'private', NULL),
(43, 'APP Fetch Companies', 'fa fa-home', '/company-list', 'get', 'UserController', 'company_list', 'web', 'private', NULL),
(44, 'App Read Route', 'fa fa-user', '/route-me', 'post', 'SpecialPlanController', 'route_me', 'web', 'private', NULL),
(45, 'API Messages', 'fa fa-user', '/messages', 'get', 'MessageController', 'index', 'api', 'private', NULL),
(46, 'Reminders', 'fa fa-bullhorn', '/reminders', 'get', 'MainController', 'reminders', 'web', 'public', NULL),
(47, 'OAuth Client Fetch', 'fa fa-user', '/oauth-client-me', 'post', 'UserController', 'oauth_client_me', 'web', 'private', NULL),
(48, 'Sub Area', 'fa fa-user', '/hazard-area-sub', 'get', 'MainController', 'hazard_area_sub', 'web', 'public', 54),
(49, 'Cast Areas Sub', 'fa fa-user', '/cast-areas-subs', 'post', 'HazardAreaSubController', 'cast_areas_subs', 'web', 'private', NULL),
(50, 'API Hazard Areas Subs', 'fa fa-user', '/areas-sub', 'get', 'HazardAreaSubController', 'index', 'api', 'private', NULL),
(51, 'Hazard Type', 'fa fa-user', '/hazard-types', 'get', 'MainController', 'hazard_types', 'web', 'public', 54),
(52, 'API Hazard Types', 'fa fa-user', '/types', 'get', 'HazardTypeController', 'index', 'api', 'private', NULL),
(53, 'Cast Hazard Types', 'fa fa-user', '/cast-types', 'post', 'HazardTypeController', 'cast_types', 'web', 'private', NULL),
(54, 'Hazards', 'fa fa-warning', '/hazards', 'get', 'MainController', 'hazards', 'web', 'public', NULL),
(55, 'API Hazards', 'fa fa-user', '/hazards', 'get', 'HazardController', 'index', 'api', 'private', NULL),
(56, 'Cast Hazards', 'fa fa-user', '/cast-hazards', 'post', 'HazardController', 'cast_hazards', 'web', 'private', NULL),
(57, 'Sub Areas on Area', 'fa fa-user', '/areas-child', 'post', 'HazardAreaSubController', 'areas_child', 'web', 'private', NULL),
(58, 'Types on Sub Area', 'fa fa-user', '/areas-child-type', 'post', 'HazardAreaSubController', 'areas_child_type', 'web', 'private', NULL),
(59, 'Hazard Inspections on User', 'fa fa-user', '/inspections-me', 'post', 'HazardController', 'inspections_me', 'web', 'private', NULL),
(60, 'Extension Request', 'fa fa-user', '/extension-request-hazard', 'get', 'MainController', 'extension_request_hazard', 'web', 'public', 54),
(61, 'Cast Extension Requests Hazards', 'fa fa-user', '/cast-extensions-hazards', 'post', 'HazardInspectionExtensionController', 'cast_extensions', 'web', 'private', NULL),
(62, 'API Hazard Inspection Extension Request', 'fa fa-user', '/extension-requests-hazards', 'get', 'HazardInspectionExtensionController', 'index', 'api', 'private', NULL),
(63, 'Special Plans', 'fa fa-briefcase', '/special-plan', 'get', 'MainController', 'special_plan', 'web', 'public', NULL),
(64, 'API Special Plans', 'fa fa-user', '/special-plans', 'get', 'SpecialPlanController', 'index', 'api', 'private', NULL),
(65, 'Cast Special Plans', 'fa fa-user', '/cast-special-plans', 'post', 'SpecialPlanController', 'cast_plans', 'web', 'private', NULL),
(66, 'Special Plans on User', 'fa fa-user', '/special-plans-me', 'post', 'SpecialPlanController', 'special_plans_me', 'web', 'private', NULL),
(67, 'API Check Lists', 'fa fa-user', '/check-lists', 'get', 'CheckListController', 'index', 'api', 'private', NULL),
(68, 'Extension Request', 'fa fa-user', '/extension-request', 'get', 'MainController', 'extension_request', 'web', 'public', 63),
(69, 'Cast Extension Requests', 'fa fa-user', '/cast-extensions', 'post', 'SpecialPlanQuestionExtensionController', 'cast_extensions', 'web', 'private', NULL),
(70, 'API Special Plan Extension Request', 'fa fa-user', '/extension-requests', 'get', 'SpecialPlanQuestionExtensionController', 'index', 'api', 'private', NULL),
(71, 'API Notices', 'fa fa-user', '/notices', 'get', 'NoticeController', 'index', 'api', 'private', NULL),
(72, 'Violation Verify', 'fa fa-user', '/verify', 'get', 'ViolationController', 'verify', 'web', 'private', NULL),
(73, 'Violation Verify Submit', 'fa fa-user', '/verification', 'post', 'ViolationController', 'verification', 'web', 'private', NULL),
(74, 'Inspection Log Special Plan', 'fa fa-user', '/inspection-log-special-plan', 'post', 'CheckListController', 'inspection_log_special_plan', 'web', 'private', NULL),
(75, 'Export PDF Inspection Log Special Plan', 'fa fa-user', '/export-inspection-log-special-plan', 'post', 'CheckListController', 'export_inspection_log_special_plan', 'web', 'private', NULL),
(76, 'Automate', 'fa fa-user', '/automate', 'get', 'MainController', 'automate', 'web', 'private', NULL),
(77, 'API Companies', 'fa fa-user', '/companies', 'get', 'CompanyController', 'index', 'api', 'private', NULL),
(78, 'API Departments', 'fa fa-user', '/departments', 'get', 'DepartmentController', 'index', 'api', 'private', NULL),
(79, 'API Designations', 'fa fa-user', '/designations', 'get', 'DesignationController', 'index', 'api', 'private', NULL),
(80, 'Dashboard Counts', 'fa fa-user', '/dashboard-counts', 'post', 'MainController', 'dashboard_counts', 'web', 'private', NULL),
(81, 'Filter Ranking', 'fa fa-bar-chart-o', '/filter-ranking', 'get', 'MainController', 'filter_ranking', 'web', 'public', 6),
(82, 'Rankings', 'fa fa-user', '/rankings', 'get', 'UserController', 'rankings', 'web', 'private', NULL),
(83, 'Daily Plans', 'fa fa-briefcase', '/role-plan', 'get', 'MainController', 'role_plan', 'web', 'public', NULL),
(84, 'Reports', 'fa fa-file-text', '/role-plan-report', 'get', 'MainController', 'role_plan_report', 'web', 'public', 83),
(85, 'API Role Plans', 'fa fa-user', '/role-plans', 'get', 'RolePlanController', 'index', 'api', 'private', NULL),
(86, 'Cast Role _pans', 'fa fa-user', '/cast-role-plans', 'post', 'RolePlanController', 'cast_plans', 'web', 'private', NULL),
(87, 'API Role Plan Triggers', 'fa fa-user', '/role-plans-triggers', 'get', 'RolePlanTriggerController', 'index', 'api', 'private', NULL),
(90, 'Role Plans on User', 'fa fa-user', '/role-plans-me', 'post', 'RolePlanHeaderController', 'role_plans_me', 'web', 'private', NULL),
(89, 'Automate Role Plan', 'fa fa-user', '/automate-role-plan', 'get', 'RolePlanController', 'automate', 'web', 'private', NULL),
(91, 'API Role Plans Headers', 'fa fa-user', '/role-plans-header', 'get', 'RolePlanHeaderController', 'index', 'api', 'private', NULL),
(92, 'API Role Plan Report', 'fa fa-user', '/role-plans-report', '', 'RolePlanReportController', 'index', 'api', 'private', NULL),
(93, 'Cast Headers', 'fa fa-user', '/cast-role-plans-headers', 'post', 'RolePlanHeaderController', 'cast_headers', 'web', 'private', NULL),
(94, 'Cast Role Plan Reports', 'fa fa-user', '/cast-role-plans-reports', 'post', 'RolePlanReportController', 'cast_reports', 'web', 'private', NULL),
(95, 'Export Role Plan Final Report', 'fa fa-user', '/export-role-plan-report', 'post', 'RolePlanReportController', 'export_report', 'web', 'private', NULL),
(96, 'Submit Violation', 'fa fa-edit', '/violation-submit', 'get', 'MainController', 'violations_submit', 'web', 'public', NULL),
(97, 'Submit Violation on Web', 'fa fa-user', '/violation-submit', 'post', 'ViolationController', 'violation_submit', 'web', 'private', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `priority_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `css` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`priority_id`, `title`, `css`) VALUES
(1, 'High', 'label label-sm btn-danger'),
(2, 'Medium', 'label label-sm btn-warning'),
(3, 'Normal', 'label label-sm btn-success');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `review` text COLLATE utf8_unicode_ci NOT NULL,
  `star` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `gcmtoken` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address`, `nic`, `company_id`, `department_id`, `designation`, `contact`, `employee_number`, `shift`, `avatar`, `gcmtoken`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nishantha Hewawissa', 'nishanthahewawissa123@gmail.com', '$2y$10$0hH.EXKRf1EyAQvblGpmN.MRQlB7NPjNYGFJI/YyYSsBnjAPLto8q', '123,Kandy , SL', '911780208V', 2, 1, 'Software Engineer', '94785583736', '00552', 'Genera Non Flex', 'user1.PNG', 'cD7sLz6rTKY:APA91bGRxQqRPKVeQ8f1jXf-jCdpvgdkuH7zfqFaTC6M_hW8z6-Q2rC3A5nYoxKGjmnUSDm8GiDciRw1H_vUf2QOCFb8O7ohzd_2HCaybx2W-9exeA9I1wRv2ibewr7ljdklq_GV9-dNL4ZipCAM4ufqm842TqFCVw', '469cjitwTAcGK06ZC2I1GHyVxCaMXHE9IoNnppLoJX3GmNN5Qz7avyoSUoVk', '2018-06-30 23:16:39', '2018-09-12 04:46:51'),
(50, 'Jayantha Perera', 'jayantha.perera@cict.lk', '$2y$10$qc2YMD/bOeaElMeA0CNy8eT1brFOtoUyuSxmES29/WuKeM3r45QtO', 'Colombo, SL', '723202329V', 2, 1, 'Deputy General Manager', '0766666680', '00037', 'Genaral (Flex)', '5b7ce3120eba9.png', NULL, NULL, '2018-08-21 22:44:10', '2018-08-21 22:44:10'),
(47, 'Hirushan Dewanarayana', 'hirushan.dewanarayana@cict.lk', '$2y$10$IFfkkcIGlw5gH15cdPNtW.JuJgEC.gpPwtjcV1NI.kVUg/nRtqVVe', 'Colombo, SL', '933100260V', 2, 1, 'Software Engineer', '0773383512', '00550', 'Genaral (Non Flex)', '5b7cdc5443a16.png', NULL, 'DUaMU7DB8VrwOtAkyhFVLSOALFJWA6nQAxNiPjuVQskSEK2lCVx5Hn09tBLj', '2018-08-21 22:15:24', '2018-08-21 22:15:24'),
(48, 'Duminda Samarasinghe', 'duminda.samarasinghe@cict.lk', '$2y$10$fjA59mFNHYf/K/WJidKh/eQcm8vMmuaAlIeBx3bqmIy3rKYMUG9B2', 'Colombo, SL', '812200437V', 2, 1, 'Software Engineer', '0766666682', '00266', 'Genaral (Non Flex)', '5b7cddcf4b7f0.png', NULL, 'ADbNeOU3TJFA6T41BaAoZq7ZyrdWziMTvwOZZvKZIgWNci9qJR1mZVcfsqyq', '2018-08-21 22:21:43', '2018-08-21 22:21:43'),
(49, 'Dinesh Bandara', 'dinesh.bandara@cict.lk', '$2y$10$exa0nm4vV/cawkDdv6ghXeI.gPL4g7UTGptjQIcNDbKwm7uZ79k2m', 'Colombo, SL', '802950691V', 2, 1, 'Database Administrator', '0766666683', '00494', 'Genaral (Non Flex)', '5b7cdf6d56a9d.png', NULL, NULL, '2018-08-21 22:28:37', '2018-08-21 22:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `users_designations`
--

CREATE TABLE `users_designations` (
  `designation_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_form` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_designations`
--

INSERT INTO `users_designations` (`designation_id`, `title`, `short_form`) VALUES
(1, 'Head of Department', 'HOD'),
(2, 'General Manager', 'GM'),
(3, 'Deputy General Manager', 'DGM'),
(4, 'Software Engineer', 'SE'),
(5, 'Database Administrator', 'DB Admin');

-- --------------------------------------------------------

--
-- Table structure for table `users_emergency_plans`
--

CREATE TABLE `users_emergency_plans` (
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_emergency_plans`
--

INSERT INTO `users_emergency_plans` (`plan_id`, `user_id`, `datetime`, `created_by`) VALUES
(4, 1, '2018-07-19', 1),
(10, 15, '2018-07-14', 1),
(11, 15, '2018-07-17', 1),
(12, 1, '2018-07-19', 1),
(13, 1, '2018-07-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_emergency_plans_routes`
--

CREATE TABLE `users_emergency_plans_routes` (
  `route_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_emergency_plans_routes`
--

INSERT INTO `users_emergency_plans_routes` (`route_id`, `plan_id`, `latitude`, `longitude`) VALUES
(92, 10, '6.942211875403761', '79.83637191365688'),
(146, 4, '6.945470818669752', '79.82808925221889'),
(145, 4, '6.945044814296801', '79.82723094533412'),
(143, 4, '6.941956271055687', '79.83540631841151'),
(144, 4, '6.942062772884265', '79.82723094533412'),
(142, 4, '6.942275776469109', '79.8358354718539'),
(91, 10, '6.9425739813258955', '79.83851768086879'),
(90, 10, '6.945364317612687', '79.83804561208217'),
(89, 10, '6.945151315426218', '79.82718802998988'),
(88, 10, '6.942147974329764', '79.82714511464565'),
(87, 10, '6.942211875403761', '79.83574964116542'),
(141, 4, '6.942275776469109', '79.83813144277065'),
(129, 11, '6.9450661145246055', '79.82856132100551'),
(130, 11, '6.945193915871228', '79.8378524930331'),
(131, 11, '6.942062772884265', '79.83645774434535'),
(132, 11, '6.942957387292633', '79.83240224431484'),
(133, 11, '6.941977571423333', '79.82813216756313'),
(134, 11, '6.9448105117272165', '79.8284325749728'),
(147, 4, '6.945577319702708', '79.83278848241298'),
(148, 4, '6.944405807013948', '79.83278848241298'),
(149, 4, '6.944427107270707', '79.83553506444423'),
(150, 4, '6.943404693858958', '79.83551360677211'),
(151, 4, '6.943404693858958', '79.83826018880336'),
(152, 4, '6.942147974329764', '79.83823873113124'),
(153, 12, '6.942339677525753', '79.83753062795131'),
(154, 12, '6.94238227822536', '79.83607150624721'),
(155, 12, '6.942275776469109', '79.82718802998988'),
(156, 12, '6.944959613375915', '79.82723094533412'),
(157, 12, '6.945087414751456', '79.83008481572597'),
(158, 12, '6.943340792946939', '79.83004190038173'),
(159, 12, '6.943170390472491', '79.83750917027919'),
(160, 13, '6.942297076822277', '79.83738042424648'),
(161, 13, '6.942190575046725', '79.8319087178561'),
(162, 13, '6.9425313806436275', '79.82781030248134'),
(163, 13, '6.945002213838279', '79.82830382894008'),
(164, 13, '6.94534301739838', '79.83480550359218'),
(165, 13, '6.943340792946939', '79.83690835545985');

-- --------------------------------------------------------

--
-- Table structure for table `users_emergency_plans_tasks`
--

CREATE TABLE `users_emergency_plans_tasks` (
  `task_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `content` varchar(9000) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_emergency_plans_tasks`
--

INSERT INTO `users_emergency_plans_tasks` (`task_id`, `plan_id`, `content`, `status`) VALUES
(72, 11, 'BBB', 'N'),
(71, 11, 'AAA', 'N'),
(77, 4, 'BBB', 'N'),
(76, 4, 'AAAA', 'N'),
(59, 10, 'Task 5', 'N'),
(58, 10, 'Task 4', 'N'),
(57, 10, 'Task 3', 'N'),
(56, 10, 'Task 2', 'N'),
(73, 11, 'CCC', 'N'),
(78, 12, 'task 1', 'N'),
(79, 12, 'task 2', 'N'),
(80, 12, 'task 3', 'N'),
(81, 13, 'task 1', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `users_grades`
--

CREATE TABLE `users_grades` (
  `grade_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_grades`
--

INSERT INTO `users_grades` (`grade_id`, `title`) VALUES
(1, 'Grade 1'),
(2, 'Grade 2'),
(3, 'Grade 3');

-- --------------------------------------------------------

--
-- Table structure for table `users_levels`
--

CREATE TABLE `users_levels` (
  `level_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_levels`
--

INSERT INTO `users_levels` (`level_id`, `title`, `description`) VALUES
(1, 'Level 1', 'Non Executive'),
(2, 'Level 2', 'Non Executive'),
(3, 'Level 3', 'Non Executive'),
(4, 'Level 4', 'Non Executive'),
(5, 'Level 5', 'Executive'),
(6, 'Level 6', 'Executive'),
(7, 'Level 7', 'Executive'),
(8, 'Level 8', 'Management'),
(9, 'Level 9', 'Management'),
(10, 'Level 10', 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `users_mailboxes`
--

CREATE TABLE `users_mailboxes` (
  `mail_id` int(11) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` varchar(9000) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `priority` int(11) DEFAULT '3',
  `alive` char(1) NOT NULL DEFAULT 'Y',
  `datetime` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_mailboxes`
--

INSERT INTO `users_mailboxes` (`mail_id`, `origin_id`, `destination_id`, `subject`, `content`, `status`, `priority`, `alive`, `datetime`) VALUES
(1, 1, 0, 'New Hazard', 'Nishantha Hewawissa, has been report a new hazard.', 'Y', 1, 'Y', '2018-08-31 07:16:51'),
(2, 1, 0, 'New Hazard', 'Nishantha Hewawissa, has been report a new hazard.', 'Y', 1, 'Y', '2018-08-31 11:32:10'),
(3, 1, 1, 'Special Plan Task Submit', 'Nishantha Hewawissa, has been completed task at Admin Building, Car park, Suspected gatherings.', 'Y', 1, 'Y', '2018-09-17 13:53:00'),
(4, 1, 1, 'Special Plan Task Submit', 'Nishantha Hewawissa, has been completed task at Admin Building, Car park, Suspected gatherings.', 'Y', 1, 'Y', '2018-09-17 13:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `users_mailboxes_attachments`
--

CREATE TABLE `users_mailboxes_attachments` (
  `attachment_id` int(11) NOT NULL,
  `mail_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_privileges`
--

CREATE TABLE `users_privileges` (
  `privilege_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_privileges`
--

INSERT INTO `users_privileges` (`privilege_id`, `user_id`, `page_id`) VALUES
(628, 1, 84),
(627, 1, 83),
(626, 1, 81),
(625, 1, 68),
(624, 1, 63),
(623, 1, 60),
(622, 1, 54),
(621, 1, 51),
(620, 1, 48),
(619, 1, 46),
(618, 1, 34),
(617, 1, 33),
(616, 1, 24),
(615, 1, 22),
(614, 1, 16),
(613, 1, 14),
(612, 1, 6),
(611, 1, 4),
(610, 1, 2),
(629, 1, 96);

-- --------------------------------------------------------

--
-- Table structure for table `users_role_plans`
--

CREATE TABLE `users_role_plans` (
  `plan_id` int(11) NOT NULL,
  `day` char(1) NOT NULL DEFAULT 'N',
  `shift` char(1) NOT NULL DEFAULT 'N',
  `time_start` varchar(50) DEFAULT NULL,
  `time_end` varchar(50) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  `datetime` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_plans`
--

INSERT INTO `users_role_plans` (`plan_id`, `day`, `shift`, `time_start`, `time_end`, `created_by`, `status`, `datetime`) VALUES
(1, 'Y', 'N', '09:00:00', '10:00:00', 1, 'Y', '2018-09-10 15:39:34'),
(2, 'Y', 'N', '15:00:00', '16:00:00', 1, 'Y', '2018-09-10 17:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `users_role_plans_headers`
--

CREATE TABLE `users_role_plans_headers` (
  `header_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `time_start` varchar(50) DEFAULT NULL,
  `time_end` varchar(50) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_plans_headers`
--

INSERT INTO `users_role_plans_headers` (`header_id`, `plan_id`, `user_id`, `created_by`, `datetime`, `time_start`, `time_end`, `area_id`, `status`) VALUES
(1, 1, 1, 1, '2018-09-13', '09:00:00', '10:00:00', 7, 'Y'),
(2, 2, 49, 1, '2018-09-13', '15:00:00', '16:00:00', 1, 'Y'),
(3, 1, NULL, 1, '2018-09-14', '09:00:00', '10:00:00', NULL, 'N'),
(4, 2, NULL, 1, '2018-09-14', '15:00:00', '16:00:00', NULL, 'N'),
(8, 2, 1, 1, '2018-09-18', '15:00:00', '16:00:00', 7, 'Y'),
(7, 1, NULL, 1, '2018-09-18', '09:00:00', '10:00:00', NULL, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `users_role_plans_reports`
--

CREATE TABLE `users_role_plans_reports` (
  `report_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `header_id` int(11) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `incident_date` varchar(50) NOT NULL,
  `incident_time` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `direct_reason` varchar(5000) NOT NULL,
  `indirect_reason` varchar(5000) NOT NULL,
  `root_reason` varchar(5000) NOT NULL,
  `action` varchar(5000) NOT NULL,
  `recommendation` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_plans_reports`
--

INSERT INTO `users_role_plans_reports` (`report_id`, `plan_id`, `header_id`, `reference_number`, `title`, `datetime`, `incident_date`, `incident_time`, `user_id`, `description`, `direct_reason`, `indirect_reason`, `root_reason`, `action`, `recommendation`) VALUES
(1, 1, 1, 'HSE/2018/09/13/0001', 'title', '2018-09-13 04:06:49', '2018-09-13', '4:5', 1, 'description', 'direct reason', 'indirect reason', 'root reason', 'action', 'recommend'),
(3, 2, 2, 'HSE/2018/09/13/0002', 'title 2', '2018-09-13 20:02:19', '2018-09-21', '20:0', 49, 'desc 2', 'direct res 2', 'indirect res 2', 'root res 2', 'action 2', 'recommend 2'),
(4, 2, 8, 'HSE/2018/09/18/0004', 'Inspection', '2018-09-18 08:47:01', '2018-09-18', '8:44', 1, 'Description', 'Direct reason', 'indirect reason', 'root reason', 'immediately action', 'recommend');

-- --------------------------------------------------------

--
-- Table structure for table `users_role_plans_reports_finals`
--

CREATE TABLE `users_role_plans_reports_finals` (
  `report_id` int(11) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `incident_date` varchar(50) NOT NULL,
  `incident_time` varchar(50) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `direct_reason` varchar(5000) NOT NULL,
  `indirect_reason` varchar(5000) NOT NULL,
  `root_reason` varchar(5000) NOT NULL,
  `action` varchar(5000) NOT NULL,
  `recommendation` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_plans_reports_finals`
--

INSERT INTO `users_role_plans_reports_finals` (`report_id`, `reference_number`, `title`, `datetime`, `incident_date`, `incident_time`, `description`, `direct_reason`, `indirect_reason`, `root_reason`, `action`, `recommendation`) VALUES
(1, 'HSE/2018/09/13/0001', 'title,title 2', '2018-09-13 20:02:21', '2018-09-13,2018-09-21', '4:5,20:0', 'description,desc 2', 'direct reason,direct res 2', 'indirect reason,indirect res 2', 'root reason,root res 2', 'action,action 2', 'recommend,recommend 2');

-- --------------------------------------------------------

--
-- Table structure for table `users_role_plans_reports_finals_origins`
--

CREATE TABLE `users_role_plans_reports_finals_origins` (
  `origin_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `origin_report_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_plans_reports_finals_origins`
--

INSERT INTO `users_role_plans_reports_finals_origins` (`origin_id`, `report_id`, `origin_report_id`) VALUES
(1, 1, 1),
(2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_role_plans_reports_images`
--

CREATE TABLE `users_role_plans_reports_images` (
  `image_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_plans_reports_images`
--

INSERT INTO `users_role_plans_reports_images` (`image_id`, `report_id`, `image`) VALUES
(1, 1, '0.9303211450263734.jpg'),
(2, 2, '0.9369299501372195.jpg'),
(3, 3, '0.8709747827065814.jpg'),
(4, 4, '0.06867074902812864.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users_role_plans_triggers`
--

CREATE TABLE `users_role_plans_triggers` (
  `trigger_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `triggers` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_plans_triggers`
--

INSERT INTO `users_role_plans_triggers` (`trigger_id`, `title`, `triggers`) VALUES
(1, 'Shift', 1),
(2, 'Day', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_shifts`
--

CREATE TABLE `users_shifts` (
  `shift_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_shifts`
--

INSERT INTO `users_shifts` (`shift_id`, `title`) VALUES
(1, 'General'),
(2, 'Shift A'),
(3, 'Shift B'),
(4, 'Shift C');

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans`
--

CREATE TABLE `users_special_plans` (
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `end_date` varchar(50) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `notified_start` char(1) NOT NULL DEFAULT 'N',
  `notified_end` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_special_plans`
--

INSERT INTO `users_special_plans` (`plan_id`, `user_id`, `created_by`, `start_date`, `end_date`, `datetime`, `status`, `notified_start`, `notified_end`) VALUES
(1, 1, 1, '2018-08-01', '2018-09-05', '2018-08-29', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans_check_lists`
--

CREATE TABLE `users_special_plans_check_lists` (
  `check_list_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_special_plans_check_lists`
--

INSERT INTO `users_special_plans_check_lists` (`check_list_id`, `plan_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans_check_lists_answers`
--

CREATE TABLE `users_special_plans_check_lists_answers` (
  `answer_id` int(11) NOT NULL,
  `check_list_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` char(1) NOT NULL DEFAULT 'N',
  `comment` varchar(1000) DEFAULT NULL,
  `datetime` varchar(50) DEFAULT NULL,
  `violation_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_special_plans_check_lists_answers`
--

INSERT INTO `users_special_plans_check_lists_answers` (`answer_id`, `check_list_id`, `question_id`, `answer`, `comment`, `datetime`, `violation_id`) VALUES
(1, 1, 1, 'Y', 'submitted a violation', '2018-09-17 13:57:44', 1),
(2, 1, 2, 'N', NULL, NULL, NULL),
(3, 1, 3, 'N', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans_check_lists_extensions_requests`
--

CREATE TABLE `users_special_plans_check_lists_extensions_requests` (
  `request_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `check_list_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `extended_date` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `approved` char(1) NOT NULL DEFAULT 'N',
  `status` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans_check_lists_questions`
--

CREATE TABLE `users_special_plans_check_lists_questions` (
  `question_id` int(11) NOT NULL,
  `check_list_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `area_sub_id` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_special_plans_check_lists_questions`
--

INSERT INTO `users_special_plans_check_lists_questions` (`question_id`, `check_list_id`, `parent_id`, `area_id`, `area_sub_id`, `question`, `latitude`, `longitude`) VALUES
(1, 1, 14, 1, 2, 'Suspected gatherings.', '6.9422556', '79.8376269'),
(2, 1, 15, 1, 2, 'Unauthorized personnel. Inform security', '6.9422556', '79.8376269'),
(3, 1, 25, 1, 2, 'Availability and vigilance of back gate and front guard room security.', '6.9422556', '79.8376269');

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans_check_lists_verifications`
--

CREATE TABLE `users_special_plans_check_lists_verifications` (
  `verification_id` int(11) NOT NULL,
  `check_list_id` int(11) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `acceptable` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans_check_lists_violations`
--

CREATE TABLE `users_special_plans_check_lists_violations` (
  `violation_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_special_plans_check_lists_violations`
--

INSERT INTO `users_special_plans_check_lists_violations` (`violation_id`, `answer_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_special_plans_check_lists_violations_images`
--

CREATE TABLE `users_special_plans_check_lists_violations_images` (
  `image_id` int(11) NOT NULL,
  `violation_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_special_plans_check_lists_violations_images`
--

INSERT INTO `users_special_plans_check_lists_violations_images` (`image_id`, `violation_id`, `image`) VALUES
(1, 1, '0.1240003125366883.jpg'),
(2, 1, '0.817522193986052.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `violation_id` int(11) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `direct_reason` varchar(1000) NOT NULL,
  `indirect_reason` varchar(1000) NOT NULL,
  `root_reason` varchar(1000) DEFAULT NULL,
  `immediate_action` varchar(5000) DEFAULT NULL,
  `recommendation` varchar(5000) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `violation_date` varchar(50) NOT NULL,
  `violation_time` varchar(50) NOT NULL,
  `datetime` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `equipements` varchar(255) NOT NULL DEFAULT 'No',
  `company` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `action` varchar(11) DEFAULT NULL,
  `status_middle` char(1) NOT NULL DEFAULT 'N',
  `comments` varchar(255) DEFAULT NULL,
  `token_base` varchar(40) NOT NULL,
  `token` varchar(255) NOT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`violation_id`, `reference_number`, `direct_reason`, `indirect_reason`, `root_reason`, `immediate_action`, `recommendation`, `type_id`, `violation_date`, `violation_time`, `datetime`, `created_by`, `user_id`, `equipements`, `company`, `department`, `company_id`, `department_id`, `status`, `action`, `status_middle`, `comments`, `token_base`, `token`, `longitude`, `latitude`, `address`) VALUES
(1, 'HSE/2018/09/13/0001', 'a violence', 'a mistake', NULL, NULL, NULL, 4, '2018-08-31', '11:15', '2018-08-31 11:14:12', 1, 1, 'vehicles', 'CICT', 'IT', 2, 1, 'Y', '3', 'Y', 'I have read the content of violation report carefully and here by I\'m submitting the following information for your consideration.', '6689', 'eyJpdiI6IlJYUmtXbHpKZ2o2UDA3b3VhbkUrdkE9PSIsInZhbHVlIjoiejVXa2JoS2FkV0JBT1FPM2t6aWRvZz09IiwibWFjIjoiOGIxODFiY2YxYTViMGFmNDU5ODNhNGQ1NmY1ZjVmYmE5NmM4ODVkYTNkM2UxYjdiODIwMTY0YTJmNjZlNWIyNCJ9', '79.8377564', '6.9422312', 'Unnamed Road, Colombo, Western Province, Sri Lanka'),
(2, 'HSE/2018/09/13/0002', 'a violation', 'a mistake', NULL, NULL, NULL, 4, '2018-08-31', '11:14', '2018-09-04 04:43:17', 1, 1, 'vehicles', 'CICT', 'IT', 2, 1, 'N', NULL, 'N', NULL, '5714', 'eyJpdiI6IkVEckhjSGFcL0ZSUWp6a0pZQ0ZjTHR3PT0iLCJ2YWx1ZSI6Ikl0UVdvQksyeWE0Wk53OUlYV1hZMFE9PSIsIm1hYyI6ImY4NmM3YWI1YjUwM2QzYjIyNWM3ZjU5OTY4NWU3ZDEyYjJiZTMwMjM0NDRjNjBiMDAyYTc5MzllNjI5OWVkYWYifQ==', '79.8379088', '6.942216', 'Unnamed Road, Colombo, Western Province, Sri Lanka'),
(3, 'HSE/2018/09/13/0003', 'a violation', 'a mistake', NULL, NULL, NULL, 4, '2018-09-04', '11:49', '2018-09-04 06:21:14', 1, 1, 'vehicles', 'CICT', 'IT', 2, 1, 'N', NULL, 'N', NULL, '6104', 'eyJpdiI6IlNuejFLN1NXajNpRG9JRmVZNitqdUE9PSIsInZhbHVlIjoick1SVmNKSzZaV1JGalpTS1dnazNcL2c9PSIsIm1hYyI6IjQxNjExODFhYjFhZTU5MjNlODBjMDJiZjY0OGM0MDQ5YzU1NTM2MzEzMTNlMWEyNGE1NTQxNzE3MTQxNGQ5NDgifQ==', '79.837923', '6.942216', 'Unnamed Road, Colombo, Western Province, Sri Lanka'),
(25, 'HSE/2018/09/18/0004', 'direct reason', 'indirect reason', 'root reason', 'immediately action', 'recommend', 4, '2018-09-18', '8:58', '2018-09-18 08:59:50', 1, 1, 'No', 'CICT', 'IT', 2, 1, 'N', NULL, 'N', NULL, '9577', 'eyJpdiI6InhQUDBkMUw3UzkyVFwvZkF0MmlGNTJ3PT0iLCJ2YWx1ZSI6IklZVnRsaFwvZHdzVkZwRG5UdUJ0aW93PT0iLCJtYWMiOiJmNDY1YzkxZTZkM2ZhM2NlNzc4YzAwMTVmN2ZhN2JhZTdhZjJlZjRhN2E5Y2MyMGJjMzRmYjVkYmZiYjljZGI0In0=', '79.8379267', '6.9422119', 'Colombo Port Helipad, Colombo, Western Province, Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `violations_actions`
--

CREATE TABLE `violations_actions` (
  `action_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violations_actions`
--

INSERT INTO `violations_actions` (`action_id`, `title`) VALUES
(1, 'Verbal Warning'),
(2, 'Salary Deduction'),
(3, 'Suspension'),
(4, 'Service Termination');

-- --------------------------------------------------------

--
-- Table structure for table `violations_images`
--

CREATE TABLE `violations_images` (
  `image_id` int(11) NOT NULL,
  `violation_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violations_images`
--

INSERT INTO `violations_images` (`image_id`, `violation_id`, `image`) VALUES
(1, 1, '0.7886942856422013.jpg'),
(2, 2, '0.7952509554236804.jpg'),
(3, 3, '0.600193372089601.jpg'),
(18, 25, '0.28861886096409617.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `hazards`
--
ALTER TABLE `hazards`
  ADD PRIMARY KEY (`hazard_id`);

--
-- Indexes for table `hazards_images`
--
ALTER TABLE `hazards_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `hazards_inspections_extensions_requests`
--
ALTER TABLE `hazards_inspections_extensions_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD UNIQUE KEY `hazard_id` (`hazard_id`);

--
-- Indexes for table `hazard_areas`
--
ALTER TABLE `hazard_areas`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `hazard_areas_coordinates`
--
ALTER TABLE `hazard_areas_coordinates`
  ADD PRIMARY KEY (`coordinate_id`);

--
-- Indexes for table `hazard_areas_subs`
--
ALTER TABLE `hazard_areas_subs`
  ADD PRIMARY KEY (`area_sub_id`);

--
-- Indexes for table `hazard_areas_subs_coordinates`
--
ALTER TABLE `hazard_areas_subs_coordinates`
  ADD PRIMARY KEY (`coordinate_id`);

--
-- Indexes for table `hazard_areas_subs_types`
--
ALTER TABLE `hazard_areas_subs_types`
  ADD PRIMARY KEY (`sub_type_id`);

--
-- Indexes for table `hazard_levels`
--
ALTER TABLE `hazard_levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `hazard_types`
--
ALTER TABLE `hazard_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `messages_notices`
--
ALTER TABLE `messages_notices`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `messages_notices_mails`
--
ALTER TABLE `messages_notices_mails`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`priority_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_index` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_index` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `nic` (`nic`),
  ADD UNIQUE KEY `employee_number` (`employee_number`);

--
-- Indexes for table `users_designations`
--
ALTER TABLE `users_designations`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `users_emergency_plans`
--
ALTER TABLE `users_emergency_plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `users_emergency_plans_routes`
--
ALTER TABLE `users_emergency_plans_routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `users_emergency_plans_tasks`
--
ALTER TABLE `users_emergency_plans_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `users_grades`
--
ALTER TABLE `users_grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `users_levels`
--
ALTER TABLE `users_levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `users_mailboxes`
--
ALTER TABLE `users_mailboxes`
  ADD PRIMARY KEY (`mail_id`);

--
-- Indexes for table `users_mailboxes_attachments`
--
ALTER TABLE `users_mailboxes_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `users_privileges`
--
ALTER TABLE `users_privileges`
  ADD PRIMARY KEY (`privilege_id`);

--
-- Indexes for table `users_role_plans`
--
ALTER TABLE `users_role_plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `users_role_plans_headers`
--
ALTER TABLE `users_role_plans_headers`
  ADD PRIMARY KEY (`header_id`);

--
-- Indexes for table `users_role_plans_reports`
--
ALTER TABLE `users_role_plans_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `users_role_plans_reports_finals`
--
ALTER TABLE `users_role_plans_reports_finals`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `users_role_plans_reports_finals_origins`
--
ALTER TABLE `users_role_plans_reports_finals_origins`
  ADD PRIMARY KEY (`origin_id`);

--
-- Indexes for table `users_role_plans_reports_images`
--
ALTER TABLE `users_role_plans_reports_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `users_role_plans_triggers`
--
ALTER TABLE `users_role_plans_triggers`
  ADD PRIMARY KEY (`trigger_id`);

--
-- Indexes for table `users_shifts`
--
ALTER TABLE `users_shifts`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indexes for table `users_special_plans`
--
ALTER TABLE `users_special_plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `users_special_plans_check_lists`
--
ALTER TABLE `users_special_plans_check_lists`
  ADD PRIMARY KEY (`check_list_id`);

--
-- Indexes for table `users_special_plans_check_lists_answers`
--
ALTER TABLE `users_special_plans_check_lists_answers`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `users_special_plans_check_lists_extensions_requests`
--
ALTER TABLE `users_special_plans_check_lists_extensions_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `users_special_plans_check_lists_questions`
--
ALTER TABLE `users_special_plans_check_lists_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `users_special_plans_check_lists_verifications`
--
ALTER TABLE `users_special_plans_check_lists_verifications`
  ADD PRIMARY KEY (`verification_id`);

--
-- Indexes for table `users_special_plans_check_lists_violations`
--
ALTER TABLE `users_special_plans_check_lists_violations`
  ADD PRIMARY KEY (`violation_id`);

--
-- Indexes for table `users_special_plans_check_lists_violations_images`
--
ALTER TABLE `users_special_plans_check_lists_violations_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`violation_id`);

--
-- Indexes for table `violations_actions`
--
ALTER TABLE `violations_actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `violations_images`
--
ALTER TABLE `violations_images`
  ADD PRIMARY KEY (`image_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `hazards`
--
ALTER TABLE `hazards`
  MODIFY `hazard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hazards_images`
--
ALTER TABLE `hazards_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hazards_inspections_extensions_requests`
--
ALTER TABLE `hazards_inspections_extensions_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hazard_areas`
--
ALTER TABLE `hazard_areas`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hazard_areas_coordinates`
--
ALTER TABLE `hazard_areas_coordinates`
  MODIFY `coordinate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `hazard_areas_subs`
--
ALTER TABLE `hazard_areas_subs`
  MODIFY `area_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `hazard_areas_subs_coordinates`
--
ALTER TABLE `hazard_areas_subs_coordinates`
  MODIFY `coordinate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `hazard_areas_subs_types`
--
ALTER TABLE `hazard_areas_subs_types`
  MODIFY `sub_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `hazard_levels`
--
ALTER TABLE `hazard_levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hazard_types`
--
ALTER TABLE `hazard_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `messages_notices`
--
ALTER TABLE `messages_notices`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `messages_notices_mails`
--
ALTER TABLE `messages_notices_mails`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `priority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `users_designations`
--
ALTER TABLE `users_designations`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users_emergency_plans`
--
ALTER TABLE `users_emergency_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users_emergency_plans_routes`
--
ALTER TABLE `users_emergency_plans_routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `users_emergency_plans_tasks`
--
ALTER TABLE `users_emergency_plans_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `users_grades`
--
ALTER TABLE `users_grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users_levels`
--
ALTER TABLE `users_levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users_mailboxes`
--
ALTER TABLE `users_mailboxes`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_mailboxes_attachments`
--
ALTER TABLE `users_mailboxes_attachments`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_privileges`
--
ALTER TABLE `users_privileges`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=630;
--
-- AUTO_INCREMENT for table `users_role_plans`
--
ALTER TABLE `users_role_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_role_plans_headers`
--
ALTER TABLE `users_role_plans_headers`
  MODIFY `header_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users_role_plans_reports`
--
ALTER TABLE `users_role_plans_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_role_plans_reports_finals`
--
ALTER TABLE `users_role_plans_reports_finals`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_role_plans_reports_finals_origins`
--
ALTER TABLE `users_role_plans_reports_finals_origins`
  MODIFY `origin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users_role_plans_reports_images`
--
ALTER TABLE `users_role_plans_reports_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_role_plans_triggers`
--
ALTER TABLE `users_role_plans_triggers`
  MODIFY `trigger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_shifts`
--
ALTER TABLE `users_shifts`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_special_plans`
--
ALTER TABLE `users_special_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_special_plans_check_lists`
--
ALTER TABLE `users_special_plans_check_lists`
  MODIFY `check_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_special_plans_check_lists_answers`
--
ALTER TABLE `users_special_plans_check_lists_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users_special_plans_check_lists_extensions_requests`
--
ALTER TABLE `users_special_plans_check_lists_extensions_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_special_plans_check_lists_questions`
--
ALTER TABLE `users_special_plans_check_lists_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users_special_plans_check_lists_verifications`
--
ALTER TABLE `users_special_plans_check_lists_verifications`
  MODIFY `verification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_special_plans_check_lists_violations`
--
ALTER TABLE `users_special_plans_check_lists_violations`
  MODIFY `violation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_special_plans_check_lists_violations_images`
--
ALTER TABLE `users_special_plans_check_lists_violations_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `violation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `violations_actions`
--
ALTER TABLE `violations_actions`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `violations_images`
--
ALTER TABLE `violations_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
