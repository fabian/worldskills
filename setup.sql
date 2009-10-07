
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`,`name`)
VALUES
	(1,'Aircraft Maintenance Technician'),
	(2,'Architectural Technology & Design Technician'),
	(3,'Autobody Repair Technician'),
	(4,'Automation and Control Technician'),
	(5,'Automotive Service Technician'),
	(6,'Baker'),
	(7,'Cabinet Maker'),
	(8,'Car Painter'),
	(9,'Carpenter'),
	(10,'Chef'),
	(11,'CNC Machinist'),
	(12,'Computer Animation'),
	(13,'Electrician'),
	(14,'Electronic Technician'),
	(15,'Fashion Technologist'),
	(16,'Graphic Designer '),
	(17,'Hairstylist'),
	(18,'Heavy Equipment Service Technician'),
	(19,'IT and Network Specialist'),
	(20,'IT Office Software Applications '),
	(21,'Landscape Gardener'),
	(22,'Mason Contractor'),
	(23,'Mechanical CADD Technician'),
	(24,'Mechatronic Engineer'),
	(25,'Outdoor Power and Recreation Equipment '),
	(26,'Plumber'),
	(27,'Precision Machinist'),
	(28,'Refrigeration '),
	(29,'Restaurant Service '),
	(30,'Robotics '),
	(31,'Sheet Metal Worker'),
	(32,'TV / Video Producer'),
	(33,'Web Site Developer'),
	(34,'Welder');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `province` int(10) unsigned NOT NULL,
  `category` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `jobs_ibfk_3` (`category`),
  KEY `jobs_ibfk_1` (`user`),
  KEY `jobs_ibfk_2` (`province`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `jobs_ibfk_3` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`,`user`,`title`,`description`,`province`,`category`)
VALUES
	(1,2,'Web Developer','Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.\n\nPhasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.\n\nPellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.',1,25),
	(2,2,'Car Painter','Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.\n\nMorbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.\n\nPraesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.',4,15),
	(3,2,'Welder','Terms of Employment: Permanent, Full Time, On Call, Day\r\nSalary: To be negotiated, Medical Benefits, Dental Benefits, Group Insurance Benefits\r\nAnticipated Start Date: As soon as possible\r\nLocation: Parksville, British Columbia (1 vacancy) \r\nSkill Requirements:\r\nEducation: Some college/CEGEP/vocational or technical training\r\n\r\nCredentials (certificates, licences, memberships, courses, etc.): Refrigeration and Air Conditioning Mechanic Trade Certification, 1st Period Apprentice, 2nd Period Apprentice, 3rd Period Apprentice, 4th Period Apprentice, 5th Period Apprentice, Refrigeration and Air Conditioning Mechanic Red Seal Certificate, Transport Refrigeration Mechanic Trade Certification, Ozone Depletion Prevention (ODP) Certificate, WHMIS, Occupational Health and Safety Certificate, First Aid Certificate\r\n\r\nExperience: 3 years to less than 5 years\r\n\r\nLanguages: Speak English, Read English\r\n\r\nMajor Work Area: Construction, Installation, Maintenance, Service, Repair, Commercial, Residential\r\n\r\nAir Conditioning and Refrigeration Systems: Rooftop (self-contained), Heat pump, Air motioning and circulation, Built up (split system), Humidification and de-humidification systems, Ventilation\r\n\r\nControl Systems: Electrical devices, On-board diagnostics',13,25),
	(4,2,'Furniture Maker','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.\n\nSed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.',5,12),
	(5,2,'Automobile Mechanic','Terms of Employment: Permanent, Full Time, Overtime, Day\r\nSalary: $15.00 to $25.00 Hourly for 40 hours per week\r\nAnticipated Start Date: As soon as possible\r\nLocation: Etobicoke, Ontario (1 vacancy) \r\nSkill Requirements:\r\nEducation: Not required\r\n\r\nCredentials (certificates, licences, memberships, courses, etc.): Automotive Service Technician Trade Certification\r\n\r\nExperience: 5 years or more\r\n\r\nLanguages: Speak English, Read English, Write English\r\n\r\nType of Experience: Automobiles, Trucks',13,20),
	(6,2,'Refrigeration Technician','Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.',12,20);

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table provinces
# ------------------------------------------------------------

CREATE TABLE `provinces` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` (`id`,`name`,`sort`)
VALUES
	(1,'Alberta',1),
	(2,'British Colombia',2),
	(3,'Manitoba',3),
	(4,'New Brunswick',4),
	(5,'Newfoundland and Labrador',5),
	(6,'Northwest Territories',6),
	(7,'Nova Scotia',7),
	(8,'Nunavut',8),
	(9,'Ontario',9),
	(10,'Prince Edward Island',10),
	(11,'Quebec',11),
	(12,'Saskatchewan',12),
	(13,'Yukon',13);

/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resumes
# ------------------------------------------------------------

CREATE TABLE `resumes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user` int(10) unsigned NOT NULL,
  `job` int(10) unsigned NOT NULL,
  `upload` mediumblob NOT NULL,
  `filename` varchar(255) NOT NULL,
  `application` mediumtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `resumes_ibfk_2` (`job`),
  KEY `resumes_ibfk_1` (`user`),
  CONSTRAINT `resumes_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resumes_ibfk_2` FOREIGN KEY (`job`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` (`id`,`user`,`job`,`upload`,`filename`,`application`)
