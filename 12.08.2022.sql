-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.24-MariaDB - mariadb.org binary distribution
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

-- hayalet-temel.apartments: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(4148, 'apartment12270', 'apartment1', 'South Rockford Drive 2270', 'UZA73834');

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
REPLACE INTO `bank_statements` (`record_id`, `citizenid`, `account`, `business`, `businessid`, `gangid`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES
	(1, 'DUW83993', 'Saving', NULL, NULL, NULL, 1, 0, 1, '2022-07-30 11:15:28', 'Transfer Current Account to Savings');

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
	('qbit', 1032, '[{"PreviousWorth":1034,"NewWorth":1032},{"PreviousWorth":1034,"NewWorth":1032},{"PreviousWorth":1034,"NewWorth":1032},{"NewWorth":1032,"PreviousWorth":1032}]');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.dream_jobs: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `dream_jobs` (`id`, `identifier`, `experience`, `pickaxe`, `job`, `truck`) VALUES
	(34, 'KGF52783', 0, 0, 'builder', NULL),
	(35, 'KGF52783', 0, 1, 'miner', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- hayalet-temel.houselocations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

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
) ENGINE=InnoDB AUTO_INCREMENT=7137 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.management_funds: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 2000, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

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
REPLACE INTO `mdt_bulletin` (`id`, `title`, `desc`, `author`, `time`, `jobtype`) VALUES
	(1, 'ANANIZI SİKERİM', 'ANANIZI SİKERİM', 'Black Mathilda', '1660183272523', 'police');

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
REPLACE INTO `mdt_incidents` (`id`, `author`, `title`, `details`, `tags`, `officersinvolved`, `civsinvolved`, `evidence`, `time`, `jobtype`) VALUES
	(1, 'Black Mathilda', 'Name - Charge - 8/6/2022', '📝 Summary:\n\n[Insert Report Summary Here]\n\n🧍 Hostage: [Name Here]\n\n🔪 Weapons/Items Confiscated:\n\n· [Insert List Here]\n\n-----\n💸 Fine:\n⌚ Sentence:\n-----', '[]', '[]', '[]', '[]', '1659790364431', 'police');

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
REPLACE INTO `mdt_vehicleinfo` (`id`, `plate`, `information`, `stolen`, `code5`, `image`) VALUES
	(1, '', '', 0, 0, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
REPLACE INTO `phone_invoices` (`id`, `citizenid`, `amount`, `society`, `sender`, `sendercitizenid`) VALUES
	(1, 'YPS30671', 10, 'mechanic', 'Black', 'UZA73834');

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

-- hayalet-temel.phone_tweets: ~1 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.playerammo
CREATE TABLE IF NOT EXISTS `playerammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `ammo` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1315 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.players: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `skin`, `tattoos`) VALUES
	(1312, 'KGF52783', 2, 'license:0914ab671d4452856c454f3e70c58c6cb585f1cd', 'Hayalet', '{"crypto":0,"cash":500,"bank":5000}', '{"firstname":"AHMAD","gender":0,"cid":"2","lastname":"AHMAD","phone":"7638838949","birthdate":"9999-10-10","account":"US09QBCore4412604825","nationality":"AHMAD","backstory":"placeholder backstory"}', '{"label":"Civilian","name":"unemployed","grade":{"level":0,"name":"Freelancer"},"onduty":true,"payment":10,"isboss":false,"type":"none"}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-208.64175415039063,"y":-1001.090087890625,"z":29.14501953125}', '{"jobrep":{"trucker":0,"hotdog":0,"tow":0,"taxi":0},"phonedata":{"InstalledApps":[],"SerialNumber":39202123},"inside":{"apartment":[]},"licences":{"business":false,"weapon":false,"driver":true},"dealerrep":0,"phone":[],"fingerprint":"XV507B60vfk0385","inlaststand":false,"tracker":false,"walletid":"QB-30950317","injail":0,"criminalrecord":{"hasRecord":false},"callsign":"NO CALLSIGN","stress":0,"commandbinds":[],"thirst":98.2,"craftingrep":0,"hunger":97.8,"fitbit":[],"armor":0,"ishandcuffed":false,"isdead":false,"status":[],"bloodtype":"O+","jailitems":[],"attachmentcraftingrep":0}', '[{"amount":1,"name":"driver_license","slot":1,"type":"item","info":{"birthdate":"9999-10-10","type":"Class C Driver License","firstname":"AHMAD","lastname":"AHMAD"}},{"amount":1,"name":"id_card","slot":2,"type":"item","info":{"firstname":"AHMAD","gender":0,"birthdate":"9999-10-10","lastname":"AHMAD","citizenid":"KGF52783","nationality":"AHMAD"}},{"amount":1,"name":"phone","slot":3,"type":"item","info":[]}]', '2022-08-12 12:39:35', '{"eyeColor":-1,"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"headBlend":{"shapeFirst":0,"skinSecond":0,"skinMix":0,"shapeSecond":0,"skinFirst":0,"shapeMix":0},"hair":{"color":0,"style":0,"highlight":0},"faceFeatures":{"eyeBrownHigh":0,"eyesOpening":0,"neckThickness":0,"nosePeakSize":0,"chinBoneSize":0,"lipsThickness":0,"jawBoneWidth":0,"eyeBrownForward":0,"nosePeakLowering":0,"nosePeakHigh":0,"noseWidth":0,"noseBoneHigh":0,"noseBoneTwist":0,"cheeksBoneWidth":0,"cheeksWidth":0,"chinBoneLenght":0,"cheeksBoneHigh":0,"chinHole":0,"chinBoneLowering":0,"jawBoneBackSize":0},"model":"mp_m_freemode_01","headOverlays":{"complexion":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"blemishes":{"color":0,"opacity":0,"style":0},"ageing":{"color":0,"opacity":0,"style":0},"chestHair":{"color":0,"opacity":0,"style":0},"sunDamage":{"color":0,"opacity":0,"style":0},"beard":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0},"lipstick":{"color":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0},"eyebrows":{"color":0,"opacity":0,"style":0},"makeUp":{"color":0,"opacity":0,"style":0}}}', NULL),
	(263, 'UZA73834', 1, 'license:0914ab671d4452856c454f3e70c58c6cb585f1cd', 'Hayalet', '{"bank":36062,"cash":1.0000000000049997e22,"crypto":0}', '{"cid":"1","birthdate":"1999-10-05","nationality":"Japan","phone":"2918724588","account":"US05QBCore8513120259","firstname":"Black","gender":0,"backstory":"placeholder backstory","lastname":"Mathilda"}', '{"type":"none","name":"unemployed","onduty":true,"payment":30,"label":"Civilian","grade":{"name":"No Grades","level":0},"isboss":false}', '{"name":"none","label":"No Gang Affiliaton","grade":{"name":"none","level":0},"isboss":false}', '{"x":-307.5296630859375,"y":434.8615417480469,"z":83.5194091796875}', '{"thirst":77.20000000000002,"fingerprint":"SY260B86DuL1412","jobrep":{"hotdog":0,"tow":0,"trucker":0,"taxi":0},"armor":0,"fitbit":[],"status":[],"hunger":74.79999999999999,"dealerrep":0,"walletid":"QB-95445213","inlaststand":false,"bloodtype":"AB+","craftingrep":0,"injail":0,"phonedata":{"InstalledApps":[],"SerialNumber":61881953},"ishandcuffed":false,"callsign":"31-31","inside":{"apartment":[],"house":"cox way1"},"licences":{"weapon":true,"driver":true,"business":false},"criminalrecord":{"hasRecord":false},"isdead":false,"tracker":false,"commandbinds":[],"attachmentcraftingrep":0,"phone":{"background":"default-qbcore","profilepicture":"default"},"stress":0,"jailitems":[]}', '[{"info":"","type":"item","name":"weed_skunk","amount":29,"slot":1},{"info":"","type":"item","name":"weed_skunk_seed","amount":26,"slot":2},{"info":[],"type":"item","name":"meth","amount":1,"slot":3},{"info":[],"type":"item","name":"radioscanner","amount":1,"slot":31},{"info":"","type":"item","name":"readyweed","amount":32,"slot":17},{"info":"","type":"item","name":"weed_skunk_seed","amount":1,"slot":18},{"info":{"birthdate":"1999-10-05","lastname":"Mathilda","firstname":"Black"},"type":"item","name":"weaponlicense","amount":1,"slot":34},{"info":[],"type":"item","name":"pistol_ammo","amount":8,"slot":20},{"info":{"birthdate":"1999-10-05","type":"Class C Driver License","lastname":"Mathilda","firstname":"Black"},"type":"item","name":"driver_license","amount":1,"slot":37},{"info":[],"type":"item","name":"phone","amount":1,"slot":38},{"info":{"citizenid":"UZA73834","nationality":"Japan","birthdate":"1999-10-05","gender":0,"lastname":"Mathilda","firstname":"Black"},"type":"item","name":"id_card","amount":1,"slot":39},{"info":{"quality":92.64999999999972,"serie":"97JzI0bL706OLCO","ammo":0},"type":"weapon","name":"weapon_glock17","amount":1,"slot":24},{"info":"","type":"item","name":"chair1","amount":1,"slot":19},{"info":[],"type":"item","name":"weed_shears","amount":1,"slot":14},{"info":[],"type":"item","name":"empty_weed_bag","amount":21,"slot":5}]', '2022-08-12 12:23:12', '{"model":"mp_m_freemode_01","headBlend":{"shapeMix":0.7,"shapeFirst":4,"skinSecond":2,"skinFirst":3,"skinMix":1,"shapeSecond":4},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"eyeColor":-1,"faceFeatures":{"neckThickness":1,"chinBoneSize":0.1,"jawBoneBackSize":1,"chinBoneLenght":-0.9,"chinBoneLowering":1,"cheeksBoneHigh":0.1,"chinHole":-1,"cheeksWidth":1,"nosePeakLowering":-0.1,"eyeBrownHigh":0.3,"noseBoneTwist":0.8,"noseWidth":-0.3,"cheeksBoneWidth":1,"eyeBrownForward":-0.2,"jawBoneWidth":0.3,"lipsThickness":-1,"nosePeakSize":1,"noseBoneHigh":1,"eyesOpening":-1,"nosePeakHigh":-0.7},"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":44,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":4,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":23,"texture":0}],"headOverlays":{"lipstick":{"style":0,"color":0,"opacity":0},"makeUp":{"style":0,"color":56,"opacity":0},"beard":{"style":3,"color":61,"opacity":1},"complexion":{"style":0,"color":0,"opacity":0},"chestHair":{"style":2,"color":0,"opacity":1},"bodyBlemishes":{"style":0,"color":0,"opacity":0},"blush":{"style":0,"color":0,"opacity":0},"eyebrows":{"style":11,"color":1,"opacity":0.5},"blemishes":{"style":0,"color":0,"opacity":0},"sunDamage":{"style":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"color":0,"opacity":0},"ageing":{"style":0,"color":0,"opacity":0}},"hair":{"style":44,"color":61,"highlight":56}}', '[{"collection":"mpheist3_overlays","nameHash":"mpHeist3_Tat_003_F","Count":1}]');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_houses: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_mails: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

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
) ENGINE=InnoDB AUTO_INCREMENT=2448 DEFAULT CHARSET=utf8mb4;

-- hayalet-temel.player_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor hayalet-temel.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- hayalet-temel.stashitems: ~7 rows (yaklaşık) tablosu için veriler indiriliyor
REPLACE INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(18, '1 | Drawer 1', '[]'),
	(8, '2 | Drawer 1', '[]'),
	(19, '2 | Drawer 2', '[]'),
	(21, '3 | Drawer 1', '[]'),
	(26, 'Delil Deposu', '[]'),
	(25, 'dnastash', '[]'),
	(29, 'LSPD Depo', '[]');

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
