-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 28, 2023 at 10:01 AM
-- Server version: 8.0.35
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `adding`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `adding` (IN `id` VARCHAR(4), IN `num` INT)  NO SQL BEGIN
UPDATE shows s set s.seats=s.seats+num where show_id=id;
end$$

DROP PROCEDURE IF EXISTS `sub`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sub` (IN `id` VARCHAR(4), IN `num` INT)  NO SQL BEGIN
UPDATE shows set seats=seats-num where show_id=id and seats>0;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `actor_id` varchar(4) NOT NULL,
  `actor_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `actor_gender` varchar(7) NOT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`actor_id`, `actor_name`, `actor_gender`) VALUES
('1', ' Tanezaki Atsumi', 'Female'),
('2', ' Hayami Saori', 'Female'),
('3', 'Eguchi Takuya', 'Male'),
('4', 'Seto Asami', 'Female'),
('5', 'Ishikawa Kaito', 'Male'),
('6', 'Andou Sakura', 'Female'),
('7', 'Suzuki Rio', 'Female'),
('8', 'Terada Kokoro', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `show_id` varchar(4) NOT NULL,
  `no_of_seats` int NOT NULL,
  `booking_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `paid` varchar(10) NOT NULL DEFAULT 'Unpaid',
  PRIMARY KEY (`booking_id`),
  KEY `show_id` (`show_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `show_id`, `no_of_seats`, `booking_time`, `user_id`, `paid`) VALUES
(1004, '1', 2, '2023-12-28 16:27:52', 3, 'Unpaid'),
(1005, '1', 5, '2023-12-28 16:48:45', 3, 'Unpaid'),
(1006, '2', 1, '2023-12-28 16:52:32', 3, 'Paid');

--
-- Triggers `booking`
--
DROP TRIGGER IF EXISTS `count_dec`;
DELIMITER $$
CREATE TRIGGER `count_dec` AFTER DELETE ON `booking` FOR EACH ROW BEGIN

UPDATE users u SET u.count=u.count-1 WHERE u.id =
(
   SELECT user_id FROM booking b ORDER BY b.booking_id DESC LIMIT 1
    );
    

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `counts`;
DELIMITER $$
CREATE TRIGGER `counts` AFTER INSERT ON `booking` FOR EACH ROW BEGIN

UPDATE users u SET u.count=u.count+1 WHERE u.id =
(
   SELECT user_id FROM booking b ORDER BY b.booking_id DESC LIMIT 1
    );
    

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `dir_id` varchar(4) NOT NULL,
  `dir_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`dir_id`, `dir_name`) VALUES
('1', 'Takashi Katagiri'),
('2', 'Hajime Kamoshida'),
('3', 'Yoshiyuki Momose');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `mov_id` varchar(4) NOT NULL,
  `mov_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `genre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mov_lang` varchar(10) NOT NULL,
  `dir_id` varchar(4) NOT NULL,
  PRIMARY KEY (`mov_id`),
  KEY `dir_id` (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`mov_id`, `mov_name`, `description`, `genre`, `mov_lang`, `dir_id`) VALUES
('1', 'Spy x Family Movie: Code: White', 'After receiving an order to be replaced in Operation Strix, Loid decides to help Anya win a cooking competition at Eden Academy by making the principal\'s favorite meal in order to prevent his replacement. The Forgers decide to travel to the meal\'s origin region, where they set off a chain of actions which could potentially put the world\'s peace at risk.\r\n\r\n', 'Action, Comedy', 'Japanese', '1'),
('2', 'Rascal Does Not Dream of a Knapsack Kid', 'Finally, the day of Mai\'s high school graduation has arrived. While Sakuta eagerly waits for his girlfriend, an elementary schooler who looks exactly like her appears before him. Suspicious, and for all the wrong reasons... Meanwhile, Sakuta and Kaede\'s father suddenly calls, saying that their mother wants to see her daughter. She was hospitalized because Kaede\'s condition had been too much for her to bear, so what could she possibly want now?', 'Drama, Romance, Supernatural', 'Japanese', '2'),
('3', 'The Imaginary', 'Rudger is Amanda Shuffleup\'s imaginary friend. Nobody else can see Rudger—until the evil Mr. Bunting arrives at Amanda\'s door. Mr. Bunting hunts imaginaries. Rumor has it that he even eats them. And now he\'s found Rudger.\r\nSoon Rudger is alone, and running for his imaginary life. He needs to find Amanda before Mr. Bunting catches him—and before Amanda forgets him and he fades away to nothing. But how can an unreal boy stand alone in the real world?', 'Fantasy', 'Japanese', '3');

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
CREATE TABLE IF NOT EXISTS `movie_cast` (
  `actor_id` varchar(4) NOT NULL,
  `mov_id` varchar(4) NOT NULL,
  `role` varchar(20) NOT NULL,
  KEY `actor_id` (`actor_id`),
  KEY `mov_id` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`actor_id`, `mov_id`, `role`) VALUES
('1', '1', 'Forger Anya'),
('2', '1', 'Forger Yor'),
('3', '1', 'Forger Loid'),
('4', '2', 'Sakurajima Mai'),
('5', '2', 'Azusagawa Sakuta'),
('6', '3', 'Lizzie'),
('7', '3', 'Amanda'),
('8', '3', 'Rudger');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `mov_id` varchar(4) NOT NULL,
  `stars` float(4,2) NOT NULL,
  KEY `mov_id` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`mov_id`, `stars`) VALUES
('1', 7.00),
('2', 6.12),
('3', 7.82);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
CREATE TABLE IF NOT EXISTS `shows` (
  `show_id` varchar(4) NOT NULL,
  `t_id` varchar(4) NOT NULL,
  `mov_id` varchar(4) NOT NULL,
  `time` datetime NOT NULL,
  `seats` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`show_id`),
  KEY `t_id` (`t_id`),
  KEY `mov_id` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `t_id`, `mov_id`, `time`, `seats`, `price`) VALUES
('1', '1', '1', '2023-12-24 16:00:00', 33, 50000),
('2', '2', '1', '2023-12-25 16:00:00', 39, 50000),
('3', '2', '1', '2023-12-26 16:00:00', 40, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
CREATE TABLE IF NOT EXISTS `theater` (
  `t_id` varchar(4) NOT NULL,
  `t_name` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `theater`
--

INSERT INTO `theater` (`t_id`, `t_name`, `location`) VALUES
('1', 'Theater 1', 'Floor 1'),
('2', 'Theater 2', 'Floor 1'),
('3', 'Theater 3', 'Floor 1'),
('4', 'Theater 4', 'Floor 2'),
('5', 'Theater 5', 'Floor 2'),
('6', 'Theater 6', 'Floor 2'),
('7', 'Theater 7', 'Floor 3'),
('8', 'Theater 8', 'Floor 3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `pwd` varchar(256) NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `age`, `phone`, `email`, `uname`, `pwd`, `count`) VALUES
(3, 'Nguyen', 'Nguyen', 28, '0819045141', 'hikarilandon@gmail.com', 'Nguyen', '$2y$10$ZFmZKErtKE5d3e6dWUs9XOi3ipgCFn7WXQXErVVt29aYRFj.QWn2e', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `director` (`dir_id`);

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`),
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`);

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `theater` (`t_id`),
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
