-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 05, 2023 at 11:36 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `taskontology`
--
CREATE DATABASE IF NOT EXISTS `taskontology` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `taskontology`;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('691zvrksw7wnbpl67t4g4owejl23car9', 'MTQ4Y2U5ZDFlZTA4NjAzYzg5ZmQ3ODRjM2ViYzQ5ZTdjMzdkOGVjMzp7InVzZXJpcyI6Ik1lZ2hhbmEiLCJlbWFpbCI6ImFydW1hbGxhbWVnaGFuYTdAZ21haWwuY29tIiwidXNlcmlkIjoiTWVnaGFuYSIsIl9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdXSJ9', '2019-09-19 03:57:35'),
('dmxelug2kz1oi4auep3b3hhihkmffztb', 'MDM2MzBjNWIzMjIyY2M3ZjI3MjU2NjU5MzI5NzUxNzA4MzlmNWVkNTp7InVzZXJpZCI6ImFsZXgiLCJlbWFpbCI6Imx4MTYwY21AZ21haWwuY29tIiwiX21lc3NhZ2VzIjoiW1tcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiSW52YWxpZCBEZXRhaWxzXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIkludmFsaWQgRGV0YWlsc1wiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJJbnZhbGlkIERldGFpbHNcIl1dIn0=', '2019-09-18 12:56:45'),
('h89s3o3agbjccw86ow5uigyrz0k4nn3k', 'NjkxNjEzNWIyNDUwOGM2ZTZkZjJkNmRlYTcxMTIxNWJhZjk5YzRhOTp7InVzZXJpZCI6ImNvZGVib29rIiwiZW1haWwiOiJmYXphbHNpcnByb2plY3RzQGdtYWlsLmNvbSJ9', '2023-08-15 21:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_registrationmodel`
--

CREATE TABLE IF NOT EXISTS `user_registrationmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_registrationmodel`
--

INSERT INTO `user_registrationmodel` (`id`, `loginid`, `password`, `email`, `mobile`, `place`, `city`, `authkey`, `status`) VALUES
(1, 'Meghana', '123', 'arumallameghana7@gmail.com', '9676358258', 'Vuyyuru', 'Vijayawada', '27116301', 'activated'),
(2, 'Nandana', '123', 'nandana@gmail.com', '9247129626', 'Kukatapally', 'Hyderabad', '58497927', 'activated'),
(3, 'alex', 'alex', 'lx160cm@gmail.com', '9849012345', 'Ameerpet', 'Hyderabd', '22001671', 'activated'),
(4, 'john', 'john', 'john@gmail.com', '9876547857', 'hyd', 'hyd', '71402388', 'activated'),
(5, 'codebook', 'codebook', 'fazalsirprojects@gmail.com', '08555887986', 'hyd', 'hyd', '16348069', 'activated');

-- --------------------------------------------------------

--
-- Table structure for table `user_uploadmodel`
--

CREATE TABLE IF NOT EXISTS `user_uploadmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_uploadmodel`
--

INSERT INTO `user_uploadmodel` (`id`, `filename`, `file`) VALUES
(1, 'Document', 'files/pdfs/meghana_fgsevgM.txt'),
(2, 'pdf', 'files/pdfs/Research_on_Application_of_Artificial_Intelligence_in_Medical_Education.pdf'),
(3, 'Data', 'files/pdfs/1_Amalgam_Cloud_Methodology_for_Safe_Accredited_Deduplication.docx'),
(4, 'Text', 'files/pdfs/project.txt'),
(5, 'alzebra', 'files/pdfs/albarrey.txt'),
(6, 'namitha', 'files/pdfs/nagalsmi.txt'),
(7, 'data', 'files/pdfs/finalfakejobdata2.csv'),
(8, 'demo', 'files/pdfs/demo.py'),
(9, 'code', 'files/pdfs/cart.html'),
(10, 'imp', 'files/pdfs/requirements.txt'),
(11, 'server', 'files/pdfs/manage.py');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
