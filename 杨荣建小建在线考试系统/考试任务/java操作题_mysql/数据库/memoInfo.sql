/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : mymemodb

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-05-31 06:34:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `memoinfo`
-- ----------------------------
DROP TABLE IF EXISTS `memoinfo`;
CREATE TABLE `memoinfo` (
  `memoId` int(4) NOT NULL AUTO_INCREMENT,
  `memoTitle` varchar(20) DEFAULT NULL,
  `memoContent` varchar(20) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `userId` int(4) DEFAULT NULL,
  PRIMARY KEY (`memoId`),
  KEY `userid` (`userId`),
  CONSTRAINT `userid` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of memoinfo
-- ----------------------------
INSERT INTO `memoinfo` VALUES ('1', '出行', null, '2009-03-12 00:00:00', '2009-04-01 00:00:00', '1');
INSERT INTO `memoinfo` VALUES ('2', '打扫', null, '2010-03-12 00:00:00', '2010-04-01 00:00:00', '1');
INSERT INTO `memoinfo` VALUES ('3', '看电影', null, '2009-04-12 00:00:00', '2009-05-01 00:00:00', '1');
INSERT INTO `memoinfo` VALUES ('4', '聚会', null, '2009-12-11 00:00:00', '2009-01-01 00:00:00', '1');
INSERT INTO `memoinfo` VALUES ('5', '陪家人', null, '2010-02-12 00:00:00', '2010-02-12 00:00:00', '1');
