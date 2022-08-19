-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.8.3-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- hayalet-temel için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `hayalet-temel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hayalet-temel`;

-- tablo yapısı dökülüyor hayalet-temel.0r-bans
CREATE TABLE IF NOT EXISTS `0r-bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.0r-bans: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4156 DEFAULT CHARSET=latin1;

-- hayalet-temel.apartments: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- hayalet-temel.bank_accounts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- hayalet-temel.bank_statements: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.bans: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.crypto: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1029, '[{"NewWorth":1020,"PreviousWorth":1013},{"NewWorth":1020,"PreviousWorth":1013},{"NewWorth":1020,"PreviousWorth":1013},{"PreviousWorth":1020,"NewWorth":1029}]');

-- tablo yapısı dökülüyor hayalet-temel.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.crypto_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- hayalet-temel.dpkeybinds: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.dream_jobs
CREATE TABLE IF NOT EXISTS `dream_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET latin1 NOT NULL,
  `experience` int(11) NOT NULL,
  `pickaxe` int(11) NOT NULL,
  `job` varchar(255) CHARACTER SET latin1 NOT NULL,
  `truck` int(11) DEFAULT NULL,
  `builder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.dream_jobs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.evidence_storage
CREATE TABLE IF NOT EXISTS `evidence_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.evidence_storage: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- hayalet-temel.gloveboxitems: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text NOT NULL DEFAULT '{"y":0,"x":0,"h":0,"z":0}',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- hayalet-temel.houselocations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `tier`, `garage`) VALUES
	(33, 'signal st1', 'Signal St 1', '{"cam":{"y":-3128.03173828125,"h":99.21578216552735,"yaw":-10.0,"x":155.0976104736328,"z":7.03071355819702},"enter":{"y":-3128.03173828125,"h":99.21578216552735,"x":155.0976104736328,"z":7.03071355819702}}', 1, 1, 7, '{"y":0,"x":0,"h":0,"z":0}');

-- tablo yapısı dökülüyor hayalet-temel.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB AUTO_INCREMENT=7139 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.house_plants: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.management_funds: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 2000, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 14018, 'boss');

