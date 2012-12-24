-- ----------------------------
-- Table structure for `skillsheet_ships`
-- ----------------------------
DROP TABLE IF EXISTS `skillsheet_ships`;
CREATE TABLE `skillsheet_ships` (
  `typeID` mediumint(5) NOT NULL DEFAULT '0',
  `groupID` smallint(5) DEFAULT NULL,
  `typeName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `tag` mediumint(4) NOT NULL,
  `description` text CHARACTER SET utf8,
  `graphicID` mediumint(5) DEFAULT NULL,
  `radius` double DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `capacity` double DEFAULT NULL,
  `portionSize` int(10) DEFAULT NULL,
  `raceID` tinyint(3) unsigned DEFAULT NULL,
  `basePrice` decimal(19,4) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `marketGroupID` smallint(5) DEFAULT NULL,
  `chanceOfDuplicating` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of skillsheet_ships
-- ----------------------------
INSERT INTO `skillsheet_ships` VALUES ('582', '25', 'Bantam', '1', null, '38', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('583', '25', 'Condor', '1', null, '39', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('584', '25', 'Griffin', '1', null, '40', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('585', '25', 'Slasher', '1', null, '44', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('586', '25', 'Probe', '1', null, '45', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('587', '25', 'Rifter', '1', null, '46', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('589', '25', 'Executioner', '1', null, '54', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('590', '25', 'Inquisitor', '1', null, '55', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('591', '25', 'Tormentor', '1', null, '56', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('592', '25', 'Navitas', '1', null, '59', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('593', '25', 'Tristan', '1', null, '60', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('594', '25', 'Incursus', '1', null, '61', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('597', '25', 'Punisher', '1', null, '300', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('598', '25', 'Breacher', '1', null, '305', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('599', '25', 'Burst', '1', null, '306', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('602', '25', 'Kestrel', '1', null, '313', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('603', '25', 'Merlin', '1', null, '314', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('605', '25', 'Heron', '1', null, '316', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('607', '25', 'Imicus', '1', null, '322', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('608', '25', 'Atron', '1', null, '323', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('609', '25', 'Maulus', '1', null, '324', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('620', '26', 'Osprey', '1', null, '41', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('621', '26', 'Caracal', '1', null, '42', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('622', '26', 'Stabber', '1', null, '47', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('623', '26', 'Moa', '1', null, '49', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('624', '26', 'Maller', '1', null, '57', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('625', '26', 'Augoror', '1', null, '58', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('626', '26', 'Vexor', '1', null, '62', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('627', '26', 'Thorax', '1', null, '63', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('628', '26', 'Arbitrator', '1', null, '298', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('629', '26', 'Rupture', '1', null, '302', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('630', '26', 'Bellicose', '1', null, '303', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('631', '26', 'Scythe', '1', null, '304', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('632', '26', 'Blackbird', '1', null, '311', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('633', '26', 'Celestis', '1', null, '319', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('634', '26', 'Exequror', '1', null, '320', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('638', '27', 'Raven', '1', null, '43', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('639', '27', 'Tempest', '1', null, '48', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('640', '27', 'Scorpion', '1', null, '50', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('641', '27', 'Megathron', '1', null, '64', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('642', '27', 'Apocalypse', '1', null, '296', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('643', '27', 'Armageddon', '1', null, '297', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('644', '27', 'Typhoon', '1', null, '301', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('645', '27', 'Dominix', '1', null, '318', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('648', '28', 'Badger', '1', null, '51', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('649', '28', 'Badger Mark II', '1', null, '52', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('650', '28', 'Iteron', '1', null, '65', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('651', '28', 'Hoarder', '1', null, '308', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('652', '28', 'Mammoth', '1', null, '309', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('653', '28', 'Wreathe', '1', null, '310', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('654', '28', 'Iteron Mark II', '1', null, '325', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('655', '28', 'Iteron Mark III', '1', null, '326', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('656', '28', 'Iteron Mark IV', '1', null, '327', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('657', '28', 'Iteron Mark V', '1', null, '328', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('671', '30', 'Erebus', '1', null, '2942', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('1944', '28', 'Bestower', '1', null, '1064', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('2006', '26', 'Omen', '1', null, '1065', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('2161', '25', 'Crucifier', '1', null, '1066', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('3764', '30', 'Leviathan', '1', null, '2930', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('3766', '25', 'Vigil', '1', null, '1240', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11011', '26', 'Guardian-Vexor', '4', null, '62', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11172', '830', 'Helios', '1', null, '1841', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11174', '893', 'Keres', '2', null, '1913', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11176', '831', 'Crow', '2', null, '1848', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11178', '831', 'Raptor', '2', null, '1878', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11182', '830', 'Cheetah', '2', null, '1948', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11184', '831', 'Crusader', '2', null, '1921', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11186', '831', 'Malediction', '2', null, '1861', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11188', '830', 'Anathema', '2', null, '3424', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11190', '893', 'Sentinel', '2', null, '3365', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11192', '830', 'Buzzard', '2', null, '1902', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11194', '893', 'Kitsune', '2', null, '3364', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11196', '831', 'Claw', '2', null, '1928', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11198', '831', 'Stiletto', '2', null, '1779', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11200', '831', 'Taranis', '2', null, '1912', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11202', '831', 'Ares', '2', null, '1773', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11365', '324', 'Vengeance', '2', null, '1860', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11371', '324', 'Wolf', '2', null, '1931', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11377', '834', 'Nemesis', '2', null, '1909', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11379', '324', 'Hawk', '2', null, '1882', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11381', '324', 'Harpy', '2', null, '1901', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11387', '893', 'Hyena', '2', null, '1973', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11393', '324', 'Retribution', '2', null, '1920', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11400', '324', 'Jaguar', '2', null, '1950', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11567', '30', 'Avatar', '1', null, '2910', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11936', '27', 'Apocalypse Imperial Issue', '4', null, '2239', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11938', '27', 'Armageddon Imperial Issue', '4', null, '2240', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11940', '25', 'Gold Magnate', '4', null, '2242', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11942', '25', 'Silver Magnate', '4', null, '2241', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11957', '833', 'Falcon', '2', null, '1896', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11959', '833', 'Rook', '2', null, '1847', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11961', '833', 'Huginn', '2', null, '1945', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11963', '833', 'Rapier', '2', null, '1777', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11965', '833', 'Pilgrim', '2', null, '1914', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11969', '833', 'Arazu', '2', null, '1903', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11971', '833', 'Lachesis', '2', null, '2140', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11978', '832', 'Scimitar', '2', null, '1778', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11985', '832', 'Basilisk', '2', null, '1823', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11987', '832', 'Guardian', '2', null, '1916', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11989', '832', 'Oneiros', '2', null, '2141', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11993', '358', 'Cerberus', '2', null, '1825', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11995', '894', 'Onyx', '2', null, '3362', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('11999', '358', 'Vagabond', '2', null, '1943', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12003', '358', 'Zealot', '2', null, '1751', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12005', '358', 'Ishtar', '2', null, '1835', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12011', '358', 'Eagle', '2', null, '1894', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12013', '894', 'Broadsword', '2', null, '1776', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12015', '358', 'Muninn', '2', null, '1925', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12017', '894', 'Devoter', '2', null, '3363', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12019', '358', 'Sacrilege', '2', null, '1855', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12021', '894', 'Phobos', '2', null, '3361', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12023', '358', 'Deimos', '2', null, '1804', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12032', '834', 'Manticore', '2', null, '1881', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12034', '834', 'Hound', '2', null, '1966', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12038', '834', 'Purifier', '2', null, '1872', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12042', '324', 'Ishkur', '2', null, '1840', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12044', '324', 'Enyo', '2', null, '1771', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12729', '380', 'Crane', '2', null, '2709', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12731', '380', 'Bustard', '2', null, '3020', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12733', '380', 'Prorator', '2', null, '2716', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12735', '380', 'Prowler', '2', null, '2714', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12743', '380', 'Viator', '2', null, '2712', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12745', '380', 'Occator', '2', null, '2711', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12747', '380', 'Mastodon', '2', null, '2713', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('12753', '380', 'Impel', '2', null, '2710', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('13202', '27', 'Megathron Federate Issue', '4', null, '2354', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16227', '419', 'Ferox', '1', null, '2382', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16229', '419', 'Brutix', '1', null, '2383', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16231', '419', 'Cyclone', '1', null, '2384', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16233', '419', 'Prophecy', '1', null, '2385', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16236', '420', 'Coercer', '1', null, '2387', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16238', '420', 'Cormorant', '1', null, '2388', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16240', '420', 'Catalyst', '1', null, '2389', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('16242', '420', 'Thrasher', '1', null, '2390', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17476', '463', 'Covetor', '1', null, '2522', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17478', '463', 'Retriever', '1', null, '2523', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17480', '463', 'Procurer', '1', null, '2524', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17619', '25', 'Caldari Navy Hookbill', '4', null, '2633', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17634', '26', 'Caracal Navy Issue', '4', null, '2637', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17636', '27', 'Raven Navy Issue', '4', null, '2638', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17703', '25', 'Imperial Navy Slicer', '4', null, '1067', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17709', '26', 'Omen Navy Issue', '4', null, '1731', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17713', '26', 'Stabber Fleet Issue', '4', null, '2639', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17715', '26', 'Gila', '8', null, '1824', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17718', '26', 'Phantasm', '8', null, '2643', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17720', '26', 'Cynabal', '8', null, '337', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17722', '26', 'Vigilant', '8', null, '1815', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17726', '27', 'Apocalypse Navy Issue', '4', null, '2239', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17728', '27', 'Megathron Navy Issue', '4', null, '2354', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17732', '27', 'Tempest Fleet Issue', '4', null, '2642', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17736', '27', 'Nightmare', '8', null, '2641', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17738', '27', 'Machariel', '8', null, '335', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17740', '27', 'Vindicator', '8', null, '2157', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17812', '25', 'Republic Fleet Firetail', '4', null, '2635', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17841', '25', 'Gallente Navy Comet', '4', null, '2634', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17843', '26', 'Vexor Navy Issue', '4', null, '1803', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17918', '27', 'Rattlesnake', '8', null, '2159', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17920', '27', 'Bhaalgorn', '8', null, '2644', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17922', '26', 'Ashimmu', '8', null, '2636', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17924', '25', 'Succubus', '8', null, '2640', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17926', '25', 'Cruor', '8', null, '2632', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17928', '25', 'Daredevil', '8', null, '339', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17930', '25', 'Worm', '8', null, '1831', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('17932', '25', 'Dramiel', '8', null, '338', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('19720', '485', 'Revelation', '1', null, '2743', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('19722', '485', 'Naglfar', '1', null, '2755', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('19724', '485', 'Moros', '1', null, '2744', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('19726', '485', 'Phoenix', '1', null, '2786', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('19744', '28', 'Sigil', '1', null, '2715', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('20125', '833', 'Curse', '2', null, '1854', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('20183', '513', 'Providence', '1', null, '2738', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('20185', '513', 'Charon', '1', null, '2740', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('20187', '513', 'Obelisk', '1', null, '2739', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('20189', '513', 'Fenrir', '1', null, '2737', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22428', '898', 'Redeemer', '2', null, '3356', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22430', '898', 'Sin', '2', null, '3350', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22436', '898', 'Widow', '2', null, '3349', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22440', '898', 'Panther', '2', null, '3355', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22442', '540', 'Eos', '2', null, '2925', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22444', '540', 'Sleipnir', '2', null, '2912', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22446', '540', 'Vulture', '2', null, '2807', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22448', '540', 'Absolution', '2', null, '2926', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22452', '541', 'Heretic', '2', null, '2805', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22456', '541', 'Sabre', '2', null, '2814', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22460', '541', 'Eris', '2', null, '2811', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22464', '541', 'Flycatcher', '2', null, '2802', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22466', '540', 'Astarte', '2', null, '2798', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22468', '540', 'Claymore', '2', null, '2794', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22470', '540', 'Nighthawk', '2', null, '2801', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22474', '540', 'Damnation', '2', null, '2804', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22544', '543', 'Hulk', '2', null, '2938', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22546', '543', 'Skiff', '2', null, '2940', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22548', '543', 'Mackinaw', '2', null, '2939', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('22852', '547', 'Hel', '1', null, '2894', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('23757', '547', 'Archon', '1', null, '2905', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('23773', '30', 'Ragnarok', '1', null, '2906', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('23911', '547', 'Thanatos', '1', null, '2932', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('23913', '547', 'Nyx', '1', null, '2909', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('23915', '547', 'Chimera', '1', null, '2931', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('23917', '547', 'Wyvern', '1', null, '2928', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('23919', '547', 'Aeon', '1', null, '2911', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24483', '547', 'Nidhoggur', '1', null, '2929', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24688', '27', 'Rokh', '1', null, '3170', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24690', '27', 'Hyperion', '1', null, '3207', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24692', '27', 'Abaddon', '1', null, '3132', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24694', '27', 'Maelstrom', '1', null, '3134', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24696', '419', 'Harbinger', '1', null, '3133', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24698', '419', 'Drake', '1', null, '3169', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24700', '419', 'Myrmidon', '1', null, '3168', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('24702', '419', 'Hurricane', '1', null, '3135', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('26840', '27', 'Raven State Issue', '4', null, '3204', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('26842', '27', 'Tempest Tribal Issue', '4', null, '3205', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28352', '941', 'Rorqual', '1', null, '3331', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28606', '941', 'Orca', '1', null, '3466', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28659', '900', 'Paladin', '2', null, '3351', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28661', '900', 'Kronos', '2', null, '3353', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28665', '900', 'Vargur', '2', null, '3354', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28710', '900', 'Golem', '2', null, '3352', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28844', '902', 'Rhea', '2', null, '3358', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28846', '902', 'Nomad', '2', null, '3360', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28848', '902', 'Anshar', '2', null, '3359', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('28850', '902', 'Ark', '2', null, '3357', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29248', '25', 'Magnate', '1', null, '3367', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29336', '26', 'Scythe Fleet Issue', '4', null, '1887', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29337', '26', 'Augoror Navy Issue', '4', null, '1730', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29340', '26', 'Osprey Navy Issue', '4', null, '1784', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29344', '26', 'Exequror Navy Issue', '4', null, '1802', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29984', '963', 'Tengu', '3', null, '3762', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29986', '963', 'Legion', '3', null, '3763', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29988', '963', 'Proteus', '3', null, '3765', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('29990', '963', 'Loki', '3', null, '3764', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32305', '27', 'Armageddon Navy Issue', '4', null, '3814', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32307', '27', 'Dominix Navy Issue', '4', null, '3816', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32309', '27', 'Scorpion Navy Issue', '4', null, '3815', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32311', '27', 'Typhoon Fleet Issue', '4', null, '3817', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('2998', '28', 'Noctis', '1', null, '3815', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('2834', '324', 'Utu', '2', null, '10005', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32207', '324', 'Freki', '2', null, '3799', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('2836', '358', 'Adrestia', '2', null, '10006', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32209', '358', 'Mimir', '2', null, '3800', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('3514', '547', 'Revenant', '8', null, '10038', null, null, null, null, null, '16', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('3516', '324', 'Malice', '2', null, '32764', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('3518', '358', 'Vangel', '2', null, '32765', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('4302', '419', 'Oracle', '1', null, '4302', null, null, null, null, null, '4', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('4306', '419', 'Naga', '1', null, '4306', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('4308', '419', 'Talos', '1', null, '4308', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('4310', '419', 'Tornado', '1', null, '4310', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32788', '324', 'Cambion', '2', null, '32788', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32790', '832', 'Etana', '2', null, '32790', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32880', '25', 'Venture', '1', null, '32880', null, null, null, null, null, '32', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32878', '420', 'Talwar', '1', null, '32878', null, null, null, null, null, '2', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32872', '420', 'Algos', '1', null, '32872', null, null, null, null, null, '8', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32876', '420', 'Corax', '1', null, '32876', null, null, null, null, null, '1', null, '1', null, null);
INSERT INTO `skillsheet_ships` VALUES ('32874', '420', 'Dragoon', '1', null, '32874', null, null, null, null, null, '4', null, '1', null, null);