VALUES
	(1,3,1,X'41657374686574696320546563686E696369616E0D0A4169726372616674204D61696E74656E616E636520546563686E696369616E0D0A4172636869746563747572616C20546563686E6F6C6F677920262044657369676E20546563686E696369616E0D0A4175746F626F64792052657061697220546563686E696369616E0D0A4175746F6D6174696F6E20616E6420436F6E74726F6C20546563686E696369616E0D0A4175746F6D6F74697665205365727669636520546563686E696369616E0D0A42616B65720D0A436162696E6574204D616B65720D0A436172205061696E7465720D0A43617270656E7465720D0A436865660D0A434E43204D616368696E6973740D0A436F6D707574657220416E696D6174696F6E0D0A456C65637472696369616E0D0A456C656374726F6E696320546563686E696369616E0D0A46617368696F6E20546563686E6F6C6F676973740D0A477261706869632044657369676E6572200D0A486169727374796C6973740D0A48656176792045717569706D656E74205365727669636520546563686E696369616E0D0A495420616E64204E6574776F726B205370656369616C6973740D0A4954204F666669636520536F667477617265204170706C69636174696F6E73200D0A4C616E6473636170652047617264656E65720D0A4D61736F6E20436F6E74726163746F720D0A4D656368616E6963616C204341444420546563686E696369616E0D0A4D6563686174726F6E696320456E67696E6565720D0A4F7574646F6F7220506F77657220616E642052656372656174696F6E2045717569706D656E74200D0A506C756D6265720D0A507265636973696F6E204D616368696E6973740D0A52656672696765726174696F6E200D0A52657374617572616E742053657276696365200D0A526F626F74696373200D0A5368656574204D6574616C20576F726B65720D0A5456202F20566964656F2050726F64756365720D0A576562205369746520446576656C6F7065720D0A57656C6465720D0A','categories.csv','Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.'),
	(2,3,1,X'4A6F622043617465676F726965730D0A41657374686574696320546563686E696369616E0D0A4169726372616674204D61696E74656E616E636520546563686E696369616E0D0A4172636869746563747572616C20546563686E6F6C6F677920262044657369676E20546563686E696369616E0D0A4175746F626F64792052657061697220546563686E696369616E0D0A4175746F6D6174696F6E20616E6420436F6E74726F6C20546563686E696369616E0D0A4175746F6D6F74697665205365727669636520546563686E696369616E0D0A42616B65720D0A436162696E6574204D616B65720D0A436172205061696E7465720D0A43617270656E7465720D0A436865660D0A434E43204D616368696E6973740D0A436F6D707574657220416E696D6174696F6E0D0A456C65637472696369616E0D0A456C656374726F6E696320546563686E696369616E0D0A46617368696F6E20546563686E6F6C6F676973740D0A477261706869632044657369676E6572200D0A486169727374796C6973740D0A48656176792045717569706D656E74205365727669636520546563686E696369616E0D0A495420616E64204E6574776F726B205370656369616C6973740D0A4954204F666669636520536F667477617265204170706C69636174696F6E73200D0A4C616E6473636170652047617264656E65720D0A4D61736F6E20436F6E74726163746F720D0A4D656368616E6963616C204341444420546563686E696369616EFF0D0A4D6563686174726F6E696320456E67696E656572FFFFFFFF20FFFFFFFFFFFFFF200D0A4F7574646F6F7220506F77657220616E642052656372656174696F6E2045717569706D656E74200D0A506C756D6265720D0A507265636973696F6E204D616368696E6973740D0A52656672696765726174696F6E200D0A52657374617572616E742053657276696365200D0A526F626F74696373200D0A5368656574204D6574616C20576F726B65720D0A5456202F20566964656F2050726F64756365720D0A576562205369746520446576656C6F7065720D0A57656C6465720D0A','Job Categories.csv','Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.');

/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` enum('mr','mrs') NOT NULL default 'mr',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `company` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `cell` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` int(10) unsigned default NULL,
  `category` int(10) unsigned default NULL,
  `confirmed` tinyint(1) unsigned NOT NULL default '0',
  `approved` tinyint(1) unsigned NOT NULL default '0',
  `confirmation` varchar(8) NOT NULL,
  `type` enum('candidate','employer','admin') NOT NULL default 'candidate',
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `users_ibfk_2` (`province`),
  KEY `users_ibfk_1` (`category`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`title`,`firstname`,`lastname`,`email`,`password`,`company`,`phone`,`fax`,`cell`,`street`,`postal`,`city`,`province`,`category`,`confirmed`,`approved`,`confirmation`,`type`,`ip`)
VALUES
	(1,'mr','Master','Admin','sk17user12admin@wsc-sk17-02.wsc2009.local','7c25b2d52547e47507361a7833733c4be15fb70f','','','','','','','',3,22,1,1,'a45a68ab','admin','127.0.0.1'),
	(2,'mrs','Tricia','McMillan','sk17user12employer@wsc-sk17-02.wsc2009.local','7c25b2d52547e47507361a7833733c4be15fb70f','Foobar','123 456 78 45','','','Mainstreet 23','54461','London',12,16,1,1,'a45a68ab','employer','127.0.0.1'),
	(3,'mr','Zaphod','Beeblebrox','sk17user12candidate@wsc-sk17-02.wsc2009.local','7c25b2d52547e47507361a7833733c4be15fb70f','','658 112 54 98','','','Roadway','32552','Vancouver',11,21,1,1,'a45a68ab','candidate','127.0.0.1');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
