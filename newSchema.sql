-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2022 at 02:14 PM
-- Server version: 8.0.30-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fabskill`
--
CREATE DATABASE IF NOT EXISTS `fabskill` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fabskill`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `JobSlots` int NOT NULL,
  `MonthlyPrice` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `JobSlots`, `MonthlyPrice`) VALUES
(1, 'Freemium', 1, 0),
(2, 'pay as you go', 2, 249),
(3, 'Bronze', 4, 249),
(4, 'Silver', 6, 399),
(5, 'Gold', 100, 799);

-- --------------------------------------------------------

--
-- Table structure for table `businesspagestats`
--

CREATE TABLE `businesspagestats` (
  `IdEntry` int NOT NULL,
  `totLikes` int NOT NULL DEFAULT '0',
  `totBusPageDisplays` int NOT NULL DEFAULT '0',
  `totJobOffersDisplays` int NOT NULL DEFAULT '0',
  `totJobSaves` int NOT NULL DEFAULT '0',
  `totJobClicks` int NOT NULL DEFAULT '0',
  `totApplications` int NOT NULL DEFAULT '0',
  `totComments` int NOT NULL DEFAULT '0',
  `totFollowers` int NOT NULL DEFAULT '0',
  `totBusPageVisits` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_videos`
--

CREATE TABLE `business_videos` (
  `idEntry` int NOT NULL,
  `AbsoluteUrlOfFile` mediumtext NOT NULL,
  `businessID` int NOT NULL,
  `TypeOfVideo` int NOT NULL,
  `dateOf` datetime NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `thumbnailAbsoluteUrl` mediumtext,
  `fileFormat` varchar(50) NOT NULL DEFAULT 'video/x-msvideo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidates_survey_question`
--

CREATE TABLE `candidates_survey_question` (
  `Id` int NOT NULL,
  `name` mediumtext NOT NULL,
  `en_name` mediumtext,
  `type` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `candidates_survey_question`
--

INSERT INTO `candidates_survey_question` (`Id`, `name`, `en_name`, `type`) VALUES
(1, 'Salaire et avantages', 'Salary and benefits', 1),
(2, 'Worksapce et lieu de travail', 'Worksapce and workplace', 1),
(3, 'Image culture et valeurs', 'Business culture and values', 1),
(4, 'Équilibre travail et vie privée', 'Work-life balance', 1),
(5, 'Technologie et Opportunités de carrière', 'Technology and Career Opportunities', 1),
(6, 'Equipe dirigeante et climat', 'Management team and climate', 1),
(7, 'Impact sociétal', 'Societal impact', 1),
(8, 'Recommanderiez-vous cette société à un ami ou collègue ?', 'Would you recommend this company to a friend or colleague?', 3),
(9, 'Le travail et les responsabilités qui vous sont attribuées correspondent t ils à votre profil et votre expérience  ?', 'Do the work and responsibilities assigned match your profile and experience?', 3),
(10, 'D\'une manière générale êtes vous satisfait de votre rémunération au sein de cette société ?', 'In general, are you satisfied with your remuneration at this company ?', 3),
(11, 'Êtes-vous satisfait des autres avantages extra salaire ?', 'Are you satisfied with the other extra salary benefits?', 3),
(12, 'Comment évalueriez-vous votre manager ?', 'How would you rate your manager?', 3),
(13, 'Comment évalueriez-vous votre PDG ?', 'How would you rate your CEO?', 3),
(14, 'Communication et cohésion avec vos collègues au sein de la même équipe ? ', 'Communication and cohesion with your colleagues within the same team?', 3),
(15, 'Communication et cohésion avec des collègues d\'autres équipes ? ', 'Communication and cohesion with colleagues from other teams?', 3),
(16, 'Qualité de votre workspace et conditions de travail ?', 'Quality of your workspace and working conditions?', 3),
(17, 'Les réunions de votre entreprise sont-elles efficaces ?', 'Are your company\'s meetings effective?', 3),
(18, 'Estimez vous que vous avez un bon équilibre travail et vie privée ?', 'Do you feel that you have a good work-life balance at this company ?', 3),
(19, 'Vous sentez-vous impliqué / concerné / représentatif de votre culture d’entreprise ? ', 'Do you feel involved / concerned / representative of your company culture?', 3),
(20, 'Trouvez vous que cette société a des stratégies et des activités responsables à l\'égard de la société ou de l\'environnement ', 'Do you find that this company has socially or environmentally responsible strategies and activities', 3);

-- --------------------------------------------------------

--
-- Table structure for table `candidaturestatechangelog`
--

CREATE TABLE `candidaturestatechangelog` (
  `idEntry` int NOT NULL,
  `idCandidature` int NOT NULL,
  `NewState` int NOT NULL,
  `Motif` int NOT NULL DEFAULT '7',
  `FeedBack` mediumtext,
  `DoneBy` int NOT NULL,
  `DateOf` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `centraliseallnotificationscandidature`
--

CREATE TABLE `centraliseallnotificationscandidature` (
  `idEntry` int NOT NULL,
  `idPage` int NOT NULL,
  `EmailToSend` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `creds`
--

CREATE TABLE `creds` (
  `id_user` int NOT NULL,
  `password` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='passwords are stored hashed, hashes used to verify passwords';

-- --------------------------------------------------------

--
-- Table structure for table `email_pipe`
--

CREATE TABLE `email_pipe` (
  `idEntry` int NOT NULL,
  `fromEmail` varchar(255) NOT NULL,
  `toEmail` varchar(255) NOT NULL,
  `replyTo` varchar(255) NOT NULL,
  `templateId` varchar(255) NOT NULL,
  `jsonData` mediumtext NOT NULL,
  `lang` varchar(3) NOT NULL DEFAULT 'fr',
  `DateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emailState` int NOT NULL DEFAULT '0' COMMENT '0: waiting 1: sent 2: failed 3: bounced'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `email_pipe`
--

INSERT INTO `email_pipe` (`idEntry`, `fromEmail`, `toEmail`, `replyTo`, `templateId`, `jsonData`, `lang`, `DateCreation`, `emailState`) VALUES
(1, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'job_suggestions', '{\r\n\"username\": \"Raed Derbel\",\r\n\"jobs\": [\r\n{\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45\r\n}\r\n]\r\n}', 'en', '2022-08-24 14:20:04', 1),
(3, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'featured_jobs', '{\r\n\"username\": \"Raed\",\r\n\"jobs\": [\r\n{\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45\r\n},\r\n{\r\n\"jobTitle\": \"Contrôleur / Contrôleuse Des Industries De L\'habillement\",\r\n\"company\": \"VIrtualExpo\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/912_1645277143.png\",\r\n\"offerId\": 45\r\n},\r\n{\r\n\"jobTitle\": \"Conseiller client réception d\'appels\",\r\n\"company\": \"STE CONCENTRIX CVG CONTACT TUNISIE SARL\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/512_1644933957.png\",\r\n\"offerId\": 45\r\n},\r\n{\r\n\"jobTitle\": \"Ingenieur Genie Civil\",\r\n\"company\": \"Société MATEM\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/289_1644393173.png\",\r\n\"offerId\": 45\r\n}\r\n],\r\n\r\n\"duration\": \"20 mins\",\r\n\"time\": \"\",\r\n\"date\": \"\",\r\n\"address\": \"\"\r\n}', 'en', '2022-08-24 14:20:10', 1),
(4, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'general_email', '{\r\n\"username\": \"Raed\",\r\n\"title\": \"News fom Fabskill !\",\r\n\"imgURL\": \"https://dev2.fabskill.com/assets/img/logos_v_2/BLUE_ON_TRANSPARENT-150.png\",\r\n\"primaryText\": \"We are exited to announce our new version of the Fabskill platform made just for your needs\",\r\n\"secondaryText\": \"Join dev2.fabskill.com and become a hero.\",\r\n\"actionName\": \"Join Fabskill V2\",\r\n\"actionURL\": \"dev2.fabskill.com\"\r\n}', 'en', '2022-08-24 14:20:10', 1),
(5, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'job_alert', '{\r\n\"username\": \"Raed\",\r\n\"skills\": [\"PHP\", \"Codeigniter\", \"Angular\"],\r\n\"jobs\": [\r\n{\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45\r\n}\r\n],\r\n\"duration\": \"20 mins\",\r\n\"time\": \"\",\r\n\"date\": \"\",\r\n\"address\": \"\"\r\n}', 'en', '2022-08-24 14:20:10', 1),
(6, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'phone_interview', '{\r\n\"username\": \"Raed\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"time\": \"Matin\",\r\n\"date\": \"28/12/2022\"\r\n}', 'en', '2022-08-24 14:20:10', 1),
(7, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'video_interview', '{\r\n\"username\": \"Raed Derbel\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"date\": \"28/12/2022\",\r\n\"url\": \"https://dev2.fabskill.com\"\r\n}', 'en', '2022-08-24 14:20:10', 1),
(8, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'tech_test', '{\r\n\"username\": \"Raed\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"date\": \"28/12/2022\",\r\n\"url\": \"https://dev2.fabskill.com\"\r\n}', 'en', '2022-08-24 14:20:10', 1),
(9, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'facetoface_interview', '{\r\n\"username\": \"Raed\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"date\": \"28/12/2022 at 9AM GMT+1\",\r\n\"url\": \"https://dev2.fabskill.com\",\r\n\"address\": \"Tunis, Tunisie\",\r\n\"duration\": \"20 mins\"\r\n}', 'en', '2022-08-24 14:20:10', 1),
(10, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'job_suggestions', '{\r\n\"username\": \"Raed Derbel\",\r\n\"jobs\": [\r\n{\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45\r\n}\r\n]\r\n}', 'fr', '2022-08-24 14:20:04', 1),
(11, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'featured_jobs', '{\r\n\"username\": \"Raed\",\r\n\"jobs\": [\r\n{\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45\r\n},\r\n{\r\n\"jobTitle\": \"Contrôleur / Contrôleuse Des Industries De L\'habillement\",\r\n\"company\": \"VIrtualExpo\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/912_1645277143.png\",\r\n\"offerId\": 45\r\n},\r\n{\r\n\"jobTitle\": \"Conseiller client réception d\'appels\",\r\n\"company\": \"STE CONCENTRIX CVG CONTACT TUNISIE SARL\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/512_1644933957.png\",\r\n\"offerId\": 45\r\n},\r\n{\r\n\"jobTitle\": \"Ingenieur Genie Civil\",\r\n\"company\": \"Société MATEM\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/289_1644393173.png\",\r\n\"offerId\": 45\r\n}\r\n],\r\n\r\n\"duration\": \"20 mins\",\r\n\"time\": \"\",\r\n\"date\": \"\",\r\n\"address\": \"\"\r\n}', 'fr', '2022-08-24 14:20:10', 1),
(12, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'general_email', '{\r\n\"username\": \"Raed\",\r\n\"title\": \"News fom Fabskill !\",\r\n\"imgURL\": \"https://dev2.fabskill.com/assets/img/logos_v_2/BLUE_ON_TRANSPARENT-150.png\",\r\n\"primaryText\": \"We are exited to announce our new version of the Fabskill platform made just for your needs\",\r\n\"secondaryText\": \"Join dev2.fabskill.com and become a hero.\",\r\n\"actionName\": \"Join Fabskill V2\",\r\n\"actionURL\": \"dev2.fabskill.com\"\r\n}', 'fr', '2022-08-24 14:20:10', 1),
(13, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'job_alert', '{\r\n\"username\": \"Raed\",\r\n\"skills\": [\"PHP\", \"Codeigniter\", \"Angular\"],\r\n\"jobs\": [\r\n{\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45\r\n}\r\n],\r\n\"duration\": \"20 mins\",\r\n\"time\": \"\",\r\n\"date\": \"\",\r\n\"address\": \"\"\r\n}', 'fr', '2022-08-24 14:20:10', 1),
(14, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'phone_interview', '{\r\n\"username\": \"Raed\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"time\": \"Matin\",\r\n\"date\": \"28/12/2022\"\r\n}', 'fr', '2022-08-24 14:20:10', 1),
(15, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'video_interview', '{\r\n\"username\": \"Raed Derbel\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"date\": \"28/12/2022\",\r\n\"url\": \"https://dev2.fabskill.com\"\r\n}', 'fr', '2022-08-24 14:20:10', 1),
(16, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'tech_test', '{\r\n\"username\": \"Raed\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"date\": \"28/12/2022\",\r\n\"url\": \"https://dev2.fabskill.com\"\r\n}', 'fr', '2022-08-24 14:20:10', 0),
(17, 'notifications@fabskill.com', 'raed.derbel.98@gmail.com', 'raed.derbel.98@gmail.com', 'facetoface_interview', '{\r\n\"username\": \"Raed\",\r\n\"jobTitle\": \"Technicien / technicienne de maintenance industrielle\",\r\n\"company\": \"Fabevent\",\r\n\"logo\": \"https://aneti.s3.eu-west-3.amazonaws.com/bus-logo/cropped/345_1643920033.png\",\r\n\"offerId\": 45,\r\n\"date\": \"28/12/2022 at 9AM GMT+1\",\r\n\"url\": \"https://dev2.fabskill.com\",\r\n\"address\": \"Tunis, Tunisie\",\r\n\"duration\": \"20 mins\"\r\n}', 'fr', '2022-08-24 14:20:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedbackevaluation`
--

CREATE TABLE `feedbackevaluation` (
  `IdEntry` int NOT NULL,
  `IdCandidature` int NOT NULL,
  `idCollab` int NOT NULL,
  `FeedBack` mediumtext NOT NULL,
  `DateFeedback` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview_schedule`
--

CREATE TABLE `interview_schedule` (
  `IdEntry` int NOT NULL,
  `idPage` int NOT NULL,
  `IdCandidature` int NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `Date_fin` datetime NOT NULL COMMENT 'Date in CET',
  `State` int NOT NULL DEFAULT '0' COMMENT '0:notstarted 1:started 2:finished 3:vdready',
  `CreatedBy` int NOT NULL,
  `DateCreation` datetime NOT NULL,
  `IdQuestionnaire` int DEFAULT NULL,
  `roomSid` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `TypeOfInterview` int NOT NULL COMMENT '//1 video diff video  \r\n//2: In person interv \r\n//3: pitch video\r\n//4: test technique\r\n//5: live video interv \r\n',
  `mediaUrl` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `thumbURL` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'fr',
  `replayTo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_contrat`
--

CREATE TABLE `jb_contrat` (
  `contratId` int NOT NULL,
  `contrat` varchar(50) NOT NULL,
  `contrat_EN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jb_contrat`
--

INSERT INTO `jb_contrat` (`contratId`, `contrat`, `contrat_EN`) VALUES
(1, 'CDD', 'Contract job'),
(2, 'CDI', 'Permanent job'),
(3, 'STAGE', 'Internship'),
(4, 'INTERIM', 'Interim job'),
(5, 'MISSION', 'Mission'),
(6, 'CIVP', 'Pre-hiring internship'),
(7, 'NON SPÉCIFIÉ', 'Unspecified'),
(8, 'FREELANCE OU PRESTATIRE INDÉPENDANT', 'Freelance');

-- --------------------------------------------------------

--
-- Table structure for table `jb_exp`
--

CREATE TABLE `jb_exp` (
  `id` int NOT NULL,
  `exp` varchar(50) NOT NULL,
  `en_exp` varchar(255) NOT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jb_exp`
--

INSERT INTO `jb_exp` (`id`, `exp`, `en_exp`, `tag`) VALUES
(1, 'Sans experience', 'No experience', 'Débutant ou Stagiaire'),
(2, 'Moins d\'une année', 'Less than one year', 'Junior'),
(3, '1 à 2 ans', '1 to 2 years', 'Junior'),
(4, '3 à 5 ans', '3 to 5 years', 'Confirmé'),
(5, '6 à 10 ans', '6 to 10 years', 'Sénior'),
(6, '10 à 15 ans', '10 to 15 years', 'Expert'),
(7, 'Plus de 15 ans', 'More than 15 years', 'Vétéran');

-- --------------------------------------------------------

--
-- Table structure for table `jobofferstats`
--

CREATE TABLE `jobofferstats` (
  `IdEntry` int NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `displays` int NOT NULL DEFAULT '0',
  `saves` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `applications` int NOT NULL DEFAULT '0',
  `comments` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_alerts`
--

CREATE TABLE `job_alerts` (
  `id` int UNSIGNED NOT NULL,
  `idUser` int NOT NULL,
  `idCountry` int DEFAULT NULL,
  `experienceId` int DEFAULT NULL,
  `min_sal` int DEFAULT NULL,
  `max_sal` int DEFAULT NULL,
  `activated` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_alerts_skills`
--

CREATE TABLE `job_alerts_skills` (
  `id` int UNSIGNED NOT NULL,
  `idJobAlert` int UNSIGNED NOT NULL,
  `idTag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_text_translations`
--

CREATE TABLE `job_text_translations` (
  `idJob` int NOT NULL,
  `translated_to` varchar(2) NOT NULL COMMENT 'fr, en ...',
  `text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learn_interest_skills`
--

CREATE TABLE `learn_interest_skills` (
  `idUser` int NOT NULL,
  `idTag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `liste_formations`
--

CREATE TABLE `liste_formations` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `pond` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `liste_type_diplomes`
--

CREATE TABLE `liste_type_diplomes` (
  `id` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `en_name` varchar(255) NOT NULL,
  `length` int NOT NULL,
  `tot_curs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `liste_type_diplomes`
--

INSERT INTO `liste_type_diplomes` (`id`, `name`, `en_name`, `length`, `tot_curs`) VALUES
(1, 'Ingénieur', 'Engineer degree', 3, 10),
(2, 'Doctorat', 'Doctorate degree', 3, 11),
(3, 'Master', 'Master\'s degree', 2, 9),
(4, 'Maitrise', 'Bachelor\'s degree', 4, 8),
(5, 'Licence', 'Three-year university degree ', 3, 6),
(6, 'Technicien Supérieur', ' Associate’s degree', 2, 7),
(7, 'BTP', 'Diploma of vocational technician', 0, 3),
(8, 'Baccalauréat', 'High-School Diploma', 0, 4),
(11, 'Cycle préparatoire', 'Undergraduate courses to prepare nationwide competitive exams', 2, 14),
(12, 'Autre', 'Other', 0, 15),
(13, 'Médecin', 'Doctor Of Medicine (MD.)', 2, 12),
(14, 'BTS', 'Two-year technical degree', 0, 2),
(15, 'CAP', ' Vocational certificate obtained 2 years after the 8th grade', 0, 1),
(16, 'Vétérinaire', 'Doctor of Veterinary Medicine (DVM)', 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `noms_de_metiers`
--

CREATE TABLE `noms_de_metiers` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `en_name` varchar(250) DEFAULT NULL,
  `pond` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nom_de_societe`
--

CREATE TABLE `nom_de_societe` (
  `id` int NOT NULL,
  `name` mediumtext NOT NULL,
  `logo` varchar(255) DEFAULT 'https://aneti.s3.eu-west-3.amazonaws.com/img/defaultbusinesslogo.png',
  `idcountry` int NOT NULL DEFAULT '219',
  `pond` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id` int NOT NULL,
  `numcode` int NOT NULL,
  `code` varchar(3) NOT NULL,
  `longcode` varchar(3) NOT NULL,
  `frname` varchar(80) NOT NULL,
  `enname` varchar(80) NOT NULL,
  `pond` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`id`, `numcode`, `code`, `longcode`, `frname`, `enname`, `pond`) VALUES
(1, 4, 'AF', 'AFG', 'Afghanistan', 'Afghanistan', 0),
(2, 8, 'AL', 'ALB', 'Albanie', 'Albania', 0),
(4, 12, 'DZ', 'DZA', 'Algérie', 'Algeria', 5),
(5, 16, 'AS', 'ASM', 'Samoa Américaines', 'American Samoa', 0),
(6, 20, 'AD', 'AND', 'Andorre', 'Andorra', 0),
(7, 24, 'AO', 'AGO', 'Angola', 'Angola', 0),
(8, 28, 'AG', 'ATG', 'Antigua-et-Barbuda', 'Antigua and Barbuda', 0),
(10, 32, 'AR', 'ARG', 'Argentine', 'Argentina', 0),
(11, 36, 'AU', 'AUS', 'Australie', 'Australia', 0),
(12, 40, 'AT', 'AUT', 'Autriche', 'Austria', 0),
(13, 44, 'BS', 'BHS', 'Bahamas', 'Bahamas', 0),
(14, 48, 'BH', 'BHR', 'Bahreïn', 'Bahrain', 0),
(15, 50, 'BD', 'BGD', 'Bangladesh', 'Bangladesh', 0),
(16, 51, 'AM', 'ARM', 'Arménie', 'Armenia', 0),
(17, 52, 'BB', 'BRB', 'Barbade', 'Barbados', 0),
(18, 56, 'BE', 'BEL', 'Belgique', 'Belgium', 5),
(19, 60, 'BM', 'BMU', 'Bermudes', 'Bermuda', 0),
(20, 64, 'BT', 'BTN', 'Bhoutan', 'Bhutan', 0),
(21, 68, 'BO', 'BOL', 'Bolivie', 'Bolivia', 0),
(22, 70, 'BA', 'BIH', 'Bosnie-Herzégovine', 'Bosnia and Herzegovina', 0),
(23, 72, 'BW', 'BWA', 'Botswana', 'Botswana', 0),
(25, 76, 'BR', 'BRA', 'Brésil', 'Brazil', 0),
(26, 84, 'BZ', 'BLZ', 'Belize', 'Belize', 0),
(27, 86, 'IO', 'IOT', 'Territoire Britannique de l\'Océan Indien', 'British Indian Ocean Territory', 0),
(28, 90, 'SB', 'SLB', 'Îles Salomon', 'Solomon Islands', 0),
(29, 92, 'VG', 'VGB', 'Îles Vierges Britanniques', 'British Virgin Islands', 0),
(30, 96, 'BN', 'BRN', 'Brunéi Darussalam', 'Brunei Darussalam', 0),
(31, 100, 'BG', 'BGR', 'Bulgarie', 'Bulgaria', 0),
(33, 108, 'BI', 'BDI', 'Burundi', 'Burundi', 0),
(34, 112, 'BY', 'BLR', 'Bélarus', 'Belarus', 0),
(35, 116, 'KH', 'KHM', 'Cambodge', 'Cambodia', 0),
(36, 120, 'CM', 'CMR', 'Cameroun', 'Cameroon', 0),
(37, 124, 'CA', 'CAN', 'Canada', 'Canada', 0),
(38, 132, 'CV', 'CPV', 'Cap-vert', 'Cape Verde', 0),
(39, 136, 'KY', 'CYM', 'Îles Caïmanes', 'Cayman Islands', 0),
(40, 140, 'CF', 'CAF', 'République Centrafricaine', 'Central African', 0),
(41, 144, 'LK', 'LKA', 'Sri Lanka', 'Sri Lanka', 0),
(42, 148, 'TD', 'TCD', 'Tchad', 'Chad', 0),
(43, 152, 'CL', 'CHL', 'Chili', 'Chile', 0),
(44, 156, 'CN', 'CHN', 'Chine', 'China', 0),
(45, 158, 'TW', 'TWN', 'Taïwan', 'Taiwan', 0),
(46, 162, 'CX', 'CXR', 'Île Christmas', 'Christmas Island', 0),
(48, 170, 'CO', 'COL', 'Colombie', 'Colombia', 0),
(49, 174, 'KM', 'COM', 'Comores', 'Comoros', 0),
(50, 175, 'YT', 'MYT', 'Mayotte', 'Mayotte', 0),
(51, 178, 'CG', 'COG', 'République du Congo', 'Republic of the Congo', 0),
(52, 180, 'CD', 'COD', 'République Démocratique du Congo', 'The Democratic Republic Of The Congo', 0),
(53, 184, 'CK', 'COK', 'Îles Cook', 'Cook Islands', 0),
(54, 188, 'CR', 'CRI', 'Costa Rica', 'Costa Rica', 0),
(55, 191, 'HR', 'HRV', 'Croatie', 'Croatia', 0),
(56, 192, 'CU', 'CUB', 'Cuba', 'Cuba', 0),
(57, 196, 'CY', 'CYP', 'Chypre', 'Cyprus', 0),
(58, 203, 'CZ', 'CZE', 'République Tchèque', 'Czech Republic', 0),
(59, 204, 'BJ', 'BEN', 'Bénin', 'Benin', 0),
(60, 208, 'DK', 'DNK', 'Danemark', 'Denmark', 0),
(61, 212, 'DM', 'DMA', 'Dominique', 'Dominica', 0),
(62, 214, 'DO', 'DOM', 'République Dominicaine', 'Dominican Republic', 0),
(63, 218, 'EC', 'ECU', 'Équateur', 'Ecuador', 0),
(64, 222, 'SV', 'SLV', 'El Salvador', 'El Salvador', 0),
(65, 226, 'GQ', 'GNQ', 'Guinée Équatoriale', 'Equatorial Guinea', 0),
(66, 231, 'ET', 'ETH', 'Éthiopie', 'Ethiopia', 0),
(67, 232, 'ER', 'ERI', 'Érythrée', 'Eritrea', 0),
(68, 233, 'EE', 'EST', 'Estonie', 'Estonia', 0),
(69, 234, 'FO', 'FRO', 'Îles Féroé', 'Faroe Islands', 0),
(70, 238, 'FK', 'FLK', 'Îles (malvinas) Falkland', 'Falkland Islands', 0),
(71, 239, 'GS', 'SGS', 'Géorgie du Sud et les Îles Sandwich du Sud', 'South Georgia and the South Sandwich Islands', 0),
(72, 242, 'FJ', 'FJI', 'Fidji', 'Fiji', 0),
(73, 246, 'FI', 'FIN', 'Finlande', 'Finland', 0),
(74, 248, 'AX', 'ALA', 'Îles Åland', 'Åland Islands', 0),
(75, 250, 'FR', 'FRA', 'France', 'France', 30),
(77, 258, 'PF', 'PYF', 'Polynésie Française', 'French Polynesia', 0),
(79, 262, 'DJ', 'DJI', 'Djibouti', 'Djibouti', 0),
(80, 266, 'GA', 'GAB', 'Gabon', 'Gabon', 0),
(81, 268, 'GE', 'GEO', 'Géorgie', 'Georgia', 0),
(82, 270, 'GM', 'GMB', 'Gambie', 'Gambia', 0),
(84, 276, 'DE', 'DEU', 'Allemagne', 'Germany', 20),
(85, 288, 'GH', 'GHA', 'Ghana', 'Ghana', 0),
(86, 292, 'GI', 'GIB', 'Gibraltar', 'Gibraltar', 0),
(87, 296, 'KI', 'KIR', 'Kiribati', 'Kiribati', 0),
(88, 300, 'GR', 'GRC', 'Grèce', 'Greece', 0),
(89, 304, 'GL', 'GRL', 'Groenland', 'Greenland', 0),
(90, 308, 'GD', 'GRD', 'Grenade', 'Grenada', 0),
(92, 316, 'GU', 'GUM', 'Guam', 'Guam', 0),
(93, 320, 'GT', 'GTM', 'Guatemala', 'Guatemala', 0),
(94, 324, 'GN', 'GIN', 'Guinée', 'Guinea', 0),
(95, 328, 'GY', 'GUY', 'Guyana', 'Guyana', 0),
(96, 332, 'HT', 'HTI', 'Haïti', 'Haiti', 0),
(99, 340, 'HN', 'HND', 'Honduras', 'Honduras', 0),
(100, 344, 'HK', 'HKG', 'Hong-Kong', 'Hong Kong', 0),
(101, 348, 'HU', 'HUN', 'Hongrie', 'Hungary', 0),
(102, 352, 'IS', 'ISL', 'Islande', 'Iceland', 0),
(103, 356, 'IN', 'IND', 'Inde', 'India', 0),
(104, 360, 'ID', 'IDN', 'Indonésie', 'Indonesia', 0),
(105, 364, 'IR', 'IRN', 'République Islamique d\'Iran', 'Islamic Republic of Iran', 0),
(106, 368, 'IQ', 'IRQ', 'Iraq', 'Iraq', 0),
(107, 372, 'IE', 'IRL', 'Irlande', 'Ireland', 0),
(108, 376, 'pls', 'pls', 'Palestine', 'Palestine', 0),
(109, 380, 'IT', 'ITA', 'Italie', 'Italy', 0),
(110, 384, 'CI', 'CIV', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 0),
(111, 388, 'JM', 'JAM', 'Jamaïque', 'Jamaica', 0),
(112, 392, 'JP', 'JPN', 'Japon', 'Japan', 0),
(113, 398, 'KZ', 'KAZ', 'Kazakhstan', 'Kazakhstan', 0),
(114, 400, 'JO', 'JOR', 'Jordanie', 'Jordan', 0),
(115, 404, 'KE', 'KEN', 'Kenya', 'Kenya', 0),
(116, 408, 'KP', 'PRK', 'République Populaire Démocratique de Corée', 'Democratic People\'s Republic of Korea', 0),
(117, 410, 'KR', 'KOR', 'République de Corée', 'Republic of Korea', 0),
(118, 414, 'KW', 'KWT', 'Koweït', 'Kuwait', 0),
(119, 417, 'KG', 'KGZ', 'Kirghizistan', 'Kyrgyzstan', 0),
(120, 418, 'LA', 'LAO', 'République Démocratique Populaire Lao', 'Lao People\'s Democratic Republic', 0),
(121, 422, 'LB', 'LBN', 'Liban', 'Lebanon', 4),
(122, 426, 'LS', 'LSO', 'Lesotho', 'Lesotho', 0),
(123, 428, 'LV', 'LVA', 'Lettonie', 'Latvia', 0),
(124, 430, 'LR', 'LBR', 'Libéria', 'Liberia', 0),
(125, 434, 'LY', 'LBY', 'Jamahiriya Arabe Libyenne', 'Libyan Arab Jamahiriya', 0),
(126, 438, 'LI', 'LIE', 'Liechtenstein', 'Liechtenstein', 0),
(127, 440, 'LT', 'LTU', 'Lituanie', 'Lithuania', 0),
(128, 442, 'LU', 'LUX', 'Luxembourg', 'Luxembourg', 0),
(129, 446, 'MO', 'MAC', 'Macao', 'Macao', 0),
(130, 450, 'MG', 'MDG', 'Madagascar', 'Madagascar', 0),
(131, 454, 'MW', 'MWI', 'Malawi', 'Malawi', 0),
(132, 458, 'MY', 'MYS', 'Malaisie', 'Malaysia', 0),
(133, 462, 'MV', 'MDV', 'Maldives', 'Maldives', 0),
(134, 466, 'ML', 'MLI', 'Mali', 'Mali', 0),
(135, 470, 'MT', 'MLT', 'Malte', 'Malta', 0),
(136, 474, 'MQ', 'MTQ', 'Martinique', 'Martinique', 0),
(137, 478, 'MR', 'MRT', 'Mauritanie', 'Mauritania', 0),
(138, 480, 'MU', 'MUS', 'Maurice', 'Mauritius', 0),
(139, 484, 'MX', 'MEX', 'Mexique', 'Mexico', 0),
(140, 492, 'MC', 'MCO', 'Monaco', 'Monaco', 2),
(141, 496, 'MN', 'MNG', 'Mongolie', 'Mongolia', 0),
(142, 498, 'MD', 'MDA', 'République de Moldova', 'Republic of Moldova', 0),
(143, 500, 'MS', 'MSR', 'Montserrat', 'Montserrat', 0),
(144, 504, 'MA', 'MAR', 'Maroc', 'Morocco', 7),
(145, 508, 'MZ', 'MOZ', 'Mozambique', 'Mozambique', 0),
(146, 512, 'OM', 'OMN', 'Oman', 'Oman', 0),
(147, 516, 'NA', 'NAM', 'Namibie', 'Namibia', 0),
(148, 520, 'NR', 'NRU', 'Nauru', 'Nauru', 0),
(149, 524, 'NP', 'NPL', 'Népal', 'Nepal', 0),
(150, 528, 'NL', 'NLD', 'Pays-Bas', 'Netherlands', 0),
(151, 530, 'AN', 'ANT', 'Antilles Néerlandaises', 'Netherlands Antilles', 0),
(152, 533, 'AW', 'ABW', 'Aruba', 'Aruba', 0),
(154, 548, 'VU', 'VUT', 'Vanuatu', 'Vanuatu', 0),
(155, 554, 'NZ', 'NZL', 'Nouvelle-Zélande', 'New Zealand', 0),
(156, 558, 'NI', 'NIC', 'Nicaragua', 'Nicaragua', 0),
(157, 562, 'NE', 'NER', 'Niger', 'Niger', 0),
(158, 566, 'NG', 'NGA', 'Nigéria', 'Nigeria', 0),
(159, 570, 'NU', 'NIU', 'Niué', 'Niue', 0),
(160, 574, 'NF', 'NFK', 'Île Norfolk', 'Norfolk Island', 0),
(161, 578, 'NO', 'NOR', 'Norvège', 'Norway', 0),
(162, 580, 'MP', 'MNP', 'Îles Mariannes du Nord', 'Northern Mariana Islands', 0),
(164, 583, 'FM', 'FSM', 'États Fédérés de Micronésie', 'Federated States of Micronesia', 0),
(165, 584, 'MH', 'MHL', 'Îles Marshall', 'Marshall Islands', 0),
(166, 585, 'PW', 'PLW', 'Palaos', 'Palau', 0),
(167, 586, 'PK', 'PAK', 'Pakistan', 'Pakistan', 0),
(168, 591, 'PA', 'PAN', 'Panama', 'Panama', 0),
(169, 598, 'PG', 'PNG', 'Papouasie-Nouvelle-Guinée', 'Papua New Guinea', 0),
(170, 600, 'PY', 'PRY', 'Paraguay', 'Paraguay', 0),
(172, 608, 'PH', 'PHL', 'Philippines', 'Philippines', 0),
(173, 612, 'PN', 'PCN', 'Pitcairn', 'Pitcairn', 0),
(174, 616, 'PL', 'POL', 'Pologne', 'Poland', 0),
(175, 620, 'PT', 'PRT', 'Portugal', 'Portugal', 0),
(176, 624, 'GW', 'GNB', 'Guinée-Bissau', 'Guinea-Bissau', 0),
(177, 626, 'TL', 'TLS', 'Timor-Leste', 'Timor-Leste', 0),
(178, 630, 'PR', 'PRI', 'Porto Rico', 'Puerto Rico', 0),
(179, 634, 'QA', 'QAT', 'Qatar', 'Qatar', 0),
(181, 642, 'RO', 'ROU', 'Roumanie', 'Romania', 0),
(182, 643, 'RU', 'RUS', 'Fédération de Russie', 'Russian Federation', 0),
(183, 646, 'RW', 'RWA', 'Rwanda', 'Rwanda', 0),
(184, 654, 'SH', 'SHN', 'Sainte-Hélène', 'Saint Helena', 0),
(185, 659, 'KN', 'KNA', 'Saint-Kitts-et-Nevis', 'Saint Kitts and Nevis', 0),
(186, 660, 'AI', 'AIA', 'Anguilla', 'Anguilla', 0),
(187, 662, 'LC', 'LCA', 'Sainte-Lucie', 'Saint Lucia', 0),
(188, 666, 'PM', 'SPM', 'Saint-Pierre-et-Miquelon', 'Saint-Pierre and Miquelon', 0),
(189, 670, 'VC', 'VCT', 'Saint-Vincent-et-les Grenadines', 'Saint Vincent and the Grenadines', 0),
(190, 674, 'SM', 'SMR', 'Saint-Marin', 'San Marino', 0),
(191, 678, 'ST', 'STP', 'Sao Tomé-et-Principe', 'Sao Tome and Principe', 0),
(192, 682, 'SA', 'SAU', 'Arabie Saoudite', 'Saudi Arabia', 0),
(193, 686, 'SN', 'SEN', 'Sénégal', 'Senegal', 0),
(194, 690, 'SC', 'SYC', 'Seychelles', 'Seychelles', 0),
(195, 694, 'SL', 'SLE', 'Sierra Leone', 'Sierra Leone', 0),
(196, 702, 'SG', 'SGP', 'Singapour', 'Singapore', 0),
(197, 703, 'SK', 'SVK', 'Slovaquie', 'Slovakia', 0),
(198, 704, 'VN', 'VNM', 'Viet Nam', 'Vietnam', 0),
(199, 705, 'SI', 'SVN', 'Slovénie', 'Slovenia', 0),
(200, 706, 'SO', 'SOM', 'Somalie', 'Somalia', 0),
(201, 710, 'ZA', 'ZAF', 'Afrique du Sud', 'South Africa', 0),
(202, 716, 'ZW', 'ZWE', 'Zimbabwe', 'Zimbabwe', 0),
(203, 724, 'ES', 'ESP', 'Espagne', 'Spain', 0),
(205, 736, 'SD', 'SDN', 'Soudan', 'Sudan', 0),
(206, 740, 'SR', 'SUR', 'Suriname', 'Suriname', 0),
(208, 748, 'SZ', 'SWZ', 'Swaziland', 'Swaziland', 0),
(209, 752, 'SE', 'SWE', 'Suède', 'Sweden', 0),
(210, 756, 'CH', 'CHE', 'Suisse', 'Switzerland', 4),
(211, 760, 'SY', 'SYR', 'République Arabe Syrienne', 'Syrian Arab Republic', 0),
(212, 762, 'TJ', 'TJK', 'Tadjikistan', 'Tajikistan', 0),
(213, 764, 'TH', 'THA', 'Thaïlande', 'Thailand', 0),
(214, 768, 'TG', 'TGO', 'Togo', 'Togo', 0),
(216, 776, 'TO', 'TON', 'Tonga', 'Tonga', 0),
(217, 780, 'TT', 'TTO', 'Trinité-et-Tobago', 'Trinidad and Tobago', 0),
(218, 784, 'AE', 'ARE', 'Émirats Arabes Unis', 'United Arab Emirates', 0),
(219, 788, 'TN', 'TUN', 'Tunisie', 'Tunisia', 50),
(220, 792, 'TR', 'TUR', 'Turquie', 'Turkey', 0),
(221, 795, 'TM', 'TKM', 'Turkménistan', 'Turkmenistan', 0),
(222, 796, 'TC', 'TCA', 'Îles Turks et Caïques', 'Turks and Caicos Islands', 0),
(223, 798, 'TV', 'TUV', 'Tuvalu', 'Tuvalu', 0),
(224, 800, 'UG', 'UGA', 'Ouganda', 'Uganda', 0),
(225, 804, 'UA', 'UKR', 'Ukraine', 'Ukraine', 0),
(227, 818, 'EG', 'EGY', 'Égypte', 'Egypt', 0),
(228, 826, 'GB', 'GBR', 'Royaume-Uni', 'United Kingdom', 0),
(229, 833, 'IM', 'IMN', 'Île de Man', 'Isle of Man', 0),
(230, 834, 'TZ', 'TZA', 'République-Unie de Tanzanie', 'United Republic Of Tanzania', 0),
(231, 840, 'US', 'USA', 'États-Unis', 'United States', 0),
(232, 850, 'VI', 'VIR', 'Îles Vierges des États-Unis', 'U.S. Virgin Islands', 0),
(233, 854, 'BF', 'BFA', 'Burkina Faso', 'Burkina Faso', 0),
(234, 858, 'UY', 'URY', 'Uruguay', 'Uruguay', 0),
(235, 860, 'UZ', 'UZB', 'Ouzbékistan', 'Uzbekistan', 0),
(236, 862, 'VE', 'VEN', 'Venezuela', 'Venezuela', 0),
(237, 876, 'WF', 'WLF', 'Wallis et Futuna', 'Wallis and Futuna', 0),
(238, 882, 'WS', 'WSM', 'Samoa', 'Samoa', 0),
(239, 887, 'YE', 'YEM', 'Yémen', 'Yemen', 0),
(241, 894, 'ZM', 'ZMB', 'Zambie', 'Zambia', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pitchvideometa`
--

CREATE TABLE `pitchvideometa` (
  `idPitch` varchar(255) NOT NULL,
  `step` int NOT NULL,
  `starttime` int NOT NULL,
  `endtime` int NOT NULL,
  `text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pitchvideos`
--

CREATE TABLE `pitchvideos` (
  `idEntry` int NOT NULL,
  `PitchFile` varchar(255) NOT NULL,
  `dateOf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUser` int NOT NULL,
  `Visibility` int NOT NULL DEFAULT '0' COMMENT '0: public 1: only application',
  `deleted` int NOT NULL DEFAULT '0',
  `defaultVid` int NOT NULL DEFAULT '1',
  `pitchPath` varchar(255) NOT NULL DEFAULT '/assets/video/pitch/',
  `webm` varchar(255) DEFAULT NULL,
  `mp4` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `remoteUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pretentionssalariales`
--

CREATE TABLE `pretentionssalariales` (
  `idEntry` int NOT NULL,
  `idUser` int NOT NULL,
  `idJob` int NOT NULL DEFAULT '0',
  `idPositionNom` int NOT NULL,
  `min` int NOT NULL,
  `max` int NOT NULL,
  `DateOf` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Currency` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questionnaires`
--

CREATE TABLE `questionnaires` (
  `IdEntry` int NOT NULL,
  `IdBusiness` int NOT NULL,
  `name` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `state` int NOT NULL,
  `createdBy` int NOT NULL,
  `lang` varchar(3) NOT NULL DEFAULT 'fr',
  `text_generated_from` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questionslibrary`
--

CREATE TABLE `questionslibrary` (
  `IdEntry` int NOT NULL,
  `text` mediumtext NOT NULL,
  `time` int NOT NULL,
  `pageid` int NOT NULL,
  `UserId` int NOT NULL,
  `lang` varchar(3) NOT NULL DEFAULT 'fr',
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `redirectlog`
--

CREATE TABLE `redirectlog` (
  `idEntry` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `targetId` int NOT NULL,
  `targetType` varchar(11) NOT NULL DEFAULT '1',
  `dateOf` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserId` int DEFAULT '0',
  `sourceOfRedirect` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_social_providers`
--

CREATE TABLE `ref_social_providers` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ref_social_providers`
--

INSERT INTO `ref_social_providers` (`id`, `name`, `logo`) VALUES
(1, 'Github', '/assets/img/social-icons/32/social-041-round_github.png'),
(2, 'Linkedin', '/assets/img/social-icons/32/social-011_linkedin.png'),
(3, 'Facebook', '/assets/img/social-icons/32/social-006-round_facebook.png'),
(4, 'Twitter', '/assets/img/social-icons/32/social-003_twitter.png');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int NOT NULL,
  `regionname` varchar(80) NOT NULL,
  `countryid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rejectionfeedbacklist`
--

CREATE TABLE `rejectionfeedbacklist` (
  `idEntry` int NOT NULL,
  `text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rejectionfeedbacklist`
--

INSERT INTO `rejectionfeedbacklist` (`idEntry`, `text`) VALUES
(1, 'Profil incomplet'),
(2, 'Manque d\'engagement du candidat'),
(3, 'Le poste a été pourvu par un autre candidat'),
(4, 'Les prétentions salariales sont plus élevées que le budget alloué pour le poste.'),
(5, 'Manque d’expérience ou de compétences techniques requises pour ce poste.'),
(6, 'Le profil ne correspond pas à l\'offre'),
(7, 'Aucun motif');

-- --------------------------------------------------------

--
-- Table structure for table `reviews_answers`
--

CREATE TABLE `reviews_answers` (
  `idEntry` int NOT NULL,
  `idReview` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idQuestion` int NOT NULL,
  `Rating` int NOT NULL,
  `dateOf` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `secteur_acrivitees`
--

CREATE TABLE `secteur_acrivitees` (
  `id` int NOT NULL,
  `nomenclature` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `en_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slogo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '/img/secteur-activ-icons/1.png',
  `sponderation` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `secteur_acrivitees`
--

INSERT INTO `secteur_acrivitees` (`id`, `nomenclature`, `en_name`, `slogo`, `sponderation`) VALUES
(1, 'aeronautique / aviation / voyagiste', 'aeronautics / aviation / tour operator', '/assets/img/secteur-activ-icons/1.png', 0),
(2, 'agriculture / agro-alimentaire / environnement', 'agriculture / agri-food / environment', '/assets/img/secteur-activ-icons/2.png', 9),
(3, 'architecture / immobilier / BTP', 'architecture / real estate / construction', '/assets/img/secteur-activ-icons/3.png', 8),
(4, 'artisanat / textile / cuir', 'handicrafts / textiles / leather', '/assets/img/secteur-activ-icons/4.png', 1),
(5, 'automobile / moteurs / engins mécaniques', 'automotive / engines / mechanical gear', '/assets/img/secteur-activ-icons/5.png', 0),
(6, 'banque / finance / assurances', 'banking / finance / insurance', '/assets/img/secteur-activ-icons/6.png', 10),
(7, 'call center / télévente', 'call center / telesales', '/assets/img/secteur-activ-icons/7.png', 25),
(8, 'chimie / biologie / physique', 'chemistry / biology / physics', '/assets/img/secteur-activ-icons/8.png', 6),
(9, 'commerce / vente / distribution', 'trade / sales / distribution', '/assets/img/secteur-activ-icons/9.png', 12),
(10, 'communication / publicité / média', 'communication / advertising / media', '/assets/img/secteur-activ-icons/10.png', 15),
(11, 'comptabilité / gestion / audit', 'accounting / management / audit', '/assets/img/secteur-activ-icons/11.png', 14),
(12, 'consulting / étude / stratégie', 'consulting / study / strategy', '/assets/img/secteur-activ-icons/12.png', 46),
(13, 'cosmétique / parfumerie / luxe', 'cosmetics / perfumery / luxury', '/assets/img/secteur-activ-icons/13.png', 0),
(14, 'culture / audiovisuel', 'culture / audiovisual', '/assets/img/secteur-activ-icons/14.png', 0),
(15, 'droit / fiscalité', 'law / taxation', '/assets/img/secteur-activ-icons/15.png', 7),
(16, 'électronique / électricité / énergie', 'electronics / electricity / energy', '/assets/img/secteur-activ-icons/16.png', 1),
(17, 'enseignement / formation / puériculture', 'education / training / childcare', '/assets/img/secteur-activ-icons/17.png', 5),
(18, 'fonction publique / collectivités locales', 'civil service / local authorities', '/assets/img/secteur-activ-icons/18.png', 1),
(19, 'gardiennage / sécurité / maintenance', 'guarding / security / maintenance', '/assets/img/secteur-activ-icons/19.png', 0),
(20, 'import / export', 'import Export', '/assets/img/secteur-activ-icons/20.png', 1),
(21, 'industrie électro-mécaniques', 'electro-mechanical industry', '/assets/img/secteur-activ-icons/21.png', 0),
(22, 'industrie métalliques', 'metal industry', '/assets/img/secteur-activ-icons/22.png', 1),
(23, 'informatique / télécoms', 'IT / telecommunications', '/assets/img/secteur-activ-icons/23.png', 134),
(24, 'journalisme / traduction / édition', 'journalism / translation / publishing', '/assets/img/secteur-activ-icons/24.png', 0),
(25, 'recrutement / ressources humaines', 'recruitment / human resources', '/assets/img/secteur-activ-icons/25.png', 83),
(26, 'santé / paramédical / optique', 'health / paramedical / optical', '/assets/img/secteur-activ-icons/26.png\n\n', 2),
(27, 'tourisme / hotellerie / restauration / loisirs', 'tourism / hotels / catering / leisure', '/assets/img/secteur-activ-icons/27.png\n\n', 4),
(28, 'transport / logistique', 'logistic transport', '/assets/img/secteur-activ-icons/28.png\n\n', 3),
(29, 'autres', 'others', '/assets/img/secteur-activ-icons/29.png\n\n', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `name` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pond` int NOT NULL DEFAULT '0',
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '/assets/img/skills-logos/logo.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universites`
--

CREATE TABLE `universites` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `abrev` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `pond` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int NOT NULL,
  `User_fname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `User_lname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `User_pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'https://fabevent.s3.eu-west-3.amazonaws.com/assets/img/photoup/default_avatar.png',
  `Src_of_login` int NOT NULL,
  `original_id` varchar(255) NOT NULL,
  `completition` int NOT NULL DEFAULT '0',
  `online` int NOT NULL DEFAULT '0',
  `lastSeen` datetime NOT NULL DEFAULT '2018-07-07 07:27:47',
  `CreatedDate` datetime NOT NULL DEFAULT '2018-12-07 07:17:17',
  `visibility_search` tinyint(1) NOT NULL DEFAULT '1',
  `visibility_suggestion` tinyint(1) NOT NULL DEFAULT '1',
  `preferred_language` varchar(4) NOT NULL DEFAULT 'fr' COMMENT 'fr,en',
  `state` tinyint NOT NULL DEFAULT '1' COMMENT '0:disabled, 1:active 2:supressed'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userreview`
--

CREATE TABLE `userreview` (
  `id` varchar(30) NOT NULL,
  `idBusiness` int NOT NULL,
  `type` int NOT NULL,
  `idUser` int DEFAULT NULL,
  `dateOf` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_has_social_link`
--

CREATE TABLE `user_has_social_link` (
  `idUser` int NOT NULL,
  `idProvider` int NOT NULL,
  `link` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role_business`
--

CREATE TABLE `user_role_business` (
  `idEntry` int NOT NULL,
  `idInvit` int NOT NULL,
  `idBuspage` int NOT NULL,
  `idUser` int NOT NULL,
  `role` int NOT NULL COMMENT '1:admin 2:collab',
  `dateAccept` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `validation_codes`
--

CREATE TABLE `validation_codes` (
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_avantages_pro`
--

CREATE TABLE `_avantages_pro` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `en_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '/img/benefits/023-businessman.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_avantages_pro`
--

INSERT INTO `_avantages_pro` (`id`, `name`, `en_name`, `logo`) VALUES
(1, 'Logement gratuit ou à tarif réduit', 'Free or reduced rate accommodation', '/assets/img/benefits/mortgage.png'),
(2, 'Fourniture de repas gratuits ou à prix préférentiel', 'Provision of free or preferentially priced meals', '/assets/img/benefits/016-salad.png'),
(3, 'Attribution de chèques-restaurant ou de chèques-transport', 'Allocation of meal vouchers or travel vouchers', '/assets/img/benefits/cash.png'),
(4, 'Attribution d’un véhicule', 'Allocation of a vehicle', '/assets/img/benefits/car.png'),
(5, 'Bénéfice de prêts à taux préférentiels', 'Benefit from loans at preferential rates', '/assets/img/benefits/loan.png'),
(6, 'Attribution gratuite d’une carte bancaire', 'Free allocation of a bank card', '/assets/img/benefits/credit-card.png'),
(7, 'Fourniture de vêtements d’usage courant', 'Provision of everyday clothing', '/assets/img/benefits/027-shirt.png'),
(8, 'Prix préférentiels sur des fournitures ou services produits par l’entreprise', 'Preferential prices on supplies or services produced by the company', '/assets/img/benefits/sale-1.png'),
(9, 'Usage d’un téléphone portable, d’un micro-ordinateur en dehors des heures de travail', 'Use of a mobile phone, a microcomputer outside working hours', '/assets/img/benefits/purchase.png	'),
(10, 'Fourniture d’abonnements (téléphonique, internet) ', 'Provision of subscriptions (telephone, internet)', '/assets/img/benefits/010-cloud-computing-1.png	'),
(11, 'Cadeau lié à un évènement (par exemple : le départ à la retraite)', 'Gift linked to an event (for example: retirement)', '/assets/img/benefits/023-businessman.png	'),
(12, 'Participation aux frais de transport', 'Participation in transport costs', '/assets/img/benefits/025-location.png	'),
(13, 'Conventions diverses avec prestataires tierces', 'Various agreements with third-party service providers', '/assets/img/benefits/shop.png'),
(14, 'Assurance de groupe, assurance maladie assurance dentaire ...', 'Group insurance, health insurance dental insurance ...', '/assets/img/benefits/012-pulse.png');

-- --------------------------------------------------------

--
-- Table structure for table `_bus_pages`
--

CREATE TABLE `_bus_pages` (
  `idEntry` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `secteur_activite` int NOT NULL,
  `owner` int NOT NULL,
  `website` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `fbpage` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `paysID` int DEFAULT NULL,
  `regionID` int DEFAULT NULL,
  `codePostal` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TextAdress` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `Phone` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'https://aneti.s3.eu-west-3.amazonaws.com/img/defaultbusinesslogo.png',
  `fbAbout` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `fbDescription` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `latitude` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `matricule` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `checked` int NOT NULL DEFAULT '0' COMMENT '0:nochecked1:enattente2:checked',
  `account` int NOT NULL DEFAULT '5',
  `isDeleted` int NOT NULL DEFAULT '0',
  `cover` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dateOf` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tailleEntrprise` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_disponibilite`
--

CREATE TABLE `_disponibilite` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `en_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_disponibilite`
--

INSERT INTO `_disponibilite` (`id`, `name`, `en_name`) VALUES
(1, 'Plein temps présentiel', 'Office Full-Time'),
(2, 'Temps partiel', 'Part time'),
(3, 'Travail à distance', 'Remote working'),
(4, 'Hybride présentiel et à distance', 'Hybrid working');

-- --------------------------------------------------------

--
-- Table structure for table `_job_advert_state`
--

CREATE TABLE `_job_advert_state` (
  `id` int NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `en_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_job_advert_state`
--

INSERT INTO `_job_advert_state` (`id`, `name`, `en_name`) VALUES
(0, 'Brouillon', 'Rough draft'),
(1, 'Vérification', 'Verification'),
(2, 'Diffusion', 'Diffusion'),
(3, 'Refusée', 'Refused'),
(4, 'Cloturée', 'Closed'),
(5, 'Planifié', 'Planned'),
(6, 'Expirée', 'Expired'),
(7, 'Supprimée', 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `_job_experience`
--

CREATE TABLE `_job_experience` (
  `idEntry` int NOT NULL,
  `UserId` int NOT NULL,
  `EntrepriseID` int DEFAULT NULL,
  `PosteID` int NOT NULL,
  `SecteurID` int DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `Custom` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `Actual` int NOT NULL DEFAULT '1',
  `typedecontrat` int NOT NULL DEFAULT '7'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_job_offers`
--

CREATE TABLE `_job_offers` (
  `idEntry` int NOT NULL,
  `idPage` int NOT NULL,
  `custom_title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `ref_inter` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `jobTitle` int NOT NULL,
  `secteur` int NOT NULL,
  `pays` int NOT NULL,
  `region` int DEFAULT NULL,
  `typeContrat` int NOT NULL,
  `exp` int NOT NULL,
  `min` int DEFAULT NULL,
  `max` int DEFAULT NULL,
  `dep_nat` tinyint(1) NOT NULL,
  `dep_int` tinyint(1) NOT NULL,
  `Date_creation` datetime NOT NULL,
  `status` int DEFAULT '0' COMMENT '0: draft, 1: verif , 2: ok, 3: refusee , 4: cloturee , 7: deleted',
  `created_by` int NOT NULL,
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `disponibilite` int NOT NULL DEFAULT '1',
  `Diffusion` int NOT NULL DEFAULT '1',
  `visuel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `automate_pitch` tinyint(1) NOT NULL DEFAULT '1',
  `automate_vid_diff` int NOT NULL DEFAULT '0',
  `detected_lang` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '//fr En or any lang',
  `Date_Fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_langues`
--

CREATE TABLE `_langues` (
  `id` int NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `en_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_langues`
--

INSERT INTO `_langues` (`id`, `name`, `en_name`) VALUES
(1, 'Allemand', 'German'),
(2, 'Anglais', 'English'),
(3, 'Arabe', 'Arabic'),
(4, 'Chinois', 'Chinese'),
(5, 'Espagnol', 'Spanish'),
(6, 'Français', 'French'),
(7, 'Japonais', 'Japanese'),
(8, 'Portugais', 'Portuguese'),
(9, 'Russe', 'Russian'),
(10, 'Italien', 'Italian'),
(11, 'Polonais', 'Polish'),
(12, 'Néerlandais', 'Dutch'),
(13, 'Tchèque', 'Czech');

-- --------------------------------------------------------

--
-- Table structure for table `_lang_niv`
--

CREATE TABLE `_lang_niv` (
  `id` int NOT NULL,
  `name` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `en_name` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_lang_niv`
--

INSERT INTO `_lang_niv` (`id`, `name`, `en_name`) VALUES
(1, 'connaissances de base', 'basic knowledge'),
(2, 'bonnes connaissances', 'good knowledge'),
(3, 'très bonnes connaissances', 'very good knowledge'),
(4, 'courant (écrit et parlé)', 'fluent (written and spoken)'),
(5, 'bilingue', 'bilingual'),
(6, 'langue maternelle', 'native speaker');

-- --------------------------------------------------------

--
-- Table structure for table `_lang_of_users`
--

CREATE TABLE `_lang_of_users` (
  `IdEntry` int NOT NULL,
  `IdUser` int NOT NULL,
  `IdLang` int NOT NULL DEFAULT '1',
  `Level` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_needed_advantages_for_a_job`
--

CREATE TABLE `_needed_advantages_for_a_job` (
  `idEntry` int NOT NULL,
  `idJob` int NOT NULL,
  `advantage` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_needed_diplome_for_a_job`
--

CREATE TABLE `_needed_diplome_for_a_job` (
  `idEntry` int NOT NULL,
  `idJob` int NOT NULL,
  `idDiplome` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_needed_langages_for_a_job`
--

CREATE TABLE `_needed_langages_for_a_job` (
  `idEntry` int NOT NULL,
  `idJob` int NOT NULL,
  `langage` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_needed_skills_for_a_job`
--

CREATE TABLE `_needed_skills_for_a_job` (
  `idEntry` int NOT NULL,
  `idJob` int NOT NULL,
  `skill` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_photos_bus_cover`
--

CREATE TABLE `_photos_bus_cover` (
  `idEntry` int NOT NULL,
  `businessID` int NOT NULL,
  `dateOfUpload` datetime NOT NULL,
  `source` text NOT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '//1 cover                     //2 workspace                     //3 team',
  `deleted` int NOT NULL DEFAULT '0',
  `thumbnail` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `_project_images`
--

CREATE TABLE `_project_images` (
  `idEntry` int NOT NULL,
  `UserId` int NOT NULL,
  `idProject` int NOT NULL,
  `title` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `full_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_questionnaire_questions`
--

CREATE TABLE `_questionnaire_questions` (
  `IdEntry` int NOT NULL,
  `IdQuestionnaire` int NOT NULL,
  `IdQuestion` int NOT NULL,
  `time` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_tags_of_users`
--

CREATE TABLE `_tags_of_users` (
  `autoId` int NOT NULL,
  `idEntry` int NOT NULL,
  `idUser` int NOT NULL,
  `idTag` int NOT NULL,
  `type` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_tasks_of_users`
--

CREATE TABLE `_tasks_of_users` (
  `idEntry` int NOT NULL,
  `idUser` int NOT NULL,
  `Task` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '1:experience 2:project'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_team_photo_quotes`
--

CREATE TABLE `_team_photo_quotes` (
  `idPicture` int NOT NULL,
  `temMemberName` varchar(255) NOT NULL,
  `temMemberPosition` text NOT NULL,
  `Quote` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `_usersummary`
--

CREATE TABLE `_usersummary` (
  `IdEntry` int NOT NULL,
  `UserId` int NOT NULL,
  `Summary` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_candidature_job`
--

CREATE TABLE `_user_candidature_job` (
  `IdEntry` int NOT NULL,
  `UserId` int NOT NULL,
  `id_Job_Offer` int NOT NULL,
  `date` datetime NOT NULL,
  `state` int NOT NULL DEFAULT '1' COMMENT '//1 eval CV,  2: préselection, 3: entretien physique, 4: retenu, 5 vivier, 6: refusé, 7:cancelled by user',
  `lastEmailedForPitch` datetime NOT NULL DEFAULT '2019-07-27 23:47:27',
  `matchingScore` decimal(5,3) NOT NULL DEFAULT '0.000',
  `lastDateOfMatching` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_certifications`
--

CREATE TABLE `_user_certifications` (
  `IdEntry` int NOT NULL,
  `UserId` int NOT NULL,
  `Label_Certif` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Provider_Certif` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Date_Certif` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_communication_prefernces`
--

CREATE TABLE `_user_communication_prefernces` (
  `userId` int NOT NULL,
  `send_jobs_suggestions` int NOT NULL DEFAULT '1',
  `send_event_suggestions` int NOT NULL DEFAULT '1',
  `send_featured_jobs` int NOT NULL DEFAULT '1',
  `send_also_sms` int NOT NULL DEFAULT '1',
  `sal_range_min` int DEFAULT NULL,
  `sal_range_max` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_details`
--

CREATE TABLE `_user_details` (
  `UserId` int NOT NULL,
  `situation` int DEFAULT '3',
  `ExperienceID` int DEFAULT '1',
  `UserPhone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserEmail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserCountryId` int DEFAULT '219',
  `UserRegionId` int DEFAULT NULL,
  `TextAdress` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `Date_Naiss` date DEFAULT NULL,
  `verified` int NOT NULL DEFAULT '1',
  `Nationalitee` int DEFAULT NULL COMMENT 'Id from country Ids',
  `lastEmailed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unsubscribed` int NOT NULL DEFAULT '0',
  `bounced` int NOT NULL DEFAULT '0',
  `cv_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'full url',
  `cv_built` tinyint NOT NULL DEFAULT '0' COMMENT 'if cv was built by fabskill'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_formation`
--

CREATE TABLE `_user_formation` (
  `idEntry` int NOT NULL,
  `UserId` int NOT NULL,
  `startyear` int DEFAULT NULL,
  `endyear` int DEFAULT NULL,
  `FiliereID` int DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `UnivID` int DEFAULT NULL,
  `Custom` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `Description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `state` int NOT NULL DEFAULT '0' COMMENT '//$stateValue 0: waiting for appr , 1: refused , 2: approved	',
  `idCohort` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_interests`
--

CREATE TABLE `_user_interests` (
  `IdEntry` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `UserId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_project`
--

CREATE TABLE `_user_project` (
  `idEntry` int NOT NULL,
  `UserId` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `projectTitle` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_user_types`
--

CREATE TABLE `_user_types` (
  `id` int NOT NULL,
  `Label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_label` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `en_name` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `_user_types`
--

INSERT INTO `_user_types` (`id`, `Label`, `short_label`, `en_name`) VALUES
(1, 'Etudiant(e) à la recherche d\'un stage', 'Etudiant(e) à la recherche d\'un stage', 'Student looking for an internship'),
(3, 'A la recherche d\'une nouvelle opportunité', 'A la recherche d\'un emploi', 'Looking for a new opportunity'),
(4, 'Recruteur', 'Recruteur', 'Recruiter'),
(5, 'A la recherche de formations', 'A la recherche de formations', 'Looking for training');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businesspagestats`
--
ALTER TABLE `businesspagestats`
  ADD PRIMARY KEY (`IdEntry`);

--
-- Indexes for table `business_videos`
--
ALTER TABLE `business_videos`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `businessID` (`businessID`);

--
-- Indexes for table `candidates_survey_question`
--
ALTER TABLE `candidates_survey_question`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `candidaturestatechangelog`
--
ALTER TABLE `candidaturestatechangelog`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idCandidature` (`idCandidature`),
  ADD KEY `Motif` (`Motif`);

--
-- Indexes for table `centraliseallnotificationscandidature`
--
ALTER TABLE `centraliseallnotificationscandidature`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idPage` (`idPage`);

--
-- Indexes for table `creds`
--
ALTER TABLE `creds`
  ADD PRIMARY KEY (`id_user`) USING BTREE;

--
-- Indexes for table `email_pipe`
--
ALTER TABLE `email_pipe`
  ADD PRIMARY KEY (`idEntry`);

--
-- Indexes for table `feedbackevaluation`
--
ALTER TABLE `feedbackevaluation`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `IdCandidature` (`IdCandidature`),
  ADD KEY `idCollab` (`idCollab`);

--
-- Indexes for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `idPage` (`idPage`),
  ADD KEY `IdCandidature` (`IdCandidature`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `jb_contrat`
--
ALTER TABLE `jb_contrat`
  ADD PRIMARY KEY (`contratId`);

--
-- Indexes for table `jb_exp`
--
ALTER TABLE `jb_exp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobofferstats`
--
ALTER TABLE `jobofferstats`
  ADD PRIMARY KEY (`IdEntry`);

--
-- Indexes for table `job_alerts`
--
ALTER TABLE `job_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_job_alerts` (`idUser`),
  ADD KEY `country_job_alerts` (`idCountry`),
  ADD KEY `job_exp_job_alert` (`experienceId`);

--
-- Indexes for table `job_alerts_skills`
--
ALTER TABLE `job_alerts_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_alerts_skills_jobalert` (`idJobAlert`),
  ADD KEY `tags_job_alerts` (`idTag`);

--
-- Indexes for table `job_text_translations`
--
ALTER TABLE `job_text_translations`
  ADD KEY `idJob` (`idJob`);

--
-- Indexes for table `learn_interest_skills`
--
ALTER TABLE `learn_interest_skills`
  ADD PRIMARY KEY (`idTag`,`idUser`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `liste_formations`
--
ALTER TABLE `liste_formations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liste_type_diplomes`
--
ALTER TABLE `liste_type_diplomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noms_de_metiers`
--
ALTER TABLE `noms_de_metiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nom_de_societe`
--
ALTER TABLE `nom_de_societe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcountry` (`idcountry`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pitchvideometa`
--
ALTER TABLE `pitchvideometa`
  ADD PRIMARY KEY (`idPitch`,`step`);

--
-- Indexes for table `pitchvideos`
--
ALTER TABLE `pitchvideos`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idPitch` (`PitchFile`),
  ADD KEY `idPitch_2` (`PitchFile`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `pretentionssalariales`
--
ALTER TABLE `pretentionssalariales`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idJob` (`idJob`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idPositionNom` (`idPositionNom`);

--
-- Indexes for table `questionnaires`
--
ALTER TABLE `questionnaires`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `createdBy` (`createdBy`);

--
-- Indexes for table `questionslibrary`
--
ALTER TABLE `questionslibrary`
  ADD PRIMARY KEY (`IdEntry`);

--
-- Indexes for table `redirectlog`
--
ALTER TABLE `redirectlog`
  ADD PRIMARY KEY (`idEntry`);

--
-- Indexes for table `ref_social_providers`
--
ALTER TABLE `ref_social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countryid` (`countryid`);

--
-- Indexes for table `rejectionfeedbacklist`
--
ALTER TABLE `rejectionfeedbacklist`
  ADD PRIMARY KEY (`idEntry`);

--
-- Indexes for table `reviews_answers`
--
ALTER TABLE `reviews_answers`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idReview` (`idReview`),
  ADD KEY `idQuestion` (`idQuestion`);

--
-- Indexes for table `secteur_acrivitees`
--
ALTER TABLE `secteur_acrivitees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universites`
--
ALTER TABLE `universites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `userreview`
--
ALTER TABLE `userreview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `user_has_social_link`
--
ALTER TABLE `user_has_social_link`
  ADD PRIMARY KEY (`idUser`,`idProvider`),
  ADD KEY `fk_social_provider_user` (`idProvider`);

--
-- Indexes for table `user_role_business`
--
ALTER TABLE `user_role_business`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idBuspage` (`idBuspage`);

--
-- Indexes for table `validation_codes`
--
ALTER TABLE `validation_codes`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `_avantages_pro`
--
ALTER TABLE `_avantages_pro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_bus_pages`
--
ALTER TABLE `_bus_pages`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `secteur_activite` (`secteur_activite`),
  ADD KEY `paysID` (`paysID`),
  ADD KEY `owner` (`owner`),
  ADD KEY `account` (`account`),
  ADD KEY `regionID` (`regionID`);

--
-- Indexes for table `_disponibilite`
--
ALTER TABLE `_disponibilite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_job_advert_state`
--
ALTER TABLE `_job_advert_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_job_experience`
--
ALTER TABLE `_job_experience`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `typedecontrat` (`typedecontrat`),
  ADD KEY `PosteID` (`PosteID`),
  ADD KEY `EntrepriseID` (`EntrepriseID`),
  ADD KEY `SecteurID` (`SecteurID`);

--
-- Indexes for table `_job_offers`
--
ALTER TABLE `_job_offers`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idPage` (`idPage`,`jobTitle`,`secteur`,`pays`,`region`,`typeContrat`,`exp`,`created_by`,`disponibilite`),
  ADD KEY `jobTitle` (`jobTitle`),
  ADD KEY `secteur` (`secteur`),
  ADD KEY `pays` (`pays`),
  ADD KEY `region` (`region`),
  ADD KEY `typeContrat` (`typeContrat`),
  ADD KEY `exp` (`exp`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `disponibilite` (`disponibilite`);

--
-- Indexes for table `_langues`
--
ALTER TABLE `_langues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_lang_niv`
--
ALTER TABLE `_lang_niv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_lang_of_users`
--
ALTER TABLE `_lang_of_users`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `Level` (`Level`),
  ADD KEY `IdLang` (`IdLang`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Indexes for table `_needed_advantages_for_a_job`
--
ALTER TABLE `_needed_advantages_for_a_job`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idJob` (`idJob`),
  ADD KEY `advantage` (`advantage`);

--
-- Indexes for table `_needed_diplome_for_a_job`
--
ALTER TABLE `_needed_diplome_for_a_job`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idJob` (`idJob`),
  ADD KEY `idDiplome` (`idDiplome`);

--
-- Indexes for table `_needed_langages_for_a_job`
--
ALTER TABLE `_needed_langages_for_a_job`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idJob` (`idJob`),
  ADD KEY `langage` (`langage`);

--
-- Indexes for table `_needed_skills_for_a_job`
--
ALTER TABLE `_needed_skills_for_a_job`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `idJob` (`idJob`),
  ADD KEY `skill` (`skill`);

--
-- Indexes for table `_photos_bus_cover`
--
ALTER TABLE `_photos_bus_cover`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `businessID` (`businessID`);

--
-- Indexes for table `_project_images`
--
ALTER TABLE `_project_images`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `fk_image_project` (`idProject`),
  ADD KEY `fk_user_image_project` (`UserId`);

--
-- Indexes for table `_questionnaire_questions`
--
ALTER TABLE `_questionnaire_questions`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `IdQuestion` (`IdQuestion`),
  ADD KEY `IdQuestionnaire` (`IdQuestionnaire`);

--
-- Indexes for table `_tags_of_users`
--
ALTER TABLE `_tags_of_users`
  ADD PRIMARY KEY (`autoId`),
  ADD KEY `idTag` (`idTag`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `_tasks_of_users`
--
ALTER TABLE `_tasks_of_users`
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `_team_photo_quotes`
--
ALTER TABLE `_team_photo_quotes`
  ADD PRIMARY KEY (`idPicture`);

--
-- Indexes for table `_usersummary`
--
ALTER TABLE `_usersummary`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `_user_candidature_job`
--
ALTER TABLE `_user_candidature_job`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `UserId` (`UserId`,`id_Job_Offer`),
  ADD KEY `id_Job_Offer` (`id_Job_Offer`);

--
-- Indexes for table `_user_certifications`
--
ALTER TABLE `_user_certifications`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `_user_communication_prefernces`
--
ALTER TABLE `_user_communication_prefernces`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `_user_details`
--
ALTER TABLE `_user_details`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `situation` (`situation`,`ExperienceID`,`UserCountryId`,`UserRegionId`,`Nationalitee`),
  ADD KEY `UserCountryId` (`UserCountryId`),
  ADD KEY `Nationalitee` (`Nationalitee`),
  ADD KEY `UserRegionId` (`UserRegionId`),
  ADD KEY `ExperienceID` (`ExperienceID`);

--
-- Indexes for table `_user_formation`
--
ALTER TABLE `_user_formation`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `UserId` (`UserId`,`FiliereID`,`TypeID`,`UnivID`),
  ADD KEY `FiliereID` (`FiliereID`),
  ADD KEY `TypeID` (`TypeID`),
  ADD KEY `UnivID` (`UnivID`);

--
-- Indexes for table `_user_interests`
--
ALTER TABLE `_user_interests`
  ADD PRIMARY KEY (`IdEntry`),
  ADD KEY `fk_user_interests` (`UserId`);

--
-- Indexes for table `_user_project`
--
ALTER TABLE `_user_project`
  ADD PRIMARY KEY (`idEntry`),
  ADD KEY `fk_user_project` (`UserId`);

--
-- Indexes for table `_user_types`
--
ALTER TABLE `_user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `business_videos`
--
ALTER TABLE `business_videos`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `candidates_survey_question`
--
ALTER TABLE `candidates_survey_question`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `candidaturestatechangelog`
--
ALTER TABLE `candidaturestatechangelog`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `centraliseallnotificationscandidature`
--
ALTER TABLE `centraliseallnotificationscandidature`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_pipe`
--
ALTER TABLE `email_pipe`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `feedbackevaluation`
--
ALTER TABLE `feedbackevaluation`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jb_contrat`
--
ALTER TABLE `jb_contrat`
  MODIFY `contratId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jb_exp`
--
ALTER TABLE `jb_exp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `job_alerts`
--
ALTER TABLE `job_alerts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `job_alerts_skills`
--
ALTER TABLE `job_alerts_skills`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1453;

--
-- AUTO_INCREMENT for table `liste_formations`
--
ALTER TABLE `liste_formations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3514;

--
-- AUTO_INCREMENT for table `liste_type_diplomes`
--
ALTER TABLE `liste_type_diplomes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `nom_de_societe`
--
ALTER TABLE `nom_de_societe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23218;

--
-- AUTO_INCREMENT for table `pitchvideos`
--
ALTER TABLE `pitchvideos`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4056;

--
-- AUTO_INCREMENT for table `pretentionssalariales`
--
ALTER TABLE `pretentionssalariales`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7989;

--
-- AUTO_INCREMENT for table `questionnaires`
--
ALTER TABLE `questionnaires`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `questionslibrary`
--
ALTER TABLE `questionslibrary`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=833;

--
-- AUTO_INCREMENT for table `redirectlog`
--
ALTER TABLE `redirectlog`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_social_providers`
--
ALTER TABLE `ref_social_providers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `rejectionfeedbacklist`
--
ALTER TABLE `rejectionfeedbacklist`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews_answers`
--
ALTER TABLE `reviews_answers`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10745;

--
-- AUTO_INCREMENT for table `secteur_acrivitees`
--
ALTER TABLE `secteur_acrivitees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20513;

--
-- AUTO_INCREMENT for table `universites`
--
ALTER TABLE `universites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6047;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72406;

--
-- AUTO_INCREMENT for table `user_role_business`
--
ALTER TABLE `user_role_business`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2167;

--
-- AUTO_INCREMENT for table `_avantages_pro`
--
ALTER TABLE `_avantages_pro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `_bus_pages`
--
ALTER TABLE `_bus_pages`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1020;

--
-- AUTO_INCREMENT for table `_disponibilite`
--
ALTER TABLE `_disponibilite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `_job_experience`
--
ALTER TABLE `_job_experience`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19948;

--
-- AUTO_INCREMENT for table `_job_offers`
--
ALTER TABLE `_job_offers`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2350;

--
-- AUTO_INCREMENT for table `_langues`
--
ALTER TABLE `_langues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `_lang_niv`
--
ALTER TABLE `_lang_niv`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `_lang_of_users`
--
ALTER TABLE `_lang_of_users`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67267;

--
-- AUTO_INCREMENT for table `_needed_advantages_for_a_job`
--
ALTER TABLE `_needed_advantages_for_a_job`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1756;

--
-- AUTO_INCREMENT for table `_needed_diplome_for_a_job`
--
ALTER TABLE `_needed_diplome_for_a_job`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30812;

--
-- AUTO_INCREMENT for table `_needed_langages_for_a_job`
--
ALTER TABLE `_needed_langages_for_a_job`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7898;

--
-- AUTO_INCREMENT for table `_needed_skills_for_a_job`
--
ALTER TABLE `_needed_skills_for_a_job`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34604;

--
-- AUTO_INCREMENT for table `_photos_bus_cover`
--
ALTER TABLE `_photos_bus_cover`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=854;

--
-- AUTO_INCREMENT for table `_project_images`
--
ALTER TABLE `_project_images`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT for table `_questionnaire_questions`
--
ALTER TABLE `_questionnaire_questions`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1631;

--
-- AUTO_INCREMENT for table `_tags_of_users`
--
ALTER TABLE `_tags_of_users`
  MODIFY `autoId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198582;

--
-- AUTO_INCREMENT for table `_usersummary`
--
ALTER TABLE `_usersummary`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12072;

--
-- AUTO_INCREMENT for table `_user_candidature_job`
--
ALTER TABLE `_user_candidature_job`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107950;

--
-- AUTO_INCREMENT for table `_user_certifications`
--
ALTER TABLE `_user_certifications`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `_user_formation`
--
ALTER TABLE `_user_formation`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41742;

--
-- AUTO_INCREMENT for table `_user_interests`
--
ALTER TABLE `_user_interests`
  MODIFY `IdEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `_user_project`
--
ALTER TABLE `_user_project`
  MODIFY `idEntry` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `_user_types`
--
ALTER TABLE `_user_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business_videos`
--
ALTER TABLE `business_videos`
  ADD CONSTRAINT `business_videos_ibfk_1` FOREIGN KEY (`businessID`) REFERENCES `_bus_pages` (`idEntry`);

--
-- Constraints for table `candidaturestatechangelog`
--
ALTER TABLE `candidaturestatechangelog`
  ADD CONSTRAINT `candidaturestatechangelog_ibfk_1` FOREIGN KEY (`idCandidature`) REFERENCES `_user_candidature_job` (`IdEntry`),
  ADD CONSTRAINT `candidaturestatechangelog_ibfk_2` FOREIGN KEY (`Motif`) REFERENCES `rejectionfeedbacklist` (`idEntry`);

--
-- Constraints for table `centraliseallnotificationscandidature`
--
ALTER TABLE `centraliseallnotificationscandidature`
  ADD CONSTRAINT `centraliseallnotificationscandidature_ibfk_1` FOREIGN KEY (`idPage`) REFERENCES `_bus_pages` (`idEntry`);

--
-- Constraints for table `creds`
--
ALTER TABLE `creds`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `feedbackevaluation`
--
ALTER TABLE `feedbackevaluation`
  ADD CONSTRAINT `feedbackevaluation_ibfk_1` FOREIGN KEY (`IdCandidature`) REFERENCES `_user_candidature_job` (`IdEntry`),
  ADD CONSTRAINT `feedbackevaluation_ibfk_2` FOREIGN KEY (`idCollab`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  ADD CONSTRAINT `interview_schedule_ibfk_1` FOREIGN KEY (`idPage`) REFERENCES `_bus_pages` (`idEntry`),
  ADD CONSTRAINT `interview_schedule_ibfk_2` FOREIGN KEY (`IdCandidature`) REFERENCES `_user_candidature_job` (`IdEntry`),
  ADD CONSTRAINT `interview_schedule_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `job_alerts`
--
ALTER TABLE `job_alerts`
  ADD CONSTRAINT `country_job_alerts` FOREIGN KEY (`idCountry`) REFERENCES `pays` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_user_job_alerts` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `job_exp_job_alert` FOREIGN KEY (`experienceId`) REFERENCES `jb_exp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `job_alerts_skills`
--
ALTER TABLE `job_alerts_skills`
  ADD CONSTRAINT `job_alerts_skills_jobalert` FOREIGN KEY (`idJobAlert`) REFERENCES `job_alerts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tags_job_alerts` FOREIGN KEY (`idTag`) REFERENCES `tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `job_text_translations`
--
ALTER TABLE `job_text_translations`
  ADD CONSTRAINT `job_text_translations_ibfk_1` FOREIGN KEY (`idJob`) REFERENCES `_job_offers` (`idEntry`);

--
-- Constraints for table `learn_interest_skills`
--
ALTER TABLE `learn_interest_skills`
  ADD CONSTRAINT `learn_interest_skills_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `learn_interest_skills_ibfk_2` FOREIGN KEY (`idTag`) REFERENCES `tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `nom_de_societe`
--
ALTER TABLE `nom_de_societe`
  ADD CONSTRAINT `nom_de_societe_ibfk_1` FOREIGN KEY (`idcountry`) REFERENCES `pays` (`id`);

--
-- Constraints for table `pitchvideos`
--
ALTER TABLE `pitchvideos`
  ADD CONSTRAINT `pitchvideos_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `pretentionssalariales`
--
ALTER TABLE `pretentionssalariales`
  ADD CONSTRAINT `pretentionssalariales_ibfk_1` FOREIGN KEY (`idJob`) REFERENCES `_job_offers` (`idEntry`),
  ADD CONSTRAINT `pretentionssalariales_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pretentionssalariales_ibfk_3` FOREIGN KEY (`idPositionNom`) REFERENCES `noms_de_metiers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `questionnaires`
--
ALTER TABLE `questionnaires`
  ADD CONSTRAINT `questionnaires_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_ibfk_1` FOREIGN KEY (`countryid`) REFERENCES `pays` (`id`);

--
-- Constraints for table `reviews_answers`
--
ALTER TABLE `reviews_answers`
  ADD CONSTRAINT `reviews_answers_ibfk_1` FOREIGN KEY (`idReview`) REFERENCES `userreview` (`id`),
  ADD CONSTRAINT `reviews_answers_ibfk_2` FOREIGN KEY (`idQuestion`) REFERENCES `candidates_survey_question` (`Id`);

--
-- Constraints for table `userreview`
--
ALTER TABLE `userreview`
  ADD CONSTRAINT `userreview_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_has_social_link`
--
ALTER TABLE `user_has_social_link`
  ADD CONSTRAINT `fk_social_provider_user` FOREIGN KEY (`idProvider`) REFERENCES `ref_social_providers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_social_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_role_business`
--
ALTER TABLE `user_role_business`
  ADD CONSTRAINT `user_role_business_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `user_role_business_ibfk_2` FOREIGN KEY (`idBuspage`) REFERENCES `_bus_pages` (`idEntry`);

--
-- Constraints for table `_bus_pages`
--
ALTER TABLE `_bus_pages`
  ADD CONSTRAINT `_bus_pages_ibfk_1` FOREIGN KEY (`secteur_activite`) REFERENCES `secteur_acrivitees` (`id`),
  ADD CONSTRAINT `_bus_pages_ibfk_2` FOREIGN KEY (`paysID`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `_bus_pages_ibfk_3` FOREIGN KEY (`owner`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `_bus_pages_ibfk_4` FOREIGN KEY (`account`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `_bus_pages_ibfk_5` FOREIGN KEY (`regionID`) REFERENCES `regions` (`id`);

--
-- Constraints for table `_job_experience`
--
ALTER TABLE `_job_experience`
  ADD CONSTRAINT `_job_experience_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `_job_experience_ibfk_2` FOREIGN KEY (`typedecontrat`) REFERENCES `jb_contrat` (`contratId`),
  ADD CONSTRAINT `_job_experience_ibfk_3` FOREIGN KEY (`PosteID`) REFERENCES `noms_de_metiers` (`id`),
  ADD CONSTRAINT `_job_experience_ibfk_4` FOREIGN KEY (`EntrepriseID`) REFERENCES `nom_de_societe` (`id`),
  ADD CONSTRAINT `_job_experience_ibfk_5` FOREIGN KEY (`SecteurID`) REFERENCES `secteur_acrivitees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `_job_offers`
--
ALTER TABLE `_job_offers`
  ADD CONSTRAINT `_Job_Offers_ibfk_1` FOREIGN KEY (`idPage`) REFERENCES `_bus_pages` (`idEntry`),
  ADD CONSTRAINT `_Job_Offers_ibfk_2` FOREIGN KEY (`jobTitle`) REFERENCES `noms_de_metiers` (`id`),
  ADD CONSTRAINT `_Job_Offers_ibfk_3` FOREIGN KEY (`secteur`) REFERENCES `secteur_acrivitees` (`id`),
  ADD CONSTRAINT `_Job_Offers_ibfk_4` FOREIGN KEY (`pays`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `_Job_Offers_ibfk_6` FOREIGN KEY (`typeContrat`) REFERENCES `jb_contrat` (`contratId`),
  ADD CONSTRAINT `_Job_Offers_ibfk_7` FOREIGN KEY (`exp`) REFERENCES `jb_exp` (`id`),
  ADD CONSTRAINT `_Job_Offers_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `_Job_Offers_ibfk_9` FOREIGN KEY (`disponibilite`) REFERENCES `_disponibilite` (`id`);

--
-- Constraints for table `_lang_of_users`
--
ALTER TABLE `_lang_of_users`
  ADD CONSTRAINT `_lang_of_users_ibfk_1` FOREIGN KEY (`Level`) REFERENCES `_lang_niv` (`id`),
  ADD CONSTRAINT `_lang_of_users_ibfk_2` FOREIGN KEY (`IdLang`) REFERENCES `_langues` (`id`),
  ADD CONSTRAINT `_lang_of_users_ibfk_3` FOREIGN KEY (`IdUser`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `_needed_advantages_for_a_job`
--
ALTER TABLE `_needed_advantages_for_a_job`
  ADD CONSTRAINT `_needed_advantages_for_a_job_ibfk_1` FOREIGN KEY (`idJob`) REFERENCES `_job_offers` (`idEntry`),
  ADD CONSTRAINT `_needed_advantages_for_a_job_ibfk_2` FOREIGN KEY (`advantage`) REFERENCES `_avantages_pro` (`id`);

--
-- Constraints for table `_needed_diplome_for_a_job`
--
ALTER TABLE `_needed_diplome_for_a_job`
  ADD CONSTRAINT `_needed_diplome_for_a_job_ibfk_1` FOREIGN KEY (`idJob`) REFERENCES `_job_offers` (`idEntry`),
  ADD CONSTRAINT `_needed_diplome_for_a_job_ibfk_2` FOREIGN KEY (`idDiplome`) REFERENCES `liste_type_diplomes` (`id`);

--
-- Constraints for table `_needed_langages_for_a_job`
--
ALTER TABLE `_needed_langages_for_a_job`
  ADD CONSTRAINT `_needed_langages_for_a_job_ibfk_1` FOREIGN KEY (`idJob`) REFERENCES `_job_offers` (`idEntry`),
  ADD CONSTRAINT `_needed_langages_for_a_job_ibfk_2` FOREIGN KEY (`langage`) REFERENCES `_langues` (`id`);

--
-- Constraints for table `_needed_skills_for_a_job`
--
ALTER TABLE `_needed_skills_for_a_job`
  ADD CONSTRAINT `_needed_skills_for_a_job_ibfk_1` FOREIGN KEY (`idJob`) REFERENCES `_job_offers` (`idEntry`),
  ADD CONSTRAINT `_needed_skills_for_a_job_ibfk_2` FOREIGN KEY (`skill`) REFERENCES `tags` (`id`);

--
-- Constraints for table `_photos_bus_cover`
--
ALTER TABLE `_photos_bus_cover`
  ADD CONSTRAINT `_photos_bus_cover_ibfk_1` FOREIGN KEY (`businessID`) REFERENCES `_bus_pages` (`idEntry`);

--
-- Constraints for table `_project_images`
--
ALTER TABLE `_project_images`
  ADD CONSTRAINT `fk_image_project` FOREIGN KEY (`idProject`) REFERENCES `_user_project` (`idEntry`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user_image_project` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `_questionnaire_questions`
--
ALTER TABLE `_questionnaire_questions`
  ADD CONSTRAINT `_questionnaire_questions_ibfk_1` FOREIGN KEY (`IdQuestion`) REFERENCES `questionslibrary` (`IdEntry`),
  ADD CONSTRAINT `_questionnaire_questions_ibfk_2` FOREIGN KEY (`IdQuestionnaire`) REFERENCES `questionnaires` (`IdEntry`);

--
-- Constraints for table `_tags_of_users`
--
ALTER TABLE `_tags_of_users`
  ADD CONSTRAINT `_tags_of_users_ibfk_1` FOREIGN KEY (`idTag`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `_tags_of_users_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `_tasks_of_users`
--
ALTER TABLE `_tasks_of_users`
  ADD CONSTRAINT `_tasks_of_users_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `_tasks_of_users_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `_usersummary`
--
ALTER TABLE `_usersummary`
  ADD CONSTRAINT `_usersummary_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `_user_candidature_job`
--
ALTER TABLE `_user_candidature_job`
  ADD CONSTRAINT `_User_Candidature_Job_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `_User_Candidature_Job_ibfk_2` FOREIGN KEY (`id_Job_Offer`) REFERENCES `_job_offers` (`idEntry`);

--
-- Constraints for table `_user_certifications`
--
ALTER TABLE `_user_certifications`
  ADD CONSTRAINT `_User_Certifications_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `_user_communication_prefernces`
--
ALTER TABLE `_user_communication_prefernces`
  ADD CONSTRAINT `fk_communication_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `_user_details`
--
ALTER TABLE `_user_details`
  ADD CONSTRAINT `_User_Details_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `_User_Details_ibfk_2` FOREIGN KEY (`UserCountryId`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `_User_Details_ibfk_3` FOREIGN KEY (`Nationalitee`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `_User_Details_ibfk_5` FOREIGN KEY (`situation`) REFERENCES `_user_types` (`id`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `_User_Details_ibfk_6` FOREIGN KEY (`ExperienceID`) REFERENCES `jb_exp` (`id`);

--
-- Constraints for table `_user_formation`
--
ALTER TABLE `_user_formation`
  ADD CONSTRAINT `_User_Formation_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `_User_Formation_ibfk_2` FOREIGN KEY (`FiliereID`) REFERENCES `liste_formations` (`id`),
  ADD CONSTRAINT `_User_Formation_ibfk_3` FOREIGN KEY (`TypeID`) REFERENCES `liste_type_diplomes` (`id`),
  ADD CONSTRAINT `_User_Formation_ibfk_4` FOREIGN KEY (`UnivID`) REFERENCES `universites` (`id`);

--
-- Constraints for table `_user_interests`
--
ALTER TABLE `_user_interests`
  ADD CONSTRAINT `fk_user_interests` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `_user_project`
--
ALTER TABLE `_user_project`
  ADD CONSTRAINT `fk_user_project` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