-- tablo yapısı dökülüyor hayalet-temel.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_bolos: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_bulletin: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_convictions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_data: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_impound: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_incidents: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_logs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_reports: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.mdt_vehicleinfo: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_calls
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_calls: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_marketplace_listings
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_marketplace_listings: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_match_profiles
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_match_profiles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `npwd_match_profiles` (`id`, `identifier`, `name`, `image`, `bio`, `location`, `job`, `tags`, `createdAt`, `updatedAt`) VALUES
	(1, 'EZK23790', 'Hayalet Sar', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', '2022-08-18 21:58:39', '2022-08-18 21:58:39');

-- tablo yapısı dökülüyor hayalet-temel.npwd_match_views
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_match_views: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_messages
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `user_identifier` varchar(48) NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_messages: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_messages_conversations
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_messages_conversations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_messages_participants
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_messages_participants: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_notes: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `npwd_notes` (`id`, `identifier`, `title`, `content`) VALUES
	(1, 'EZK23790', 'sa', 'sa');

-- tablo yapısı dökülüyor hayalet-temel.npwd_phone_contacts
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_phone_contacts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_phone_gallery
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_phone_gallery: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_twitter_likes
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_twitter_likes: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_twitter_profiles
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.file.glass/QrEvq.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_twitter_profiles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `npwd_twitter_profiles` (`id`, `profile_name`, `identifier`, `avatar_url`, `createdAt`, `updatedAt`) VALUES
	(1, 'Hayalet_Sar', 'EZK23790', 'https://i.file.glass/QrEvq.png', '2022-08-18 21:58:38', '2022-08-18 21:58:38');

-- tablo yapısı dökülüyor hayalet-temel.npwd_twitter_reports
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_twitter_reports: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.npwd_twitter_tweets
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.npwd_twitter_tweets: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `npwd_twitter_tweets` (`id`, `message`, `createdAt`, `updatedAt`, `likes`, `identifier`, `visible`, `images`, `retweet`, `profile_id`) VALUES
	(1, 'sasa', '2022-08-18 22:01:39', '2022-08-18 22:01:39', 0, 'EZK23790', 1, '', NULL, 1),
	(2, 'sasa', '2022-08-19 10:24:33', '2022-08-19 10:24:33', 0, 'EZK23790', 1, '', NULL, 1);

-- tablo yapısı dökülüyor hayalet-temel.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.permissions: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `permissions` (`id`, `name`, `license`, `permission`) VALUES
	(1, 'hayaletfivem', 'license:0914ab671d4452856c454f3e70c58c6cb585f1cd', 'admin'),
	(2, 'sluıq', 'license:8c140de6d4bcdca50e2dc53d26cab81489b9bb5c', 'admin'),
	(3, 'emin', 'license:f18c0d94e01bb2c4a36952952c694b9ccbe91809', 'admin');

-- tablo yapısı dökülüyor hayalet-temel.phones
CREATE TABLE IF NOT EXISTS `phones` (
  `phone_number` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- hayalet-temel.phones: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.phone_gallery: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.phone_invoices: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.phone_messages: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` text DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.phone_tweets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.playerammo
CREATE TABLE IF NOT EXISTS `playerammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `ammo` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb3;

-- hayalet-temel.playerammo: 0 rows tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `playerammo` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerammo` ENABLE KEYS */;

-- tablo yapısı dökülüyor hayalet-temel.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `skin` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1623 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.players: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `skin`, `tattoos`, `phone_number`) VALUES
	(1502, 'EZK23790', 1, 'license:0914ab671d4452856c454f3e70c58c6cb585f1cd', 'Hayalet', '{"bank":4989378,"cash":48757,"crypto":0}', '{"card":1282539397786701,"gender":0,"backstory":"placeholder backstory","lastname":"Sarı","phone":"8581787919","firstname":"Hayalet","account":"US02QBCore8079555763","birthdate":"1992-12-12","nationality":"türk","cid":"1"}', '{"onduty":false,"payment":150,"isboss":true,"name":"mechanic","grade":{"name":"Patron","level":4},"label":"Mekanik","type":"none"}', '{"name":"none","grade":{"name":"none","level":0},"label":"No Gang Affiliaton","isboss":false}', '{"x":173.9736328125,"y":-3030.567138671875,"z":5.757568359375}', '{"callsign":"NO CALLSIGN","stress":3,"inlaststand":false,"craftingrep":505,"armor":0,"commandbinds":[],"dealerrep":0,"tracker":false,"jobrep":{"hotdog":0,"taxi":0,"tow":0,"trucker":0},"injail":0,"criminalrecord":{"hasRecord":false},"attachmentcraftingrep":554,"inside":{"apartment":[]},"jailitems":[],"isdead":false,"bloodtype":"B-","fingerprint":"gC718h13iaf1478","thirst":87.40000000000002,"fitbit":[],"phonedata":{"SerialNumber":67978453,"InstalledApps":[]},"licences":{"weapon":false,"business":false,"driver":true},"walletid":"QB-95014437","hunger":84.59999999999998,"phone":[],"status":[],"ishandcuffed":false}', '[{"slot":1,"name":"phone","type":"item","info":[],"amount":1}]', '2022-08-19 10:28:12', '{"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"hair":{"style":0,"color":0,"highlight":0},"model":"mp_m_freemode_01","faceFeatures":{"jawBoneBackSize":0,"lipsThickness":0,"nosePeakHigh":0,"neckThickness":0,"cheeksWidth":0,"cheeksBoneWidth":0,"chinBoneSize":0,"eyesOpening":0,"chinBoneLenght":0,"nosePeakLowering":0,"cheeksBoneHigh":0,"noseBoneTwist":0,"nosePeakSize":0,"chinHole":0,"noseWidth":0,"eyeBrownForward":0,"jawBoneWidth":0,"eyeBrownHigh":0,"chinBoneLowering":0,"noseBoneHigh":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11},{"texture":0,"drawable":12,"component_id":1}],"eyeColor":-1,"headOverlays":{"sunDamage":{"style":0,"color":0,"opacity":0},"complexion":{"style":0,"color":0,"opacity":0},"chestHair":{"style":0,"color":0,"opacity":0},"blemishes":{"style":0,"color":0,"opacity":0},"lipstick":{"style":0,"color":0,"opacity":0},"makeUp":{"style":0,"color":0,"opacity":0},"ageing":{"style":0,"color":0,"opacity":0},"beard":{"style":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"color":0,"opacity":0},"blush":{"style":0,"color":0,"opacity":0},"eyebrows":{"style":0,"color":0,"opacity":0}},"headBlend":{"shapeSecond":0,"skinSecond":0,"skinFirst":0,"shapeFirst":0,"skinMix":0,"shapeMix":0}}', NULL, '8581787919');

-- tablo yapısı dökülüyor hayalet-temel.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=43022 DEFAULT CHARSET=latin1;

-- hayalet-temel.playerskins: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_contacts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_houses: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `player_houses` (`id`, `house`, `identifier`, `citizenid`, `keyholders`, `decorations`, `stash`, `outfit`, `logout`) VALUES
	(23, 'signal st1', 'license:0914ab671d4452856c454f3e70c58c6cb585f1cd', 'EZK23790', '["EZK23790"]', '[{"object":288002,"hashname":"bkr_prop_meth_table01a","z":-22.63317604064942,"objectId":1,"rotx":0.0,"rotz":0.0,"roty":-0.0,"x":154.82394409179688,"y":-3127.295166015625}]', NULL, NULL, NULL);

-- tablo yapısı dökülüyor hayalet-temel.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_mails: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.player_miningrigs
CREATE TABLE IF NOT EXISTS `player_miningrigs` (
  `id` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `rig` text DEFAULT NULL,
  KEY `citizenid` (`citizenid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_miningrigs: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `player_miningrigs` (`id`, `citizenid`, `rig`) VALUES
	('b61f0ea9-223f-43a1-b8b2-966340110e4a', 'EZK23790', '{"Owner":"EZK23790","Id":"b61f0ea9-223f-43a1-b8b2-966340110e4a","GPUS":[{"name":"rtx3090","hashrate":114,"wattage":320},{"name":"rtx3080","hashrate":91.5,"wattage":200}],"Type":"advanced","Position":{"x":172.499755859375,"y":-3027.41162109375,"z":4.809661865234375},"Rotation":{"x":0,"y":0,"z":0}}'),
	('b61f0ea9-223f-43a1-b8b2-966340110e4a', 'EZK23790', '{"Owner":"EZK23790","Id":"b61f0ea9-223f-43a1-b8b2-966340110e4a","GPUS":[{"name":"rtx3090","hashrate":114,"wattage":320},{"name":"rtx3080","hashrate":91.5,"wattage":200}],"Type":"advanced","Position":{"x":172.499755859375,"y":-3027.41162109375,"z":4.809661865234375},"Rotation":{"x":0,"y":0,"z":0}}'),
	('779360ea-7641-453e-8ccb-69792a25bf4b', 'EZK23790', '{"Owner":"EZK23790","Id":"779360ea-7641-453e-8ccb-69792a25bf4b","GPUS":[],"Type":"advanced","Position":{"x":172.499755859375,"y":-3027.41162109375,"z":4.809661865234375},"Rotation":{"x":0,"y":0,"z":0}}'),
	('779360ea-7641-453e-8ccb-69792a25bf4b', 'EZK23790', '{"Owner":"EZK23790","Id":"779360ea-7641-453e-8ccb-69792a25bf4b","GPUS":[],"Type":"advanced","Position":{"x":172.499755859375,"y":-3027.41162109375,"z":4.809661865234375},"Rotation":{"x":0,"y":0,"z":0}}');

-- tablo yapısı dökülüyor hayalet-temel.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=8971 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_outfits: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `steam` (`license`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2454 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- hayalet-temel.stashitems: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- hayalet-temel.trunkitems: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `owner_phone` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `picture` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.twitter_tweets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- hayalet-temel.vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.vehicle_categories: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.vehicle_display
CREATE TABLE IF NOT EXISTS `vehicle_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 10,
  `downpayment` int(11) NOT NULL DEFAULT 25,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.vehicle_display: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
