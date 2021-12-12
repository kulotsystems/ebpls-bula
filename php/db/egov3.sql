-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2021 at 07:37 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `egov3`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationType` varchar(16) NOT NULL,
  `PaymentModeID` tinyint(3) UNSIGNED ZEROFILL NOT NULL DEFAULT 001,
  `BusinessID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `DTIRegNumber` varchar(64) NOT NULL,
  `DTIRegDate` date NOT NULL,
  `CDARegNumber` varchar(64) NOT NULL,
  `CDARegDate` date NOT NULL,
  `SECRegNumber` varchar(64) NOT NULL,
  `SECRegDate` date NOT NULL,
  `ActiveRegNumber` varchar(16) NOT NULL DEFAULT 'DTI',
  `TotalMaleEmployees` smallint(6) NOT NULL DEFAULT 0,
  `TotalMaleEmployeesFromLGU` smallint(6) NOT NULL DEFAULT 0,
  `TotalFemaleEmployees` smallint(6) NOT NULL DEFAULT 0,
  `TotalFemaleEmployeesFromLGU` smallint(6) NOT NULL DEFAULT 0,
  `BusinessAreaSqM` double NOT NULL DEFAULT 0,
  `IsRenting` tinyint(1) NOT NULL DEFAULT 0,
  `LessorFullName` varchar(64) NOT NULL,
  `LessorAddress` varchar(256) NOT NULL,
  `LessorContactNum` varchar(16) NOT NULL,
  `LessorEmail` varchar(64) NOT NULL,
  `MonthlyRental` double NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`ID`, `ApplicationType`, `PaymentModeID`, `BusinessID`, `DTIRegNumber`, `DTIRegDate`, `CDARegNumber`, `CDARegDate`, `SECRegNumber`, `SECRegDate`, `ActiveRegNumber`, `TotalMaleEmployees`, `TotalMaleEmployeesFromLGU`, `TotalFemaleEmployees`, `TotalFemaleEmployeesFromLGU`, `BusinessAreaSqM`, `IsRenting`, `LessorFullName`, `LessorAddress`, `LessorContactNum`, `LessorEmail`, `MonthlyRental`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000003, 'NEW', 001, 0000000003, '123456', '2021-08-06', '', '2021-10-08', '', '2021-10-08', 'DTI', 3, 3, 3, 3, 64, 0, '', '', '', '', 0, '2021-10-08 05:27:12', '2021-10-08 05:30:38'),
(0000000004, 'NEW', 001, 0000000004, '000-000', '2021-10-08', '', '2021-10-08', '', '2021-10-08', 'DTI', 4, 4, 4, 4, 64, 0, '', '', '', '', 0, '2021-10-08 05:43:35', '2021-10-08 05:45:29'),
(0000000005, 'NEW', 001, 0000000005, '000-000', '2021-10-08', '', '2021-10-08', '', '2021-10-08', 'DTI', 20, 20, 20, 20, 0, 0, '', '', '', '', 0, '2021-10-08 05:46:24', '2021-10-08 05:47:14'),
(0000000006, 'RENEWAL', 001, 0000000006, '000-000', '2021-10-08', '', '2021-10-08', '', '2021-10-08', 'DTI', 4, 4, 4, 4, 0, 0, '', '', '', '', 0, '2021-10-08 05:48:14', '2021-10-08 05:49:40'),
(0000000007, 'NEW', 001, 0000000007, '', '2021-10-08', '', '2021-10-08', '', '2021-10-08', 'DTI', 0, 0, 0, 0, 0, 0, '', '', '', '', 0, '2021-10-08 05:53:03', '2021-10-08 05:53:03'),
(0000000008, 'RENEWAL', 001, 0000000008, '', '2021-12-12', '', '2021-12-12', '', '2021-12-12', 'DTI', 0, 0, 0, 0, 0, 0, '', '', '', '', 0, '2021-12-12 09:32:15', '2021-12-12 09:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `applications_approval`
--

CREATE TABLE `applications_approval` (
  `CitizenID` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `IsApproved` tinyint(1) NOT NULL DEFAULT 0,
  `Remarks` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications_approval`
--

INSERT INTO `applications_approval` (`CitizenID`, `ApplicationID`, `IsApproved`, `Remarks`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000004, 0000000003, 1, '', '2021-10-08 05:30:55', '2021-10-08 05:30:55'),
(0000000004, 0000000004, 0, '', '2021-10-08 05:46:01', '2021-10-08 05:46:01'),
(0000000004, 0000000004, 1, '', '2021-10-08 05:46:11', '2021-10-08 05:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `applications_foredit`
--

CREATE TABLE `applications_foredit` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `IsPresent` tinyint(1) NOT NULL DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications_foredit`
--

INSERT INTO `applications_foredit` (`ID`, `ApplicationID`, `IsPresent`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000003, 0000000003, 0, '2021-10-08 05:27:12', '2021-10-08 05:30:45'),
(0000000004, 0000000004, 0, '2021-10-08 05:43:35', '2021-10-08 05:45:32'),
(0000000005, 0000000005, 0, '2021-10-08 05:46:24', '2021-10-08 05:47:32'),
(0000000006, 0000000006, 0, '2021-10-08 05:48:14', '2021-10-08 05:49:43'),
(0000000007, 0000000007, 1, '2021-10-08 05:53:03', '2021-10-08 05:53:03'),
(0000000008, 0000000008, 1, '2021-12-12 09:32:15', '2021-12-12 09:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `applications_forinvoice`
--

CREATE TABLE `applications_forinvoice` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `IsPresent` tinyint(1) NOT NULL DEFAULT 1,
  `VerificationData` text NOT NULL,
  `FEES_PaymentInvoiceID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications_forinvoice`
--

INSERT INTO `applications_forinvoice` (`ID`, `ApplicationID`, `IsPresent`, `VerificationData`, `FEES_PaymentInvoiceID`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000002, 0000000003, 0, '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":9,\"citizen_avatar\":\"female-02.JPG\",\"citizen_full_name\":\"HELENA L. AGUILAR\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"AGUILAR BAKERY\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"123456\",\"dti_date\":\"August 6, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 2, Itangon, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":3,\"total_male_emp_lgu\":3,\"total_female_emp\":3,\"total_female_emp_lgu\":3,\"total_employees\":6,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":4,\"business_line_id\":56,\"business_line_title\":\"Bakeshop\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":50000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:30 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:39 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:30:55\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Bakeshop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01.jpg\",\"validation_code\":\"1267\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02.jpg\",\"validation_code\":\"5623\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-03.jpg\",\"validation_code\":\"7893\",\"is_verified\":1}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-04.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}}]}', 0000006762, '2021-10-08 05:39:58', '2021-10-08 05:42:26'),
(0000000003, 0000000004, 1, '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":6,\"citizen_avatar\":\"male-04.JPG\",\"citizen_full_name\":\"ROANO L. BARERRA\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BARERRA BARBERS\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 2\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 4, Causip, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":6,\"business_line_id\":51,\"business_line_title\":\"Barber Shop\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":100000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:45 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:45 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:46:11\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Barber Shop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_1.jpg\",\"validation_code\":\"1765\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_1.jpg\",\"validation_code\":\"7834\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', 0000006763, '2021-10-08 05:46:13', '2021-10-08 05:46:13'),
(0000000004, 0000000006, 0, '{\"application\":{\"application_type\":\"RENEWAL\",\"citizen_id\":5,\"citizen_avatar\":\"male-03.JPG\",\"citizen_full_name\":\"GORDON D. BLANCO\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BLANCO EGG RETAIL\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"ZONE 1\",\"barangay_id\":8159,\"barangay_address\":\"Caorasan, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Casugad, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":10,\"business_line_id\":70,\"business_line_title\":\"Egg Retailer\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":0,\"gross_sales_essential\":50000,\"gross_sales_non_essential\":50000,\"gross_sales_combined\":100000,\"business_tax_formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0.01<\\/span>  to <span class=\'sp-currency sp-amount\'>400000<\\/span><br>Business Tax is <span class=\'sp-amount\'>2<\\/span>% of GROSS SALES (NON-ESSENTIAL).\",\"business_tax\":1000}],\"total_business_tax\":1000,\"total_asset\":100000,\"date_created\":\"October 8, 2021 &middot; 01:49 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:50 PM\"},\"business_size\":{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},\"verifiers\":[],\"tax_penalty\":{\"percentage\":25,\"amount\":250,\"effectivity_start\":\"January 21\",\"effectivity_end\":\"April 30\",\"tax_with_penalty\":1250},\"fees\":{\"fee_classifications\":[{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Egg Retailer)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":245},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_2.jpg\",\"validation_code\":\"5634\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_2.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-01_3.jpg\",\"validation_code\":\"6789\",\"is_verified\":1}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-02_3.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}}]}', 0000006764, '2021-10-08 05:50:53', '2021-10-08 05:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `applications_forinvoice_tax_invoices`
--

CREATE TABLE `applications_forinvoice_tax_invoices` (
  `ApplicationForInvoiceID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `PaymentInvoiceID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications_forinvoice_tax_invoices`
--

INSERT INTO `applications_forinvoice_tax_invoices` (`ApplicationForInvoiceID`, `PaymentInvoiceID`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000002, 0000000000, '2021-10-08 05:39:58', '2021-10-08 05:39:58'),
(0000000003, 0000000000, '2021-10-08 05:46:13', '2021-10-08 05:46:13'),
(0000000004, 0000006765, '2021-10-08 05:50:53', '2021-10-08 05:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `applications_forpermit`
--

CREATE TABLE `applications_forpermit` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `IsPresent` tinyint(1) NOT NULL DEFAULT 1,
  `PermitFile` varchar(64) NOT NULL,
  `PermitNumberPrefix` varchar(16) NOT NULL,
  `PermitNumber` varchar(16) NOT NULL,
  `PlateNumberPrefix` varchar(16) NOT NULL,
  `PlateNumber` varchar(16) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications_forpermit`
--

INSERT INTO `applications_forpermit` (`ID`, `ApplicationID`, `IsPresent`, `PermitFile`, `PermitNumberPrefix`, `PermitNumber`, `PlateNumberPrefix`, `PlateNumber`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 0000000003, 1, '2021', 'AAI', '0001', 'AAI', '0001', '2021-10-08 05:42:26', '2021-10-08 05:42:26'),
(0000000002, 0000000006, 1, '2021', 'AAI', '0002', 'AAI', '0002', '2021-10-08 05:52:28', '2021-10-08 05:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `applications_forverification`
--

CREATE TABLE `applications_forverification` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `IsPresent` tinyint(1) NOT NULL DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications_forverification`
--

INSERT INTO `applications_forverification` (`ID`, `ApplicationID`, `IsPresent`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000002, 0000000003, 0, '2021-10-08 05:30:45', '2021-10-08 05:39:58'),
(0000000003, 0000000004, 0, '2021-10-08 05:45:32', '2021-10-08 05:46:13'),
(0000000004, 0000000005, 1, '2021-10-08 05:47:32', '2021-10-08 05:47:32'),
(0000000005, 0000000006, 0, '2021-10-08 05:49:43', '2021-10-08 05:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `applications_requirement`
--

CREATE TABLE `applications_requirement` (
  `ApplicationID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `RequirementID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Filename` varchar(128) NOT NULL,
  `ValidationCode` varchar(64) NOT NULL,
  `IsVerified` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications_requirement`
--

INSERT INTO `applications_requirement` (`ApplicationID`, `RequirementID`, `Filename`, `ValidationCode`, `IsVerified`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000003, 0000000007, 'doc-01.jpg', '1267', 1, '2021-10-08 05:39:49', '2021-10-08 05:39:49'),
(0000000003, 0000000006, 'doc-02.jpg', '5623', 1, '2021-10-08 05:39:49', '2021-10-08 05:39:49'),
(0000000003, 0000000005, 'doc-03.jpg', '7893', 1, '2021-10-08 05:42:26', '2021-10-08 05:42:26'),
(0000000003, 0000000001, 'doc-04.jpg', '3456', 1, '2021-10-08 05:42:26', '2021-10-08 05:42:26'),
(0000000004, 0000000007, 'doc-01_1.jpg', '1765', 1, '2021-10-08 05:46:01', '2021-10-08 05:46:01'),
(0000000004, 0000000006, 'doc-02_1.jpg', '7834', 1, '2021-10-08 05:46:01', '2021-10-08 05:46:01'),
(0000000006, 0000000007, 'doc-01_2.jpg', '5634', 1, '2021-10-08 05:50:07', '2021-10-08 05:50:07'),
(0000000006, 0000000006, 'doc-02_2.jpg', '3456', 1, '2021-10-08 05:50:07', '2021-10-08 05:50:07'),
(0000000006, 0000000005, 'doc-01_3.jpg', '6789', 1, '2021-10-08 05:52:28', '2021-10-08 05:52:28'),
(0000000006, 0000000001, 'doc-02_3.jpg', '3456', 1, '2021-10-08 05:52:28', '2021-10-08 05:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `CitizenID` bigint(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000000,
  `CorporateCitizenID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `CorporateFullname` varchar(64) NOT NULL,
  `CorporateAvatar` varchar(64) NOT NULL DEFAULT '_.jpg',
  `CorporateTIN` varchar(16) NOT NULL,
  `CorporateAddress` varchar(128) NOT NULL,
  `BusinessName` varchar(256) NOT NULL,
  `TradeName` varchar(256) NOT NULL,
  `BusinessTypeID` tinyint(3) UNSIGNED ZEROFILL NOT NULL DEFAULT 001,
  `StreetAddress` varchar(128) NOT NULL,
  `BrgyID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `TelNum` varchar(16) NOT NULL,
  `MobileNum` varchar(16) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`ID`, `CitizenID`, `CorporateCitizenID`, `CorporateFullname`, `CorporateAvatar`, `CorporateTIN`, `CorporateAddress`, `BusinessName`, `TradeName`, `BusinessTypeID`, `StreetAddress`, `BrgyID`, `TelNum`, `MobileNum`, `Email`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000003, 0000000009, 0000000000, '', '_.jpg', '', '', 'AGUILAR BAKERY', '', 001, 'Zone 1', 0000008172, '', '', '', '2021-10-08 05:27:12', '2021-10-08 05:30:38'),
(0000000004, 0000000006, 0000000000, '', '_.jpg', '', '', 'BARERRA BARBERS', '', 001, 'Zone 2', 0000008172, '', '', '', '2021-10-08 05:43:35', '2021-10-08 05:45:29'),
(0000000005, 0000000010, 0000000000, '', '_.jpg', '', '', 'PEREZ APPLIANCE', '', 001, 'Zone 1', 0000008174, '', '', '', '2021-10-08 05:46:24', '2021-10-08 05:47:31'),
(0000000006, 0000000005, 0000000000, '', '_.jpg', '', '', 'BLANCO EGG RETAIL', '', 001, 'ZONE 1', 0000008159, '', '', '', '2021-10-08 05:48:14', '2021-10-08 05:49:40'),
(0000000007, 0000000000, 0000000000, '', '_.jpg', '', '', '[business_name]', '', 001, '', 0000000000, '', '', '', '2021-10-08 05:53:03', '2021-10-08 05:53:03'),
(0000000008, 0000000000, 0000000000, '', '_.jpg', '', '', '[business_name]', '', 001, '', 0000000000, '', '', '', '2021-12-12 09:32:15', '2021-12-12 09:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `business_activities`
--

CREATE TABLE `business_activities` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `BusinessLineID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Units` int(11) NOT NULL DEFAULT 0,
  `Capitalization` double NOT NULL DEFAULT 0,
  `GrossSalesEssential` double NOT NULL DEFAULT 0,
  `GrossSalesNonEssential` double NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_activities`
--

INSERT INTO `business_activities` (`ID`, `ApplicationID`, `BusinessLineID`, `Units`, `Capitalization`, `GrossSalesEssential`, `GrossSalesNonEssential`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000004, 0000000003, 0000000056, 1, 50000, 0, 0, '2021-10-08 05:30:38', '2021-10-08 05:30:38'),
(0000000006, 0000000004, 0000000051, 0, 100000, 0, 0, '2021-10-08 05:45:29', '2021-10-08 05:45:29'),
(0000000008, 0000000005, 0000000177, 0, 500000, 0, 0, '2021-10-08 05:47:14', '2021-10-08 05:47:14'),
(0000000010, 0000000006, 0000000070, 1, 0, 50000, 50000, '2021-10-08 05:49:40', '2021-10-08 05:49:40'),
(0000000011, 0000000007, 0000000173, 0, 0, 0, 0, '2021-10-08 05:53:03', '2021-10-08 05:53:03'),
(0000000012, 0000000008, 0000000173, 0, 0, 0, 0, '2021-12-12 09:32:15', '2021-12-12 09:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `business_lines`
--

CREATE TABLE `business_lines` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `BusinessLine` varchar(96) NOT NULL,
  `Description` text NOT NULL,
  `NewTaxVariableID` int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000001,
  `RenewalTaxVariableID` int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000001,
  `NewTaxFixed` double NOT NULL DEFAULT 0,
  `RenewalTaxFixed` double NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_lines`
--

INSERT INTO `business_lines` (`ID`, `BusinessLine`, `Description`, `NewTaxVariableID`, `RenewalTaxVariableID`, `NewTaxFixed`, `RenewalTaxFixed`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'Sari-Sari Store', '', 0000000002, 0000000002, 0, 0, '2019-07-22 13:08:08', '2020-02-07 18:00:17'),
(0000000002, 'Rice Mill', '', 0000000001, 0000000001, 0, 0, '2019-07-22 17:19:31', '2019-07-22 17:19:54'),
(0000000003, 'Water Refilling Station', '', 0000000001, 0000000005, 0, 0, '2019-07-22 17:19:58', '2020-03-06 21:58:44'),
(0000000004, 'Gasoline Station', '', 0000000001, 0000000001, 0, 0, '2019-07-22 17:30:38', '2019-07-22 17:30:51'),
(0000000005, 'Internet Cafe', '', 0000000001, 0000000005, 0, 0, '2019-07-22 17:30:55', '2020-02-28 18:30:37'),
(0000000006, 'Banking', '', 0000000001, 0000000001, 0, 0, '2019-07-22 17:31:34', '2019-07-22 17:32:05'),
(0000000007, 'Microfinance', '', 0000000001, 0000000001, 0, 0, '2019-07-22 17:32:10', '2019-07-22 17:32:52'),
(0000000008, 'Hotel', '', 0000000001, 0000000005, 0, 0, '2019-07-22 17:33:15', '2020-03-11 17:23:40'),
(0000000009, 'Resort', '', 0000000001, 0000000005, 0, 0, '2019-07-22 17:33:55', '2020-02-28 17:36:55'),
(0000000010, 'Cooperative', '', 0000000001, 0000000001, 0, 0, '2019-07-22 17:34:13', '2019-07-22 17:35:20'),
(0000000011, 'Pawnshop', '', 0000000001, 0000000001, 0, 0, '2019-07-22 17:35:24', '2019-07-22 17:36:05'),
(0000000012, 'Funeral Services', '', 0000000001, 0000000005, 0, 0, '2019-07-22 17:36:16', '2020-02-19 18:07:41'),
(0000000013, 'Meat Vendor', '', 0000000001, 0000000001, 0, 0, '2019-07-22 17:47:37', '2019-07-22 17:57:38'),
(0000000014, 'Dry Goods', '', 0000000001, 0000000005, 0, 0, '2019-07-22 17:57:41', '2020-02-10 22:26:01'),
(0000000016, 'Boarding House', '', 0000000001, 0000000005, 0, 0, '2019-07-22 18:05:52', '2020-02-18 19:39:04'),
(0000000017, 'Rental Services', '', 0000000001, 0000000005, 0, 0, '2019-07-22 18:06:17', '2020-03-06 22:35:09'),
(0000000018, 'Apartment', '', 0000000001, 0000000001, 0, 0, '2019-07-22 18:06:32', '2019-07-22 18:06:42'),
(0000000020, 'Chainsaw Operator', '', 0000000001, 0000000005, 0, 0, '2019-07-22 22:17:20', '2020-02-19 18:50:48'),
(0000000021, 'Construction Supply', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:19:16', '2019-07-22 22:19:41'),
(0000000022, 'Educational Institution', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:19:54', '2019-07-22 22:20:08'),
(0000000023, 'Drugstore', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:20:37', '2019-07-22 22:20:49'),
(0000000024, 'Tailoring', '', 0000000001, 0000000005, 0, 0, '2019-07-22 22:47:00', '2020-02-19 19:32:07'),
(0000000025, 'Maritatas Store', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:47:22', '2019-07-22 22:47:49'),
(0000000026, 'Photocopying Services', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:48:00', '2019-07-22 22:48:13'),
(0000000027, 'Photographic Activities', '', 0000000001, 0000000005, 0, 0, '2019-07-22 22:48:17', '2020-02-19 18:43:13'),
(0000000028, 'Agrivet Supply', '', 0000000003, 0000000002, 0, 0, '2019-07-22 22:49:02', '2021-03-20 22:25:15'),
(0000000029, 'Poultry Supply', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:49:16', '2019-07-22 22:49:28'),
(0000000030, 'Hardware', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:49:51', '2019-07-22 22:50:00'),
(0000000031, 'Restaurant', '', 0000000001, 0000000005, 0, 0, '2019-07-22 22:50:13', '2020-02-19 21:17:19'),
(0000000032, 'Fastfood', '', 0000000001, 0000000005, 0, 0, '2019-07-22 22:50:29', '2020-03-10 18:36:55'),
(0000000033, 'Beauty Salon', '', 0000000001, 0000000005, 0, 0, '2019-07-22 22:50:41', '2020-02-19 17:45:20'),
(0000000034, 'Real Estate Lessors', '', 0000000001, 0000000005, 0, 0, '2019-07-22 22:51:18', '2020-02-18 19:34:40'),
(0000000035, 'Lending', '', 0000000001, 0000000001, 0, 0, '2019-07-22 22:51:30', '2021-03-07 20:19:12'),
(0000000036, 'Agricultural Supply', '', 0000000001, 0000000004, 0, 0, '2019-07-22 22:52:05', '2021-03-20 18:49:34'),
(0000000038, 'Pharmacy', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:08:02', '2019-07-23 00:08:13'),
(0000000040, 'Telecommunication Services', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:09:57', '2019-07-23 00:13:29'),
(0000000041, 'Mobile Phone Accessories', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:11:05', '2019-07-23 00:12:58'),
(0000000042, 'Repair Services', '', 0000000001, 0000000005, 0, 0, '2019-07-23 00:11:09', '2020-03-06 21:08:46'),
(0000000043, 'Space Rental', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:13:32', '2019-07-23 00:14:41'),
(0000000044, 'Hotel And Resort', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:14:52', '2019-07-23 00:15:11'),
(0000000045, 'Furniture Shop', '', 0000000001, 0000000005, 0, 0, '2019-07-23 00:15:14', '2020-02-28 22:09:18'),
(0000000046, 'Native Products', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:15:29', '2019-07-23 00:15:43'),
(0000000047, 'Meat Shop', '', 0000000001, 0000000005, 0, 0, '2019-07-23 00:15:46', '2020-02-19 21:12:35'),
(0000000048, 'Eatery', '', 0000000001, 0000000005, 0, 0, '2019-07-23 00:16:08', '2020-03-12 00:53:30'),
(0000000049, 'Carinderia', '', 0000000001, 0000000005, 0, 0, '2019-07-23 00:16:38', '2020-03-11 18:11:25'),
(0000000050, 'Fruit Vendor', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:16:53', '2019-07-23 00:17:09'),
(0000000051, 'Barber Shop', '', 0000000001, 0000000005, 0, 0, '2019-07-23 00:17:12', '2020-02-19 17:36:40'),
(0000000052, 'Refreshment Parlor', '', 0000000001, 0000000005, 0, 0, '2019-07-23 00:17:40', '2020-03-10 17:34:35'),
(0000000053, 'Jewelries', '', 0000000001, 0000000001, 0, 0, '2019-07-23 00:18:03', '2019-07-23 00:18:26'),
(0000000056, 'Bakeshop', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:38:57', '2019-07-23 16:39:09'),
(0000000057, 'Stell Works', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:42:22', '2019-07-23 16:42:34'),
(0000000058, 'Clinic', '', 0000000001, 0000000005, 0, 0, '2019-07-23 16:42:37', '2020-03-12 00:41:36'),
(0000000059, 'Construction & Supplies', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:43:02', '2019-07-23 16:43:19'),
(0000000060, 'Retail of fashion Accessories', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:43:38', '2019-07-23 16:43:46'),
(0000000061, 'Grinder', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:43:50', '2019-07-23 16:44:12'),
(0000000062, 'General Merchandise', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:44:17', '2019-07-23 16:44:43'),
(0000000063, 'Spare Parts', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:44:49', '2019-07-23 16:45:04'),
(0000000064, 'Motorcycle Parts', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:45:07', '2019-07-23 16:45:21'),
(0000000066, 'Engineering Services', '', 0000000001, 0000000005, 0, 0, '2019-07-23 16:47:59', '2020-02-28 17:50:10'),
(0000000067, 'Religious Matter', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:48:09', '2019-07-23 16:48:22'),
(0000000068, 'Planning and Design Construction', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:48:33', '2019-07-23 16:49:11'),
(0000000069, 'School Supplies', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:49:37', '2019-07-23 16:49:45'),
(0000000070, 'Egg Retailer', '', 0000000001, 0000000004, 0, 0, '2019-07-23 16:49:48', '2021-03-21 22:11:42'),
(0000000071, 'Supermarket', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:50:03', '2019-07-23 17:11:13'),
(0000000074, 'Poultry Farm', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:50:47', '2019-07-23 16:51:19'),
(0000000075, 'Rural Banking', '', 0000000001, 0000000001, 0, 0, '2019-07-23 16:53:24', '2019-07-23 16:53:32'),
(0000000077, 'Hospital', '', 0000000001, 0000000005, 0, 0, '2019-07-23 17:11:17', '2020-02-19 18:14:05'),
(0000000078, 'Transportation Terminal', '', 0000000001, 0000000005, 0, 0, '2019-07-23 17:11:33', '2020-03-06 22:24:02'),
(0000000079, 'Cell Sites', '', 0000000001, 0000000001, 0, 0, '2019-07-23 17:11:46', '2020-02-07 01:33:46'),
(0000000080, 'Trading', '', 0000000001, 0000000001, 0, 0, '2019-07-23 17:12:12', '2019-07-23 20:40:52'),
(0000000081, 'Contractor', '', 0000000001, 0000000001, 0, 0, '2020-02-07 17:17:30', '2020-02-07 17:17:39'),
(0000000082, 'Truck for Hire', '', 0000000001, 0000000005, 0, 0, '2020-02-07 17:42:27', '2020-03-11 23:59:38'),
(0000000083, 'Booking Outlet', '', 0000000001, 0000000005, 0, 0, '2020-02-07 17:45:03', '2020-03-11 18:09:07'),
(0000000084, 'Grocery', '', 0000000001, 0000000001, 0, 0, '2020-02-07 17:46:53', '2020-02-07 17:47:04'),
(0000000086, 'Fish Vendor', '', 0000000001, 0000000001, 0, 0, '2020-02-07 17:51:28', '2020-02-07 17:51:42'),
(0000000087, 'Fireworks Retailer', '', 0000000001, 0000000001, 0, 0, '2020-02-07 17:58:12', '2020-02-07 17:58:29'),
(0000000088, 'Computer Shop', '', 0000000001, 0000000005, 0, 0, '2020-02-07 22:48:19', '2020-02-19 17:47:04'),
(0000000089, 'Laundry Shop', '', 0000000001, 0000000005, 0, 0, '2020-02-07 22:48:56', '2020-02-19 18:23:22'),
(0000000090, 'Vulcanizing Shop', '', 0000000001, 0000000005, 0, 0, '2020-02-07 22:50:17', '2020-02-20 17:51:08'),
(0000000091, 'Training/Seminar', '', 0000000001, 0000000005, 0, 0, '2020-02-07 22:51:37', '2020-02-19 21:02:06'),
(0000000092, 'Cockpit', '', 0000000001, 0000000005, 0, 0, '2020-02-07 22:52:44', '2020-02-19 21:08:08'),
(0000000094, 'Memorial Park', '', 0000000001, 0000000005, 0, 0, '2020-02-07 22:56:22', '2020-02-28 17:28:44'),
(0000000096, 'Cellphone & Accessories', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:44:44', '2020-02-16 17:46:11'),
(0000000098, 'Footwear', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:46:58', '2020-02-16 17:47:09'),
(0000000099, 'Boutique', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:48:00', '2020-02-16 17:48:12'),
(0000000101, 'Plastic And Other Goods', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:48:40', '2020-02-16 17:49:16'),
(0000000102, 'Coconut & Rice Grinder', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:49:27', '2020-02-16 17:49:42'),
(0000000103, 'Building Rental', '', 0000000001, 0000000005, 0, 0, '2020-02-16 17:50:04', '2020-03-06 19:17:17'),
(0000000104, 'Dormitory', '', 0000000001, 0000000005, 0, 0, '2020-02-16 17:50:53', '2020-03-06 19:31:01'),
(0000000105, 'Spiritual Matters', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:53:28', '2020-02-16 17:53:41'),
(0000000106, 'Buy & Sell', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:54:08', '2020-02-16 17:54:39'),
(0000000107, 'LPG Station', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:55:38', '2020-02-16 17:55:46'),
(0000000109, 'Kitchen Ware Rental', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:56:29', '2020-02-16 17:56:42'),
(0000000110, 'Technical, Vocational,Training and Assessment Center', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:57:09', '2020-02-16 17:57:13'),
(0000000111, 'Optical Clinic', '', 0000000001, 0000000005, 0, 0, '2020-02-16 17:57:28', '2020-02-28 18:58:31'),
(0000000113, 'Retail of Generic Medicine', '', 0000000001, 0000000001, 0, 0, '2020-02-16 17:58:49', '2020-02-16 17:59:09'),
(0000000114, 'Agri-Machine and Parts', '', 0000000002, 0000000001, 0, 0, '2020-02-16 17:59:26', '2021-12-12 11:15:40'),
(0000000115, 'Made to Order Lechon', '', 0000000001, 0000000005, 0, 0, '2020-02-16 17:59:44', '2020-02-20 16:50:10'),
(0000000116, 'Frozen Meat Products', '', 0000000001, 0000000005, 0, 0, '2020-02-16 18:00:48', '2020-03-11 16:53:44'),
(0000000117, 'Retail', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:01:17', '2020-02-16 18:01:21'),
(0000000118, 'Photocopy Center', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:01:48', '2020-02-16 18:02:00'),
(0000000119, 'Rice Retailer', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:02:37', '2020-02-16 18:02:47'),
(0000000120, 'Toy Store', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:03:24', '2020-02-16 18:03:30'),
(0000000121, 'Retailer of Agricultural Supply', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:03:57', '2020-02-16 18:04:27'),
(0000000122, 'Retailer of Agriculture Enterprises', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:04:32', '2020-02-16 18:04:55'),
(0000000123, 'Soft Ice Cream', '', 0000000001, 0000000005, 0, 0, '2020-02-16 18:05:00', '2020-03-11 17:08:49'),
(0000000124, 'Steel Work', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:05:28', '2020-02-16 18:05:43'),
(0000000125, 'Panciteria', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:05:52', '2020-02-16 18:06:15'),
(0000000126, 'Mini Grocery', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:06:17', '2020-02-16 18:06:24'),
(0000000127, 'Retail Sales In Specialized Store', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:06:27', '2020-02-16 18:06:56'),
(0000000128, 'Pili Nuts', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:07:01', '2020-02-16 18:07:07'),
(0000000129, 'Furniture', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:07:16', '2020-02-16 18:07:19'),
(0000000130, 'Coco Lumber', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:07:22', '2020-02-16 18:08:11'),
(0000000131, 'Health Service', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:08:22', '2020-02-16 18:08:37'),
(0000000132, 'Maritatas', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:08:42', '2020-02-16 18:08:59'),
(0000000133, 'Retail of Textile', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:09:06', '2020-02-16 18:09:25'),
(0000000134, 'Pre-School', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:09:12', '2020-02-16 18:09:38'),
(0000000135, 'Social Development', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:09:40', '2020-02-16 18:09:46'),
(0000000136, 'San Miguel Beer Dealer', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:09:54', '2020-02-16 18:10:05'),
(0000000137, 'Auto Spare Parts And Accessories', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:10:39', '2020-02-16 18:10:42'),
(0000000138, 'Motor Parts And Accessories', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:11:01', '2020-02-16 18:11:04'),
(0000000139, 'Pizza', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:11:13', '2020-02-16 18:11:15'),
(0000000140, 'Chainsaw Processor', '', 0000000001, 0000000005, 0, 0, '2020-02-16 18:11:59', '2020-02-19 19:26:14'),
(0000000141, 'Skin Care And Other Beauty Products', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:12:08', '2020-02-16 18:12:18'),
(0000000143, 'Pasalubong Shop', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:13:03', '2020-02-16 18:13:06'),
(0000000144, 'Wholesaler', '', 0000000001, 0000000005, 0, 0, '2020-02-16 18:13:13', '2020-03-06 21:16:58'),
(0000000145, 'Travel Agency', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:14:47', '2020-02-16 18:14:55'),
(0000000146, 'Internet Shop', '', 0000000001, 0000000005, 0, 0, '2020-02-16 18:15:03', '2020-02-28 18:42:29'),
(0000000147, 'Computer Service', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:15:13', '2020-02-16 18:15:16'),
(0000000148, 'Refreshment', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:15:38', '2020-02-16 18:15:41'),
(0000000149, 'Traveller\'s Inn', '', 0000000001, 0000000005, 0, 0, '2020-02-16 18:15:46', '2020-02-28 19:52:05'),
(0000000150, 'Pilinuts Delicacies', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:16:25', '2020-02-16 18:16:28'),
(0000000151, 'Electronic Services', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:16:42', '2020-02-16 18:16:45'),
(0000000152, 'Computer Related Services', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:16:52', '2020-02-16 18:17:26'),
(0000000153, 'Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized ', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:17:50', '2020-02-16 18:18:07'),
(0000000154, 'Retail of Oil  And Lubes', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:18:27', '2020-02-16 18:19:01'),
(0000000156, 'Travel And Tours', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:19:29', '2020-02-16 18:19:56'),
(0000000157, 'Dental Laboratory', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:19:59', '2020-02-16 18:20:07'),
(0000000158, 'Cakeshop', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:20:16', '2020-02-16 18:20:34'),
(0000000159, 'Pilinuts Delicacies Retailer', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:20:39', '2020-02-16 18:20:54'),
(0000000160, 'Carwash', '', 0000000001, 0000000005, 0, 0, '2020-02-16 18:20:57', '2020-02-20 16:58:53'),
(0000000161, 'Roofing Services', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:22:09', '2020-02-16 18:22:13'),
(0000000162, 'Banking and Finance', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:22:35', '2020-02-16 18:22:38'),
(0000000163, 'Sand, Gravel and Hollow Blocks Supply', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:22:51', '2020-02-16 18:22:54'),
(0000000164, 'Audio Myx File Mobile Disco Sound System', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:23:08', '2020-02-16 18:23:11'),
(0000000165, 'Drug Retailing', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:23:12', '2020-02-16 18:23:19'),
(0000000166, 'Plasticware', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:24:30', '2020-02-16 18:24:59'),
(0000000167, 'School Supply', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:25:06', '2020-02-16 18:25:08'),
(0000000168, 'Private School', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:25:21', '2020-02-16 18:25:58'),
(0000000169, 'Microfinance-Ngo', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:25:38', '2020-02-16 18:26:37'),
(0000000170, 'Dried Fish', '', 0000000001, 0000000001, 0, 0, '2020-02-16 18:26:42', '2020-02-16 18:26:54'),
(0000000172, 'Blocks Supply', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:32:32', '2020-02-16 22:32:51'),
(0000000173, 'Accessories', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:33:24', '2020-02-29 20:59:43'),
(0000000174, 'Agent-Network Marketing', '', 0000000001, 0000000006, 0, 0, '2020-02-16 22:33:37', '2021-03-20 22:06:13'),
(0000000175, 'Supply', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:34:00', '2020-02-16 22:34:08'),
(0000000177, 'Appliances Center', '', 0000000009, 0000000001, 0, 0, '2020-02-16 22:35:12', '2021-03-20 18:47:39'),
(0000000178, 'Auto Parts and General Merchandise', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:35:29', '2020-02-16 22:36:03'),
(0000000179, 'Auto Repair Shop', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:36:05', '2020-03-11 23:43:51'),
(0000000180, 'Blend Coffee And Milktea', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:36:18', '2020-03-12 00:32:58'),
(0000000182, 'Booking Office', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:37:35', '2020-03-11 18:07:30'),
(0000000183, 'Buying Copra', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:37:46', '2020-02-16 22:38:15'),
(0000000184, 'Cable Network', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:38:19', '2020-02-16 22:38:22'),
(0000000185, 'Cable TV', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:38:28', '2020-02-16 22:38:34'),
(0000000186, 'Canteen', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:38:38', '2020-03-10 18:20:41'),
(0000000187, 'Ukay-Ukay', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:38:58', '2020-02-16 22:39:17'),
(0000000188, 'Cellphone Repair Shop', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:39:24', '2020-03-12 00:18:49'),
(0000000189, 'Coconut Grinder', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:39:30', '2020-02-16 22:40:39'),
(0000000190, 'Commercial Building', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:40:44', '2020-03-11 17:43:01'),
(0000000191, 'Commercial Space Rental', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:40:51', '2020-03-11 17:40:58'),
(0000000192, 'Comprada', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:41:51', '2020-02-16 23:19:11'),
(0000000193, 'Computer Pisonet', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:42:04', '2020-02-28 18:08:31'),
(0000000194, 'Construction', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:42:20', '2020-02-16 22:42:22'),
(0000000197, 'Convenience Store', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:43:13', '2020-02-16 22:43:16'),
(0000000198, 'Copra Trading', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:43:25', '2020-02-16 22:43:27'),
(0000000199, 'Cycle Parts', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:43:33', '2020-02-16 22:43:36'),
(0000000200, 'Dental Clinic', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:43:41', '2020-02-28 19:04:11'),
(0000000201, 'Department Sore', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:43:51', '2020-02-16 22:44:08'),
(0000000202, 'Direct Selling', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:44:12', '2020-02-16 22:44:15'),
(0000000203, 'Educational', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:44:19', '2020-02-28 17:01:53'),
(0000000204, 'Dried Fish Vendor', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:44:32', '2020-02-16 22:44:44'),
(0000000205, 'Farm', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:45:41', '2020-02-16 22:46:04'),
(0000000207, 'Feeds Supply', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:46:33', '2020-02-16 22:46:41'),
(0000000208, 'Food', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:46:46', '2020-02-16 22:47:02'),
(0000000209, 'Food Corner', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:47:03', '2020-02-16 22:47:38'),
(0000000210, 'Food House', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:47:40', '2020-02-16 22:47:45'),
(0000000211, 'Food Product', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:47:50', '2020-02-16 22:47:53'),
(0000000212, 'Fried Chicken Vendor', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:48:01', '2020-02-16 22:48:14'),
(0000000214, 'Gift Shop', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:48:29', '2020-02-16 22:49:43'),
(0000000215, 'Goto house', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:48:37', '2020-02-16 22:49:50'),
(0000000216, 'Gown Rental', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:49:51', '2020-02-16 22:49:58'),
(0000000217, 'House For Rent', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:50:04', '2020-03-12 00:04:41'),
(0000000218, 'Junkshop', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:51:24', '2020-02-16 22:51:41'),
(0000000219, 'Law Firm', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:51:49', '2020-02-20 16:41:22'),
(0000000220, 'Lechon Manok', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:52:05', '2020-02-20 20:02:53'),
(0000000221, 'Lotto Outlet', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:52:17', '2020-02-16 22:52:20'),
(0000000222, 'Meat Stall', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:52:31', '2020-02-16 22:53:16'),
(0000000223, 'Micro Insurance', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:52:35', '2020-02-16 22:53:49'),
(0000000224, 'Medical Clinic', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:53:32', '2020-02-28 19:08:56'),
(0000000225, 'Mini Hardware', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:53:59', '2020-02-16 22:54:02'),
(0000000226, 'Money Remittance', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:54:07', '2020-02-16 22:54:11'),
(0000000228, 'Motor Spare Parts', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:54:28', '2020-02-16 22:54:30'),
(0000000229, 'Motorcycle Dealer', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:54:48', '2020-02-16 22:54:51'),
(0000000230, 'Motorcycle Sales', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:55:00', '2020-02-16 22:55:16'),
(0000000232, 'Net Shop', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:56:22', '2020-02-28 19:15:04'),
(0000000233, 'Padala Center', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:56:30', '2020-02-16 22:56:54'),
(0000000234, 'Organization', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:56:37', '2020-02-16 22:56:46'),
(0000000235, 'Palay Seeds Dealer', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:56:59', '2020-02-16 22:57:01'),
(0000000237, 'Printing Center', '', 0000000001, 0000000004, 0, 0, '2020-02-16 22:57:15', '2020-07-05 19:16:40'),
(0000000238, 'Printing Services', '', 0000000001, 0000000004, 0, 0, '2020-02-16 22:58:38', '2020-07-05 19:13:20'),
(0000000239, 'Real Estate', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:58:51', '2020-03-06 19:43:40'),
(0000000241, 'Refreshment Halo-Halo', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:59:20', '2020-03-11 17:14:46'),
(0000000242, 'Refreshment Stand', '', 0000000001, 0000000005, 0, 0, '2020-02-16 22:59:33', '2020-03-11 17:19:50'),
(0000000243, 'Resto Bar', '', 0000000001, 0000000001, 0, 0, '2020-02-16 22:59:38', '2020-02-16 23:00:22'),
(0000000244, 'Retail Of Fasion Accessories', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:00:47', '2020-02-16 23:01:04'),
(0000000245, 'Retail of Supplies', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:01:09', '2020-02-16 23:01:22'),
(0000000246, 'Roofing Services Rtw Retailer General Merchandise', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:01:18', '2020-02-16 23:02:42'),
(0000000247, 'Salon', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:01:43', '2020-02-16 23:03:21'),
(0000000248, 'School Service', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:04:18', '2020-02-16 23:04:21'),
(0000000250, 'Softdrinks Dealer', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:04:51', '2020-02-16 23:04:59'),
(0000000251, 'Surveying', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:05:01', '2020-02-16 23:05:35'),
(0000000253, 'Wellness Product', '', 0000000001, 0000000001, 0, 0, '2020-02-16 23:06:25', '2020-02-16 23:06:28'),
(0000000254, 'Warehousing', '', 0000000001, 0000000005, 0, 0, '2020-02-28 17:51:20', '2020-02-28 17:57:34'),
(0000000255, 'Lessor', '', 0000000001, 0000000005, 0, 0, '2020-02-28 19:52:31', '2020-02-28 20:00:36'),
(0000000256, 'Distributors', '', 0000000001, 0000000001, 0, 0, '2020-03-01 21:58:36', '2020-03-01 21:58:43'),
(0000000257, 'Lending and Churvaness', '', 0000000001, 0000000004, 0, 100, '2021-03-21 22:03:00', '2021-03-21 22:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `business_lines_tax`
--

CREATE TABLE `business_lines_tax` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationType` varchar(16) NOT NULL,
  `BusinessLineID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `AssetMinimum` double NOT NULL,
  `AssetMaximum` double NOT NULL,
  `Amount` double NOT NULL,
  `IsByPercentage` tinyint(1) NOT NULL DEFAULT 0,
  `Percentage` double NOT NULL DEFAULT 0,
  `OfTaxVariableID` int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000001,
  `InExcessOf` double NOT NULL DEFAULT 0,
  `AdditionalAmount` double NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_lines_tax`
--

INSERT INTO `business_lines_tax` (`ID`, `ApplicationType`, `BusinessLineID`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'RENEWAL', 0000000014, 0, 49999, 800, 0, 0, 0000000005, 0, 0, '2020-02-10 22:26:01', '2020-02-20 01:32:11'),
(0000000002, 'RENEWAL', 0000000014, 50000, 59999, 1000, 0, 0, 0000000005, 0, 0, '2020-02-10 22:26:01', '2020-02-20 01:32:11'),
(0000000003, 'RENEWAL', 0000000014, 60000, 69999, 1200, 0, 0, 0000000005, 0, 0, '2020-02-10 22:26:01', '2020-02-20 01:32:11'),
(0000000004, 'RENEWAL', 0000000014, 80000, 89999, 1600, 0, 0, 0000000005, 0, 0, '2020-02-10 22:26:01', '2020-02-20 01:32:11'),
(0000000005, 'RENEWAL', 0000000014, 90000, 99999, 1800, 0, 0, 0000000005, 0, 0, '2020-02-10 22:26:01', '2020-02-20 01:32:11'),
(0000000006, 'RENEWAL', 0000000014, 100000, 199999, 2000, 0, 0, 0000000005, 0, 0, '2020-02-10 22:26:01', '2020-02-20 01:32:11'),
(0000000007, 'RENEWAL', 0000000014, 200000, -1, 3000, 0, 0, 0000000005, 0, 0, '2020-02-10 22:26:01', '2020-02-20 01:32:11'),
(0000000008, 'RENEWAL', 0000000173, 0, 0, 0, 0, 20, 0000000004, 0, 0, '2020-02-17 00:45:43', '2020-02-29 20:59:43'),
(0000000009, 'RENEWAL', 0000000034, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:40', '2020-02-20 01:32:12'),
(0000000010, 'RENEWAL', 0000000034, 50000, 999999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:40', '2020-02-20 01:32:12'),
(0000000011, 'RENEWAL', 0000000034, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:40', '2020-02-20 01:32:12'),
(0000000012, 'RENEWAL', 0000000034, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:40', '2020-02-20 01:32:12'),
(0000000013, 'RENEWAL', 0000000034, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:40', '2020-02-20 01:32:12'),
(0000000014, 'RENEWAL', 0000000034, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:40', '2020-02-20 01:32:12'),
(0000000015, 'RENEWAL', 0000000034, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:41', '2020-02-20 01:32:12'),
(0000000016, 'RENEWAL', 0000000034, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:41', '2020-02-20 01:32:12'),
(0000000017, 'RENEWAL', 0000000034, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:41', '2020-02-20 01:32:12'),
(0000000018, 'RENEWAL', 0000000034, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:20:41', '2020-02-20 01:32:12'),
(0000000019, 'RENEWAL', 0000000034, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-18 19:20:41', '2020-02-20 01:32:12'),
(0000000020, 'RENEWAL', 0000000034, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-02-18 19:20:41', '2020-02-20 01:32:12'),
(0000000021, 'RENEWAL', 0000000016, 0, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000022, 'RENEWAL', 0000000016, 50000, 59999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000023, 'RENEWAL', 0000000016, 60000, 69999, 1200, 0, 0, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000024, 'RENEWAL', 0000000016, 70000, 79999.99, 1400, 0, 0, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000025, 'RENEWAL', 0000000016, 80000, 89999.99, 1600, 0, 0, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000026, 'RENEWAL', 0000000016, 90000, 99999.99, 1800, 0, 0, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000027, 'RENEWAL', 0000000016, 100000, 199999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000028, 'RENEWAL', 0000000016, 200000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-18 19:39:04', '2020-02-20 01:32:11'),
(0000000029, 'RENEWAL', 0000000051, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:39', '2020-02-20 01:32:12'),
(0000000030, 'RENEWAL', 0000000051, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:39', '2020-02-20 01:32:12'),
(0000000031, 'RENEWAL', 0000000051, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000032, 'RENEWAL', 0000000051, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000033, 'RENEWAL', 0000000051, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000034, 'RENEWAL', 0000000051, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000035, 'RENEWAL', 0000000051, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000036, 'RENEWAL', 0000000051, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000037, 'RENEWAL', 0000000051, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000038, 'RENEWAL', 0000000051, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000039, 'RENEWAL', 0000000051, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000040, 'RENEWAL', 0000000051, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000041, 'RENEWAL', 0000000051, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000042, 'RENEWAL', 0000000051, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000043, 'RENEWAL', 0000000051, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000044, 'RENEWAL', 0000000051, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000045, 'RENEWAL', 0000000051, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000046, 'RENEWAL', 0000000051, 1000000, -1, 1.5, 1, 1.5, 0000000005, 0, 0, '2020-02-19 17:36:40', '2020-02-20 01:32:12'),
(0000000047, 'RENEWAL', 0000000033, 0, 5000, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000048, 'RENEWAL', 0000000033, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000049, 'RENEWAL', 0000000033, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000050, 'RENEWAL', 0000000033, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000051, 'RENEWAL', 0000000033, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000052, 'RENEWAL', 0000000033, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000053, 'RENEWAL', 0000000033, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000054, 'RENEWAL', 0000000033, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000055, 'RENEWAL', 0000000033, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000056, 'RENEWAL', 0000000033, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000057, 'RENEWAL', 0000000033, 15000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000058, 'RENEWAL', 0000000033, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000059, 'RENEWAL', 0000000033, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000060, 'RENEWAL', 0000000033, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000061, 'RENEWAL', 0000000033, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000062, 'RENEWAL', 0000000033, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000063, 'RENEWAL', 0000000033, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000064, 'RENEWAL', 0000000033, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 17:45:20', '2020-02-20 01:32:11'),
(0000000065, 'RENEWAL', 0000000088, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 17:47:04', '2020-02-20 01:32:12'),
(0000000066, 'RENEWAL', 0000000088, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 17:47:04', '2020-02-20 01:32:12'),
(0000000067, 'RENEWAL', 0000000088, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000068, 'RENEWAL', 0000000088, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000069, 'RENEWAL', 0000000088, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000070, 'RENEWAL', 0000000088, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000071, 'RENEWAL', 0000000088, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000072, 'RENEWAL', 0000000088, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000073, 'RENEWAL', 0000000088, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000074, 'RENEWAL', 0000000088, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000075, 'RENEWAL', 0000000088, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000076, 'RENEWAL', 0000000088, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000077, 'RENEWAL', 0000000088, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000078, 'RENEWAL', 0000000088, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000079, 'RENEWAL', 0000000088, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000080, 'RENEWAL', 0000000088, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000081, 'RENEWAL', 0000000088, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000082, 'RENEWAL', 0000000088, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 17:59:28', '2020-02-20 01:32:12'),
(0000000083, 'RENEWAL', 0000000012, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000084, 'RENEWAL', 0000000012, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000085, 'RENEWAL', 0000000012, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000086, 'RENEWAL', 0000000012, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000087, 'RENEWAL', 0000000012, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000088, 'RENEWAL', 0000000012, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000089, 'RENEWAL', 0000000012, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000090, 'RENEWAL', 0000000012, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000091, 'RENEWAL', 0000000012, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000092, 'RENEWAL', 0000000012, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000093, 'RENEWAL', 0000000012, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000094, 'RENEWAL', 0000000012, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000095, 'RENEWAL', 0000000012, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000096, 'RENEWAL', 0000000012, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000097, 'RENEWAL', 0000000012, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000098, 'RENEWAL', 0000000012, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000099, 'RENEWAL', 0000000012, 750000, 1000000, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000100, 'RENEWAL', 0000000012, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 18:07:41', '2020-02-20 01:32:11'),
(0000000101, 'RENEWAL', 0000000077, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000102, 'RENEWAL', 0000000077, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000103, 'RENEWAL', 0000000077, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000104, 'RENEWAL', 0000000077, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000105, 'RENEWAL', 0000000077, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000106, 'RENEWAL', 0000000077, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000107, 'RENEWAL', 0000000077, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000108, 'RENEWAL', 0000000077, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000109, 'RENEWAL', 0000000077, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000110, 'RENEWAL', 0000000077, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000111, 'RENEWAL', 0000000077, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000112, 'RENEWAL', 0000000077, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000113, 'RENEWAL', 0000000077, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000114, 'RENEWAL', 0000000077, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000115, 'RENEWAL', 0000000077, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000116, 'RENEWAL', 0000000077, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000117, 'RENEWAL', 0000000077, 750000, 1000000, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000118, 'RENEWAL', 0000000077, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 18:14:05', '2020-02-20 01:32:12'),
(0000000119, 'RENEWAL', 0000000089, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000120, 'RENEWAL', 0000000089, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000121, 'RENEWAL', 0000000089, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000122, 'RENEWAL', 0000000089, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000123, 'RENEWAL', 0000000089, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000124, 'RENEWAL', 0000000089, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000125, 'RENEWAL', 0000000089, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000126, 'RENEWAL', 0000000089, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000127, 'RENEWAL', 0000000089, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000128, 'RENEWAL', 0000000089, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000129, 'RENEWAL', 0000000089, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000130, 'RENEWAL', 0000000089, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000131, 'RENEWAL', 0000000089, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000132, 'RENEWAL', 0000000089, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000133, 'RENEWAL', 0000000089, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000134, 'RENEWAL', 0000000089, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000135, 'RENEWAL', 0000000089, 750000, 1000000, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000136, 'RENEWAL', 0000000089, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 18:23:22', '2020-02-20 01:32:12'),
(0000000137, 'RENEWAL', 0000000027, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000138, 'RENEWAL', 0000000027, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000139, 'RENEWAL', 0000000027, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000140, 'RENEWAL', 0000000027, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000141, 'RENEWAL', 0000000027, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000142, 'RENEWAL', 0000000027, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000143, 'RENEWAL', 0000000027, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000144, 'RENEWAL', 0000000027, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000145, 'RENEWAL', 0000000027, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000146, 'RENEWAL', 0000000027, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000147, 'RENEWAL', 0000000027, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000148, 'RENEWAL', 0000000027, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000149, 'RENEWAL', 0000000027, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000150, 'RENEWAL', 0000000027, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000151, 'RENEWAL', 0000000027, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000152, 'RENEWAL', 0000000027, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:12', '2020-02-20 01:32:11'),
(0000000153, 'RENEWAL', 0000000027, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:43:13', '2020-02-20 01:32:11'),
(0000000154, 'RENEWAL', 0000000027, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 18:43:13', '2020-02-20 01:32:11'),
(0000000155, 'RENEWAL', 0000000020, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000156, 'RENEWAL', 0000000020, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000157, 'RENEWAL', 0000000020, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000158, 'RENEWAL', 0000000020, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000159, 'RENEWAL', 0000000020, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000160, 'RENEWAL', 0000000020, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000161, 'RENEWAL', 0000000020, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000162, 'RENEWAL', 0000000020, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000163, 'RENEWAL', 0000000020, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000164, 'RENEWAL', 0000000020, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000165, 'RENEWAL', 0000000020, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000166, 'RENEWAL', 0000000020, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000167, 'RENEWAL', 0000000020, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000168, 'RENEWAL', 0000000020, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000169, 'RENEWAL', 0000000020, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000170, 'RENEWAL', 0000000020, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000171, 'RENEWAL', 0000000020, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000172, 'RENEWAL', 0000000020, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 18:50:48', '2020-02-20 01:32:11'),
(0000000173, 'RENEWAL', 0000000140, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000174, 'RENEWAL', 0000000140, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000175, 'RENEWAL', 0000000140, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000176, 'RENEWAL', 0000000140, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000177, 'RENEWAL', 0000000140, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000178, 'RENEWAL', 0000000140, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000179, 'RENEWAL', 0000000140, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000180, 'RENEWAL', 0000000140, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000181, 'RENEWAL', 0000000140, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000182, 'RENEWAL', 0000000140, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000183, 'RENEWAL', 0000000140, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000184, 'RENEWAL', 0000000140, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000185, 'RENEWAL', 0000000140, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000186, 'RENEWAL', 0000000140, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000187, 'RENEWAL', 0000000140, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000188, 'RENEWAL', 0000000140, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000189, 'RENEWAL', 0000000140, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000190, 'RENEWAL', 0000000140, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 19:26:14', '2020-02-20 01:32:12'),
(0000000191, 'RENEWAL', 0000000024, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000192, 'RENEWAL', 0000000024, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000193, 'RENEWAL', 0000000024, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000194, 'RENEWAL', 0000000024, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000195, 'RENEWAL', 0000000024, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000196, 'RENEWAL', 0000000024, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000197, 'RENEWAL', 0000000024, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000198, 'RENEWAL', 0000000024, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000199, 'RENEWAL', 0000000024, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000200, 'RENEWAL', 0000000024, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000201, 'RENEWAL', 0000000024, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000202, 'RENEWAL', 0000000024, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000203, 'RENEWAL', 0000000024, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000204, 'RENEWAL', 0000000024, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000205, 'RENEWAL', 0000000024, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:06', '2020-02-20 01:32:11'),
(0000000206, 'RENEWAL', 0000000024, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:07', '2020-02-20 01:32:11'),
(0000000207, 'RENEWAL', 0000000024, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 19:32:07', '2020-02-20 01:32:11'),
(0000000208, 'RENEWAL', 0000000024, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 19:32:07', '2020-02-20 01:32:11'),
(0000000209, 'RENEWAL', 0000000091, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000210, 'RENEWAL', 0000000091, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000211, 'RENEWAL', 0000000091, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000212, 'RENEWAL', 0000000091, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000213, 'RENEWAL', 0000000091, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000214, 'RENEWAL', 0000000091, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000215, 'RENEWAL', 0000000091, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000216, 'RENEWAL', 0000000091, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000217, 'RENEWAL', 0000000091, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000218, 'RENEWAL', 0000000091, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000219, 'RENEWAL', 0000000091, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000220, 'RENEWAL', 0000000091, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000221, 'RENEWAL', 0000000091, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000222, 'RENEWAL', 0000000091, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000223, 'RENEWAL', 0000000091, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000224, 'RENEWAL', 0000000091, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000225, 'RENEWAL', 0000000091, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 01:32:12'),
(0000000226, 'RENEWAL', 0000000091, 100000, 149999.99, 2000, 0, 1.5, 0000000005, 0, 0, '2020-02-19 21:02:06', '2020-02-20 17:22:54'),
(0000000227, 'RENEWAL', 0000000092, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000228, 'RENEWAL', 0000000092, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000229, 'RENEWAL', 0000000092, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000230, 'RENEWAL', 0000000092, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000231, 'RENEWAL', 0000000092, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000232, 'RENEWAL', 0000000092, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000233, 'RENEWAL', 0000000092, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000234, 'RENEWAL', 0000000092, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000235, 'RENEWAL', 0000000092, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000236, 'RENEWAL', 0000000092, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000237, 'RENEWAL', 0000000092, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000238, 'RENEWAL', 0000000092, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-02-19 21:08:08', '2020-02-20 01:32:12'),
(0000000239, 'RENEWAL', 0000000047, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000240, 'RENEWAL', 0000000047, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000241, 'RENEWAL', 0000000047, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000242, 'RENEWAL', 0000000047, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000243, 'RENEWAL', 0000000047, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000244, 'RENEWAL', 0000000047, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000245, 'RENEWAL', 0000000047, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000246, 'RENEWAL', 0000000047, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000247, 'RENEWAL', 0000000047, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000248, 'RENEWAL', 0000000047, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000249, 'RENEWAL', 0000000047, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000250, 'RENEWAL', 0000000047, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-02-19 21:12:35', '2020-02-20 01:32:12'),
(0000000251, 'RENEWAL', 0000000031, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000252, 'RENEWAL', 0000000031, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000253, 'RENEWAL', 0000000031, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000254, 'RENEWAL', 0000000031, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000255, 'RENEWAL', 0000000031, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000256, 'RENEWAL', 0000000031, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000257, 'RENEWAL', 0000000031, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000258, 'RENEWAL', 0000000031, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:18', '2020-02-20 01:32:11'),
(0000000259, 'RENEWAL', 0000000031, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:19', '2020-02-20 01:32:11'),
(0000000260, 'RENEWAL', 0000000031, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-19 21:17:19', '2020-02-20 01:32:11'),
(0000000261, 'RENEWAL', 0000000031, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-19 21:17:19', '2020-02-20 01:32:11'),
(0000000262, 'RENEWAL', 0000000031, 2000000, -1, 1, 1, 1, 0000000005, 0, 0, '2020-02-19 21:17:19', '2020-02-20 01:32:11'),
(0000000263, 'RENEWAL', 0000000219, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000264, 'RENEWAL', 0000000219, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000265, 'RENEWAL', 0000000219, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000266, 'RENEWAL', 0000000219, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000267, 'RENEWAL', 0000000219, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000268, 'RENEWAL', 0000000219, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000269, 'RENEWAL', 0000000219, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000270, 'RENEWAL', 0000000219, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000271, 'RENEWAL', 0000000219, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000272, 'RENEWAL', 0000000219, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000273, 'RENEWAL', 0000000219, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000274, 'RENEWAL', 0000000219, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000275, 'RENEWAL', 0000000219, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000276, 'RENEWAL', 0000000219, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000277, 'RENEWAL', 0000000219, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000278, 'RENEWAL', 0000000219, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000279, 'RENEWAL', 0000000219, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000280, 'RENEWAL', 0000000219, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-20 16:41:22', '2020-02-20 16:41:22'),
(0000000281, 'RENEWAL', 0000000115, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000282, 'RENEWAL', 0000000115, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000283, 'RENEWAL', 0000000115, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000284, 'RENEWAL', 0000000115, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000285, 'RENEWAL', 0000000115, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000286, 'RENEWAL', 0000000115, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000287, 'RENEWAL', 0000000115, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000288, 'RENEWAL', 0000000115, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000289, 'RENEWAL', 0000000115, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000290, 'RENEWAL', 0000000115, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000291, 'RENEWAL', 0000000115, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000292, 'RENEWAL', 0000000115, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000293, 'RENEWAL', 0000000115, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000294, 'RENEWAL', 0000000115, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000295, 'RENEWAL', 0000000115, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000296, 'RENEWAL', 0000000115, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000297, 'RENEWAL', 0000000115, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000298, 'RENEWAL', 0000000115, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-20 16:50:10', '2020-02-20 16:50:10'),
(0000000299, 'RENEWAL', 0000000160, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000300, 'RENEWAL', 0000000160, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000301, 'RENEWAL', 0000000160, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000302, 'RENEWAL', 0000000160, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000303, 'RENEWAL', 0000000160, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000304, 'RENEWAL', 0000000160, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000305, 'RENEWAL', 0000000160, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000306, 'RENEWAL', 0000000160, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000307, 'RENEWAL', 0000000160, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000308, 'RENEWAL', 0000000160, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000309, 'RENEWAL', 0000000160, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000310, 'RENEWAL', 0000000160, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000311, 'RENEWAL', 0000000160, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000312, 'RENEWAL', 0000000160, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000313, 'RENEWAL', 0000000160, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:52', '2020-02-20 16:58:52'),
(0000000314, 'RENEWAL', 0000000160, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:53', '2020-02-20 16:58:53'),
(0000000315, 'RENEWAL', 0000000160, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-20 16:58:53', '2020-02-20 16:58:53'),
(0000000316, 'RENEWAL', 0000000160, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-20 16:58:53', '2020-02-20 16:58:53'),
(0000000317, 'RENEWAL', 0000000091, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-20 17:22:54', '2020-02-20 17:22:54'),
(0000000318, 'RENEWAL', 0000000090, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000319, 'RENEWAL', 0000000090, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000320, 'RENEWAL', 0000000090, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000321, 'RENEWAL', 0000000090, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000322, 'RENEWAL', 0000000090, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000323, 'RENEWAL', 0000000090, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000324, 'RENEWAL', 0000000090, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000325, 'RENEWAL', 0000000090, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000326, 'RENEWAL', 0000000090, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000327, 'RENEWAL', 0000000090, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000328, 'RENEWAL', 0000000090, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000329, 'RENEWAL', 0000000090, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000330, 'RENEWAL', 0000000090, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000331, 'RENEWAL', 0000000090, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000332, 'RENEWAL', 0000000090, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000333, 'RENEWAL', 0000000090, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000334, 'RENEWAL', 0000000090, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000335, 'RENEWAL', 0000000090, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-20 17:51:08', '2020-02-20 17:51:08'),
(0000000336, 'RENEWAL', 0000000220, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000337, 'RENEWAL', 0000000220, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000338, 'RENEWAL', 0000000220, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000339, 'RENEWAL', 0000000220, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000340, 'RENEWAL', 0000000220, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000341, 'RENEWAL', 0000000220, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000342, 'RENEWAL', 0000000220, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000343, 'RENEWAL', 0000000220, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000344, 'RENEWAL', 0000000220, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000345, 'RENEWAL', 0000000220, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000346, 'RENEWAL', 0000000220, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000347, 'RENEWAL', 0000000220, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000348, 'RENEWAL', 0000000220, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000349, 'RENEWAL', 0000000220, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000350, 'RENEWAL', 0000000220, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000351, 'RENEWAL', 0000000220, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000352, 'RENEWAL', 0000000220, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000353, 'RENEWAL', 0000000220, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-20 20:02:53', '2020-02-20 20:02:53'),
(0000000354, 'RENEWAL', 0000000094, 0, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:28:44', '2020-02-28 17:28:44'),
(0000000355, 'RENEWAL', 0000000094, 1000000, 1499999.99, 20000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:28:44', '2020-02-28 17:28:44'),
(0000000356, 'RENEWAL', 0000000094, 1500000, 1999999.99, 30000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:28:44', '2020-02-28 17:28:44'),
(0000000357, 'RENEWAL', 0000000094, 2000000, 2999999.99, 40000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:28:44', '2020-02-28 17:28:44'),
(0000000358, 'RENEWAL', 0000000094, 3000000, 3999999.99, 60000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:28:44', '2020-02-28 17:28:44'),
(0000000359, 'RENEWAL', 0000000094, 4000000, 4999999.99, 80000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:28:44', '2020-02-28 17:28:44'),
(0000000360, 'RENEWAL', 0000000094, 5000000, -1, 0.01, 1, 1, 0000000005, 0, 0, '2020-02-28 17:28:44', '2020-02-28 17:28:44'),
(0000000361, 'RENEWAL', 0000000009, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000362, 'RENEWAL', 0000000009, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000363, 'RENEWAL', 0000000009, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000364, 'RENEWAL', 0000000009, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000365, 'RENEWAL', 0000000009, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000366, 'RENEWAL', 0000000009, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000367, 'RENEWAL', 0000000009, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000368, 'RENEWAL', 0000000009, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000369, 'RENEWAL', 0000000009, 500000, 749999.9, 10000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000370, 'RENEWAL', 0000000009, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000371, 'RENEWAL', 0000000009, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000372, 'RENEWAL', 0000000009, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-02-28 17:36:55', '2020-02-28 17:36:55'),
(0000000373, 'RENEWAL', 0000000066, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000374, 'RENEWAL', 0000000066, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000375, 'RENEWAL', 0000000066, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000376, 'RENEWAL', 0000000066, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000377, 'RENEWAL', 0000000066, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000378, 'RENEWAL', 0000000066, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000379, 'RENEWAL', 0000000066, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000380, 'RENEWAL', 0000000066, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000381, 'RENEWAL', 0000000066, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000382, 'RENEWAL', 0000000066, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000383, 'RENEWAL', 0000000066, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000384, 'RENEWAL', 0000000066, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000385, 'RENEWAL', 0000000066, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000386, 'RENEWAL', 0000000066, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000387, 'RENEWAL', 0000000066, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000388, 'RENEWAL', 0000000066, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000389, 'RENEWAL', 0000000066, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10');
INSERT INTO `business_lines_tax` (`ID`, `ApplicationType`, `BusinessLineID`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000390, 'RENEWAL', 0000000066, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 17:50:10', '2020-02-28 17:50:10'),
(0000000391, 'RENEWAL', 0000000254, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000392, 'RENEWAL', 0000000254, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000393, 'RENEWAL', 0000000254, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000394, 'RENEWAL', 0000000254, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000395, 'RENEWAL', 0000000254, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000396, 'RENEWAL', 0000000254, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000397, 'RENEWAL', 0000000254, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000398, 'RENEWAL', 0000000254, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000399, 'RENEWAL', 0000000254, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000400, 'RENEWAL', 0000000254, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:33', '2020-02-28 17:57:33'),
(0000000401, 'RENEWAL', 0000000254, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000402, 'RENEWAL', 0000000254, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000403, 'RENEWAL', 0000000254, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000404, 'RENEWAL', 0000000254, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000405, 'RENEWAL', 0000000254, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000406, 'RENEWAL', 0000000254, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000407, 'RENEWAL', 0000000254, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000408, 'RENEWAL', 0000000254, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 17:57:34', '2020-02-28 17:57:34'),
(0000000409, 'RENEWAL', 0000000193, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:30', '2020-02-28 18:08:30'),
(0000000410, 'RENEWAL', 0000000193, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000411, 'RENEWAL', 0000000193, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000412, 'RENEWAL', 0000000193, 15000, 19999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000413, 'RENEWAL', 0000000193, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000414, 'RENEWAL', 0000000193, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000415, 'RENEWAL', 0000000193, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000416, 'RENEWAL', 0000000193, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000417, 'RENEWAL', 0000000193, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000418, 'RENEWAL', 0000000193, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000419, 'RENEWAL', 0000000193, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000420, 'RENEWAL', 0000000193, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000421, 'RENEWAL', 0000000193, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000422, 'RENEWAL', 0000000193, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000423, 'RENEWAL', 0000000193, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000424, 'RENEWAL', 0000000193, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000425, 'RENEWAL', 0000000193, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000426, 'RENEWAL', 0000000193, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000427, 'RENEWAL', 0000000193, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 18:08:31', '2020-02-28 18:08:31'),
(0000000428, 'RENEWAL', 0000000005, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000429, 'RENEWAL', 0000000005, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000430, 'RENEWAL', 0000000005, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000431, 'RENEWAL', 0000000005, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000432, 'RENEWAL', 0000000005, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000433, 'RENEWAL', 0000000005, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000434, 'RENEWAL', 0000000005, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000435, 'RENEWAL', 0000000005, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000436, 'RENEWAL', 0000000005, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000437, 'RENEWAL', 0000000005, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000438, 'RENEWAL', 0000000005, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000439, 'RENEWAL', 0000000005, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000440, 'RENEWAL', 0000000005, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000441, 'RENEWAL', 0000000005, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000442, 'RENEWAL', 0000000005, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000443, 'RENEWAL', 0000000005, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000444, 'RENEWAL', 0000000005, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000445, 'RENEWAL', 0000000005, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 18:30:37', '2020-02-28 18:30:37'),
(0000000446, 'RENEWAL', 0000000146, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000447, 'RENEWAL', 0000000146, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000448, 'RENEWAL', 0000000146, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000449, 'RENEWAL', 0000000146, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000450, 'RENEWAL', 0000000146, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000451, 'RENEWAL', 0000000146, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000452, 'RENEWAL', 0000000146, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000453, 'RENEWAL', 0000000146, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:28', '2020-02-28 18:42:28'),
(0000000454, 'RENEWAL', 0000000146, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000455, 'RENEWAL', 0000000146, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000456, 'RENEWAL', 0000000146, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000457, 'RENEWAL', 0000000146, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000458, 'RENEWAL', 0000000146, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000459, 'RENEWAL', 0000000146, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000460, 'RENEWAL', 0000000146, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000461, 'RENEWAL', 0000000146, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000462, 'RENEWAL', 0000000146, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000463, 'RENEWAL', 0000000146, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 18:42:29', '2020-02-28 18:42:29'),
(0000000464, 'RENEWAL', 0000000111, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000465, 'RENEWAL', 0000000111, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000466, 'RENEWAL', 0000000111, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000467, 'RENEWAL', 0000000111, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000468, 'RENEWAL', 0000000111, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000469, 'RENEWAL', 0000000111, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000470, 'RENEWAL', 0000000111, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000471, 'RENEWAL', 0000000111, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000472, 'RENEWAL', 0000000111, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000473, 'RENEWAL', 0000000111, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000474, 'RENEWAL', 0000000111, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000475, 'RENEWAL', 0000000111, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000476, 'RENEWAL', 0000000111, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000477, 'RENEWAL', 0000000111, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000478, 'RENEWAL', 0000000111, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000479, 'RENEWAL', 0000000111, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000480, 'RENEWAL', 0000000111, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000481, 'RENEWAL', 0000000111, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 18:58:31', '2020-02-28 18:58:31'),
(0000000482, 'RENEWAL', 0000000200, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:10', '2020-02-28 19:04:10'),
(0000000483, 'RENEWAL', 0000000200, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:10', '2020-02-28 19:04:10'),
(0000000484, 'RENEWAL', 0000000200, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:10', '2020-02-28 19:04:10'),
(0000000485, 'RENEWAL', 0000000200, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000486, 'RENEWAL', 0000000200, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000487, 'RENEWAL', 0000000200, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000488, 'RENEWAL', 0000000200, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000489, 'RENEWAL', 0000000200, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000490, 'RENEWAL', 0000000200, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000491, 'RENEWAL', 0000000200, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000492, 'RENEWAL', 0000000200, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000493, 'RENEWAL', 0000000200, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000494, 'RENEWAL', 0000000200, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000495, 'RENEWAL', 0000000200, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000496, 'RENEWAL', 0000000200, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000497, 'RENEWAL', 0000000200, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000498, 'RENEWAL', 0000000200, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000499, 'RENEWAL', 0000000200, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 19:04:11', '2020-02-28 19:04:11'),
(0000000500, 'RENEWAL', 0000000224, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000501, 'RENEWAL', 0000000224, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000502, 'RENEWAL', 0000000224, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000503, 'RENEWAL', 0000000224, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000504, 'RENEWAL', 0000000224, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000505, 'RENEWAL', 0000000224, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000506, 'RENEWAL', 0000000224, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000507, 'RENEWAL', 0000000224, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000508, 'RENEWAL', 0000000224, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000509, 'RENEWAL', 0000000224, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000510, 'RENEWAL', 0000000224, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000511, 'RENEWAL', 0000000224, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000512, 'RENEWAL', 0000000224, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000513, 'RENEWAL', 0000000224, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000514, 'RENEWAL', 0000000224, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000515, 'RENEWAL', 0000000224, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:55', '2020-02-28 19:08:55'),
(0000000516, 'RENEWAL', 0000000224, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:08:56', '2020-02-28 19:08:56'),
(0000000517, 'RENEWAL', 0000000224, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 19:08:56', '2020-02-28 19:08:56'),
(0000000518, 'RENEWAL', 0000000232, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000519, 'RENEWAL', 0000000232, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000520, 'RENEWAL', 0000000232, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000521, 'RENEWAL', 0000000232, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000522, 'RENEWAL', 0000000232, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000523, 'RENEWAL', 0000000232, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000524, 'RENEWAL', 0000000232, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000525, 'RENEWAL', 0000000232, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000526, 'RENEWAL', 0000000232, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000527, 'RENEWAL', 0000000232, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000528, 'RENEWAL', 0000000232, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000529, 'RENEWAL', 0000000232, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000530, 'RENEWAL', 0000000232, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000531, 'RENEWAL', 0000000232, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000532, 'RENEWAL', 0000000232, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000533, 'RENEWAL', 0000000232, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000534, 'RENEWAL', 0000000232, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000535, 'RENEWAL', 0000000232, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 19:15:04', '2020-02-28 19:15:04'),
(0000000536, 'RENEWAL', 0000000149, 0, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:52:05', '2020-02-28 19:52:05'),
(0000000537, 'RENEWAL', 0000000149, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:52:05', '2020-02-28 19:52:05'),
(0000000538, 'RENEWAL', 0000000149, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 19:52:05', '2020-02-28 19:52:05'),
(0000000539, 'RENEWAL', 0000000149, 1000000, 1999999.99, 10400, 1, 1.5, 0000000005, 0, 0, '2020-02-28 19:52:05', '2020-02-28 19:52:05'),
(0000000540, 'RENEWAL', 0000000149, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-02-28 19:52:05', '2020-02-28 19:52:05'),
(0000000541, 'RENEWAL', 0000000255, 0, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 20:00:35', '2020-02-28 20:00:35'),
(0000000542, 'RENEWAL', 0000000255, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-02-28 20:00:35', '2020-02-28 20:00:35'),
(0000000543, 'RENEWAL', 0000000255, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 20:00:35', '2020-02-28 20:00:35'),
(0000000544, 'RENEWAL', 0000000255, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 20:00:36', '2020-02-28 20:00:36'),
(0000000545, 'RENEWAL', 0000000255, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-02-28 20:00:36', '2020-02-28 20:00:36'),
(0000000546, 'RENEWAL', 0000000045, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000547, 'RENEWAL', 0000000045, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000548, 'RENEWAL', 0000000045, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000549, 'RENEWAL', 0000000045, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000550, 'RENEWAL', 0000000045, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000551, 'RENEWAL', 0000000045, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000552, 'RENEWAL', 0000000045, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000553, 'RENEWAL', 0000000045, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000554, 'RENEWAL', 0000000045, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000555, 'RENEWAL', 0000000045, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000556, 'RENEWAL', 0000000045, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000557, 'RENEWAL', 0000000045, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000558, 'RENEWAL', 0000000045, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000559, 'RENEWAL', 0000000045, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000560, 'RENEWAL', 0000000045, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000561, 'RENEWAL', 0000000045, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000562, 'RENEWAL', 0000000045, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000563, 'RENEWAL', 0000000045, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-02-28 22:09:18', '2020-02-28 22:09:18'),
(0000000564, 'RENEWAL', 0000000173, 0, 0, 0, 0, 0, 0000000005, 0, 0, '2020-02-29 21:05:11', '2020-07-28 19:37:16'),
(0000000565, 'RENEWAL', 0000000103, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000566, 'RENEWAL', 0000000103, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000567, 'RENEWAL', 0000000103, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000568, 'RENEWAL', 0000000103, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000569, 'RENEWAL', 0000000103, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000570, 'RENEWAL', 0000000103, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000571, 'RENEWAL', 0000000103, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000572, 'RENEWAL', 0000000103, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000573, 'RENEWAL', 0000000103, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000574, 'RENEWAL', 0000000103, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:17:17', '2020-03-06 19:17:17'),
(0000000576, 'RENEWAL', 0000000103, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-06 19:21:08', '2020-03-06 19:21:08'),
(0000000577, 'RENEWAL', 0000000103, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-06 19:21:08', '2020-03-06 19:21:08'),
(0000000578, 'RENEWAL', 0000000104, 0, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000579, 'RENEWAL', 0000000104, 50000, 59999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000580, 'RENEWAL', 0000000104, 60000, 69999.99, 1200, 0, 0, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000581, 'RENEWAL', 0000000104, 70000, 79999.99, 1400, 0, 0, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000582, 'RENEWAL', 0000000104, 80000, 89999.99, 1600, 0, 0, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000583, 'RENEWAL', 0000000104, 90000, 99999.99, 1800, 0, 0, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000584, 'RENEWAL', 0000000104, 100000, 199999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000585, 'RENEWAL', 0000000104, 200000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-06 19:31:01', '2020-03-06 19:31:01'),
(0000000586, 'RENEWAL', 0000000239, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000587, 'RENEWAL', 0000000239, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000588, 'RENEWAL', 0000000239, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000589, 'RENEWAL', 0000000239, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000590, 'RENEWAL', 0000000239, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000591, 'RENEWAL', 0000000239, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000592, 'RENEWAL', 0000000239, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000593, 'RENEWAL', 0000000239, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000594, 'RENEWAL', 0000000239, 75000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000595, 'RENEWAL', 0000000239, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000596, 'RENEWAL', 0000000239, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000597, 'RENEWAL', 0000000239, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000598, 'RENEWAL', 0000000239, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000599, 'RENEWAL', 0000000239, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000600, 'RENEWAL', 0000000239, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000601, 'RENEWAL', 0000000239, 500000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000602, 'RENEWAL', 0000000239, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000603, 'RENEWAL', 0000000239, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-06 19:43:40', '2020-03-06 19:43:40'),
(0000000604, 'RENEWAL', 0000000042, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000605, 'RENEWAL', 0000000042, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000606, 'RENEWAL', 0000000042, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000607, 'RENEWAL', 0000000042, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000608, 'RENEWAL', 0000000042, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000609, 'RENEWAL', 0000000042, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000610, 'RENEWAL', 0000000042, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000611, 'RENEWAL', 0000000042, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000612, 'RENEWAL', 0000000042, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000613, 'RENEWAL', 0000000042, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000614, 'RENEWAL', 0000000042, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000615, 'RENEWAL', 0000000042, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000616, 'RENEWAL', 0000000042, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000617, 'RENEWAL', 0000000042, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000618, 'RENEWAL', 0000000042, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000619, 'RENEWAL', 0000000042, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000620, 'RENEWAL', 0000000042, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:08:45', '2020-03-06 21:08:45'),
(0000000621, 'RENEWAL', 0000000042, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-06 21:08:46', '2020-03-06 21:08:46'),
(0000000622, 'RENEWAL', 0000000144, 0, 999.99, 25.3, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000623, 'RENEWAL', 0000000144, 1000, 1999.99, 46.2, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000624, 'RENEWAL', 0000000144, 2000, 2999.99, 70, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000625, 'RENEWAL', 0000000144, 3000, 3999.99, 100.8, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000626, 'RENEWAL', 0000000144, 4000, 4999.99, 140, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000627, 'RENEWAL', 0000000144, 5000, 5999.99, 169.4, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000628, 'RENEWAL', 0000000144, 6000, 6999.99, 200.2, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000629, 'RENEWAL', 0000000144, 7000, 7999.99, 231, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000630, 'RENEWAL', 0000000144, 8000, 9999.99, 261.8, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000631, 'RENEWAL', 0000000144, 10000, 14999.99, 308, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000632, 'RENEWAL', 0000000144, 15000, 19999.99, 385, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000633, 'RENEWAL', 0000000144, 20000, 29999.99, 462, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000634, 'RENEWAL', 0000000144, 30000, 39999.99, 616, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000635, 'RENEWAL', 0000000144, 40000, 49999.99, 924, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000636, 'RENEWAL', 0000000144, 50000, 74999.99, 1386, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000637, 'RENEWAL', 0000000144, 75000, 99999.99, 1848, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000638, 'RENEWAL', 0000000144, 100000, 149999.99, 2618, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000639, 'RENEWAL', 0000000144, 150000, 199999.99, 3388, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000640, 'RENEWAL', 0000000144, 200000, 299999.99, 4620, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000641, 'RENEWAL', 0000000144, 300000, 499999.99, 6160, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000642, 'RENEWAL', 0000000144, 500000, 749999.99, 9240, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000643, 'RENEWAL', 0000000144, 750000, 999999.99, 12320, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000644, 'RENEWAL', 0000000144, 1000000, 1999999.99, 14000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:16:58', '2020-03-06 21:16:58'),
(0000000645, 'RENEWAL', 0000000144, 2000000, 2999999.99, 0, 1, 0.4, 0000000005, 3000000, 14000, '2020-03-06 21:16:58', '2020-03-06 21:19:08'),
(0000000646, 'RENEWAL', 0000000003, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:43', '2020-03-06 21:58:43'),
(0000000647, 'RENEWAL', 0000000003, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000648, 'RENEWAL', 0000000003, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000649, 'RENEWAL', 0000000003, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000650, 'RENEWAL', 0000000003, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000651, 'RENEWAL', 0000000003, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000652, 'RENEWAL', 0000000003, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000653, 'RENEWAL', 0000000003, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000654, 'RENEWAL', 0000000003, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000655, 'RENEWAL', 0000000003, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000656, 'RENEWAL', 0000000003, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000657, 'RENEWAL', 0000000003, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000658, 'RENEWAL', 0000000003, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000659, 'RENEWAL', 0000000003, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000660, 'RENEWAL', 0000000003, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000661, 'RENEWAL', 0000000003, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000662, 'RENEWAL', 0000000003, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000663, 'RENEWAL', 0000000003, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-06 21:58:44', '2020-03-06 21:58:44'),
(0000000664, 'RENEWAL', 0000000078, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000665, 'RENEWAL', 0000000078, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000666, 'RENEWAL', 0000000078, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000667, 'RENEWAL', 0000000078, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000668, 'RENEWAL', 0000000078, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000669, 'RENEWAL', 0000000078, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000670, 'RENEWAL', 0000000078, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000671, 'RENEWAL', 0000000078, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000672, 'RENEWAL', 0000000078, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000673, 'RENEWAL', 0000000078, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000674, 'RENEWAL', 0000000078, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000675, 'RENEWAL', 0000000078, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000676, 'RENEWAL', 0000000078, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000677, 'RENEWAL', 0000000078, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000678, 'RENEWAL', 0000000078, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000679, 'RENEWAL', 0000000078, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000680, 'RENEWAL', 0000000078, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000681, 'RENEWAL', 0000000078, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-06 22:24:02', '2020-03-06 22:24:02'),
(0000000682, 'RENEWAL', 0000000017, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000683, 'RENEWAL', 0000000017, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000684, 'RENEWAL', 0000000017, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000685, 'RENEWAL', 0000000017, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000686, 'RENEWAL', 0000000017, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000687, 'RENEWAL', 0000000017, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000688, 'RENEWAL', 0000000017, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000689, 'RENEWAL', 0000000017, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000690, 'RENEWAL', 0000000017, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000691, 'RENEWAL', 0000000017, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000692, 'RENEWAL', 0000000017, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000693, 'RENEWAL', 0000000017, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000694, 'RENEWAL', 0000000017, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000695, 'RENEWAL', 0000000017, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000696, 'RENEWAL', 0000000017, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000697, 'RENEWAL', 0000000017, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000698, 'RENEWAL', 0000000017, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000699, 'RENEWAL', 0000000017, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-06 22:35:09', '2020-03-06 22:35:09'),
(0000000700, 'RENEWAL', 0000000052, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000701, 'RENEWAL', 0000000052, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000702, 'RENEWAL', 0000000052, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000703, 'RENEWAL', 0000000052, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000704, 'RENEWAL', 0000000052, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000705, 'RENEWAL', 0000000052, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000706, 'RENEWAL', 0000000052, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000707, 'RENEWAL', 0000000052, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000708, 'RENEWAL', 0000000052, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000709, 'RENEWAL', 0000000052, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000710, 'RENEWAL', 0000000052, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000711, 'RENEWAL', 0000000052, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-10 17:34:35', '2020-03-10 17:34:35'),
(0000000712, 'RENEWAL', 0000000186, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000713, 'RENEWAL', 0000000186, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000714, 'RENEWAL', 0000000186, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000715, 'RENEWAL', 0000000186, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000716, 'RENEWAL', 0000000186, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000717, 'RENEWAL', 0000000186, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000718, 'RENEWAL', 0000000186, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000719, 'RENEWAL', 0000000186, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000720, 'RENEWAL', 0000000186, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000721, 'RENEWAL', 0000000186, 750000, 999999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000722, 'RENEWAL', 0000000186, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000723, 'RENEWAL', 0000000186, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-10 18:20:41', '2020-03-10 18:20:41'),
(0000000724, 'RENEWAL', 0000000049, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000725, 'RENEWAL', 0000000049, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000726, 'RENEWAL', 0000000049, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000727, 'RENEWAL', 0000000049, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000728, 'RENEWAL', 0000000049, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000729, 'RENEWAL', 0000000049, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000730, 'RENEWAL', 0000000049, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000731, 'RENEWAL', 0000000049, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000732, 'RENEWAL', 0000000049, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000733, 'RENEWAL', 0000000049, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000734, 'RENEWAL', 0000000049, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000735, 'RENEWAL', 0000000049, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-10 18:25:51', '2020-03-10 18:25:51'),
(0000000736, 'RENEWAL', 0000000032, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-10 18:36:55', '2020-03-10 18:36:55'),
(0000000737, 'RENEWAL', 0000000032, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:36:55', '2020-03-10 18:36:55'),
(0000000738, 'RENEWAL', 0000000032, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:36:55', '2020-03-10 18:36:55'),
(0000000739, 'RENEWAL', 0000000032, 150000, 249999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:36:55', '2020-03-10 18:36:55'),
(0000000740, 'RENEWAL', 0000000032, 250000, 299999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-10 18:36:55', '2020-03-10 18:36:55'),
(0000000741, 'RENEWAL', 0000000032, 0, 0, 0, 0, 0, 0000000005, 0, 0, '2020-03-10 18:36:55', '2020-03-10 18:36:55'),
(0000000742, 'RENEWAL', 0000000116, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000743, 'RENEWAL', 0000000116, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000744, 'RENEWAL', 0000000116, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000745, 'RENEWAL', 0000000116, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000746, 'RENEWAL', 0000000116, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000747, 'RENEWAL', 0000000116, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000748, 'RENEWAL', 0000000116, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000749, 'RENEWAL', 0000000116, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000750, 'RENEWAL', 0000000116, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000751, 'RENEWAL', 0000000116, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000752, 'RENEWAL', 0000000116, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000753, 'RENEWAL', 0000000116, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-11 16:53:44', '2020-03-11 16:53:44'),
(0000000754, 'RENEWAL', 0000000123, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:48', '2020-03-11 17:08:48'),
(0000000755, 'RENEWAL', 0000000123, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:48', '2020-03-11 17:08:48'),
(0000000756, 'RENEWAL', 0000000123, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:48', '2020-03-11 17:08:48'),
(0000000757, 'RENEWAL', 0000000123, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:48', '2020-03-11 17:08:48'),
(0000000758, 'RENEWAL', 0000000123, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:48', '2020-03-11 17:08:48'),
(0000000759, 'RENEWAL', 0000000123, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:48', '2020-03-11 17:08:48'),
(0000000760, 'RENEWAL', 0000000123, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:48', '2020-03-11 17:08:48'),
(0000000761, 'RENEWAL', 0000000123, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:49', '2020-03-11 17:08:49'),
(0000000762, 'RENEWAL', 0000000123, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:49', '2020-03-11 17:08:49'),
(0000000763, 'RENEWAL', 0000000123, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:08:49', '2020-03-11 17:08:49'),
(0000000764, 'RENEWAL', 0000000123, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 17:08:49', '2020-03-11 17:08:49'),
(0000000765, 'RENEWAL', 0000000123, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-11 17:08:49', '2020-03-11 17:08:49'),
(0000000766, 'RENEWAL', 0000000241, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000767, 'RENEWAL', 0000000241, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000768, 'RENEWAL', 0000000241, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000769, 'RENEWAL', 0000000241, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000770, 'RENEWAL', 0000000241, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000771, 'RENEWAL', 0000000241, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000772, 'RENEWAL', 0000000241, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000773, 'RENEWAL', 0000000241, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000774, 'RENEWAL', 0000000241, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000775, 'RENEWAL', 0000000241, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000776, 'RENEWAL', 0000000241, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000777, 'RENEWAL', 0000000241, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-11 17:14:46', '2020-03-11 17:14:46'),
(0000000778, 'RENEWAL', 0000000242, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50');
INSERT INTO `business_lines_tax` (`ID`, `ApplicationType`, `BusinessLineID`, `AssetMinimum`, `AssetMaximum`, `Amount`, `IsByPercentage`, `Percentage`, `OfTaxVariableID`, `InExcessOf`, `AdditionalAmount`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000779, 'RENEWAL', 0000000242, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000780, 'RENEWAL', 0000000242, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000781, 'RENEWAL', 0000000242, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000782, 'RENEWAL', 0000000242, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000783, 'RENEWAL', 0000000242, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000784, 'RENEWAL', 0000000242, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000785, 'RENEWAL', 0000000242, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000786, 'RENEWAL', 0000000242, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000787, 'RENEWAL', 0000000242, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:20:23'),
(0000000788, 'RENEWAL', 0000000242, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:20:23'),
(0000000789, 'RENEWAL', 0000000242, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-11 17:19:50', '2020-03-11 17:19:50'),
(0000000790, 'RENEWAL', 0000000008, 0, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:23:40', '2020-03-11 17:23:40'),
(0000000791, 'RENEWAL', 0000000008, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:23:40', '2020-03-11 17:23:40'),
(0000000794, 'RENEWAL', 0000000191, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000795, 'RENEWAL', 0000000191, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000796, 'RENEWAL', 0000000191, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000797, 'RENEWAL', 0000000191, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000798, 'RENEWAL', 0000000191, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000799, 'RENEWAL', 0000000191, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000800, 'RENEWAL', 0000000191, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000801, 'RENEWAL', 0000000191, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000802, 'RENEWAL', 0000000191, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000803, 'RENEWAL', 0000000191, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000804, 'RENEWAL', 0000000191, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000805, 'RENEWAL', 0000000191, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-11 17:40:58', '2020-03-11 17:40:58'),
(0000000806, 'RENEWAL', 0000000008, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 17:45:25', '2020-03-11 17:45:25'),
(0000000807, 'RENEWAL', 0000000008, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 17:45:25', '2020-03-11 17:45:25'),
(0000000808, 'RENEWAL', 0000000008, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-11 17:45:25', '2020-03-11 17:45:25'),
(0000000809, 'RENEWAL', 0000000182, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000810, 'RENEWAL', 0000000182, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000811, 'RENEWAL', 0000000182, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000812, 'RENEWAL', 0000000182, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000813, 'RENEWAL', 0000000182, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000814, 'RENEWAL', 0000000182, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000815, 'RENEWAL', 0000000182, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000816, 'RENEWAL', 0000000182, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000817, 'RENEWAL', 0000000182, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000818, 'RENEWAL', 0000000182, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000819, 'RENEWAL', 0000000182, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000820, 'RENEWAL', 0000000182, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000821, 'RENEWAL', 0000000182, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000822, 'RENEWAL', 0000000182, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000823, 'RENEWAL', 0000000182, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000824, 'RENEWAL', 0000000182, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000825, 'RENEWAL', 0000000182, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000826, 'RENEWAL', 0000000182, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 18:07:30', '2020-03-11 18:07:30'),
(0000000827, 'RENEWAL', 0000000083, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000828, 'RENEWAL', 0000000083, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000829, 'RENEWAL', 0000000083, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000830, 'RENEWAL', 0000000083, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000831, 'RENEWAL', 0000000083, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000832, 'RENEWAL', 0000000083, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000833, 'RENEWAL', 0000000083, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000834, 'RENEWAL', 0000000083, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000835, 'RENEWAL', 0000000083, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000836, 'RENEWAL', 0000000083, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000837, 'RENEWAL', 0000000083, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000838, 'RENEWAL', 0000000083, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000839, 'RENEWAL', 0000000083, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000840, 'RENEWAL', 0000000083, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:52', '2020-03-11 18:30:52'),
(0000000841, 'RENEWAL', 0000000083, 400000, 499999, 7000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:53', '2020-03-11 18:30:53'),
(0000000842, 'RENEWAL', 0000000083, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:53', '2020-03-11 18:30:53'),
(0000000843, 'RENEWAL', 0000000083, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 18:30:53', '2020-03-11 18:30:53'),
(0000000844, 'RENEWAL', 0000000083, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 18:30:53', '2020-03-11 18:30:53'),
(0000000845, 'RENEWAL', 0000000179, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:50', '2020-03-11 23:43:50'),
(0000000846, 'RENEWAL', 0000000179, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000847, 'RENEWAL', 0000000179, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000848, 'RENEWAL', 0000000179, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000849, 'RENEWAL', 0000000179, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000850, 'RENEWAL', 0000000179, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000851, 'RENEWAL', 0000000179, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000852, 'RENEWAL', 0000000179, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000853, 'RENEWAL', 0000000179, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000854, 'RENEWAL', 0000000179, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000855, 'RENEWAL', 0000000179, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000856, 'RENEWAL', 0000000179, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000857, 'RENEWAL', 0000000179, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000858, 'RENEWAL', 0000000179, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000859, 'RENEWAL', 0000000179, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000860, 'RENEWAL', 0000000179, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000861, 'RENEWAL', 0000000179, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000862, 'RENEWAL', 0000000179, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 23:43:51', '2020-03-11 23:43:51'),
(0000000863, 'RENEWAL', 0000000082, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000864, 'RENEWAL', 0000000082, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000865, 'RENEWAL', 0000000082, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000866, 'RENEWAL', 0000000082, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000867, 'RENEWAL', 0000000082, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000868, 'RENEWAL', 0000000082, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000869, 'RENEWAL', 0000000082, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000870, 'RENEWAL', 0000000082, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000871, 'RENEWAL', 0000000082, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:37', '2020-03-11 23:59:37'),
(0000000872, 'RENEWAL', 0000000082, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000873, 'RENEWAL', 0000000082, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000874, 'RENEWAL', 0000000082, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000875, 'RENEWAL', 0000000082, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000876, 'RENEWAL', 0000000082, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000877, 'RENEWAL', 0000000082, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000878, 'RENEWAL', 0000000082, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000879, 'RENEWAL', 0000000082, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000880, 'RENEWAL', 0000000082, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-11 23:59:38', '2020-03-11 23:59:38'),
(0000000881, 'RENEWAL', 0000000217, 0, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:04:41', '2020-03-12 00:04:41'),
(0000000882, 'RENEWAL', 0000000217, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:04:41', '2020-03-12 00:04:41'),
(0000000883, 'RENEWAL', 0000000217, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:04:41', '2020-03-12 00:04:41'),
(0000000884, 'RENEWAL', 0000000217, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-12 00:04:41', '2020-03-12 00:04:41'),
(0000000885, 'RENEWAL', 0000000217, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-12 00:04:41', '2020-03-12 00:04:41'),
(0000000886, 'RENEWAL', 0000000188, 0, 4999.99, 50, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000887, 'RENEWAL', 0000000188, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000888, 'RENEWAL', 0000000188, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000889, 'RENEWAL', 0000000188, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000890, 'RENEWAL', 0000000188, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000891, 'RENEWAL', 0000000188, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000892, 'RENEWAL', 0000000188, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000893, 'RENEWAL', 0000000188, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000894, 'RENEWAL', 0000000188, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000895, 'RENEWAL', 0000000188, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000896, 'RENEWAL', 0000000188, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000897, 'RENEWAL', 0000000188, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000898, 'RENEWAL', 0000000188, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000899, 'RENEWAL', 0000000188, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000900, 'RENEWAL', 0000000188, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000901, 'RENEWAL', 0000000188, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000902, 'RENEWAL', 0000000188, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000903, 'RENEWAL', 0000000188, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-12 00:18:49', '2020-03-12 00:18:49'),
(0000000904, 'RENEWAL', 0000000180, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000905, 'RENEWAL', 0000000180, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000906, 'RENEWAL', 0000000180, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000907, 'RENEWAL', 0000000180, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000908, 'RENEWAL', 0000000180, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000909, 'RENEWAL', 0000000180, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000910, 'RENEWAL', 0000000180, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000911, 'RENEWAL', 0000000180, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000912, 'RENEWAL', 0000000180, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000913, 'RENEWAL', 0000000180, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000914, 'RENEWAL', 0000000180, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000915, 'RENEWAL', 0000000180, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-12 00:32:58', '2020-03-12 00:32:58'),
(0000000916, 'RENEWAL', 0000000058, 0, 4999, 50, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000917, 'RENEWAL', 0000000058, 5000, 9999.99, 100, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000918, 'RENEWAL', 0000000058, 10000, 14999.99, 200, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000919, 'RENEWAL', 0000000058, 15000, 19999.99, 300, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000920, 'RENEWAL', 0000000058, 20000, 29999.99, 400, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000921, 'RENEWAL', 0000000058, 30000, 39999.99, 600, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000922, 'RENEWAL', 0000000058, 40000, 49999.99, 800, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000923, 'RENEWAL', 0000000058, 50000, 74999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000924, 'RENEWAL', 0000000058, 75000, 99999.99, 1500, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000925, 'RENEWAL', 0000000058, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000926, 'RENEWAL', 0000000058, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000927, 'RENEWAL', 0000000058, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000928, 'RENEWAL', 0000000058, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000929, 'RENEWAL', 0000000058, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000930, 'RENEWAL', 0000000058, 400000, 499999.99, 7000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000931, 'RENEWAL', 0000000058, 500000, 749999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000932, 'RENEWAL', 0000000058, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000933, 'RENEWAL', 0000000058, 1000000, -1, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-12 00:41:36', '2020-03-12 00:41:36'),
(0000000934, 'RENEWAL', 0000000048, 0, 49999.99, 500, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000935, 'RENEWAL', 0000000048, 50000, 99999.99, 1000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000936, 'RENEWAL', 0000000048, 100000, 149999.99, 2000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000937, 'RENEWAL', 0000000048, 150000, 199999.99, 3000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000938, 'RENEWAL', 0000000048, 200000, 249999.99, 4000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000939, 'RENEWAL', 0000000048, 250000, 299999.99, 5000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000940, 'RENEWAL', 0000000048, 300000, 399999.99, 6000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000941, 'RENEWAL', 0000000048, 400000, 499999.99, 8000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000942, 'RENEWAL', 0000000048, 500000, 749999.99, 10000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000943, 'RENEWAL', 0000000048, 750000, 999999.99, 15000, 0, 0, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000944, 'RENEWAL', 0000000048, 1000000, 1999999.99, 0, 1, 1.5, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000945, 'RENEWAL', 0000000048, 2000000, -1, 0, 1, 1, 0000000005, 0, 0, '2020-03-12 00:53:30', '2020-03-12 00:53:30'),
(0000000946, 'RENEWAL', 0000000238, 0, 4999.99, 50, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:19', '2020-07-05 19:13:19'),
(0000000947, 'RENEWAL', 0000000238, 5000, 9999.99, 100, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:19', '2020-07-05 19:13:19'),
(0000000948, 'RENEWAL', 0000000238, 10000, 14999.99, 200, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:19', '2020-07-05 19:13:19'),
(0000000949, 'RENEWAL', 0000000238, 15000, 19999.99, 300, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:19', '2020-07-05 19:13:19'),
(0000000950, 'RENEWAL', 0000000238, 20000, 29999.99, 400, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:19', '2020-07-05 19:13:19'),
(0000000951, 'RENEWAL', 0000000238, 30000, 39999.99, 600, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:19', '2020-07-05 19:13:19'),
(0000000952, 'RENEWAL', 0000000238, 40000, 49999.99, 800, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:19', '2020-07-05 19:13:19'),
(0000000953, 'RENEWAL', 0000000238, 50000, 74999.99, 1000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000954, 'RENEWAL', 0000000238, 75000, 99999.99, 1500, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000955, 'RENEWAL', 0000000238, 100000, 149999.99, 2000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000956, 'RENEWAL', 0000000238, 150000, 199999.99, 3000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000957, 'RENEWAL', 0000000238, 200000, 249999.99, 4000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000958, 'RENEWAL', 0000000238, 250000, 299999.99, 5000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000959, 'RENEWAL', 0000000238, 300000, 399999.99, 6000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000960, 'RENEWAL', 0000000238, 400000, 499999.99, 7000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000961, 'RENEWAL', 0000000238, 500000, 749999.99, 8000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000962, 'RENEWAL', 0000000238, 750000, 999999.99, 15000, 0, 0, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000963, 'RENEWAL', 0000000238, 1000000, -1, 0, 1, 1.5, 0000000004, 0, 0, '2020-07-05 19:13:20', '2020-07-05 19:13:20'),
(0000000964, 'RENEWAL', 0000000237, 0, 4999.99, 50, 0, 0, 0000000004, 0, 0, '2020-07-05 19:16:40', '2020-07-05 19:16:40'),
(0000000965, 'RENEWAL', 0000000237, 5000, 9999, 100, 0, 0, 0000000004, 0, 0, '2020-07-05 19:16:40', '2020-07-05 19:16:40'),
(0000000966, 'RENEWAL', 0000000237, 10000, 14999.99, 200, 0, 0, 0000000004, 0, 0, '2020-07-05 19:16:40', '2020-07-05 19:16:40'),
(0000000967, 'RENEWAL', 0000000237, 0, 0, 0, 0, 0, 0000000004, 0, 0, '2020-07-05 19:16:40', '2020-07-05 19:16:40'),
(0000000968, 'RENEWAL', 0000000237, 15000, 19999.99, 300, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000969, 'RENEWAL', 0000000237, 20000, 29999.99, 400, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000970, 'RENEWAL', 0000000237, 30000, 39999.99, 600, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000971, 'RENEWAL', 0000000237, 40000, 49999.99, 800, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000972, 'RENEWAL', 0000000237, 50000, 74999.99, 1000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000973, 'RENEWAL', 0000000237, 75000, 99999.99, 1500, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000974, 'RENEWAL', 0000000237, 100000, 149999.99, 2000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000975, 'RENEWAL', 0000000237, 150000, 199999.99, 3000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000976, 'RENEWAL', 0000000237, 200000, 249999.99, 4000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000977, 'RENEWAL', 0000000237, 250000, 299999.99, 5000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000978, 'RENEWAL', 0000000237, 300000, 399999.99, 6000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000979, 'RENEWAL', 0000000237, 400000, 499999.99, 7000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000980, 'RENEWAL', 0000000237, 500000, 749999.99, 8000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000981, 'RENEWAL', 0000000237, 750000, 999999.99, 15000, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000982, 'RENEWAL', 0000000237, 1000000, -1, 1.5, 0, 0, 0000000004, 0, 0, '2020-07-07 16:56:39', '2020-07-07 16:56:39'),
(0000000983, 'RENEWAL', 0000000036, 0, 0, 0, 0, 0, 0000000004, 0, 0, '2021-03-20 18:49:34', '2021-03-20 18:49:34'),
(0000000984, 'RENEWAL', 0000000036, 0, 0, 0, 0, 0, 0000000004, 0, 0, '2021-03-20 18:49:34', '2021-03-20 18:49:34'),
(0000000985, 'RENEWAL', 0000000036, 0, 0, 0, 0, 0, 0000000004, 0, 0, '2021-03-20 18:49:34', '2021-03-20 18:49:34'),
(0000000986, 'RENEWAL', 0000000174, 0, 0, 0, 0, 0, 0000000006, 0, 0, '2021-03-20 22:06:13', '2021-03-20 22:06:13'),
(0000000987, 'RENEWAL', 0000000174, 0, 0, 0, 0, 0, 0000000006, 0, 0, '2021-03-20 22:06:13', '2021-03-20 22:06:13'),
(0000000988, 'RENEWAL', 0000000257, 1, 100000, 20, 1, 0, 0000000004, 0, 0, '2021-03-21 22:09:28', '2021-03-21 22:09:28'),
(0000000989, 'RENEWAL', 0000000070, 0.01, 400000, 0, 1, 2, 0000000004, 0, 0, '2021-03-21 22:11:42', '2021-03-21 22:11:42'),
(0000000990, 'RENEWAL', 0000000070, 400000, -1, 0, 1, 1, 0000000004, 0, 0, '2021-03-21 22:11:42', '2021-03-21 22:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `business_sizes`
--

CREATE TABLE `business_sizes` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `AssetLimitFrom` double NOT NULL DEFAULT 0,
  `AssetLimitTo` double NOT NULL DEFAULT 0,
  `TotalWorkersFrom` mediumint(9) NOT NULL DEFAULT 0,
  `TotalWorkersTo` mediumint(9) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_sizes`
--

INSERT INTO `business_sizes` (`ID`, `Title`, `Description`, `AssetLimitFrom`, `AssetLimitTo`, `TotalWorkersFrom`, `TotalWorkersTo`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'MICRO ENTERPRISE', 'Asset Limit is below Php 50,000. No particular number of workers.jjkk', 0, 50000, 0, 0, '2019-06-22 03:20:10', '2019-06-27 03:59:46'),
(0000000002, 'MICRO INDUSTRY', '', 50000, 150000, 0, 0, '2019-06-22 03:20:40', '2019-06-22 03:20:59'),
(0000000003, 'COTTAGE INDUSTRY', '', 150000, 1500000, 0, 9, '2019-06-22 03:21:03', '2019-06-22 03:29:03'),
(0000000004, 'SMALL SCALE INDUSTRY', '', 1500000, 15000000, 10, 99, '2019-06-22 03:21:53', '2019-06-22 03:22:29'),
(0000000005, 'MEDIUM SCALE INDUSRTY', '', 15000000, 60000000, 100, 199, '2019-06-22 03:22:30', '2019-06-22 03:23:06'),
(0000000006, 'LARGE SCALE INDUSRTY', '', 60000000, -1, 200, -1, '2019-06-22 03:23:07', '2019-06-22 03:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `business_sizes_fee`
--

CREATE TABLE `business_sizes_fee` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationType` varchar(16) NOT NULL,
  `BusinessSizeID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `BusinessLineID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `FeeID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Amount` double NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `business_types`
--

CREATE TABLE `business_types` (
  `ID` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_types`
--

INSERT INTO `business_types` (`ID`, `Title`, `Description`, `CreatedAt`, `UpdatedAt`) VALUES
(001, 'SINGLE', '', '2019-06-25 03:33:46', '2019-06-25 10:30:06'),
(002, 'PARTNERSHIP', '', '2019-06-25 03:33:52', '2019-06-25 10:30:10'),
(003, 'CORPORATION', '', '2019-06-25 03:34:05', '2019-06-25 10:30:13'),
(004, 'COOPERATIVE', '', '2019-06-25 03:34:10', '2019-06-25 10:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Description` text NOT NULL,
  `IsMultipleCollection` tinyint(1) NOT NULL DEFAULT 0,
  `IsForPoblacionOnly` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`ID`, `Title`, `Description`, `IsMultipleCollection`, `IsForPoblacionOnly`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'Business Plate Fee', '', 1, 0, '2021-12-12 09:33:12', '2021-12-12 09:33:12'),
(0000000002, 'Sticker Fee', '', 0, 0, '2020-02-07 01:22:12', '2020-02-07 01:22:12'),
(0000000003, 'Zoning Fee', '', 0, 0, '2020-02-07 01:22:05', '2020-02-07 01:22:05'),
(0000000004, 'Rental (Deliquencies)', '', 0, 0, '2020-02-07 01:22:56', '2020-02-07 01:22:56'),
(0000000005, 'Business Tax (Deliquencies)', '', 1, 1, '2021-12-12 09:33:02', '2021-12-12 09:33:02'),
(0000000006, 'Clearance Fee', '', 0, 0, '2020-02-07 01:23:28', '2020-02-07 01:23:28'),
(0000000007, 'Registration Of Weights & Measures', '', 0, 0, '2020-02-07 01:23:47', '2020-02-07 01:23:47'),
(0000000008, 'Garbage Charges', '', 0, 0, '2020-02-07 01:24:05', '2020-02-07 01:24:05'),
(0000000009, 'Employee/s Health Card', '', 1, 0, '2021-12-12 09:33:20', '2021-12-12 09:33:20'),
(0000000010, 'Sanitary Fee', '', 0, 0, '2020-02-07 01:24:36', '2020-02-07 01:24:36'),
(0000000011, 'Fire Inspection Fee', '', 1, 0, '2021-12-12 09:33:04', '2021-12-12 09:33:04'),
(0000000012, 'Occupation/Employee/s', '', 0, 0, '2020-02-07 01:25:15', '2020-02-07 01:25:15'),
(0000000013, 'Machine Equipment', '', 0, 0, '2020-02-07 01:25:38', '2020-02-07 01:25:38'),
(0000000014, 'RDL/WDL', '', 0, 0, '2020-02-07 01:25:50', '2020-02-07 01:25:50'),
(0000000015, 'RT/WT', '', 0, 0, '2020-02-07 01:26:04', '2020-02-07 01:26:04'),
(0000000016, 'Mayor\'s Permit Fee', '', 1, 0, '2020-02-19 17:15:03', '2020-02-19 17:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `fees_classification`
--

CREATE TABLE `fees_classification` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationType` varchar(16) NOT NULL,
  `BusinessLineID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `FeeID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `FeeVariableID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Amount` double NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `NewTaxVariableID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `RenewalTaxVariableID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `NewTaxFixed` double NOT NULL DEFAULT 0,
  `RenewalTaxFixed` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fees_variable`
--

CREATE TABLE `fees_variable` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(64) NOT NULL,
  `FieldName` varchar(64) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees_variable`
--

INSERT INTO `fees_variable` (`ID`, `Title`, `FieldName`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'NOT APPLICABLE', '', '2019-06-24 23:18:56', '0000-00-00 00:00:00'),
(0000000002, 'FIXED AMOUNT', '', '2019-06-24 23:19:01', '0000-00-00 00:00:00'),
(0000000003, 'PER BUSINESS SIZE', '', '2019-06-24 23:19:05', '0000-00-00 00:00:00'),
(0000000004, 'Total Employees &times;', 'TotalEmployees', '2019-06-22 00:53:37', '0000-00-00 00:00:00'),
(0000000005, 'Business Area &times;', 'BusinessArea', '2019-06-22 00:53:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `ID` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_modes`
--

INSERT INTO `payment_modes` (`ID`, `Title`, `Description`, `CreatedAt`, `UpdatedAt`) VALUES
(001, 'ANNUALLY', '', '2019-06-25 10:29:32', '2019-06-25 10:30:34'),
(002, 'SEMI-ANNUALLY', '', '2019-06-25 10:29:45', '2019-06-25 10:30:41'),
(003, 'QUARTERLY', '', '2019-06-25 10:29:53', '2019-06-25 10:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Description` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`ID`, `Title`, `Description`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'Business Registration Monitoring', '', '2021-03-22 19:50:01', '2021-04-05 20:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Description` text NOT NULL,
  `ValidationCodeTitle` varchar(64) NOT NULL,
  `IsForUpload` tinyint(1) NOT NULL DEFAULT 1,
  `CollectAfter` enum('APPLICATION','PAYMENT') NOT NULL DEFAULT 'APPLICATION',
  `IsForPoblacionOnly` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`ID`, `Title`, `Description`, `ValidationCodeTitle`, `IsForUpload`, `CollectAfter`, `IsForPoblacionOnly`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'Certificate of Annual Building Inspection', '', 'O.R. No.', 1, 'PAYMENT', 0, '2019-07-22 13:47:32', '2021-10-08 05:33:42'),
(0000000003, 'Fire Safety Inspection Certificate', '', 'Fire Safety Inspection Certificate No.', 1, 'APPLICATION', 0, '2019-07-22 17:06:54', '2020-02-07 00:59:17'),
(0000000004, 'Zoning Certificate/Locational Clearance', '', 'O.R. No.', 1, 'APPLICATION', 0, '2019-07-22 17:08:57', '2020-02-10 21:44:12'),
(0000000005, 'Sanitary Permit', '', 'Permit No.', 1, 'PAYMENT', 0, '2019-07-22 17:10:13', '2021-10-08 05:33:11'),
(0000000006, 'Barangay Business Clearance', '', 'O.R. No.', 1, 'APPLICATION', 0, '2019-07-22 17:11:16', '2020-02-10 21:42:53'),
(0000000007, 'DTI Registration Certificate', '', 'Certificate No.', 1, 'APPLICATION', 0, '2019-07-22 17:12:06', '2020-02-10 21:44:55'),
(0000000008, 'Certificate of Non-Compliance (DENR)', '', 'Registration No.', 1, 'APPLICATION', 0, '2019-07-22 17:20:31', '2019-07-22 17:22:54'),
(0000000009, 'Market Clearance (Stall Owner)', '', 'O.R. No.', 0, 'APPLICATION', 0, '2019-07-22 17:23:01', '2019-07-22 17:23:57'),
(0000000010, 'Community Tax Certificate', '', 'C.T.C. No.', 1, 'APPLICATION', 0, '2019-07-22 17:24:56', '2020-02-07 00:57:14'),
(0000000011, 'Philippine Coconut Authority Registration Certificate', '', 'Registration Certificate No.', 1, 'APPLICATION', 0, '2019-07-22 22:21:04', '2020-02-07 01:17:27'),
(0000000012, 'National Food Authority Certificate', '', 'Registration Certificate', 1, 'APPLICATION', 0, '2019-07-22 22:22:28', '2019-07-22 22:23:07'),
(0000000014, 'Bureau of Internal Revenue (TIN No.)', '', 'Certificate of Registration', 1, 'APPLICATION', 0, '2019-07-22 22:23:57', '2020-02-07 00:56:54'),
(0000000015, 'Social Security System Certificate', '', 'SSS Registration Certificate No.', 1, 'APPLICATION', 0, '2019-07-22 22:25:40', '2020-02-07 01:00:27'),
(0000000016, 'Philhealth', '', 'Registration Certificate No.', 1, 'APPLICATION', 0, '2019-07-22 22:26:25', '2020-02-07 01:17:21'),
(0000000017, 'Bangko Sentral ng Pilipinas', '', 'Registration No.', 1, 'APPLICATION', 0, '2019-07-23 00:27:42', '2019-07-24 00:43:09'),
(0000000018, 'Security Exchange Commission', '', 'Registration No.', 1, 'APPLICATION', 0, '2020-02-07 17:10:30', '2020-02-07 17:10:53'),
(0000000019, 'DepEd Registration Certificate (Private School)', '', 'Registration No.', 1, 'APPLICATION', 0, '2020-02-07 17:11:20', '2020-02-07 17:11:56'),
(0000000021, 'FDA Registration Certificate (Food and Drug Administration Office)', '', 'Registration No.', 1, 'APPLICATION', 0, '2020-02-07 17:15:18', '2020-02-07 17:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `requirements_classification`
--

CREATE TABLE `requirements_classification` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `ApplicationType` varchar(16) NOT NULL,
  `BusinessLineID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `RequirementID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp(),
  `DateUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requirements_classification`
--

INSERT INTO `requirements_classification` (`ID`, `ApplicationType`, `BusinessLineID`, `RequirementID`, `DateAdded`, `DateUpdated`) VALUES
(0000000001, 'NEW', 0000000001, 0000000001, '2019-07-22 13:48:18', '2019-07-22 13:48:18'),
(0000000002, 'RENEWAL', 0000000001, 0000000001, '2019-07-22 13:48:18', '2019-07-22 13:48:18'),
(0000000003, 'NEW', 0000000001, 0000000003, '2019-07-22 17:08:49', '2019-07-22 17:08:49'),
(0000000004, 'RENEWAL', 0000000001, 0000000003, '2019-07-22 17:08:49', '2019-07-22 17:08:49'),
(0000000005, 'NEW', 0000000001, 0000000004, '2019-07-22 17:10:09', '2019-07-22 17:10:09'),
(0000000006, 'RENEWAL', 0000000001, 0000000004, '2019-07-22 17:10:09', '2019-07-22 17:10:09'),
(0000000007, 'NEW', 0000000001, 0000000005, '2019-07-22 17:11:12', '2019-07-22 17:11:12'),
(0000000008, 'RENEWAL', 0000000001, 0000000005, '2019-07-22 17:11:12', '2019-07-22 17:11:12'),
(0000000009, 'NEW', 0000000001, 0000000006, '2019-07-22 17:11:59', '2019-07-22 17:11:59'),
(0000000010, 'RENEWAL', 0000000001, 0000000006, '2019-07-22 17:11:59', '2019-07-22 17:11:59'),
(0000000011, 'NEW', 0000000001, 0000000007, '2019-07-22 17:18:10', '2019-07-22 17:18:10'),
(0000000012, 'RENEWAL', 0000000001, 0000000007, '2019-07-22 17:18:10', '2019-07-22 17:18:10'),
(0000000013, 'RENEWAL', 0000000014, 0000000006, '2020-02-10 19:13:14', '2020-02-10 19:13:14'),
(0000000015, 'RENEWAL', 0000000014, 0000000003, '2020-02-10 19:13:41', '2020-02-10 19:13:41'),
(0000000016, 'RENEWAL', 0000000014, 0000000010, '2020-02-10 19:13:47', '2020-02-10 19:13:47'),
(0000000017, 'RENEWAL', 0000000023, 0000000010, '2020-02-10 19:13:55', '2020-02-10 19:13:55'),
(0000000018, 'RENEWAL', 0000000014, 0000000005, '2020-02-10 19:14:52', '2020-02-10 19:14:52'),
(0000000019, 'RENEWAL', 0000000014, 0000000004, '2020-02-10 19:15:04', '2020-02-10 19:15:04'),
(0000000020, 'RENEWAL', 0000000014, 0000000001, '2020-02-10 19:15:11', '2020-02-10 19:15:11'),
(0000000022, 'NEW', 0000000036, 0000000017, '2020-02-10 19:36:46', '2020-02-10 19:36:46'),
(0000000023, 'RENEWAL', 0000000014, 0000000007, '2020-02-10 21:44:29', '2020-02-10 21:44:29'),
(0000000024, 'NEW', 0000000013, 0000000006, '2021-01-06 18:58:23', '2021-01-06 18:58:23'),
(0000000025, 'NEW', 0000000013, 0000000010, '2021-01-06 18:58:49', '2021-01-06 18:58:49'),
(0000000026, 'NEW', 0000000013, 0000000005, '2021-01-06 18:59:11', '2021-01-06 18:59:11'),
(0000000027, 'NEW', 0000000013, 0000000007, '2021-01-06 18:59:21', '2021-01-06 18:59:21'),
(0000000028, 'NEW', 0000000013, 0000000001, '2021-01-06 18:59:30', '2021-01-06 18:59:30'),
(0000000029, 'NEW', 0000000035, 0000000018, '2021-03-07 20:23:46', '2021-03-07 20:23:46'),
(0000000030, 'RENEWAL', 0000000035, 0000000018, '2021-03-07 20:23:46', '2021-03-07 20:23:46'),
(0000000031, 'NEW', 0000000035, 0000000005, '2021-03-07 20:24:01', '2021-03-07 20:24:01'),
(0000000032, 'RENEWAL', 0000000035, 0000000005, '2021-03-07 20:24:01', '2021-03-07 20:24:01'),
(0000000033, 'NEW', 0000000035, 0000000003, '2021-03-07 20:24:19', '2021-03-07 20:24:19'),
(0000000034, 'RENEWAL', 0000000035, 0000000003, '2021-03-07 20:24:19', '2021-03-07 20:24:19'),
(0000000035, 'NEW', 0000000173, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000036, 'RENEWAL', 0000000173, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000037, 'NEW', 0000000174, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000038, 'RENEWAL', 0000000174, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000039, 'NEW', 0000000114, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000040, 'RENEWAL', 0000000114, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000041, 'NEW', 0000000036, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000042, 'RENEWAL', 0000000036, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000043, 'NEW', 0000000028, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000044, 'RENEWAL', 0000000028, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000045, 'NEW', 0000000018, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000046, 'RENEWAL', 0000000018, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000047, 'NEW', 0000000177, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000048, 'RENEWAL', 0000000177, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000049, 'NEW', 0000000164, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000050, 'RENEWAL', 0000000164, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000051, 'NEW', 0000000178, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000052, 'RENEWAL', 0000000178, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000053, 'NEW', 0000000179, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000054, 'RENEWAL', 0000000179, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000055, 'NEW', 0000000137, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000056, 'RENEWAL', 0000000137, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000057, 'NEW', 0000000056, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000058, 'RENEWAL', 0000000056, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000059, 'NEW', 0000000006, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000060, 'RENEWAL', 0000000006, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000061, 'NEW', 0000000162, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000062, 'RENEWAL', 0000000162, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000063, 'NEW', 0000000051, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000064, 'RENEWAL', 0000000051, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000065, 'NEW', 0000000033, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000066, 'RENEWAL', 0000000033, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000067, 'NEW', 0000000180, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000068, 'RENEWAL', 0000000180, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000069, 'NEW', 0000000172, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000070, 'RENEWAL', 0000000172, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000071, 'NEW', 0000000016, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000072, 'RENEWAL', 0000000016, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000073, 'NEW', 0000000182, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000074, 'RENEWAL', 0000000182, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000075, 'NEW', 0000000083, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000076, 'RENEWAL', 0000000083, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000077, 'NEW', 0000000099, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000078, 'RENEWAL', 0000000099, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000079, 'NEW', 0000000103, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000080, 'RENEWAL', 0000000103, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000081, 'NEW', 0000000106, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000082, 'RENEWAL', 0000000106, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000083, 'NEW', 0000000183, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000084, 'RENEWAL', 0000000183, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000085, 'NEW', 0000000184, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000086, 'RENEWAL', 0000000184, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000087, 'NEW', 0000000185, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000088, 'RENEWAL', 0000000185, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000089, 'NEW', 0000000158, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000090, 'RENEWAL', 0000000158, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000091, 'NEW', 0000000186, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000092, 'RENEWAL', 0000000186, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000093, 'NEW', 0000000049, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000094, 'RENEWAL', 0000000049, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000095, 'NEW', 0000000160, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000096, 'RENEWAL', 0000000160, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000097, 'NEW', 0000000079, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000098, 'RENEWAL', 0000000079, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000099, 'NEW', 0000000096, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000100, 'RENEWAL', 0000000096, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000101, 'NEW', 0000000188, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000102, 'RENEWAL', 0000000188, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000103, 'NEW', 0000000020, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000104, 'RENEWAL', 0000000020, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000105, 'NEW', 0000000140, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000106, 'RENEWAL', 0000000140, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000107, 'NEW', 0000000058, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000108, 'RENEWAL', 0000000058, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000109, 'NEW', 0000000092, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000110, 'RENEWAL', 0000000092, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000111, 'NEW', 0000000130, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000112, 'RENEWAL', 0000000130, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000113, 'NEW', 0000000102, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000114, 'RENEWAL', 0000000102, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000115, 'NEW', 0000000189, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000116, 'RENEWAL', 0000000189, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000117, 'NEW', 0000000190, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000118, 'RENEWAL', 0000000190, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000119, 'NEW', 0000000191, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000120, 'RENEWAL', 0000000191, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000121, 'NEW', 0000000192, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000122, 'RENEWAL', 0000000192, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000123, 'NEW', 0000000193, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000124, 'RENEWAL', 0000000193, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000125, 'NEW', 0000000152, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000126, 'RENEWAL', 0000000152, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000127, 'NEW', 0000000147, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000128, 'RENEWAL', 0000000147, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000129, 'NEW', 0000000088, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000130, 'RENEWAL', 0000000088, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000131, 'NEW', 0000000194, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000132, 'RENEWAL', 0000000194, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000133, 'NEW', 0000000059, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000134, 'RENEWAL', 0000000059, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000135, 'NEW', 0000000021, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000136, 'RENEWAL', 0000000021, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000137, 'NEW', 0000000081, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000138, 'RENEWAL', 0000000081, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000139, 'NEW', 0000000197, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000140, 'RENEWAL', 0000000197, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000141, 'NEW', 0000000010, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000142, 'RENEWAL', 0000000010, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000143, 'NEW', 0000000198, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000144, 'RENEWAL', 0000000198, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000145, 'NEW', 0000000199, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000146, 'RENEWAL', 0000000199, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000147, 'NEW', 0000000200, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000148, 'RENEWAL', 0000000200, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000149, 'NEW', 0000000157, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000150, 'RENEWAL', 0000000157, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000151, 'NEW', 0000000201, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000152, 'RENEWAL', 0000000201, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000153, 'NEW', 0000000202, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000154, 'RENEWAL', 0000000202, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000155, 'NEW', 0000000256, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000156, 'RENEWAL', 0000000256, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000157, 'NEW', 0000000104, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000158, 'RENEWAL', 0000000104, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000159, 'NEW', 0000000170, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000160, 'RENEWAL', 0000000170, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000161, 'NEW', 0000000204, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000162, 'RENEWAL', 0000000204, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000163, 'NEW', 0000000165, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000164, 'RENEWAL', 0000000165, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000165, 'NEW', 0000000023, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000166, 'RENEWAL', 0000000023, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000167, 'NEW', 0000000014, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000168, 'NEW', 0000000048, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000169, 'RENEWAL', 0000000048, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000170, 'NEW', 0000000203, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000171, 'RENEWAL', 0000000203, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000172, 'NEW', 0000000022, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000173, 'RENEWAL', 0000000022, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000174, 'NEW', 0000000070, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000175, 'RENEWAL', 0000000070, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000176, 'NEW', 0000000151, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000177, 'RENEWAL', 0000000151, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000178, 'NEW', 0000000066, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000179, 'RENEWAL', 0000000066, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000180, 'NEW', 0000000205, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000181, 'RENEWAL', 0000000205, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000182, 'NEW', 0000000032, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000183, 'RENEWAL', 0000000032, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000184, 'NEW', 0000000207, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000185, 'RENEWAL', 0000000207, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000186, 'NEW', 0000000087, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000187, 'RENEWAL', 0000000087, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000188, 'NEW', 0000000086, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000189, 'RENEWAL', 0000000086, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000190, 'NEW', 0000000208, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000191, 'RENEWAL', 0000000208, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000192, 'NEW', 0000000209, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000193, 'RENEWAL', 0000000209, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000194, 'NEW', 0000000210, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000195, 'RENEWAL', 0000000210, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000196, 'NEW', 0000000211, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000197, 'RENEWAL', 0000000211, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000198, 'NEW', 0000000098, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000199, 'RENEWAL', 0000000098, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000200, 'NEW', 0000000212, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000201, 'RENEWAL', 0000000212, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000202, 'NEW', 0000000116, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000203, 'RENEWAL', 0000000116, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000204, 'NEW', 0000000050, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000205, 'RENEWAL', 0000000050, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000206, 'NEW', 0000000012, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000207, 'RENEWAL', 0000000012, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000208, 'NEW', 0000000129, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000209, 'RENEWAL', 0000000129, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000210, 'NEW', 0000000045, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000211, 'RENEWAL', 0000000045, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000212, 'NEW', 0000000004, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000213, 'RENEWAL', 0000000004, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000214, 'NEW', 0000000062, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000215, 'RENEWAL', 0000000062, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000216, 'NEW', 0000000214, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000217, 'RENEWAL', 0000000214, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000218, 'NEW', 0000000215, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000219, 'RENEWAL', 0000000215, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000220, 'NEW', 0000000216, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000221, 'RENEWAL', 0000000216, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000222, 'NEW', 0000000061, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000223, 'RENEWAL', 0000000061, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000224, 'NEW', 0000000084, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000225, 'RENEWAL', 0000000084, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000226, 'NEW', 0000000030, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000227, 'RENEWAL', 0000000030, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000228, 'NEW', 0000000131, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000229, 'RENEWAL', 0000000131, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000230, 'NEW', 0000000077, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000231, 'RENEWAL', 0000000077, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000232, 'NEW', 0000000008, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000233, 'RENEWAL', 0000000008, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000234, 'NEW', 0000000044, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000235, 'RENEWAL', 0000000044, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000236, 'NEW', 0000000217, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000237, 'RENEWAL', 0000000217, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000238, 'NEW', 0000000005, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000239, 'RENEWAL', 0000000005, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000240, 'NEW', 0000000146, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000241, 'RENEWAL', 0000000146, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000242, 'NEW', 0000000053, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000243, 'RENEWAL', 0000000053, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000244, 'NEW', 0000000218, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000245, 'RENEWAL', 0000000218, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000246, 'NEW', 0000000109, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000247, 'RENEWAL', 0000000109, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000248, 'NEW', 0000000089, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000249, 'RENEWAL', 0000000089, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000250, 'NEW', 0000000219, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000251, 'RENEWAL', 0000000219, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000252, 'NEW', 0000000220, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000253, 'RENEWAL', 0000000220, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000254, 'NEW', 0000000035, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000255, 'RENEWAL', 0000000035, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000256, 'NEW', 0000000257, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000257, 'RENEWAL', 0000000257, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000258, 'NEW', 0000000255, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000259, 'RENEWAL', 0000000255, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000260, 'NEW', 0000000221, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000261, 'RENEWAL', 0000000221, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000262, 'NEW', 0000000107, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000263, 'RENEWAL', 0000000107, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000264, 'NEW', 0000000115, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000265, 'RENEWAL', 0000000115, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000266, 'NEW', 0000000132, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000267, 'RENEWAL', 0000000132, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000268, 'NEW', 0000000025, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000269, 'RENEWAL', 0000000025, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000270, 'NEW', 0000000047, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000271, 'RENEWAL', 0000000047, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000272, 'NEW', 0000000222, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000273, 'RENEWAL', 0000000222, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000274, 'RENEWAL', 0000000013, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000275, 'NEW', 0000000224, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000276, 'RENEWAL', 0000000224, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000277, 'NEW', 0000000094, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000278, 'RENEWAL', 0000000094, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000279, 'NEW', 0000000223, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000280, 'RENEWAL', 0000000223, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000281, 'NEW', 0000000007, 0000000007, '2021-10-08 05:32:38', '2021-10-08 05:32:38'),
(0000000282, 'RENEWAL', 0000000007, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000283, 'NEW', 0000000169, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000284, 'RENEWAL', 0000000169, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000285, 'NEW', 0000000126, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000286, 'RENEWAL', 0000000126, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000287, 'NEW', 0000000225, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000288, 'RENEWAL', 0000000225, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000289, 'NEW', 0000000041, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000290, 'RENEWAL', 0000000041, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000291, 'NEW', 0000000226, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000292, 'RENEWAL', 0000000226, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000293, 'NEW', 0000000138, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000294, 'RENEWAL', 0000000138, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000295, 'NEW', 0000000228, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000296, 'RENEWAL', 0000000228, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000297, 'NEW', 0000000229, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000298, 'RENEWAL', 0000000229, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000299, 'NEW', 0000000064, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000300, 'RENEWAL', 0000000064, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000301, 'NEW', 0000000230, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000302, 'RENEWAL', 0000000230, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000303, 'NEW', 0000000046, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000304, 'RENEWAL', 0000000046, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000305, 'NEW', 0000000232, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000306, 'RENEWAL', 0000000232, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000307, 'NEW', 0000000111, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000308, 'RENEWAL', 0000000111, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000309, 'NEW', 0000000234, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000310, 'RENEWAL', 0000000234, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000311, 'NEW', 0000000233, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000312, 'RENEWAL', 0000000233, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000313, 'NEW', 0000000235, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000314, 'RENEWAL', 0000000235, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000315, 'NEW', 0000000125, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000316, 'RENEWAL', 0000000125, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000317, 'NEW', 0000000143, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000318, 'RENEWAL', 0000000143, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000319, 'NEW', 0000000011, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000320, 'RENEWAL', 0000000011, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000321, 'NEW', 0000000038, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000322, 'RENEWAL', 0000000038, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000323, 'NEW', 0000000118, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000324, 'RENEWAL', 0000000118, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000325, 'NEW', 0000000026, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000326, 'RENEWAL', 0000000026, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000327, 'NEW', 0000000027, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000328, 'RENEWAL', 0000000027, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000329, 'NEW', 0000000128, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000330, 'RENEWAL', 0000000128, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000331, 'NEW', 0000000150, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000332, 'RENEWAL', 0000000150, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000333, 'NEW', 0000000159, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000334, 'RENEWAL', 0000000159, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000335, 'NEW', 0000000139, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000336, 'RENEWAL', 0000000139, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000337, 'NEW', 0000000068, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000338, 'RENEWAL', 0000000068, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000339, 'NEW', 0000000101, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000340, 'RENEWAL', 0000000101, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000341, 'NEW', 0000000166, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000342, 'RENEWAL', 0000000166, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000343, 'NEW', 0000000074, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000344, 'RENEWAL', 0000000074, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000345, 'NEW', 0000000029, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000346, 'RENEWAL', 0000000029, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000347, 'NEW', 0000000134, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000348, 'RENEWAL', 0000000134, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000349, 'NEW', 0000000237, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000350, 'RENEWAL', 0000000237, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000351, 'NEW', 0000000238, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000352, 'RENEWAL', 0000000238, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000353, 'NEW', 0000000168, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000354, 'RENEWAL', 0000000168, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000355, 'NEW', 0000000239, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000356, 'RENEWAL', 0000000239, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000357, 'NEW', 0000000034, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000358, 'RENEWAL', 0000000034, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000359, 'NEW', 0000000148, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000360, 'RENEWAL', 0000000148, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000361, 'NEW', 0000000241, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000362, 'RENEWAL', 0000000241, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000363, 'NEW', 0000000052, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000364, 'RENEWAL', 0000000052, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000365, 'NEW', 0000000242, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000366, 'RENEWAL', 0000000242, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000367, 'NEW', 0000000067, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000368, 'RENEWAL', 0000000067, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000369, 'NEW', 0000000017, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000370, 'RENEWAL', 0000000017, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000371, 'NEW', 0000000042, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000372, 'RENEWAL', 0000000042, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000373, 'NEW', 0000000009, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000374, 'RENEWAL', 0000000009, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000375, 'NEW', 0000000031, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000376, 'RENEWAL', 0000000031, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000377, 'NEW', 0000000243, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000378, 'RENEWAL', 0000000243, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000379, 'NEW', 0000000117, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000380, 'RENEWAL', 0000000117, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000381, 'NEW', 0000000153, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000382, 'RENEWAL', 0000000153, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000383, 'NEW', 0000000060, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000384, 'RENEWAL', 0000000060, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000385, 'NEW', 0000000244, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000386, 'RENEWAL', 0000000244, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000387, 'NEW', 0000000113, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000388, 'RENEWAL', 0000000113, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000389, 'NEW', 0000000154, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000390, 'RENEWAL', 0000000154, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000391, 'NEW', 0000000245, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000392, 'RENEWAL', 0000000245, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000393, 'NEW', 0000000133, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000394, 'RENEWAL', 0000000133, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000395, 'NEW', 0000000127, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000396, 'RENEWAL', 0000000127, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000397, 'NEW', 0000000121, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000398, 'RENEWAL', 0000000121, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000399, 'NEW', 0000000122, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000400, 'RENEWAL', 0000000122, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000401, 'NEW', 0000000002, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000402, 'RENEWAL', 0000000002, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000403, 'NEW', 0000000119, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000404, 'RENEWAL', 0000000119, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000405, 'NEW', 0000000161, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000406, 'RENEWAL', 0000000161, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000407, 'NEW', 0000000246, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000408, 'RENEWAL', 0000000246, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000409, 'NEW', 0000000075, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000410, 'RENEWAL', 0000000075, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000411, 'NEW', 0000000247, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000412, 'RENEWAL', 0000000247, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000413, 'NEW', 0000000136, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000414, 'RENEWAL', 0000000136, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000415, 'NEW', 0000000163, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000416, 'RENEWAL', 0000000163, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000417, 'NEW', 0000000248, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000418, 'RENEWAL', 0000000248, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000419, 'NEW', 0000000069, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000420, 'RENEWAL', 0000000069, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000421, 'NEW', 0000000167, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000422, 'RENEWAL', 0000000167, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000423, 'NEW', 0000000141, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000424, 'RENEWAL', 0000000141, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000425, 'NEW', 0000000135, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000426, 'RENEWAL', 0000000135, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000427, 'NEW', 0000000123, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000428, 'RENEWAL', 0000000123, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000429, 'NEW', 0000000250, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000430, 'RENEWAL', 0000000250, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000431, 'NEW', 0000000043, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000432, 'RENEWAL', 0000000043, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000433, 'NEW', 0000000063, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000434, 'RENEWAL', 0000000063, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000435, 'NEW', 0000000105, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000436, 'RENEWAL', 0000000105, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000437, 'NEW', 0000000124, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000438, 'RENEWAL', 0000000124, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000439, 'NEW', 0000000057, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000440, 'RENEWAL', 0000000057, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000441, 'NEW', 0000000071, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000442, 'RENEWAL', 0000000071, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000443, 'NEW', 0000000175, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000444, 'RENEWAL', 0000000175, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000445, 'NEW', 0000000251, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000446, 'RENEWAL', 0000000251, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000447, 'NEW', 0000000024, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000448, 'RENEWAL', 0000000024, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000449, 'NEW', 0000000110, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000450, 'RENEWAL', 0000000110, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000451, 'NEW', 0000000040, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000452, 'RENEWAL', 0000000040, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000453, 'NEW', 0000000120, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000454, 'RENEWAL', 0000000120, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000455, 'NEW', 0000000080, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000456, 'RENEWAL', 0000000080, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000457, 'NEW', 0000000091, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000458, 'RENEWAL', 0000000091, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000459, 'NEW', 0000000078, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000460, 'RENEWAL', 0000000078, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000461, 'NEW', 0000000145, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000462, 'RENEWAL', 0000000145, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000463, 'NEW', 0000000156, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000464, 'RENEWAL', 0000000156, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000465, 'NEW', 0000000149, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000466, 'RENEWAL', 0000000149, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000467, 'NEW', 0000000082, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000468, 'RENEWAL', 0000000082, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000469, 'NEW', 0000000187, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000470, 'RENEWAL', 0000000187, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000471, 'NEW', 0000000090, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000472, 'RENEWAL', 0000000090, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000473, 'NEW', 0000000254, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000474, 'RENEWAL', 0000000254, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000475, 'NEW', 0000000003, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000476, 'RENEWAL', 0000000003, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000477, 'NEW', 0000000253, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000478, 'RENEWAL', 0000000253, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000479, 'NEW', 0000000144, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000480, 'RENEWAL', 0000000144, 0000000007, '2021-10-08 05:32:39', '2021-10-08 05:32:39'),
(0000000481, 'NEW', 0000000173, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000482, 'RENEWAL', 0000000173, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000483, 'NEW', 0000000174, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000484, 'RENEWAL', 0000000174, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000485, 'NEW', 0000000114, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000486, 'RENEWAL', 0000000114, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000487, 'NEW', 0000000036, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000488, 'RENEWAL', 0000000036, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000489, 'NEW', 0000000028, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000490, 'RENEWAL', 0000000028, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000491, 'NEW', 0000000018, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000492, 'RENEWAL', 0000000018, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000493, 'NEW', 0000000177, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000494, 'RENEWAL', 0000000177, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000495, 'NEW', 0000000164, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000496, 'RENEWAL', 0000000164, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000497, 'NEW', 0000000178, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000498, 'RENEWAL', 0000000178, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000499, 'NEW', 0000000179, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000500, 'RENEWAL', 0000000179, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000501, 'NEW', 0000000137, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000502, 'RENEWAL', 0000000137, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000503, 'NEW', 0000000056, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000504, 'RENEWAL', 0000000056, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000505, 'NEW', 0000000006, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000506, 'RENEWAL', 0000000006, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000507, 'NEW', 0000000162, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000508, 'RENEWAL', 0000000162, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000509, 'NEW', 0000000051, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000510, 'RENEWAL', 0000000051, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000511, 'NEW', 0000000033, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000512, 'RENEWAL', 0000000033, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000513, 'NEW', 0000000180, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000514, 'RENEWAL', 0000000180, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000515, 'NEW', 0000000172, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000516, 'RENEWAL', 0000000172, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000517, 'NEW', 0000000016, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000518, 'RENEWAL', 0000000016, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000519, 'NEW', 0000000182, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000520, 'RENEWAL', 0000000182, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000521, 'NEW', 0000000083, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000522, 'RENEWAL', 0000000083, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000523, 'NEW', 0000000099, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000524, 'RENEWAL', 0000000099, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000525, 'NEW', 0000000103, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000526, 'RENEWAL', 0000000103, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000527, 'NEW', 0000000106, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000528, 'RENEWAL', 0000000106, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000529, 'NEW', 0000000183, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000530, 'RENEWAL', 0000000183, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000531, 'NEW', 0000000184, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000532, 'RENEWAL', 0000000184, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000533, 'NEW', 0000000185, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000534, 'RENEWAL', 0000000185, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000535, 'NEW', 0000000158, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000536, 'RENEWAL', 0000000158, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000537, 'NEW', 0000000186, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000538, 'RENEWAL', 0000000186, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000539, 'NEW', 0000000049, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000540, 'RENEWAL', 0000000049, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000541, 'NEW', 0000000160, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000542, 'RENEWAL', 0000000160, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000543, 'NEW', 0000000079, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000544, 'RENEWAL', 0000000079, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000545, 'NEW', 0000000096, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000546, 'RENEWAL', 0000000096, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000547, 'NEW', 0000000188, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000548, 'RENEWAL', 0000000188, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000549, 'NEW', 0000000020, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11');
INSERT INTO `requirements_classification` (`ID`, `ApplicationType`, `BusinessLineID`, `RequirementID`, `DateAdded`, `DateUpdated`) VALUES
(0000000550, 'RENEWAL', 0000000020, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000551, 'NEW', 0000000140, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000552, 'RENEWAL', 0000000140, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000553, 'NEW', 0000000058, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000554, 'RENEWAL', 0000000058, 0000000005, '2021-10-08 05:33:11', '2021-10-08 05:33:11'),
(0000000555, 'NEW', 0000000092, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000556, 'RENEWAL', 0000000092, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000557, 'NEW', 0000000130, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000558, 'RENEWAL', 0000000130, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000559, 'NEW', 0000000102, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000560, 'RENEWAL', 0000000102, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000561, 'NEW', 0000000189, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000562, 'RENEWAL', 0000000189, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000563, 'NEW', 0000000190, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000564, 'RENEWAL', 0000000190, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000565, 'NEW', 0000000191, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000566, 'RENEWAL', 0000000191, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000567, 'NEW', 0000000192, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000568, 'RENEWAL', 0000000192, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000569, 'NEW', 0000000193, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000570, 'RENEWAL', 0000000193, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000571, 'NEW', 0000000152, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000572, 'RENEWAL', 0000000152, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000573, 'NEW', 0000000147, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000574, 'RENEWAL', 0000000147, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000575, 'NEW', 0000000088, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000576, 'RENEWAL', 0000000088, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000577, 'NEW', 0000000194, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000578, 'RENEWAL', 0000000194, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000579, 'NEW', 0000000059, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000580, 'RENEWAL', 0000000059, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000581, 'NEW', 0000000021, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000582, 'RENEWAL', 0000000021, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000583, 'NEW', 0000000081, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000584, 'RENEWAL', 0000000081, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000585, 'NEW', 0000000197, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000586, 'RENEWAL', 0000000197, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000587, 'NEW', 0000000010, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000588, 'RENEWAL', 0000000010, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000589, 'NEW', 0000000198, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000590, 'RENEWAL', 0000000198, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000591, 'NEW', 0000000199, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000592, 'RENEWAL', 0000000199, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000593, 'NEW', 0000000200, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000594, 'RENEWAL', 0000000200, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000595, 'NEW', 0000000157, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000596, 'RENEWAL', 0000000157, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000597, 'NEW', 0000000201, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000598, 'RENEWAL', 0000000201, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000599, 'NEW', 0000000202, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000600, 'RENEWAL', 0000000202, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000601, 'NEW', 0000000256, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000602, 'RENEWAL', 0000000256, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000603, 'NEW', 0000000104, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000604, 'RENEWAL', 0000000104, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000605, 'NEW', 0000000170, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000606, 'RENEWAL', 0000000170, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000607, 'NEW', 0000000204, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000608, 'RENEWAL', 0000000204, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000609, 'NEW', 0000000165, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000610, 'RENEWAL', 0000000165, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000611, 'NEW', 0000000023, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000612, 'RENEWAL', 0000000023, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000613, 'NEW', 0000000014, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000614, 'NEW', 0000000048, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000615, 'RENEWAL', 0000000048, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000616, 'NEW', 0000000203, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000617, 'RENEWAL', 0000000203, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000618, 'NEW', 0000000022, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000619, 'RENEWAL', 0000000022, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000620, 'NEW', 0000000070, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000621, 'RENEWAL', 0000000070, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000622, 'NEW', 0000000151, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000623, 'RENEWAL', 0000000151, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000624, 'NEW', 0000000066, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000625, 'RENEWAL', 0000000066, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000626, 'NEW', 0000000205, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000627, 'RENEWAL', 0000000205, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000628, 'NEW', 0000000032, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000629, 'RENEWAL', 0000000032, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000630, 'NEW', 0000000207, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000631, 'RENEWAL', 0000000207, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000632, 'NEW', 0000000087, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000633, 'RENEWAL', 0000000087, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000634, 'NEW', 0000000086, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000635, 'RENEWAL', 0000000086, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000636, 'NEW', 0000000208, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000637, 'RENEWAL', 0000000208, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000638, 'NEW', 0000000209, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000639, 'RENEWAL', 0000000209, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000640, 'NEW', 0000000210, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000641, 'RENEWAL', 0000000210, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000642, 'NEW', 0000000211, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000643, 'RENEWAL', 0000000211, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000644, 'NEW', 0000000098, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000645, 'RENEWAL', 0000000098, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000646, 'NEW', 0000000212, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000647, 'RENEWAL', 0000000212, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000648, 'NEW', 0000000116, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000649, 'RENEWAL', 0000000116, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000650, 'NEW', 0000000050, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000651, 'RENEWAL', 0000000050, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000652, 'NEW', 0000000012, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000653, 'RENEWAL', 0000000012, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000654, 'NEW', 0000000129, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000655, 'RENEWAL', 0000000129, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000656, 'NEW', 0000000045, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000657, 'RENEWAL', 0000000045, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000658, 'NEW', 0000000004, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000659, 'RENEWAL', 0000000004, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000660, 'NEW', 0000000062, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000661, 'RENEWAL', 0000000062, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000662, 'NEW', 0000000214, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000663, 'RENEWAL', 0000000214, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000664, 'NEW', 0000000215, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000665, 'RENEWAL', 0000000215, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000666, 'NEW', 0000000216, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000667, 'RENEWAL', 0000000216, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000668, 'NEW', 0000000061, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000669, 'RENEWAL', 0000000061, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000670, 'NEW', 0000000084, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000671, 'RENEWAL', 0000000084, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000672, 'NEW', 0000000030, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000673, 'RENEWAL', 0000000030, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000674, 'NEW', 0000000131, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000675, 'RENEWAL', 0000000131, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000676, 'NEW', 0000000077, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000677, 'RENEWAL', 0000000077, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000678, 'NEW', 0000000008, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000679, 'RENEWAL', 0000000008, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000680, 'NEW', 0000000044, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000681, 'RENEWAL', 0000000044, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000682, 'NEW', 0000000217, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000683, 'RENEWAL', 0000000217, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000684, 'NEW', 0000000005, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000685, 'RENEWAL', 0000000005, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000686, 'NEW', 0000000146, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000687, 'RENEWAL', 0000000146, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000688, 'NEW', 0000000053, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000689, 'RENEWAL', 0000000053, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000690, 'NEW', 0000000218, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000691, 'RENEWAL', 0000000218, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000692, 'NEW', 0000000109, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000693, 'RENEWAL', 0000000109, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000694, 'NEW', 0000000089, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000695, 'RENEWAL', 0000000089, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000696, 'NEW', 0000000219, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000697, 'RENEWAL', 0000000219, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000698, 'NEW', 0000000220, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000699, 'RENEWAL', 0000000220, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000700, 'NEW', 0000000257, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000701, 'RENEWAL', 0000000257, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000702, 'NEW', 0000000255, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000703, 'RENEWAL', 0000000255, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000704, 'NEW', 0000000221, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000705, 'RENEWAL', 0000000221, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000706, 'NEW', 0000000107, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000707, 'RENEWAL', 0000000107, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000708, 'NEW', 0000000115, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000709, 'RENEWAL', 0000000115, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000710, 'NEW', 0000000132, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000711, 'RENEWAL', 0000000132, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000712, 'NEW', 0000000025, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000713, 'RENEWAL', 0000000025, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000714, 'NEW', 0000000047, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000715, 'RENEWAL', 0000000047, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000716, 'NEW', 0000000222, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000717, 'RENEWAL', 0000000222, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000718, 'RENEWAL', 0000000013, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000719, 'NEW', 0000000224, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000720, 'RENEWAL', 0000000224, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000721, 'NEW', 0000000094, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000722, 'RENEWAL', 0000000094, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000723, 'NEW', 0000000223, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000724, 'RENEWAL', 0000000223, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000725, 'NEW', 0000000007, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000726, 'RENEWAL', 0000000007, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000727, 'NEW', 0000000169, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000728, 'RENEWAL', 0000000169, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000729, 'NEW', 0000000126, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000730, 'RENEWAL', 0000000126, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000731, 'NEW', 0000000225, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000732, 'RENEWAL', 0000000225, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000733, 'NEW', 0000000041, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000734, 'RENEWAL', 0000000041, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000735, 'NEW', 0000000226, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000736, 'RENEWAL', 0000000226, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000737, 'NEW', 0000000138, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000738, 'RENEWAL', 0000000138, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000739, 'NEW', 0000000228, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000740, 'RENEWAL', 0000000228, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000741, 'NEW', 0000000229, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000742, 'RENEWAL', 0000000229, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000743, 'NEW', 0000000064, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000744, 'RENEWAL', 0000000064, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000745, 'NEW', 0000000230, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000746, 'RENEWAL', 0000000230, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000747, 'NEW', 0000000046, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000748, 'RENEWAL', 0000000046, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000749, 'NEW', 0000000232, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000750, 'RENEWAL', 0000000232, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000751, 'NEW', 0000000111, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000752, 'RENEWAL', 0000000111, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000753, 'NEW', 0000000234, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000754, 'RENEWAL', 0000000234, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000755, 'NEW', 0000000233, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000756, 'RENEWAL', 0000000233, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000757, 'NEW', 0000000235, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000758, 'RENEWAL', 0000000235, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000759, 'NEW', 0000000125, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000760, 'RENEWAL', 0000000125, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000761, 'NEW', 0000000143, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000762, 'RENEWAL', 0000000143, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000763, 'NEW', 0000000011, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000764, 'RENEWAL', 0000000011, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000765, 'NEW', 0000000038, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000766, 'RENEWAL', 0000000038, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000767, 'NEW', 0000000118, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000768, 'RENEWAL', 0000000118, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000769, 'NEW', 0000000026, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000770, 'RENEWAL', 0000000026, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000771, 'NEW', 0000000027, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000772, 'RENEWAL', 0000000027, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000773, 'NEW', 0000000128, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000774, 'RENEWAL', 0000000128, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000775, 'NEW', 0000000150, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000776, 'RENEWAL', 0000000150, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000777, 'NEW', 0000000159, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000778, 'RENEWAL', 0000000159, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000779, 'NEW', 0000000139, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000780, 'RENEWAL', 0000000139, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000781, 'NEW', 0000000068, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000782, 'RENEWAL', 0000000068, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000783, 'NEW', 0000000101, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000784, 'RENEWAL', 0000000101, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000785, 'NEW', 0000000166, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000786, 'RENEWAL', 0000000166, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000787, 'NEW', 0000000074, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000788, 'RENEWAL', 0000000074, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000789, 'NEW', 0000000029, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000790, 'RENEWAL', 0000000029, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000791, 'NEW', 0000000134, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000792, 'RENEWAL', 0000000134, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000793, 'NEW', 0000000237, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000794, 'RENEWAL', 0000000237, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000795, 'NEW', 0000000238, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000796, 'RENEWAL', 0000000238, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000797, 'NEW', 0000000168, 0000000005, '2021-10-08 05:33:12', '2021-10-08 05:33:12'),
(0000000798, 'RENEWAL', 0000000168, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000799, 'NEW', 0000000239, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000800, 'RENEWAL', 0000000239, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000801, 'NEW', 0000000034, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000802, 'RENEWAL', 0000000034, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000803, 'NEW', 0000000148, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000804, 'RENEWAL', 0000000148, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000805, 'NEW', 0000000241, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000806, 'RENEWAL', 0000000241, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000807, 'NEW', 0000000052, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000808, 'RENEWAL', 0000000052, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000809, 'NEW', 0000000242, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000810, 'RENEWAL', 0000000242, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000811, 'NEW', 0000000067, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000812, 'RENEWAL', 0000000067, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000813, 'NEW', 0000000017, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000814, 'RENEWAL', 0000000017, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000815, 'NEW', 0000000042, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000816, 'RENEWAL', 0000000042, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000817, 'NEW', 0000000009, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000818, 'RENEWAL', 0000000009, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000819, 'NEW', 0000000031, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000820, 'RENEWAL', 0000000031, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000821, 'NEW', 0000000243, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000822, 'RENEWAL', 0000000243, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000823, 'NEW', 0000000117, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000824, 'RENEWAL', 0000000117, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000825, 'NEW', 0000000153, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000826, 'RENEWAL', 0000000153, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000827, 'NEW', 0000000060, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000828, 'RENEWAL', 0000000060, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000829, 'NEW', 0000000244, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000830, 'RENEWAL', 0000000244, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000831, 'NEW', 0000000113, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000832, 'RENEWAL', 0000000113, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000833, 'NEW', 0000000154, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000834, 'RENEWAL', 0000000154, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000835, 'NEW', 0000000245, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000836, 'RENEWAL', 0000000245, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000837, 'NEW', 0000000133, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000838, 'RENEWAL', 0000000133, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000839, 'NEW', 0000000127, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000840, 'RENEWAL', 0000000127, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000841, 'NEW', 0000000121, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000842, 'RENEWAL', 0000000121, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000843, 'NEW', 0000000122, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000844, 'RENEWAL', 0000000122, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000845, 'NEW', 0000000002, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000846, 'RENEWAL', 0000000002, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000847, 'NEW', 0000000119, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000848, 'RENEWAL', 0000000119, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000849, 'NEW', 0000000161, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000850, 'RENEWAL', 0000000161, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000851, 'NEW', 0000000246, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000852, 'RENEWAL', 0000000246, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000853, 'NEW', 0000000075, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000854, 'RENEWAL', 0000000075, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000855, 'NEW', 0000000247, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000856, 'RENEWAL', 0000000247, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000857, 'NEW', 0000000136, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000858, 'RENEWAL', 0000000136, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000859, 'NEW', 0000000163, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000860, 'RENEWAL', 0000000163, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000861, 'NEW', 0000000248, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000862, 'RENEWAL', 0000000248, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000863, 'NEW', 0000000069, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000864, 'RENEWAL', 0000000069, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000865, 'NEW', 0000000167, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000866, 'RENEWAL', 0000000167, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000867, 'NEW', 0000000141, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000868, 'RENEWAL', 0000000141, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000869, 'NEW', 0000000135, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000870, 'RENEWAL', 0000000135, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000871, 'NEW', 0000000123, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000872, 'RENEWAL', 0000000123, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000873, 'NEW', 0000000250, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000874, 'RENEWAL', 0000000250, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000875, 'NEW', 0000000043, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000876, 'RENEWAL', 0000000043, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000877, 'NEW', 0000000063, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000878, 'RENEWAL', 0000000063, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000879, 'NEW', 0000000105, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000880, 'RENEWAL', 0000000105, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000881, 'NEW', 0000000124, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000882, 'RENEWAL', 0000000124, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000883, 'NEW', 0000000057, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000884, 'RENEWAL', 0000000057, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000885, 'NEW', 0000000071, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000886, 'RENEWAL', 0000000071, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000887, 'NEW', 0000000175, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000888, 'RENEWAL', 0000000175, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000889, 'NEW', 0000000251, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000890, 'RENEWAL', 0000000251, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000891, 'NEW', 0000000024, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000892, 'RENEWAL', 0000000024, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000893, 'NEW', 0000000110, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000894, 'RENEWAL', 0000000110, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000895, 'NEW', 0000000040, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000896, 'RENEWAL', 0000000040, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000897, 'NEW', 0000000120, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000898, 'RENEWAL', 0000000120, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000899, 'NEW', 0000000080, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000900, 'RENEWAL', 0000000080, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000901, 'NEW', 0000000091, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000902, 'RENEWAL', 0000000091, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000903, 'NEW', 0000000078, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000904, 'RENEWAL', 0000000078, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000905, 'NEW', 0000000145, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000906, 'RENEWAL', 0000000145, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000907, 'NEW', 0000000156, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000908, 'RENEWAL', 0000000156, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000909, 'NEW', 0000000149, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000910, 'RENEWAL', 0000000149, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000911, 'NEW', 0000000082, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000912, 'RENEWAL', 0000000082, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000913, 'NEW', 0000000187, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000914, 'RENEWAL', 0000000187, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000915, 'NEW', 0000000090, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000916, 'RENEWAL', 0000000090, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000917, 'NEW', 0000000254, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000918, 'RENEWAL', 0000000254, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000919, 'NEW', 0000000003, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000920, 'RENEWAL', 0000000003, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000921, 'NEW', 0000000253, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000922, 'RENEWAL', 0000000253, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000923, 'NEW', 0000000144, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000924, 'RENEWAL', 0000000144, 0000000005, '2021-10-08 05:33:13', '2021-10-08 05:33:13'),
(0000000925, 'NEW', 0000000173, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000926, 'RENEWAL', 0000000173, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000927, 'NEW', 0000000174, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000928, 'RENEWAL', 0000000174, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000929, 'NEW', 0000000114, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000930, 'RENEWAL', 0000000114, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000931, 'NEW', 0000000036, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000932, 'RENEWAL', 0000000036, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000933, 'NEW', 0000000028, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000934, 'RENEWAL', 0000000028, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000935, 'NEW', 0000000018, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000936, 'RENEWAL', 0000000018, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000937, 'NEW', 0000000177, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000938, 'RENEWAL', 0000000177, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000939, 'NEW', 0000000164, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000940, 'RENEWAL', 0000000164, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000941, 'NEW', 0000000178, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000942, 'RENEWAL', 0000000178, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000943, 'NEW', 0000000179, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000944, 'RENEWAL', 0000000179, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000945, 'NEW', 0000000137, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000946, 'RENEWAL', 0000000137, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000947, 'NEW', 0000000056, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000948, 'RENEWAL', 0000000056, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000949, 'NEW', 0000000006, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000950, 'RENEWAL', 0000000006, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000951, 'NEW', 0000000162, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000952, 'RENEWAL', 0000000162, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000953, 'NEW', 0000000051, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000954, 'RENEWAL', 0000000051, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000955, 'NEW', 0000000033, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000956, 'RENEWAL', 0000000033, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000957, 'NEW', 0000000180, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000958, 'RENEWAL', 0000000180, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000959, 'NEW', 0000000172, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000960, 'RENEWAL', 0000000172, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000961, 'NEW', 0000000016, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000962, 'RENEWAL', 0000000016, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000963, 'NEW', 0000000182, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000964, 'RENEWAL', 0000000182, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000965, 'NEW', 0000000083, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000966, 'RENEWAL', 0000000083, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000967, 'NEW', 0000000099, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000968, 'RENEWAL', 0000000099, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000969, 'NEW', 0000000103, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000970, 'RENEWAL', 0000000103, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000971, 'NEW', 0000000106, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000972, 'RENEWAL', 0000000106, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000973, 'NEW', 0000000183, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000974, 'RENEWAL', 0000000183, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000975, 'NEW', 0000000184, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000976, 'RENEWAL', 0000000184, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000977, 'NEW', 0000000185, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000978, 'RENEWAL', 0000000185, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000979, 'NEW', 0000000158, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000980, 'RENEWAL', 0000000158, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000981, 'NEW', 0000000186, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000982, 'RENEWAL', 0000000186, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000983, 'NEW', 0000000049, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000984, 'RENEWAL', 0000000049, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000985, 'NEW', 0000000160, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000986, 'RENEWAL', 0000000160, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000987, 'NEW', 0000000079, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000988, 'RENEWAL', 0000000079, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000989, 'NEW', 0000000096, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000990, 'RENEWAL', 0000000096, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000991, 'NEW', 0000000188, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000992, 'RENEWAL', 0000000188, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000993, 'NEW', 0000000020, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000994, 'RENEWAL', 0000000020, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000995, 'NEW', 0000000140, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000996, 'RENEWAL', 0000000140, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000997, 'NEW', 0000000058, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000998, 'RENEWAL', 0000000058, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000000999, 'NEW', 0000000092, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000001000, 'RENEWAL', 0000000092, 0000000001, '2021-10-08 05:33:42', '2021-10-08 05:33:42'),
(0000001001, 'NEW', 0000000130, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001002, 'RENEWAL', 0000000130, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001003, 'NEW', 0000000102, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001004, 'RENEWAL', 0000000102, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001005, 'NEW', 0000000189, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001006, 'RENEWAL', 0000000189, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001007, 'NEW', 0000000190, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001008, 'RENEWAL', 0000000190, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001009, 'NEW', 0000000191, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001010, 'RENEWAL', 0000000191, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001011, 'NEW', 0000000192, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001012, 'RENEWAL', 0000000192, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001013, 'NEW', 0000000193, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001014, 'RENEWAL', 0000000193, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001015, 'NEW', 0000000152, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001016, 'RENEWAL', 0000000152, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001017, 'NEW', 0000000147, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001018, 'RENEWAL', 0000000147, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001019, 'NEW', 0000000088, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001020, 'RENEWAL', 0000000088, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001021, 'NEW', 0000000194, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001022, 'RENEWAL', 0000000194, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001023, 'NEW', 0000000059, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001024, 'RENEWAL', 0000000059, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001025, 'NEW', 0000000021, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001026, 'RENEWAL', 0000000021, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001027, 'NEW', 0000000081, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001028, 'RENEWAL', 0000000081, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001029, 'NEW', 0000000197, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001030, 'RENEWAL', 0000000197, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001031, 'NEW', 0000000010, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001032, 'RENEWAL', 0000000010, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001033, 'NEW', 0000000198, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001034, 'RENEWAL', 0000000198, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001035, 'NEW', 0000000199, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001036, 'RENEWAL', 0000000199, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001037, 'NEW', 0000000200, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001038, 'RENEWAL', 0000000200, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001039, 'NEW', 0000000157, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001040, 'RENEWAL', 0000000157, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001041, 'NEW', 0000000201, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001042, 'RENEWAL', 0000000201, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001043, 'NEW', 0000000202, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001044, 'RENEWAL', 0000000202, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001045, 'NEW', 0000000256, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001046, 'RENEWAL', 0000000256, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001047, 'NEW', 0000000104, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001048, 'RENEWAL', 0000000104, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001049, 'NEW', 0000000170, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001050, 'RENEWAL', 0000000170, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001051, 'NEW', 0000000204, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001052, 'RENEWAL', 0000000204, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001053, 'NEW', 0000000165, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001054, 'RENEWAL', 0000000165, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001055, 'NEW', 0000000023, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001056, 'RENEWAL', 0000000023, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001057, 'NEW', 0000000014, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001058, 'NEW', 0000000048, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001059, 'RENEWAL', 0000000048, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001060, 'NEW', 0000000203, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001061, 'RENEWAL', 0000000203, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001062, 'NEW', 0000000022, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001063, 'RENEWAL', 0000000022, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001064, 'NEW', 0000000070, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001065, 'RENEWAL', 0000000070, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001066, 'NEW', 0000000151, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001067, 'RENEWAL', 0000000151, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001068, 'NEW', 0000000066, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001069, 'RENEWAL', 0000000066, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001070, 'NEW', 0000000205, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001071, 'RENEWAL', 0000000205, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001072, 'NEW', 0000000032, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001073, 'RENEWAL', 0000000032, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001074, 'NEW', 0000000207, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001075, 'RENEWAL', 0000000207, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001076, 'NEW', 0000000087, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001077, 'RENEWAL', 0000000087, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001078, 'NEW', 0000000086, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001079, 'RENEWAL', 0000000086, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001080, 'NEW', 0000000208, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001081, 'RENEWAL', 0000000208, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001082, 'NEW', 0000000209, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001083, 'RENEWAL', 0000000209, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001084, 'NEW', 0000000210, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001085, 'RENEWAL', 0000000210, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001086, 'NEW', 0000000211, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001087, 'RENEWAL', 0000000211, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001088, 'NEW', 0000000098, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001089, 'RENEWAL', 0000000098, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001090, 'NEW', 0000000212, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001091, 'RENEWAL', 0000000212, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001092, 'NEW', 0000000116, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001093, 'RENEWAL', 0000000116, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001094, 'NEW', 0000000050, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001095, 'RENEWAL', 0000000050, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001096, 'NEW', 0000000012, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43');
INSERT INTO `requirements_classification` (`ID`, `ApplicationType`, `BusinessLineID`, `RequirementID`, `DateAdded`, `DateUpdated`) VALUES
(0000001097, 'RENEWAL', 0000000012, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001098, 'NEW', 0000000129, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001099, 'RENEWAL', 0000000129, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001100, 'NEW', 0000000045, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001101, 'RENEWAL', 0000000045, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001102, 'NEW', 0000000004, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001103, 'RENEWAL', 0000000004, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001104, 'NEW', 0000000062, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001105, 'RENEWAL', 0000000062, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001106, 'NEW', 0000000214, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001107, 'RENEWAL', 0000000214, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001108, 'NEW', 0000000215, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001109, 'RENEWAL', 0000000215, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001110, 'NEW', 0000000216, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001111, 'RENEWAL', 0000000216, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001112, 'NEW', 0000000061, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001113, 'RENEWAL', 0000000061, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001114, 'NEW', 0000000084, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001115, 'RENEWAL', 0000000084, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001116, 'NEW', 0000000030, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001117, 'RENEWAL', 0000000030, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001118, 'NEW', 0000000131, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001119, 'RENEWAL', 0000000131, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001120, 'NEW', 0000000077, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001121, 'RENEWAL', 0000000077, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001122, 'NEW', 0000000008, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001123, 'RENEWAL', 0000000008, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001124, 'NEW', 0000000044, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001125, 'RENEWAL', 0000000044, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001126, 'NEW', 0000000217, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001127, 'RENEWAL', 0000000217, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001128, 'NEW', 0000000005, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001129, 'RENEWAL', 0000000005, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001130, 'NEW', 0000000146, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001131, 'RENEWAL', 0000000146, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001132, 'NEW', 0000000053, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001133, 'RENEWAL', 0000000053, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001134, 'NEW', 0000000218, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001135, 'RENEWAL', 0000000218, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001136, 'NEW', 0000000109, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001137, 'RENEWAL', 0000000109, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001138, 'NEW', 0000000089, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001139, 'RENEWAL', 0000000089, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001140, 'NEW', 0000000219, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001141, 'RENEWAL', 0000000219, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001142, 'NEW', 0000000220, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001143, 'RENEWAL', 0000000220, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001144, 'NEW', 0000000035, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001145, 'RENEWAL', 0000000035, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001146, 'NEW', 0000000257, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001147, 'RENEWAL', 0000000257, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001148, 'NEW', 0000000255, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001149, 'RENEWAL', 0000000255, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001150, 'NEW', 0000000221, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001151, 'RENEWAL', 0000000221, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001152, 'NEW', 0000000107, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001153, 'RENEWAL', 0000000107, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001154, 'NEW', 0000000115, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001155, 'RENEWAL', 0000000115, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001156, 'NEW', 0000000132, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001157, 'RENEWAL', 0000000132, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001158, 'NEW', 0000000025, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001159, 'RENEWAL', 0000000025, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001160, 'NEW', 0000000047, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001161, 'RENEWAL', 0000000047, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001162, 'NEW', 0000000222, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001163, 'RENEWAL', 0000000222, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001164, 'RENEWAL', 0000000013, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001165, 'NEW', 0000000224, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001166, 'RENEWAL', 0000000224, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001167, 'NEW', 0000000094, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001168, 'RENEWAL', 0000000094, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001169, 'NEW', 0000000223, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001170, 'RENEWAL', 0000000223, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001171, 'NEW', 0000000007, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001172, 'RENEWAL', 0000000007, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001173, 'NEW', 0000000169, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001174, 'RENEWAL', 0000000169, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001175, 'NEW', 0000000126, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001176, 'RENEWAL', 0000000126, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001177, 'NEW', 0000000225, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001178, 'RENEWAL', 0000000225, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001179, 'NEW', 0000000041, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001180, 'RENEWAL', 0000000041, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001181, 'NEW', 0000000226, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001182, 'RENEWAL', 0000000226, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001183, 'NEW', 0000000138, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001184, 'RENEWAL', 0000000138, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001185, 'NEW', 0000000228, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001186, 'RENEWAL', 0000000228, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001187, 'NEW', 0000000229, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001188, 'RENEWAL', 0000000229, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001189, 'NEW', 0000000064, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001190, 'RENEWAL', 0000000064, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001191, 'NEW', 0000000230, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001192, 'RENEWAL', 0000000230, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001193, 'NEW', 0000000046, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001194, 'RENEWAL', 0000000046, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001195, 'NEW', 0000000232, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001196, 'RENEWAL', 0000000232, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001197, 'NEW', 0000000111, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001198, 'RENEWAL', 0000000111, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001199, 'NEW', 0000000234, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001200, 'RENEWAL', 0000000234, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001201, 'NEW', 0000000233, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001202, 'RENEWAL', 0000000233, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001203, 'NEW', 0000000235, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001204, 'RENEWAL', 0000000235, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001205, 'NEW', 0000000125, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001206, 'RENEWAL', 0000000125, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001207, 'NEW', 0000000143, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001208, 'RENEWAL', 0000000143, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001209, 'NEW', 0000000011, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001210, 'RENEWAL', 0000000011, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001211, 'NEW', 0000000038, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001212, 'RENEWAL', 0000000038, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001213, 'NEW', 0000000118, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001214, 'RENEWAL', 0000000118, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001215, 'NEW', 0000000026, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001216, 'RENEWAL', 0000000026, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001217, 'NEW', 0000000027, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001218, 'RENEWAL', 0000000027, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001219, 'NEW', 0000000128, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001220, 'RENEWAL', 0000000128, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001221, 'NEW', 0000000150, 0000000001, '2021-10-08 05:33:43', '2021-10-08 05:33:43'),
(0000001222, 'RENEWAL', 0000000150, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001223, 'NEW', 0000000159, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001224, 'RENEWAL', 0000000159, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001225, 'NEW', 0000000139, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001226, 'RENEWAL', 0000000139, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001227, 'NEW', 0000000068, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001228, 'RENEWAL', 0000000068, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001229, 'NEW', 0000000101, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001230, 'RENEWAL', 0000000101, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001231, 'NEW', 0000000166, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001232, 'RENEWAL', 0000000166, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001233, 'NEW', 0000000074, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001234, 'RENEWAL', 0000000074, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001235, 'NEW', 0000000029, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001236, 'RENEWAL', 0000000029, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001237, 'NEW', 0000000134, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001238, 'RENEWAL', 0000000134, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001239, 'NEW', 0000000237, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001240, 'RENEWAL', 0000000237, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001241, 'NEW', 0000000238, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001242, 'RENEWAL', 0000000238, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001243, 'NEW', 0000000168, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001244, 'RENEWAL', 0000000168, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001245, 'NEW', 0000000239, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001246, 'RENEWAL', 0000000239, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001247, 'NEW', 0000000034, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001248, 'RENEWAL', 0000000034, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001249, 'NEW', 0000000148, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001250, 'RENEWAL', 0000000148, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001251, 'NEW', 0000000241, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001252, 'RENEWAL', 0000000241, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001253, 'NEW', 0000000052, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001254, 'RENEWAL', 0000000052, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001255, 'NEW', 0000000242, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001256, 'RENEWAL', 0000000242, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001257, 'NEW', 0000000067, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001258, 'RENEWAL', 0000000067, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001259, 'NEW', 0000000017, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001260, 'RENEWAL', 0000000017, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001261, 'NEW', 0000000042, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001262, 'RENEWAL', 0000000042, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001263, 'NEW', 0000000009, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001264, 'RENEWAL', 0000000009, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001265, 'NEW', 0000000031, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001266, 'RENEWAL', 0000000031, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001267, 'NEW', 0000000243, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001268, 'RENEWAL', 0000000243, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001269, 'NEW', 0000000117, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001270, 'RENEWAL', 0000000117, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001271, 'NEW', 0000000153, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001272, 'RENEWAL', 0000000153, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001273, 'NEW', 0000000060, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001274, 'RENEWAL', 0000000060, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001275, 'NEW', 0000000244, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001276, 'RENEWAL', 0000000244, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001277, 'NEW', 0000000113, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001278, 'RENEWAL', 0000000113, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001279, 'NEW', 0000000154, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001280, 'RENEWAL', 0000000154, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001281, 'NEW', 0000000245, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001282, 'RENEWAL', 0000000245, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001283, 'NEW', 0000000133, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001284, 'RENEWAL', 0000000133, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001285, 'NEW', 0000000127, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001286, 'RENEWAL', 0000000127, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001287, 'NEW', 0000000121, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001288, 'RENEWAL', 0000000121, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001289, 'NEW', 0000000122, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001290, 'RENEWAL', 0000000122, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001291, 'NEW', 0000000002, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001292, 'RENEWAL', 0000000002, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001293, 'NEW', 0000000119, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001294, 'RENEWAL', 0000000119, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001295, 'NEW', 0000000161, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001296, 'RENEWAL', 0000000161, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001297, 'NEW', 0000000246, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001298, 'RENEWAL', 0000000246, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001299, 'NEW', 0000000075, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001300, 'RENEWAL', 0000000075, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001301, 'NEW', 0000000247, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001302, 'RENEWAL', 0000000247, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001303, 'NEW', 0000000136, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001304, 'RENEWAL', 0000000136, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001305, 'NEW', 0000000163, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001306, 'RENEWAL', 0000000163, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001307, 'NEW', 0000000248, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001308, 'RENEWAL', 0000000248, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001309, 'NEW', 0000000069, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001310, 'RENEWAL', 0000000069, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001311, 'NEW', 0000000167, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001312, 'RENEWAL', 0000000167, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001313, 'NEW', 0000000141, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001314, 'RENEWAL', 0000000141, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001315, 'NEW', 0000000135, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001316, 'RENEWAL', 0000000135, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001317, 'NEW', 0000000123, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001318, 'RENEWAL', 0000000123, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001319, 'NEW', 0000000250, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001320, 'RENEWAL', 0000000250, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001321, 'NEW', 0000000043, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001322, 'RENEWAL', 0000000043, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001323, 'NEW', 0000000063, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001324, 'RENEWAL', 0000000063, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001325, 'NEW', 0000000105, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001326, 'RENEWAL', 0000000105, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001327, 'NEW', 0000000124, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001328, 'RENEWAL', 0000000124, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001329, 'NEW', 0000000057, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001330, 'RENEWAL', 0000000057, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001331, 'NEW', 0000000071, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001332, 'RENEWAL', 0000000071, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001333, 'NEW', 0000000175, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001334, 'RENEWAL', 0000000175, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001335, 'NEW', 0000000251, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001336, 'RENEWAL', 0000000251, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001337, 'NEW', 0000000024, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001338, 'RENEWAL', 0000000024, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001339, 'NEW', 0000000110, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001340, 'RENEWAL', 0000000110, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001341, 'NEW', 0000000040, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001342, 'RENEWAL', 0000000040, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001343, 'NEW', 0000000120, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001344, 'RENEWAL', 0000000120, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001345, 'NEW', 0000000080, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001346, 'RENEWAL', 0000000080, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001347, 'NEW', 0000000091, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001348, 'RENEWAL', 0000000091, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001349, 'NEW', 0000000078, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001350, 'RENEWAL', 0000000078, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001351, 'NEW', 0000000145, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001352, 'RENEWAL', 0000000145, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001353, 'NEW', 0000000156, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001354, 'RENEWAL', 0000000156, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001355, 'NEW', 0000000149, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001356, 'RENEWAL', 0000000149, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001357, 'NEW', 0000000082, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001358, 'RENEWAL', 0000000082, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001359, 'NEW', 0000000187, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001360, 'RENEWAL', 0000000187, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001361, 'NEW', 0000000090, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001362, 'RENEWAL', 0000000090, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001363, 'NEW', 0000000254, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001364, 'RENEWAL', 0000000254, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001365, 'NEW', 0000000003, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001366, 'RENEWAL', 0000000003, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001367, 'NEW', 0000000253, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001368, 'RENEWAL', 0000000253, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001369, 'NEW', 0000000144, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001370, 'RENEWAL', 0000000144, 0000000001, '2021-10-08 05:33:44', '2021-10-08 05:33:44'),
(0000001371, 'NEW', 0000000173, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001372, 'RENEWAL', 0000000173, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001373, 'NEW', 0000000174, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001374, 'RENEWAL', 0000000174, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001375, 'NEW', 0000000114, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001376, 'RENEWAL', 0000000114, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001377, 'NEW', 0000000036, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001378, 'RENEWAL', 0000000036, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001379, 'NEW', 0000000028, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001380, 'RENEWAL', 0000000028, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001381, 'NEW', 0000000018, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001382, 'RENEWAL', 0000000018, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001383, 'NEW', 0000000177, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001384, 'RENEWAL', 0000000177, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001385, 'NEW', 0000000164, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001386, 'RENEWAL', 0000000164, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001387, 'NEW', 0000000178, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001388, 'RENEWAL', 0000000178, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001389, 'NEW', 0000000179, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001390, 'RENEWAL', 0000000179, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001391, 'NEW', 0000000137, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001392, 'RENEWAL', 0000000137, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001393, 'NEW', 0000000056, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001394, 'RENEWAL', 0000000056, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001395, 'NEW', 0000000006, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001396, 'RENEWAL', 0000000006, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001397, 'NEW', 0000000162, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001398, 'RENEWAL', 0000000162, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001399, 'NEW', 0000000051, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001400, 'RENEWAL', 0000000051, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001401, 'NEW', 0000000033, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001402, 'RENEWAL', 0000000033, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001403, 'NEW', 0000000180, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001404, 'RENEWAL', 0000000180, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001405, 'NEW', 0000000172, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001406, 'RENEWAL', 0000000172, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001407, 'NEW', 0000000016, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001408, 'RENEWAL', 0000000016, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001409, 'NEW', 0000000182, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001410, 'RENEWAL', 0000000182, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001411, 'NEW', 0000000083, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001412, 'RENEWAL', 0000000083, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001413, 'NEW', 0000000099, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001414, 'RENEWAL', 0000000099, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001415, 'NEW', 0000000103, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001416, 'RENEWAL', 0000000103, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001417, 'NEW', 0000000106, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001418, 'RENEWAL', 0000000106, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001419, 'NEW', 0000000183, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001420, 'RENEWAL', 0000000183, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001421, 'NEW', 0000000184, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001422, 'RENEWAL', 0000000184, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001423, 'NEW', 0000000185, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001424, 'RENEWAL', 0000000185, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001425, 'NEW', 0000000158, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001426, 'RENEWAL', 0000000158, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001427, 'NEW', 0000000186, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001428, 'RENEWAL', 0000000186, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001429, 'NEW', 0000000049, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001430, 'RENEWAL', 0000000049, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001431, 'NEW', 0000000160, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001432, 'RENEWAL', 0000000160, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001433, 'NEW', 0000000079, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001434, 'RENEWAL', 0000000079, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001435, 'NEW', 0000000096, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001436, 'RENEWAL', 0000000096, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001437, 'NEW', 0000000188, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001438, 'RENEWAL', 0000000188, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001439, 'NEW', 0000000020, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001440, 'RENEWAL', 0000000020, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001441, 'NEW', 0000000140, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001442, 'RENEWAL', 0000000140, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001443, 'NEW', 0000000058, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001444, 'RENEWAL', 0000000058, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001445, 'NEW', 0000000092, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001446, 'RENEWAL', 0000000092, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001447, 'NEW', 0000000130, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001448, 'RENEWAL', 0000000130, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001449, 'NEW', 0000000102, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001450, 'RENEWAL', 0000000102, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001451, 'NEW', 0000000189, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001452, 'RENEWAL', 0000000189, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001453, 'NEW', 0000000190, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001454, 'RENEWAL', 0000000190, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001455, 'NEW', 0000000191, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001456, 'RENEWAL', 0000000191, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001457, 'NEW', 0000000192, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001458, 'RENEWAL', 0000000192, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001459, 'NEW', 0000000193, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001460, 'RENEWAL', 0000000193, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001461, 'NEW', 0000000152, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001462, 'RENEWAL', 0000000152, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001463, 'NEW', 0000000147, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001464, 'RENEWAL', 0000000147, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001465, 'NEW', 0000000088, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001466, 'RENEWAL', 0000000088, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001467, 'NEW', 0000000194, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001468, 'RENEWAL', 0000000194, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001469, 'NEW', 0000000059, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001470, 'RENEWAL', 0000000059, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001471, 'NEW', 0000000021, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001472, 'RENEWAL', 0000000021, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001473, 'NEW', 0000000081, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001474, 'RENEWAL', 0000000081, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001475, 'NEW', 0000000197, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001476, 'RENEWAL', 0000000197, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001477, 'NEW', 0000000010, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001478, 'RENEWAL', 0000000010, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001479, 'NEW', 0000000198, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001480, 'RENEWAL', 0000000198, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001481, 'NEW', 0000000199, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001482, 'RENEWAL', 0000000199, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001483, 'NEW', 0000000200, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001484, 'RENEWAL', 0000000200, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001485, 'NEW', 0000000157, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001486, 'RENEWAL', 0000000157, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001487, 'NEW', 0000000201, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001488, 'RENEWAL', 0000000201, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001489, 'NEW', 0000000202, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001490, 'RENEWAL', 0000000202, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001491, 'NEW', 0000000256, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001492, 'RENEWAL', 0000000256, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001493, 'NEW', 0000000104, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001494, 'RENEWAL', 0000000104, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001495, 'NEW', 0000000170, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001496, 'RENEWAL', 0000000170, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001497, 'NEW', 0000000204, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001498, 'RENEWAL', 0000000204, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001499, 'NEW', 0000000165, 0000000006, '2021-10-08 05:34:08', '2021-10-08 05:34:08'),
(0000001500, 'RENEWAL', 0000000165, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001501, 'NEW', 0000000023, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001502, 'RENEWAL', 0000000023, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001503, 'NEW', 0000000014, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001504, 'NEW', 0000000048, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001505, 'RENEWAL', 0000000048, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001506, 'NEW', 0000000203, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001507, 'RENEWAL', 0000000203, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001508, 'NEW', 0000000022, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001509, 'RENEWAL', 0000000022, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001510, 'NEW', 0000000070, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001511, 'RENEWAL', 0000000070, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001512, 'NEW', 0000000151, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001513, 'RENEWAL', 0000000151, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001514, 'NEW', 0000000066, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001515, 'RENEWAL', 0000000066, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001516, 'NEW', 0000000205, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001517, 'RENEWAL', 0000000205, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001518, 'NEW', 0000000032, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001519, 'RENEWAL', 0000000032, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001520, 'NEW', 0000000207, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001521, 'RENEWAL', 0000000207, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001522, 'NEW', 0000000087, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001523, 'RENEWAL', 0000000087, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001524, 'NEW', 0000000086, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001525, 'RENEWAL', 0000000086, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001526, 'NEW', 0000000208, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001527, 'RENEWAL', 0000000208, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001528, 'NEW', 0000000209, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001529, 'RENEWAL', 0000000209, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001530, 'NEW', 0000000210, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001531, 'RENEWAL', 0000000210, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001532, 'NEW', 0000000211, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001533, 'RENEWAL', 0000000211, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001534, 'NEW', 0000000098, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001535, 'RENEWAL', 0000000098, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001536, 'NEW', 0000000212, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001537, 'RENEWAL', 0000000212, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001538, 'NEW', 0000000116, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001539, 'RENEWAL', 0000000116, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001540, 'NEW', 0000000050, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001541, 'RENEWAL', 0000000050, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001542, 'NEW', 0000000012, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001543, 'RENEWAL', 0000000012, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001544, 'NEW', 0000000129, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001545, 'RENEWAL', 0000000129, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001546, 'NEW', 0000000045, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001547, 'RENEWAL', 0000000045, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001548, 'NEW', 0000000004, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001549, 'RENEWAL', 0000000004, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001550, 'NEW', 0000000062, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001551, 'RENEWAL', 0000000062, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001552, 'NEW', 0000000214, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001553, 'RENEWAL', 0000000214, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001554, 'NEW', 0000000215, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001555, 'RENEWAL', 0000000215, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001556, 'NEW', 0000000216, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001557, 'RENEWAL', 0000000216, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001558, 'NEW', 0000000061, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001559, 'RENEWAL', 0000000061, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001560, 'NEW', 0000000084, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001561, 'RENEWAL', 0000000084, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001562, 'NEW', 0000000030, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001563, 'RENEWAL', 0000000030, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001564, 'NEW', 0000000131, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001565, 'RENEWAL', 0000000131, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001566, 'NEW', 0000000077, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001567, 'RENEWAL', 0000000077, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001568, 'NEW', 0000000008, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001569, 'RENEWAL', 0000000008, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001570, 'NEW', 0000000044, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001571, 'RENEWAL', 0000000044, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001572, 'NEW', 0000000217, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001573, 'RENEWAL', 0000000217, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001574, 'NEW', 0000000005, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001575, 'RENEWAL', 0000000005, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001576, 'NEW', 0000000146, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001577, 'RENEWAL', 0000000146, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001578, 'NEW', 0000000053, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001579, 'RENEWAL', 0000000053, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001580, 'NEW', 0000000218, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001581, 'RENEWAL', 0000000218, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001582, 'NEW', 0000000109, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001583, 'RENEWAL', 0000000109, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001584, 'NEW', 0000000089, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001585, 'RENEWAL', 0000000089, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001586, 'NEW', 0000000219, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001587, 'RENEWAL', 0000000219, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001588, 'NEW', 0000000220, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001589, 'RENEWAL', 0000000220, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001590, 'NEW', 0000000035, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001591, 'RENEWAL', 0000000035, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001592, 'NEW', 0000000257, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001593, 'RENEWAL', 0000000257, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001594, 'NEW', 0000000255, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001595, 'RENEWAL', 0000000255, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001596, 'NEW', 0000000221, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001597, 'RENEWAL', 0000000221, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001598, 'NEW', 0000000107, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001599, 'RENEWAL', 0000000107, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001600, 'NEW', 0000000115, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001601, 'RENEWAL', 0000000115, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001602, 'NEW', 0000000132, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001603, 'RENEWAL', 0000000132, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001604, 'NEW', 0000000025, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001605, 'RENEWAL', 0000000025, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001606, 'NEW', 0000000047, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001607, 'RENEWAL', 0000000047, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001608, 'NEW', 0000000222, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001609, 'RENEWAL', 0000000222, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001610, 'RENEWAL', 0000000013, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001611, 'NEW', 0000000224, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001612, 'RENEWAL', 0000000224, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001613, 'NEW', 0000000094, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001614, 'RENEWAL', 0000000094, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001615, 'NEW', 0000000223, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001616, 'RENEWAL', 0000000223, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001617, 'NEW', 0000000007, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001618, 'RENEWAL', 0000000007, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001619, 'NEW', 0000000169, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001620, 'RENEWAL', 0000000169, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001621, 'NEW', 0000000126, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001622, 'RENEWAL', 0000000126, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001623, 'NEW', 0000000225, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001624, 'RENEWAL', 0000000225, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001625, 'NEW', 0000000041, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001626, 'RENEWAL', 0000000041, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001627, 'NEW', 0000000226, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001628, 'RENEWAL', 0000000226, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001629, 'NEW', 0000000138, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001630, 'RENEWAL', 0000000138, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001631, 'NEW', 0000000228, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001632, 'RENEWAL', 0000000228, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001633, 'NEW', 0000000229, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001634, 'RENEWAL', 0000000229, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001635, 'NEW', 0000000064, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001636, 'RENEWAL', 0000000064, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001637, 'NEW', 0000000230, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001638, 'RENEWAL', 0000000230, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001639, 'NEW', 0000000046, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001640, 'RENEWAL', 0000000046, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001641, 'NEW', 0000000232, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001642, 'RENEWAL', 0000000232, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001643, 'NEW', 0000000111, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09');
INSERT INTO `requirements_classification` (`ID`, `ApplicationType`, `BusinessLineID`, `RequirementID`, `DateAdded`, `DateUpdated`) VALUES
(0000001644, 'RENEWAL', 0000000111, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001645, 'NEW', 0000000234, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001646, 'RENEWAL', 0000000234, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001647, 'NEW', 0000000233, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001648, 'RENEWAL', 0000000233, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001649, 'NEW', 0000000235, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001650, 'RENEWAL', 0000000235, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001651, 'NEW', 0000000125, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001652, 'RENEWAL', 0000000125, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001653, 'NEW', 0000000143, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001654, 'RENEWAL', 0000000143, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001655, 'NEW', 0000000011, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001656, 'RENEWAL', 0000000011, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001657, 'NEW', 0000000038, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001658, 'RENEWAL', 0000000038, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001659, 'NEW', 0000000118, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001660, 'RENEWAL', 0000000118, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001661, 'NEW', 0000000026, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001662, 'RENEWAL', 0000000026, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001663, 'NEW', 0000000027, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001664, 'RENEWAL', 0000000027, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001665, 'NEW', 0000000128, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001666, 'RENEWAL', 0000000128, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001667, 'NEW', 0000000150, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001668, 'RENEWAL', 0000000150, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001669, 'NEW', 0000000159, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001670, 'RENEWAL', 0000000159, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001671, 'NEW', 0000000139, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001672, 'RENEWAL', 0000000139, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001673, 'NEW', 0000000068, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001674, 'RENEWAL', 0000000068, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001675, 'NEW', 0000000101, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001676, 'RENEWAL', 0000000101, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001677, 'NEW', 0000000166, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001678, 'RENEWAL', 0000000166, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001679, 'NEW', 0000000074, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001680, 'RENEWAL', 0000000074, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001681, 'NEW', 0000000029, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001682, 'RENEWAL', 0000000029, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001683, 'NEW', 0000000134, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001684, 'RENEWAL', 0000000134, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001685, 'NEW', 0000000237, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001686, 'RENEWAL', 0000000237, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001687, 'NEW', 0000000238, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001688, 'RENEWAL', 0000000238, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001689, 'NEW', 0000000168, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001690, 'RENEWAL', 0000000168, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001691, 'NEW', 0000000239, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001692, 'RENEWAL', 0000000239, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001693, 'NEW', 0000000034, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001694, 'RENEWAL', 0000000034, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001695, 'NEW', 0000000148, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001696, 'RENEWAL', 0000000148, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001697, 'NEW', 0000000241, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001698, 'RENEWAL', 0000000241, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001699, 'NEW', 0000000052, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001700, 'RENEWAL', 0000000052, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001701, 'NEW', 0000000242, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001702, 'RENEWAL', 0000000242, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001703, 'NEW', 0000000067, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001704, 'RENEWAL', 0000000067, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001705, 'NEW', 0000000017, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001706, 'RENEWAL', 0000000017, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001707, 'NEW', 0000000042, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001708, 'RENEWAL', 0000000042, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001709, 'NEW', 0000000009, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001710, 'RENEWAL', 0000000009, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001711, 'NEW', 0000000031, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001712, 'RENEWAL', 0000000031, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001713, 'NEW', 0000000243, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001714, 'RENEWAL', 0000000243, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001715, 'NEW', 0000000117, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001716, 'RENEWAL', 0000000117, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001717, 'NEW', 0000000153, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001718, 'RENEWAL', 0000000153, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001719, 'NEW', 0000000060, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001720, 'RENEWAL', 0000000060, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001721, 'NEW', 0000000244, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001722, 'RENEWAL', 0000000244, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001723, 'NEW', 0000000113, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001724, 'RENEWAL', 0000000113, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001725, 'NEW', 0000000154, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001726, 'RENEWAL', 0000000154, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001727, 'NEW', 0000000245, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001728, 'RENEWAL', 0000000245, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001729, 'NEW', 0000000133, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001730, 'RENEWAL', 0000000133, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001731, 'NEW', 0000000127, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001732, 'RENEWAL', 0000000127, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001733, 'NEW', 0000000121, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001734, 'RENEWAL', 0000000121, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001735, 'NEW', 0000000122, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001736, 'RENEWAL', 0000000122, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001737, 'NEW', 0000000002, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001738, 'RENEWAL', 0000000002, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001739, 'NEW', 0000000119, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001740, 'RENEWAL', 0000000119, 0000000006, '2021-10-08 05:34:09', '2021-10-08 05:34:09'),
(0000001741, 'NEW', 0000000161, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001742, 'RENEWAL', 0000000161, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001743, 'NEW', 0000000246, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001744, 'RENEWAL', 0000000246, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001745, 'NEW', 0000000075, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001746, 'RENEWAL', 0000000075, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001747, 'NEW', 0000000247, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001748, 'RENEWAL', 0000000247, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001749, 'NEW', 0000000136, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001750, 'RENEWAL', 0000000136, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001751, 'NEW', 0000000163, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001752, 'RENEWAL', 0000000163, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001753, 'NEW', 0000000248, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001754, 'RENEWAL', 0000000248, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001755, 'NEW', 0000000069, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001756, 'RENEWAL', 0000000069, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001757, 'NEW', 0000000167, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001758, 'RENEWAL', 0000000167, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001759, 'NEW', 0000000141, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001760, 'RENEWAL', 0000000141, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001761, 'NEW', 0000000135, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001762, 'RENEWAL', 0000000135, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001763, 'NEW', 0000000123, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001764, 'RENEWAL', 0000000123, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001765, 'NEW', 0000000250, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001766, 'RENEWAL', 0000000250, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001767, 'NEW', 0000000043, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001768, 'RENEWAL', 0000000043, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001769, 'NEW', 0000000063, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001770, 'RENEWAL', 0000000063, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001771, 'NEW', 0000000105, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001772, 'RENEWAL', 0000000105, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001773, 'NEW', 0000000124, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001774, 'RENEWAL', 0000000124, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001775, 'NEW', 0000000057, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001776, 'RENEWAL', 0000000057, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001777, 'NEW', 0000000071, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001778, 'RENEWAL', 0000000071, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001779, 'NEW', 0000000175, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001780, 'RENEWAL', 0000000175, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001781, 'NEW', 0000000251, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001782, 'RENEWAL', 0000000251, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001783, 'NEW', 0000000024, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001784, 'RENEWAL', 0000000024, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001785, 'NEW', 0000000110, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001786, 'RENEWAL', 0000000110, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001787, 'NEW', 0000000040, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001788, 'RENEWAL', 0000000040, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001789, 'NEW', 0000000120, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001790, 'RENEWAL', 0000000120, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001791, 'NEW', 0000000080, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001792, 'RENEWAL', 0000000080, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001793, 'NEW', 0000000091, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001794, 'RENEWAL', 0000000091, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001795, 'NEW', 0000000078, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001796, 'RENEWAL', 0000000078, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001797, 'NEW', 0000000145, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001798, 'RENEWAL', 0000000145, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001799, 'NEW', 0000000156, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001800, 'RENEWAL', 0000000156, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001801, 'NEW', 0000000149, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001802, 'RENEWAL', 0000000149, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001803, 'NEW', 0000000082, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001804, 'RENEWAL', 0000000082, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001805, 'NEW', 0000000187, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001806, 'RENEWAL', 0000000187, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001807, 'NEW', 0000000090, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001808, 'RENEWAL', 0000000090, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001809, 'NEW', 0000000254, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001810, 'RENEWAL', 0000000254, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001811, 'NEW', 0000000003, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001812, 'RENEWAL', 0000000003, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001813, 'NEW', 0000000253, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001814, 'RENEWAL', 0000000253, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001815, 'NEW', 0000000144, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10'),
(0000001816, 'RENEWAL', 0000000144, 0000000006, '2021-10-08 05:34:10', '2021-10-08 05:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `ID` int(11) NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `Data` text NOT NULL,
  `IsSystem` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`ID`, `Title`, `Description`, `Data`, `IsSystem`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'BUSINESS PERMIT', 'Settings for Business Permit', '{\"permit_no_prefix\":\"AAI\",\"permit_no_next\":3,\"permit_no_digits\":4,\"plate_no_prefix\":\"AAI\",\"plate_no_next\":3,\"plate_no_digits\":4}', 0, '2019-07-24 05:12:07', '2021-10-08 05:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `CitizenID` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `UserTypeAcronym` varchar(32) NOT NULL,
  `UserTypeTitle` varchar(64) NOT NULL,
  `Action` varchar(32) NOT NULL,
  `Location` varchar(64) NOT NULL,
  `Menu` varchar(64) NOT NULL,
  `Tab` varchar(64) NOT NULL,
  `Item` text NOT NULL,
  `ItemData` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000043, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":2,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:46', '2021-10-08 05:04:46'),
(0000000044, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_2', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":3,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:48', '2021-10-08 05:04:48'),
(0000000045, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_3', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":4,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:48', '2021-10-08 05:04:48'),
(0000000046, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_4', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":5,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:49', '2021-10-08 05:04:49'),
(0000000047, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_5', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":6,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:50', '2021-10-08 05:04:50'),
(0000000048, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_6', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":7,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:50', '2021-10-08 05:04:50'),
(0000000049, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_7', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":8,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:51', '2021-10-08 05:04:51'),
(0000000050, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_8', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":9,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:51', '2021-10-08 05:04:51'),
(0000000051, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_9', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":10,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:52', '2021-10-08 05:04:52'),
(0000000052, 0000000001, 'SA', 'System Administrator', 'INSERT', 'businesses_1_10', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":11,\"item_avatar\":\"\",\"item_maintitle\":\"[new line of business]\",\"item_subtitle\":\"\",\"item_update_date\":\"October 8, 2021 &middot; 01:04 PM\"}', '{\"business_line\":\"[new line of business]\",\"desc\":\"\",\"new_tax_var_id\":1,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-10-08 05:04:53', '2021-10-08 05:04:53'),
(0000000053, 0000000001, 'SA', 'System Administrator', 'DELETE', 'requirements_1_1', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":1,\"item_avatar\":\"\",\"item_maintitle\":\"Sanitary Permit\",\"item_subtitle\":\"\",\"item_update_date\":\"April 6, 2021 &middot; 09:17 AM\"}', '{\"title\":\"Sanitary Permit\",\"desc\":\"\",\"validation_code_title\":\"OR No.\",\"is_for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"is_for_poblacion_only\":\"0\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:18:34', '2021-10-08 05:18:34'),
(0000000054, 0000000001, 'SA', 'System Administrator', 'DELETE', 'requirements_1_4', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":4,\"item_avatar\":\"\",\"item_maintitle\":\"Fire Inspection Certificate\",\"item_subtitle\":\"\",\"item_update_date\":\"April 6, 2021 &middot; 09:32 AM\"}', '{\"title\":\"Fire Inspection Certificate\",\"desc\":\"\",\"validation_code_title\":\"Cert No.\",\"is_for_upload\":\"0\",\"collect_after\":\"APPLICATION\",\"is_for_poblacion_only\":\"0\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:18:37', '2021-10-08 05:18:37');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000055, 0000000001, 'SA', 'System Administrator', 'DELETE', 'requirements_1_5', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":5,\"item_avatar\":\"\",\"item_maintitle\":\"DTI \\/ SEC \\/ CDA Registration Certificate\",\"item_subtitle\":\"\",\"item_update_date\":\"April 6, 2021 &middot; 09:35 AM\"}', '{\"title\":\"DTI \\/ SEC \\/ CDA Registration Certificate\",\"desc\":\"\",\"validation_code_title\":\"No.\",\"is_for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"is_for_poblacion_only\":\"0\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:18:40', '2021-10-08 05:18:40'),
(0000000056, 0000000001, 'SA', 'System Administrator', 'DELETE', 'requirements_1_3', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":3,\"item_avatar\":\"\",\"item_maintitle\":\"Building Inspection Certificate\",\"item_subtitle\":\"\",\"item_update_date\":\"April 6, 2021 &middot; 09:19 AM\"}', '{\"title\":\"Building Inspection Certificate\",\"desc\":\"\",\"validation_code_title\":\"OR No.\",\"is_for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"is_for_poblacion_only\":\"0\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:18:44', '2021-10-08 05:18:44'),
(0000000057, 0000000001, 'SA', 'System Administrator', 'DELETE', 'requirements_1_2', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":2,\"item_avatar\":\"\",\"item_maintitle\":\"Barangay Clearance\",\"item_subtitle\":\"\",\"item_update_date\":\"April 6, 2021 &middot; 09:18 AM\"}', '{\"title\":\"Barangay Clearance\",\"desc\":\"\",\"validation_code_title\":\"Clearance No.\",\"is_for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"is_for_poblacion_only\":\"0\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:18:47', '2021-10-08 05:18:47'),
(0000000058, 0000000001, 'SA', 'System Administrator', 'INSERT', 'users_1_1', 'USERS', 'USER_ACCOUNTS', '{\"item_id\":0,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[NO CITIZEN]\",\"item_subtitle\":\"(BPLO) Business Permit and Licensing Officer\",\"item_update_date\":\"October 8, 2021 &middot; 01:22 PM\"}', '{\"citizen_id\":0,\"citizen_avatar\":\"_.jpg\",\"citizen_full_name\":\"[NO CITIZEN]\",\"username\":\"\",\"password\":\"****************\",\"is_active\":\"0\",\"usertype_id\":2,\"usertypes\":[{\"id\":2,\"acronym\":\"BPLO\",\"title\":\"Business Permit and Licensing Officer\",\"desc\":\"Business Permit and Licensing Officer\",\"date_created\":\"July 23, 2019 &middot; 05:03 AM\",\"date_updated\":\"March 23, 2021 &middot; 10:20 AM\",\"access\":[{\"icon\":\"fa fa-th-large\",\"title\":\"DASHBOARD\",\"desc\":\"View the system dashboard.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fas fa-layer-group\",\"title\":\"UPDATES\",\"desc\":\"View the updates posted by the developers.\",\"checked\":0,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[NEW] APPLICATIONS\",\"desc\":\"Create application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[NEW] VERIFICATIONS\",\"desc\":\"Verify application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[NEW] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[NEW] BUSINESS PERMITS\",\"desc\":\"Access business permits for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[REN] APPLICATIONS\",\"desc\":\"Create application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[REN] VERIFICATIONS\",\"desc\":\"Verify application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[REN] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[REN] BUSINESS PERMITS\",\"desc\":\"Access business permits for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-sitemap\",\"title\":\"LINES OF BUSINESS\",\"desc\":\"Manage settings for lines of business and business taxes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-chart-pie\",\"title\":\"BUSINESS SIZES\",\"desc\":\"Manage settings for business sizes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-calculator\",\"title\":\"FEE ITEMS\",\"desc\":\"Manage settings for applicable fees.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-file\",\"title\":\"REQUIREMENT ITEMS\",\"desc\":\"Manage settings for application requirements.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-copy\",\"title\":\"REPORTS\",\"desc\":\"View reports.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user\",\"title\":\"USER ACCOUNTS\",\"desc\":\"Manage settings for user accounts.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-tags\",\"title\":\"USER TYPES\",\"desc\":\"Manage settings for user types.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user-circle\",\"title\":\"CITIZENS\",\"desc\":\"View citizens.\",\"checked\":0,\"for_devs_only\":\"1\"},{\"icon\":\"fa fa-cog\",\"title\":\"APPLICATION SETTINGS\",\"desc\":\"Manage application settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-cog\",\"title\":\"SYSTEM SETTINGS\",\"desc\":\"Manage system settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-desktop\",\"title\":\"ACTIVITY LOGS\",\"desc\":\"Access activity logs.\",\"checked\":1,\"for_devs_only\":\"0\"}]},{\"id\":1,\"acronym\":\"SA\",\"title\":\"System Administrator\",\"desc\":\"System Administrator\",\"date_created\":\"September 8, 2018 &middot; 01:20 PM\",\"date_updated\":\"March 23, 2021 &middot; 03:35 AM\",\"access\":[{\"icon\":\"fa fa-th-large\",\"title\":\"DASHBOARD\",\"desc\":\"View the system dashboard.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fas fa-layer-group\",\"title\":\"UPDATES\",\"desc\":\"View the updates posted by the developers.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[NEW] APPLICATIONS\",\"desc\":\"Create application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[NEW] VERIFICATIONS\",\"desc\":\"Verify application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[NEW] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[NEW] BUSINESS PERMITS\",\"desc\":\"Access business permits for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[REN] APPLICATIONS\",\"desc\":\"Create application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[REN] VERIFICATIONS\",\"desc\":\"Verify application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[REN] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[REN] BUSINESS PERMITS\",\"desc\":\"Access business permits for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-sitemap\",\"title\":\"LINES OF BUSINESS\",\"desc\":\"Manage settings for lines of business and business taxes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-chart-pie\",\"title\":\"BUSINESS SIZES\",\"desc\":\"Manage settings for business sizes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-calculator\",\"title\":\"FEE ITEMS\",\"desc\":\"Manage settings for applicable fees.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-file\",\"title\":\"REQUIREMENT ITEMS\",\"desc\":\"Manage settings for application requirements.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-copy\",\"title\":\"REPORTS\",\"desc\":\"View reports.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user\",\"title\":\"USER ACCOUNTS\",\"desc\":\"Manage settings for user accounts.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-tags\",\"title\":\"USER TYPES\",\"desc\":\"Manage settings for user types.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user-circle\",\"title\":\"CITIZENS\",\"desc\":\"View citizens.\",\"checked\":0,\"for_devs_only\":\"1\"},{\"icon\":\"fa fa-cog\",\"title\":\"APPLICATION SETTINGS\",\"desc\":\"Manage application settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-cog\",\"title\":\"SYSTEM SETTINGS\",\"desc\":\"Manage system settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-desktop\",\"title\":\"ACTIVITY LOGS\",\"desc\":\"Access activity logs.\",\"checked\":1,\"for_devs_only\":\"0\"}]}]}', '2021-10-08 05:22:34', '2021-10-08 05:22:34'),
(0000000059, 0000000001, 'SA', 'System Administrator', 'UPDATE', 'users_1_0', 'USERS', 'USER_ACCOUNTS', '{\"item_id\":0,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[NO CITIZEN]\",\"item_subtitle\":\"(BPLO) Business Permit and Licensing Officer\",\"item_update_date\":\"October 8, 2021 &middot; 01:22 PM\"}', '{\"citizen_id\":4,\"citizen_avatar\":\"male-02.JPG\",\"citizen_full_name\":\"IGNAZIO D. MARQUEZ\",\"username\":\"bplo\",\"password\":\"****************\",\"is_active\":\"1\",\"usertype_id\":2,\"usertypes\":[{\"id\":2,\"acronym\":\"BPLO\",\"title\":\"Business Permit and Licensing Officer\",\"desc\":\"Business Permit and Licensing Officer\",\"date_created\":\"July 23, 2019 &middot; 05:03 AM\",\"date_updated\":\"March 23, 2021 &middot; 10:20 AM\",\"access\":[{\"icon\":\"fa fa-th-large\",\"title\":\"DASHBOARD\",\"desc\":\"View the system dashboard.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fas fa-layer-group\",\"title\":\"UPDATES\",\"desc\":\"View the updates posted by the developers.\",\"checked\":0,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[NEW] APPLICATIONS\",\"desc\":\"Create application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[NEW] VERIFICATIONS\",\"desc\":\"Verify application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[NEW] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[NEW] BUSINESS PERMITS\",\"desc\":\"Access business permits for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[REN] APPLICATIONS\",\"desc\":\"Create application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[REN] VERIFICATIONS\",\"desc\":\"Verify application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[REN] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[REN] BUSINESS PERMITS\",\"desc\":\"Access business permits for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-sitemap\",\"title\":\"LINES OF BUSINESS\",\"desc\":\"Manage settings for lines of business and business taxes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-chart-pie\",\"title\":\"BUSINESS SIZES\",\"desc\":\"Manage settings for business sizes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-calculator\",\"title\":\"FEE ITEMS\",\"desc\":\"Manage settings for applicable fees.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-file\",\"title\":\"REQUIREMENT ITEMS\",\"desc\":\"Manage settings for application requirements.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-copy\",\"title\":\"REPORTS\",\"desc\":\"View reports.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user\",\"title\":\"USER ACCOUNTS\",\"desc\":\"Manage settings for user accounts.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-tags\",\"title\":\"USER TYPES\",\"desc\":\"Manage settings for user types.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user-circle\",\"title\":\"CITIZENS\",\"desc\":\"View citizens.\",\"checked\":0,\"for_devs_only\":\"1\"},{\"icon\":\"fa fa-cog\",\"title\":\"APPLICATION SETTINGS\",\"desc\":\"Manage application settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-cog\",\"title\":\"SYSTEM SETTINGS\",\"desc\":\"Manage system settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-desktop\",\"title\":\"ACTIVITY LOGS\",\"desc\":\"Access activity logs.\",\"checked\":1,\"for_devs_only\":\"0\"}]},{\"id\":1,\"acronym\":\"SA\",\"title\":\"System Administrator\",\"desc\":\"System Administrator\",\"date_created\":\"September 8, 2018 &middot; 01:20 PM\",\"date_updated\":\"March 23, 2021 &middot; 03:35 AM\",\"access\":[{\"icon\":\"fa fa-th-large\",\"title\":\"DASHBOARD\",\"desc\":\"View the system dashboard.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fas fa-layer-group\",\"title\":\"UPDATES\",\"desc\":\"View the updates posted by the developers.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[NEW] APPLICATIONS\",\"desc\":\"Create application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[NEW] VERIFICATIONS\",\"desc\":\"Verify application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[NEW] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[NEW] BUSINESS PERMITS\",\"desc\":\"Access business permits for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[REN] APPLICATIONS\",\"desc\":\"Create application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[REN] VERIFICATIONS\",\"desc\":\"Verify application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[REN] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[REN] BUSINESS PERMITS\",\"desc\":\"Access business permits for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-sitemap\",\"title\":\"LINES OF BUSINESS\",\"desc\":\"Manage settings for lines of business and business taxes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-chart-pie\",\"title\":\"BUSINESS SIZES\",\"desc\":\"Manage settings for business sizes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-calculator\",\"title\":\"FEE ITEMS\",\"desc\":\"Manage settings for applicable fees.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-file\",\"title\":\"REQUIREMENT ITEMS\",\"desc\":\"Manage settings for application requirements.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-copy\",\"title\":\"REPORTS\",\"desc\":\"View reports.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user\",\"title\":\"USER ACCOUNTS\",\"desc\":\"Manage settings for user accounts.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-tags\",\"title\":\"USER TYPES\",\"desc\":\"Manage settings for user types.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user-circle\",\"title\":\"CITIZENS\",\"desc\":\"View citizens.\",\"checked\":0,\"for_devs_only\":\"1\"},{\"icon\":\"fa fa-cog\",\"title\":\"APPLICATION SETTINGS\",\"desc\":\"Manage application settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-cog\",\"title\":\"SYSTEM SETTINGS\",\"desc\":\"Manage system settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-desktop\",\"title\":\"ACTIVITY LOGS\",\"desc\":\"Access activity logs.\",\"checked\":1,\"for_devs_only\":\"0\"}]}]}', '2021-10-08 05:23:11', '2021-10-08 05:23:11'),
(0000000060, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_1', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":3,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:27 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":0,\"citizen_avatar\":\"_.jpg\",\"citizen_full_name\":\"[NO CITIZEN]\",\"citizen_gender\":\"\",\"citizen_tin\":\"\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"[business_name]\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"\",\"barangay_id\":0,\"barangay_address\":\"[barangay], [municipality \\/ city], [province]\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"\",\"home_contact_num\":\"\",\"emergency_person\":\"\",\"emergency_contact_num\":\"\",\"total_male_emp\":0,\"total_male_emp_lgu\":0,\"total_female_emp\":0,\"total_female_emp_lgu\":0,\"total_employees\":0,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":3,\"business_line_id\":173,\"business_line_title\":\"Accessories\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":0,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:27 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:27 PM\"}', '2021-10-08 05:27:12', '2021-10-08 05:27:12');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000061, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_1_3', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":3,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:27 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":9,\"citizen_avatar\":\"female-02.JPG\",\"citizen_full_name\":\"HELENA L. AGUILAR\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"AGUILAR BAKERY\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"123456\",\"dti_date\":\"August 6, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 2, Itangon, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":3,\"total_male_emp_lgu\":3,\"total_female_emp\":3,\"total_female_emp_lgu\":3,\"total_employees\":6,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":4,\"business_line_id\":56,\"business_line_title\":\"Bakeshop\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":50000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:27 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:27 PM\"}', '2021-10-08 05:30:38', '2021-10-08 05:30:38'),
(0000000062, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_1_3', 'NEW BUSINESS', '[NEW]_VERIFICATIONS', '{\"item_id\":3,\"item_avatar\":\"female-02.JPG\",\"item_maintitle\":\"AGUILAR BAKERY\",\"item_subtitle\":\"HELENA L. AGUILAR\",\"item_update_date\":\"October 8, 2021 &middot; 01:30 PM\"}', '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":9,\"citizen_avatar\":\"female-02.JPG\",\"citizen_full_name\":\"HELENA L. AGUILAR\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"AGUILAR BAKERY\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"123456\",\"dti_date\":\"August 6, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 2, Itangon, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":3,\"total_male_emp_lgu\":3,\"total_female_emp\":3,\"total_female_emp_lgu\":3,\"total_employees\":6,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":4,\"business_line_id\":56,\"business_line_title\":\"Bakeshop\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":50000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:30 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:30 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":\"\",\"remarks\":\"\",\"date_updated\":0}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70}],\"total_fee\":495},\"requirements\":[]}', '2021-10-08 05:30:45', '2021-10-08 05:30:45'),
(0000000063, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_2_3', 'NEW BUSINESS', '[NEW]_VERIFICATIONS', '{\"item_id\":3,\"item_avatar\":\"female-02.JPG\",\"item_maintitle\":\"AGUILAR BAKERY\",\"item_subtitle\":\"HELENA L. AGUILAR\",\"item_update_date\":\"October 8, 2021 &middot; 01:30 PM\"}', '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":9,\"citizen_avatar\":\"female-02.JPG\",\"citizen_full_name\":\"HELENA L. AGUILAR\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"AGUILAR BAKERY\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"123456\",\"dti_date\":\"August 6, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 2, Itangon, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":3,\"total_male_emp_lgu\":3,\"total_female_emp\":3,\"total_female_emp_lgu\":3,\"total_employees\":6,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":4,\"business_line_id\":56,\"business_line_title\":\"Bakeshop\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":50000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:30 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:30 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:30:55\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70}],\"total_fee\":495},\"requirements\":[]}', '2021-10-08 05:30:55', '2021-10-08 05:30:55'),
(0000000064, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'requirements_1_7', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":7,\"item_avatar\":\"\",\"item_maintitle\":\"DTI Registration Certificate\",\"item_subtitle\":\"\",\"item_update_date\":\"February 11, 2020 &middot; 05:44 AM\"}', '{\"title\":\"DTI Registration Certificate\",\"desc\":\"\",\"validation_code_title\":\"Certificate No.\",\"is_for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"is_for_poblacion_only\":\"0\",\"classifications\":[{\"business_line_id\":128,\"application_type\":\"NEW\"},{\"business_line_id\":41,\"application_type\":\"NEW\"},{\"business_line_id\":225,\"application_type\":\"NEW\"},{\"business_line_id\":126,\"application_type\":\"NEW\"},{\"business_line_id\":169,\"application_type\":\"NEW\"},{\"business_line_id\":7,\"application_type\":\"NEW\"},{\"business_line_id\":223,\"application_type\":\"NEW\"},{\"business_line_id\":94,\"application_type\":\"NEW\"},{\"business_line_id\":224,\"application_type\":\"NEW\"},{\"business_line_id\":222,\"application_type\":\"NEW\"},{\"business_line_id\":47,\"application_type\":\"NEW\"},{\"business_line_id\":25,\"application_type\":\"NEW\"},{\"business_line_id\":132,\"application_type\":\"NEW\"},{\"business_line_id\":115,\"application_type\":\"NEW\"},{\"business_line_id\":107,\"application_type\":\"NEW\"},{\"business_line_id\":221,\"application_type\":\"NEW\"},{\"business_line_id\":255,\"application_type\":\"NEW\"},{\"business_line_id\":226,\"application_type\":\"NEW\"},{\"business_line_id\":138,\"application_type\":\"NEW\"},{\"business_line_id\":228,\"application_type\":\"NEW\"},{\"business_line_id\":27,\"application_type\":\"NEW\"},{\"business_line_id\":26,\"application_type\":\"NEW\"},{\"business_line_id\":118,\"application_type\":\"NEW\"},{\"business_line_id\":38,\"application_type\":\"NEW\"},{\"business_line_id\":11,\"application_type\":\"NEW\"},{\"business_line_id\":143,\"application_type\":\"NEW\"},{\"business_line_id\":125,\"application_type\":\"NEW\"},{\"business_line_id\":235,\"application_type\":\"NEW\"},{\"business_line_id\":233,\"application_type\":\"NEW\"},{\"business_line_id\":234,\"application_type\":\"NEW\"},{\"business_line_id\":111,\"application_type\":\"NEW\"},{\"business_line_id\":232,\"application_type\":\"NEW\"},{\"business_line_id\":46,\"application_type\":\"NEW\"},{\"business_line_id\":230,\"application_type\":\"NEW\"},{\"business_line_id\":64,\"application_type\":\"NEW\"},{\"business_line_id\":229,\"application_type\":\"NEW\"},{\"business_line_id\":257,\"application_type\":\"NEW\"},{\"business_line_id\":35,\"application_type\":\"NEW\"},{\"business_line_id\":62,\"application_type\":\"NEW\"},{\"business_line_id\":4,\"application_type\":\"NEW\"},{\"business_line_id\":45,\"application_type\":\"NEW\"},{\"business_line_id\":129,\"application_type\":\"NEW\"},{\"business_line_id\":12,\"application_type\":\"NEW\"},{\"business_line_id\":50,\"application_type\":\"NEW\"},{\"business_line_id\":116,\"application_type\":\"NEW\"},{\"business_line_id\":212,\"application_type\":\"NEW\"},{\"business_line_id\":98,\"application_type\":\"NEW\"},{\"business_line_id\":211,\"application_type\":\"NEW\"},{\"business_line_id\":210,\"application_type\":\"NEW\"},{\"business_line_id\":209,\"application_type\":\"NEW\"},{\"business_line_id\":208,\"application_type\":\"NEW\"},{\"business_line_id\":86,\"application_type\":\"NEW\"},{\"business_line_id\":87,\"application_type\":\"NEW\"},{\"business_line_id\":207,\"application_type\":\"NEW\"},{\"business_line_id\":214,\"application_type\":\"NEW\"},{\"business_line_id\":215,\"application_type\":\"NEW\"},{\"business_line_id\":216,\"application_type\":\"NEW\"},{\"business_line_id\":220,\"application_type\":\"NEW\"},{\"business_line_id\":219,\"application_type\":\"NEW\"},{\"business_line_id\":89,\"application_type\":\"NEW\"},{\"business_line_id\":109,\"application_type\":\"NEW\"},{\"business_line_id\":218,\"application_type\":\"NEW\"},{\"business_line_id\":53,\"application_type\":\"NEW\"},{\"business_line_id\":146,\"application_type\":\"NEW\"},{\"business_line_id\":5,\"application_type\":\"NEW\"},{\"business_line_id\":217,\"application_type\":\"NEW\"},{\"business_line_id\":44,\"application_type\":\"NEW\"},{\"business_line_id\":8,\"application_type\":\"NEW\"},{\"business_line_id\":77,\"application_type\":\"NEW\"},{\"business_line_id\":131,\"application_type\":\"NEW\"},{\"business_line_id\":30,\"application_type\":\"NEW\"},{\"business_line_id\":84,\"application_type\":\"NEW\"},{\"business_line_id\":61,\"application_type\":\"NEW\"},{\"business_line_id\":32,\"application_type\":\"NEW\"},{\"business_line_id\":150,\"application_type\":\"NEW\"},{\"business_line_id\":144,\"application_type\":\"NEW\"},{\"business_line_id\":57,\"application_type\":\"NEW\"},{\"business_line_id\":124,\"application_type\":\"NEW\"},{\"business_line_id\":105,\"application_type\":\"NEW\"},{\"business_line_id\":63,\"application_type\":\"NEW\"},{\"business_line_id\":43,\"application_type\":\"NEW\"},{\"business_line_id\":250,\"application_type\":\"NEW\"},{\"business_line_id\":123,\"application_type\":\"NEW\"},{\"business_line_id\":135,\"application_type\":\"NEW\"},{\"business_line_id\":141,\"application_type\":\"NEW\"},{\"business_line_id\":167,\"application_type\":\"NEW\"},{\"business_line_id\":69,\"application_type\":\"NEW\"},{\"business_line_id\":248,\"application_type\":\"NEW\"},{\"business_line_id\":163,\"application_type\":\"NEW\"},{\"business_line_id\":136,\"application_type\":\"NEW\"},{\"business_line_id\":247,\"application_type\":\"NEW\"},{\"business_line_id\":75,\"application_type\":\"NEW\"},{\"business_line_id\":71,\"application_type\":\"NEW\"},{\"business_line_id\":175,\"application_type\":\"NEW\"},{\"business_line_id\":251,\"application_type\":\"NEW\"},{\"business_line_id\":253,\"application_type\":\"NEW\"},{\"business_line_id\":3,\"application_type\":\"NEW\"},{\"business_line_id\":254,\"application_type\":\"NEW\"},{\"business_line_id\":90,\"application_type\":\"NEW\"},{\"business_line_id\":187,\"application_type\":\"NEW\"},{\"business_line_id\":82,\"application_type\":\"NEW\"},{\"business_line_id\":149,\"application_type\":\"NEW\"},{\"business_line_id\":156,\"application_type\":\"NEW\"},{\"business_line_id\":145,\"application_type\":\"NEW\"},{\"business_line_id\":78,\"application_type\":\"NEW\"},{\"business_line_id\":91,\"application_type\":\"NEW\"},{\"business_line_id\":80,\"application_type\":\"NEW\"},{\"business_line_id\":120,\"application_type\":\"NEW\"},{\"business_line_id\":40,\"application_type\":\"NEW\"},{\"business_line_id\":110,\"application_type\":\"NEW\"},{\"business_line_id\":24,\"application_type\":\"NEW\"},{\"business_line_id\":246,\"application_type\":\"NEW\"},{\"business_line_id\":161,\"application_type\":\"NEW\"},{\"business_line_id\":242,\"application_type\":\"NEW\"},{\"business_line_id\":52,\"application_type\":\"NEW\"},{\"business_line_id\":241,\"application_type\":\"NEW\"},{\"business_line_id\":148,\"application_type\":\"NEW\"},{\"business_line_id\":34,\"application_type\":\"NEW\"},{\"business_line_id\":239,\"application_type\":\"NEW\"},{\"business_line_id\":168,\"application_type\":\"NEW\"},{\"business_line_id\":238,\"application_type\":\"NEW\"},{\"business_line_id\":237,\"application_type\":\"NEW\"},{\"business_line_id\":134,\"application_type\":\"NEW\"},{\"business_line_id\":29,\"application_type\":\"NEW\"},{\"business_line_id\":74,\"application_type\":\"NEW\"},{\"business_line_id\":166,\"application_type\":\"NEW\"},{\"business_line_id\":101,\"application_type\":\"NEW\"},{\"business_line_id\":68,\"application_type\":\"NEW\"},{\"business_line_id\":139,\"application_type\":\"NEW\"},{\"business_line_id\":67,\"application_type\":\"NEW\"},{\"business_line_id\":17,\"application_type\":\"NEW\"},{\"business_line_id\":42,\"application_type\":\"NEW\"},{\"business_line_id\":119,\"application_type\":\"NEW\"},{\"business_line_id\":2,\"application_type\":\"NEW\"},{\"business_line_id\":122,\"application_type\":\"NEW\"},{\"business_line_id\":121,\"application_type\":\"NEW\"},{\"business_line_id\":127,\"application_type\":\"NEW\"},{\"business_line_id\":133,\"application_type\":\"NEW\"},{\"business_line_id\":245,\"application_type\":\"NEW\"},{\"business_line_id\":154,\"application_type\":\"NEW\"},{\"business_line_id\":113,\"application_type\":\"NEW\"},{\"business_line_id\":244,\"application_type\":\"NEW\"},{\"business_line_id\":60,\"application_type\":\"NEW\"},{\"business_line_id\":153,\"application_type\":\"NEW\"},{\"business_line_id\":117,\"application_type\":\"NEW\"},{\"business_line_id\":243,\"application_type\":\"NEW\"},{\"business_line_id\":31,\"application_type\":\"NEW\"},{\"business_line_id\":9,\"application_type\":\"NEW\"},{\"business_line_id\":159,\"application_type\":\"NEW\"},{\"business_line_id\":205,\"application_type\":\"NEW\"},{\"business_line_id\":104,\"application_type\":\"NEW\"},{\"business_line_id\":106,\"application_type\":\"NEW\"},{\"business_line_id\":147,\"application_type\":\"NEW\"},{\"business_line_id\":200,\"application_type\":\"NEW\"},{\"business_line_id\":137,\"application_type\":\"NEW\"},{\"business_line_id\":199,\"application_type\":\"NEW\"},{\"business_line_id\":56,\"application_type\":\"NEW\"},{\"business_line_id\":103,\"application_type\":\"NEW\"},{\"business_line_id\":198,\"application_type\":\"NEW\"},{\"business_line_id\":189,\"application_type\":\"NEW\"},{\"business_line_id\":157,\"application_type\":\"NEW\"},{\"business_line_id\":179,\"application_type\":\"NEW\"},{\"business_line_id\":58,\"application_type\":\"NEW\"},{\"business_line_id\":256,\"application_type\":\"NEW\"},{\"business_line_id\":92,\"application_type\":\"NEW\"},{\"business_line_id\":183,\"application_type\":\"NEW\"},{\"business_line_id\":202,\"application_type\":\"NEW\"},{\"business_line_id\":102,\"application_type\":\"NEW\"},{\"business_line_id\":178,\"application_type\":\"NEW\"},{\"business_line_id\":201,\"application_type\":\"NEW\"},{\"business_line_id\":130,\"application_type\":\"NEW\"},{\"business_line_id\":6,\"application_type\":\"NEW\"},{\"business_line_id\":10,\"application_type\":\"NEW\"},{\"business_line_id\":160,\"application_type\":\"NEW\"},{\"business_line_id\":16,\"application_type\":\"NEW\"},{\"business_line_id\":180,\"application_type\":\"NEW\"},{\"business_line_id\":194,\"application_type\":\"NEW\"},{\"business_line_id\":164,\"application_type\":\"NEW\"},{\"business_line_id\":182,\"application_type\":\"NEW\"},{\"business_line_id\":193,\"application_type\":\"NEW\"},{\"business_line_id\":88,\"application_type\":\"NEW\"},{\"business_line_id\":172,\"application_type\":\"NEW\"},{\"business_line_id\":140,\"application_type\":\"NEW\"},{\"business_line_id\":59,\"application_type\":\"NEW\"},{\"business_line_id\":192,\"application_type\":\"NEW\"},{\"business_line_id\":190,\"application_type\":\"NEW\"},{\"business_line_id\":197,\"application_type\":\"NEW\"},{\"business_line_id\":162,\"application_type\":\"NEW\"},{\"business_line_id\":99,\"application_type\":\"NEW\"},{\"business_line_id\":191,\"application_type\":\"NEW\"},{\"business_line_id\":51,\"application_type\":\"NEW\"},{\"business_line_id\":21,\"application_type\":\"NEW\"},{\"business_line_id\":83,\"application_type\":\"NEW\"},{\"business_line_id\":33,\"application_type\":\"NEW\"},{\"business_line_id\":152,\"application_type\":\"NEW\"},{\"business_line_id\":96,\"application_type\":\"NEW\"},{\"business_line_id\":79,\"application_type\":\"NEW\"},{\"business_line_id\":36,\"application_type\":\"NEW\"},{\"business_line_id\":23,\"application_type\":\"NEW\"},{\"business_line_id\":158,\"application_type\":\"NEW\"},{\"business_line_id\":13,\"application_type\":\"NEW\"},{\"business_line_id\":70,\"application_type\":\"NEW\"},{\"business_line_id\":188,\"application_type\":\"NEW\"},{\"business_line_id\":14,\"application_type\":\"NEW\"},{\"business_line_id\":114,\"application_type\":\"NEW\"},{\"business_line_id\":48,\"application_type\":\"NEW\"},{\"business_line_id\":81,\"application_type\":\"NEW\"},{\"business_line_id\":173,\"application_type\":\"NEW\"},{\"business_line_id\":203,\"application_type\":\"NEW\"},{\"business_line_id\":174,\"application_type\":\"NEW\"},{\"business_line_id\":186,\"application_type\":\"NEW\"},{\"business_line_id\":22,\"application_type\":\"NEW\"},{\"business_line_id\":151,\"application_type\":\"NEW\"},{\"business_line_id\":20,\"application_type\":\"NEW\"},{\"business_line_id\":184,\"application_type\":\"NEW\"},{\"business_line_id\":204,\"application_type\":\"NEW\"},{\"business_line_id\":185,\"application_type\":\"NEW\"},{\"business_line_id\":170,\"application_type\":\"NEW\"},{\"business_line_id\":177,\"application_type\":\"NEW\"},{\"business_line_id\":18,\"application_type\":\"NEW\"},{\"business_line_id\":1,\"application_type\":\"NEW\"},{\"business_line_id\":66,\"application_type\":\"NEW\"},{\"business_line_id\":165,\"application_type\":\"NEW\"},{\"business_line_id\":28,\"application_type\":\"NEW\"},{\"business_line_id\":49,\"application_type\":\"NEW\"},{\"business_line_id\":127,\"application_type\":\"RENEWAL\"},{\"business_line_id\":154,\"application_type\":\"RENEWAL\"},{\"business_line_id\":182,\"application_type\":\"RENEWAL\"},{\"business_line_id\":16,\"application_type\":\"RENEWAL\"},{\"business_line_id\":34,\"application_type\":\"RENEWAL\"},{\"business_line_id\":168,\"application_type\":\"RENEWAL\"},{\"business_line_id\":133,\"application_type\":\"RENEWAL\"},{\"business_line_id\":245,\"application_type\":\"RENEWAL\"},{\"business_line_id\":99,\"application_type\":\"RENEWAL\"},{\"business_line_id\":239,\"application_type\":\"RENEWAL\"},{\"business_line_id\":49,\"application_type\":\"RENEWAL\"},{\"business_line_id\":186,\"application_type\":\"RENEWAL\"},{\"business_line_id\":83,\"application_type\":\"RENEWAL\"},{\"business_line_id\":185,\"application_type\":\"RENEWAL\"},{\"business_line_id\":243,\"application_type\":\"RENEWAL\"},{\"business_line_id\":242,\"application_type\":\"RENEWAL\"},{\"business_line_id\":106,\"application_type\":\"RENEWAL\"},{\"business_line_id\":67,\"application_type\":\"RENEWAL\"},{\"business_line_id\":184,\"application_type\":\"RENEWAL\"},{\"business_line_id\":9,\"application_type\":\"RENEWAL\"},{\"business_line_id\":17,\"application_type\":\"RENEWAL\"},{\"business_line_id\":183,\"application_type\":\"RENEWAL\"},{\"business_line_id\":117,\"application_type\":\"RENEWAL\"},{\"business_line_id\":52,\"application_type\":\"RENEWAL\"},{\"business_line_id\":113,\"application_type\":\"RENEWAL\"},{\"business_line_id\":148,\"application_type\":\"RENEWAL\"},{\"business_line_id\":244,\"application_type\":\"RENEWAL\"},{\"business_line_id\":158,\"application_type\":\"RENEWAL\"},{\"business_line_id\":60,\"application_type\":\"RENEWAL\"},{\"business_line_id\":241,\"application_type\":\"RENEWAL\"},{\"business_line_id\":153,\"application_type\":\"RENEWAL\"},{\"business_line_id\":103,\"application_type\":\"RENEWAL\"},{\"business_line_id\":31,\"application_type\":\"RENEWAL\"},{\"business_line_id\":42,\"application_type\":\"RENEWAL\"},{\"business_line_id\":121,\"application_type\":\"RENEWAL\"},{\"business_line_id\":144,\"application_type\":\"RENEWAL\"},{\"business_line_id\":36,\"application_type\":\"RENEWAL\"},{\"business_line_id\":80,\"application_type\":\"RENEWAL\"},{\"business_line_id\":120,\"application_type\":\"RENEWAL\"},{\"business_line_id\":28,\"application_type\":\"RENEWAL\"},{\"business_line_id\":40,\"application_type\":\"RENEWAL\"},{\"business_line_id\":110,\"application_type\":\"RENEWAL\"},{\"business_line_id\":18,\"application_type\":\"RENEWAL\"},{\"business_line_id\":24,\"application_type\":\"RENEWAL\"},{\"business_line_id\":251,\"application_type\":\"RENEWAL\"},{\"business_line_id\":177,\"application_type\":\"RENEWAL\"},{\"business_line_id\":175,\"application_type\":\"RENEWAL\"},{\"business_line_id\":161,\"application_type\":\"RENEWAL\"},{\"business_line_id\":71,\"application_type\":\"RENEWAL\"},{\"business_line_id\":91,\"application_type\":\"RENEWAL\"},{\"business_line_id\":78,\"application_type\":\"RENEWAL\"},{\"business_line_id\":253,\"application_type\":\"RENEWAL\"},{\"business_line_id\":1,\"application_type\":\"RENEWAL\"},{\"business_line_id\":3,\"application_type\":\"RENEWAL\"},{\"business_line_id\":14,\"application_type\":\"RENEWAL\"},{\"business_line_id\":254,\"application_type\":\"RENEWAL\"},{\"business_line_id\":90,\"application_type\":\"RENEWAL\"},{\"business_line_id\":187,\"application_type\":\"RENEWAL\"},{\"business_line_id\":173,\"application_type\":\"RENEWAL\"},{\"business_line_id\":82,\"application_type\":\"RENEWAL\"},{\"business_line_id\":149,\"application_type\":\"RENEWAL\"},{\"business_line_id\":156,\"application_type\":\"RENEWAL\"},{\"business_line_id\":145,\"application_type\":\"RENEWAL\"},{\"business_line_id\":114,\"application_type\":\"RENEWAL\"},{\"business_line_id\":164,\"application_type\":\"RENEWAL\"},{\"business_line_id\":57,\"application_type\":\"RENEWAL\"},{\"business_line_id\":124,\"application_type\":\"RENEWAL\"},{\"business_line_id\":174,\"application_type\":\"RENEWAL\"},{\"business_line_id\":163,\"application_type\":\"RENEWAL\"},{\"business_line_id\":136,\"application_type\":\"RENEWAL\"},{\"business_line_id\":51,\"application_type\":\"RENEWAL\"},{\"business_line_id\":247,\"application_type\":\"RENEWAL\"},{\"business_line_id\":75,\"application_type\":\"RENEWAL\"},{\"business_line_id\":33,\"application_type\":\"RENEWAL\"},{\"business_line_id\":246,\"application_type\":\"RENEWAL\"},{\"business_line_id\":180,\"application_type\":\"RENEWAL\"},{\"business_line_id\":119,\"application_type\":\"RENEWAL\"},{\"business_line_id\":2,\"application_type\":\"RENEWAL\"},{\"business_line_id\":172,\"application_type\":\"RENEWAL\"},{\"business_line_id\":43,\"application_type\":\"RENEWAL\"},{\"business_line_id\":162,\"application_type\":\"RENEWAL\"},{\"business_line_id\":248,\"application_type\":\"RENEWAL\"},{\"business_line_id\":178,\"application_type\":\"RENEWAL\"},{\"business_line_id\":105,\"application_type\":\"RENEWAL\"},{\"business_line_id\":63,\"application_type\":\"RENEWAL\"},{\"business_line_id\":179,\"application_type\":\"RENEWAL\"},{\"business_line_id\":250,\"application_type\":\"RENEWAL\"},{\"business_line_id\":137,\"application_type\":\"RENEWAL\"},{\"business_line_id\":123,\"application_type\":\"RENEWAL\"},{\"business_line_id\":135,\"application_type\":\"RENEWAL\"},{\"business_line_id\":56,\"application_type\":\"RENEWAL\"},{\"business_line_id\":141,\"application_type\":\"RENEWAL\"},{\"business_line_id\":167,\"application_type\":\"RENEWAL\"},{\"business_line_id\":6,\"application_type\":\"RENEWAL\"},{\"business_line_id\":69,\"application_type\":\"RENEWAL\"},{\"business_line_id\":122,\"application_type\":\"RENEWAL\"},{\"business_line_id\":238,\"application_type\":\"RENEWAL\"},{\"business_line_id\":115,\"application_type\":\"RENEWAL\"},{\"business_line_id\":53,\"application_type\":\"RENEWAL\"},{\"business_line_id\":146,\"application_type\":\"RENEWAL\"},{\"business_line_id\":157,\"application_type\":\"RENEWAL\"},{\"business_line_id\":5,\"application_type\":\"RENEWAL\"},{\"business_line_id\":217,\"application_type\":\"RENEWAL\"},{\"business_line_id\":201,\"application_type\":\"RENEWAL\"},{\"business_line_id\":44,\"application_type\":\"RENEWAL\"},{\"business_line_id\":8,\"application_type\":\"RENEWAL\"},{\"business_line_id\":202,\"application_type\":\"RENEWAL\"},{\"business_line_id\":77,\"application_type\":\"RENEWAL\"},{\"business_line_id\":131,\"application_type\":\"RENEWAL\"},{\"business_line_id\":256,\"application_type\":\"RENEWAL\"},{\"business_line_id\":30,\"application_type\":\"RENEWAL\"},{\"business_line_id\":84,\"application_type\":\"RENEWAL\"},{\"business_line_id\":200,\"application_type\":\"RENEWAL\"},{\"business_line_id\":218,\"application_type\":\"RENEWAL\"},{\"business_line_id\":81,\"application_type\":\"RENEWAL\"},{\"business_line_id\":107,\"application_type\":\"RENEWAL\"},{\"business_line_id\":221,\"application_type\":\"RENEWAL\"},{\"business_line_id\":197,\"application_type\":\"RENEWAL\"},{\"business_line_id\":255,\"application_type\":\"RENEWAL\"},{\"business_line_id\":257,\"application_type\":\"RENEWAL\"},{\"business_line_id\":10,\"application_type\":\"RENEWAL\"},{\"business_line_id\":35,\"application_type\":\"RENEWAL\"},{\"business_line_id\":220,\"application_type\":\"RENEWAL\"},{\"business_line_id\":198,\"application_type\":\"RENEWAL\"},{\"business_line_id\":219,\"application_type\":\"RENEWAL\"},{\"business_line_id\":89,\"application_type\":\"RENEWAL\"},{\"business_line_id\":199,\"application_type\":\"RENEWAL\"},{\"business_line_id\":109,\"application_type\":\"RENEWAL\"},{\"business_line_id\":104,\"application_type\":\"RENEWAL\"},{\"business_line_id\":61,\"application_type\":\"RENEWAL\"},{\"business_line_id\":212,\"application_type\":\"RENEWAL\"},{\"business_line_id\":98,\"application_type\":\"RENEWAL\"},{\"business_line_id\":203,\"application_type\":\"RENEWAL\"},{\"business_line_id\":211,\"application_type\":\"RENEWAL\"},{\"business_line_id\":210,\"application_type\":\"RENEWAL\"},{\"business_line_id\":22,\"application_type\":\"RENEWAL\"},{\"business_line_id\":209,\"application_type\":\"RENEWAL\"},{\"business_line_id\":208,\"application_type\":\"RENEWAL\"},{\"business_line_id\":70,\"application_type\":\"RENEWAL\"},{\"business_line_id\":86,\"application_type\":\"RENEWAL\"},{\"business_line_id\":87,\"application_type\":\"RENEWAL\"},{\"business_line_id\":151,\"application_type\":\"RENEWAL\"},{\"business_line_id\":207,\"application_type\":\"RENEWAL\"},{\"business_line_id\":32,\"application_type\":\"RENEWAL\"},{\"business_line_id\":48,\"application_type\":\"RENEWAL\"},{\"business_line_id\":116,\"application_type\":\"RENEWAL\"},{\"business_line_id\":216,\"application_type\":\"RENEWAL\"},{\"business_line_id\":170,\"application_type\":\"RENEWAL\"},{\"business_line_id\":215,\"application_type\":\"RENEWAL\"},{\"business_line_id\":205,\"application_type\":\"RENEWAL\"},{\"business_line_id\":214,\"application_type\":\"RENEWAL\"},{\"business_line_id\":204,\"application_type\":\"RENEWAL\"},{\"business_line_id\":62,\"application_type\":\"RENEWAL\"},{\"business_line_id\":4,\"application_type\":\"RENEWAL\"},{\"business_line_id\":165,\"application_type\":\"RENEWAL\"},{\"business_line_id\":45,\"application_type\":\"RENEWAL\"},{\"business_line_id\":129,\"application_type\":\"RENEWAL\"},{\"business_line_id\":23,\"application_type\":\"RENEWAL\"},{\"business_line_id\":12,\"application_type\":\"RENEWAL\"},{\"business_line_id\":50,\"application_type\":\"RENEWAL\"},{\"business_line_id\":66,\"application_type\":\"RENEWAL\"},{\"business_line_id\":237,\"application_type\":\"RENEWAL\"},{\"business_line_id\":140,\"application_type\":\"RENEWAL\"},{\"business_line_id\":27,\"application_type\":\"RENEWAL\"},{\"business_line_id\":26,\"application_type\":\"RENEWAL\"},{\"business_line_id\":58,\"application_type\":\"RENEWAL\"},{\"business_line_id\":118,\"application_type\":\"RENEWAL\"},{\"business_line_id\":38,\"application_type\":\"RENEWAL\"},{\"business_line_id\":92,\"application_type\":\"RENEWAL\"},{\"business_line_id\":11,\"application_type\":\"RENEWAL\"},{\"business_line_id\":143,\"application_type\":\"RENEWAL\"},{\"business_line_id\":130,\"application_type\":\"RENEWAL\"},{\"business_line_id\":125,\"application_type\":\"RENEWAL\"},{\"business_line_id\":235,\"application_type\":\"RENEWAL\"},{\"business_line_id\":102,\"application_type\":\"RENEWAL\"},{\"business_line_id\":233,\"application_type\":\"RENEWAL\"},{\"business_line_id\":128,\"application_type\":\"RENEWAL\"},{\"business_line_id\":138,\"application_type\":\"RENEWAL\"},{\"business_line_id\":160,\"application_type\":\"RENEWAL\"},{\"business_line_id\":134,\"application_type\":\"RENEWAL\"},{\"business_line_id\":29,\"application_type\":\"RENEWAL\"},{\"business_line_id\":79,\"application_type\":\"RENEWAL\"},{\"business_line_id\":74,\"application_type\":\"RENEWAL\"},{\"business_line_id\":166,\"application_type\":\"RENEWAL\"},{\"business_line_id\":96,\"application_type\":\"RENEWAL\"},{\"business_line_id\":101,\"application_type\":\"RENEWAL\"},{\"business_line_id\":68,\"application_type\":\"RENEWAL\"},{\"business_line_id\":188,\"application_type\":\"RENEWAL\"},{\"business_line_id\":139,\"application_type\":\"RENEWAL\"},{\"business_line_id\":159,\"application_type\":\"RENEWAL\"},{\"business_line_id\":20,\"application_type\":\"RENEWAL\"},{\"business_line_id\":150,\"application_type\":\"RENEWAL\"},{\"business_line_id\":234,\"application_type\":\"RENEWAL\"},{\"business_line_id\":189,\"application_type\":\"RENEWAL\"},{\"business_line_id\":147,\"application_type\":\"RENEWAL\"},{\"business_line_id\":169,\"application_type\":\"RENEWAL\"},{\"business_line_id\":7,\"application_type\":\"RENEWAL\"},{\"business_line_id\":88,\"application_type\":\"RENEWAL\"},{\"business_line_id\":223,\"application_type\":\"RENEWAL\"},{\"business_line_id\":94,\"application_type\":\"RENEWAL\"},{\"business_line_id\":194,\"application_type\":\"RENEWAL\"},{\"business_line_id\":224,\"application_type\":\"RENEWAL\"},{\"business_line_id\":13,\"application_type\":\"RENEWAL\"},{\"business_line_id\":222,\"application_type\":\"RENEWAL\"},{\"business_line_id\":59,\"application_type\":\"RENEWAL\"},{\"business_line_id\":47,\"application_type\":\"RENEWAL\"},{\"business_line_id\":25,\"application_type\":\"RENEWAL\"},{\"business_line_id\":21,\"application_type\":\"RENEWAL\"},{\"business_line_id\":126,\"application_type\":\"RENEWAL\"},{\"business_line_id\":225,\"application_type\":\"RENEWAL\"},{\"business_line_id\":111,\"application_type\":\"RENEWAL\"},{\"business_line_id\":232,\"application_type\":\"RENEWAL\"},{\"business_line_id\":190,\"application_type\":\"RENEWAL\"},{\"business_line_id\":46,\"application_type\":\"RENEWAL\"},{\"business_line_id\":230,\"application_type\":\"RENEWAL\"},{\"business_line_id\":191,\"application_type\":\"RENEWAL\"},{\"business_line_id\":64,\"application_type\":\"RENEWAL\"},{\"business_line_id\":229,\"application_type\":\"RENEWAL\"},{\"business_line_id\":192,\"application_type\":\"RENEWAL\"},{\"business_line_id\":228,\"application_type\":\"RENEWAL\"},{\"business_line_id\":193,\"application_type\":\"RENEWAL\"},{\"business_line_id\":226,\"application_type\":\"RENEWAL\"},{\"business_line_id\":41,\"application_type\":\"RENEWAL\"},{\"business_line_id\":152,\"application_type\":\"RENEWAL\"},{\"business_line_id\":132,\"application_type\":\"RENEWAL\"}],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:32:39', '2021-10-08 05:32:39');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000065, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'requirements_1_5', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":5,\"item_avatar\":\"\",\"item_maintitle\":\"Sanitary Permit\",\"item_subtitle\":\"\",\"item_update_date\":\"February 15, 2020 &middot; 08:01 AM\"}', '{\"title\":\"Sanitary Permit\",\"desc\":\"\",\"validation_code_title\":\"Permit No.\",\"is_for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"is_for_poblacion_only\":\"0\",\"classifications\":[{\"business_line_id\":128,\"application_type\":\"NEW\"},{\"business_line_id\":41,\"application_type\":\"NEW\"},{\"business_line_id\":225,\"application_type\":\"NEW\"},{\"business_line_id\":126,\"application_type\":\"NEW\"},{\"business_line_id\":169,\"application_type\":\"NEW\"},{\"business_line_id\":7,\"application_type\":\"NEW\"},{\"business_line_id\":223,\"application_type\":\"NEW\"},{\"business_line_id\":94,\"application_type\":\"NEW\"},{\"business_line_id\":224,\"application_type\":\"NEW\"},{\"business_line_id\":222,\"application_type\":\"NEW\"},{\"business_line_id\":47,\"application_type\":\"NEW\"},{\"business_line_id\":25,\"application_type\":\"NEW\"},{\"business_line_id\":132,\"application_type\":\"NEW\"},{\"business_line_id\":115,\"application_type\":\"NEW\"},{\"business_line_id\":107,\"application_type\":\"NEW\"},{\"business_line_id\":221,\"application_type\":\"NEW\"},{\"business_line_id\":255,\"application_type\":\"NEW\"},{\"business_line_id\":226,\"application_type\":\"NEW\"},{\"business_line_id\":138,\"application_type\":\"NEW\"},{\"business_line_id\":228,\"application_type\":\"NEW\"},{\"business_line_id\":27,\"application_type\":\"NEW\"},{\"business_line_id\":26,\"application_type\":\"NEW\"},{\"business_line_id\":118,\"application_type\":\"NEW\"},{\"business_line_id\":38,\"application_type\":\"NEW\"},{\"business_line_id\":11,\"application_type\":\"NEW\"},{\"business_line_id\":143,\"application_type\":\"NEW\"},{\"business_line_id\":125,\"application_type\":\"NEW\"},{\"business_line_id\":235,\"application_type\":\"NEW\"},{\"business_line_id\":233,\"application_type\":\"NEW\"},{\"business_line_id\":234,\"application_type\":\"NEW\"},{\"business_line_id\":111,\"application_type\":\"NEW\"},{\"business_line_id\":232,\"application_type\":\"NEW\"},{\"business_line_id\":46,\"application_type\":\"NEW\"},{\"business_line_id\":230,\"application_type\":\"NEW\"},{\"business_line_id\":64,\"application_type\":\"NEW\"},{\"business_line_id\":229,\"application_type\":\"NEW\"},{\"business_line_id\":257,\"application_type\":\"NEW\"},{\"business_line_id\":220,\"application_type\":\"NEW\"},{\"business_line_id\":4,\"application_type\":\"NEW\"},{\"business_line_id\":45,\"application_type\":\"NEW\"},{\"business_line_id\":129,\"application_type\":\"NEW\"},{\"business_line_id\":12,\"application_type\":\"NEW\"},{\"business_line_id\":50,\"application_type\":\"NEW\"},{\"business_line_id\":116,\"application_type\":\"NEW\"},{\"business_line_id\":212,\"application_type\":\"NEW\"},{\"business_line_id\":98,\"application_type\":\"NEW\"},{\"business_line_id\":211,\"application_type\":\"NEW\"},{\"business_line_id\":210,\"application_type\":\"NEW\"},{\"business_line_id\":209,\"application_type\":\"NEW\"},{\"business_line_id\":208,\"application_type\":\"NEW\"},{\"business_line_id\":86,\"application_type\":\"NEW\"},{\"business_line_id\":87,\"application_type\":\"NEW\"},{\"business_line_id\":207,\"application_type\":\"NEW\"},{\"business_line_id\":32,\"application_type\":\"NEW\"},{\"business_line_id\":62,\"application_type\":\"NEW\"},{\"business_line_id\":214,\"application_type\":\"NEW\"},{\"business_line_id\":215,\"application_type\":\"NEW\"},{\"business_line_id\":219,\"application_type\":\"NEW\"},{\"business_line_id\":89,\"application_type\":\"NEW\"},{\"business_line_id\":109,\"application_type\":\"NEW\"},{\"business_line_id\":218,\"application_type\":\"NEW\"},{\"business_line_id\":53,\"application_type\":\"NEW\"},{\"business_line_id\":146,\"application_type\":\"NEW\"},{\"business_line_id\":5,\"application_type\":\"NEW\"},{\"business_line_id\":217,\"application_type\":\"NEW\"},{\"business_line_id\":44,\"application_type\":\"NEW\"},{\"business_line_id\":8,\"application_type\":\"NEW\"},{\"business_line_id\":77,\"application_type\":\"NEW\"},{\"business_line_id\":131,\"application_type\":\"NEW\"},{\"business_line_id\":30,\"application_type\":\"NEW\"},{\"business_line_id\":84,\"application_type\":\"NEW\"},{\"business_line_id\":61,\"application_type\":\"NEW\"},{\"business_line_id\":216,\"application_type\":\"NEW\"},{\"business_line_id\":205,\"application_type\":\"NEW\"},{\"business_line_id\":150,\"application_type\":\"NEW\"},{\"business_line_id\":144,\"application_type\":\"NEW\"},{\"business_line_id\":57,\"application_type\":\"NEW\"},{\"business_line_id\":124,\"application_type\":\"NEW\"},{\"business_line_id\":105,\"application_type\":\"NEW\"},{\"business_line_id\":63,\"application_type\":\"NEW\"},{\"business_line_id\":43,\"application_type\":\"NEW\"},{\"business_line_id\":250,\"application_type\":\"NEW\"},{\"business_line_id\":123,\"application_type\":\"NEW\"},{\"business_line_id\":135,\"application_type\":\"NEW\"},{\"business_line_id\":141,\"application_type\":\"NEW\"},{\"business_line_id\":167,\"application_type\":\"NEW\"},{\"business_line_id\":69,\"application_type\":\"NEW\"},{\"business_line_id\":248,\"application_type\":\"NEW\"},{\"business_line_id\":163,\"application_type\":\"NEW\"},{\"business_line_id\":136,\"application_type\":\"NEW\"},{\"business_line_id\":247,\"application_type\":\"NEW\"},{\"business_line_id\":75,\"application_type\":\"NEW\"},{\"business_line_id\":71,\"application_type\":\"NEW\"},{\"business_line_id\":175,\"application_type\":\"NEW\"},{\"business_line_id\":251,\"application_type\":\"NEW\"},{\"business_line_id\":253,\"application_type\":\"NEW\"},{\"business_line_id\":3,\"application_type\":\"NEW\"},{\"business_line_id\":254,\"application_type\":\"NEW\"},{\"business_line_id\":90,\"application_type\":\"NEW\"},{\"business_line_id\":187,\"application_type\":\"NEW\"},{\"business_line_id\":82,\"application_type\":\"NEW\"},{\"business_line_id\":149,\"application_type\":\"NEW\"},{\"business_line_id\":156,\"application_type\":\"NEW\"},{\"business_line_id\":145,\"application_type\":\"NEW\"},{\"business_line_id\":78,\"application_type\":\"NEW\"},{\"business_line_id\":91,\"application_type\":\"NEW\"},{\"business_line_id\":80,\"application_type\":\"NEW\"},{\"business_line_id\":120,\"application_type\":\"NEW\"},{\"business_line_id\":40,\"application_type\":\"NEW\"},{\"business_line_id\":110,\"application_type\":\"NEW\"},{\"business_line_id\":24,\"application_type\":\"NEW\"},{\"business_line_id\":246,\"application_type\":\"NEW\"},{\"business_line_id\":161,\"application_type\":\"NEW\"},{\"business_line_id\":242,\"application_type\":\"NEW\"},{\"business_line_id\":52,\"application_type\":\"NEW\"},{\"business_line_id\":241,\"application_type\":\"NEW\"},{\"business_line_id\":148,\"application_type\":\"NEW\"},{\"business_line_id\":34,\"application_type\":\"NEW\"},{\"business_line_id\":239,\"application_type\":\"NEW\"},{\"business_line_id\":168,\"application_type\":\"NEW\"},{\"business_line_id\":238,\"application_type\":\"NEW\"},{\"business_line_id\":237,\"application_type\":\"NEW\"},{\"business_line_id\":134,\"application_type\":\"NEW\"},{\"business_line_id\":29,\"application_type\":\"NEW\"},{\"business_line_id\":74,\"application_type\":\"NEW\"},{\"business_line_id\":166,\"application_type\":\"NEW\"},{\"business_line_id\":101,\"application_type\":\"NEW\"},{\"business_line_id\":68,\"application_type\":\"NEW\"},{\"business_line_id\":139,\"application_type\":\"NEW\"},{\"business_line_id\":67,\"application_type\":\"NEW\"},{\"business_line_id\":17,\"application_type\":\"NEW\"},{\"business_line_id\":42,\"application_type\":\"NEW\"},{\"business_line_id\":119,\"application_type\":\"NEW\"},{\"business_line_id\":2,\"application_type\":\"NEW\"},{\"business_line_id\":122,\"application_type\":\"NEW\"},{\"business_line_id\":121,\"application_type\":\"NEW\"},{\"business_line_id\":127,\"application_type\":\"NEW\"},{\"business_line_id\":133,\"application_type\":\"NEW\"},{\"business_line_id\":245,\"application_type\":\"NEW\"},{\"business_line_id\":154,\"application_type\":\"NEW\"},{\"business_line_id\":113,\"application_type\":\"NEW\"},{\"business_line_id\":244,\"application_type\":\"NEW\"},{\"business_line_id\":60,\"application_type\":\"NEW\"},{\"business_line_id\":153,\"application_type\":\"NEW\"},{\"business_line_id\":117,\"application_type\":\"NEW\"},{\"business_line_id\":243,\"application_type\":\"NEW\"},{\"business_line_id\":31,\"application_type\":\"NEW\"},{\"business_line_id\":9,\"application_type\":\"NEW\"},{\"business_line_id\":159,\"application_type\":\"NEW\"},{\"business_line_id\":66,\"application_type\":\"NEW\"},{\"business_line_id\":201,\"application_type\":\"NEW\"},{\"business_line_id\":6,\"application_type\":\"NEW\"},{\"business_line_id\":21,\"application_type\":\"NEW\"},{\"business_line_id\":162,\"application_type\":\"NEW\"},{\"business_line_id\":59,\"application_type\":\"NEW\"},{\"business_line_id\":51,\"application_type\":\"NEW\"},{\"business_line_id\":194,\"application_type\":\"NEW\"},{\"business_line_id\":33,\"application_type\":\"NEW\"},{\"business_line_id\":88,\"application_type\":\"NEW\"},{\"business_line_id\":177,\"application_type\":\"NEW\"},{\"business_line_id\":147,\"application_type\":\"NEW\"},{\"business_line_id\":180,\"application_type\":\"NEW\"},{\"business_line_id\":81,\"application_type\":\"NEW\"},{\"business_line_id\":197,\"application_type\":\"NEW\"},{\"business_line_id\":164,\"application_type\":\"NEW\"},{\"business_line_id\":157,\"application_type\":\"NEW\"},{\"business_line_id\":178,\"application_type\":\"NEW\"},{\"business_line_id\":200,\"application_type\":\"NEW\"},{\"business_line_id\":152,\"application_type\":\"NEW\"},{\"business_line_id\":199,\"application_type\":\"NEW\"},{\"business_line_id\":179,\"application_type\":\"NEW\"},{\"business_line_id\":198,\"application_type\":\"NEW\"},{\"business_line_id\":137,\"application_type\":\"NEW\"},{\"business_line_id\":10,\"application_type\":\"NEW\"},{\"business_line_id\":56,\"application_type\":\"NEW\"},{\"business_line_id\":172,\"application_type\":\"NEW\"},{\"business_line_id\":193,\"application_type\":\"NEW\"},{\"business_line_id\":20,\"application_type\":\"NEW\"},{\"business_line_id\":106,\"application_type\":\"NEW\"},{\"business_line_id\":58,\"application_type\":\"NEW\"},{\"business_line_id\":140,\"application_type\":\"NEW\"},{\"business_line_id\":183,\"application_type\":\"NEW\"},{\"business_line_id\":184,\"application_type\":\"NEW\"},{\"business_line_id\":188,\"application_type\":\"NEW\"},{\"business_line_id\":185,\"application_type\":\"NEW\"},{\"business_line_id\":96,\"application_type\":\"NEW\"},{\"business_line_id\":158,\"application_type\":\"NEW\"},{\"business_line_id\":79,\"application_type\":\"NEW\"},{\"business_line_id\":160,\"application_type\":\"NEW\"},{\"business_line_id\":92,\"application_type\":\"NEW\"},{\"business_line_id\":103,\"application_type\":\"NEW\"},{\"business_line_id\":192,\"application_type\":\"NEW\"},{\"business_line_id\":16,\"application_type\":\"NEW\"},{\"business_line_id\":191,\"application_type\":\"NEW\"},{\"business_line_id\":182,\"application_type\":\"NEW\"},{\"business_line_id\":190,\"application_type\":\"NEW\"},{\"business_line_id\":83,\"application_type\":\"NEW\"},{\"business_line_id\":189,\"application_type\":\"NEW\"},{\"business_line_id\":49,\"application_type\":\"NEW\"},{\"business_line_id\":102,\"application_type\":\"NEW\"},{\"business_line_id\":99,\"application_type\":\"NEW\"},{\"business_line_id\":130,\"application_type\":\"NEW\"},{\"business_line_id\":186,\"application_type\":\"NEW\"},{\"business_line_id\":14,\"application_type\":\"NEW\"},{\"business_line_id\":70,\"application_type\":\"NEW\"},{\"business_line_id\":35,\"application_type\":\"NEW\"},{\"business_line_id\":13,\"application_type\":\"NEW\"},{\"business_line_id\":22,\"application_type\":\"NEW\"},{\"business_line_id\":36,\"application_type\":\"NEW\"},{\"business_line_id\":204,\"application_type\":\"NEW\"},{\"business_line_id\":173,\"application_type\":\"NEW\"},{\"business_line_id\":114,\"application_type\":\"NEW\"},{\"business_line_id\":203,\"application_type\":\"NEW\"},{\"business_line_id\":165,\"application_type\":\"NEW\"},{\"business_line_id\":48,\"application_type\":\"NEW\"},{\"business_line_id\":23,\"application_type\":\"NEW\"},{\"business_line_id\":174,\"application_type\":\"NEW\"},{\"business_line_id\":104,\"application_type\":\"NEW\"},{\"business_line_id\":18,\"application_type\":\"NEW\"},{\"business_line_id\":170,\"application_type\":\"NEW\"},{\"business_line_id\":28,\"application_type\":\"NEW\"},{\"business_line_id\":151,\"application_type\":\"NEW\"},{\"business_line_id\":202,\"application_type\":\"NEW\"},{\"business_line_id\":256,\"application_type\":\"NEW\"},{\"business_line_id\":1,\"application_type\":\"NEW\"},{\"business_line_id\":144,\"application_type\":\"RENEWAL\"},{\"business_line_id\":153,\"application_type\":\"RENEWAL\"},{\"business_line_id\":239,\"application_type\":\"RENEWAL\"},{\"business_line_id\":99,\"application_type\":\"RENEWAL\"},{\"business_line_id\":187,\"application_type\":\"RENEWAL\"},{\"business_line_id\":117,\"application_type\":\"RENEWAL\"},{\"business_line_id\":35,\"application_type\":\"RENEWAL\"},{\"business_line_id\":60,\"application_type\":\"RENEWAL\"},{\"business_line_id\":82,\"application_type\":\"RENEWAL\"},{\"business_line_id\":245,\"application_type\":\"RENEWAL\"},{\"business_line_id\":83,\"application_type\":\"RENEWAL\"},{\"business_line_id\":186,\"application_type\":\"RENEWAL\"},{\"business_line_id\":154,\"application_type\":\"RENEWAL\"},{\"business_line_id\":149,\"application_type\":\"RENEWAL\"},{\"business_line_id\":182,\"application_type\":\"RENEWAL\"},{\"business_line_id\":113,\"application_type\":\"RENEWAL\"},{\"business_line_id\":168,\"application_type\":\"RENEWAL\"},{\"business_line_id\":91,\"application_type\":\"RENEWAL\"},{\"business_line_id\":244,\"application_type\":\"RENEWAL\"},{\"business_line_id\":173,\"application_type\":\"RENEWAL\"},{\"business_line_id\":9,\"application_type\":\"RENEWAL\"},{\"business_line_id\":67,\"application_type\":\"RENEWAL\"},{\"business_line_id\":185,\"application_type\":\"RENEWAL\"},{\"business_line_id\":242,\"application_type\":\"RENEWAL\"},{\"business_line_id\":184,\"application_type\":\"RENEWAL\"},{\"business_line_id\":3,\"application_type\":\"RENEWAL\"},{\"business_line_id\":52,\"application_type\":\"RENEWAL\"},{\"business_line_id\":1,\"application_type\":\"RENEWAL\"},{\"business_line_id\":241,\"application_type\":\"RENEWAL\"},{\"business_line_id\":158,\"application_type\":\"RENEWAL\"},{\"business_line_id\":183,\"application_type\":\"RENEWAL\"},{\"business_line_id\":17,\"application_type\":\"RENEWAL\"},{\"business_line_id\":14,\"application_type\":\"RENEWAL\"},{\"business_line_id\":243,\"application_type\":\"RENEWAL\"},{\"business_line_id\":90,\"application_type\":\"RENEWAL\"},{\"business_line_id\":103,\"application_type\":\"RENEWAL\"},{\"business_line_id\":34,\"application_type\":\"RENEWAL\"},{\"business_line_id\":31,\"application_type\":\"RENEWAL\"},{\"business_line_id\":148,\"application_type\":\"RENEWAL\"},{\"business_line_id\":106,\"application_type\":\"RENEWAL\"},{\"business_line_id\":42,\"application_type\":\"RENEWAL\"},{\"business_line_id\":254,\"application_type\":\"RENEWAL\"},{\"business_line_id\":253,\"application_type\":\"RENEWAL\"},{\"business_line_id\":57,\"application_type\":\"RENEWAL\"},{\"business_line_id\":24,\"application_type\":\"RENEWAL\"},{\"business_line_id\":135,\"application_type\":\"RENEWAL\"},{\"business_line_id\":28,\"application_type\":\"RENEWAL\"},{\"business_line_id\":137,\"application_type\":\"RENEWAL\"},{\"business_line_id\":141,\"application_type\":\"RENEWAL\"},{\"business_line_id\":110,\"application_type\":\"RENEWAL\"},{\"business_line_id\":167,\"application_type\":\"RENEWAL\"},{\"business_line_id\":56,\"application_type\":\"RENEWAL\"},{\"business_line_id\":69,\"application_type\":\"RENEWAL\"},{\"business_line_id\":177,\"application_type\":\"RENEWAL\"},{\"business_line_id\":40,\"application_type\":\"RENEWAL\"},{\"business_line_id\":123,\"application_type\":\"RENEWAL\"},{\"business_line_id\":179,\"application_type\":\"RENEWAL\"},{\"business_line_id\":71,\"application_type\":\"RENEWAL\"},{\"business_line_id\":124,\"application_type\":\"RENEWAL\"},{\"business_line_id\":161,\"application_type\":\"RENEWAL\"},{\"business_line_id\":164,\"application_type\":\"RENEWAL\"},{\"business_line_id\":105,\"application_type\":\"RENEWAL\"},{\"business_line_id\":175,\"application_type\":\"RENEWAL\"},{\"business_line_id\":63,\"application_type\":\"RENEWAL\"},{\"business_line_id\":178,\"application_type\":\"RENEWAL\"},{\"business_line_id\":18,\"application_type\":\"RENEWAL\"},{\"business_line_id\":251,\"application_type\":\"RENEWAL\"},{\"business_line_id\":250,\"application_type\":\"RENEWAL\"},{\"business_line_id\":248,\"application_type\":\"RENEWAL\"},{\"business_line_id\":6,\"application_type\":\"RENEWAL\"},{\"business_line_id\":36,\"application_type\":\"RENEWAL\"},{\"business_line_id\":2,\"application_type\":\"RENEWAL\"},{\"business_line_id\":180,\"application_type\":\"RENEWAL\"},{\"business_line_id\":43,\"application_type\":\"RENEWAL\"},{\"business_line_id\":122,\"application_type\":\"RENEWAL\"},{\"business_line_id\":174,\"application_type\":\"RENEWAL\"},{\"business_line_id\":121,\"application_type\":\"RENEWAL\"},{\"business_line_id\":145,\"application_type\":\"RENEWAL\"},{\"business_line_id\":172,\"application_type\":\"RENEWAL\"},{\"business_line_id\":127,\"application_type\":\"RENEWAL\"},{\"business_line_id\":156,\"application_type\":\"RENEWAL\"},{\"business_line_id\":133,\"application_type\":\"RENEWAL\"},{\"business_line_id\":78,\"application_type\":\"RENEWAL\"},{\"business_line_id\":119,\"application_type\":\"RENEWAL\"},{\"business_line_id\":163,\"application_type\":\"RENEWAL\"},{\"business_line_id\":120,\"application_type\":\"RENEWAL\"},{\"business_line_id\":136,\"application_type\":\"RENEWAL\"},{\"business_line_id\":162,\"application_type\":\"RENEWAL\"},{\"business_line_id\":247,\"application_type\":\"RENEWAL\"},{\"business_line_id\":80,\"application_type\":\"RENEWAL\"},{\"business_line_id\":75,\"application_type\":\"RENEWAL\"},{\"business_line_id\":51,\"application_type\":\"RENEWAL\"},{\"business_line_id\":246,\"application_type\":\"RENEWAL\"},{\"business_line_id\":114,\"application_type\":\"RENEWAL\"},{\"business_line_id\":33,\"application_type\":\"RENEWAL\"},{\"business_line_id\":16,\"application_type\":\"RENEWAL\"},{\"business_line_id\":238,\"application_type\":\"RENEWAL\"},{\"business_line_id\":115,\"application_type\":\"RENEWAL\"},{\"business_line_id\":146,\"application_type\":\"RENEWAL\"},{\"business_line_id\":5,\"application_type\":\"RENEWAL\"},{\"business_line_id\":200,\"application_type\":\"RENEWAL\"},{\"business_line_id\":217,\"application_type\":\"RENEWAL\"},{\"business_line_id\":44,\"application_type\":\"RENEWAL\"},{\"business_line_id\":157,\"application_type\":\"RENEWAL\"},{\"business_line_id\":8,\"application_type\":\"RENEWAL\"},{\"business_line_id\":77,\"application_type\":\"RENEWAL\"},{\"business_line_id\":201,\"application_type\":\"RENEWAL\"},{\"business_line_id\":131,\"application_type\":\"RENEWAL\"},{\"business_line_id\":30,\"application_type\":\"RENEWAL\"},{\"business_line_id\":202,\"application_type\":\"RENEWAL\"},{\"business_line_id\":84,\"application_type\":\"RENEWAL\"},{\"business_line_id\":61,\"application_type\":\"RENEWAL\"},{\"business_line_id\":199,\"application_type\":\"RENEWAL\"},{\"business_line_id\":53,\"application_type\":\"RENEWAL\"},{\"business_line_id\":21,\"application_type\":\"RENEWAL\"},{\"business_line_id\":107,\"application_type\":\"RENEWAL\"},{\"business_line_id\":221,\"application_type\":\"RENEWAL\"},{\"business_line_id\":81,\"application_type\":\"RENEWAL\"},{\"business_line_id\":255,\"application_type\":\"RENEWAL\"},{\"business_line_id\":257,\"application_type\":\"RENEWAL\"},{\"business_line_id\":197,\"application_type\":\"RENEWAL\"},{\"business_line_id\":220,\"application_type\":\"RENEWAL\"},{\"business_line_id\":219,\"application_type\":\"RENEWAL\"},{\"business_line_id\":10,\"application_type\":\"RENEWAL\"},{\"business_line_id\":89,\"application_type\":\"RENEWAL\"},{\"business_line_id\":109,\"application_type\":\"RENEWAL\"},{\"business_line_id\":198,\"application_type\":\"RENEWAL\"},{\"business_line_id\":218,\"application_type\":\"RENEWAL\"},{\"business_line_id\":256,\"application_type\":\"RENEWAL\"},{\"business_line_id\":216,\"application_type\":\"RENEWAL\"},{\"business_line_id\":98,\"application_type\":\"RENEWAL\"},{\"business_line_id\":211,\"application_type\":\"RENEWAL\"},{\"business_line_id\":48,\"application_type\":\"RENEWAL\"},{\"business_line_id\":210,\"application_type\":\"RENEWAL\"},{\"business_line_id\":209,\"application_type\":\"RENEWAL\"},{\"business_line_id\":203,\"application_type\":\"RENEWAL\"},{\"business_line_id\":208,\"application_type\":\"RENEWAL\"},{\"business_line_id\":86,\"application_type\":\"RENEWAL\"},{\"business_line_id\":22,\"application_type\":\"RENEWAL\"},{\"business_line_id\":87,\"application_type\":\"RENEWAL\"},{\"business_line_id\":207,\"application_type\":\"RENEWAL\"},{\"business_line_id\":70,\"application_type\":\"RENEWAL\"},{\"business_line_id\":32,\"application_type\":\"RENEWAL\"},{\"business_line_id\":205,\"application_type\":\"RENEWAL\"},{\"business_line_id\":212,\"application_type\":\"RENEWAL\"},{\"business_line_id\":23,\"application_type\":\"RENEWAL\"},{\"business_line_id\":215,\"application_type\":\"RENEWAL\"},{\"business_line_id\":104,\"application_type\":\"RENEWAL\"},{\"business_line_id\":214,\"application_type\":\"RENEWAL\"},{\"business_line_id\":66,\"application_type\":\"RENEWAL\"},{\"business_line_id\":62,\"application_type\":\"RENEWAL\"},{\"business_line_id\":170,\"application_type\":\"RENEWAL\"},{\"business_line_id\":4,\"application_type\":\"RENEWAL\"},{\"business_line_id\":45,\"application_type\":\"RENEWAL\"},{\"business_line_id\":204,\"application_type\":\"RENEWAL\"},{\"business_line_id\":129,\"application_type\":\"RENEWAL\"},{\"business_line_id\":12,\"application_type\":\"RENEWAL\"},{\"business_line_id\":165,\"application_type\":\"RENEWAL\"},{\"business_line_id\":50,\"application_type\":\"RENEWAL\"},{\"business_line_id\":116,\"application_type\":\"RENEWAL\"},{\"business_line_id\":151,\"application_type\":\"RENEWAL\"},{\"business_line_id\":237,\"application_type\":\"RENEWAL\"},{\"business_line_id\":20,\"application_type\":\"RENEWAL\"},{\"business_line_id\":27,\"application_type\":\"RENEWAL\"},{\"business_line_id\":26,\"application_type\":\"RENEWAL\"},{\"business_line_id\":140,\"application_type\":\"RENEWAL\"},{\"business_line_id\":118,\"application_type\":\"RENEWAL\"},{\"business_line_id\":38,\"application_type\":\"RENEWAL\"},{\"business_line_id\":58,\"application_type\":\"RENEWAL\"},{\"business_line_id\":11,\"application_type\":\"RENEWAL\"},{\"business_line_id\":143,\"application_type\":\"RENEWAL\"},{\"business_line_id\":92,\"application_type\":\"RENEWAL\"},{\"business_line_id\":125,\"application_type\":\"RENEWAL\"},{\"business_line_id\":235,\"application_type\":\"RENEWAL\"},{\"business_line_id\":130,\"application_type\":\"RENEWAL\"},{\"business_line_id\":233,\"application_type\":\"RENEWAL\"},{\"business_line_id\":128,\"application_type\":\"RENEWAL\"},{\"business_line_id\":138,\"application_type\":\"RENEWAL\"},{\"business_line_id\":49,\"application_type\":\"RENEWAL\"},{\"business_line_id\":134,\"application_type\":\"RENEWAL\"},{\"business_line_id\":29,\"application_type\":\"RENEWAL\"},{\"business_line_id\":160,\"application_type\":\"RENEWAL\"},{\"business_line_id\":74,\"application_type\":\"RENEWAL\"},{\"business_line_id\":166,\"application_type\":\"RENEWAL\"},{\"business_line_id\":79,\"application_type\":\"RENEWAL\"},{\"business_line_id\":101,\"application_type\":\"RENEWAL\"},{\"business_line_id\":68,\"application_type\":\"RENEWAL\"},{\"business_line_id\":96,\"application_type\":\"RENEWAL\"},{\"business_line_id\":139,\"application_type\":\"RENEWAL\"},{\"business_line_id\":159,\"application_type\":\"RENEWAL\"},{\"business_line_id\":188,\"application_type\":\"RENEWAL\"},{\"business_line_id\":150,\"application_type\":\"RENEWAL\"},{\"business_line_id\":234,\"application_type\":\"RENEWAL\"},{\"business_line_id\":102,\"application_type\":\"RENEWAL\"},{\"business_line_id\":152,\"application_type\":\"RENEWAL\"},{\"business_line_id\":169,\"application_type\":\"RENEWAL\"},{\"business_line_id\":7,\"application_type\":\"RENEWAL\"},{\"business_line_id\":147,\"application_type\":\"RENEWAL\"},{\"business_line_id\":223,\"application_type\":\"RENEWAL\"},{\"business_line_id\":94,\"application_type\":\"RENEWAL\"},{\"business_line_id\":88,\"application_type\":\"RENEWAL\"},{\"business_line_id\":224,\"application_type\":\"RENEWAL\"},{\"business_line_id\":13,\"application_type\":\"RENEWAL\"},{\"business_line_id\":222,\"application_type\":\"RENEWAL\"},{\"business_line_id\":194,\"application_type\":\"RENEWAL\"},{\"business_line_id\":47,\"application_type\":\"RENEWAL\"},{\"business_line_id\":25,\"application_type\":\"RENEWAL\"},{\"business_line_id\":59,\"application_type\":\"RENEWAL\"},{\"business_line_id\":126,\"application_type\":\"RENEWAL\"},{\"business_line_id\":225,\"application_type\":\"RENEWAL\"},{\"business_line_id\":111,\"application_type\":\"RENEWAL\"},{\"business_line_id\":232,\"application_type\":\"RENEWAL\"},{\"business_line_id\":189,\"application_type\":\"RENEWAL\"},{\"business_line_id\":46,\"application_type\":\"RENEWAL\"},{\"business_line_id\":230,\"application_type\":\"RENEWAL\"},{\"business_line_id\":190,\"application_type\":\"RENEWAL\"},{\"business_line_id\":64,\"application_type\":\"RENEWAL\"},{\"business_line_id\":229,\"application_type\":\"RENEWAL\"},{\"business_line_id\":191,\"application_type\":\"RENEWAL\"},{\"business_line_id\":228,\"application_type\":\"RENEWAL\"},{\"business_line_id\":192,\"application_type\":\"RENEWAL\"},{\"business_line_id\":226,\"application_type\":\"RENEWAL\"},{\"business_line_id\":41,\"application_type\":\"RENEWAL\"},{\"business_line_id\":193,\"application_type\":\"RENEWAL\"},{\"business_line_id\":132,\"application_type\":\"RENEWAL\"}],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:33:13', '2021-10-08 05:33:13');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000066, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'requirements_1_1', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":1,\"item_avatar\":\"\",\"item_maintitle\":\"Certificate of Annual Building Inspection\",\"item_subtitle\":\"\",\"item_update_date\":\"February 11, 2020 &middot; 05:42 AM\"}', '{\"title\":\"Certificate of Annual Building Inspection\",\"desc\":\"\",\"validation_code_title\":\"O.R. No.\",\"is_for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"is_for_poblacion_only\":\"0\",\"classifications\":[{\"business_line_id\":128,\"application_type\":\"NEW\"},{\"business_line_id\":41,\"application_type\":\"NEW\"},{\"business_line_id\":225,\"application_type\":\"NEW\"},{\"business_line_id\":126,\"application_type\":\"NEW\"},{\"business_line_id\":169,\"application_type\":\"NEW\"},{\"business_line_id\":7,\"application_type\":\"NEW\"},{\"business_line_id\":223,\"application_type\":\"NEW\"},{\"business_line_id\":94,\"application_type\":\"NEW\"},{\"business_line_id\":224,\"application_type\":\"NEW\"},{\"business_line_id\":222,\"application_type\":\"NEW\"},{\"business_line_id\":47,\"application_type\":\"NEW\"},{\"business_line_id\":25,\"application_type\":\"NEW\"},{\"business_line_id\":132,\"application_type\":\"NEW\"},{\"business_line_id\":115,\"application_type\":\"NEW\"},{\"business_line_id\":107,\"application_type\":\"NEW\"},{\"business_line_id\":221,\"application_type\":\"NEW\"},{\"business_line_id\":255,\"application_type\":\"NEW\"},{\"business_line_id\":226,\"application_type\":\"NEW\"},{\"business_line_id\":138,\"application_type\":\"NEW\"},{\"business_line_id\":228,\"application_type\":\"NEW\"},{\"business_line_id\":27,\"application_type\":\"NEW\"},{\"business_line_id\":26,\"application_type\":\"NEW\"},{\"business_line_id\":118,\"application_type\":\"NEW\"},{\"business_line_id\":38,\"application_type\":\"NEW\"},{\"business_line_id\":11,\"application_type\":\"NEW\"},{\"business_line_id\":143,\"application_type\":\"NEW\"},{\"business_line_id\":125,\"application_type\":\"NEW\"},{\"business_line_id\":235,\"application_type\":\"NEW\"},{\"business_line_id\":233,\"application_type\":\"NEW\"},{\"business_line_id\":234,\"application_type\":\"NEW\"},{\"business_line_id\":111,\"application_type\":\"NEW\"},{\"business_line_id\":232,\"application_type\":\"NEW\"},{\"business_line_id\":46,\"application_type\":\"NEW\"},{\"business_line_id\":230,\"application_type\":\"NEW\"},{\"business_line_id\":64,\"application_type\":\"NEW\"},{\"business_line_id\":229,\"application_type\":\"NEW\"},{\"business_line_id\":257,\"application_type\":\"NEW\"},{\"business_line_id\":35,\"application_type\":\"NEW\"},{\"business_line_id\":62,\"application_type\":\"NEW\"},{\"business_line_id\":4,\"application_type\":\"NEW\"},{\"business_line_id\":45,\"application_type\":\"NEW\"},{\"business_line_id\":129,\"application_type\":\"NEW\"},{\"business_line_id\":12,\"application_type\":\"NEW\"},{\"business_line_id\":50,\"application_type\":\"NEW\"},{\"business_line_id\":116,\"application_type\":\"NEW\"},{\"business_line_id\":212,\"application_type\":\"NEW\"},{\"business_line_id\":98,\"application_type\":\"NEW\"},{\"business_line_id\":211,\"application_type\":\"NEW\"},{\"business_line_id\":210,\"application_type\":\"NEW\"},{\"business_line_id\":209,\"application_type\":\"NEW\"},{\"business_line_id\":208,\"application_type\":\"NEW\"},{\"business_line_id\":86,\"application_type\":\"NEW\"},{\"business_line_id\":87,\"application_type\":\"NEW\"},{\"business_line_id\":207,\"application_type\":\"NEW\"},{\"business_line_id\":214,\"application_type\":\"NEW\"},{\"business_line_id\":215,\"application_type\":\"NEW\"},{\"business_line_id\":216,\"application_type\":\"NEW\"},{\"business_line_id\":220,\"application_type\":\"NEW\"},{\"business_line_id\":219,\"application_type\":\"NEW\"},{\"business_line_id\":89,\"application_type\":\"NEW\"},{\"business_line_id\":109,\"application_type\":\"NEW\"},{\"business_line_id\":218,\"application_type\":\"NEW\"},{\"business_line_id\":53,\"application_type\":\"NEW\"},{\"business_line_id\":146,\"application_type\":\"NEW\"},{\"business_line_id\":5,\"application_type\":\"NEW\"},{\"business_line_id\":217,\"application_type\":\"NEW\"},{\"business_line_id\":44,\"application_type\":\"NEW\"},{\"business_line_id\":8,\"application_type\":\"NEW\"},{\"business_line_id\":77,\"application_type\":\"NEW\"},{\"business_line_id\":131,\"application_type\":\"NEW\"},{\"business_line_id\":30,\"application_type\":\"NEW\"},{\"business_line_id\":84,\"application_type\":\"NEW\"},{\"business_line_id\":61,\"application_type\":\"NEW\"},{\"business_line_id\":32,\"application_type\":\"NEW\"},{\"business_line_id\":150,\"application_type\":\"NEW\"},{\"business_line_id\":144,\"application_type\":\"NEW\"},{\"business_line_id\":57,\"application_type\":\"NEW\"},{\"business_line_id\":124,\"application_type\":\"NEW\"},{\"business_line_id\":105,\"application_type\":\"NEW\"},{\"business_line_id\":63,\"application_type\":\"NEW\"},{\"business_line_id\":43,\"application_type\":\"NEW\"},{\"business_line_id\":250,\"application_type\":\"NEW\"},{\"business_line_id\":123,\"application_type\":\"NEW\"},{\"business_line_id\":135,\"application_type\":\"NEW\"},{\"business_line_id\":141,\"application_type\":\"NEW\"},{\"business_line_id\":167,\"application_type\":\"NEW\"},{\"business_line_id\":69,\"application_type\":\"NEW\"},{\"business_line_id\":248,\"application_type\":\"NEW\"},{\"business_line_id\":163,\"application_type\":\"NEW\"},{\"business_line_id\":136,\"application_type\":\"NEW\"},{\"business_line_id\":247,\"application_type\":\"NEW\"},{\"business_line_id\":75,\"application_type\":\"NEW\"},{\"business_line_id\":71,\"application_type\":\"NEW\"},{\"business_line_id\":175,\"application_type\":\"NEW\"},{\"business_line_id\":251,\"application_type\":\"NEW\"},{\"business_line_id\":253,\"application_type\":\"NEW\"},{\"business_line_id\":3,\"application_type\":\"NEW\"},{\"business_line_id\":254,\"application_type\":\"NEW\"},{\"business_line_id\":90,\"application_type\":\"NEW\"},{\"business_line_id\":187,\"application_type\":\"NEW\"},{\"business_line_id\":82,\"application_type\":\"NEW\"},{\"business_line_id\":149,\"application_type\":\"NEW\"},{\"business_line_id\":156,\"application_type\":\"NEW\"},{\"business_line_id\":145,\"application_type\":\"NEW\"},{\"business_line_id\":78,\"application_type\":\"NEW\"},{\"business_line_id\":91,\"application_type\":\"NEW\"},{\"business_line_id\":80,\"application_type\":\"NEW\"},{\"business_line_id\":120,\"application_type\":\"NEW\"},{\"business_line_id\":40,\"application_type\":\"NEW\"},{\"business_line_id\":110,\"application_type\":\"NEW\"},{\"business_line_id\":24,\"application_type\":\"NEW\"},{\"business_line_id\":246,\"application_type\":\"NEW\"},{\"business_line_id\":161,\"application_type\":\"NEW\"},{\"business_line_id\":242,\"application_type\":\"NEW\"},{\"business_line_id\":52,\"application_type\":\"NEW\"},{\"business_line_id\":241,\"application_type\":\"NEW\"},{\"business_line_id\":148,\"application_type\":\"NEW\"},{\"business_line_id\":34,\"application_type\":\"NEW\"},{\"business_line_id\":239,\"application_type\":\"NEW\"},{\"business_line_id\":168,\"application_type\":\"NEW\"},{\"business_line_id\":238,\"application_type\":\"NEW\"},{\"business_line_id\":237,\"application_type\":\"NEW\"},{\"business_line_id\":134,\"application_type\":\"NEW\"},{\"business_line_id\":29,\"application_type\":\"NEW\"},{\"business_line_id\":74,\"application_type\":\"NEW\"},{\"business_line_id\":166,\"application_type\":\"NEW\"},{\"business_line_id\":101,\"application_type\":\"NEW\"},{\"business_line_id\":68,\"application_type\":\"NEW\"},{\"business_line_id\":139,\"application_type\":\"NEW\"},{\"business_line_id\":67,\"application_type\":\"NEW\"},{\"business_line_id\":17,\"application_type\":\"NEW\"},{\"business_line_id\":42,\"application_type\":\"NEW\"},{\"business_line_id\":119,\"application_type\":\"NEW\"},{\"business_line_id\":2,\"application_type\":\"NEW\"},{\"business_line_id\":122,\"application_type\":\"NEW\"},{\"business_line_id\":121,\"application_type\":\"NEW\"},{\"business_line_id\":127,\"application_type\":\"NEW\"},{\"business_line_id\":133,\"application_type\":\"NEW\"},{\"business_line_id\":245,\"application_type\":\"NEW\"},{\"business_line_id\":154,\"application_type\":\"NEW\"},{\"business_line_id\":113,\"application_type\":\"NEW\"},{\"business_line_id\":244,\"application_type\":\"NEW\"},{\"business_line_id\":60,\"application_type\":\"NEW\"},{\"business_line_id\":153,\"application_type\":\"NEW\"},{\"business_line_id\":117,\"application_type\":\"NEW\"},{\"business_line_id\":243,\"application_type\":\"NEW\"},{\"business_line_id\":31,\"application_type\":\"NEW\"},{\"business_line_id\":9,\"application_type\":\"NEW\"},{\"business_line_id\":159,\"application_type\":\"NEW\"},{\"business_line_id\":205,\"application_type\":\"NEW\"},{\"business_line_id\":104,\"application_type\":\"NEW\"},{\"business_line_id\":106,\"application_type\":\"NEW\"},{\"business_line_id\":147,\"application_type\":\"NEW\"},{\"business_line_id\":200,\"application_type\":\"NEW\"},{\"business_line_id\":137,\"application_type\":\"NEW\"},{\"business_line_id\":199,\"application_type\":\"NEW\"},{\"business_line_id\":56,\"application_type\":\"NEW\"},{\"business_line_id\":103,\"application_type\":\"NEW\"},{\"business_line_id\":198,\"application_type\":\"NEW\"},{\"business_line_id\":189,\"application_type\":\"NEW\"},{\"business_line_id\":157,\"application_type\":\"NEW\"},{\"business_line_id\":179,\"application_type\":\"NEW\"},{\"business_line_id\":58,\"application_type\":\"NEW\"},{\"business_line_id\":256,\"application_type\":\"NEW\"},{\"business_line_id\":92,\"application_type\":\"NEW\"},{\"business_line_id\":183,\"application_type\":\"NEW\"},{\"business_line_id\":202,\"application_type\":\"NEW\"},{\"business_line_id\":102,\"application_type\":\"NEW\"},{\"business_line_id\":178,\"application_type\":\"NEW\"},{\"business_line_id\":201,\"application_type\":\"NEW\"},{\"business_line_id\":130,\"application_type\":\"NEW\"},{\"business_line_id\":6,\"application_type\":\"NEW\"},{\"business_line_id\":10,\"application_type\":\"NEW\"},{\"business_line_id\":160,\"application_type\":\"NEW\"},{\"business_line_id\":16,\"application_type\":\"NEW\"},{\"business_line_id\":180,\"application_type\":\"NEW\"},{\"business_line_id\":194,\"application_type\":\"NEW\"},{\"business_line_id\":164,\"application_type\":\"NEW\"},{\"business_line_id\":182,\"application_type\":\"NEW\"},{\"business_line_id\":193,\"application_type\":\"NEW\"},{\"business_line_id\":88,\"application_type\":\"NEW\"},{\"business_line_id\":172,\"application_type\":\"NEW\"},{\"business_line_id\":140,\"application_type\":\"NEW\"},{\"business_line_id\":59,\"application_type\":\"NEW\"},{\"business_line_id\":192,\"application_type\":\"NEW\"},{\"business_line_id\":190,\"application_type\":\"NEW\"},{\"business_line_id\":197,\"application_type\":\"NEW\"},{\"business_line_id\":162,\"application_type\":\"NEW\"},{\"business_line_id\":99,\"application_type\":\"NEW\"},{\"business_line_id\":191,\"application_type\":\"NEW\"},{\"business_line_id\":51,\"application_type\":\"NEW\"},{\"business_line_id\":21,\"application_type\":\"NEW\"},{\"business_line_id\":83,\"application_type\":\"NEW\"},{\"business_line_id\":33,\"application_type\":\"NEW\"},{\"business_line_id\":152,\"application_type\":\"NEW\"},{\"business_line_id\":96,\"application_type\":\"NEW\"},{\"business_line_id\":79,\"application_type\":\"NEW\"},{\"business_line_id\":36,\"application_type\":\"NEW\"},{\"business_line_id\":23,\"application_type\":\"NEW\"},{\"business_line_id\":158,\"application_type\":\"NEW\"},{\"business_line_id\":13,\"application_type\":\"NEW\"},{\"business_line_id\":70,\"application_type\":\"NEW\"},{\"business_line_id\":188,\"application_type\":\"NEW\"},{\"business_line_id\":14,\"application_type\":\"NEW\"},{\"business_line_id\":114,\"application_type\":\"NEW\"},{\"business_line_id\":48,\"application_type\":\"NEW\"},{\"business_line_id\":81,\"application_type\":\"NEW\"},{\"business_line_id\":173,\"application_type\":\"NEW\"},{\"business_line_id\":203,\"application_type\":\"NEW\"},{\"business_line_id\":174,\"application_type\":\"NEW\"},{\"business_line_id\":186,\"application_type\":\"NEW\"},{\"business_line_id\":22,\"application_type\":\"NEW\"},{\"business_line_id\":151,\"application_type\":\"NEW\"},{\"business_line_id\":20,\"application_type\":\"NEW\"},{\"business_line_id\":184,\"application_type\":\"NEW\"},{\"business_line_id\":204,\"application_type\":\"NEW\"},{\"business_line_id\":185,\"application_type\":\"NEW\"},{\"business_line_id\":170,\"application_type\":\"NEW\"},{\"business_line_id\":177,\"application_type\":\"NEW\"},{\"business_line_id\":18,\"application_type\":\"NEW\"},{\"business_line_id\":1,\"application_type\":\"NEW\"},{\"business_line_id\":66,\"application_type\":\"NEW\"},{\"business_line_id\":165,\"application_type\":\"NEW\"},{\"business_line_id\":28,\"application_type\":\"NEW\"},{\"business_line_id\":49,\"application_type\":\"NEW\"},{\"business_line_id\":127,\"application_type\":\"RENEWAL\"},{\"business_line_id\":154,\"application_type\":\"RENEWAL\"},{\"business_line_id\":182,\"application_type\":\"RENEWAL\"},{\"business_line_id\":16,\"application_type\":\"RENEWAL\"},{\"business_line_id\":34,\"application_type\":\"RENEWAL\"},{\"business_line_id\":168,\"application_type\":\"RENEWAL\"},{\"business_line_id\":133,\"application_type\":\"RENEWAL\"},{\"business_line_id\":245,\"application_type\":\"RENEWAL\"},{\"business_line_id\":99,\"application_type\":\"RENEWAL\"},{\"business_line_id\":239,\"application_type\":\"RENEWAL\"},{\"business_line_id\":49,\"application_type\":\"RENEWAL\"},{\"business_line_id\":186,\"application_type\":\"RENEWAL\"},{\"business_line_id\":83,\"application_type\":\"RENEWAL\"},{\"business_line_id\":185,\"application_type\":\"RENEWAL\"},{\"business_line_id\":243,\"application_type\":\"RENEWAL\"},{\"business_line_id\":242,\"application_type\":\"RENEWAL\"},{\"business_line_id\":106,\"application_type\":\"RENEWAL\"},{\"business_line_id\":67,\"application_type\":\"RENEWAL\"},{\"business_line_id\":184,\"application_type\":\"RENEWAL\"},{\"business_line_id\":9,\"application_type\":\"RENEWAL\"},{\"business_line_id\":17,\"application_type\":\"RENEWAL\"},{\"business_line_id\":183,\"application_type\":\"RENEWAL\"},{\"business_line_id\":117,\"application_type\":\"RENEWAL\"},{\"business_line_id\":52,\"application_type\":\"RENEWAL\"},{\"business_line_id\":113,\"application_type\":\"RENEWAL\"},{\"business_line_id\":148,\"application_type\":\"RENEWAL\"},{\"business_line_id\":244,\"application_type\":\"RENEWAL\"},{\"business_line_id\":158,\"application_type\":\"RENEWAL\"},{\"business_line_id\":60,\"application_type\":\"RENEWAL\"},{\"business_line_id\":241,\"application_type\":\"RENEWAL\"},{\"business_line_id\":153,\"application_type\":\"RENEWAL\"},{\"business_line_id\":103,\"application_type\":\"RENEWAL\"},{\"business_line_id\":31,\"application_type\":\"RENEWAL\"},{\"business_line_id\":42,\"application_type\":\"RENEWAL\"},{\"business_line_id\":121,\"application_type\":\"RENEWAL\"},{\"business_line_id\":144,\"application_type\":\"RENEWAL\"},{\"business_line_id\":36,\"application_type\":\"RENEWAL\"},{\"business_line_id\":80,\"application_type\":\"RENEWAL\"},{\"business_line_id\":120,\"application_type\":\"RENEWAL\"},{\"business_line_id\":28,\"application_type\":\"RENEWAL\"},{\"business_line_id\":40,\"application_type\":\"RENEWAL\"},{\"business_line_id\":110,\"application_type\":\"RENEWAL\"},{\"business_line_id\":18,\"application_type\":\"RENEWAL\"},{\"business_line_id\":24,\"application_type\":\"RENEWAL\"},{\"business_line_id\":251,\"application_type\":\"RENEWAL\"},{\"business_line_id\":177,\"application_type\":\"RENEWAL\"},{\"business_line_id\":175,\"application_type\":\"RENEWAL\"},{\"business_line_id\":161,\"application_type\":\"RENEWAL\"},{\"business_line_id\":71,\"application_type\":\"RENEWAL\"},{\"business_line_id\":91,\"application_type\":\"RENEWAL\"},{\"business_line_id\":78,\"application_type\":\"RENEWAL\"},{\"business_line_id\":253,\"application_type\":\"RENEWAL\"},{\"business_line_id\":1,\"application_type\":\"RENEWAL\"},{\"business_line_id\":3,\"application_type\":\"RENEWAL\"},{\"business_line_id\":14,\"application_type\":\"RENEWAL\"},{\"business_line_id\":254,\"application_type\":\"RENEWAL\"},{\"business_line_id\":90,\"application_type\":\"RENEWAL\"},{\"business_line_id\":187,\"application_type\":\"RENEWAL\"},{\"business_line_id\":173,\"application_type\":\"RENEWAL\"},{\"business_line_id\":82,\"application_type\":\"RENEWAL\"},{\"business_line_id\":149,\"application_type\":\"RENEWAL\"},{\"business_line_id\":156,\"application_type\":\"RENEWAL\"},{\"business_line_id\":145,\"application_type\":\"RENEWAL\"},{\"business_line_id\":114,\"application_type\":\"RENEWAL\"},{\"business_line_id\":164,\"application_type\":\"RENEWAL\"},{\"business_line_id\":57,\"application_type\":\"RENEWAL\"},{\"business_line_id\":124,\"application_type\":\"RENEWAL\"},{\"business_line_id\":174,\"application_type\":\"RENEWAL\"},{\"business_line_id\":163,\"application_type\":\"RENEWAL\"},{\"business_line_id\":136,\"application_type\":\"RENEWAL\"},{\"business_line_id\":51,\"application_type\":\"RENEWAL\"},{\"business_line_id\":247,\"application_type\":\"RENEWAL\"},{\"business_line_id\":75,\"application_type\":\"RENEWAL\"},{\"business_line_id\":33,\"application_type\":\"RENEWAL\"},{\"business_line_id\":246,\"application_type\":\"RENEWAL\"},{\"business_line_id\":180,\"application_type\":\"RENEWAL\"},{\"business_line_id\":119,\"application_type\":\"RENEWAL\"},{\"business_line_id\":2,\"application_type\":\"RENEWAL\"},{\"business_line_id\":172,\"application_type\":\"RENEWAL\"},{\"business_line_id\":43,\"application_type\":\"RENEWAL\"},{\"business_line_id\":162,\"application_type\":\"RENEWAL\"},{\"business_line_id\":248,\"application_type\":\"RENEWAL\"},{\"business_line_id\":178,\"application_type\":\"RENEWAL\"},{\"business_line_id\":105,\"application_type\":\"RENEWAL\"},{\"business_line_id\":63,\"application_type\":\"RENEWAL\"},{\"business_line_id\":179,\"application_type\":\"RENEWAL\"},{\"business_line_id\":250,\"application_type\":\"RENEWAL\"},{\"business_line_id\":137,\"application_type\":\"RENEWAL\"},{\"business_line_id\":123,\"application_type\":\"RENEWAL\"},{\"business_line_id\":135,\"application_type\":\"RENEWAL\"},{\"business_line_id\":56,\"application_type\":\"RENEWAL\"},{\"business_line_id\":141,\"application_type\":\"RENEWAL\"},{\"business_line_id\":167,\"application_type\":\"RENEWAL\"},{\"business_line_id\":6,\"application_type\":\"RENEWAL\"},{\"business_line_id\":69,\"application_type\":\"RENEWAL\"},{\"business_line_id\":122,\"application_type\":\"RENEWAL\"},{\"business_line_id\":238,\"application_type\":\"RENEWAL\"},{\"business_line_id\":115,\"application_type\":\"RENEWAL\"},{\"business_line_id\":53,\"application_type\":\"RENEWAL\"},{\"business_line_id\":146,\"application_type\":\"RENEWAL\"},{\"business_line_id\":157,\"application_type\":\"RENEWAL\"},{\"business_line_id\":5,\"application_type\":\"RENEWAL\"},{\"business_line_id\":217,\"application_type\":\"RENEWAL\"},{\"business_line_id\":201,\"application_type\":\"RENEWAL\"},{\"business_line_id\":44,\"application_type\":\"RENEWAL\"},{\"business_line_id\":8,\"application_type\":\"RENEWAL\"},{\"business_line_id\":202,\"application_type\":\"RENEWAL\"},{\"business_line_id\":77,\"application_type\":\"RENEWAL\"},{\"business_line_id\":131,\"application_type\":\"RENEWAL\"},{\"business_line_id\":256,\"application_type\":\"RENEWAL\"},{\"business_line_id\":30,\"application_type\":\"RENEWAL\"},{\"business_line_id\":84,\"application_type\":\"RENEWAL\"},{\"business_line_id\":200,\"application_type\":\"RENEWAL\"},{\"business_line_id\":218,\"application_type\":\"RENEWAL\"},{\"business_line_id\":81,\"application_type\":\"RENEWAL\"},{\"business_line_id\":107,\"application_type\":\"RENEWAL\"},{\"business_line_id\":221,\"application_type\":\"RENEWAL\"},{\"business_line_id\":197,\"application_type\":\"RENEWAL\"},{\"business_line_id\":255,\"application_type\":\"RENEWAL\"},{\"business_line_id\":257,\"application_type\":\"RENEWAL\"},{\"business_line_id\":10,\"application_type\":\"RENEWAL\"},{\"business_line_id\":35,\"application_type\":\"RENEWAL\"},{\"business_line_id\":220,\"application_type\":\"RENEWAL\"},{\"business_line_id\":198,\"application_type\":\"RENEWAL\"},{\"business_line_id\":219,\"application_type\":\"RENEWAL\"},{\"business_line_id\":89,\"application_type\":\"RENEWAL\"},{\"business_line_id\":199,\"application_type\":\"RENEWAL\"},{\"business_line_id\":109,\"application_type\":\"RENEWAL\"},{\"business_line_id\":104,\"application_type\":\"RENEWAL\"},{\"business_line_id\":61,\"application_type\":\"RENEWAL\"},{\"business_line_id\":212,\"application_type\":\"RENEWAL\"},{\"business_line_id\":98,\"application_type\":\"RENEWAL\"},{\"business_line_id\":203,\"application_type\":\"RENEWAL\"},{\"business_line_id\":211,\"application_type\":\"RENEWAL\"},{\"business_line_id\":210,\"application_type\":\"RENEWAL\"},{\"business_line_id\":22,\"application_type\":\"RENEWAL\"},{\"business_line_id\":209,\"application_type\":\"RENEWAL\"},{\"business_line_id\":208,\"application_type\":\"RENEWAL\"},{\"business_line_id\":70,\"application_type\":\"RENEWAL\"},{\"business_line_id\":86,\"application_type\":\"RENEWAL\"},{\"business_line_id\":87,\"application_type\":\"RENEWAL\"},{\"business_line_id\":151,\"application_type\":\"RENEWAL\"},{\"business_line_id\":207,\"application_type\":\"RENEWAL\"},{\"business_line_id\":32,\"application_type\":\"RENEWAL\"},{\"business_line_id\":48,\"application_type\":\"RENEWAL\"},{\"business_line_id\":116,\"application_type\":\"RENEWAL\"},{\"business_line_id\":216,\"application_type\":\"RENEWAL\"},{\"business_line_id\":170,\"application_type\":\"RENEWAL\"},{\"business_line_id\":215,\"application_type\":\"RENEWAL\"},{\"business_line_id\":205,\"application_type\":\"RENEWAL\"},{\"business_line_id\":214,\"application_type\":\"RENEWAL\"},{\"business_line_id\":204,\"application_type\":\"RENEWAL\"},{\"business_line_id\":62,\"application_type\":\"RENEWAL\"},{\"business_line_id\":4,\"application_type\":\"RENEWAL\"},{\"business_line_id\":165,\"application_type\":\"RENEWAL\"},{\"business_line_id\":45,\"application_type\":\"RENEWAL\"},{\"business_line_id\":129,\"application_type\":\"RENEWAL\"},{\"business_line_id\":23,\"application_type\":\"RENEWAL\"},{\"business_line_id\":12,\"application_type\":\"RENEWAL\"},{\"business_line_id\":50,\"application_type\":\"RENEWAL\"},{\"business_line_id\":66,\"application_type\":\"RENEWAL\"},{\"business_line_id\":237,\"application_type\":\"RENEWAL\"},{\"business_line_id\":140,\"application_type\":\"RENEWAL\"},{\"business_line_id\":27,\"application_type\":\"RENEWAL\"},{\"business_line_id\":26,\"application_type\":\"RENEWAL\"},{\"business_line_id\":58,\"application_type\":\"RENEWAL\"},{\"business_line_id\":118,\"application_type\":\"RENEWAL\"},{\"business_line_id\":38,\"application_type\":\"RENEWAL\"},{\"business_line_id\":92,\"application_type\":\"RENEWAL\"},{\"business_line_id\":11,\"application_type\":\"RENEWAL\"},{\"business_line_id\":143,\"application_type\":\"RENEWAL\"},{\"business_line_id\":130,\"application_type\":\"RENEWAL\"},{\"business_line_id\":125,\"application_type\":\"RENEWAL\"},{\"business_line_id\":235,\"application_type\":\"RENEWAL\"},{\"business_line_id\":102,\"application_type\":\"RENEWAL\"},{\"business_line_id\":233,\"application_type\":\"RENEWAL\"},{\"business_line_id\":128,\"application_type\":\"RENEWAL\"},{\"business_line_id\":138,\"application_type\":\"RENEWAL\"},{\"business_line_id\":160,\"application_type\":\"RENEWAL\"},{\"business_line_id\":134,\"application_type\":\"RENEWAL\"},{\"business_line_id\":29,\"application_type\":\"RENEWAL\"},{\"business_line_id\":79,\"application_type\":\"RENEWAL\"},{\"business_line_id\":74,\"application_type\":\"RENEWAL\"},{\"business_line_id\":166,\"application_type\":\"RENEWAL\"},{\"business_line_id\":96,\"application_type\":\"RENEWAL\"},{\"business_line_id\":101,\"application_type\":\"RENEWAL\"},{\"business_line_id\":68,\"application_type\":\"RENEWAL\"},{\"business_line_id\":188,\"application_type\":\"RENEWAL\"},{\"business_line_id\":139,\"application_type\":\"RENEWAL\"},{\"business_line_id\":159,\"application_type\":\"RENEWAL\"},{\"business_line_id\":20,\"application_type\":\"RENEWAL\"},{\"business_line_id\":150,\"application_type\":\"RENEWAL\"},{\"business_line_id\":234,\"application_type\":\"RENEWAL\"},{\"business_line_id\":189,\"application_type\":\"RENEWAL\"},{\"business_line_id\":147,\"application_type\":\"RENEWAL\"},{\"business_line_id\":169,\"application_type\":\"RENEWAL\"},{\"business_line_id\":7,\"application_type\":\"RENEWAL\"},{\"business_line_id\":88,\"application_type\":\"RENEWAL\"},{\"business_line_id\":223,\"application_type\":\"RENEWAL\"},{\"business_line_id\":94,\"application_type\":\"RENEWAL\"},{\"business_line_id\":194,\"application_type\":\"RENEWAL\"},{\"business_line_id\":224,\"application_type\":\"RENEWAL\"},{\"business_line_id\":13,\"application_type\":\"RENEWAL\"},{\"business_line_id\":222,\"application_type\":\"RENEWAL\"},{\"business_line_id\":59,\"application_type\":\"RENEWAL\"},{\"business_line_id\":47,\"application_type\":\"RENEWAL\"},{\"business_line_id\":25,\"application_type\":\"RENEWAL\"},{\"business_line_id\":21,\"application_type\":\"RENEWAL\"},{\"business_line_id\":126,\"application_type\":\"RENEWAL\"},{\"business_line_id\":225,\"application_type\":\"RENEWAL\"},{\"business_line_id\":111,\"application_type\":\"RENEWAL\"},{\"business_line_id\":232,\"application_type\":\"RENEWAL\"},{\"business_line_id\":190,\"application_type\":\"RENEWAL\"},{\"business_line_id\":46,\"application_type\":\"RENEWAL\"},{\"business_line_id\":230,\"application_type\":\"RENEWAL\"},{\"business_line_id\":191,\"application_type\":\"RENEWAL\"},{\"business_line_id\":64,\"application_type\":\"RENEWAL\"},{\"business_line_id\":229,\"application_type\":\"RENEWAL\"},{\"business_line_id\":192,\"application_type\":\"RENEWAL\"},{\"business_line_id\":228,\"application_type\":\"RENEWAL\"},{\"business_line_id\":193,\"application_type\":\"RENEWAL\"},{\"business_line_id\":226,\"application_type\":\"RENEWAL\"},{\"business_line_id\":41,\"application_type\":\"RENEWAL\"},{\"business_line_id\":152,\"application_type\":\"RENEWAL\"},{\"business_line_id\":132,\"application_type\":\"RENEWAL\"}],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:33:44', '2021-10-08 05:33:44');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000067, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'requirements_1_6', 'REQUIREMENTS', 'REQUIREMENT_ITEMS', '{\"item_id\":6,\"item_avatar\":\"\",\"item_maintitle\":\"Barangay Business Clearance\",\"item_subtitle\":\"\",\"item_update_date\":\"February 11, 2020 &middot; 05:42 AM\"}', '{\"title\":\"Barangay Business Clearance\",\"desc\":\"\",\"validation_code_title\":\"O.R. No.\",\"is_for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"is_for_poblacion_only\":\"0\",\"classifications\":[{\"business_line_id\":128,\"application_type\":\"NEW\"},{\"business_line_id\":41,\"application_type\":\"NEW\"},{\"business_line_id\":225,\"application_type\":\"NEW\"},{\"business_line_id\":126,\"application_type\":\"NEW\"},{\"business_line_id\":169,\"application_type\":\"NEW\"},{\"business_line_id\":7,\"application_type\":\"NEW\"},{\"business_line_id\":223,\"application_type\":\"NEW\"},{\"business_line_id\":94,\"application_type\":\"NEW\"},{\"business_line_id\":224,\"application_type\":\"NEW\"},{\"business_line_id\":222,\"application_type\":\"NEW\"},{\"business_line_id\":47,\"application_type\":\"NEW\"},{\"business_line_id\":25,\"application_type\":\"NEW\"},{\"business_line_id\":132,\"application_type\":\"NEW\"},{\"business_line_id\":115,\"application_type\":\"NEW\"},{\"business_line_id\":107,\"application_type\":\"NEW\"},{\"business_line_id\":221,\"application_type\":\"NEW\"},{\"business_line_id\":255,\"application_type\":\"NEW\"},{\"business_line_id\":226,\"application_type\":\"NEW\"},{\"business_line_id\":138,\"application_type\":\"NEW\"},{\"business_line_id\":228,\"application_type\":\"NEW\"},{\"business_line_id\":27,\"application_type\":\"NEW\"},{\"business_line_id\":26,\"application_type\":\"NEW\"},{\"business_line_id\":118,\"application_type\":\"NEW\"},{\"business_line_id\":38,\"application_type\":\"NEW\"},{\"business_line_id\":11,\"application_type\":\"NEW\"},{\"business_line_id\":143,\"application_type\":\"NEW\"},{\"business_line_id\":125,\"application_type\":\"NEW\"},{\"business_line_id\":235,\"application_type\":\"NEW\"},{\"business_line_id\":233,\"application_type\":\"NEW\"},{\"business_line_id\":234,\"application_type\":\"NEW\"},{\"business_line_id\":111,\"application_type\":\"NEW\"},{\"business_line_id\":232,\"application_type\":\"NEW\"},{\"business_line_id\":46,\"application_type\":\"NEW\"},{\"business_line_id\":230,\"application_type\":\"NEW\"},{\"business_line_id\":64,\"application_type\":\"NEW\"},{\"business_line_id\":229,\"application_type\":\"NEW\"},{\"business_line_id\":257,\"application_type\":\"NEW\"},{\"business_line_id\":35,\"application_type\":\"NEW\"},{\"business_line_id\":62,\"application_type\":\"NEW\"},{\"business_line_id\":4,\"application_type\":\"NEW\"},{\"business_line_id\":45,\"application_type\":\"NEW\"},{\"business_line_id\":129,\"application_type\":\"NEW\"},{\"business_line_id\":12,\"application_type\":\"NEW\"},{\"business_line_id\":50,\"application_type\":\"NEW\"},{\"business_line_id\":116,\"application_type\":\"NEW\"},{\"business_line_id\":212,\"application_type\":\"NEW\"},{\"business_line_id\":98,\"application_type\":\"NEW\"},{\"business_line_id\":211,\"application_type\":\"NEW\"},{\"business_line_id\":210,\"application_type\":\"NEW\"},{\"business_line_id\":209,\"application_type\":\"NEW\"},{\"business_line_id\":208,\"application_type\":\"NEW\"},{\"business_line_id\":86,\"application_type\":\"NEW\"},{\"business_line_id\":87,\"application_type\":\"NEW\"},{\"business_line_id\":207,\"application_type\":\"NEW\"},{\"business_line_id\":214,\"application_type\":\"NEW\"},{\"business_line_id\":215,\"application_type\":\"NEW\"},{\"business_line_id\":216,\"application_type\":\"NEW\"},{\"business_line_id\":220,\"application_type\":\"NEW\"},{\"business_line_id\":219,\"application_type\":\"NEW\"},{\"business_line_id\":89,\"application_type\":\"NEW\"},{\"business_line_id\":109,\"application_type\":\"NEW\"},{\"business_line_id\":218,\"application_type\":\"NEW\"},{\"business_line_id\":53,\"application_type\":\"NEW\"},{\"business_line_id\":146,\"application_type\":\"NEW\"},{\"business_line_id\":5,\"application_type\":\"NEW\"},{\"business_line_id\":217,\"application_type\":\"NEW\"},{\"business_line_id\":44,\"application_type\":\"NEW\"},{\"business_line_id\":8,\"application_type\":\"NEW\"},{\"business_line_id\":77,\"application_type\":\"NEW\"},{\"business_line_id\":131,\"application_type\":\"NEW\"},{\"business_line_id\":30,\"application_type\":\"NEW\"},{\"business_line_id\":84,\"application_type\":\"NEW\"},{\"business_line_id\":61,\"application_type\":\"NEW\"},{\"business_line_id\":32,\"application_type\":\"NEW\"},{\"business_line_id\":150,\"application_type\":\"NEW\"},{\"business_line_id\":144,\"application_type\":\"NEW\"},{\"business_line_id\":57,\"application_type\":\"NEW\"},{\"business_line_id\":124,\"application_type\":\"NEW\"},{\"business_line_id\":105,\"application_type\":\"NEW\"},{\"business_line_id\":63,\"application_type\":\"NEW\"},{\"business_line_id\":43,\"application_type\":\"NEW\"},{\"business_line_id\":250,\"application_type\":\"NEW\"},{\"business_line_id\":123,\"application_type\":\"NEW\"},{\"business_line_id\":135,\"application_type\":\"NEW\"},{\"business_line_id\":141,\"application_type\":\"NEW\"},{\"business_line_id\":167,\"application_type\":\"NEW\"},{\"business_line_id\":69,\"application_type\":\"NEW\"},{\"business_line_id\":248,\"application_type\":\"NEW\"},{\"business_line_id\":163,\"application_type\":\"NEW\"},{\"business_line_id\":136,\"application_type\":\"NEW\"},{\"business_line_id\":247,\"application_type\":\"NEW\"},{\"business_line_id\":75,\"application_type\":\"NEW\"},{\"business_line_id\":71,\"application_type\":\"NEW\"},{\"business_line_id\":175,\"application_type\":\"NEW\"},{\"business_line_id\":251,\"application_type\":\"NEW\"},{\"business_line_id\":253,\"application_type\":\"NEW\"},{\"business_line_id\":3,\"application_type\":\"NEW\"},{\"business_line_id\":254,\"application_type\":\"NEW\"},{\"business_line_id\":90,\"application_type\":\"NEW\"},{\"business_line_id\":187,\"application_type\":\"NEW\"},{\"business_line_id\":82,\"application_type\":\"NEW\"},{\"business_line_id\":149,\"application_type\":\"NEW\"},{\"business_line_id\":156,\"application_type\":\"NEW\"},{\"business_line_id\":145,\"application_type\":\"NEW\"},{\"business_line_id\":78,\"application_type\":\"NEW\"},{\"business_line_id\":91,\"application_type\":\"NEW\"},{\"business_line_id\":80,\"application_type\":\"NEW\"},{\"business_line_id\":120,\"application_type\":\"NEW\"},{\"business_line_id\":40,\"application_type\":\"NEW\"},{\"business_line_id\":110,\"application_type\":\"NEW\"},{\"business_line_id\":24,\"application_type\":\"NEW\"},{\"business_line_id\":246,\"application_type\":\"NEW\"},{\"business_line_id\":161,\"application_type\":\"NEW\"},{\"business_line_id\":242,\"application_type\":\"NEW\"},{\"business_line_id\":52,\"application_type\":\"NEW\"},{\"business_line_id\":241,\"application_type\":\"NEW\"},{\"business_line_id\":148,\"application_type\":\"NEW\"},{\"business_line_id\":34,\"application_type\":\"NEW\"},{\"business_line_id\":239,\"application_type\":\"NEW\"},{\"business_line_id\":168,\"application_type\":\"NEW\"},{\"business_line_id\":238,\"application_type\":\"NEW\"},{\"business_line_id\":237,\"application_type\":\"NEW\"},{\"business_line_id\":134,\"application_type\":\"NEW\"},{\"business_line_id\":29,\"application_type\":\"NEW\"},{\"business_line_id\":74,\"application_type\":\"NEW\"},{\"business_line_id\":166,\"application_type\":\"NEW\"},{\"business_line_id\":101,\"application_type\":\"NEW\"},{\"business_line_id\":68,\"application_type\":\"NEW\"},{\"business_line_id\":139,\"application_type\":\"NEW\"},{\"business_line_id\":67,\"application_type\":\"NEW\"},{\"business_line_id\":17,\"application_type\":\"NEW\"},{\"business_line_id\":42,\"application_type\":\"NEW\"},{\"business_line_id\":119,\"application_type\":\"NEW\"},{\"business_line_id\":2,\"application_type\":\"NEW\"},{\"business_line_id\":122,\"application_type\":\"NEW\"},{\"business_line_id\":121,\"application_type\":\"NEW\"},{\"business_line_id\":127,\"application_type\":\"NEW\"},{\"business_line_id\":133,\"application_type\":\"NEW\"},{\"business_line_id\":245,\"application_type\":\"NEW\"},{\"business_line_id\":154,\"application_type\":\"NEW\"},{\"business_line_id\":113,\"application_type\":\"NEW\"},{\"business_line_id\":244,\"application_type\":\"NEW\"},{\"business_line_id\":60,\"application_type\":\"NEW\"},{\"business_line_id\":153,\"application_type\":\"NEW\"},{\"business_line_id\":117,\"application_type\":\"NEW\"},{\"business_line_id\":243,\"application_type\":\"NEW\"},{\"business_line_id\":31,\"application_type\":\"NEW\"},{\"business_line_id\":9,\"application_type\":\"NEW\"},{\"business_line_id\":159,\"application_type\":\"NEW\"},{\"business_line_id\":205,\"application_type\":\"NEW\"},{\"business_line_id\":104,\"application_type\":\"NEW\"},{\"business_line_id\":106,\"application_type\":\"NEW\"},{\"business_line_id\":147,\"application_type\":\"NEW\"},{\"business_line_id\":200,\"application_type\":\"NEW\"},{\"business_line_id\":137,\"application_type\":\"NEW\"},{\"business_line_id\":199,\"application_type\":\"NEW\"},{\"business_line_id\":56,\"application_type\":\"NEW\"},{\"business_line_id\":103,\"application_type\":\"NEW\"},{\"business_line_id\":198,\"application_type\":\"NEW\"},{\"business_line_id\":189,\"application_type\":\"NEW\"},{\"business_line_id\":157,\"application_type\":\"NEW\"},{\"business_line_id\":179,\"application_type\":\"NEW\"},{\"business_line_id\":58,\"application_type\":\"NEW\"},{\"business_line_id\":256,\"application_type\":\"NEW\"},{\"business_line_id\":92,\"application_type\":\"NEW\"},{\"business_line_id\":183,\"application_type\":\"NEW\"},{\"business_line_id\":202,\"application_type\":\"NEW\"},{\"business_line_id\":102,\"application_type\":\"NEW\"},{\"business_line_id\":178,\"application_type\":\"NEW\"},{\"business_line_id\":201,\"application_type\":\"NEW\"},{\"business_line_id\":130,\"application_type\":\"NEW\"},{\"business_line_id\":6,\"application_type\":\"NEW\"},{\"business_line_id\":10,\"application_type\":\"NEW\"},{\"business_line_id\":160,\"application_type\":\"NEW\"},{\"business_line_id\":16,\"application_type\":\"NEW\"},{\"business_line_id\":180,\"application_type\":\"NEW\"},{\"business_line_id\":194,\"application_type\":\"NEW\"},{\"business_line_id\":164,\"application_type\":\"NEW\"},{\"business_line_id\":182,\"application_type\":\"NEW\"},{\"business_line_id\":193,\"application_type\":\"NEW\"},{\"business_line_id\":88,\"application_type\":\"NEW\"},{\"business_line_id\":172,\"application_type\":\"NEW\"},{\"business_line_id\":140,\"application_type\":\"NEW\"},{\"business_line_id\":59,\"application_type\":\"NEW\"},{\"business_line_id\":192,\"application_type\":\"NEW\"},{\"business_line_id\":190,\"application_type\":\"NEW\"},{\"business_line_id\":197,\"application_type\":\"NEW\"},{\"business_line_id\":162,\"application_type\":\"NEW\"},{\"business_line_id\":99,\"application_type\":\"NEW\"},{\"business_line_id\":191,\"application_type\":\"NEW\"},{\"business_line_id\":51,\"application_type\":\"NEW\"},{\"business_line_id\":21,\"application_type\":\"NEW\"},{\"business_line_id\":83,\"application_type\":\"NEW\"},{\"business_line_id\":33,\"application_type\":\"NEW\"},{\"business_line_id\":152,\"application_type\":\"NEW\"},{\"business_line_id\":96,\"application_type\":\"NEW\"},{\"business_line_id\":79,\"application_type\":\"NEW\"},{\"business_line_id\":36,\"application_type\":\"NEW\"},{\"business_line_id\":23,\"application_type\":\"NEW\"},{\"business_line_id\":158,\"application_type\":\"NEW\"},{\"business_line_id\":13,\"application_type\":\"NEW\"},{\"business_line_id\":70,\"application_type\":\"NEW\"},{\"business_line_id\":188,\"application_type\":\"NEW\"},{\"business_line_id\":14,\"application_type\":\"NEW\"},{\"business_line_id\":114,\"application_type\":\"NEW\"},{\"business_line_id\":48,\"application_type\":\"NEW\"},{\"business_line_id\":81,\"application_type\":\"NEW\"},{\"business_line_id\":173,\"application_type\":\"NEW\"},{\"business_line_id\":203,\"application_type\":\"NEW\"},{\"business_line_id\":174,\"application_type\":\"NEW\"},{\"business_line_id\":186,\"application_type\":\"NEW\"},{\"business_line_id\":22,\"application_type\":\"NEW\"},{\"business_line_id\":151,\"application_type\":\"NEW\"},{\"business_line_id\":20,\"application_type\":\"NEW\"},{\"business_line_id\":184,\"application_type\":\"NEW\"},{\"business_line_id\":204,\"application_type\":\"NEW\"},{\"business_line_id\":185,\"application_type\":\"NEW\"},{\"business_line_id\":170,\"application_type\":\"NEW\"},{\"business_line_id\":177,\"application_type\":\"NEW\"},{\"business_line_id\":18,\"application_type\":\"NEW\"},{\"business_line_id\":1,\"application_type\":\"NEW\"},{\"business_line_id\":66,\"application_type\":\"NEW\"},{\"business_line_id\":165,\"application_type\":\"NEW\"},{\"business_line_id\":28,\"application_type\":\"NEW\"},{\"business_line_id\":49,\"application_type\":\"NEW\"},{\"business_line_id\":127,\"application_type\":\"RENEWAL\"},{\"business_line_id\":154,\"application_type\":\"RENEWAL\"},{\"business_line_id\":182,\"application_type\":\"RENEWAL\"},{\"business_line_id\":16,\"application_type\":\"RENEWAL\"},{\"business_line_id\":34,\"application_type\":\"RENEWAL\"},{\"business_line_id\":168,\"application_type\":\"RENEWAL\"},{\"business_line_id\":133,\"application_type\":\"RENEWAL\"},{\"business_line_id\":245,\"application_type\":\"RENEWAL\"},{\"business_line_id\":99,\"application_type\":\"RENEWAL\"},{\"business_line_id\":239,\"application_type\":\"RENEWAL\"},{\"business_line_id\":49,\"application_type\":\"RENEWAL\"},{\"business_line_id\":186,\"application_type\":\"RENEWAL\"},{\"business_line_id\":83,\"application_type\":\"RENEWAL\"},{\"business_line_id\":185,\"application_type\":\"RENEWAL\"},{\"business_line_id\":243,\"application_type\":\"RENEWAL\"},{\"business_line_id\":242,\"application_type\":\"RENEWAL\"},{\"business_line_id\":106,\"application_type\":\"RENEWAL\"},{\"business_line_id\":67,\"application_type\":\"RENEWAL\"},{\"business_line_id\":184,\"application_type\":\"RENEWAL\"},{\"business_line_id\":9,\"application_type\":\"RENEWAL\"},{\"business_line_id\":17,\"application_type\":\"RENEWAL\"},{\"business_line_id\":183,\"application_type\":\"RENEWAL\"},{\"business_line_id\":117,\"application_type\":\"RENEWAL\"},{\"business_line_id\":52,\"application_type\":\"RENEWAL\"},{\"business_line_id\":113,\"application_type\":\"RENEWAL\"},{\"business_line_id\":148,\"application_type\":\"RENEWAL\"},{\"business_line_id\":244,\"application_type\":\"RENEWAL\"},{\"business_line_id\":158,\"application_type\":\"RENEWAL\"},{\"business_line_id\":60,\"application_type\":\"RENEWAL\"},{\"business_line_id\":241,\"application_type\":\"RENEWAL\"},{\"business_line_id\":153,\"application_type\":\"RENEWAL\"},{\"business_line_id\":103,\"application_type\":\"RENEWAL\"},{\"business_line_id\":31,\"application_type\":\"RENEWAL\"},{\"business_line_id\":42,\"application_type\":\"RENEWAL\"},{\"business_line_id\":121,\"application_type\":\"RENEWAL\"},{\"business_line_id\":144,\"application_type\":\"RENEWAL\"},{\"business_line_id\":36,\"application_type\":\"RENEWAL\"},{\"business_line_id\":80,\"application_type\":\"RENEWAL\"},{\"business_line_id\":120,\"application_type\":\"RENEWAL\"},{\"business_line_id\":28,\"application_type\":\"RENEWAL\"},{\"business_line_id\":40,\"application_type\":\"RENEWAL\"},{\"business_line_id\":110,\"application_type\":\"RENEWAL\"},{\"business_line_id\":18,\"application_type\":\"RENEWAL\"},{\"business_line_id\":24,\"application_type\":\"RENEWAL\"},{\"business_line_id\":251,\"application_type\":\"RENEWAL\"},{\"business_line_id\":177,\"application_type\":\"RENEWAL\"},{\"business_line_id\":175,\"application_type\":\"RENEWAL\"},{\"business_line_id\":161,\"application_type\":\"RENEWAL\"},{\"business_line_id\":71,\"application_type\":\"RENEWAL\"},{\"business_line_id\":91,\"application_type\":\"RENEWAL\"},{\"business_line_id\":78,\"application_type\":\"RENEWAL\"},{\"business_line_id\":253,\"application_type\":\"RENEWAL\"},{\"business_line_id\":1,\"application_type\":\"RENEWAL\"},{\"business_line_id\":3,\"application_type\":\"RENEWAL\"},{\"business_line_id\":14,\"application_type\":\"RENEWAL\"},{\"business_line_id\":254,\"application_type\":\"RENEWAL\"},{\"business_line_id\":90,\"application_type\":\"RENEWAL\"},{\"business_line_id\":187,\"application_type\":\"RENEWAL\"},{\"business_line_id\":173,\"application_type\":\"RENEWAL\"},{\"business_line_id\":82,\"application_type\":\"RENEWAL\"},{\"business_line_id\":149,\"application_type\":\"RENEWAL\"},{\"business_line_id\":156,\"application_type\":\"RENEWAL\"},{\"business_line_id\":145,\"application_type\":\"RENEWAL\"},{\"business_line_id\":114,\"application_type\":\"RENEWAL\"},{\"business_line_id\":164,\"application_type\":\"RENEWAL\"},{\"business_line_id\":57,\"application_type\":\"RENEWAL\"},{\"business_line_id\":124,\"application_type\":\"RENEWAL\"},{\"business_line_id\":174,\"application_type\":\"RENEWAL\"},{\"business_line_id\":163,\"application_type\":\"RENEWAL\"},{\"business_line_id\":136,\"application_type\":\"RENEWAL\"},{\"business_line_id\":51,\"application_type\":\"RENEWAL\"},{\"business_line_id\":247,\"application_type\":\"RENEWAL\"},{\"business_line_id\":75,\"application_type\":\"RENEWAL\"},{\"business_line_id\":33,\"application_type\":\"RENEWAL\"},{\"business_line_id\":246,\"application_type\":\"RENEWAL\"},{\"business_line_id\":180,\"application_type\":\"RENEWAL\"},{\"business_line_id\":119,\"application_type\":\"RENEWAL\"},{\"business_line_id\":2,\"application_type\":\"RENEWAL\"},{\"business_line_id\":172,\"application_type\":\"RENEWAL\"},{\"business_line_id\":43,\"application_type\":\"RENEWAL\"},{\"business_line_id\":162,\"application_type\":\"RENEWAL\"},{\"business_line_id\":248,\"application_type\":\"RENEWAL\"},{\"business_line_id\":178,\"application_type\":\"RENEWAL\"},{\"business_line_id\":105,\"application_type\":\"RENEWAL\"},{\"business_line_id\":63,\"application_type\":\"RENEWAL\"},{\"business_line_id\":179,\"application_type\":\"RENEWAL\"},{\"business_line_id\":250,\"application_type\":\"RENEWAL\"},{\"business_line_id\":137,\"application_type\":\"RENEWAL\"},{\"business_line_id\":123,\"application_type\":\"RENEWAL\"},{\"business_line_id\":135,\"application_type\":\"RENEWAL\"},{\"business_line_id\":56,\"application_type\":\"RENEWAL\"},{\"business_line_id\":141,\"application_type\":\"RENEWAL\"},{\"business_line_id\":167,\"application_type\":\"RENEWAL\"},{\"business_line_id\":6,\"application_type\":\"RENEWAL\"},{\"business_line_id\":69,\"application_type\":\"RENEWAL\"},{\"business_line_id\":122,\"application_type\":\"RENEWAL\"},{\"business_line_id\":238,\"application_type\":\"RENEWAL\"},{\"business_line_id\":115,\"application_type\":\"RENEWAL\"},{\"business_line_id\":53,\"application_type\":\"RENEWAL\"},{\"business_line_id\":146,\"application_type\":\"RENEWAL\"},{\"business_line_id\":157,\"application_type\":\"RENEWAL\"},{\"business_line_id\":5,\"application_type\":\"RENEWAL\"},{\"business_line_id\":217,\"application_type\":\"RENEWAL\"},{\"business_line_id\":201,\"application_type\":\"RENEWAL\"},{\"business_line_id\":44,\"application_type\":\"RENEWAL\"},{\"business_line_id\":8,\"application_type\":\"RENEWAL\"},{\"business_line_id\":202,\"application_type\":\"RENEWAL\"},{\"business_line_id\":77,\"application_type\":\"RENEWAL\"},{\"business_line_id\":131,\"application_type\":\"RENEWAL\"},{\"business_line_id\":256,\"application_type\":\"RENEWAL\"},{\"business_line_id\":30,\"application_type\":\"RENEWAL\"},{\"business_line_id\":84,\"application_type\":\"RENEWAL\"},{\"business_line_id\":200,\"application_type\":\"RENEWAL\"},{\"business_line_id\":218,\"application_type\":\"RENEWAL\"},{\"business_line_id\":81,\"application_type\":\"RENEWAL\"},{\"business_line_id\":107,\"application_type\":\"RENEWAL\"},{\"business_line_id\":221,\"application_type\":\"RENEWAL\"},{\"business_line_id\":197,\"application_type\":\"RENEWAL\"},{\"business_line_id\":255,\"application_type\":\"RENEWAL\"},{\"business_line_id\":257,\"application_type\":\"RENEWAL\"},{\"business_line_id\":10,\"application_type\":\"RENEWAL\"},{\"business_line_id\":35,\"application_type\":\"RENEWAL\"},{\"business_line_id\":220,\"application_type\":\"RENEWAL\"},{\"business_line_id\":198,\"application_type\":\"RENEWAL\"},{\"business_line_id\":219,\"application_type\":\"RENEWAL\"},{\"business_line_id\":89,\"application_type\":\"RENEWAL\"},{\"business_line_id\":199,\"application_type\":\"RENEWAL\"},{\"business_line_id\":109,\"application_type\":\"RENEWAL\"},{\"business_line_id\":104,\"application_type\":\"RENEWAL\"},{\"business_line_id\":61,\"application_type\":\"RENEWAL\"},{\"business_line_id\":212,\"application_type\":\"RENEWAL\"},{\"business_line_id\":98,\"application_type\":\"RENEWAL\"},{\"business_line_id\":203,\"application_type\":\"RENEWAL\"},{\"business_line_id\":211,\"application_type\":\"RENEWAL\"},{\"business_line_id\":210,\"application_type\":\"RENEWAL\"},{\"business_line_id\":22,\"application_type\":\"RENEWAL\"},{\"business_line_id\":209,\"application_type\":\"RENEWAL\"},{\"business_line_id\":208,\"application_type\":\"RENEWAL\"},{\"business_line_id\":70,\"application_type\":\"RENEWAL\"},{\"business_line_id\":86,\"application_type\":\"RENEWAL\"},{\"business_line_id\":87,\"application_type\":\"RENEWAL\"},{\"business_line_id\":151,\"application_type\":\"RENEWAL\"},{\"business_line_id\":207,\"application_type\":\"RENEWAL\"},{\"business_line_id\":32,\"application_type\":\"RENEWAL\"},{\"business_line_id\":48,\"application_type\":\"RENEWAL\"},{\"business_line_id\":116,\"application_type\":\"RENEWAL\"},{\"business_line_id\":216,\"application_type\":\"RENEWAL\"},{\"business_line_id\":170,\"application_type\":\"RENEWAL\"},{\"business_line_id\":215,\"application_type\":\"RENEWAL\"},{\"business_line_id\":205,\"application_type\":\"RENEWAL\"},{\"business_line_id\":214,\"application_type\":\"RENEWAL\"},{\"business_line_id\":204,\"application_type\":\"RENEWAL\"},{\"business_line_id\":62,\"application_type\":\"RENEWAL\"},{\"business_line_id\":4,\"application_type\":\"RENEWAL\"},{\"business_line_id\":165,\"application_type\":\"RENEWAL\"},{\"business_line_id\":45,\"application_type\":\"RENEWAL\"},{\"business_line_id\":129,\"application_type\":\"RENEWAL\"},{\"business_line_id\":23,\"application_type\":\"RENEWAL\"},{\"business_line_id\":12,\"application_type\":\"RENEWAL\"},{\"business_line_id\":50,\"application_type\":\"RENEWAL\"},{\"business_line_id\":66,\"application_type\":\"RENEWAL\"},{\"business_line_id\":237,\"application_type\":\"RENEWAL\"},{\"business_line_id\":140,\"application_type\":\"RENEWAL\"},{\"business_line_id\":27,\"application_type\":\"RENEWAL\"},{\"business_line_id\":26,\"application_type\":\"RENEWAL\"},{\"business_line_id\":58,\"application_type\":\"RENEWAL\"},{\"business_line_id\":118,\"application_type\":\"RENEWAL\"},{\"business_line_id\":38,\"application_type\":\"RENEWAL\"},{\"business_line_id\":92,\"application_type\":\"RENEWAL\"},{\"business_line_id\":11,\"application_type\":\"RENEWAL\"},{\"business_line_id\":143,\"application_type\":\"RENEWAL\"},{\"business_line_id\":130,\"application_type\":\"RENEWAL\"},{\"business_line_id\":125,\"application_type\":\"RENEWAL\"},{\"business_line_id\":235,\"application_type\":\"RENEWAL\"},{\"business_line_id\":102,\"application_type\":\"RENEWAL\"},{\"business_line_id\":233,\"application_type\":\"RENEWAL\"},{\"business_line_id\":128,\"application_type\":\"RENEWAL\"},{\"business_line_id\":138,\"application_type\":\"RENEWAL\"},{\"business_line_id\":160,\"application_type\":\"RENEWAL\"},{\"business_line_id\":134,\"application_type\":\"RENEWAL\"},{\"business_line_id\":29,\"application_type\":\"RENEWAL\"},{\"business_line_id\":79,\"application_type\":\"RENEWAL\"},{\"business_line_id\":74,\"application_type\":\"RENEWAL\"},{\"business_line_id\":166,\"application_type\":\"RENEWAL\"},{\"business_line_id\":96,\"application_type\":\"RENEWAL\"},{\"business_line_id\":101,\"application_type\":\"RENEWAL\"},{\"business_line_id\":68,\"application_type\":\"RENEWAL\"},{\"business_line_id\":188,\"application_type\":\"RENEWAL\"},{\"business_line_id\":139,\"application_type\":\"RENEWAL\"},{\"business_line_id\":159,\"application_type\":\"RENEWAL\"},{\"business_line_id\":20,\"application_type\":\"RENEWAL\"},{\"business_line_id\":150,\"application_type\":\"RENEWAL\"},{\"business_line_id\":234,\"application_type\":\"RENEWAL\"},{\"business_line_id\":189,\"application_type\":\"RENEWAL\"},{\"business_line_id\":147,\"application_type\":\"RENEWAL\"},{\"business_line_id\":169,\"application_type\":\"RENEWAL\"},{\"business_line_id\":7,\"application_type\":\"RENEWAL\"},{\"business_line_id\":88,\"application_type\":\"RENEWAL\"},{\"business_line_id\":223,\"application_type\":\"RENEWAL\"},{\"business_line_id\":94,\"application_type\":\"RENEWAL\"},{\"business_line_id\":194,\"application_type\":\"RENEWAL\"},{\"business_line_id\":224,\"application_type\":\"RENEWAL\"},{\"business_line_id\":13,\"application_type\":\"RENEWAL\"},{\"business_line_id\":222,\"application_type\":\"RENEWAL\"},{\"business_line_id\":59,\"application_type\":\"RENEWAL\"},{\"business_line_id\":47,\"application_type\":\"RENEWAL\"},{\"business_line_id\":25,\"application_type\":\"RENEWAL\"},{\"business_line_id\":21,\"application_type\":\"RENEWAL\"},{\"business_line_id\":126,\"application_type\":\"RENEWAL\"},{\"business_line_id\":225,\"application_type\":\"RENEWAL\"},{\"business_line_id\":111,\"application_type\":\"RENEWAL\"},{\"business_line_id\":232,\"application_type\":\"RENEWAL\"},{\"business_line_id\":190,\"application_type\":\"RENEWAL\"},{\"business_line_id\":46,\"application_type\":\"RENEWAL\"},{\"business_line_id\":230,\"application_type\":\"RENEWAL\"},{\"business_line_id\":191,\"application_type\":\"RENEWAL\"},{\"business_line_id\":64,\"application_type\":\"RENEWAL\"},{\"business_line_id\":229,\"application_type\":\"RENEWAL\"},{\"business_line_id\":192,\"application_type\":\"RENEWAL\"},{\"business_line_id\":228,\"application_type\":\"RENEWAL\"},{\"business_line_id\":193,\"application_type\":\"RENEWAL\"},{\"business_line_id\":226,\"application_type\":\"RENEWAL\"},{\"business_line_id\":41,\"application_type\":\"RENEWAL\"},{\"business_line_id\":152,\"application_type\":\"RENEWAL\"},{\"business_line_id\":132,\"application_type\":\"RENEWAL\"}],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}]}', '2021-10-08 05:34:10', '2021-10-08 05:34:10');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000068, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'fees_1_16', 'FEES', 'FEE_ITEMS', '{\"item_id\":16,\"item_avatar\":\"\",\"item_maintitle\":\"Mayor\'s Permit Fee\",\"item_subtitle\":\"\",\"item_update_date\":\"February 20, 2020 &middot; 01:15 AM\"}', '{\"title\":\"Mayor\'s Permit Fee\",\"desc\":\"\",\"is_multiple_collection\":\"1\",\"is_for_poblacion_only\":\"0\",\"classifications\":[{\"business_line_id\":243,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":61,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":154,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":215,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":245,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":214,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":62,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":133,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":4,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":45,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":127,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":129,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":12,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":121,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":50,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":84,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":113,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":218,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":53,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":117,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":146,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":5,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":153,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":217,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":44,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":60,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":8,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":77,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":244,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":131,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":30,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":116,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":122,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":205,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":66,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":247,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":151,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":70,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":136,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":22,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":203,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":163,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":48,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":14,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":23,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":1,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":165,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":75,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":32,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":212,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":98,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":2,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":211,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":210,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":119,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":209,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":208,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":161,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":86,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":87,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":246,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":207,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":228,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":204,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":150,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":29,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":111,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":232,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":134,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":46,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":230,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":237,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":64,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":229,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":238,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":138,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":168,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":226,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":41,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":234,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":233,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":128,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":139,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":27,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":26,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":68,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":118,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":38,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":101,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":11,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":143,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":166,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":125,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":235,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":74,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":239,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":225,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":67,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":115,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":107,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":17,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":221,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":159,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":255,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":42,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":257,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":9,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":220,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":219,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":31,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":89,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":132,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":25,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":126,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":34,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":169,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":7,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":148,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":223,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":94,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":241,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":224,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":13,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":52,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":222,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":47,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":242,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":109,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":190,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":140,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":251,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":20,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":179,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":188,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":24,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":96,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":137,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":79,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":110,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":160,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":90,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":178,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":57,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":189,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":177,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":254,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":102,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":71,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":164,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":130,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":92,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":175,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":58,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":187,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":56,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":49,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":103,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":162,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":51,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":78,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":83,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":149,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":182,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":33,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":145,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":16,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":172,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":91,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":106,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":40,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":186,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":180,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":158,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":120,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":185,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":6,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":184,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":80,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":183,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":82,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":156,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":248,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":173,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":216,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":135,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":99,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":198,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":123,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":10,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":144,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":174,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":197,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":250,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":200,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":141,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":170,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":199,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":104,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":69,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":256,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":88,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":202,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":167,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":201,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":35,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":157,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":81,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":21,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":114,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":3,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":147,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":36,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":152,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":124,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":192,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":105,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":193,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":28,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":63,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":191,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":194,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":253,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":18,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":59,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":43,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":254,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":246,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":17,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":239,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":34,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":74,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":159,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":156,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":166,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":149,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":144,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":237,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":187,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":253,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":134,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":101,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":238,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":82,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":3,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":90,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":29,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":139,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":168,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":68,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":1,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":122,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":63,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":121,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":127,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":105,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":133,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":124,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":245,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":57,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":154,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":43,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":2,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":250,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":248,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":163,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":69,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":136,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":167,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":247,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":75,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":123,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":161,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":119,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":141,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":113,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":71,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":120,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":80,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":67,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":242,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":91,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":31,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":52,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":78,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":241,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":145,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":42,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":40,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":9,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":244,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":175,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":60,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":153,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":251,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":117,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":24,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":243,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":110,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":135,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":148,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":32,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":198,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":10,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":197,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":81,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":21,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":59,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":194,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":147,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":152,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":193,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":192,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":191,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":190,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":189,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":102,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":130,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":14,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":199,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":200,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":205,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":66,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":151,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":70,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":22,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":203,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":48,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":23,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":165,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":204,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":170,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":104,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":256,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":202,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":201,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":157,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":92,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":58,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":140,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":33,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":51,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":162,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":6,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":56,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":137,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":179,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":178,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":164,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":177,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":18,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":28,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":36,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":114,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":174,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":173,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":180,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":172,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":16,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":20,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":188,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":96,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":79,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":160,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":49,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":186,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":158,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":185,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":184,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":183,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":106,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":103,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":99,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":83,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":182,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":88,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":150,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":226,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":41,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":225,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":126,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":169,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":7,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":223,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":94,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":224,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":13,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":222,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":47,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":25,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":132,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":115,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":107,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":138,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":228,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":229,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":128,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":27,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":26,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":118,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":38,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":11,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":143,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":125,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":235,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":233,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":234,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":111,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":232,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":46,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":230,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":64,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":221,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":255,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":257,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":214,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":62,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":4,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":45,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":129,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":12,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":50,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":116,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":212,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":98,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":211,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":210,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":209,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":208,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":86,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":87,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":215,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":216,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":61,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":35,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":220,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":219,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":89,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":109,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":218,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":53,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":146,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":5,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":217,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":44,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":8,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":77,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":131,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":30,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":84,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]},{\"business_line_id\":207,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"100\",\"business_size_fees\":[]}],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}],\"business_sizes\":[{\"id\":6,\"title\":\"LARGE SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":60000000,\"asset_limit_to\":-1,\"total_workers_from\":200,\"total_workers_to\":-1,\"date_created\":\"June 22, 2019 &middot; 11:23 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:24 AM\"},{\"id\":5,\"title\":\"MEDIUM SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":15000000,\"asset_limit_to\":60000000,\"total_workers_from\":100,\"total_workers_to\":199,\"date_created\":\"June 22, 2019 &middot; 11:22 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:23 AM\"},{\"id\":4,\"title\":\"SMALL SCALE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":1500000,\"asset_limit_to\":15000000,\"total_workers_from\":10,\"total_workers_to\":99,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:22 AM\"},{\"id\":3,\"title\":\"COTTAGE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":150000,\"asset_limit_to\":1500000,\"total_workers_from\":0,\"total_workers_to\":9,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:29 AM\"},{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"}],\"fee_variables\":[{\"id\":1,\"title\":\"NOT APPLICABLE\"},{\"id\":2,\"title\":\"FIXED AMOUNT\"},{\"id\":3,\"title\":\"PER BUSINESS SIZE\"},{\"id\":4,\"title\":\"Total Employees &times;\"},{\"id\":5,\"title\":\"Business Area &times;\"}]}', '2021-10-08 05:36:17', '2021-10-08 05:36:17');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000069, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_2_3', 'NEW BUSINESS', '[NEW]_VERIFICATIONS', '{\"item_id\":3,\"item_avatar\":\"female-02.JPG\",\"item_maintitle\":\"AGUILAR BAKERY\",\"item_subtitle\":\"HELENA L. AGUILAR\",\"item_update_date\":\"October 8, 2021 &middot; 01:30 PM\"}', '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":9,\"citizen_avatar\":\"female-02.JPG\",\"citizen_full_name\":\"HELENA L. AGUILAR\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"AGUILAR BAKERY\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"123456\",\"dti_date\":\"August 6, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 2, Itangon, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":3,\"total_male_emp_lgu\":3,\"total_female_emp\":3,\"total_female_emp_lgu\":3,\"total_employees\":6,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":4,\"business_line_id\":56,\"business_line_title\":\"Bakeshop\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":50000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:30 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:30 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:30:55\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Bakeshop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01.jpg\",\"validation_code\":\"1267\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02.jpg\",\"validation_code\":\"5623\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', '2021-10-08 05:39:49', '2021-10-08 05:39:49'),
(0000000070, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_2_3', 'NEW BUSINESS', '[NEW]_PAYMENT_INVOICES', '{\"item_id\":3,\"item_avatar\":\"female-02.JPG\",\"item_maintitle\":\"AGUILAR BAKERY\",\"item_subtitle\":\"HELENA L. AGUILAR\",\"item_update_date\":\"October 8, 2021 &middot; 01:39 PM\"}', '{\"verification\":{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":9,\"citizen_avatar\":\"female-02.JPG\",\"citizen_full_name\":\"HELENA L. AGUILAR\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"AGUILAR BAKERY\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"123456\",\"dti_date\":\"August 6, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 2, Itangon, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":3,\"total_male_emp_lgu\":3,\"total_female_emp\":3,\"total_female_emp_lgu\":3,\"total_employees\":6,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":4,\"business_line_id\":56,\"business_line_title\":\"Bakeshop\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":50000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:30 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:30 PM\",\"fees_payment_invoice_id\":\"0000006762\",\"tax_payment_invoice_id\":[\"0000000000\"]},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:30:55\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Bakeshop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01.jpg\",\"validation_code\":\"1267\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02.jpg\",\"validation_code\":\"5623\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]},\"fees_payment_invoice\":{\"id\":\"0000006762\",\"citizen\":{\"fullname\":\"HELENA L. AGUILAR\",\"avatar\":\"female-02.JPG\",\"address1\":\"Zone 2, Itangon\",\"address2\":\"Bula, Camarines Sur\",\"tin\":\"000-000-000\"},\"invoice_date\":\"October 8, 2021 &middot; 01:39 PM\",\"amount\":\"595.00\",\"is_cancelled\":\"0\",\"is_quarterly\":null,\"status\":\"<span class=\\\"text-danger\\\">UNPAID<\\/span>\",\"or_no\":\"\",\"or_char\":\"\",\"amount_tendered\":0,\"penalty\":0,\"change\":0,\"amount_without_penalty\":0,\"amount_with_penalty\":0,\"or_date\":\"\",\"invoice_summary\":[{\"other_fee\":\"Business Plate Fee\",\"amount\":\"350.00\"},{\"other_fee\":\"Mayor\'s Permit Fee (Bakeshop)\",\"amount\":\"100.00\"},{\"other_fee\":\"Sanitary Fee\",\"amount\":\"70.00\"},{\"other_fee\":\"Sticker Fee\",\"amount\":\"75.00\"}],\"related_or\":[],\"total_penalty\":0,\"total_amount_without_penalty\":0,\"total_amount_with_penalty\":0},\"tax_payment_invoice\":{\"payment_mode\":\"ANNUALLY\",\"payment_invoices\":[[]],\"business_tax_balance_without_penalty\":0,\"status_code\":1,\"status_text\":\"<span class=\'text-success\'>FULLY PAID<\\/span>\"}}', '2021-10-08 05:39:58', '2021-10-08 05:39:58'),
(0000000071, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_3_3', 'NEW BUSINESS', '[NEW]_BUSINESS_PERMITS', '{\"item_id\":3,\"item_avatar\":\"female-02.JPG\",\"item_maintitle\":\"AGUILAR BAKERY\",\"item_subtitle\":\"HELENA L. AGUILAR\",\"item_update_date\":\"October 8, 2021 &middot; 01:42 PM\"}', '{\"permit_no\":\"AAI0001\",\"plate_no\":\"AAI0001\",\"permit_file\":\"2021.php\",\"created_at\":\"October 8, 2021 &middot; 01:42 PM\",\"invoice\":{\"verification\":{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":9,\"citizen_avatar\":\"female-02.JPG\",\"citizen_full_name\":\"HELENA L. AGUILAR\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"AGUILAR BAKERY\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"123456\",\"dti_date\":\"August 6, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 2, Itangon, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":3,\"total_male_emp_lgu\":3,\"total_female_emp\":3,\"total_female_emp_lgu\":3,\"total_employees\":6,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":4,\"business_line_id\":56,\"business_line_title\":\"Bakeshop\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":50000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:30 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:39 PM\",\"fees_payment_invoice_id\":\"0000006762\",\"tax_payment_invoice_id\":[\"0000000000\"]},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:30:55\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Bakeshop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01.jpg\",\"validation_code\":\"1267\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02.jpg\",\"validation_code\":\"5623\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-03.jpg\",\"validation_code\":\"7893\",\"is_verified\":1}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-04.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}}]},\"fees_payment_invoice\":{\"id\":\"0000006762\",\"citizen\":{\"fullname\":\"HELENA L. AGUILAR\",\"avatar\":\"female-02.JPG\",\"address1\":\"Zone 2, Itangon\",\"address2\":\"Bula, Camarines Sur\",\"tin\":\"000-000-000\"},\"invoice_date\":\"October 8, 2021 &middot; 01:39 PM\",\"amount\":\"595.00\",\"is_cancelled\":\"0\",\"is_quarterly\":null,\"status\":\"<span class=\\\"text-success\\\">PAID<\\/span>\",\"or_no\":\"8956\",\"or_char\":\"A\",\"amount_tendered\":\"595.00\",\"penalty\":\"0.00\",\"change\":\"0.00\",\"amount_without_penalty\":595,\"amount_with_penalty\":595,\"or_date\":\"October 8, 2021 &middot; 07:41 AM\",\"invoice_summary\":[{\"other_fee\":\"Business Plate Fee\",\"amount\":\"350.00\"},{\"other_fee\":\"Mayor\'s Permit Fee (Bakeshop)\",\"amount\":\"100.00\"},{\"other_fee\":\"Sanitary Fee\",\"amount\":\"70.00\"},{\"other_fee\":\"Sticker Fee\",\"amount\":\"75.00\"}],\"related_or\":[],\"total_penalty\":0,\"total_amount_without_penalty\":595,\"total_amount_with_penalty\":595},\"tax_payment_invoice\":{\"payment_mode\":\"ANNUALLY\",\"payment_invoices\":[[]],\"business_tax_balance_without_penalty\":0,\"status_code\":1,\"status_text\":\"<span class=\'text-success\'>FULLY PAID<\\/span>\"}}}', '2021-10-08 05:42:26', '2021-10-08 05:42:26'),
(0000000072, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_1', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":4,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:43 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":0,\"citizen_avatar\":\"_.jpg\",\"citizen_full_name\":\"[NO CITIZEN]\",\"citizen_gender\":\"\",\"citizen_tin\":\"\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"[business_name]\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"\",\"barangay_id\":0,\"barangay_address\":\"[barangay], [municipality \\/ city], [province]\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"\",\"home_contact_num\":\"\",\"emergency_person\":\"\",\"emergency_contact_num\":\"\",\"total_male_emp\":0,\"total_male_emp_lgu\":0,\"total_female_emp\":0,\"total_female_emp_lgu\":0,\"total_employees\":0,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":5,\"business_line_id\":173,\"business_line_title\":\"Accessories\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":0,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:43 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:43 PM\"}', '2021-10-08 05:43:35', '2021-10-08 05:43:35'),
(0000000073, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_1_4', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":4,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:43 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":6,\"citizen_avatar\":\"male-04.JPG\",\"citizen_full_name\":\"ROANO L. BARERRA\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BARERRA BARBERS\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 2\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 4, Causip, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":6,\"business_line_id\":51,\"business_line_title\":\"Barber Shop\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":100000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:43 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:43 PM\"}', '2021-10-08 05:45:29', '2021-10-08 05:45:29'),
(0000000074, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_1_4', 'NEW BUSINESS', '[NEW]_VERIFICATIONS', '{\"item_id\":4,\"item_avatar\":\"male-04.JPG\",\"item_maintitle\":\"BARERRA BARBERS\",\"item_subtitle\":\"ROANO L. BARERRA\",\"item_update_date\":\"October 8, 2021 &middot; 01:45 PM\"}', '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":6,\"citizen_avatar\":\"male-04.JPG\",\"citizen_full_name\":\"ROANO L. BARERRA\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BARERRA BARBERS\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 2\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 4, Causip, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":6,\"business_line_id\":51,\"business_line_title\":\"Barber Shop\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":100000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:45 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:45 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":\"\",\"remarks\":\"\",\"date_updated\":0}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Barber Shop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', '2021-10-08 05:45:33', '2021-10-08 05:45:33'),
(0000000075, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_2_4', 'NEW BUSINESS', '[NEW]_VERIFICATIONS', '{\"item_id\":4,\"item_avatar\":\"male-04.JPG\",\"item_maintitle\":\"BARERRA BARBERS\",\"item_subtitle\":\"ROANO L. BARERRA\",\"item_update_date\":\"October 8, 2021 &middot; 01:45 PM\"}', '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":6,\"citizen_avatar\":\"male-04.JPG\",\"citizen_full_name\":\"ROANO L. BARERRA\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BARERRA BARBERS\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 2\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 4, Causip, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":6,\"business_line_id\":51,\"business_line_title\":\"Barber Shop\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":100000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:45 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:45 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":0,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:46:01\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Barber Shop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_1.jpg\",\"validation_code\":\"1765\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_1.jpg\",\"validation_code\":\"7834\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', '2021-10-08 05:46:01', '2021-10-08 05:46:01'),
(0000000076, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_2_4', 'NEW BUSINESS', '[NEW]_VERIFICATIONS', '{\"item_id\":4,\"item_avatar\":\"male-04.JPG\",\"item_maintitle\":\"BARERRA BARBERS\",\"item_subtitle\":\"ROANO L. BARERRA\",\"item_update_date\":\"October 8, 2021 &middot; 01:45 PM\"}', '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":6,\"citizen_avatar\":\"male-04.JPG\",\"citizen_full_name\":\"ROANO L. BARERRA\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BARERRA BARBERS\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 2\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 4, Causip, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":6,\"business_line_id\":51,\"business_line_title\":\"Barber Shop\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":100000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:45 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:45 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:46:11\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Barber Shop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_1.jpg\",\"validation_code\":\"1765\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_1.jpg\",\"validation_code\":\"7834\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', '2021-10-08 05:46:11', '2021-10-08 05:46:11'),
(0000000077, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_2_4', 'NEW BUSINESS', '[NEW]_PAYMENT_INVOICES', '{\"item_id\":4,\"item_avatar\":\"male-04.JPG\",\"item_maintitle\":\"BARERRA BARBERS\",\"item_subtitle\":\"ROANO L. BARERRA\",\"item_update_date\":\"October 8, 2021 &middot; 01:46 PM\"}', '{\"verification\":{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":6,\"citizen_avatar\":\"male-04.JPG\",\"citizen_full_name\":\"ROANO L. BARERRA\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BARERRA BARBERS\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 2\",\"barangay_id\":8172,\"barangay_address\":\"Palsong, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 4, Causip, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":64,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":6,\"business_line_id\":51,\"business_line_title\":\"Barber Shop\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":100000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:45 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:45 PM\",\"fees_payment_invoice_id\":\"0000006763\",\"tax_payment_invoice_id\":[\"0000000000\"]},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":1,\"remarks\":\"\",\"date_updated\":\"2021-10-08 13:46:11\"}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Business Plate Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":350},{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Barber Shop)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":595},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_1.jpg\",\"validation_code\":\"1765\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_1.jpg\",\"validation_code\":\"7834\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]},\"fees_payment_invoice\":{\"id\":\"0000006763\",\"citizen\":{\"fullname\":\"ROANO L. BARERRA\",\"avatar\":\"male-04.JPG\",\"address1\":\"Zone 4, Causip\",\"address2\":\"Bula, Camarines Sur\",\"tin\":\"000-000-000\"},\"invoice_date\":\"October 8, 2021 &middot; 01:46 PM\",\"amount\":\"595.00\",\"is_cancelled\":\"0\",\"is_quarterly\":null,\"status\":\"<span class=\\\"text-danger\\\">UNPAID<\\/span>\",\"or_no\":\"\",\"or_char\":\"\",\"amount_tendered\":0,\"penalty\":0,\"change\":0,\"amount_without_penalty\":0,\"amount_with_penalty\":0,\"or_date\":\"\",\"invoice_summary\":[{\"other_fee\":\"Business Plate Fee\",\"amount\":\"350.00\"},{\"other_fee\":\"Mayor\'s Permit Fee (Barber Shop)\",\"amount\":\"100.00\"},{\"other_fee\":\"Sanitary Fee\",\"amount\":\"70.00\"},{\"other_fee\":\"Sticker Fee\",\"amount\":\"75.00\"}],\"related_or\":[],\"total_penalty\":0,\"total_amount_without_penalty\":0,\"total_amount_with_penalty\":0},\"tax_payment_invoice\":{\"payment_mode\":\"ANNUALLY\",\"payment_invoices\":[[]],\"business_tax_balance_without_penalty\":0,\"status_code\":1,\"status_text\":\"<span class=\'text-success\'>FULLY PAID<\\/span>\"}}', '2021-10-08 05:46:13', '2021-10-08 05:46:13');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000078, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_1', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":5,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:46 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":0,\"citizen_avatar\":\"_.jpg\",\"citizen_full_name\":\"[NO CITIZEN]\",\"citizen_gender\":\"\",\"citizen_tin\":\"\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"[business_name]\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"\",\"barangay_id\":0,\"barangay_address\":\"[barangay], [municipality \\/ city], [province]\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"\",\"home_contact_num\":\"\",\"emergency_person\":\"\",\"emergency_contact_num\":\"\",\"total_male_emp\":0,\"total_male_emp_lgu\":0,\"total_female_emp\":0,\"total_female_emp_lgu\":0,\"total_employees\":0,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":7,\"business_line_id\":173,\"business_line_title\":\"Accessories\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":0,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:46 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:46 PM\"}', '2021-10-08 05:46:24', '2021-10-08 05:46:24'),
(0000000079, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_1_5', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":5,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:46 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":10,\"citizen_avatar\":\"female-03.JPG\",\"citizen_full_name\":\"CAMRYN H. PEREZ\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"[business_name]\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8174,\"barangay_address\":\"Pawili, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Kinalabasahan, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":20,\"total_male_emp_lgu\":20,\"total_female_emp\":20,\"total_female_emp_lgu\":20,\"total_employees\":40,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":8,\"business_line_id\":177,\"business_line_title\":\"Appliances Center\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":500000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"PER NUMBER OF UNITS\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:46 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:46 PM\"}', '2021-10-08 05:47:14', '2021-10-08 05:47:14'),
(0000000080, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'newbusiness_1_5', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":5,\"item_avatar\":\"female-03.JPG\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"CAMRYN H. PEREZ\",\"item_update_date\":\"October 8, 2021 &middot; 01:46 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":10,\"citizen_avatar\":\"female-03.JPG\",\"citizen_full_name\":\"CAMRYN H. PEREZ\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"PEREZ APPLIANCE\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8174,\"barangay_address\":\"Pawili, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Kinalabasahan, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":20,\"total_male_emp_lgu\":20,\"total_female_emp\":20,\"total_female_emp_lgu\":20,\"total_employees\":40,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":8,\"business_line_id\":177,\"business_line_title\":\"Appliances Center\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":500000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"PER NUMBER OF UNITS\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:46 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:46 PM\"}', '2021-10-08 05:47:31', '2021-10-08 05:47:31'),
(0000000081, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_1_5', 'NEW BUSINESS', '[NEW]_VERIFICATIONS', '{\"item_id\":5,\"item_avatar\":\"female-03.JPG\",\"item_maintitle\":\"PEREZ APPLIANCE\",\"item_subtitle\":\"CAMRYN H. PEREZ\",\"item_update_date\":\"October 8, 2021 &middot; 01:47 PM\"}', '{\"application\":{\"application_type\":\"NEW\",\"citizen_id\":10,\"citizen_avatar\":\"female-03.JPG\",\"citizen_full_name\":\"CAMRYN H. PEREZ\",\"citizen_gender\":\"Female\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"PEREZ APPLIANCE\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"Zone 1\",\"barangay_id\":8174,\"barangay_address\":\"Pawili, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Kinalabasahan, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":20,\"total_male_emp_lgu\":20,\"total_female_emp\":20,\"total_female_emp_lgu\":20,\"total_employees\":40,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":8,\"business_line_id\":177,\"business_line_title\":\"Appliances Center\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":500000,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"PER NUMBER OF UNITS\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:47 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:47 PM\"},\"business_size\":{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"},\"verifiers\":[{\"id\":4,\"fullname\":\"IGNAZIO D. MARQUEZ\",\"avatar\":\"male-02.JPG\",\"usertype_acronym\":\"BPLO\",\"usertype_title\":\"Business Permit and Licensing Officer\",\"is_logged_in\":\"1\",\"approval\":{\"is_approved\":\"\",\"remarks\":\"\",\"date_updated\":0}}],\"tax_penalty\":{\"percentage\":25,\"amount\":0,\"effectivity_start\":\"February 1\",\"effectivity_end\":\"December 31\",\"tax_with_penalty\":0},\"fees\":{\"fee_classifications\":[{\"fee\":\"Mayor\'s Permit Fee (Appliances Center)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":100},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', '2021-10-08 05:47:33', '2021-10-08 05:47:33'),
(0000000082, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'renewal_1', 'RENEWAL', '[REN]_APPLICATIONS', '{\"item_id\":6,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:48 PM\"}', '{\"application_type\":\"RENEWAL\",\"citizen_id\":0,\"citizen_avatar\":\"_.jpg\",\"citizen_full_name\":\"[NO CITIZEN]\",\"citizen_gender\":\"\",\"citizen_tin\":\"\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"[business_name]\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"\",\"barangay_id\":0,\"barangay_address\":\"[barangay], [municipality \\/ city], [province]\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"\",\"home_contact_num\":\"\",\"emergency_person\":\"\",\"emergency_contact_num\":\"\",\"total_male_emp\":0,\"total_male_emp_lgu\":0,\"total_female_emp\":0,\"total_female_emp_lgu\":0,\"total_employees\":0,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":9,\"business_line_id\":173,\"business_line_title\":\"Accessories\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":0,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"PER GROSS SALES (ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0<\\/span>  to <span class=\'sp-currency sp-amount\'>0<\\/span><br>Business Tax is <span class=\'sp-amount sp-currency\'>0<\\/span>.\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:48 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:48 PM\"}', '2021-10-08 05:48:14', '2021-10-08 05:48:14'),
(0000000083, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'renewal_1_6', 'RENEWAL', '[REN]_APPLICATIONS', '{\"item_id\":6,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:48 PM\"}', '{\"application_type\":\"RENEWAL\",\"citizen_id\":5,\"citizen_avatar\":\"male-03.JPG\",\"citizen_full_name\":\"GORDON D. BLANCO\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BLANCO EGG RETAIL\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"ZONE 1\",\"barangay_id\":8159,\"barangay_address\":\"Caorasan, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Casugad, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":10,\"business_line_id\":70,\"business_line_title\":\"Egg Retailer\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":0,\"gross_sales_essential\":50000,\"gross_sales_non_essential\":50000,\"gross_sales_combined\":100000,\"business_tax_formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0.01<\\/span>  to <span class=\'sp-currency sp-amount\'>400000<\\/span><br>Business Tax is <span class=\'sp-amount\'>2<\\/span>% of GROSS SALES (NON-ESSENTIAL).\",\"business_tax\":1000}],\"total_business_tax\":1000,\"total_asset\":100000,\"date_created\":\"October 8, 2021 &middot; 01:48 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:48 PM\"}', '2021-10-08 05:49:40', '2021-10-08 05:49:40'),
(0000000084, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'renewal_1_6', 'RENEWAL', '[REN]_VERIFICATIONS', '{\"item_id\":6,\"item_avatar\":\"male-03.JPG\",\"item_maintitle\":\"BLANCO EGG RETAIL\",\"item_subtitle\":\"GORDON D. BLANCO\",\"item_update_date\":\"October 8, 2021 &middot; 01:49 PM\"}', '{\"application\":{\"application_type\":\"RENEWAL\",\"citizen_id\":5,\"citizen_avatar\":\"male-03.JPG\",\"citizen_full_name\":\"GORDON D. BLANCO\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BLANCO EGG RETAIL\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"ZONE 1\",\"barangay_id\":8159,\"barangay_address\":\"Caorasan, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Casugad, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":10,\"business_line_id\":70,\"business_line_title\":\"Egg Retailer\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":0,\"gross_sales_essential\":50000,\"gross_sales_non_essential\":50000,\"gross_sales_combined\":100000,\"business_tax_formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0.01<\\/span>  to <span class=\'sp-currency sp-amount\'>400000<\\/span><br>Business Tax is <span class=\'sp-amount\'>2<\\/span>% of GROSS SALES (NON-ESSENTIAL).\",\"business_tax\":1000}],\"total_business_tax\":1000,\"total_asset\":100000,\"date_created\":\"October 8, 2021 &middot; 01:49 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:49 PM\"},\"business_size\":{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},\"verifiers\":[],\"tax_penalty\":{\"percentage\":25,\"amount\":250,\"effectivity_start\":\"January 21\",\"effectivity_end\":\"April 30\",\"tax_with_penalty\":1250},\"fees\":{\"fee_classifications\":[{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Egg Retailer)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":245},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', '2021-10-08 05:49:43', '2021-10-08 05:49:43'),
(0000000085, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'UPDATE', 'renewal_2_6', 'RENEWAL', '[REN]_VERIFICATIONS', '{\"item_id\":6,\"item_avatar\":\"male-03.JPG\",\"item_maintitle\":\"BLANCO EGG RETAIL\",\"item_subtitle\":\"GORDON D. BLANCO\",\"item_update_date\":\"October 8, 2021 &middot; 01:49 PM\"}', '{\"application\":{\"application_type\":\"RENEWAL\",\"citizen_id\":5,\"citizen_avatar\":\"male-03.JPG\",\"citizen_full_name\":\"GORDON D. BLANCO\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BLANCO EGG RETAIL\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"ZONE 1\",\"barangay_id\":8159,\"barangay_address\":\"Caorasan, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Casugad, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":10,\"business_line_id\":70,\"business_line_title\":\"Egg Retailer\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":0,\"gross_sales_essential\":50000,\"gross_sales_non_essential\":50000,\"gross_sales_combined\":100000,\"business_tax_formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0.01<\\/span>  to <span class=\'sp-currency sp-amount\'>400000<\\/span><br>Business Tax is <span class=\'sp-amount\'>2<\\/span>% of GROSS SALES (NON-ESSENTIAL).\",\"business_tax\":1000}],\"total_business_tax\":1000,\"total_asset\":100000,\"date_created\":\"October 8, 2021 &middot; 01:49 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:49 PM\"},\"business_size\":{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},\"verifiers\":[],\"tax_penalty\":{\"percentage\":25,\"amount\":250,\"effectivity_start\":\"January 21\",\"effectivity_end\":\"April 30\",\"tax_with_penalty\":1250},\"fees\":{\"fee_classifications\":[{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Egg Retailer)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":245},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_2.jpg\",\"validation_code\":\"5634\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_2.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]}', '2021-10-08 05:50:07', '2021-10-08 05:50:07'),
(0000000086, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'renewal_2_6', 'RENEWAL', '[REN]_PAYMENT_INVOICES', '{\"item_id\":6,\"item_avatar\":\"male-03.JPG\",\"item_maintitle\":\"BLANCO EGG RETAIL\",\"item_subtitle\":\"GORDON D. BLANCO\",\"item_update_date\":\"October 8, 2021 &middot; 01:50 PM\"}', '{\"verification\":{\"application\":{\"application_type\":\"RENEWAL\",\"citizen_id\":5,\"citizen_avatar\":\"male-03.JPG\",\"citizen_full_name\":\"GORDON D. BLANCO\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BLANCO EGG RETAIL\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"ZONE 1\",\"barangay_id\":8159,\"barangay_address\":\"Caorasan, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Casugad, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":10,\"business_line_id\":70,\"business_line_title\":\"Egg Retailer\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":0,\"gross_sales_essential\":50000,\"gross_sales_non_essential\":50000,\"gross_sales_combined\":100000,\"business_tax_formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0.01<\\/span>  to <span class=\'sp-currency sp-amount\'>400000<\\/span><br>Business Tax is <span class=\'sp-amount\'>2<\\/span>% of GROSS SALES (NON-ESSENTIAL).\",\"business_tax\":1000}],\"total_business_tax\":1000,\"total_asset\":100000,\"date_created\":\"October 8, 2021 &middot; 01:49 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:49 PM\",\"fees_payment_invoice_id\":\"0000006764\",\"tax_payment_invoice_id\":[\"0000006765\"]},\"business_size\":{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},\"verifiers\":[],\"tax_penalty\":{\"percentage\":25,\"amount\":250,\"effectivity_start\":\"January 21\",\"effectivity_end\":\"April 30\",\"tax_with_penalty\":1250},\"fees\":{\"fee_classifications\":[{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Egg Retailer)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":245},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_2.jpg\",\"validation_code\":\"5634\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_2.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"\",\"validation_code\":\"\",\"is_verified\":0}}]},\"fees_payment_invoice\":{\"id\":\"0000006764\",\"citizen\":{\"fullname\":\"GORDON D. BLANCO\",\"avatar\":\"male-03.JPG\",\"address1\":\"Zone 3, Casugad\",\"address2\":\"Bula, Camarines Sur\",\"tin\":\"000-000-000\"},\"invoice_date\":\"October 8, 2021 &middot; 01:50 PM\",\"amount\":\"245.00\",\"is_cancelled\":\"0\",\"is_quarterly\":null,\"status\":\"<span class=\\\"text-danger\\\">UNPAID<\\/span>\",\"or_no\":\"\",\"or_char\":\"\",\"amount_tendered\":0,\"penalty\":0,\"change\":0,\"amount_without_penalty\":0,\"amount_with_penalty\":0,\"or_date\":\"\",\"invoice_summary\":[{\"other_fee\":\"Mayor\'s Permit Fee (Egg Retailer)\",\"amount\":\"100.00\"},{\"other_fee\":\"Sanitary Fee\",\"amount\":\"70.00\"},{\"other_fee\":\"Sticker Fee\",\"amount\":\"75.00\"}],\"related_or\":[],\"total_penalty\":0,\"total_amount_without_penalty\":0,\"total_amount_with_penalty\":0},\"tax_payment_invoice\":{\"payment_mode\":\"ANNUALLY\",\"payment_invoices\":[{\"id\":\"0000006765\",\"citizen\":{\"fullname\":\"GORDON D. BLANCO\",\"avatar\":\"male-03.JPG\",\"address1\":\"Zone 3, Casugad\",\"address2\":\"Bula, Camarines Sur\",\"tin\":\"000-000-000\"},\"invoice_date\":\"October 8, 2021 &middot; 01:50 PM\",\"amount\":\"1000.00\",\"is_cancelled\":\"0\",\"is_quarterly\":null,\"status\":\"<span class=\\\"text-danger\\\">UNPAID<\\/span>\",\"or_no\":\"\",\"or_char\":\"\",\"amount_tendered\":0,\"penalty\":0,\"change\":0,\"amount_without_penalty\":0,\"amount_with_penalty\":0,\"or_date\":\"\",\"invoice_summary\":[],\"related_or\":[],\"total_penalty\":0,\"total_amount_without_penalty\":0,\"total_amount_with_penalty\":0}],\"business_tax_balance_without_penalty\":1000,\"status_code\":0,\"status_text\":\"<span class=\'text-danger\'>UNPAID<\\/span>\"}}', '2021-10-08 05:50:53', '2021-10-08 05:50:53'),
(0000000087, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'renewal_3_6', 'RENEWAL', '[REN]_BUSINESS_PERMITS', '{\"item_id\":6,\"item_avatar\":\"male-03.JPG\",\"item_maintitle\":\"BLANCO EGG RETAIL\",\"item_subtitle\":\"GORDON D. BLANCO\",\"item_update_date\":\"October 8, 2021 &middot; 01:52 PM\"}', '{\"permit_no\":\"AAI0002\",\"plate_no\":\"AAI0002\",\"permit_file\":\"2021.php\",\"created_at\":\"October 8, 2021 &middot; 01:52 PM\",\"invoice\":{\"verification\":{\"application\":{\"application_type\":\"RENEWAL\",\"citizen_id\":5,\"citizen_avatar\":\"male-03.JPG\",\"citizen_full_name\":\"GORDON D. BLANCO\",\"citizen_gender\":\"Male\",\"citizen_tin\":\"000-000-000\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"BLANCO EGG RETAIL\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"000-000\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"ZONE 1\",\"barangay_id\":8159,\"barangay_address\":\"Caorasan, Bula, Camarines Sur\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"Zone 3, Casugad, Bula, Camarines Sur\",\"home_contact_num\":\"09123456789\",\"emergency_person\":\"JUAN DELA CRUZ\",\"emergency_contact_num\":\"09987654321\",\"total_male_emp\":4,\"total_male_emp_lgu\":4,\"total_female_emp\":4,\"total_female_emp_lgu\":4,\"total_employees\":8,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":10,\"business_line_id\":70,\"business_line_title\":\"Egg Retailer\",\"business_line_desc\":\"\",\"units\":1,\"capitalization\":0,\"gross_sales_essential\":50000,\"gross_sales_non_essential\":50000,\"gross_sales_combined\":100000,\"business_tax_formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0.01<\\/span>  to <span class=\'sp-currency sp-amount\'>400000<\\/span><br>Business Tax is <span class=\'sp-amount\'>2<\\/span>% of GROSS SALES (NON-ESSENTIAL).\",\"business_tax\":1000}],\"total_business_tax\":1000,\"total_asset\":100000,\"date_created\":\"October 8, 2021 &middot; 01:49 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:50 PM\",\"fees_payment_invoice_id\":\"0000006764\",\"tax_payment_invoice_id\":[\"0000006765\"]},\"business_size\":{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},\"verifiers\":[],\"tax_penalty\":{\"percentage\":25,\"amount\":250,\"effectivity_start\":\"January 21\",\"effectivity_end\":\"April 30\",\"tax_with_penalty\":1250},\"fees\":{\"fee_classifications\":[{\"fee\":\"Sticker Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":75},{\"fee\":\"Sanitary Fee\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":70},{\"fee\":\"Mayor\'s Permit Fee (Egg Retailer)\",\"fee_variable\":\"FIXED AMOUNT\",\"amount\":100}],\"total_fee\":245},\"requirements\":[{\"id\":7,\"title\":\"DTI Registration Certificate\",\"validation_code_title\":\"Certificate No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-01_2.jpg\",\"validation_code\":\"5634\",\"is_verified\":1}},{\"id\":6,\"title\":\"Barangay Business Clearance\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"APPLICATION\",\"submitted\":{\"file_name\":\"doc-02_2.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}},{\"id\":5,\"title\":\"Sanitary Permit\",\"validation_code_title\":\"Permit No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-01_3.jpg\",\"validation_code\":\"6789\",\"is_verified\":1}},{\"id\":1,\"title\":\"Certificate of Annual Building Inspection\",\"validation_code_title\":\"O.R. No.\",\"for_upload\":\"1\",\"collect_after\":\"PAYMENT\",\"submitted\":{\"file_name\":\"doc-02_3.jpg\",\"validation_code\":\"3456\",\"is_verified\":1}}]},\"fees_payment_invoice\":{\"id\":\"0000006764\",\"citizen\":{\"fullname\":\"GORDON D. BLANCO\",\"avatar\":\"male-03.JPG\",\"address1\":\"Zone 3, Casugad\",\"address2\":\"Bula, Camarines Sur\",\"tin\":\"000-000-000\"},\"invoice_date\":\"October 8, 2021 &middot; 01:50 PM\",\"amount\":\"245.00\",\"is_cancelled\":\"0\",\"is_quarterly\":null,\"status\":\"<span class=\\\"text-success\\\">PAID<\\/span>\",\"or_no\":\"7834\",\"or_char\":\"A\",\"amount_tendered\":\"245.00\",\"penalty\":\"0.00\",\"change\":\"0.00\",\"amount_without_penalty\":245,\"amount_with_penalty\":245,\"or_date\":\"October 8, 2021 &middot; 07:51 AM\",\"invoice_summary\":[{\"other_fee\":\"Mayor\'s Permit Fee (Egg Retailer)\",\"amount\":\"100.00\"},{\"other_fee\":\"Sanitary Fee\",\"amount\":\"70.00\"},{\"other_fee\":\"Sticker Fee\",\"amount\":\"75.00\"}],\"related_or\":[],\"total_penalty\":0,\"total_amount_without_penalty\":245,\"total_amount_with_penalty\":245},\"tax_payment_invoice\":{\"payment_mode\":\"ANNUALLY\",\"payment_invoices\":[{\"id\":\"0000006765\",\"citizen\":{\"fullname\":\"GORDON D. BLANCO\",\"avatar\":\"male-03.JPG\",\"address1\":\"Zone 3, Casugad\",\"address2\":\"Bula, Camarines Sur\",\"tin\":\"000-000-000\"},\"invoice_date\":\"October 8, 2021 &middot; 01:50 PM\",\"amount\":\"1000.00\",\"is_cancelled\":\"0\",\"is_quarterly\":null,\"status\":\"<span class=\\\"text-success\\\">PAID<\\/span>\",\"or_no\":\"6723\",\"or_char\":\"A\",\"amount_tendered\":\"1000.00\",\"penalty\":\"0.00\",\"change\":\"0.00\",\"amount_without_penalty\":1000,\"amount_with_penalty\":1000,\"or_date\":\"October 8, 2021 &middot; 07:51 AM\",\"invoice_summary\":[],\"related_or\":[],\"total_penalty\":0,\"total_amount_without_penalty\":1000,\"total_amount_with_penalty\":1000}],\"business_tax_balance_without_penalty\":0,\"status_code\":1,\"status_text\":\"<span class=\'text-success\'>FULLY PAID<\\/span>\"}}}', '2021-10-08 05:52:29', '2021-10-08 05:52:29');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000088, 0000000004, 'BPLO', 'Business Permit and Licensing Officer', 'INSERT', 'newbusiness_1', 'NEW BUSINESS', '[NEW]_APPLICATIONS', '{\"item_id\":7,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"October 8, 2021 &middot; 01:53 PM\"}', '{\"application_type\":\"NEW\",\"citizen_id\":0,\"citizen_avatar\":\"_.jpg\",\"citizen_full_name\":\"[NO CITIZEN]\",\"citizen_gender\":\"\",\"citizen_tin\":\"\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"[business_name]\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"\",\"dti_date\":\"October 8, 2021\",\"cda_number\":\"\",\"cda_date\":\"October 8, 2021\",\"sec_number\":\"\",\"sec_date\":\"October 8, 2021\",\"active_number\":\"DTI\",\"street_address\":\"\",\"barangay_id\":0,\"barangay_address\":\"[barangay], [municipality \\/ city], [province]\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"\",\"home_contact_num\":\"\",\"emergency_person\":\"\",\"emergency_contact_num\":\"\",\"total_male_emp\":0,\"total_male_emp_lgu\":0,\"total_female_emp\":0,\"total_female_emp_lgu\":0,\"total_employees\":0,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":11,\"business_line_id\":173,\"business_line_title\":\"Accessories\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":0,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"NOT APPLICABLE\",\"business_tax_explanation\":\"\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"October 8, 2021 &middot; 01:53 PM\",\"date_updated\":\"October 8, 2021 &middot; 01:53 PM\"}', '2021-10-08 05:53:03', '2021-10-08 05:53:03'),
(0000000089, 0000000001, 'SA', 'System Administrator', 'INSERT', 'renewal_1', 'RENEWAL', '[REN]_APPLICATIONS', '{\"item_id\":8,\"item_avatar\":\"_.jpg\",\"item_maintitle\":\"[business_name]\",\"item_subtitle\":\"[NO CITIZEN]\",\"item_update_date\":\"December 12, 2021 &middot; 05:32 PM\"}', '{\"application_type\":\"RENEWAL\",\"citizen_id\":0,\"citizen_avatar\":\"_.jpg\",\"citizen_full_name\":\"[NO CITIZEN]\",\"citizen_gender\":\"\",\"citizen_tin\":\"\",\"corporate_owner_id\":0,\"corporate_owner_fullname\":\"\",\"corporate_owner_avatar\":\"_.jpg\",\"corporate_owner_tin\":\"\",\"corporate_owner_address\":\"\",\"business_name\":\"[business_name]\",\"trade_name\":\"\",\"business_type_id\":1,\"business_types\":[{\"id\":1,\"title\":\"SINGLE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"PARTNERSHIP\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:33 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"CORPORATION\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":4,\"title\":\"COOPERATIVE\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 11:34 AM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"payment_mode_id\":1,\"payment_modes\":[{\"id\":1,\"title\":\"ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":2,\"title\":\"SEMI-ANNUALLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"},{\"id\":3,\"title\":\"QUARTERLY\",\"desc\":\"\",\"date_created\":\"June 25, 2019 &middot; 06:29 PM\",\"date_updated\":\"June 25, 2019 &middot; 06:30 PM\"}],\"dti_number\":\"\",\"dti_date\":\"December 12, 2021\",\"cda_number\":\"\",\"cda_date\":\"December 12, 2021\",\"sec_number\":\"\",\"sec_date\":\"December 12, 2021\",\"active_number\":\"DTI\",\"street_address\":\"\",\"barangay_id\":0,\"barangay_address\":\"[barangay], [municipality \\/ city], [province]\",\"belongs_to_poblacion\":false,\"business_email\":\"\",\"business_mobile_num\":\"\",\"business_tel_num\":\"\",\"home_address\":\"\",\"home_contact_num\":\"\",\"emergency_person\":\"\",\"emergency_contact_num\":\"\",\"total_male_emp\":0,\"total_male_emp_lgu\":0,\"total_female_emp\":0,\"total_female_emp_lgu\":0,\"total_employees\":0,\"business_area\":0,\"is_renting\":0,\"monthly_rental\":0,\"lessor_fullname\":\"\",\"lessor_address\":\"\",\"lessor_contact_num\":\"\",\"lessor_email\":\"\",\"business_activities\":[{\"id\":12,\"business_line_id\":173,\"business_line_title\":\"Accessories\",\"business_line_desc\":\"\",\"units\":0,\"capitalization\":0,\"gross_sales_essential\":0,\"gross_sales_non_essential\":0,\"gross_sales_combined\":0,\"business_tax_formula\":\"PER GROSS SALES (ESSENTIAL)\",\"business_tax_explanation\":\"From <span class=\'sp-currency sp-amount\'>0<\\/span>  to <span class=\'sp-currency sp-amount\'>0<\\/span><br>Business Tax is <span class=\'sp-amount sp-currency\'>0<\\/span>.\",\"business_tax\":0}],\"total_business_tax\":0,\"total_asset\":0,\"date_created\":\"December 12, 2021 &middot; 05:32 PM\",\"date_updated\":\"December 12, 2021 &middot; 05:32 PM\"}', '2021-12-12 09:32:15', '2021-12-12 09:32:15'),
(0000000090, 0000000001, 'SA', 'System Administrator', 'UPDATE', 'fees_1_5', 'FEES', 'FEE_ITEMS', '{\"item_id\":5,\"item_avatar\":\"\",\"item_maintitle\":\"Business Tax (Deliquencies)\",\"item_subtitle\":\"\",\"item_update_date\":\"February 7, 2020 &middot; 09:23 AM\"}', '{\"title\":\"Business Tax (Deliquencies)\",\"desc\":\"\",\"is_multiple_collection\":\"1\",\"is_for_poblacion_only\":\"1\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}],\"business_sizes\":[{\"id\":6,\"title\":\"LARGE SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":60000000,\"asset_limit_to\":-1,\"total_workers_from\":200,\"total_workers_to\":-1,\"date_created\":\"June 22, 2019 &middot; 11:23 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:24 AM\"},{\"id\":5,\"title\":\"MEDIUM SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":15000000,\"asset_limit_to\":60000000,\"total_workers_from\":100,\"total_workers_to\":199,\"date_created\":\"June 22, 2019 &middot; 11:22 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:23 AM\"},{\"id\":4,\"title\":\"SMALL SCALE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":1500000,\"asset_limit_to\":15000000,\"total_workers_from\":10,\"total_workers_to\":99,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:22 AM\"},{\"id\":3,\"title\":\"COTTAGE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":150000,\"asset_limit_to\":1500000,\"total_workers_from\":0,\"total_workers_to\":9,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:29 AM\"},{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"}],\"fee_variables\":[{\"id\":1,\"title\":\"NOT APPLICABLE\"},{\"id\":2,\"title\":\"FIXED AMOUNT\"},{\"id\":3,\"title\":\"PER BUSINESS SIZE\"},{\"id\":4,\"title\":\"Total Employees &times;\"},{\"id\":5,\"title\":\"Business Area &times;\"}]}', '2021-12-12 09:33:02', '2021-12-12 09:33:02'),
(0000000091, 0000000001, 'SA', 'System Administrator', 'UPDATE', 'fees_1_11', 'FEES', 'FEE_ITEMS', '{\"item_id\":11,\"item_avatar\":\"\",\"item_maintitle\":\"Fire Inspection Fee\",\"item_subtitle\":\"\",\"item_update_date\":\"February 7, 2020 &middot; 09:24 AM\"}', '{\"title\":\"Fire Inspection Fee\",\"desc\":\"\",\"is_multiple_collection\":\"1\",\"is_for_poblacion_only\":\"0\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}],\"business_sizes\":[{\"id\":6,\"title\":\"LARGE SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":60000000,\"asset_limit_to\":-1,\"total_workers_from\":200,\"total_workers_to\":-1,\"date_created\":\"June 22, 2019 &middot; 11:23 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:24 AM\"},{\"id\":5,\"title\":\"MEDIUM SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":15000000,\"asset_limit_to\":60000000,\"total_workers_from\":100,\"total_workers_to\":199,\"date_created\":\"June 22, 2019 &middot; 11:22 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:23 AM\"},{\"id\":4,\"title\":\"SMALL SCALE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":1500000,\"asset_limit_to\":15000000,\"total_workers_from\":10,\"total_workers_to\":99,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:22 AM\"},{\"id\":3,\"title\":\"COTTAGE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":150000,\"asset_limit_to\":1500000,\"total_workers_from\":0,\"total_workers_to\":9,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:29 AM\"},{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"}],\"fee_variables\":[{\"id\":1,\"title\":\"NOT APPLICABLE\"},{\"id\":2,\"title\":\"FIXED AMOUNT\"},{\"id\":3,\"title\":\"PER BUSINESS SIZE\"},{\"id\":4,\"title\":\"Total Employees &times;\"},{\"id\":5,\"title\":\"Business Area &times;\"}]}', '2021-12-12 09:33:04', '2021-12-12 09:33:04');
INSERT INTO `system_logs` (`ID`, `CitizenID`, `UserTypeAcronym`, `UserTypeTitle`, `Action`, `Location`, `Menu`, `Tab`, `Item`, `ItemData`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000092, 0000000001, 'SA', 'System Administrator', 'UPDATE', 'fees_1_1', 'FEES', 'FEE_ITEMS', '{\"item_id\":1,\"item_avatar\":\"\",\"item_maintitle\":\"Business Plate Fee\",\"item_subtitle\":\"\",\"item_update_date\":\"February 7, 2020 &middot; 09:21 AM\"}', '{\"title\":\"Business Plate Fee\",\"desc\":\"\",\"is_multiple_collection\":\"1\",\"is_for_poblacion_only\":\"0\",\"classifications\":[{\"business_line_id\":173,\"application_type\":\"NEW\",\"fee_variable_id\":5,\"amount\":\"0\",\"business_size_fees\":[]},{\"business_line_id\":52,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":29,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":74,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":68,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":27,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":26,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":38,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":11,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":46,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":64,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":41,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":7,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":13,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":47,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":25,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":34,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":35,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":67,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":17,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":3,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":82,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":78,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":80,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":40,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":24,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":71,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"250\",\"business_size_fees\":[]},{\"business_line_id\":57,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":63,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":43,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":69,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":75,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":2,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":60,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":31,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":9,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":42,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":53,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":5,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":81,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":21,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":59,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":58,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":20,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":79,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":49,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":83,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":16,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":33,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":51,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":6,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":56,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":18,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"450\",\"business_size_fees\":[]},{\"business_line_id\":28,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"450\",\"business_size_fees\":[]},{\"business_line_id\":36,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"450\",\"business_size_fees\":[]},{\"business_line_id\":10,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":23,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":14,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":44,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":8,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":77,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":30,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":84,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":61,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":62,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":4,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":45,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":48,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":22,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":70,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":66,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":32,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"250\",\"business_size_fees\":[]},{\"business_line_id\":50,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":12,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"250\",\"business_size_fees\":[]},{\"business_line_id\":1,\"application_type\":\"NEW\",\"fee_variable_id\":2,\"amount\":\"350\",\"business_size_fees\":[]},{\"business_line_id\":1,\"application_type\":\"RENEWAL\",\"fee_variable_id\":2,\"amount\":\"0\",\"business_size_fees\":[]}],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}],\"business_sizes\":[{\"id\":6,\"title\":\"LARGE SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":60000000,\"asset_limit_to\":-1,\"total_workers_from\":200,\"total_workers_to\":-1,\"date_created\":\"June 22, 2019 &middot; 11:23 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:24 AM\"},{\"id\":5,\"title\":\"MEDIUM SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":15000000,\"asset_limit_to\":60000000,\"total_workers_from\":100,\"total_workers_to\":199,\"date_created\":\"June 22, 2019 &middot; 11:22 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:23 AM\"},{\"id\":4,\"title\":\"SMALL SCALE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":1500000,\"asset_limit_to\":15000000,\"total_workers_from\":10,\"total_workers_to\":99,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:22 AM\"},{\"id\":3,\"title\":\"COTTAGE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":150000,\"asset_limit_to\":1500000,\"total_workers_from\":0,\"total_workers_to\":9,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:29 AM\"},{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"}],\"fee_variables\":[{\"id\":1,\"title\":\"NOT APPLICABLE\"},{\"id\":2,\"title\":\"FIXED AMOUNT\"},{\"id\":3,\"title\":\"PER BUSINESS SIZE\"},{\"id\":4,\"title\":\"Total Employees &times;\"},{\"id\":5,\"title\":\"Business Area &times;\"}]}', '2021-12-12 09:33:13', '2021-12-12 09:33:13'),
(0000000093, 0000000001, 'SA', 'System Administrator', 'UPDATE', 'fees_1_9', 'FEES', 'FEE_ITEMS', '{\"item_id\":9,\"item_avatar\":\"\",\"item_maintitle\":\"Employee\\/s Health Card\",\"item_subtitle\":\"\",\"item_update_date\":\"February 7, 2020 &middot; 09:24 AM\"}', '{\"title\":\"Employee\\/s Health Card\",\"desc\":\"\",\"is_multiple_collection\":\"1\",\"is_for_poblacion_only\":\"0\",\"classifications\":[],\"lines_of_business\":[{\"id\":173,\"title\":\"Accessories\"},{\"id\":174,\"title\":\"Agent-Network Marketing\"},{\"id\":114,\"title\":\"Agri-Machine and Parts\"},{\"id\":36,\"title\":\"Agricultural Supply\"},{\"id\":28,\"title\":\"Agrivet Supply\"},{\"id\":18,\"title\":\"Apartment\"},{\"id\":177,\"title\":\"Appliances Center\"},{\"id\":164,\"title\":\"Audio Myx File Mobile Disco Sound System\"},{\"id\":178,\"title\":\"Auto Parts and General Merchandise\"},{\"id\":179,\"title\":\"Auto Repair Shop\"},{\"id\":137,\"title\":\"Auto Spare Parts And Accessories\"},{\"id\":56,\"title\":\"Bakeshop\"},{\"id\":6,\"title\":\"Banking\"},{\"id\":162,\"title\":\"Banking and Finance\"},{\"id\":51,\"title\":\"Barber Shop\"},{\"id\":33,\"title\":\"Beauty Salon\"},{\"id\":180,\"title\":\"Blend Coffee And Milktea\"},{\"id\":172,\"title\":\"Blocks Supply\"},{\"id\":16,\"title\":\"Boarding House\"},{\"id\":182,\"title\":\"Booking Office\"},{\"id\":83,\"title\":\"Booking Outlet\"},{\"id\":99,\"title\":\"Boutique\"},{\"id\":103,\"title\":\"Building Rental\"},{\"id\":106,\"title\":\"Buy & Sell\"},{\"id\":183,\"title\":\"Buying Copra\"},{\"id\":184,\"title\":\"Cable Network\"},{\"id\":185,\"title\":\"Cable TV\"},{\"id\":158,\"title\":\"Cakeshop\"},{\"id\":186,\"title\":\"Canteen\"},{\"id\":49,\"title\":\"Carinderia\"},{\"id\":160,\"title\":\"Carwash\"},{\"id\":79,\"title\":\"Cell Sites\"},{\"id\":96,\"title\":\"Cellphone & Accessories\"},{\"id\":188,\"title\":\"Cellphone Repair Shop\"},{\"id\":20,\"title\":\"Chainsaw Operator\"},{\"id\":140,\"title\":\"Chainsaw Processor\"},{\"id\":58,\"title\":\"Clinic\"},{\"id\":92,\"title\":\"Cockpit\"},{\"id\":130,\"title\":\"Coco Lumber\"},{\"id\":102,\"title\":\"Coconut & Rice Grinder\"},{\"id\":189,\"title\":\"Coconut Grinder\"},{\"id\":190,\"title\":\"Commercial Building\"},{\"id\":191,\"title\":\"Commercial Space Rental\"},{\"id\":192,\"title\":\"Comprada\"},{\"id\":193,\"title\":\"Computer Pisonet\"},{\"id\":152,\"title\":\"Computer Related Services\"},{\"id\":147,\"title\":\"Computer Service\"},{\"id\":88,\"title\":\"Computer Shop\"},{\"id\":194,\"title\":\"Construction\"},{\"id\":59,\"title\":\"Construction & Supplies\"},{\"id\":21,\"title\":\"Construction Supply\"},{\"id\":81,\"title\":\"Contractor\"},{\"id\":197,\"title\":\"Convenience Store\"},{\"id\":10,\"title\":\"Cooperative\"},{\"id\":198,\"title\":\"Copra Trading\"},{\"id\":199,\"title\":\"Cycle Parts\"},{\"id\":200,\"title\":\"Dental Clinic\"},{\"id\":157,\"title\":\"Dental Laboratory\"},{\"id\":201,\"title\":\"Department Sore\"},{\"id\":202,\"title\":\"Direct Selling\"},{\"id\":256,\"title\":\"Distributors\"},{\"id\":104,\"title\":\"Dormitory\"},{\"id\":170,\"title\":\"Dried Fish\"},{\"id\":204,\"title\":\"Dried Fish Vendor\"},{\"id\":165,\"title\":\"Drug Retailing\"},{\"id\":23,\"title\":\"Drugstore\"},{\"id\":14,\"title\":\"Dry Goods\"},{\"id\":48,\"title\":\"Eatery\"},{\"id\":203,\"title\":\"Educational\"},{\"id\":22,\"title\":\"Educational Institution\"},{\"id\":70,\"title\":\"Egg Retailer\"},{\"id\":151,\"title\":\"Electronic Services\"},{\"id\":66,\"title\":\"Engineering Services\"},{\"id\":205,\"title\":\"Farm\"},{\"id\":32,\"title\":\"Fastfood\"},{\"id\":207,\"title\":\"Feeds Supply\"},{\"id\":87,\"title\":\"Fireworks Retailer\"},{\"id\":86,\"title\":\"Fish Vendor\"},{\"id\":208,\"title\":\"Food\"},{\"id\":209,\"title\":\"Food Corner\"},{\"id\":210,\"title\":\"Food House\"},{\"id\":211,\"title\":\"Food Product\"},{\"id\":98,\"title\":\"Footwear\"},{\"id\":212,\"title\":\"Fried Chicken Vendor\"},{\"id\":116,\"title\":\"Frozen Meat Products\"},{\"id\":50,\"title\":\"Fruit Vendor\"},{\"id\":12,\"title\":\"Funeral Services\"},{\"id\":129,\"title\":\"Furniture\"},{\"id\":45,\"title\":\"Furniture Shop\"},{\"id\":4,\"title\":\"Gasoline Station\"},{\"id\":62,\"title\":\"General Merchandise\"},{\"id\":214,\"title\":\"Gift Shop\"},{\"id\":215,\"title\":\"Goto house\"},{\"id\":216,\"title\":\"Gown Rental\"},{\"id\":61,\"title\":\"Grinder\"},{\"id\":84,\"title\":\"Grocery\"},{\"id\":30,\"title\":\"Hardware\"},{\"id\":131,\"title\":\"Health Service\"},{\"id\":77,\"title\":\"Hospital\"},{\"id\":8,\"title\":\"Hotel\"},{\"id\":44,\"title\":\"Hotel And Resort\"},{\"id\":217,\"title\":\"House For Rent\"},{\"id\":5,\"title\":\"Internet Cafe\"},{\"id\":146,\"title\":\"Internet Shop\"},{\"id\":53,\"title\":\"Jewelries\"},{\"id\":218,\"title\":\"Junkshop\"},{\"id\":109,\"title\":\"Kitchen Ware Rental\"},{\"id\":89,\"title\":\"Laundry Shop\"},{\"id\":219,\"title\":\"Law Firm\"},{\"id\":220,\"title\":\"Lechon Manok\"},{\"id\":35,\"title\":\"Lending\"},{\"id\":257,\"title\":\"Lending and Churvaness\"},{\"id\":255,\"title\":\"Lessor\"},{\"id\":221,\"title\":\"Lotto Outlet\"},{\"id\":107,\"title\":\"LPG Station\"},{\"id\":115,\"title\":\"Made to Order Lechon\"},{\"id\":132,\"title\":\"Maritatas\"},{\"id\":25,\"title\":\"Maritatas Store\"},{\"id\":47,\"title\":\"Meat Shop\"},{\"id\":222,\"title\":\"Meat Stall\"},{\"id\":13,\"title\":\"Meat Vendor\"},{\"id\":224,\"title\":\"Medical Clinic\"},{\"id\":94,\"title\":\"Memorial Park\"},{\"id\":223,\"title\":\"Micro Insurance\"},{\"id\":7,\"title\":\"Microfinance\"},{\"id\":169,\"title\":\"Microfinance-Ngo\"},{\"id\":126,\"title\":\"Mini Grocery\"},{\"id\":225,\"title\":\"Mini Hardware\"},{\"id\":41,\"title\":\"Mobile Phone Accessories\"},{\"id\":226,\"title\":\"Money Remittance\"},{\"id\":138,\"title\":\"Motor Parts And Accessories\"},{\"id\":228,\"title\":\"Motor Spare Parts\"},{\"id\":229,\"title\":\"Motorcycle Dealer\"},{\"id\":64,\"title\":\"Motorcycle Parts\"},{\"id\":230,\"title\":\"Motorcycle Sales\"},{\"id\":46,\"title\":\"Native Products\"},{\"id\":232,\"title\":\"Net Shop\"},{\"id\":111,\"title\":\"Optical Clinic\"},{\"id\":234,\"title\":\"Organization\"},{\"id\":233,\"title\":\"Padala Center\"},{\"id\":235,\"title\":\"Palay Seeds Dealer\"},{\"id\":125,\"title\":\"Panciteria\"},{\"id\":143,\"title\":\"Pasalubong Shop\"},{\"id\":11,\"title\":\"Pawnshop\"},{\"id\":38,\"title\":\"Pharmacy\"},{\"id\":118,\"title\":\"Photocopy Center\"},{\"id\":26,\"title\":\"Photocopying Services\"},{\"id\":27,\"title\":\"Photographic Activities\"},{\"id\":128,\"title\":\"Pili Nuts\"},{\"id\":150,\"title\":\"Pilinuts Delicacies\"},{\"id\":159,\"title\":\"Pilinuts Delicacies Retailer\"},{\"id\":139,\"title\":\"Pizza\"},{\"id\":68,\"title\":\"Planning and Design Construction\"},{\"id\":101,\"title\":\"Plastic And Other Goods\"},{\"id\":166,\"title\":\"Plasticware\"},{\"id\":74,\"title\":\"Poultry Farm\"},{\"id\":29,\"title\":\"Poultry Supply\"},{\"id\":134,\"title\":\"Pre-School\"},{\"id\":237,\"title\":\"Printing Center\"},{\"id\":238,\"title\":\"Printing Services\"},{\"id\":168,\"title\":\"Private School\"},{\"id\":239,\"title\":\"Real Estate\"},{\"id\":34,\"title\":\"Real Estate Lessors\"},{\"id\":148,\"title\":\"Refreshment\"},{\"id\":241,\"title\":\"Refreshment Halo-Halo\"},{\"id\":52,\"title\":\"Refreshment Parlor\"},{\"id\":242,\"title\":\"Refreshment Stand\"},{\"id\":67,\"title\":\"Religious Matter\"},{\"id\":17,\"title\":\"Rental Services\"},{\"id\":42,\"title\":\"Repair Services\"},{\"id\":9,\"title\":\"Resort\"},{\"id\":31,\"title\":\"Restaurant\"},{\"id\":243,\"title\":\"Resto Bar\"},{\"id\":117,\"title\":\"Retail\"},{\"id\":153,\"title\":\"Retail and Wholessale of Agricultural Farm Supplies, Equipment other Retail Sale in Specialized \"},{\"id\":60,\"title\":\"Retail of fashion Accessories\"},{\"id\":244,\"title\":\"Retail Of Fasion Accessories\"},{\"id\":113,\"title\":\"Retail of Generic Medicine\"},{\"id\":154,\"title\":\"Retail of Oil  And Lubes\"},{\"id\":245,\"title\":\"Retail of Supplies\"},{\"id\":133,\"title\":\"Retail of Textile\"},{\"id\":127,\"title\":\"Retail Sales In Specialized Store\"},{\"id\":121,\"title\":\"Retailer of Agricultural Supply\"},{\"id\":122,\"title\":\"Retailer of Agriculture Enterprises\"},{\"id\":2,\"title\":\"Rice Mill\"},{\"id\":119,\"title\":\"Rice Retailer\"},{\"id\":161,\"title\":\"Roofing Services\"},{\"id\":246,\"title\":\"Roofing Services Rtw Retailer General Merchandise\"},{\"id\":75,\"title\":\"Rural Banking\"},{\"id\":247,\"title\":\"Salon\"},{\"id\":136,\"title\":\"San Miguel Beer Dealer\"},{\"id\":163,\"title\":\"Sand, Gravel and Hollow Blocks Supply\"},{\"id\":1,\"title\":\"Sari-Sari Store\"},{\"id\":248,\"title\":\"School Service\"},{\"id\":69,\"title\":\"School Supplies\"},{\"id\":167,\"title\":\"School Supply\"},{\"id\":141,\"title\":\"Skin Care And Other Beauty Products\"},{\"id\":135,\"title\":\"Social Development\"},{\"id\":123,\"title\":\"Soft Ice Cream\"},{\"id\":250,\"title\":\"Softdrinks Dealer\"},{\"id\":43,\"title\":\"Space Rental\"},{\"id\":63,\"title\":\"Spare Parts\"},{\"id\":105,\"title\":\"Spiritual Matters\"},{\"id\":124,\"title\":\"Steel Work\"},{\"id\":57,\"title\":\"Stell Works\"},{\"id\":71,\"title\":\"Supermarket\"},{\"id\":175,\"title\":\"Supply\"},{\"id\":251,\"title\":\"Surveying\"},{\"id\":24,\"title\":\"Tailoring\"},{\"id\":110,\"title\":\"Technical, Vocational,Training and Assessment Center\"},{\"id\":40,\"title\":\"Telecommunication Services\"},{\"id\":120,\"title\":\"Toy Store\"},{\"id\":80,\"title\":\"Trading\"},{\"id\":91,\"title\":\"Training\\/Seminar\"},{\"id\":78,\"title\":\"Transportation Terminal\"},{\"id\":145,\"title\":\"Travel Agency\"},{\"id\":156,\"title\":\"Travel And Tours\"},{\"id\":149,\"title\":\"Traveller\'s Inn\"},{\"id\":82,\"title\":\"Truck for Hire\"},{\"id\":187,\"title\":\"Ukay-Ukay\"},{\"id\":90,\"title\":\"Vulcanizing Shop\"},{\"id\":254,\"title\":\"Warehousing\"},{\"id\":3,\"title\":\"Water Refilling Station\"},{\"id\":253,\"title\":\"Wellness Product\"},{\"id\":144,\"title\":\"Wholesaler\"}],\"business_sizes\":[{\"id\":6,\"title\":\"LARGE SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":60000000,\"asset_limit_to\":-1,\"total_workers_from\":200,\"total_workers_to\":-1,\"date_created\":\"June 22, 2019 &middot; 11:23 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:24 AM\"},{\"id\":5,\"title\":\"MEDIUM SCALE INDUSRTY\",\"desc\":\"\",\"asset_limit_from\":15000000,\"asset_limit_to\":60000000,\"total_workers_from\":100,\"total_workers_to\":199,\"date_created\":\"June 22, 2019 &middot; 11:22 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:23 AM\"},{\"id\":4,\"title\":\"SMALL SCALE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":1500000,\"asset_limit_to\":15000000,\"total_workers_from\":10,\"total_workers_to\":99,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:22 AM\"},{\"id\":3,\"title\":\"COTTAGE INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":150000,\"asset_limit_to\":1500000,\"total_workers_from\":0,\"total_workers_to\":9,\"date_created\":\"June 22, 2019 &middot; 11:21 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:29 AM\"},{\"id\":2,\"title\":\"MICRO INDUSTRY\",\"desc\":\"\",\"asset_limit_from\":50000,\"asset_limit_to\":150000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 22, 2019 &middot; 11:20 AM\"},{\"id\":1,\"title\":\"MICRO ENTERPRISE\",\"desc\":\"Asset Limit is below Php 50,000. No particular number of workers.jjkk\",\"asset_limit_from\":0,\"asset_limit_to\":50000,\"total_workers_from\":0,\"total_workers_to\":0,\"date_created\":\"June 22, 2019 &middot; 11:20 AM\",\"date_updated\":\"June 27, 2019 &middot; 11:59 AM\"}],\"fee_variables\":[{\"id\":1,\"title\":\"NOT APPLICABLE\"},{\"id\":2,\"title\":\"FIXED AMOUNT\"},{\"id\":3,\"title\":\"PER BUSINESS SIZE\"},{\"id\":4,\"title\":\"Total Employees &times;\"},{\"id\":5,\"title\":\"Business Area &times;\"}]}', '2021-12-12 09:33:20', '2021-12-12 09:33:20'),
(0000000094, 0000000001, 'SA', 'System Administrator', 'UPDATE', 'users_1_1', 'USERS', 'USER_ACCOUNTS', '{\"item_id\":1,\"item_avatar\":\"zLIDS.png\",\"item_maintitle\":\"DEFAULT A. LIDS\",\"item_subtitle\":\"(SA) System Administrator\",\"item_update_date\":\"February 18, 2020 &middot; 01:11 AM\"}', '{\"citizen_id\":1,\"citizen_avatar\":\"zLIDS.png\",\"citizen_full_name\":\"DEFAULT A. LIDS\",\"username\":\"admin\",\"password\":\"****************\",\"is_active\":\"1\",\"usertype_id\":1,\"usertypes\":[{\"id\":2,\"acronym\":\"BPLO\",\"title\":\"Business Permit and Licensing Officer\",\"desc\":\"Business Permit and Licensing Officer\",\"date_created\":\"July 23, 2019 &middot; 05:03 AM\",\"date_updated\":\"March 23, 2021 &middot; 10:20 AM\",\"access\":[{\"icon\":\"fa fa-th-large\",\"title\":\"DASHBOARD\",\"desc\":\"View the system dashboard.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fas fa-layer-group\",\"title\":\"UPDATES\",\"desc\":\"View the updates posted by the developers.\",\"checked\":0,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[NEW] APPLICATIONS\",\"desc\":\"Create application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[NEW] VERIFICATIONS\",\"desc\":\"Verify application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[NEW] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[NEW] BUSINESS PERMITS\",\"desc\":\"Access business permits for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[REN] APPLICATIONS\",\"desc\":\"Create application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[REN] VERIFICATIONS\",\"desc\":\"Verify application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[REN] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[REN] BUSINESS PERMITS\",\"desc\":\"Access business permits for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-sitemap\",\"title\":\"LINES OF BUSINESS\",\"desc\":\"Manage settings for lines of business and business taxes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-chart-pie\",\"title\":\"BUSINESS SIZES\",\"desc\":\"Manage settings for business sizes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-calculator\",\"title\":\"FEE ITEMS\",\"desc\":\"Manage settings for applicable fees.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-file\",\"title\":\"REQUIREMENT ITEMS\",\"desc\":\"Manage settings for application requirements.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-copy\",\"title\":\"REPORTS\",\"desc\":\"View reports.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user\",\"title\":\"USER ACCOUNTS\",\"desc\":\"Manage settings for user accounts.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-tags\",\"title\":\"USER TYPES\",\"desc\":\"Manage settings for user types.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user-circle\",\"title\":\"CITIZENS\",\"desc\":\"View citizens.\",\"checked\":0,\"for_devs_only\":\"1\"},{\"icon\":\"fa fa-cog\",\"title\":\"APPLICATION SETTINGS\",\"desc\":\"Manage application settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-cog\",\"title\":\"SYSTEM SETTINGS\",\"desc\":\"Manage system settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-desktop\",\"title\":\"ACTIVITY LOGS\",\"desc\":\"Access activity logs.\",\"checked\":1,\"for_devs_only\":\"0\"}]},{\"id\":1,\"acronym\":\"SA\",\"title\":\"System Administrator\",\"desc\":\"System Administrator\",\"date_created\":\"September 8, 2018 &middot; 01:20 PM\",\"date_updated\":\"March 23, 2021 &middot; 03:35 AM\",\"access\":[{\"icon\":\"fa fa-th-large\",\"title\":\"DASHBOARD\",\"desc\":\"View the system dashboard.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fas fa-layer-group\",\"title\":\"UPDATES\",\"desc\":\"View the updates posted by the developers.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[NEW] APPLICATIONS\",\"desc\":\"Create application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[NEW] VERIFICATIONS\",\"desc\":\"Verify application for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[NEW] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[NEW] BUSINESS PERMITS\",\"desc\":\"Access business permits for new business.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-edit\",\"title\":\"[REN] APPLICATIONS\",\"desc\":\"Create application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-window-restore\",\"title\":\"[REN] VERIFICATIONS\",\"desc\":\"Verify application for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-receipt\",\"title\":\"[REN] PAYMENT INVOICES\",\"desc\":\"Access payment invoices for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-address-card\",\"title\":\"[REN] BUSINESS PERMITS\",\"desc\":\"Access business permits for renewal.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-sitemap\",\"title\":\"LINES OF BUSINESS\",\"desc\":\"Manage settings for lines of business and business taxes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-chart-pie\",\"title\":\"BUSINESS SIZES\",\"desc\":\"Manage settings for business sizes.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-calculator\",\"title\":\"FEE ITEMS\",\"desc\":\"Manage settings for applicable fees.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-file\",\"title\":\"REQUIREMENT ITEMS\",\"desc\":\"Manage settings for application requirements.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-copy\",\"title\":\"REPORTS\",\"desc\":\"View reports.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user\",\"title\":\"USER ACCOUNTS\",\"desc\":\"Manage settings for user accounts.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-tags\",\"title\":\"USER TYPES\",\"desc\":\"Manage settings for user types.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-user-circle\",\"title\":\"CITIZENS\",\"desc\":\"View citizens.\",\"checked\":0,\"for_devs_only\":\"1\"},{\"icon\":\"fa fa-cog\",\"title\":\"APPLICATION SETTINGS\",\"desc\":\"Manage application settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-cog\",\"title\":\"SYSTEM SETTINGS\",\"desc\":\"Manage system settings.\",\"checked\":1,\"for_devs_only\":\"0\"},{\"icon\":\"fa fa-desktop\",\"title\":\"ACTIVITY LOGS\",\"desc\":\"Access activity logs.\",\"checked\":1,\"for_devs_only\":\"0\"}]}]}', '2021-12-12 10:21:59', '2021-12-12 10:21:59'),
(0000000095, 0000000001, 'SA', 'System Administrator', 'UPDATE', 'businesses_1_114', 'BUSINESS & TAX', 'LINES_OF_BUSINESS', '{\"item_id\":114,\"item_avatar\":\"\",\"item_maintitle\":\"Agri-Machine and Parts\",\"item_subtitle\":\"\",\"item_update_date\":\"February 17, 2020 &middot; 01:59 AM\"}', '{\"business_line\":\"Agri-Machine and Parts\",\"desc\":\"\",\"new_tax_var_id\":2,\"renewal_tax_var_id\":1,\"new_tax_fixed\":0,\"renewal_tax_fixed\":0,\"tax_variables\":[{\"id\":1,\"formula\":\"NOT APPLICABLE\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"February 20, 2020 &middot; 06:56 AM\"},{\"id\":2,\"formula\":\"FIXED AMOUNT\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 04:27 PM\",\"date_updated\":\"June 25, 2019 &middot; 07:18 AM\"},{\"id\":3,\"formula\":\"PER CAPITALIZATION\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 04:29 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":4,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:37 PM\"},{\"id\":5,\"formula\":\"PER GROSS SALES (ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 30, 2019 &middot; 11:35 AM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":6,\"formula\":\"PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:05 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:38 PM\"},{\"id\":7,\"formula\":\"(CAPITALIZATION * 0.01) \\/ 20\",\"for_new\":1,\"for_renewal\":0,\"date_created\":\"June 23, 2019 &middot; 06:02 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:41 PM\"},{\"id\":8,\"formula\":\"(TOTAL GROSS SALES * 0.01) \\/ 20\",\"for_new\":0,\"for_renewal\":1,\"date_created\":\"June 23, 2019 &middot; 06:03 PM\",\"date_updated\":\"June 30, 2019 &middot; 11:44 AM\"},{\"id\":9,\"formula\":\"PER NUMBER OF UNITS\",\"for_new\":1,\"for_renewal\":1,\"date_created\":\"February 19, 2020 &middot; 01:43 PM\",\"date_updated\":\"February 19, 2020 &middot; 01:43 PM\"}],\"tax_brackets\":[]}', '2021-12-12 11:15:40', '2021-12-12 11:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `taxes_option`
--

CREATE TABLE `taxes_option` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `Data` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taxes_option`
--

INSERT INTO `taxes_option` (`ID`, `Title`, `Description`, `Data`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'BUSINESS TAX PENALTY', '', '{\"NEW\":{\"percentage\":25,\"date_start\":\"February 1\",\"date_end\":\"December 31\"},\"RENEWAL\":{\"percentage\":25,\"date_start\":\"January 21\",\"date_end\":\"April 30\"}}', '2019-07-03 00:41:46', '2020-02-08 02:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `taxes_variable`
--

CREATE TABLE `taxes_variable` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Formula` varchar(128) NOT NULL,
  `ForNewBusiness` tinyint(1) NOT NULL DEFAULT 0,
  `ForRenewal` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taxes_variable`
--

INSERT INTO `taxes_variable` (`ID`, `Formula`, `ForNewBusiness`, `ForRenewal`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'NOT APPLICABLE', 1, 1, '2019-06-23 08:27:12', '2020-02-19 22:56:01'),
(0000000002, 'FIXED AMOUNT', 1, 1, '2019-06-23 08:27:36', '2019-06-24 23:18:21'),
(0000000003, 'PER CAPITALIZATION', 1, 0, '2019-06-23 08:29:18', '2020-02-19 05:41:20'),
(0000000004, 'PER GROSS SALES (NON-ESSENTIAL)', 0, 1, '2019-06-30 03:35:29', '2020-02-19 05:37:47'),
(0000000005, 'PER GROSS SALES (ESSENTIAL)', 0, 1, '2019-06-30 03:35:29', '2020-02-19 05:38:15'),
(0000000006, 'PER GROSS SALES (NON-ESSENTIAL + ESSENTIAL)', 0, 1, '2019-06-23 10:05:03', '2020-02-19 05:38:38'),
(0000000007, '(CAPITALIZATION * 0.01) / 20', 1, 0, '2019-06-23 10:02:44', '2020-02-19 05:41:06'),
(0000000008, '(TOTAL GROSS SALES * 0.01) / 20', 0, 1, '2019-06-23 10:03:08', '2019-06-30 03:44:13'),
(0000000009, 'PER NUMBER OF UNITS', 1, 1, '2020-02-19 05:43:19', '2020-02-19 05:43:19');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `UpdatePeriodID` smallint(5) UNSIGNED ZEROFILL NOT NULL,
  `Menu` varchar(64) NOT NULL,
  `Tab` varchar(32) NOT NULL,
  `Details` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `updates_periods`
--

CREATE TABLE `updates_periods` (
  `ID` smallint(5) UNSIGNED ZEROFILL NOT NULL,
  `Period` varchar(32) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `CitizenID` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `UserTypeID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Password` varchar(512) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`CitizenID`, `UserTypeID`, `Username`, `Password`, `IsActive`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 0000000001, 'admin', '$2y$10$fBFbIUo2NYH7gruqAitMpO4XxAAMaRI4NfRh0ZzlxfeJuUnZyh0KSebplsWlc8Oj0', 1, '2019-06-16 03:45:44', '2021-12-12 10:21:59'),
(0000000004, 0000000002, 'bplo', '$2y$10$wK8IGPIIrxkfDaRf/6EZIOT/ZQe3cdWV9cgUzqbEYXhXnzQZifTgGebplsWSk+LQ', 1, '2021-10-08 05:22:34', '2021-10-08 05:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Acronym` varchar(32) NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `Access` varchar(1536) NOT NULL DEFAULT '[]',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`ID`, `Acronym`, `Title`, `Description`, `Access`, `CreatedAt`, `UpdatedAt`) VALUES
(0000000001, 'SA', 'System Administrator', 'System Administrator', '[\"DASHBOARD\",\"UPDATES\",\"[NEW] APPLICATIONS\",\"[NEW] VERIFICATIONS\",\"[NEW] PAYMENT INVOICES\",\"[NEW] BUSINESS PERMITS\",\"[REN] APPLICATIONS\",\"[REN] VERIFICATIONS\",\"[REN] PAYMENT INVOICES\",\"[REN] BUSINESS PERMITS\",\"LINES OF BUSINESS\",\"BUSINESS SIZES\",\"FEE ITEMS\",\"REQUIREMENT ITEMS\",\"REPORTS\",\"USER ACCOUNTS\",\"USER TYPES\",\"APPLICATION SETTINGS\",\"SYSTEM SETTINGS\",\"ACTIVITY LOGS\"]', '2018-09-08 05:20:14', '2021-03-22 19:35:20'),
(0000000002, 'BPLO', 'Business Permit and Licensing Officer', 'Business Permit and Licensing Officer', '[\"DASHBOARD\",\"[NEW] APPLICATIONS\",\"[NEW] VERIFICATIONS\",\"[NEW] PAYMENT INVOICES\",\"[NEW] BUSINESS PERMITS\",\"[REN] APPLICATIONS\",\"[REN] VERIFICATIONS\",\"[REN] PAYMENT INVOICES\",\"[REN] BUSINESS PERMITS\",\"LINES OF BUSINESS\",\"BUSINESS SIZES\",\"FEE ITEMS\",\"REQUIREMENT ITEMS\",\"REPORTS\",\"USER ACCOUNTS\",\"USER TYPES\",\"APPLICATION SETTINGS\",\"SYSTEM SETTINGS\",\"ACTIVITY LOGS\"]', '2019-07-22 21:03:51', '2021-03-23 02:20:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BusinessID` (`BusinessID`),
  ADD KEY `PaymentModeID` (`PaymentModeID`);

--
-- Indexes for table `applications_approval`
--
ALTER TABLE `applications_approval`
  ADD KEY `UserID` (`CitizenID`),
  ADD KEY `ApplicationID` (`ApplicationID`);

--
-- Indexes for table `applications_foredit`
--
ALTER TABLE `applications_foredit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicationID` (`ApplicationID`);

--
-- Indexes for table `applications_forinvoice`
--
ALTER TABLE `applications_forinvoice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicationID` (`ApplicationID`);

--
-- Indexes for table `applications_forinvoice_tax_invoices`
--
ALTER TABLE `applications_forinvoice_tax_invoices`
  ADD KEY `ApplicationForInvoiceID` (`ApplicationForInvoiceID`);

--
-- Indexes for table `applications_forpermit`
--
ALTER TABLE `applications_forpermit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicationID` (`ApplicationID`);

--
-- Indexes for table `applications_forverification`
--
ALTER TABLE `applications_forverification`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicationID` (`ApplicationID`);

--
-- Indexes for table `applications_requirement`
--
ALTER TABLE `applications_requirement`
  ADD KEY `ApplicationID` (`ApplicationID`),
  ADD KEY `RequirementID` (`RequirementID`);

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BusinessTypeID` (`BusinessTypeID`);

--
-- Indexes for table `business_activities`
--
ALTER TABLE `business_activities`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicationID` (`ApplicationID`),
  ADD KEY `BusinessLineID` (`BusinessLineID`);

--
-- Indexes for table `business_lines`
--
ALTER TABLE `business_lines`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TaxVariable` (`RenewalTaxVariableID`),
  ADD KEY `NewTaxVariableID` (`NewTaxVariableID`);

--
-- Indexes for table `business_lines_tax`
--
ALTER TABLE `business_lines_tax`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BusinessLineID` (`BusinessLineID`),
  ADD KEY `OfTaxVariableID` (`OfTaxVariableID`);

--
-- Indexes for table `business_sizes`
--
ALTER TABLE `business_sizes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `business_sizes_fee`
--
ALTER TABLE `business_sizes_fee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BusinessSizeID` (`BusinessSizeID`),
  ADD KEY `FeeID` (`FeeID`),
  ADD KEY `BusinessLineID` (`BusinessLineID`);

--
-- Indexes for table `business_types`
--
ALTER TABLE `business_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fees_classification`
--
ALTER TABLE `fees_classification`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BusinessLineID` (`BusinessLineID`),
  ADD KEY `FeeID` (`FeeID`),
  ADD KEY `FeeVariableID` (`FeeVariableID`),
  ADD KEY `NewTaxVariableID` (`NewTaxVariableID`),
  ADD KEY `RenewalTaxVariableID` (`RenewalTaxVariableID`);

--
-- Indexes for table `fees_variable`
--
ALTER TABLE `fees_variable`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `requirements_classification`
--
ALTER TABLE `requirements_classification`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BusinessLineID` (`BusinessLineID`),
  ADD KEY `RequirementID` (`RequirementID`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `taxes_option`
--
ALTER TABLE `taxes_option`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `taxes_variable`
--
ALTER TABLE `taxes_variable`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UpdatePeriodID` (`UpdatePeriodID`);

--
-- Indexes for table `updates_periods`
--
ALTER TABLE `updates_periods`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD KEY `UserTypeID` (`UserTypeID`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `applications_foredit`
--
ALTER TABLE `applications_foredit`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `applications_forinvoice`
--
ALTER TABLE `applications_forinvoice`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `applications_forpermit`
--
ALTER TABLE `applications_forpermit`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `applications_forverification`
--
ALTER TABLE `applications_forverification`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business_activities`
--
ALTER TABLE `business_activities`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `business_lines`
--
ALTER TABLE `business_lines`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `business_lines_tax`
--
ALTER TABLE `business_lines_tax`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=991;

--
-- AUTO_INCREMENT for table `business_sizes`
--
ALTER TABLE `business_sizes`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_sizes_fee`
--
ALTER TABLE `business_sizes_fee`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_types`
--
ALTER TABLE `business_types`
  MODIFY `ID` tinyint(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `fees_classification`
--
ALTER TABLE `fees_classification`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=833;

--
-- AUTO_INCREMENT for table `fees_variable`
--
ALTER TABLE `fees_variable`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `ID` tinyint(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `requirements_classification`
--
ALTER TABLE `requirements_classification`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1817;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `taxes_option`
--
ALTER TABLE `taxes_option`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes_variable`
--
ALTER TABLE `taxes_variable`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `updates_periods`
--
ALTER TABLE `updates_periods`
  MODIFY `ID` smallint(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`PaymentModeID`) REFERENCES `payment_modes` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`BusinessID`) REFERENCES `businesses` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applications_approval`
--
ALTER TABLE `applications_approval`
  ADD CONSTRAINT `applications_approval_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applications_foredit`
--
ALTER TABLE `applications_foredit`
  ADD CONSTRAINT `applications_foredit_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applications_forinvoice`
--
ALTER TABLE `applications_forinvoice`
  ADD CONSTRAINT `applications_forinvoice_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applications_forinvoice_tax_invoices`
--
ALTER TABLE `applications_forinvoice_tax_invoices`
  ADD CONSTRAINT `applications_forinvoice_tax_invoices_ibfk_1` FOREIGN KEY (`ApplicationForInvoiceID`) REFERENCES `applications_forinvoice` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applications_forpermit`
--
ALTER TABLE `applications_forpermit`
  ADD CONSTRAINT `applications_forpermit_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applications_forverification`
--
ALTER TABLE `applications_forverification`
  ADD CONSTRAINT `applications_forverification_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `applications_requirement`
--
ALTER TABLE `applications_requirement`
  ADD CONSTRAINT `applications_requirement_ibfk_1` FOREIGN KEY (`RequirementID`) REFERENCES `requirements` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_requirement_ibfk_2` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `businesses`
--
ALTER TABLE `businesses`
  ADD CONSTRAINT `businesses_ibfk_1` FOREIGN KEY (`BusinessTypeID`) REFERENCES `business_types` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `business_activities`
--
ALTER TABLE `business_activities`
  ADD CONSTRAINT `business_activities_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_activities_ibfk_2` FOREIGN KEY (`BusinessLineID`) REFERENCES `business_lines` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `business_lines`
--
ALTER TABLE `business_lines`
  ADD CONSTRAINT `business_lines_ibfk_1` FOREIGN KEY (`RenewalTaxVariableID`) REFERENCES `taxes_variable` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `business_lines_ibfk_2` FOREIGN KEY (`NewTaxVariableID`) REFERENCES `taxes_variable` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `business_lines_tax`
--
ALTER TABLE `business_lines_tax`
  ADD CONSTRAINT `business_lines_tax_ibfk_1` FOREIGN KEY (`BusinessLineID`) REFERENCES `business_lines` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_lines_tax_ibfk_2` FOREIGN KEY (`OfTaxVariableID`) REFERENCES `taxes_variable` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `business_sizes_fee`
--
ALTER TABLE `business_sizes_fee`
  ADD CONSTRAINT `business_sizes_fee_ibfk_1` FOREIGN KEY (`BusinessSizeID`) REFERENCES `business_sizes` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `business_sizes_fee_ibfk_2` FOREIGN KEY (`FeeID`) REFERENCES `fees` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_sizes_fee_ibfk_3` FOREIGN KEY (`BusinessLineID`) REFERENCES `business_lines` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fees_classification`
--
ALTER TABLE `fees_classification`
  ADD CONSTRAINT `fees_classification_ibfk_1` FOREIGN KEY (`FeeID`) REFERENCES `fees` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fees_classification_ibfk_2` FOREIGN KEY (`BusinessLineID`) REFERENCES `business_lines` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fees_classification_ibfk_3` FOREIGN KEY (`FeeVariableID`) REFERENCES `fees_variable` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fees_classification_ibfk_4` FOREIGN KEY (`NewTaxVariableID`) REFERENCES `taxes_variable` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fees_classification_ibfk_5` FOREIGN KEY (`RenewalTaxVariableID`) REFERENCES `taxes_variable` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `requirements_classification`
--
ALTER TABLE `requirements_classification`
  ADD CONSTRAINT `requirements_classification_ibfk_1` FOREIGN KEY (`BusinessLineID`) REFERENCES `business_lines` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requirements_classification_ibfk_2` FOREIGN KEY (`RequirementID`) REFERENCES `requirements` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `updates`
--
ALTER TABLE `updates`
  ADD CONSTRAINT `updates_ibfk_1` FOREIGN KEY (`UpdatePeriodID`) REFERENCES `updates_periods` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `user_types` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
