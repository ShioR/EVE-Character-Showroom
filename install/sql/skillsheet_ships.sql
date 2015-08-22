SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for skillsheet_ships
-- ----------------------------
DROP TABLE IF EXISTS `skillsheet_ships`;
CREATE TABLE `skillsheet_ships` (
  `typeID` mediumint(5) NOT NULL DEFAULT '0',
  `groupID` smallint(5) DEFAULT NULL,
  `typeName` varchar(100) DEFAULT NULL,
  `tag` mediumint(4) DEFAULT NULL,
  `factionID` mediumint(6) unsigned DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `graphicID` mediumint(5) DEFAULT NULL,
  `graphicFile` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skillsheet_ships
-- ----------------------------
INSERT INTO `skillsheet_ships` VALUES ('582', '25', 'Bantam', '1', '500001', '1', '38', 'cf1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('583', '25', 'Condor', '1', '500001', '1', '39', 'cf2_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('584', '25', 'Griffin', '1', '500001', '1', '40', 'cf4_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('585', '25', 'Slasher', '1', '500002', '1', '44', 'mf1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('586', '25', 'Probe', '1', '500002', '1', '45', 'mf2_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('587', '25', 'Rifter', '1', '500002', '1', '46', 'mf4_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('589', '25', 'Executioner', '1', '500003', '1', '54', 'af4_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('590', '25', 'Inquisitor', '1', '500003', '1', '55', 'af5_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('591', '25', 'Tormentor', '1', '500003', '1', '56', 'af6_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('592', '25', 'Navitas', '1', '500004', '1', '59', 'gf2_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('593', '25', 'Tristan', '1', '500004', '1', '60', 'gf3_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('594', '25', 'Incursus', '1', '500004', '1', '61', 'gf4_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('597', '25', 'Punisher', '1', '500003', '1', '300', 'af3_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('598', '25', 'Breacher', '1', '500002', '1', '305', 'mf5_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('599', '25', 'Burst', '1', '500002', '1', '306', 'mf6_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('602', '25', 'Kestrel', '1', '500001', '1', '313', 'cf6_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('603', '25', 'Merlin', '1', '500001', '1', '314', 'cf7_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('605', '25', 'Heron', '1', '500001', '1', '316', 'cf3_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('607', '25', 'Imicus', '1', '500004', '1', '322', 'gf5_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('608', '25', 'Atron', '1', '500004', '1', '323', 'gf6_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('609', '25', 'Maulus', '1', '500004', '1', '324', 'gf7_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('620', '26', 'Osprey', '1', '500001', '1', '41', 'cc1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('621', '26', 'Caracal', '1', '500001', '1', '42', 'cc3_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('622', '26', 'Stabber', '1', '500002', '1', '47', 'mc1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('623', '26', 'Moa', '1', '500001', '1', '49', 'cc2_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('624', '26', 'Maller', '1', '500003', '1', '57', 'ac2_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('625', '26', 'Augoror', '1', '500003', '1', '58', 'ac3_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('626', '26', 'Vexor', '1', '500004', '1', '62', 'gc3_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('627', '26', 'Thorax', '1', '500004', '1', '63', 'gc4_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('628', '26', 'Arbitrator', '1', '500003', '1', '298', 'ac1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('629', '26', 'Rupture', '1', '500002', '1', '302', 'mc2_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('630', '26', 'Bellicose', '1', '500002', '1', '303', 'mc3_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('631', '26', 'Scythe', '1', '500002', '1', '304', 'mc4_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('632', '26', 'Blackbird', '1', '500001', '1', '311', 'cc4_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('633', '26', 'Celestis', '1', '500004', '1', '319', 'gc1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('634', '26', 'Exequror', '1', '500004', '1', '320', 'gc2_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('638', '27', 'Raven', '1', '500001', '1', '43', 'cb1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('639', '27', 'Tempest', '1', '500002', '1', '48', 'mb2_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('640', '27', 'Scorpion', '1', '500001', '1', '50', 'cb2_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('641', '27', 'Megathron', '1', '500004', '1', '64', 'gb2_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('642', '27', 'Apocalypse', '1', '500003', '1', '296', 'ab1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('643', '27', 'Armageddon', '1', '500003', '1', '297', 'ab2_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('644', '27', 'Typhoon', '1', '500002', '1', '301', 'mb1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('645', '27', 'Dominix', '1', '500004', '1', '318', 'gb1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('648', '28', 'Badger', '1', '500001', '1', '51', 'ci1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('649', '28', 'Tayra', '1', '500001', '1', '52', 'ci2_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('650', '28', 'Nereus', '1', '500004', '1', '65', 'gi1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('651', '28', 'Hoarder', '1', '500002', '1', '308', 'mi1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('652', '28', 'Mammoth', '1', '500002', '1', '309', 'mi2_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('653', '28', 'Wreathe', '1', '500002', '1', '310', 'mi3_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('654', '28', 'Kryos', '1', '500004', '1', '325', 'gi2_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('655', '28', 'Epithal', '1', '500004', '1', '326', 'gi3_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('656', '28', 'Miasmos', '1', '500004', '1', '327', 'gi4_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('657', '28', 'Iteron Mark V', '1', '500004', '1', '328', 'gi5_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('671', '30', 'Erebus', '1', '500004', '1', '2942', 'gt1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('1944', '28', 'Bestower', '1', '500003', '1', '1064', 'ai1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('2006', '26', 'Omen', '1', '500003', '1', '1065', 'ac4_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('2161', '25', 'Crucifier', '1', '500003', '1', '1066', 'af2_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('3764', '30', 'Leviathan', '1', '500001', '1', '2930', 'ct1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('3766', '25', 'Vigil', '1', '500002', '1', '1240', 'mf7_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11011', '26', 'Guardian-Vexor', '4', '500004', '1', '1814', 'gc3_t1:serpentis:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11172', '830', 'Helios', '2', '500004', '1', '1841', 'gf5_t2:creodron:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11174', '893', 'Keres', '2', '500004', '1', '1913', 'gf7_t2:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11176', '831', 'Crow', '2', '500001', '1', '1848', 'cf2_t2a:kaalakiota:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11178', '831', 'Raptor', '2', '500001', '1', '1878', 'cf2_t2b:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11182', '830', 'Cheetah', '2', '500002', '1', '1948', 'mf2_t2b:thukker:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11184', '831', 'Crusader', '2', '500003', '1', '1921', 'af4_t2b:sarum:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11186', '831', 'Malediction', '2', '500003', '1', '1861', 'af4_t2a:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11188', '830', 'Anathema', '2', '500003', '1', '3424', 'af7_t2:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11190', '893', 'Sentinel', '2', '500003', '1', '3365', 'af2_t2:ardishapur:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11192', '830', 'Buzzard', '2', '500001', '1', '1902', 'cf3_t2:ishukone:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11194', '893', 'Kitsune', '2', '500001', '1', '3364', 'cf4_t2:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11196', '831', 'Claw', '2', '500002', '1', '1928', 'mf1_t2a:brutor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11198', '831', 'Stiletto', '2', '500002', '1', '1779', 'mf1_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11200', '831', 'Taranis', '2', '500004', '1', '1912', 'gf6_t2b:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11202', '831', 'Ares', '2', '500004', '1', '1773', 'gf6_t2a:roden:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11365', '324', 'Vengeance', '2', '500003', '1', '1860', 'af3_t2a:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11371', '324', 'Wolf', '2', '500002', '1', '1931', 'mf4_t2a:brutor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11377', '834', 'Nemesis', '2', '500004', '1', '1909', 'gf3_t2:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11379', '324', 'Hawk', '2', '500001', '1', '1882', 'cf7_t2a:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11381', '324', 'Harpy', '2', '500001', '1', '1901', 'cf7_t2b:ishukone:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11387', '893', 'Hyena', '2', '500002', '1', '1973', 'mf7_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11393', '324', 'Retribution', '2', '500003', '1', '1920', 'af3_t2b:sarum:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11400', '324', 'Jaguar', '2', '500002', '1', '1950', 'mf4_t2b:thukker:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11567', '30', 'Avatar', '1', '500003', '1', '2910', 'at1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11936', '27', 'Apocalypse Imperial Issue', '4', '500003', '1', '4515', 'ab1_t1:imperial:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11938', '27', 'Armageddon Imperial Issue', '4', '500003', '1', '2240', 'ab2_t1:imperial:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11940', '25', 'Gold Magnate', '4', '500003', '1', '2242', 'af7_i:tournament-i:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11942', '25', 'Silver Magnate', '4', '500003', '1', '2241', 'af7_i:tournament-i:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11957', '833', 'Falcon', '2', '500001', '1', '1896', 'cc4_t2a:ishukone:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11959', '833', 'Rook', '2', '500001', '1', '1847', 'cc4_t2b:kaalakiota:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11961', '833', 'Huginn', '2', '500002', '1', '1945', 'mc3_t2a:brutor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11963', '833', 'Rapier', '2', '500002', '1', '1777', 'mc3_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11965', '833', 'Pilgrim', '2', '500003', '1', '1914', 'ac1_t2b:sarum:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11969', '833', 'Arazu', '2', '500004', '1', '1903', 'gc1_t2a:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11971', '833', 'Lachesis', '2', '500004', '1', '2140', 'gc1_t2b:roden:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11978', '832', 'Scimitar', '2', '500002', '1', '1778', 'mc4_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('11985', '832', 'Basilisk', '2', '500001', '1', '1823', 'cc1_t2:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11987', '832', 'Guardian', '2', '500003', '1', '1916', 'ac3_t2:sarum:amarr');
INSERT INTO `skillsheet_ships` VALUES ('11989', '832', 'Oneiros', '2', '500004', '1', '2141', 'gc2_t2:roden:gallente');
INSERT INTO `skillsheet_ships` VALUES ('11993', '358', 'Cerberus', '2', '500001', '1', '1825', 'cc3_t2:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11995', '894', 'Onyx', '2', '500001', '1', '3362', 'cc2_t2a:kaalakiota:caldari');
INSERT INTO `skillsheet_ships` VALUES ('11999', '358', 'Vagabond', '2', '500002', '1', '1943', 'mc1_t2b:thukker:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('12003', '358', 'Zealot', '2', '500003', '1', '1751', 'ac4_t2:ardishapur:amarr');
INSERT INTO `skillsheet_ships` VALUES ('12005', '358', 'Ishtar', '2', '500004', '1', '1835', 'gc3_t2:creodron:gallente');
INSERT INTO `skillsheet_ships` VALUES ('12011', '358', 'Eagle', '2', '500001', '1', '1894', 'cc2_t2b:ishukone:caldari');
INSERT INTO `skillsheet_ships` VALUES ('12013', '894', 'Broadsword', '2', '500002', '1', '1776', 'mc2_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('12015', '358', 'Muninn', '2', '500002', '1', '1925', 'mc2_t2a:brutor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('12017', '894', 'Devoter', '2', '500003', '1', '3363', 'ac2_t2b:ardishapur:amarr');
INSERT INTO `skillsheet_ships` VALUES ('12019', '358', 'Sacrilege', '2', '500003', '1', '1855', 'ac2_t2a:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('12021', '894', 'Phobos', '2', '500004', '1', '3361', 'gc4_t2b:roden:gallente');
INSERT INTO `skillsheet_ships` VALUES ('12023', '358', 'Deimos', '2', '500004', '1', '1804', 'gc4_t2a:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('12032', '834', 'Manticore', '2', '500001', '1', '1881', 'cf6_t2:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('12034', '834', 'Hound', '2', '500002', '1', '1966', 'mf5_t2a:brutor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('12038', '834', 'Purifier', '2', '500003', '1', '1872', 'af5_t2:ardishapur:amarr');
INSERT INTO `skillsheet_ships` VALUES ('12042', '324', 'Ishkur', '2', '500004', '1', '1840', 'gf4_t2a:creodron:gallente');
INSERT INTO `skillsheet_ships` VALUES ('12044', '324', 'Enyo', '2', '500004', '1', '1771', 'gf4_t2b:roden:gallente');
INSERT INTO `skillsheet_ships` VALUES ('12729', '380', 'Crane', '2', '500001', '1', '2709', 'ci2_t2:kaalakiota:caldari');
INSERT INTO `skillsheet_ships` VALUES ('12731', '380', 'Bustard', '2', '500001', '1', '3020', 'ci3_t2:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('12733', '380', 'Prorator', '2', '500003', '1', '2716', 'ai2_t2:ardishapur:amarr');
INSERT INTO `skillsheet_ships` VALUES ('12735', '380', 'Prowler', '2', '500002', '1', '2714', 'mi3_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('12743', '380', 'Viator', '2', '500004', '1', '2712', 'gi4_t2:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('12745', '380', 'Occator', '2', '500004', '1', '2711', 'gi2_t2:roden:gallente');
INSERT INTO `skillsheet_ships` VALUES ('12747', '380', 'Mastodon', '2', '500002', '1', '2713', 'mi2_t2b:thukker:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('12753', '380', 'Impel', '2', '500003', '1', '2710', 'ai1_t2:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('13202', '27', 'Megathron Federate Issue', '4', '500004', '1', '11869', 'gb2_t1:fedunique:gallente');
INSERT INTO `skillsheet_ships` VALUES ('16227', '419', 'Ferox', '1', '500001', '1', '2382', 'cbc1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('16229', '419', 'Brutix', '1', '500004', '1', '2383', 'gbc1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('16231', '419', 'Cyclone', '1', '500002', '1', '2384', 'mbc1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('16233', '419', 'Prophecy', '1', '500003', '1', '2385', 'abc1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('16236', '420', 'Coercer', '1', '500003', '1', '2387', 'ade1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('16238', '420', 'Cormorant', '1', '500001', '1', '2388', 'cde1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('16240', '420', 'Catalyst', '1', '500004', '1', '2389', 'gde1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('16242', '420', 'Thrasher', '1', '500002', '1', '2390', 'mde1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('17476', '463', 'Covetor', '1', '500014', '1', '2522', 'oreba3_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('17478', '463', 'Retriever', '1', '500014', '1', '2523', 'oreba2_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('17480', '463', 'Procurer', '1', '500014', '1', '2524', 'oreba1_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('17619', '25', 'Caldari Navy Hookbill', '4', '500001', '1', '2633', 'cf8_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('17634', '26', 'Caracal Navy Issue', '4', '500001', '1', '2637', 'cc3_t1:caldarinavy:caldari');
INSERT INTO `skillsheet_ships` VALUES ('17636', '27', 'Raven Navy Issue', '4', '500001', '1', '2638', 'cb1_t1:caldarinavy:caldari');
INSERT INTO `skillsheet_ships` VALUES ('17703', '25', 'Imperial Navy Slicer', '4', '500003', '1', '1067', 'af9_t1:amarrnavy:amarr');
INSERT INTO `skillsheet_ships` VALUES ('17709', '26', 'Omen Navy Issue', '4', '500003', '1', '1731', 'ac4_t1:amarrnavy:amarr');
INSERT INTO `skillsheet_ships` VALUES ('17713', '26', 'Stabber Fleet Issue', '4', '500002', '1', '1884', 'mc1_t1:minmatarnavy:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('17715', '26', 'Gila', '8', '500010', '1', '1824', 'cc2_t1:guristas:caldari');
INSERT INTO `skillsheet_ships` VALUES ('17718', '26', 'Phantasm', '8', '500019', '1', '1236', 'sc1_t1:sanshabase:sansha');
INSERT INTO `skillsheet_ships` VALUES ('17720', '26', 'Cynabal', '8', '500011', '1', '337', 'angbc1_t1:angelbase:angel');
INSERT INTO `skillsheet_ships` VALUES ('17722', '26', 'Vigilant', '8', '500020', '1', '1815', 'gc4_t1:serpentis:gallente');
INSERT INTO `skillsheet_ships` VALUES ('17726', '27', 'Apocalypse Navy Issue', '4', '500003', '1', '2239', 'ab1_t1:amarrnavy:amarr');
INSERT INTO `skillsheet_ships` VALUES ('17728', '27', 'Megathron Navy Issue', '4', '500004', '1', '2139', 'gb2_t1:gallentenavy:gallente');
INSERT INTO `skillsheet_ships` VALUES ('17732', '27', 'Tempest Fleet Issue', '4', '500002', '1', '2642', 'mb2_t1:minmatarnavy:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('17736', '27', 'Nightmare', '8', '500019', '1', '2295', 'sb1_t1:sanshabase:sansha');
INSERT INTO `skillsheet_ships` VALUES ('17738', '27', 'Machariel', '8', '500011', '1', '335', 'angb1_t1:angelbase:angel');
INSERT INTO `skillsheet_ships` VALUES ('17740', '27', 'Vindicator', '8', '500020', '1', '2157', 'gb2_t1:serpentis:gallente');
INSERT INTO `skillsheet_ships` VALUES ('17812', '25', 'Republic Fleet Firetail', '4', '500002', '1', '2635', 'mf8_t1:minmatarnavy:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('17841', '25', 'Gallente Navy Comet', '4', '500004', '1', '2634', 'gf8_t1:gallentenavy:gallente');
INSERT INTO `skillsheet_ships` VALUES ('17843', '26', 'Vexor Navy Issue', '4', '500004', '1', '1803', 'gc3_t1:gallentenavy:gallente');
INSERT INTO `skillsheet_ships` VALUES ('17918', '27', 'Rattlesnake', '8', '500010', '1', '2159', 'cb2_t1:guristas:caldari');
INSERT INTO `skillsheet_ships` VALUES ('17920', '27', 'Bhaalgorn', '8', '500012', '1', '2122', 'ab2_t1:bloodraider:amarr');
INSERT INTO `skillsheet_ships` VALUES ('17922', '26', 'Ashimmu', '8', '500012', '1', '2636', 'ac6_t1:bloodraider:amarr');
INSERT INTO `skillsheet_ships` VALUES ('17924', '25', 'Succubus', '8', '500019', '1', '1237', 'sf1_t1:sanshabase:sansha');
INSERT INTO `skillsheet_ships` VALUES ('17926', '25', 'Cruor', '8', '500012', '1', '2632', 'af8_t1:bloodraider:amarr');
INSERT INTO `skillsheet_ships` VALUES ('17928', '25', 'Daredevil', '8', '500020', '1', '339', 'angf2_t1:serpentis:gallente');
INSERT INTO `skillsheet_ships` VALUES ('17930', '25', 'Worm', '8', '500010', '1', '1831', 'cf7_t1:guristas:caldari');
INSERT INTO `skillsheet_ships` VALUES ('17932', '25', 'Dramiel', '8', '500011', '1', '338', 'angf1_t1:angelbase:angel');
INSERT INTO `skillsheet_ships` VALUES ('19720', '485', 'Revelation', '1', '500003', '1', '2743', 'adn1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('19722', '485', 'Naglfar', '1', '500002', '1', '2755', 'mdn1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('19724', '485', 'Moros', '1', '500004', '1', '2744', 'gdn1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('19726', '485', 'Phoenix', '1', '500001', '1', '2786', 'cdn1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('19744', '28', 'Sigil', '1', '500003', '1', '2715', 'ai2_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('20125', '833', 'Curse', '2', '500003', '1', '1854', 'ac1_t2a:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('20183', '513', 'Providence', '1', '500003', '1', '2738', 'afr1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('20185', '513', 'Charon', '1', '500001', '1', '2740', 'cfr1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('20187', '513', 'Obelisk', '1', '500004', '1', '2739', 'gfr1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('20189', '513', 'Fenrir', '1', '500002', '1', '2737', 'mfr1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('22428', '898', 'Redeemer', '2', '500003', '1', '3356', 'ab2_t2:ardishapur:amarr');
INSERT INTO `skillsheet_ships` VALUES ('22430', '898', 'Sin', '2', '500004', '1', '3350', 'gb1_t2:creodron:gallente');
INSERT INTO `skillsheet_ships` VALUES ('22436', '898', 'Widow', '2', '500001', '1', '3349', 'cb2_t2:kaalakiota:caldari');
INSERT INTO `skillsheet_ships` VALUES ('22440', '898', 'Panther', '2', '500002', '1', '3355', 'mb1_t2b:thukker:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('22442', '540', 'Eos', '2', '500004', '1', '2925', 'gbc2_t2:creodron:gallente');
INSERT INTO `skillsheet_ships` VALUES ('22444', '540', 'Sleipnir', '2', '500002', '1', '2912', 'mbc2_t2:brutor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('22446', '540', 'Vulture', '2', '500001', '1', '2807', 'cbc1_t2b:ishukone:caldari');
INSERT INTO `skillsheet_ships` VALUES ('22448', '540', 'Absolution', '2', '500003', '1', '2926', 'abc2_t2:sarum:amarr');
INSERT INTO `skillsheet_ships` VALUES ('22452', '541', 'Heretic', '2', '500003', '1', '2805', 'ade1_t2:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('22456', '541', 'Sabre', '2', '500002', '1', '2814', 'mde1_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('22460', '541', 'Eris', '2', '500004', '1', '2811', 'gde1_t2:roden:gallente');
INSERT INTO `skillsheet_ships` VALUES ('22464', '541', 'Flycatcher', '2', '500001', '1', '2802', 'cde1_t2:kaalakiota:caldari');
INSERT INTO `skillsheet_ships` VALUES ('22466', '540', 'Astarte', '2', '500004', '1', '2798', 'gbc1_t2a:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('22468', '540', 'Claymore', '2', '500002', '1', '2794', 'mbc1_t2c:sebiestor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('22470', '540', 'Nighthawk', '2', '500001', '1', '2801', 'cbc2_t2:kaalakiota:caldari');
INSERT INTO `skillsheet_ships` VALUES ('22474', '540', 'Damnation', '2', '500003', '1', '2804', 'abc1_t2a:khanid:amarr');
INSERT INTO `skillsheet_ships` VALUES ('22544', '543', 'Hulk', '2', '500014', '1', '2938', 'oreba3_t2:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('22546', '543', 'Skiff', '2', '500014', '1', '2940', 'oreba1_t2:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('22548', '543', 'Mackinaw', '2', '500014', '1', '2939', 'oreba2_t2:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('22852', '659', 'Hel', '1', '500002', '1', '2894', 'mca1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('23757', '547', 'Archon', '1', '500003', '1', '2905', 'aca2_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('23773', '30', 'Ragnarok', '1', '500002', '1', '2906', 'mt1_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('23911', '547', 'Thanatos', '1', '500004', '1', '2932', 'gca2_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('23913', '659', 'Nyx', '1', '500004', '1', '2909', 'gca1_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('23915', '547', 'Chimera', '1', '500001', '1', '2931', 'cca1_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('23917', '659', 'Wyvern', '1', '500001', '1', '2928', 'cca2_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('23919', '659', 'Aeon', '1', '500003', '1', '2911', 'aca1_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('24483', '547', 'Nidhoggur', '1', '500002', '1', '2929', 'mca2_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('24688', '27', 'Rokh', '1', '500001', '1', '3170', 'cb3_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('24690', '27', 'Hyperion', '1', '500004', '1', '3207', 'gb3_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('24692', '27', 'Abaddon', '1', '500003', '1', '3132', 'ab3_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('24694', '27', 'Maelstrom', '1', '500002', '1', '3134', 'mb3_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('24696', '419', 'Harbinger', '1', '500003', '1', '3133', 'abc2_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('24698', '419', 'Drake', '1', '500001', '1', '3169', 'cbc2_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('24700', '419', 'Myrmidon', '1', '500004', '1', '3168', 'gbc2_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('24702', '419', 'Hurricane', '1', '500002', '1', '3135', 'mbc2_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('26840', '27', 'Raven State Issue', '4', '500001', '1', '3204', 'cb1_t1:state:caldari');
INSERT INTO `skillsheet_ships` VALUES ('26842', '27', 'Tempest Tribal Issue', '4', '500002', '1', '3205', 'mb2_t1:justice:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('28352', '941', 'Rorqual', '1', '500014', '1', '3331', 'orecs1_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('28606', '941', 'Orca', '1', '500014', '1', '3466', 'orefr1_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('28659', '900', 'Paladin', '2', '500003', '1', '3351', 'ab1_t2:sarum:amarr');
INSERT INTO `skillsheet_ships` VALUES ('28661', '900', 'Kronos', '2', '500004', '1', '3353', 'gb2_t2:duvolle:gallente');
INSERT INTO `skillsheet_ships` VALUES ('28665', '900', 'Vargur', '2', '500002', '1', '3354', 'mb2_t2:brutor:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('28710', '900', 'Golem', '2', '500001', '1', '3352', 'cb1_t2:laidai:caldari');
INSERT INTO `skillsheet_ships` VALUES ('28844', '902', 'Rhea', '2', '500001', '1', '20277', 'cfr1_t2:ishukone:caldari');
INSERT INTO `skillsheet_ships` VALUES ('28846', '902', 'Nomad', '2', '500002', '1', '3360', 'mfr1_t2:thukker:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('28848', '902', 'Anshar', '2', '500004', '1', '3359', 'gfr1_t2:creodron:gallente');
INSERT INTO `skillsheet_ships` VALUES ('28850', '902', 'Ark', '2', '500003', '1', '3357', 'afr1_t2:sarum:amarr');
INSERT INTO `skillsheet_ships` VALUES ('29248', '25', 'Magnate', '1', '500003', '1', '3367', 'af7_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('29336', '26', 'Scythe Fleet Issue', '4', '500002', '1', '1887', 'mc4_t1:minmatarnavy:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('29337', '26', 'Augoror Navy Issue', '4', '500003', '1', '1730', 'ac3_t1:amarrnavy:amarr');
INSERT INTO `skillsheet_ships` VALUES ('29340', '26', 'Osprey Navy Issue', '4', '500001', '1', '1784', 'cc1_t1:caldarinavy:caldari');
INSERT INTO `skillsheet_ships` VALUES ('29344', '26', 'Exequror Navy Issue', '4', '500004', '1', '1802', 'gc2_t1:gallentenavy:gallente');
INSERT INTO `skillsheet_ships` VALUES ('29984', '963', 'Tengu', '3', '500001', '1', '3601', 'res:/dx9/model/ship/Caldari/strategiccruiser/csc1/csc1_t3.red');
INSERT INTO `skillsheet_ships` VALUES ('29986', '963', 'Legion', '3', '500003', '1', '3626', 'res:/dx9/Model/Ship/Amarr/StrategicCruiser/ASC1/ASC1_T3.red');
INSERT INTO `skillsheet_ships` VALUES ('29988', '963', 'Proteus', '3', '500004', '1', '3651', 'res:/dx9/model/ship/Gallente/StrategicCruiser/gsc1/gsc1_T3.red');
INSERT INTO `skillsheet_ships` VALUES ('29990', '963', 'Loki', '3', '500002', '1', '3676', 'res:/dx9/model/ship/Minmatar/StrategicCruiser/msc1/msc1_T3.red');
INSERT INTO `skillsheet_ships` VALUES ('32305', '27', 'Armageddon Navy Issue', '4', '500003', '1', '3814', 'ab2_t1:amarrnavy:amarr');
INSERT INTO `skillsheet_ships` VALUES ('32307', '27', 'Dominix Navy Issue', '4', '500004', '1', '2138', 'gb1_t1:gallentenavy:gallente');
INSERT INTO `skillsheet_ships` VALUES ('32309', '27', 'Scorpion Navy Issue', '4', '500001', '1', '3815', 'cb2_t1:caldarinavy:caldari');
INSERT INTO `skillsheet_ships` VALUES ('32311', '27', 'Typhoon Fleet Issue', '4', '500002', '1', '2160', 'mb1_t1:minmatarnavy:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('2998', '28', 'Noctis', '1', '500014', '1', '3815', 'oreb1_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('2834', '324', 'Utu', '2', '500004', '1', '10005', 'gf4_viii:tournament-viii:gallente');
INSERT INTO `skillsheet_ships` VALUES ('32207', '324', 'Freki', '2', '500002', '1', '3799', 'mf4_vii:tournament-vii:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('2836', '358', 'Adrestia', '2', '500004', '1', '10006', 'gc4_viii:tournament-viii:gallente');
INSERT INTO `skillsheet_ships` VALUES ('32209', '358', 'Mimir', '2', '500002', '1', '3800', 'mc2_vii:tournament-vii:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('3514', '659', 'Revenant', '8', '500019', '1', '10038', 'sca1_t1:sanshabase:sansha');
INSERT INTO `skillsheet_ships` VALUES ('3516', '324', 'Malice', '2', '500003', '1', '10950', 'af3_ix:tournament-ix:amarr');
INSERT INTO `skillsheet_ships` VALUES ('3518', '358', 'Vangel', '2', '500003', '1', '10951', 'ac2_ix:tournament-ix:amarr');
INSERT INTO `skillsheet_ships` VALUES ('4302', '419', 'Oracle', '1', '500003', '1', '11775', 'abc3_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('4306', '419', 'Naga', '1', '500001', '1', '11776', 'cbc3_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('4308', '419', 'Talos', '1', '500004', '1', '11777', 'gbc3_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('4310', '419', 'Tornado', '1', '500002', '1', '11778', 'mbc3_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('32788', '324', 'Cambion', '2', '500001', '1', '20136', 'cf7_x:tournament-x:caldari');
INSERT INTO `skillsheet_ships` VALUES ('32790', '832', 'Etana', '2', '500001', '1', '20137', 'cc1_x:tournament-x:caldari');
INSERT INTO `skillsheet_ships` VALUES ('32880', '1283', 'Venture', '1', '500014', '1', '20198', 'oref1_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('32878', '420', 'Talwar', '1', '500002', '1', '20202', 'mde2_t1:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('32872', '420', 'Algos', '1', '500004', '1', '20201', 'gde2_t1:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('32876', '420', 'Corax', '1', '500001', '1', '20200', 'cde2_t1:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('32874', '420', 'Dragoon', '1', '500003', '1', '20199', 'ade2_t1:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('33153', '419', 'Drake navy Issue', '4', '500001', '1', '20283', 'cbc2_t1:caldarinavy:caldari');
INSERT INTO `skillsheet_ships` VALUES ('33155', '419', 'Harbinger Navy Issue', '4', '500003', '1', '20227', 'abc2_t1:amarrnavy:amarr');
INSERT INTO `skillsheet_ships` VALUES ('33151', '419', 'Brutix Navy Issue', '4', '500004', '1', '20229', 'gbc1_t1:gallentenavy:gallente');
INSERT INTO `skillsheet_ships` VALUES ('33157', '419', 'Hurricane Fleet Issue', '4', '500002', '1', '20230', 'mbc2_t1:minmatarnavy:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('33468', '25', 'Astero', '4', '500016', '1', '20386', 'soef1_t1:soebase:soe');
INSERT INTO `skillsheet_ships` VALUES ('33470', '26', 'Stratios', '4', '500016', '1', '20385', 'soec1_t1:soebase:soe');
INSERT INTO `skillsheet_ships` VALUES ('33472', '27', 'Nestor', '4', '500016', '1', '20384', 'soeb1_t1:soebase:soe');
INSERT INTO `skillsheet_ships` VALUES ('33697', '1283', 'Prospect', '2', '500014', '1', '20600', 'oref1_t2b:development:ore');
INSERT INTO `skillsheet_ships` VALUES ('33820', '27', 'Barghest', '4', '500018', '1', '20615', 'morb1_t1:mordubase:mordu');
INSERT INTO `skillsheet_ships` VALUES ('33816', '25', 'Garmur', '4', '500018', '1', '20616', 'morf1_t1:mordubase:mordu');
INSERT INTO `skillsheet_ships` VALUES ('33818', '26', 'Orthrus', '4', '500018', '1', '20614', 'morc1_t1:mordubase:mordu');
INSERT INTO `skillsheet_ships` VALUES ('34328', '513', 'Bowhead', '1', '500014', '1', '20977', 'orecs2_t1:orebase:ore');
INSERT INTO `skillsheet_ships` VALUES ('34317', '1305', 'Confessor', '3', '500003', '1', '20980', 'ade3_t3:amarrbase:amarr');
INSERT INTO `skillsheet_ships` VALUES ('34562', '1305', 'Svipul', '3', '500002', '1', '21052', 'mde3_t3:minmatarbase:minmatar');
INSERT INTO `skillsheet_ships` VALUES ('34828', '1305', 'Jackdaw', '3', '500001', '1', '21135', 'cde3_t3:caldaribase:caldari');
INSERT INTO `skillsheet_ships` VALUES ('35683', '1305', 'Hecate', '3', '500004', '1', '21150', 'gde3_t3:gallentebase:gallente');
INSERT INTO `skillsheet_ships` VALUES ('33397', '830', 'Chremoas', '4', '500011', '1', '20344', 'angf1_xi:tournament-xi:angel');
INSERT INTO `skillsheet_ships` VALUES ('33395', '833', 'Moracha', '4', '500011', '1', '20345', 'angc1_xi:tournament-xi:angel');
INSERT INTO `skillsheet_ships` VALUES ('33673', '831', 'Whiptail', '4', '500010', '1', '20605', 'cf2_xii:tournament-xii:caldari');
INSERT INTO `skillsheet_ships` VALUES ('33675', '833', 'Chameleon', '4', '500010', '1', '20604', 'cc2_xii:tournament-xii:caldari');
INSERT INTO `skillsheet_ships` VALUES ('35779', '831', 'Imp', '4', '500019', '1', '21156', 'sf2_xiii:tournament-xiii:sansha');
INSERT INTO `skillsheet_ships` VALUES ('35781', '894', 'Fiend', '4', '500019', '1', '21155', 'sc1_xiii:tournament-xiii:sansha');
