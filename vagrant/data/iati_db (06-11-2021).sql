-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2021 at 12:43 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iati_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_bin NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1593504385),
('m130524_201442_init', 1593504391),
('m190124_110200_add_verification_token_column_to_user_table', 1593504392);

-- --------------------------------------------------------

--
-- Table structure for table `phone_book`
--

CREATE TABLE `phone_book` (
  `id` int(11) NOT NULL,
  `sms_groups_id` int(11) NOT NULL,
  `contact_person` varchar(32) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone_book`
--

INSERT INTO `phone_book` (`id`, `sms_groups_id`, `contact_person`, `phone_no`, `address`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'Anas Shafqat', '+92-306-3772105', 'DEXDEVS', '2021-11-06 11:21:09', '2021-05-08 06:00:04', 1, 2),
(3, 2, 'Anas Shafqat Ufone', '+92-331-7375027', 'Gulshan-e-Iqbal', '2021-11-06 11:21:13', '2021-05-30 02:53:37', 4, 2),
(10, 2, 'Waleed Bin Naeem', '+92-331-6087034', 'Canal View, RYK', '2021-11-06 11:23:20', '0000-00-00 00:00:00', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sms_groups`
--

CREATE TABLE `sms_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_groups`
--

INSERT INTO `sms_groups` (`id`, `group_name`) VALUES
(1, 'Director'),
(2, 'Lecturer');

-- --------------------------------------------------------

--
-- Table structure for table `std_info`
--

CREATE TABLE `std_info` (
  `std_id` int(11) NOT NULL,
  `session` year(4) NOT NULL,
  `quotta` enum('Open Merit','Quotta') COLLATE utf8_bin NOT NULL,
  `fullname` varchar(60) COLLATE utf8_bin NOT NULL,
  `f_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `p_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `c_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `f_occupation` varchar(30) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `d_district` varchar(30) COLLATE utf8_bin NOT NULL,
  `dob` date NOT NULL,
  `age` varchar(60) COLLATE utf8_bin NOT NULL,
  `email` varchar(60) COLLATE utf8_bin NOT NULL,
  `photo` varchar(200) COLLATE utf8_bin NOT NULL,
  `n_o_copies` int(11) NOT NULL,
  `institute1` varchar(100) COLLATE utf8_bin NOT NULL,
  `board1` varchar(30) COLLATE utf8_bin NOT NULL,
  `passing_year1` year(4) NOT NULL,
  `obtain_marks1` int(11) NOT NULL,
  `total_marks1` int(11) NOT NULL,
  `admission_date` date NOT NULL,
  `grade1` varchar(10) COLLATE utf8_bin NOT NULL,
  `institute2` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `board2` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `passing_year2` year(4) DEFAULT NULL,
  `obtain_marks2` int(11) DEFAULT NULL,
  `total_marks2` int(11) DEFAULT NULL,
  `grade2` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `std_info`
--

INSERT INTO `std_info` (`std_id`, `session`, `quotta`, `fullname`, `f_name`, `p_address`, `c_address`, `f_occupation`, `phone`, `d_district`, `dob`, `age`, `email`, `photo`, `n_o_copies`, `institute1`, `board1`, `passing_year1`, `obtain_marks1`, `total_marks1`, `admission_date`, `grade1`, `institute2`, `board2`, `passing_year2`, `obtain_marks2`, `total_marks2`, `grade2`) VALUES
(35, 2020, 'Open Merit', 'Muhammad saad javed', 'Muhammad javed alam', 'fort abbas', 'fort abbas', 'farmer', '+92-308-1986284', 'bhwalnagar', '2000-12-01', '', 'saad07922@gmail.com', '', 123456, 'high school fort abbas', 'bwp', 2016, 653, 1100, '2020-07-07', 'c', 'dgree college', 'bwp', 2018, 228, 505, 'c'),
(36, 2020, 'Open Merit', 'Muhammad Adnan', 'Muhammad sharif', 'Ghady wala tahsil minchin abad Distric Bahawal nagar', 'WARD NO 11 mohala iqbal nagar TAHSIL Minchin abad', 'Farmer', '+03-316-253300_', 'Bhawal nagar', '2002-01-01', '', 'Adnansami300@gmail.com', '', 0, 'govt model school Minchin Bad', 'BWP', 2020, 290, 495, '2020-07-16', 'B', '', '', NULL, NULL, NULL, ''),
(37, 2020, 'Open Merit', 'Muhammad Uzair', 'Muhammad Anees', 'Chak 15 G,Teh Chishtian,Dist Bahawalnager', 'Chak 15 G,Teh Chishtian,Dist Bahawalnager', 'Government Teachet', '+92-300-4545015', 'Bahawalnager', '1999-08-12', '', 'uzair8490@gmail.com', '', 1, 'City science school chishtian', 'Bahawalpur', 2014, 739, 1100, '2020-07-17', 'B', '', '', NULL, NULL, NULL, ''),
(38, 2020, 'Open Merit', 'Muhammad Waseem', 'Muhammad saleem', 'Basti wasandan wali po box minchanbad', 'Basti wasandan wali po box minchanbad', 'Farmer', '+92-301-5850642', 'Bahawal nagar', '2001-09-25', '', 'Mohsnin03072420130@gmail.com', '', 0, 'Govt model high school Minchin Abad', 'BWP', 2020, 327, 505, '2020-07-20', 'C', '', '', NULL, NULL, NULL, ''),
(39, 2020, 'Open Merit', 'Jamshed Ul Hassan', 'Ashiq Muhammad', 'Chk No 68/KB PO 65/WB Teh Mailsi Distt Vehari', 'Chk No 68/KB PO 65/WB Teh Mailsi Distt Vehari', 'Farmer', '+92-301-1441878', 'Vehari', '2001-03-15', '', 'newveharinetkafe@gmail.com', '', 3, 'Govt High School 65/WB Vehari', 'Multan', 2016, 654, 1100, '2020-07-22', 'A', '', '', NULL, NULL, NULL, ''),
(40, 2020, 'Open Merit', 'Mudasir Hanif', 'Muhammad Hanif', 'Basti Bhattian, Mouza Theri Zabti, Sadiq Garh Palce post box.', 'Basti Bhattian, Mouza Theri Zabti, Sadiq Garh Palce post box.', 'Agriculture', '+92-307-7728803', 'Bahawalpur', '2000-01-08', '', 'Mudasir.Hanif.77@gmail.com', '', 3, 'Govt S.A.H/S Dera Nawab Sahib', 'Bahawalpur', 2015, 519, 1100, '2020-07-23', 'D', 'The United college of Ahmadpur East', 'Bahawalpur', 2018, 460, 1100, 'D'),
(42, 2020, 'Open Merit', 'Arslan zulfiqar', 'Zulfiqar', 'Basti nor pura dakkana jalwala frida bad tahsil minchna bad zila bahawalnagar', 'basti saeed pura dakkhana bahawalnagar hussaina bad sharqi tahsil zila bahawalnagar', 'agriculture', '+92-303-3343220', 'bahawalnagar', '2001-04-04', '', 'arslansaju925@gmail.com', '', 5, 'punjab pilot public high school for boys bahawalnagar', 'bwp', 2016, 628, 1100, '2020-07-25', 'c', 'Govt.PGC', 'bwp', 2018, 469, 1100, 'D'),
(43, 2020, 'Open Merit', 'Arslan zulfiqar', 'Zulfiqar', 'Basti nor pura dakkana jalwala frida bad tahsil minchna bad zila bahawalnagar', 'basti saeed pura dakkhana bahawalnagar hussaina bad sharqi tahsil zila bahawalnagar', 'agriculture', '+92-303-3343220', 'bahawalnagar', '2001-04-15', '', 'arslansaju925@gmail.com', '', 5, 'punjab pilot public high school for boys bahawalnagar', 'bwp', 2016, 628, 1100, '2020-07-25', 'c', 'Govt.PGC', 'bwp', 2018, 469, 1100, 'D'),
(44, 2020, 'Open Merit', 'Muhammad Shakeel', 'Abdul Hayee', 'Al Halal Book Depot Near NRSP Bank', 'Al Halal Book Depot Near NRSP Bank, Tehsil Minchinabad District Bahawalnagar', 'Agriculture', '+92-301-4398240', 'Bahawalnagar', '2002-09-20', '', 'gmsagarmcd@gmail.com', '', 5, 'Govt Model High School Minchinabad', 'Bise Bahawalpur', 2019, 587, 1100, '2020-07-25', 'C', 'Sport Certificate', 'Bise Bahawalpur', 2018, 90, 100, 'A'),
(45, 2020, 'Quotta', 'Usama Arbi', 'Ghulam Arbi', 'Zahir peer', 'zahir peer', 'Farmer', '+92-302-7667976', 'Rahim yar khan', '2020-07-29', '', 'au311294@gmail.com', '', 0, 'AL-hayyan higher secondary school zahir peer', 'Bwp', 2016, 739, 1100, '2020-07-29', 'B', 'AL-hayyan higher secondary school zahir peer', 'bwp', 2016, 739, 1100, 'B'),
(46, 2020, 'Quotta', 'Usama Arbi', 'Ghulam Arbi', 'Zahir peer', 'zahir peer', 'Farmer', '+92-302-7667976', 'Rahim yar khan', '2000-01-10', '', 'au311294@gmail.com', '', 0, 'AL-hayyan higher secondary school zahir peer', 'Bwp', 2016, 739, 1100, '2020-07-29', 'B', 'AL-hayyan higher secondary school zahir peer', 'bwp', 2016, 739, 1100, 'B'),
(47, 2020, 'Quotta', 'Munawer Shahzad', 'Muhammad Hussain', 'Chah Siddique Wala P/O Shah Pur Ubha Tehsil Shujabad District Multan', 'Chah Siddique Wala P/O Shah Pur Ubha Tehsil Shujabad District Multan', 'Nil', '+92-302-4489300', 'Multan', '1991-09-13', '', 'munawershahzad0302@gmail.com', '', 23, 'Govt. High School Shujabad', 'BISE Multan', 2006, 596, 1050, '2020-07-29', '2nd ', 'Govt. Degree College Shujabad', 'BZU Multan', NULL, NULL, NULL, ''),
(48, 2020, 'Quotta', 'Munawer Shahzad', 'Muhammad Hussain', 'Chah Siddique Wala P/O Shah Pur Ubha Tehsil Shujabad District Multan', 'Chah Siddique Wala P/O Shah Pur Ubha Tehsil Shujabad District Multan', 'Nil', '+92-302-4489300', 'Multan', '1991-09-13', '', 'munawershahzad0302@gmail.com', '', 23, 'Govt. High School Shujabad', 'BISE Multan', 2006, 596, 1050, '2020-07-29', '2nd ', 'Govt. Degree College Shujabad', 'BZU Multan', 2010, 404, 800, '2nd'),
(49, 2020, 'Open Merit', 'Muhammad Rashid', 'Ghulam Akbar', 'Chak#643T.D.A P/O Riazabad Tehsil Kot Addu distrect Muzaffar Gharh', 'Chak#643T.D.A P/O Riazabad Tehsil Kot Addu distrect Muzaffar Gharh', 'Farmer', '+92-346-4796143', 'Muzaffar Gharh', '1995-01-15', '', 'm.rashid00143@gmail.com', '', 6, 'Govt.High school Abdullah wala dhori adda (layyah)', 'Bise D.G khan', 2013, 665, 1050, '2020-07-29', 'B', '', '', NULL, NULL, NULL, ''),
(50, 2020, 'Open Merit', 'Muhammad Rashid', 'Ghulam Akbar', 'Chak#643T.D.A P/O Riazabad Tehsil Kot Addu distrect Muzaffar Gharh', 'Chak#643T.D.A P/O Riazabad Tehsil Kot Addu distrect Muzaffar Gharh', 'Farmer', '+92-346-4796143', 'Muzaffar Gharh', '1995-01-15', '', 'm.rashid00143@gmail.com', '', 0, 'Govt.High school Abdullah wala dhori adda (layyah)', 'Bise D.G khan', 2013, 639, 1050, '2020-07-29', 'B', '', '', NULL, NULL, NULL, ''),
(51, 2020, 'Open Merit', 'Muhammad Hamza', 'Muhammad Sarwer', 'Chak# 42-A/10-R, Near Niazi Chowk, Khanewal.', 'House# 1040, Colony# 3, Makki Masjid Chowk, Khanewal.', 'Agriculture', '+90-315-7836438', 'Khanewal', '1999-08-26', '', 'mazharrehman18@yahoo.com', '', 5, 'Sky Bird High School', 'BISE, Multan', 2017, 759, 1100, '2020-07-29', 'B', '', '', NULL, NULL, NULL, ''),
(52, 2020, 'Open Merit', 'Muhammad Maroof', 'Muhammad Safdar', 'Dak-Khana Khas Murli gadh Tehsil & Disst Bahawalnagar', 'Canal Rest House Dunga bunga Teshil & Disst Bahawalnagar', 'Goverment Servent', '+92-301-8979090', 'Bahawalnagar', '2004-02-28', '', 'attiqmalik410@gmail.com', '', 2, 'govt High Secondery School Dunga Bunga', 'B.I.S.E B.W.P', 2019, 362, 505, '2020-07-30', 'B', '', '', NULL, NULL, NULL, ''),
(53, 2020, 'Open Merit', 'Muhammad Shahid Asghar', 'Muhammad Asghar Khan', 'Basti Mud Mastoi Tehsil Ahmadpur East District Bahawalpur ', 'Basti Mud Mastoi Tehsil Ahmadpur East District Bahawalpur ', 'Labour ', '+92-308-4627063', 'Bahawalpur ', '2001-03-01', '', 'muhammadmubeen306@gmail.com', '', 7, 'Govt. Fazil H/S Ghumani Uch Sharif', 'Bise BWP', 2018, 634, 1100, '2020-08-03', 'C', '', '', NULL, NULL, NULL, ''),
(54, 2020, 'Quotta', 'Muhammad Shahid Asghar', 'Muhammad Asghar Khan', 'Basti Mud Mastoi Tehsil Ahmadpur East District Bahawalpur ', 'Basti Mud Mastoi Tehsil Ahmadpur East District Bahawalpur ', 'Labour ', '+92-308-4627063', 'Bahawalpur ', '2001-03-01', '', 'muhammadmubeen306@gmail.com', '', 7, 'Govt. Fazil H/S Ghumani Uch Sharif', 'Bise BWP', 2018, 634, 1100, '2020-08-03', 'C', '', '', NULL, NULL, NULL, ''),
(55, 2020, 'Open Merit', 'Muhammad Kaleem ', 'Muhammad Ghazi ', 'Basti meera qadir pur p/o fateh pur kamal tehsil khanpur district rahim yar khan ', 'Basti meera qadir pur p/o fateh pur kamal tehsil khanpur district rahim yar khan ', 'died ', '+92-303-7624599', 'Rahim Yar khan ', '2020-08-03', '', 'muhammadkaleem03037@gmail.com', '', 1, 'Govt higher seconder school qadir pur ', 'BISE Bahawal pur ', 2017, 733, 1100, '2020-08-03', 'B', 'Govt higher seconder school qadir pur ', 'BISE Bahawal pur ', 2019, 683, 1100, 'B'),
(56, 2020, 'Open Merit', 'HAFIZ MUHAMMAD AHMAD', 'MUHAMMAD ASHRAF SAJID', 'CHAK JEWAY WALA MOUZA CHOBARA TEHSIL MINCHINABAD DISTRICT BAHAWALNAGAR', 'MALIK IT CENTER NEAR BOP MINCHINABAD DISTRICT BAHAWALNAGAR', 'FARMER', '+92-306-4260456', 'BAHAWALNAGAR', '1999-07-17', '', 'ATIFMCD@GMAIL.COM', '', 1, 'PRIVATE', 'BISE BAHAWALPUR', 2019, 615, 1100, '2020-08-03', 'C', '', '', NULL, NULL, NULL, ''),
(57, 2020, 'Open Merit', 'ATIQ UR RAHMAN', 'GHULAM MUSTAFA', 'CHAK JEWAY WALA MOUZA CHOBARA TEHSIL MINCHINABAD DISTRICT BAHAWALNAGAR', 'MALIK IT CENTER NEAR BOP MINCHINABAD DISTRICT BAHAWALNAGAR', 'FARMER', '+92-331-6825376', 'BAHAWALNAGAR', '2002-12-04', '', 'ATIFMCD@GMAIL.COM', '', 1, 'GOVT MODEL H/S MINCHINABAD', 'BISE BAHAWALPUR', 2017, 685, 1100, '2020-08-03', 'B', 'ABAIDULLAH GROUP OF COLLEGES MINCHINABD', 'BISE BAHAWALPUR', 2019, 546, 1100, 'D'),
(58, 2020, 'Open Merit', 'ABDUL RAZZAQ', 'KARIM BAKSH', 'CHAK JEWAY WALA MOUZA CHOBARA TEHSIL MINCHINABAD DISTRICT BAHAWALNAGAR', 'MALIK IT CENTER NEAR BOP MINCHINABAD DISTRICT BAHAWALNAGAR', 'FARMER', '+92-301-7898105', 'BAHAWALNAGAR', '2003-02-10', '', 'ATIFMCD@GMAIL.COM', '', 1, 'PRIVATE', 'BISE BAHAWALPUR', 2018, 716, 1100, '2020-08-03', 'B', '', '', NULL, NULL, NULL, ''),
(59, 2020, 'Open Merit', 'MUHAMMAD IMRAN FIDA', 'Fida hussain', 'Basti joiya chak no 100/np', 'Tehsil khanpur ', 'Teacher', '+92-309-3604819', 'Ryk', '2000-04-18', '', 'Noumanfida5@gmail.com', '', 6, 'Bise bwp', 'Bise bwp', 2016, 792, 1100, '2020-08-04', 'A', 'Bise bwp', 'Bise bwp', 2018, 519, 1100, 'D'),
(61, 2020, 'Open Merit', 'zainab shafique', 'Muhammad Shafique', 'muhalla sraye ward no 2 near govt girls college shorkot city', 'muhalla sraye ward no 2 near govt girls college shorkot city', 'Teacher', '+92-333-6200697', 'Toba Tek Singh', '1998-09-24', '', 'zainabshafiquetts@gmail.com', '', 6, 'GGHS No1', 'BISE FsD', 2013, 818, 1050, '2020-08-04', 'A+', 'GCWUF', 'University', 2019, 1100, 1350, 'A+'),
(62, 2020, 'Open Merit', 'ABU BAKAR', 'NOOR MUHAMMAD', 'CHAK 76/4R TEHSIL HAROONABAD', 'CHAK 76/4R TEHSIL HAROONABAD', 'FARMAR', '+92-348-3822078', 'BAHAWALNAGAR', '1998-06-20', '', 'ans9393@gmail.com', '', 5, 'GOVT. CANAL HIGH SCHOOL HAROONABAD', 'BISE BAHAWALPUR', 2017, 641, 1100, '2020-08-05', 'C', '', '', NULL, NULL, NULL, ''),
(65, 2020, 'Open Merit', 'Abdul Sattar', 'Allah Yar', 'Chah Arry Wala lal bhatti P/O Qaimpur Tehsil Khairpur Tamewali District Bahawalpur', 'Chah Arry Wala lal bhatti P/O Qaimpur Tehsil Khairpur Tamewali District Bahawalpur', 'Former', '+92-300-7892352', 'Bahawalpur ', '1999-05-01', '', 'abdulsattararain678@gmail.com', '', 2, 'Young Scholars Public High school Qaimpur ', 'BISE Bahawalpur ', 2015, 666, 1100, '2020-08-11', 'B', 'Hasilpur Science College Boys Hasilpur', 'Bise Bwp', 2018, 682, 1100, 'B'),
(66, 2020, 'Open Merit', 'Sharoz', 'Zafar', 'Masom shah road House no 3 Street no 1 writers colony Multan', 'Laskri Twon near Fahad karyana store Khan pur', 'Labour ', '+03-043-377690_', 'Multan ', '1997-02-12', '', 'Sharozzafar9@gmail.com', '', 1, 'purGovt boys model High school ', 'Bahawalpur ', 2016, 585, 1100, '2020-08-12', 'C', '', '', NULL, NULL, NULL, ''),
(67, 2020, 'Open Merit', 'Sharoz', 'Zafar', 'Masom shah road House no 3 Street no 1 writers colony Multan', 'Laskri Twon near Fahad karyana store Khan pur', 'Labour ', '+03-043-377690_', 'Multan ', '1997-02-12', '', 'Sharozzafar9@gmail.com', '', 1, 'Govt boys model High school ', 'Bahawalpur ', 2016, 585, 1100, '2020-08-12', 'C', '', '', NULL, NULL, NULL, ''),
(68, 2020, 'Open Merit', 'MUHAMMAD HAMZA', 'NISAR AHMAD', 'CHAK NO 6/F P/O BAKHSHAN KHAN TEHSIL CHISHTIAN DISTRICT BAHAWALNGAR', 'CHAK NO 6/F P/O BAKHSHAN KHAN TEHSIL CHISHTIAN DISTRICT BAHAWALNGAR', 'FARMAR', '+92-301-1375042', 'BAHAWALNGAR', '2003-09-13', '', 'nisarhamza261@gmail.com', '', 16, 'GOVT.HIGH SCHOOL CHAK NO 48/F TEHSIL CHISHTIAN ', 'BISE BWP', 2019, 412, 495, '2020-08-13', 'A+', '', '', NULL, NULL, NULL, ''),
(69, 2020, 'Open Merit', 'Usama Mujeeb', 'Mujeeb Ur Rehman', 'Nawab Colony Street NO.1 Near Adalat Chowk Fort Abbas', 'Nawab Colony Street NO.1 Near Adalat Chowk Fort Abbas', 'Famer', '+92-304-9824528', 'Bahawalnagar', '1999-01-05', '', 'usamach976@gmail.com', '', 4, 'Govt.H/S Fort Abbas', 'Bahawalpur', 2014, 778, 1100, '2020-08-13', 'A', '', '', NULL, NULL, NULL, ''),
(70, 2020, 'Open Merit', 'Muhammad Nazim', 'Muhammad Ashiq', 'Chak no86/5R po khas tehisl haroonabad district bahawalnagar', 'Chak no 16/1R,Chak no 17/R Khas Tehisl Haroonabad district bahawalnagar', 'Labrar', '+92-302-5602540', 'Bahawalnagar', '1999-11-15', '', 'Chnazim645@gmail.com', '', 10, 'Govt canal high school Haroonabad abad', 'Bahawalpur Board', 2018, 765, 1100, '2020-08-14', 'B', '', '', NULL, NULL, NULL, ''),
(71, 2020, 'Quotta', 'Faisal ijaz', 'Ijaz Hussain', 'ڈاکخانہ خاص چک نمبر 477/ای۔بی   ، تحصیل و ضلع وہاڑی ', 'Vehari', 'Farmer', '+92-305-7346029', 'Vehari', '2002-08-04', '', 'ahsanijazarrain555@gmail.com', '', 1, 'Govt.higher secondary school chak No 477/E.B', 'Multan', 2019, 816, 1100, '2020-08-15', 'A', '', '', NULL, NULL, NULL, ''),
(72, 2020, 'Open Merit', 'Husnain Ali', 'Bashir Ahmad', 'Chak No 106/DNB P/O Chak No 106/DNB. Tehsil, Yazman. District, Bahawalpur', 'Chak No 106/DNB P/O Chak No 106/DNB. Tehsil, Yazman. District, Bahawalpur', 'Agiculture', '+92-304-7869404', 'Bahawalpur', '1999-11-15', '', '123jaclali106@gmail.com', '', 8, 'Governament High School 106/DNB', 'Bise Bahawalpur', 2017, 550, 1100, '2020-08-15', 'C', 'Governament High School 106/DNB', 'Bise Bahawalpur', 2017, 550, 1100, 'C'),
(73, 2020, 'Open Merit', 'RIZWAN ILYAS', 'MUHAMMAD ILYAS ', 'CHAK NO 211/F P/O 95/F CHISHTIAN DISTRICT BAHAWALNAGAR ', 'CHAK NO 211/F P/O 95/F CHISHTIAN DISTRICT BAHAWALNAGAR ', 'AGRICULTURE FIELD ASSISTANT', '+92-306-7980611', 'BAHAWALNAGAR ', '2001-09-12', '', 'geonet.ctn@gmail.com', '', 1, 'PRIVATE ', 'BISE BAHAWALPUR', 2019, 781, 1100, '2020-08-16', 'A', '', '', NULL, NULL, NULL, ''),
(74, 2020, 'Open Merit', 'Ali Akbar', 'Ahmad Ali', 'Chak Azam Cheena PO Mcleod Gunj Tehsil Minchinabad Distt. Bahawalnagar', 'Chak Azam Cheena PO Mcleod Gunj Tehsil Minchinabad Distt. Bahawalnagar', 'Farmer', '+92-306-1840205', 'Bahawalnagar', '2004-10-15', '', 'sabachh5555@gmail.com', '', 6, 'GHS Mcleod Gunj ', 'Bahawalpur', 2019, 505, 383, '2020-08-16', 'B', '', '', NULL, NULL, NULL, ''),
(75, 2020, 'Open Merit', 'Fahad Iqbal', 'Muhammad Iqbal', 'Chak No 36/DNB P/O Chak No 36/DNB. Tehsil, Yazman. District, Bahawalpur', 'Chak No 36/DNB P/O Chak No 36/DNB. Tehsil, Yazman. District, Bahawalpur', 'Agiculture', '+92-301-6447836', 'Bahawalpur', '2003-10-05', '', 'fahadiqbal3636@gmail.com', '', 8, 'Governament Model Higher Secondary School 36/DNB', 'Bise Bahawalpur', 2018, 505, 1100, '2020-08-17', 'D', 'Governament Model Higher Secondary School 36/DNB', 'Bise Bahawalpur', 2018, 505, 1100, 'D'),
(76, 2020, 'Open Merit', 'Muhammad Muslim Zia ', 'Abdul Mannan ', 'Chak No 434/6R PO Chak No 433/6R Tehsil Haroonabad District Bahawlnagar', 'Chak No 434/6R PO Chak No 433/6R Tehsil Haroonabad District Bahawlnagar', 'Former', '+92-346-4831136', 'Bahawlnagar ', '2003-07-19', '', 'muhammadmuslimzia3@gmail.com', '', 4, 'Govt High School 132/6R ', 'BISE BWP ', 2019, 715, 1100, '2020-08-17', 'B', '', '', NULL, NULL, NULL, ''),
(77, 2020, 'Open Merit', 'muhammad Zahid Javed', 'MUhammad Nawaz', 'Chak no 101/F CHishtian DIst Bahawalnagar', 'Chak no 101/F CHishtian DIst Bahawalnagar', 'Farmer', '+92-305-6696610', 'Bahawalnagar', '1997-06-30', '', 'geonet.ctn@gmail.com', '', 1, 'High School CHishtian ', 'Bise Bwp', 2017, 599, 1100, '2020-08-17', 'c', '', '', NULL, NULL, NULL, ''),
(78, 2020, 'Open Merit', 'SHAHWAIZ NASIR', 'NASIR MEHMOOD', 'C/O Shahrukh Mehmood Madni Colony Street No.5 Bahawalnagar', 'C/O Shahrukh Mehmood Madni Colony Street No.5 Bahawalnagar', 'LABOUR ', '+92-334-7003402', 'BAHAWALNAGAR', '2002-06-05', '', 'shahwaiznasirbwn@gmail.com', '', 5, 'GOVT. BOYS CITY HIGH SCHOOL BAHAWALNAGAR', 'BISE BAHAWALPUR', 2018, 855, 1100, '2020-08-18', 'A', '', '', NULL, NULL, NULL, ''),
(79, 2020, 'Quotta', 'Muhammad Qasim', 'Muhammad Ibrahim', 'Village Ayun Toriandeh Tehsil and district Lower Chitral', 'Village Ayun Toriandeh Tehsil and district Lower Chitral', 'Shopkeeper', '+92-340-6075348', 'Chitral', '2002-03-15', '', 'Safehandctl@gmail.com', '', 5, 'GHSS Ayun Chitral', 'BISEP', 2018, 667, 1100, '2020-08-18', 'B', 'GHSS Ayun Chitral', 'BISEP', 2020, 581, 1100, 'C'),
(80, 2020, 'Open Merit', 'Saqib ali', 'Imran hameed', 'Chak no 100/wm tehsil &district sahiwal', 'Chak no 100/wm tehsil &district sahiwal', 'Agriculture ', '+92-316-3852591', 'Sahiwal ', '2003-01-23', '', 'imranhameed100wm@gmail.com', '', 1, 'School ', 'Sahiwal ', 2019, 334, 505, '2020-08-19', 'C', '', '', NULL, NULL, NULL, ''),
(81, 2020, 'Open Merit', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Rind jada kharor pakka', 'Farmer', '+03-481-750649_', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845019, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-08-20', 'A', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'Male A'),
(82, 2020, 'Open Merit', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Rind jada kharor pakka', 'Farmer', '+03-481-750649_', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845019, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-08-20', 'A', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'Male A'),
(83, 2020, 'Open Merit', 'Haseeb ahmad', 'Shabbir Ahmad ', 'Chak 92 /6r  p/o 97/6r Tehsil haroonabad distric bahwalnagar ', 'Chak 92 /6r  p/o 97/6r Tehsil haroonabad distric bahwalnagar', 'Farmer ', '+03-440-924250_', 'Bahwalnagar', '2003-09-04', '', 'Hasibch463@gmail.com', '', 3, 'Govt high school 97 /6r', 'Bahwalpur ', 2019, 694, 1100, '2020-08-20', 'B', '', '', NULL, NULL, NULL, ''),
(84, 2020, 'Open Merit', 'Haseeb ahmad', 'Shabbir Ahmad ', 'Chak 92 /6r  p/o 97/6r Tehsil haroonabad distric bahwalnagar ', 'Chak 92 /6r  p/o 97/6r Tehsil haroonabad distric bahwalnagar', 'Farmer ', '+03-440-924250_', 'Bahwalnagar', '2003-09-04', '', 'Hasibch463@gmail.com', '', 3, 'Govt high school 97 /6r', 'Bahwalpur ', 2019, 694, 1100, '2020-08-20', 'B', '', '', NULL, NULL, NULL, ''),
(85, 2020, 'Open Merit', 'Rashid', 'Ishaque', 'Sheikh Zaid Palace Road, Chak # 103/P, Rahim Yar Khan', 'Sheikh Zaid Palace Road, Chak # 103/P, Rahim Yar Khan', 'Private Job', '+92-333-6000851', 'Rahim Yar Khan', '1990-04-18', '', 'rashid.ishaque@outlook.com', '', 0, 'Dewan Farooque Memorial High School', 'BISE Hyderabad', 2006, 627, 850, '2020-08-20', 'A', '', '', NULL, NULL, NULL, ''),
(86, 2020, 'Quotta', 'Rashid', 'Ishaque', 'Sheikh Zaid Palace Road, Chak # 103/P, Rahim Yar Khan', 'Sheikh Zaid Palace Road, Chak # 103/P, Rahim Yar Khan', 'Private Job', '+92-333-6000851', 'Rahim Yar Khan', '1990-04-18', '', 'rashid.ishaque@outlook.com', '', 30, 'Dewan Farooque Memorial High School', 'BISE Hyderabad', 2006, 627, 850, '2020-08-20', 'A', 'APSAC Badin', 'BISE Hyderabad', 2008, 719, 1100, 'A'),
(87, 2020, 'Open Merit', 'hafiz muzammal hussain', 'muhammad anwar', 'chak no 319w.b tehsil dunyapur district lodhran post office same', 'chak no 319w.b tehsil dunyapur district lodhran post office same', 'govt. job', '+92-345-7242678', 'lodhran', '1998-02-28', '', 'kingcomputers77@gmail.com', '', 14, 'government high school 321/w.b ', 'BISE Multan', 2013, 827, 1050, '2020-08-20', 'A', 'al rehmat college dunyapur', 'BISE Multan', 2016, 603, 1100, 'C'),
(88, 2020, 'Open Merit', 'SAQLAIN MAQSOOD', 'MUHAMMAD MAQSOOD', 'KHUSHAL SINGH TEHSIL MINCHINABAD DISTT. BAHAWALNAGAR', 'KHUSHAL SINGH TEHSIL MINCHINABAD DISTT. BAHAWALNAGAR', 'FARMER', '+92-302-1400306', 'BAHAWALNAGAR', '2004-03-04', '', 'ATIFMCD@GMAIL.COM', '', 1, 'GOVT MODEL H/S MINCHINABAD', 'BISE BAHAWALPUR', 2019, 390, 505, '2020-08-21', 'A', '', '', NULL, NULL, NULL, ''),
(89, 2020, 'Open Merit', 'Muhammad Farooq Hashim', 'Hashim Ali', 'Murad wah ward nbr #3 mecleod gunj teasel: minchinabad district: bahavalnger', 'Murad wah ward nbr #3 mecleod gunj teasel:minchinabad District: bahavalnger', 'Non', '+92-030-3495079', 'Bahavalnger', '2000-07-03', '', 'HashimMuhammadFarooq@gmail.com', '', 6, 'Private', 'Bwp', 2015, 807, 1100, '2020-08-22', 'A', '', 'Bwp', 2017, 718, 1100, 'B'),
(90, 2020, 'Open Merit', 'AHMAD EJAZ', 'MUHAMMAD EJAZ', 'House No.232-I Mohala Shah Rukan Alam Colony Multan', 'House No.232-I Mohala Shah Rukan Alam Colony Multan', 'ShopKeeper', '+92-304-6213786', 'Multan', '2003-01-05', '', 'nadeemahmadmn@gmail.com', '', 4, 'Govt. Millat High School S-Block New Multan', 'BISE Multan', 0000, 556, 1100, '2020-08-24', 'B', '', '', NULL, NULL, NULL, ''),
(91, 2020, 'Open Merit', 'MUHAMMAD ADNAN', 'GHULAM SHABBIR', 'BASTI PEER CHARAGH MOUZA RIND JADA P/O RIND JADA TEHSIL KAHROR PACCA DISTRICT LODHRAN', 'BASTI PEER CHARAGH MOUZA RIND JADA P/O RIND JADA TEHSIL KAHROR PACCA DISTRICT LODHRAN', 'FARMER', '+92-303-7281021', 'LODHRAN', '2001-05-08', '', 'sajidrind407@gmail.com', '', 5, 'GOVT. HIGH SCHOOL RIND JADA KAHROR PACCA', 'BISE MULTAN', 2017, 641, 1100, '2020-08-24', 'B', '', '', NULL, NULL, NULL, ''),
(92, 2020, 'Open Merit', 'MUHAMMAD ADNAN', 'GHULAM SHABBIR', 'BASTI PEER CHARAGH MOUZA RIND JADA P/O RIND JADA TEHSIL KAHROR PACCA DISTRICT LODHRAN', 'BASTI PEER CHARAGH MOUZA RIND JADA P/O RIND JADA TEHSIL KAHROR PACCA DISTRICT LODHRAN', 'FARMER', '+92-303-7281021', 'LODHRAN', '2001-05-08', '', 'sajidrind407@gmail.com', '', 5, 'GOVT. HIGH SCHOOL RIND JADA KAHROR PACCA', 'BISE MULTAN', 2017, 641, 1100, '2020-08-24', 'B', '', '', NULL, NULL, NULL, ''),
(93, 2020, 'Open Merit', 'Shahab Sikander', 'Sikander Hayat', 'Ward#1,p/o choubara tehsil choubara district layyah', 'Ward#1,p/o choubara tehsil choubara district layyah', 'Labour', '+92-307-6879181', 'Layyah', '2003-01-28', '', 'Shahabsikandar37@gmail.com', '', 7, 'Govt high school choubara district layyah', 'Bise dg khan', 2018, 551, 1100, '2020-08-25', 'C', '', '', NULL, NULL, NULL, ''),
(94, 2020, 'Open Merit', 'Aqib Javed', 'Abdul Latif', 'Mohallah Skiekh Ramzan Dunga Bunga Tehsil & District Bahawalnagar', 'Mohallah Skiekh Ramzan Dunga Bunga Tehsil & District Bahawalnagar', 'Agriculture', '+92-308-8156808', 'Bahawalnagar', '2005-04-15', '', 'nasirdb55@gmail.com', '', 1, 'GOVT HIGHER SECONDRY SCHOOL DUNGA BUNGA DISTRICT BAHAWALNAGAR', 'BISE BAHAWALPUR', 2020, 282, 505, '2020-08-25', 'B', '', '', NULL, NULL, NULL, ''),
(95, 2020, 'Open Merit', 'MUTEE UR REHMAN', 'NAZIR AHMAD', 'WARD NO 4 BLOCH NO 3 AHMAD PUR MECLOAD GUNJ TEHSIL MINCHINABAD DISTT. BAHAWALNAGAR', 'WARD NO 4 BLOCH NO 3 AHMAD PUR MECLOAD GUNJ TEHSIL MINCHINABAD DISTT. BAHAWALNAGAR', 'GOVT TEACHER', '+92-308-9125767', 'BAHAWALNAGAR', '2001-03-02', '', 'ATIFMCD@GMAIL.COM', '', 1, 'PRIVATE', 'BISE BAHAWALPUR', 2016, 597, 1100, '2020-08-26', 'C', '', '', NULL, NULL, NULL, ''),
(96, 2020, 'Open Merit', 'MUNEEB HUSSAIN', 'MUNIR HUSSAIN', 'CHAK NO. 167/7R POST OFFICE CHAK NO.166/7R TEHSIL FORTABBAS DISTRICT BAHAWALAGAR.', 'CHAK NO. 167/7R POST OFFICE CHAK NO.166/7R TEHSIL FORTABBAS DISTRICT BAHAWALAGAR.', 'RETIRED BAILDAR Agriculture De', '+92-306-9583877', 'BAHAWALNAGAR', '2002-06-02', '', 'anjummubeen418@gmail.com', '', 10, 'GOVT. H/S CHAK 165/7R', 'BISE BAHAWALPUR', 2019, 450, 505, '2020-08-26', 'A+', 'JAMIA RIZVIA MAZHAR UL ALOOM FORTABBAS', 'JAMIA RIZVIA MAZHAR UL ALOOM F', 2016, 0, 0, '0'),
(97, 2020, 'Open Merit', 'RASHID MUNIR', 'MUNIR HUSSAIN', 'CHAK NO. 167/7R POST OFFICE CHAK NO.166/7R TEHSIL FORTABBAS DISTRICT BAHAWALAGAR.', 'CHAK NO. 167/7R POST OFFICE CHAK NO.166/7R TEHSIL FORTABBAS DISTRICT BAHAWALAGAR.', 'RETIRED BAILDAR Agriculture De', '+92-306-9583877', 'BAHAWALNAGAR', '2000-02-01', '', 'anjummubeen418@gmail.com', '', 10, 'GOVT. H/S CHAK 165/7R', 'BISE BAHAWALPUR', 2019, 409, 495, '2020-08-26', 'A+', 'JAMIA RIZVIA MAZHAR UL ALOOM FORTABBAS', 'JAMIA RIZVIA MAZHAR UL ALOOM F', 2016, 0, 0, '0'),
(98, 2020, 'Open Merit', 'MUHMMAD AWAIS', 'TAHIR LATIF', 'CHAK # 41/12-L CHICHAWATNI', 'CHAK # 41/12-L CHICHAWATNI', 'FARMING', '+92-304-0950641', 'SAHIWAL', '2003-03-22', '', 'MPS2810@GMAIL.COM', '', 1, 'GOVT MC MODEL HIGH SCHOOL CHIHCAWATNI', 'BISE SAHIWAL', 2019, 277, 505, '2020-08-26', 'A', '', '', NULL, NULL, NULL, ''),
(99, 2020, 'Quotta', 'Shahzad Ahmad', 'Bashir Ahmad', 'Basti khera near Govt. boys Degree college p/o Rangpur tehsil and district Muzaffargarh', 'basti khera near boys degree college p/o rangpur tehsil and distric muzaffargarh', 'Field Assistant Agriculture', '+92-301-0174095', 'Muzaffargarh', '2004-01-05', '', 'hadukhan309@gmail.com', '', 3, 'Govt High School Rangpur ', 'BISE D G khan', 2019, 309, 505, '2020-08-26', 'A', 'Govt High School Rangpur', 'BISE D G khan', 2020, 246727, NULL, 'waiting'),
(100, 2020, 'Open Merit', 'MUHAMMAD HASEEB', 'ABDUL SATTAR', 'HOUSE NO. 511, STREET NO. 10, HABIB COLONY BUREWALA DISTRICT VEHARI', 'HOUSE NO. 511, STREET NO. 10, HABIB COLONY BUREWALA DISTRICT VEHARI', 'TEACHING', '+92-300-7594819', 'VEHARI', '2003-06-01', '', 'vickymalikud@gmail.com', '', 1, 'GOVT. MC MODEL HIGH SCHOOL BUREWALA', 'MULTAN BOARD', 2019, 330, 505, '2020-08-26', 'C', '', '', NULL, NULL, NULL, ''),
(101, 2020, 'Open Merit', 'TAYYAB MAHMOOD', 'KHALID MAHMOOD', 'Chak no 2Eb post office Malka Hans Tehsil Arifwala District Pakpattan', 'As permanant', 'Agriculture, retired agri insp', '+92-301-5833350', 'Pakpattan', '1998-06-02', '', 'tch66025@gmail.com', '', 2, 'Bise sahiwal', 'Bise sahiwal', 2015, 636, 1100, '2020-08-27', 'C', 'Nil', 'Nil', 2000, 0, 0, '0'),
(102, 2020, 'Open Merit', 'Umair Majeed', 'Abdul Majeed', 'Chak No. 281/HR Tehsil Fort Abbas District Bahawalnagar', 'Chak No. 281/HR Tehsil Fort Abbas District Bahawalnagar', 'Farmer', '+92-307-8637598', 'Bahawalnagar', '2002-04-05', '', 'mians773@gmail.com', '', 4, 'GHS 279/HR', 'BISE Bahawalpur', 2019, 297, 505, '2020-08-27', 'C', '', '', NULL, NULL, NULL, ''),
(103, 2020, 'Open Merit', 'Muhammad Umar', 'Muhammad Mukhtar', 'Chak No. 281/HR Tehsil Fort Abbas District Bahawalnagar', 'Chak No. 281/HR Tehsil Fort Abbas District Bahawalnagar', 'Farmer', '+92-207-001578_', 'Bahawalnagar', '2003-07-15', '', 'mians773@gmail.com', '', 4, 'GHS 279/HR', 'BISE Bahawalpur', 2019, 187, 505, '2020-08-27', 'D', '', '', NULL, NULL, NULL, ''),
(104, 2020, 'Open Merit', 'Muhammad Riaz ', 'Allah Ditta ', 'Basti Islam abad mauza Rind Jada Tehsil Kehror Pacca district Lodhran ', 'Basti Islam abad mauza Rind Jada Tehsil Kehror Pacca district Lodhran ', 'Farming ', '+03-042-545083_', 'Lodhran ', '1998-11-09', '', 'hriaz3011@gmail.com', '', 2, 'Govt higher secondary school Rind Jada ', 'Multan ', 2014, 868, 1100, '2020-08-28', 'A', '', '', NULL, NULL, NULL, ''),
(105, 2020, 'Open Merit', 'Muhammad Riaz ', 'Allah Ditta ', 'Basti Islam abad mauza Rind Jada Tehsil Kehror Pacca district Lodhran ', 'Basti Islam abad mauza Rind Jada Tehsil Kehror Pacca district Lodhran ', 'Farming ', '+03-042-545083_', 'Lodhran ', '1998-11-09', '', 'hriaz3011@gmail.com', '', 2, 'Govt higher secondary school Rind Jada ', 'Multan ', 2014, 868, 1100, '2020-08-28', 'A', '', '', NULL, NULL, NULL, ''),
(106, 2020, 'Open Merit', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Rind jada kharor pakka', 'Farmer', '+03-138-285201_', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845019, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-08-28', 'B', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'B'),
(107, 2020, 'Open Merit', 'MUHAMMAD MURAD ASHRAF', 'MUHAMMAD ASHRAF', 'MOUZA SHAHBAZ PUR TEHSIL MINCHINABAD DISTT. BAHAWALNAGAR', 'MOUZA SHAHBAZ PUR TEHSIL MINCHINABAD DISTT. BAHAWALNAGAR', 'FARMER', '+92-306-4201915', 'BAHAWALNAGAR', '1999-03-03', '', 'ATIFMCD@GMAIL.COM', '', 1, 'GOVT. HIGH SCHOOL FIDAI SHAH MINCHINABAD', 'BISE BAHAWALPUR', 2019, 322, 505, '2020-08-29', 'B', '', '', NULL, NULL, NULL, ''),
(108, 2020, 'Quotta', 'Muhammad Junaid', 'Shah Muhammad Khan', 'Mohalla bakar khel  HSD Peshawar ( F.R Peshawar )', 'Mohalla bakar khel  HSD Peshawar ( F.R Peshawar )', 'Driver', '+92-336-9209959', 'Peshawar', '1999-06-14', '', 'alamafridi70@gmail.com', '', 5, 'Takbeer Model High School', 'BISEP', 2015, 729, 1100, '2020-08-29', 'C', 'Takbeer Model High School', 'BISEP', 2017, 624, 1100, 'C'),
(109, 2020, 'Quotta', 'Asad Ahmad', 'Habib', 'Mohalla tota khel Mandai shamshato Hassan khel Sub-Division Peshawar ( F.R Peshawar )', 'Mohalla tota khel Mandai shamshato Hassan khel Sub-Division Peshawar ( F.R Peshawar )', 'Teacher', '+92-349-8768790', 'Peshawar', '2000-04-01', '', 'afridiasad686@gmail.com', '', 5, 'Takbeer Model High School', 'BISEP', 2017, 819, 1100, '2020-08-29', 'A', 'Govt. higher secondry school sama bada ber F.R Peshawar', 'BISEP', 2019, 646, 1100, 'C'),
(110, 2020, 'Quotta', 'Asad Ahmad', 'Habib Ur Rahman', 'Mandai Shamshato Tota Khel Hassan Khel Sub Division Peshawar', 'Mandai Shamshato Tota Khel Hassan Khel Sub Division Peshawar', 'Government Teacher', '+92-349-8768790', 'Peshawar', '2000-04-01', '', 'afridiasad686@gmail.com', '', 7, 'TAKBEER MODEL HIGH SCHOOL', 'BISEP', 2017, 819, 1100, '2020-08-29', 'A', 'GOVT. SHAHEED MUHAMMAD ZEESHAN HIGHER SECONDRY SCHOOL SAMA BADA BER HSD PESHAWAR', 'BISEP', 2019, 646, 1100, 'C'),
(111, 2020, 'Quotta', 'Muhammad Fazal', 'Allah Bachya', 'Chak No 10/M Tehsil Dunyapur District Lodhran', 'Chak No 10/M Tehsil Dunyapur District Lodhran', 'other', '+92-341-3328983', 'lodhran', '1997-06-24', '', 'saqibcomputersdnp@gmail.com', '', 2147483647, 'Lodhran', 'Multan', 2019, 550, 1100, '2020-08-31', 'C', '', '', NULL, NULL, NULL, ''),
(112, 2020, 'Open Merit', 'Muhammad Fazal', 'Allah Bachaya', 'Chak NO 10/M P/O Dunyapur District Lodhran', 'Chak NO 10/M P/O Dunyapur District Lodhran', 'Farmer', '+92-341-3328983', 'Lodhran', '1997-06-24', '', 'saqibcomputersdnp@gmail.com', '', 1, 'Matric', 'Bise Multan', 2019, 550, 1100, '2020-08-31', 'B', '', '', NULL, NULL, NULL, ''),
(113, 2020, 'Open Merit', 'MUHAMMAD AAMR RIAZ', 'RIAZ AHMAD KHAN', 'BASTI NAWAZABAD P/O SAHJA TEHSIL KHANPUR DISTRICT RYK', 'C/O PUNJAB PHOTOSTATE MODEL TOWN A KHANPUR DISTRICT RYK', 'FARMER', '+92-305-3730936', 'RAHIM YAR KHAN', '1994-07-12', '', 'maamirkhan914@gmail.com', '', 1, 'GOVT MODEL SECONDARY SCHOOL KHANPUR ', 'BISE BWP', 2011, 744, 1050, '2020-08-31', 'B', '', '', NULL, NULL, NULL, ''),
(114, 2020, 'Quotta', 'Muhammad Fazal', 'Allah Bachaya', 'Chak NO 10/M P/O Dunyapur District Lodhran', 'Chak NO 10/M P/O Dunyapur District Lodhran', 'Field Assistant', '+92-341-3328983', 'Lodhran', '1997-06-24', '', 'saqbicomputersdnp@gmail.com', '', 1, 'Matric', 'Bise Multan', 2019, 550, 1100, '2020-08-31', 'B', '', '', NULL, NULL, NULL, ''),
(115, 2020, 'Open Merit', 'Muhammad furqan', 'Muhammad Yasin', 'Nazir colony Main Road Tehsil Bahawalnagar', 'Nazir Colony Main Road Tehsil Bahawalnagar', 'Landlord', '+92-343-3288026', 'Bahawalnagar Distc', '2002-09-22', '', 'Furqanyasin704@gmail.com', '', 1, 'Govt  Model H/s colony Bahwalnagar', 'Bise Bwp', 2017, 941, 1100, '2021-05-30', 'A+', '', '', NULL, NULL, NULL, ''),
(116, 2020, 'Open Merit', 'Muhammad furqan', 'Muhammad Yasin', 'Nazir colony Main Road Tehsil Bahawalnagar', 'Nazir Colony Main Road Tehsil Bahawalnagar', 'Landlord', '+92-307-2386360', 'Bahawalnagar Distc', '2002-09-22', '', 'Furqanyasin704@gmail.com', '', 2, 'Govt  Model H/s colony Bahwalnagar', 'Bise Bwp', 2017, 941, 1100, '2020-08-31', 'A+', '', '', NULL, NULL, NULL, ''),
(117, 2020, 'Open Merit', 'Shahraz Ghafoor ', 'Abdul Ghafoor', 'Basti Moti pur shahbaz pur thesil Minchanabad', 'Basti Moti pur shahbaz pur Tehsil Minchanabad', 'Landlord', '+92-304-6910336', 'Dist Bahawalnagar Thesil Minch', '2002-12-10', '', 'Furqanyasin704@gmail.com', '', 1, 'Govt  Model H/s colony Minchanabad', 'Bise Bwp', 2017, 798, 1100, '2020-08-31', 'A', '', '', NULL, NULL, NULL, ''),
(118, 2020, 'Quotta', 'Muhammad ijaz', 'Allah wassaya', 'Bwp', 'Bwp', 'Farmer', '+92-306-3772105', 'Bwo', '2001-02-27', '', 'Ijazkhanrind57@gmail.com', '', 845017, 'Govt.high school bwp', 'Bwp', 2016, 1066, 1100, '2021-05-30', 'A', '', '', NULL, NULL, NULL, ''),
(119, 2020, 'Quotta', 'Muhammad ijaz', 'Allah wassaya', 'Bwp', 'Bwp', 'Farmer', '+03-487-027760_', 'Bwo', '2001-02-27', '', 'Ijazkhanrind57@gmail.com', '', 845017, 'Govt.high school bwp', 'Bwp', 2016, 1066, 1100, '2020-08-31', 'A', 'Govt svhool bwp', 'Bwp', 2019, 10066, 1100, 'A'),
(120, 2020, 'Open Merit', 'Husnain Ali', 'Akhtar Ali', 'Chak 146/ Murad Teshil Hasilpur District Bahawalpur', 'Chak 146/ Murad Tehisl Hasilpur District Bahawalpur', 'Farmer', '+92-305-3791646', 'Bahawalpur', '2003-04-12', '', 'ansarsahi.646@gmail.com', '', 0, 'Private', 'BISE BWP', 2020, 266, 505, '2020-08-31', 'c', '', '', NULL, NULL, NULL, ''),
(121, 2020, 'Open Merit', 'TAYABA SHAHEEN ', 'MUHAMMAD MUMTAZ ', 'CHAK NO 65/EB BAKHA RATH ARIFWALA TEHSILARIFWALA', 'CHAK NO 65/EB BAKHA RATH ARIFWALA TEHSILARIFWALA', 'FARMER ', '+90-347-8023276', 'PAKPATTAN', '2001-06-15', '', 'abonlinearifwala@gmail.com', '', 4, 'GOVT G M C MODEL H SCHOOL ARIFWALA', 'BISE SAHIWAL', 2019, 648, 1100, '2020-08-31', 'C', '', '', NULL, NULL, NULL, ''),
(122, 2020, 'Open Merit', 'JAWAD AHMAD', 'MIAN MUHAMMAD  ASIF', 'HOUSE # 10 STREET # 1FARM ROAD MADINA TOWN PHASE 2 KHANEWAL', 'HOUSE # 10 STREET # 1FARM ROAD MADINA TOWN PHASE 2 KHANEWAL', 'DIED', '+92-300-4907721', 'KHANEWAL', '2002-07-03', '', '03126047271JAWAD@GMAIL.COM', '', 3, 'SCIENCE H.S.S (BOYS), KHANEWAL', 'MULTAN', 2018, 752, 1100, '2020-08-31', 'B +', '', '', NULL, NULL, NULL, ''),
(123, 2020, 'Open Merit', 'ALI YAZDAN', 'ABID HUSSAIN', 'CHAK NO 67/E.B ARIFWALA', 'CHAK NO 67/E.B ARIFWALA', 'SERVANT', '+92-344-6973714', 'PAKPATTAN', '2003-12-30', '', 'epssarifwala@gmail.com', '', 1, 'MISALI ZIKRIA PUBLIC SCHOOL ARIFWAAL', 'BISE SAHIWAL', 2020, 650, 1100, '2020-09-03', 'B', '', '', NULL, NULL, NULL, ''),
(124, 2020, 'Open Merit', 'NOOR FATIMA', 'KHADIM HUSSAIN', 'CHAK NO. 2/G, Tehsil Chishtian, District Bahawalnagar', 'CHAK NO. 2/G, Tehsil Chishtian, District Bahawalnagar', 'Deceased', '+92-346-7558034', 'Bahawalnagar', '2002-10-01', '', 'mpsctnpk@gmail.com', '', 1, 'GOVT. G. H/S CHAK 6/G CHISHTIAN', 'BISE BWP', 2019, 710, 1100, '2020-09-04', 'B', '', '', NULL, NULL, NULL, ''),
(125, 2020, 'Open Merit', 'Muhammad Nazim', 'Muhammad Ashiq', 'Chak no86/5R po khas tehisl haroonabad district bahawalnagar', 'Chak no 16/1R,Chak no 17/R Khas Tehisl Haroonabad district bahawalnagar', 'Labrarr', '+92-302-5602540', 'Bahawalnagar', '1999-11-15', '', 'Chnazim645@gmail.com', '', 10, 'Govt canal high school Haroonabad abad', 'Bahawalpur Board', 2018, 765, 1100, '2020-09-04', 'B', '', '', NULL, NULL, NULL, ''),
(126, 2020, 'Open Merit', 'Muhammad Tahla', 'Muhammad Sarwar', 'Kaat baghwali chak Aziz din p/o dunga bunga teh & distt Bahawalnagar', 'Kaat baghwali chak Aziz din p/o dunga bunga teh & distt Bahawalnagar', 'Retired army soldier', '+92-307-5878871', 'Bahawalnagar', '2004-05-10', '', 'maqibjaved480@gmail.com', '', 2, 'GHSS dunga bunga Bahawalnagar', 'Bise bwp', 2019, 323, 515, '2020-09-05', 'B', '', '', NULL, NULL, NULL, ''),
(127, 2020, 'Open Merit', 'Mubashar Hamad Tahir ', 'Abdul Majeed Tahir ', 'Chak No 50/12L Tehsil Chichawatni distric Sahiwal ', 'Chak No 50 /12L Tehsil Chichawatni distric Sahiwal ', 'Late(Former employer ', '+92-300-8709350', 'Sahiwal ', '2002-05-07', '', 'tahirabbas9350@gmail.com', '', 2, 'Govt. High school 50/12-L,Chichawatni, Sahiwal ', 'Sahiwal ', 0000, 238, 495, '2020-09-05', 'B', '', '', NULL, NULL, NULL, ''),
(128, 2020, 'Open Merit', 'Shahzad Tahir', 'Parvaiz Ahmad', 'Chak No 50/12-L Tehsil Chichawatni distric Sahiwal ', 'Chak No 50 /12-L Tehsil Chichawatni distric Sahiwal ', 'Formar', '+92-302-9728682', 'Sahiwal ', '1999-02-09', '', 'tahirabbas9350@gmail.com', '', 2, 'Govt high school 50/12-L, Chichawatni, Sahiwal ', 'Sahiwal', 2015, 594, 1100, '2020-09-06', 'C', 'Govt higher secondary school 45/12-L, Chichawatni, Sahiwal ', 'Sahiw', 2019, 506, 1100, 'D'),
(129, 2020, 'Open Merit', 'MUHAMMAD AZHAR ', 'MUHAMMAD IRSHAD ', 'CHAK NO 71/EB TEKHWAN SHARIF ARIFWALA TEHSIL ARIFWALA ', 'CHAK NO 71/EB TEKHWAN SHARIF ARIFWALA TEHSIL ARIFWALA ', 'FARMER ', '+92-300-0978740', 'PAKPATTAN', '2002-02-02', '', 'lordfaisal99@gmail.com', '', 4, 'GHOUS TECHNICAL  INSTITURE GOVT MIDDLE SCHOOL NO 2 ', 'PBTE LAHORE ', 2017, 916, 1350, '2020-09-06', 'B', '', '', NULL, NULL, NULL, ''),
(130, 2020, 'Open Merit', 'Ali Asghar', 'Muhammad Hassan lodhi', 'Moza gandha singh tehsil Minchin abad district bahawal nagar', 'Moza gandha singh tehsil Minchin abad district bahawal nagar ', 'Farmer', '+92-300-7922089', 'Bahawal nagar', '2002-03-22', '', 'musmanlodhi786pti9266@gmail.com', '', 0, 'Govt. H/S Minchin abad', 'Bwp', 2019, 317, 505, '2020-09-06', 'B', '', '', NULL, NULL, NULL, ''),
(131, 2020, 'Open Merit', 'ABDUL QADIR RIAZ', 'RIAZ AHMAD SHAHID', 'BAGH O BAHAR ROAD ADA CHAR MEEL MOUZA NAIL GARH BASTI KKURSHAID ABAD P/O KHANPUR DISTRICT RYK', 'RIAZ AHMAD SHAH (MIC) THQ HOSPITAL KHANPUR DISTRICT RAHIM YAR KHAN', 'GOVT SERVANT', '+92-308-7600596', 'RAHIM YAR KHAN', '1996-09-11', '', 'jamshakir596@gmail.com', '', 1, 'GOVT COLONY HIGH SCHOOL KHANPUR ', 'BISE BWP', 2010, 513, 1050, '2020-09-06', 'D', 'PVTC LAHORE', 'PVTC LAHORE', 2017, 90, 100, 'A+'),
(132, 2020, 'Open Merit', 'Arslan Saeed', 'Saeed Ahmad', 'Chak No 16/DNB P/O Chak No 16/DNB. Tehsil, Yazman. District, Bahawalpur', 'Chak No 16/DNB P/O Chak No 16/DNB. Tehsil, Yazman. District, Bahawalpur', 'Agiculture', '+92-306-8207805', 'Bahawalpur', '1999-11-28', '', '123jaclali106@gmail.com', '', 8, 'Al Badar Public School Headrajkan', 'Bise Bahawalpur', 2018, 491, 1100, '2020-09-08', 'D', 'Al Badar Public School Headrajkan', 'Bise Bahawalpur', 2018, 491, 1100, 'D'),
(133, 2020, 'Open Merit', 'HAMZA SALEEM', 'MUHAMMAD SALEEM AKHTAR', 'Madni colony Bahawalnagar', 'Madni colony Bahawalnagar', 'AGRI', '+92-300-5028737', 'BAHAWALNAGAR', '2002-09-25', '', 'NIL@GMAIL.COM', '', 1, 'Govt HS Azize Millat', 'BISE BWP', 2019, 238, 505, '2020-09-08', 'C', '', '', NULL, NULL, NULL, ''),
(134, 2020, 'Open Merit', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Rind jada kharor pakka', 'Farmer', '+92-313-8285201', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845019, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-09-09', 'B', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'B'),
(135, 2020, 'Quotta', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Rind jada kharor pakka', 'Farmer', '+03-481-750649_', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845019, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-09-09', 'B', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'B'),
(136, 2020, 'Quotta', 'Shahzad Ahmad', 'Bashir Ahmad', 'Near govt. Boys Degree College post office Rangpur tehsil and district Muzaffargarh', 'basti khera near boys degree college p/o rangpur tehsil and distric muzaffargarh', 'Field Assistant Agriculture', '+92-301-0174095', 'Muzaffargarh', '2004-01-05', '', 'hadukhan309@gmail.com', '', 6, 'Govt High School Rangpur ', 'BISE D G khan', 2019, 309, 505, '2020-09-09', 'A', '', '', NULL, NULL, NULL, ''),
(137, 2020, 'Open Merit', 'Abdul Wahab', 'Muhammad Athar', 'House#2, Street#01, Mian Ghulam Rasool Colony Sadiqabad', 'House#2, Street#01, Mian Ghulam Rasool Colony Sadiqabad', 'Government Teacher', '+92-307-2369485', 'Rahim Yar Khan', '2001-10-08', '', 'aliathar2369@gmail.com', '', 7, 'Allama Iqbal Open University Islamabad', 'AIOU Islamabad', 2019, 781, 1200, '2020-09-09', 'B', '', '', NULL, NULL, NULL, ''),
(138, 2020, 'Open Merit', 'Shahzad Ahmad', 'Bashir Ahmad', 'Near govt. Boys Degree College post office Rangpur tehsil and district Muzaffargarh', 'basti khera near boys degree college p/o rangpur tehsil and distric muzaffargarh', 'Field Assistant Agriculture', '+92-301-0174095', 'Muzaffargarh', '2004-01-05', '', 'hadukhan309@gmail.com', '', 6, 'Govt High School Rangpur ', 'BISE D G khan', 2019, 309, 505, '2020-09-09', 'A', '', '', NULL, NULL, NULL, ''),
(139, 2020, 'Quotta', 'Sanwal', 'Ali', 'Ryk', 'Ryk', 'Chair man uni', '+03-481-750650_', 'Ryk', '2011-03-02', '', 'Sanewal56@gmail.com', '', 845016, 'Govt xmschool ryk', 'Bwp', 2016, 456, 1100, '2020-09-12', 'D', 'Govt scholl ryk', 'Bwp', 2016, 456, 1100, 'C'),
(140, 2020, 'Quotta', 'Sanwal', 'Ali', 'Ryk', 'Ryk', 'Chair man uni', '+03-481-750650_', 'Ryk', '2011-03-02', '', 'Sanewal56@gmail.com', '', 845016, 'Govt xmschool ryk', 'Bwp', 2016, 456, 1100, '2020-09-12', 'D', 'Govt scholl ryk', 'Bwp', 2016, 456, 1100, 'C'),
(141, 2020, 'Open Merit', 'muhammad azhar', 'nazar hussain khan', 'basti rabnawaz khan rind p/o rasool pur tehsil sadiqabad district rahim yar khan', 'basti rabnawaz khan rind p/o rasool pur tehsil sadiqabad district rahim yar khan', 'no', '+92-308-2209404', 'rahim yar khan', '2000-04-01', '', 'azarkhan8344673@gmail.com', '', 1, 'kotla hayat', 'bahawal pur board', 2017, 763, 1100, '2020-09-14', 'b', '', '', NULL, NULL, NULL, ''),
(142, 2020, 'Open Merit', 'altaf hussain', 'irshad ahmad', 'basti rais allah wasaya p/o akrama abad tehsil rahim yar khan district rahim yar khan', 'basti rais allah wasaya p/o akrama abad tehsil rahim yar khan district rahim yar khan', 'no', '+92-306-2878240', 'rahim yar khan', '2001-07-16', '', 'altafrais726@gmail.com', '', 1, 'kotla hayat', 'bahawal pur board', 2017, 630, 1100, '2020-09-14', 'c', '', '', NULL, NULL, NULL, ''),
(143, 2020, 'Open Merit', 'muhammad bilal', 'tariq mehmood saeed', 'basti pitafi p/o muhammad pur tehsil sadiqabad district rahim yar khan', 'basti pitafi p/o muhammad pur tehsil sadiqabad district rahim yar khan', 'no', '+92-308-8391124', 'rahim yar khan', '2002-12-22', '', 'bilalkhanpitafi974@gmail.com', '', 1, 'kotla hayat', 'bahawal pur board', 2017, 589, 1100, '2020-09-14', 'c', '', '', NULL, NULL, NULL, ''),
(144, 2020, 'Quotta', 'Ali Akbar', 'Ahmad Ali', 'Chak Azam Chheena PO Mcleod Gunj Tehsil Minchinabad Distt. Bahawalnlagar', 'Chak Azam Chheena PO Mcleod Gunj Tehsil Minchinabad Distt. Bahawalnlagar', 'Agriculture', '+92-306-1840205', 'Bahawalnagar', '2004-10-15', '', 'aliakbarchhena@gmail.com', '', 6, 'GHSS Mcleod Gunj Tehsil Minchinabad ', 'BISE Bahawalpur', 2019, 383, 505, '2020-09-14', 'B', '', '', NULL, NULL, NULL, ''),
(145, 2020, 'Open Merit', 'Muhammad Faisal', 'Naseer Ahmad ', 'Basti Master ali Jadid Bahawalgarh Minchinabad', 'Basti Master ali Jadid Bahawalgarh Minchinabad', 'Shopkeeper', '+92-304-6466129', 'Bahawalnagar', '1999-01-02', '', 'vhfaisal575@gmail.com', '', 1, 'Govt H/S Chaki Faiq Minchinabad', 'BISE BWP', 2018, 638, 1100, '2020-09-15', 'C', 'Degree College Minchinabd ', 'BISE BWP', 2019, 331, 535, 'B'),
(146, 2020, 'Open Merit', 'Sarfaraz Ahmad', 'Muhammad Usman', 'Basti Talliwala Teh Minchinabad Dist Bahawalnagar', 'Basti Talliwala Teh Minchinabad Dist Bahawalnagar', 'Farmer', '+92-303-7137732', 'Bahawalnagar', '1998-02-05', '', 'vhfaisal575@gmail.com', '', 1, 'Govt Model H/S Minchinabad', 'BISE BWP', 2018, 660, 1100, '2020-09-15', 'B', 'Degree College Minchinabd ', 'BISE BWP', 2019, 252, 535, 'C'),
(147, 2020, 'Open Merit', 'Ridda zainab', 'Muhammad Fiaz', 'Chachran Sharif', 'Chachran Sharif', 'Chachran Sharif', '+03-321-630638_', 'Rahim yar khan', '2001-10-19', '', 'sundaisa.abru11@gmail.com', '', 0, 'AIOU Islamabad', 'Aiou', 2020, 798, 1100, '2020-09-15', 'A', '', '', NULL, NULL, NULL, ''),
(148, 2020, 'Open Merit', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Rind jada kharor pakka', 'Farmer', '+03-138-285201_', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845017, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-09-15', 'B', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'B'),
(149, 2020, 'Open Merit', 'Haseeb ahmad', 'Shabbir Ahmad ', ' چک نمبر/ 92آر . ڈاک خاںہ97 آر97/6. تصیل ہارون آباد.. ضلع بہاولنگر ', ' چک نمبر/ 92آر . ڈاک خاںہ97 آر97/6. تصیل ہارون آباد.. ضلع بہاولنگر ', 'Farmer ', '+34-409-24250__', 'بہاولنگر ', '2003-09-04', '', 'Hasibch676@gmail.com', '', 3, 'Government high school 97/6r', 'Bwp', 2019, 694, 1100, '2020-09-16', 'B', '', '', NULL, NULL, NULL, ''),
(150, 2020, 'Open Merit', 'Zia ch', 'Muneeb ch', ' چک نمبر/ 95آر . ڈاک خاںہ97 آر97/6. تصیل ہارون آباد.. ضلع بہاولنگر ', ' چک نمبر/ 95آر . ڈاک خاںہ97 آر97/6. تصیل ہارون آباد.. ضلع بہاولنگر ', 'Business mam', '+03-440-924250_', 'بہاولنگر ', '2002-05-09', '', 'Hasibch7397@gmail.com', '', 3, 'Government high school 100/6r', 'Bwp', 2019, 853, 1100, '2020-09-16', 'A', '', '', NULL, NULL, NULL, ''),
(151, 2020, 'Open Merit', 'Muhammad Zeeshan Aslam', 'Muhammad Aslam Zahid', 'Chak No 123P, PO: Chak No 125P, Tehsil/District Rahim Yar Khan', 'Rehmat Colony, Manthar Road (Near Country Club Marriage Hall) Rahim Yar Khan', 'Retired from Pakistan Army', '+92-321-5071380', 'Rahim Yar Khan', '2003-03-08', '', 'z03130931616@gmail.com', '', 16, 'Knowledge House Grammer Boys High School, Rahim Yar Khan', 'Bahawalpur', 2019, 261, 495, '2020-09-17', 'D', '', '', NULL, NULL, NULL, ''),
(152, 2020, 'Quotta', 'Muhammad Zeeshan Aslam', 'Muhammad Aslam Zahid', 'Chak No 123P, PO: Chak No 125P, Tehsil/District Rahim Yar Khan', 'Rehmat Colony, Manthar Road (Near Country Club Marriage Hall) Rahim Yar Khan', 'Retired from Pakistan Army', '+92-321-5071380', 'Rahim Yar Khan', '2023-03-08', '', 'z03130931616@gmail.com', '', 17, 'Knowledge House Grammer Boys High School, Rahim Yar Khan', 'Bahawalpur', 2019, 261, 495, '2020-09-17', 'D', '', '', NULL, NULL, NULL, ''),
(153, 2020, 'Quotta', 'Muhammad Zeeshan Aslam', 'Muhammad Aslam Zahid', 'Chak No 123P, PO: Chak No 125P, Tehsil/District Rahim Yar Khan', 'Rehmat Colony, Manthar Road (Near Country Club Marriage Hall) Rahim Yar Khan', 'Retired from Pakistan Army', '+92-321-5071380', 'Rahim Yar Khan', '2003-03-08', '', 'z03130931616@gmail.com', '', 17, 'Knowledge House Grammer Boys High School, Rahim Yar Khan', 'Bahawalpur', 2019, 261, 495, '2020-09-17', 'D', '', '', NULL, NULL, NULL, ''),
(154, 2020, 'Open Merit', 'Muhammad Imran Yousaf', 'Muhammmad Yousaf', 'Saeed pura, Hussainabad (East), Bahawalnagar', 'Saeed pura, Hussainabad (East), Bahawalnagar', 'Agricultural', '+30-297-13680__', 'Bahawalnagar', '1999-12-13', '', 'imranyousaf2221@gmail.com', '', 3, 'GCHS', 'Bwp', 2017, 698, 1100, '2020-09-20', 'B', '', '', NULL, NULL, NULL, ''),
(155, 2020, 'Open Merit', 'Muhammad Waqas', 'Muhammad Yousaf', 'Saeed pura, Hussainabad (East), Bahawalnagar', 'Saeed pura, Hussainabad (East), Bahawalnagar', 'Agriculture ', '+30-963-97322__', 'Bahawalnagar', '2002-08-12', '', 'waqasy307@gmail.com', '', 3, 'Govt. Comp. Hensive high school bwn', 'Bwp', 2019, 584, 1100, '2020-09-20', 'C', '', '', NULL, NULL, NULL, ''),
(156, 2020, 'Open Merit', 'Mlsohail aslam', 'Aslam', 'Rind jada', 'Pakpatan', 'Foji', '+03-487-027760_', 'Vehari', '2002-02-07', '', 'Sanewal58@gmail.com', '', 845019, 'Govt high scholl mailsi', 'Behari', 2014, 456, 1100, '2020-09-20', 'D', '', '', NULL, NULL, NULL, ''),
(157, 2020, 'Open Merit', 'ABDUL QADEER', 'ABDUL LATIF', 'MOHALLAH BASTI ABDUL SATTAR KHAN DUNGA BUNGA TEHSIL & DISTRICT BAHAWALNAGAR', 'MOHALLAH BASTI ABDUL SATTAR KHAN DUNGA BUNGA TEHSIL & DISTRICT BAHAWALNAGAR', 'AGRI', '+92-301-1781405', 'BAHAWALNAGAR', '2001-09-18', '', 'NASIRDB55@GMAIL.COM', '', 1, 'GOVT.H/S/S DUNGA BUNGA DISTRICT BAHAWALNAGAR', 'BISE BWP', 2017, 819, 1100, '2020-09-20', 'A', '', '', NULL, NULL, NULL, ''),
(158, 2020, 'Open Merit', 'Muhammad Naveed', 'Abdul Sattar', 'Chak No.79/A PO Feroza Tehsil Liaquat Pur', 'Kachi Mandi Basti Haji Nazar Liaquat Pur', 'Deceased ', '+92-345-7217178', 'Rahim Yar Khna', '2006-05-28', '', 'universallqp2019@gmail.com', '', 1, 'Govt. Model H/S Liaquat Pur', 'BISE Bahawal Pur', 2020, 601, 1100, '2020-09-21', 'B', '', '', NULL, NULL, NULL, ''),
(159, 2020, 'Open Merit', 'Muhammad Hamza', 'Muhammad Iftikhar', 'Sharqi post officekhas chak no/127/6.rteh. haroonabad  bahawalnagar', 'Sharqi post officekhas chak no/127/6.rteh. haroonabad  bahawalnagar', 'Former', '+92-300-5071550', 'Bahawalnagar', '2003-08-15', '', 'ssaa31747@gmail.com', '', 5, 'Govt.h/s chak 132/6.r haroonabad', 'Bahawalpur board', 2020, 661, 1050, '2020-09-21', 'C', '', '', NULL, NULL, NULL, ''),
(160, 2020, 'Open Merit', 'Hamad Ali', 'Abdul Ghaffar', 'Chak 69 NP P/O Chak abbas Mao Mubarak Tehsil RYK District RYK', 'Chak 69 NP P/O Chak abbas Mao Mubarak Tehsil RYK  District RYK', 'Govt . employee ', '+92-304-1423569', 'Punjab', '2020-09-21', '', 'Hamadaliking1250@gail.com', '', 0, 'Govt Colony High School', 'BWP', 2017, 680, 1100, '2020-09-21', 'B', 'Brookfield Group OF College RYK ', 'BWP', 2019, 580, 1100, 'C'),
(161, 2020, 'Open Merit', 'Ahsan Shabir', 'Ghulam Shabir', 'Chak 69 NP P/O Chak abbas Mao Mubarak Tehsil RYK District RYK', 'Chak 69 NP P/O Chak abbas Mao Mubarak Tehsil RYK  District RYK', 'Farmer', '+92-300-7542784', 'Punjab', '2020-09-22', '', 'Kashawan29@gmail.com', '', 0, 'Govt.secondary scgool Amin Garh . Ryk', 'BWP', 2018, 638, 1100, '2020-09-21', 'B', '', '', NULL, NULL, NULL, '');
INSERT INTO `std_info` (`std_id`, `session`, `quotta`, `fullname`, `f_name`, `p_address`, `c_address`, `f_occupation`, `phone`, `d_district`, `dob`, `age`, `email`, `photo`, `n_o_copies`, `institute1`, `board1`, `passing_year1`, `obtain_marks1`, `total_marks1`, `admission_date`, `grade1`, `institute2`, `board2`, `passing_year2`, `obtain_marks2`, `total_marks2`, `grade2`) VALUES
(162, 2020, 'Open Merit', 'HUSNAIN KAMARAN', 'MUHAMMAD KAMRAN', 'UMASN TOWN DIGGI MOHALLA STREET NO.18 TEHSIL FORT ABBAS DISTRICT BAHAWALNAGAR', 'UMASN TOWN DIGGI MOHALLA STREET NO.18 TEHSIL FORT ABBAS DISTRICT BAHAWALNAGAR', 'SHOP KEEPER', '+92-305-1868145', 'BAHAWALNAGAR', '2002-11-29', '', 'dcsstudio007@gmail.com', '', 6, 'GOVT HIGH SCHOOL FORT ABBAS', 'BISE BAHAWALPUR', 2018, 861, 1100, '2020-09-21', 'A', '', '', NULL, NULL, NULL, ''),
(163, 2020, 'Open Merit', 'Nadeem Ahmad', 'Zahoor Ahmad', 'Shani photo studio main bazar donga bonga teh & disst Bahawalnagar', 'Shani photo studio main bazar donga bonga teh & disst Bahawalnagar', 'Farmar', '+92-307-7546553', 'Bahawalnagar', '2002-08-03', '', 'attiqmalik410@gmail.com', '', 1, 'GOVT HIGH SECONDAR SCHOOL DONGA BONGA ', 'BISE BWP', 2020, 603, 1100, '2020-09-21', 'B', '', '', NULL, NULL, NULL, ''),
(164, 2020, 'Open Merit', 'Sarfraz Ahmad', 'Muhammad Usman', 'Basti Tali Wala Tehsil Minchinabad', 'Basti Tali Wala Tehsil Minchinabad', 'Former', '+92-303-7137732', 'Bahawalnagar', '1998-02-05', '', 'vhfaisal575@gmail.com', '', 2, 'Govt. Model High School Minchinabad', 'BISE BWP', 2018, 660, 1100, '2020-09-21', 'B', '', '', NULL, NULL, NULL, ''),
(165, 2020, 'Open Merit', 'Ali.hassan ', 'Imran.Ashraf ', 'Bangla.manthar sadikabad ', 'Bangla mathar chak no 182p', 'Farmer', '+92-340-9671659', 'Rahim.yar.khan', '2002-11-22', '', 'Chataa62@gmail.com', '', 1, 'No', 'Bwp', 2018, 742, 1100, '2020-09-21', 'B', 'No', 'Bwp', 2018, 742, 1100, 'B'),
(166, 2020, 'Open Merit', 'Ali.hassan ', 'Imran.Ashraf ', 'Chak no182 Bangla.manthar sadikabad ', 'Bangla mathar chak no 182p', 'Farmer', '+92-340-9671659', 'Rahim.yar.khan', '2002-11-22', '', 'Chataa62@gmail.com', '', 1, 'No', 'Bwp', 2018, 742, 1100, '2020-09-21', 'B', 'No', 'Bwp', 2018, 742, 1100, 'B'),
(167, 2020, 'Quotta', 'Abdul Rehman', 'Muhammad Arshad ', 'Agriculture farm chak 4/P Khanpur, Rahim Yar Khan', 'Agriculture farm chak 4/P Khanpur, Rahim Yar Khan', 'Baildar in Agriculture Depart', '+92-300-6732044', 'Rahim Yar Khan', '2003-09-20', '', 'agrarianimran@gmail.com', '', 1, 'Govt. Colony High School Khanpur', 'B.I.S.E Bahawalpur', 2020, 508, 1100, '2020-09-21', 'C', '', '', NULL, NULL, NULL, ''),
(168, 2020, 'Open Merit', 'Muhammad Ahad Abdullah', 'Amjad Javeed', 'Chak No. 127/6R P/O Khas Tehsil Haroonabad District Bahawalnagar', 'Chak No. 127/6R P/O Khas Tehsil Haroonabad District Bahawalnagar', 'Farmar', '+92-310-1798079', 'Bahawalnagar', '2004-05-05', '', 'chandahad127541@gmail.com', '', 1, 'GHS 132/6R', 'BISE Bahawalpur', 2020, 593, 1100, '2020-09-21', 'D', '', '', NULL, NULL, NULL, ''),
(169, 2020, 'Open Merit', 'Sufyan Ul Hassan', 'Mubashir Hassan', 'SHANI PHOTO STUDIO MAIN BAZAR DONGA BONGA TEHSIL & DISST BAHAWALNAGAR', 'SHANI PHOTO STUDIO MAIN BAZAR DONGA BONGA TEHSIL & DISST BAHAWALNAGAR', 'Farmar', '+92-302-4242483', 'Bahawalnagar', '2003-02-06', '', 'attiqmalik410@gmail.com', '', 0, 'Govt High School Jand Wala ', 'B.I.S.E B.W.P', 2020, 533, 1100, '2020-09-21', 'C', '', '', NULL, NULL, NULL, ''),
(170, 2020, 'Open Merit', 'Muhammad Juanid', 'Maqsood Ahmad', 'SHANI PHOTO STUDIO MAIN BAZAR DONGA BONGA TEHSIL & DISST BAHAWALNAGAR', 'SHANI PHOTO STUDIO MAIN BAZAR DONGA BONGA TEHSIL & DISST BAHAWALNAGAR', 'Driver', '+92-300-6831157', 'Bahawalnagar', '2003-02-01', '', 'attiqmalik410@gmail.com', '', 0, 'govt High Secondery School Dunga Bunga', 'B.I.S.E B.W.P', 2020, 625, 1100, '2020-09-21', 'B', '', '', NULL, NULL, NULL, ''),
(171, 2020, 'Open Merit', 'Hashir Ilyas', 'Ilyas Akhtar', 'House No 430/37 Madina abad Wilyat Abad no 1 W.NO. 8/Muslim P.O Timber Market Multan', 'House No 430/37 Madina abad Wilyat Abad no 1 W.NO. 8/Muslim P.O Timber Market Multan', 'Property Dealer', '+92-342-4770036', 'Multan', '2005-02-11', '', 'aamiranwar66@gmail.com', '', 6, 'F.G Public School No. 1, (Boys) Multan Cantt', 'F.B.I.S.E islamabad', 2020, 585, 1100, '2020-09-21', 'C', '', '', NULL, NULL, NULL, ''),
(172, 2020, 'Open Merit', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Rind jada kharor pakka', 'Farmer', '+03-481-750649_', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845017, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-09-22', 'B', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'B'),
(173, 2020, 'Open Merit', 'ABDUL REHMAN', 'MUBARAK ALI', 'CHAK NO. 54-DB, TEHSIL YAZMAN DISTRICT BAHAWALPUR', 'BHATTA NO. 1, STREET NO. 5, BAHAWALPUR', 'SHOPKEPER', '+92-301-4805475', 'BAHAWALPUR', '2003-01-01', '', 'afzaljunaid717@gmail.com', '', 3, 'JINNAH HIGHER SECONDARY SCHOOL BOYS MODAL TOWN \"C\", BAHAWALPUR', 'BISE BAHAWALPUR', 2020, 547, 1100, '2020-09-22', 'D', '', '', NULL, NULL, NULL, ''),
(174, 2020, 'Quotta', 'Mlsohail aslam', 'Aslam', 'Ryk', 'Ryk', 'Foji', '+03-487-842820_', 'Ryk', '2020-09-03', '', 'Sanewal56@gmail.com', '', 845016, 'Govt xmschool ryk', 'Bwp', 2016, 456, 1100, '2020-09-23', 'D', 'Govt scholl ryk', 'Bwp', 2019, 456, 1100, 'C'),
(175, 2020, 'Open Merit', 'Muhammad Waqas', 'Muhammad Yousaf', 'Saeed pura, Hussainabad (East), Bahawalnagar', 'Saeed pura, Hussainabad (East), Bahawalnagar', 'Retierd servent', '+03-166-091854_', 'Bahawalnagar', '2002-08-12', '', 'waqasy307@gmail.com', '', 3, 'Govt. Comp. Hensive high school bwn', 'Bwp', 2019, 584, 1100, '2020-09-23', 'C', '', '', NULL, NULL, NULL, ''),
(176, 2020, 'Open Merit', 'Abaidullah', 'Abdul Ghaffar Asim', 'Chak No.64-5L yousafwala Sahiwal', 'Chak No.64-5L yousafwala Sahiwal', 'Business', '+92-301-7896726', 'Sahiwal', '2002-08-09', '', 'mshahbazch978@gmail.com', '', 1, 'Private', 'BISE SAHIWAL', 2018, 506, 1100, '2020-09-24', 'D', '', '', NULL, NULL, NULL, ''),
(177, 2020, 'Quotta', 'Hamza Nazir', 'MUhhamad sarwar', 'basti kareem naghar,dak khana kot haq nawaz, mouza murtazabad,tehsil rahim yar khan', 'basti kareem naghar,dak khana kot haq nawaz, mouza murtazabad,tehsil rahim yar khan', 'land lord', '+92-305-3230553', 'rahim yar khan', '2005-01-10', '', 'maazkhuzaima@gmail.com', '', 1, 'misali janat english medium high school', 'bahawalpur', 2020, 539, 1100, '2020-09-26', 'D', '', '', NULL, NULL, NULL, ''),
(178, 2020, 'Quotta', 'Hamza Nazir', 'MUhhamad sarwar', 'basti kareem naghar,dak khana kot haq nawaz, mouza murtazabad,tehsil rahim yar khan', 'basti kareem naghar,dak khana kot haq nawaz, mouza murtazabad,tehsil rahim yar khan', 'land lord', '+92-305-3230553', 'rahim yar khan', '2005-01-10', '', 'maazkhuzaima@gmail.com', '', 1, 'misali janat english medium high school', 'bahawalpur', 2020, 539, 1100, '2020-09-26', 'D', '', '', NULL, NULL, NULL, ''),
(179, 2020, 'Open Merit', 'Sanwal', 'Ali', 'Ryk', 'Ryk', 'Chair man uni', '+03-474-545178_', 'Ryk', '2004-01-28', '', 'Sanewal58@gmail.com', '', 845016, 'Govt xmschool ryk', 'Bwp', 2016, 690, 1100, '2020-09-28', 'B', 'Govt scholl ryk', 'Bwp', 2019, 456, 1100, 'C'),
(180, 2020, 'Quotta', 'Muhammad ijaz', 'Allah wassaya', 'Chaha bhani haji haider khan mouza rind jada tahsil kharor pakka lodhran', 'Ryk', 'Farmer', '+03-481-750649_', 'Lodhran', '2001-04-15', '', 'Ijazkhanrind56@gmail.com', '', 845017, 'Govt.high school,jhanbi wahin,lodhran', 'Multan board', 2016, 690, 1100, '2020-10-24', 'B', 'Govt.high school, jhanbi wahin lodhran', 'Multan bord', 2016, 690, 1100, 'B'),
(181, 2020, 'Quotta', 'Babur Ali', 'Mazhar Nawaz', 'Bastikorai ,muhammadpur Dewan, District Rajan pir,thesil jampur', 'Bastikorai, muhammadpur Dewan, District Rajan pir,thesil janpur', 'Farmer', '+03-321-676059_', 'Rajanpur', '2020-12-10', '', 'Baburkorai123@gmail.com', '', 1, 'District public school Rajan pir', 'DG khan', 2019, 815, 1100, '2020-12-10', 'A', 'Kfueit', '', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'admin', '9XO-Yz81cOKRD0VgP_w_U_lVT8A1BBEp', '$2y$13$923JWeoiZg1lLfDSYu1BheagPGZZ5zBRdT1A8o5aqdCHP4VW3xuLW', NULL, 'anasshafqat01@gmail.com', 10, 1593504833, 1593504833, 'fSj3-FBh_GLntDM-ZrcJRXESjoB6vuGy_1593504833'),
(2, 'admin_iati', 'V_wH_8pK03z0Z5q4C4zYbcdm5YDg0joI', '$2y$13$at3yVI8oA/a3p3b8czrajedZymDVXJAFJZ.kCclNXXe9OefPycthe', NULL, 'anasshafqat02@gmail.com', 10, 1597034229, 1597034229, 'KR0WsXiWp2-VgdO8Qvbkq4jk3odxP7qh_1597034229');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `phone_book`
--
ALTER TABLE `phone_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_groups_id` (`sms_groups_id`);

--
-- Indexes for table `sms_groups`
--
ALTER TABLE `sms_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `std_info`
--
ALTER TABLE `std_info`
  ADD PRIMARY KEY (`std_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phone_book`
--
ALTER TABLE `phone_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sms_groups`
--
ALTER TABLE `sms_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `std_info`
--
ALTER TABLE `std_info`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phone_book`
--
ALTER TABLE `phone_book`
  ADD CONSTRAINT `phone_book_ibfk_1` FOREIGN KEY (`sms_groups_id`) REFERENCES `sms_groups` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
