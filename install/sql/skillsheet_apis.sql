SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for skillsheet_apis
-- ----------------------------
DROP TABLE IF EXISTS `skillsheet_apis`;
CREATE TABLE `skillsheet_apis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `characterID` varchar(15) NOT NULL DEFAULT '',
  `corporationName` varchar(150) NOT NULL DEFAULT '',
  `keyID` varchar(10) NOT NULL DEFAULT '',
  `vCode` varchar(200) NOT NULL DEFAULT '',
  `selected` tinyint(1) NOT NULL DEFAULT '0',
  `implants` tinyint(1) NOT NULL DEFAULT '1',
  `characterInfo` text NOT NULL,
  `data` text NOT NULL,
  `training` text NOT NULL,
  `queue` text NOT NULL,
  `cachedUntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
