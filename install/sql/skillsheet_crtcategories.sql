DROP TABLE IF EXISTS `skillsheet_crtcategories`;
CREATE TABLE `skillsheet_crtcategories` (
  `categoryID` tinyint(3) unsigned NOT NULL,
  `description` varchar(500) default NULL,
  `categoryName` varchar(256) default NULL,
  PRIMARY KEY  (`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skillsheet_crtcategories
-- ----------------------------
INSERT INTO `skillsheet_crtcategories` VALUES ('3', 'Core Certificates', 'Core');
INSERT INTO `skillsheet_crtcategories` VALUES ('4', 'Starter Professions', 'Starter Professions');
INSERT INTO `skillsheet_crtcategories` VALUES ('5', 'Defence', 'Defence');
INSERT INTO `skillsheet_crtcategories` VALUES ('6', 'Gunnery', 'Gunnery');
INSERT INTO `skillsheet_crtcategories` VALUES ('7', 'Missiles', 'Missiles');
INSERT INTO `skillsheet_crtcategories` VALUES ('8', 'Drones', 'Drones');
INSERT INTO `skillsheet_crtcategories` VALUES ('9', 'Electronic Warfare', 'Electronic Warfare');
INSERT INTO `skillsheet_crtcategories` VALUES ('10', 'Navigation', 'Navigation');
INSERT INTO `skillsheet_crtcategories` VALUES ('11', 'Leadership', 'Leadership');
INSERT INTO `skillsheet_crtcategories` VALUES ('12', 'Harvesting', 'Harvesting');
INSERT INTO `skillsheet_crtcategories` VALUES ('13', 'Business and Industry', 'Business and Industry');
INSERT INTO `skillsheet_crtcategories` VALUES ('18', 'Colony Management', 'Planetary Interaction');
