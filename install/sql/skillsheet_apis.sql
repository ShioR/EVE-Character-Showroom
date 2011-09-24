DROP TABLE IF EXISTS `skillsheet_apis`;
CREATE TABLE `skillsheet_apis` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(120) NOT NULL default '',
  `public` tinyint(1) NOT NULL default '0',
  `characterID` varchar(15) NOT NULL default '',
  `corporationName` varchar(150) NOT NULL default '',
  `keyID` varchar(10) NOT NULL default '',
  `vCode` varchar(200) NOT NULL default '',
  `selected` tinyint(1) NOT NULL default '0',
  `password` varchar(100) NOT NULL default '',
  `implants` tinyint(1) NOT NULL default '1',
  `characterInfo` text NOT NULL,
  `data` text NOT NULL,
  `training` text NOT NULL,
  `queue` text NOT NULL,
  `standings` text NOT NULL,
  `cachedUntil` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;