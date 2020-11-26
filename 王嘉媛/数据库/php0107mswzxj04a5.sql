/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50146
Source Host           : localhost:3306
Source Database       : php0107mswzxj04a5

Target Server Type    : MYSQL
Target Server Version : 50146
File Encoding         : 65001

Date: 2017-04-13 14:48:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `allusers`
-- ----------------------------
DROP TABLE IF EXISTS `allusers`;
CREATE TABLE `allusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `cx` varchar(50) DEFAULT '普通管理员',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of allusers
-- ----------------------------
INSERT INTO `allusers` VALUES ('2', 'hsg', 'hsg', '超级管理员', '2016-03-25 07:46:56');

-- ----------------------------
-- Table structure for `dingdan`
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dingdanhao` varchar(50) DEFAULT NULL,
  `jine` varchar(50) DEFAULT NULL,
  `dingdanneirong` varchar(500) DEFAULT NULL,
  `yonghuming` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `youjidizhi` varchar(300) DEFAULT NULL,
  `youbian` varchar(50) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `kuaidileixing` varchar(50) DEFAULT NULL,
  `kuaidifeiyong` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `issh` varchar(255) DEFAULT '否',
  `iszf` varchar(2) DEFAULT '否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('1', '14912055509167', '84', '美食编号：14912039881591，件数：2;\r\n美食编号：14912040209648，件数：1;\r\n', '555', '何升高', '浙江', '325000', '13888888888', '邮政EMS15', '15', '2017-04-03 15:46:03', '否', '是');
INSERT INTO `dingdan` VALUES ('2', '14912057278155', '81', '美食编号：14912040209648，件数：2;\r\n美食编号：14912039693018，件数：1;\r\n', '555', '何升高', '浙江温州XXX', '325000', '13888888888', '快递送货10', '10', '2017-04-03 15:49:00', '是', '是');

-- ----------------------------
-- Table structure for `dx`
-- ----------------------------
DROP TABLE IF EXISTS `dx`;
CREATE TABLE `dx` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `leibie` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dx
-- ----------------------------
INSERT INTO `dx` VALUES ('1', '系统简介', '<p>\r\n	sdgsdgsdgsd此处adfaf您自己修改afdfasdf\r\n</p>', '2017-04-03 15:52:07');
INSERT INTO `dx` VALUES ('2', '系统公告', '<p>\r\n	欢迎大家登陆我站，我站主要是为广大朋友精心制作的一个系统，希望大家能够在我站获得一个好心情，谢谢！\r\n</p>\r\n<p>\r\n	自强不息，海纳百川，努力学习！afdaf\r\n</p>', '2017-04-03 15:52:13');
INSERT INTO `dx` VALUES ('3', '中心介绍', '<p>\r\n	中心介绍 &nbsp;介绍内容请您自己在后台设置即可\r\n</p>\r\n<p>\r\n	<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span>\r\n</p>\r\n<p>\r\n	<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span>\r\n</p>\r\n<p>\r\n	<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span></span>\r\n</p>\r\n<p>\r\n	<span><span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可<span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span></span></span></span></span>\r\n</p>\r\n<p>\r\n	<span><span><span><span><span>中心介绍 &nbsp;介绍内容请您自己在后台设置即可</span></span></span></span></span>\r\n</p>', '2016-02-19 07:46:56');
INSERT INTO `dx` VALUES ('4', '教学团队', '<table border=\"0\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p class=\"STYLE23\">\r\n					<strong>课程负责人 </strong>\r\n				</p>\r\n			</td>\r\n			<td>\r\n				&nbsp;\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">袁智敏</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE50\">副教授</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<img src=\"http://www.hunche0577.com/shiziduiwu/04.jpg\" width=\"200\" height=\"140\" />\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				男，汉族，（1954---），研究生学历，副教授。1982年7月毕业于杭州大学外语系，获文学士学位。2000-2001年浙江大学英语语言文学研究生班结业。2003-2005 年浙江大学高等教育研究生班结业。现为浙江旅游职业学院 学院首批学科带头人，“旅游英语”专业指导委员会副主任。主要从事应用语言学和特殊用途英语研究与英语导游、出境游领队、饭店英语教学工作。学术兼职有浙江省外文学会理事，浙江省大学生科技竞赛高职高专英语口语竞赛委员会成员，浙江省导游、出境游领队资深考评员。已发表学术论文数十篇；主编《领队英语》、《旅游英语》、《星级饭店英语》等专业教材5本；主持省级课题3项、院级课题3项。具有丰富的旅游教学与实践经验，为省内外行业知名“双师型”教师。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				&nbsp;\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE23\">主讲老师</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">王纯</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE52\">副译审</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<img src=\"http://www.hunche0577.com/shiziduiwu/02.jpg\" width=\"200\" height=\"142\" />\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				男，汉族（1955年―），本科学历，副译审。现为浙江职业学院外语系教师，1982年2月毕业于杭州大学外语系，获文学士学位，任浙江省海外旅游公司英语部经理。1995年评为副译审；1996年获得国家级高级英语导游员资格。自1988年起先后被浙江省及杭州市旅游局聘任为国家级导游（英语、法语、普通话）资格培训师及考评员；浙江省旅游局出国领队资格培训师及考评员；浙江省中级导游员资格考评委员会委员；浙江省专业技术人员中级职称评审委员会委员。在外事活动中多次担任省市主要领导及省旅游局领导的英语口译。2004年调入浙江旅游职业学院担任专业英语课程老师。2007年被评为学院优秀教师，获2007年奖教基金。现任浙江旅游职业学院“导游专业”及“旅游英语”专业指导委员会委员。曾多次担任省市导游大赛评委，为省内外行业知名“双师型”教师。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE38\"></span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">王 君</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE52\">副教授</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE38\"><img src=\"http://www.hunche0577.com/shiziduiwu/worker01.jpg\" width=\"200\" height=\"150\" /></span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				女，（1964---）硕士，教授 。1986年毕业于西安外国语大学英语专业，获文学学士学位。2006年10月获浙江大学硕士学位。学院第二批学科带头人，“旅游英语”专业指导委员会委员。主要讲授旅游英语和饭店英语等课程，主编《景区景点实用英语》、高职高专《大学英语》等12部专业教材，主持省旅游局和省教育厅课题2项,主持、参与院级课题3项。已发表《中国审美情趣与旅游》、《旅游英语专业人才培养模式和课程结构的理论与实践研究》等论文20余篇。多次担任各项英语比赛的策划与评委，被浙江省旅游局聘任为出国领队资格考评员，并邀为省内多家知名旅行社和饭店进行专业英语培训。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<span class=\"STYLE38\"></span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span class=\"STYLE47\">余益辉</span>\r\n			</td>\r\n			<td>\r\n				<span class=\"STYLE52\">讲师</span>\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<img src=\"http://www.hunche0577.com/shiziduiwu/worker02.jpg\" width=\"200\" height=\"135\" />\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				男，（1965――），讲师，中级导游。本科学历。1984年-1988年就读于北京外国语学院英语系，获文学士学位。1988年-2003年在浙江省中国国际旅行社英语中心从事涉外旅游接待与销售工作，多次受到领导、同事和英美旅游者的好评，为浙江省知名英语导游。2003年7月调入浙江旅游职业学院外语系任教。主要从事旅游英语，出境领队英语教学，擅长导游实践教学。 著有论文《浙江省佛教文化旅游市场研究》等数篇，参编教材2本。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				&nbsp;\r\n			</td>\r\n			<td class=\"STYLE49\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2016-02-19 07:46:56');
INSERT INTO `dx` VALUES ('5', '联系我们', '&nbsp; &nbsp;欢迎来到xxxxx有限公司<br />\r\n<br />\r\n在您对于我们公司产品购买过程中有任何问题可以通过如下方式和我们进行沟通协商：<br />\r\n<br />\r\n1. 电子邮箱： xxxxx@gmail.com<br />\r\n<br />\r\n2. QQ号码： &nbsp;xxxxxx<br />\r\n<br />\r\n3. 电 &nbsp; &nbsp; 话： &nbsp;020-xxxxx （产品售前咨询、报价）<br />\r\n<br />\r\n020-xxxxxxxxx-815<br />\r\n<br />\r\n4. 传 &nbsp; &nbsp; &nbsp;真： 020-xxxxxx-805<br />\r\n<div>\r\n	<br />\r\n</div>', '2016-02-19 18:20:22');

-- ----------------------------
-- Table structure for `goumaijilu`
-- ----------------------------
DROP TABLE IF EXISTS `goumaijilu`;
CREATE TABLE `goumaijilu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meishibianhao` varchar(50) DEFAULT NULL,
  `meishimingcheng` varchar(50) DEFAULT NULL,
  `meishileibie` varchar(50) DEFAULT NULL,
  `jiage` varchar(50) DEFAULT NULL,
  `goumaishuliang` varchar(50) DEFAULT NULL,
  `jine` varchar(50) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  `goumairen` varchar(50) DEFAULT NULL,
  `issh` varchar(10) DEFAULT '否',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of goumaijilu
-- ----------------------------
INSERT INTO `goumaijilu` VALUES ('2', '14912039881591', 'gegwewg', '类别A', '28', '2', '56', 'afdaf', 'hsg', '否', '2017-04-03 15:27:14');
INSERT INTO `goumaijilu` VALUES ('3', '14912039881591', 'gegwewg', '类别A', '28', '2', '56', '', '555', '是', '2017-04-03 15:40:46');
INSERT INTO `goumaijilu` VALUES ('4', '14912040209648', 'wyehddhdhd', '类别A', '28', '1', '28', '', '555', '是', '2017-04-03 15:45:43');
INSERT INTO `goumaijilu` VALUES ('5', '14912040209648', 'wyehddhdhd', '类别A', '28', '2', '56', '', '555', '是', '2017-04-03 15:47:40');
INSERT INTO `goumaijilu` VALUES ('6', '14912039693018', 'wrefadf', '类别B', '25', '1', '25', '', '555', '是', '2017-04-03 15:47:56');

-- ----------------------------
-- Table structure for `liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) DEFAULT NULL,
  `zhaopian` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `liuyan` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `huifu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of liuyanban
-- ----------------------------
INSERT INTO `liuyanban` VALUES ('1', '555', 'uploadfile/13392103902z4y.jpg', '何升高', 'afdadf', '2017-04-03 15:49:55', 'afdafd');

-- ----------------------------
-- Table structure for `meishileibie`
-- ----------------------------
DROP TABLE IF EXISTS `meishileibie`;
CREATE TABLE `meishileibie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meishileibie` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of meishileibie
-- ----------------------------
INSERT INTO `meishileibie` VALUES ('2', '类别A', '2017-04-03 15:17:46');
INSERT INTO `meishileibie` VALUES ('3', '类别B', '2017-04-03 15:17:50');
INSERT INTO `meishileibie` VALUES ('4', '类别C', '2017-04-03 15:50:47');

-- ----------------------------
-- Table structure for `meishixinxi`
-- ----------------------------
DROP TABLE IF EXISTS `meishixinxi`;
CREATE TABLE `meishixinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meishibianhao` varchar(50) DEFAULT NULL,
  `meishimingcheng` varchar(50) DEFAULT NULL,
  `meishileibie` varchar(50) DEFAULT NULL,
  `zhutu` varchar(50) DEFAULT NULL,
  `xiangqingmiaoshu` text,
  `jiage` varchar(50) DEFAULT NULL,
  `pingfen` varchar(50) DEFAULT NULL,
  `faburen` varchar(50) DEFAULT NULL,
  `issh` varchar(10) DEFAULT '否',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of meishixinxi
-- ----------------------------
INSERT INTO `meishixinxi` VALUES ('2', '14912038745118', 'fafdafd', '类别B', 'uploadfile/1491203945fk2i.jpg', '<img src=\"uploadfile/1491203945fk2i.jpg\" alt=\"\" />', '25', '0', 'hsg', '是', '2017-04-03 15:19:28');
INSERT INTO `meishixinxi` VALUES ('3', '14912039693018', 'wrefadf', '类别B', 'uploadfile/14912039820i8g.jpg', '<img src=\"uploadfile/1491203945fk2i.jpg\" alt=\"\" />', '25', '5', 'hsg', '是', '2017-04-03 15:19:47');
INSERT INTO `meishixinxi` VALUES ('4', '14912039881591', 'gegwewg', '类别A', 'uploadfile/1491204001j14q.jpg', '<img src=\"uploadfile/1491204001j14q.jpg\" alt=\"\" />', '28', '0', 'hsg', '是', '2017-04-03 15:20:19');
INSERT INTO `meishixinxi` VALUES ('5', '14912040209648', 'wyehddhdhd', '类别A', 'uploadfile/149120403115qc.jpg', '<img src=\"uploadfile/149120403115qc.jpg\" alt=\"\" />', '28', '5', 'hsg', '是', '2017-04-03 15:20:40');
INSERT INTO `meishixinxi` VALUES ('6', '14912058521742', 'adffadfa', '类别C', 'uploadfile/1491205869qawx.jpg', '<img src=\"uploadfile/1491205869qawx.jpg\" alt=\"\" />', '5', '0', 'hsg', '是', '2017-04-03 15:51:20');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `wenzhangID` varchar(255) CHARACTER SET gb2312 DEFAULT NULL,
  `pinglunneirong` varchar(1000) CHARACTER SET gb2312 DEFAULT NULL,
  `pinglunren` varchar(255) CHARACTER SET gb2312 DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `biao` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  `pingfen` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', '3', 'fdafd', 'hsg', '2017-04-03 15:25:04', 'meishixinxi', '5');
INSERT INTO `pinglun` VALUES ('2', '5', 'adfafd', '555', '2017-04-03 15:47:29', 'meishixinxi', '5');

-- ----------------------------
-- Table structure for `shoucangjilu`
-- ----------------------------
DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE `shoucangjilu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET gb2312 DEFAULT NULL,
  `xwid` varchar(255) CHARACTER SET gb2312 DEFAULT NULL,
  `biao` varchar(100) CHARACTER SET gb2312 DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ziduan` varchar(255) CHARACTER SET gb2312 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoucangjilu
-- ----------------------------
INSERT INTO `shoucangjilu` VALUES ('1', 'hsg', '3', 'meishixinxi', '2017-04-03 15:24:37', 'meishimingcheng');
INSERT INTO `shoucangjilu` VALUES ('2', '555', '5', 'meishixinxi', '2017-04-03 15:47:33', 'meishimingcheng');

-- ----------------------------
-- Table structure for `xinwentongzhi`
-- ----------------------------
DROP TABLE IF EXISTS `xinwentongzhi`;
CREATE TABLE `xinwentongzhi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(500) CHARACTER SET gb2312 DEFAULT NULL,
  `leibie` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  `neirong` text CHARACTER SET gb2312,
  `tianjiaren` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shouyetupian` varchar(50) DEFAULT NULL,
  `dianjilv` int(11) DEFAULT '1',
  `zhaiyao` varchar(800) CHARACTER SET gb2312 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of xinwentongzhi
-- ----------------------------
INSERT INTO `xinwentongzhi` VALUES ('1', '赴英留学中国学生人数再创新高 较去年增幅达20%', '美食资讯', '&nbsp; 　近日，英国高等教育数据统计局最近公布的数据显示，2009-2010学年在英国高等教育院校学习的中国大陆学生人数已达60705人，较前一年相比全线上升，增幅高达20%。该数据也刷新了于2004年-2005年创下的最高纪录。<BR><BR>　　英国大使馆文化教育处的教育推广总监吴媛媛女士表示，这样高增长的学生流动恰恰印证了高等教育国际化持续发展的趋势。根据英国高等教育数据统计局的最新数据，中国是英国最大的留学生生源国，而在英国的中国及印度学生人数总和已经相当于非欧盟学生的三分之一。', 'hsg', '2017-04-03 15:28:39', 'uploadfile/1340069838pb96.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('2', '刘延东在沪会见美国纽约大学校长一行', '美食资讯', '　&nbsp; 新华网上海３月２９日电（记者厉正宏）国务委员刘延东３月２９日在上海会见了美国纽约大学校长约翰?塞克斯通一行。 \r\n<P>　　刘延东积极评价纽约大学与中国高等院校的交流合作，对塞克斯通校长致力于推动中美教育领域友好关系表示肯定。刘延东向客人介绍了“十二五”规划、国家中长期教育改革和发展规划纲要以及中美人文交流高层磋商机制的情况，鼓励纽约大学继续深化与中国教育界的合作，与华东师范大学等中方单位一起，把上海纽约大学建好办好，促进两国人文交流特别是青年学生的交流，为推动中美关系长期健康稳定发展做出应有的贡献。</P>\r\n<P>　　上海纽约大学是教育规划纲要颁布之后教育部批准成立的第一所中外合作办学的大学。</P>\r\n<META name=ContentEnd>', 'hsg', '2017-04-03 15:28:39', 'uploadfile/13400699440gw0.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('3', '大力支持留学人员回国创业', '美食资讯', '　&nbsp; 中国教育报北京3月30日电（记者 刘声）人力资源和社会保障部今天公布，经中央人才工作协调小组同意，中组部、人社部联合下发《关于支持留学人员回国创业的意见》（以下简称《意见》），这是第一次从国家层面对支持留学人员回国创业的各方面政策作出规定。至此，我国回国工作、为国服务和回国创业三位一体的留学回国工作政策体系初步形成。 \r\n<P>　　《意见》指出，留学人员是我国人才资源的重要组成部分。近年来，回国创业逐渐成为留学人员报效祖国、服务国家经济社会发展的重要方式。留学人员回国创业是指海外留学人员以专利、科研成果、专有技术等回国创办企业。留学人员企业一般要由留学人员担任企业法人代表，或者留学人员自有资金（含技术入股）及海内外跟进的风险投资占企业总投资的30%以上。</P>\r\n<P>　　据悉，《意见》分别从创业启动支持计划、创业投资引导基金、创业贷款、税收优惠、租金减免、土地优惠、政府采购等方面对留学人员回国创业给予政策优惠；从户口办理、社会保险、职称评审、计划生育、子女入学、配偶就业等方面积极为留学人员回国创业营造良好环境，并从搭建信息平台、交流平台、投资服务平台和技术产权服务平台等方面为留学人员回国创业提供支持和帮助。</P>\r\n<P>　　据统计，目前全国已建成各级各类留学人员创业园150余家，入园企业超过8000家，两万余名留学人员在园内创业，有效带动了科技创新和产业结构调整，有力推动了经济发展。</P>\r\n<META name=ContentEnd>', 'hsg', '2017-04-03 15:28:39', 'uploadfile/1340069970gp0a.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('4', '2010温州炎亭海鲜美食文化节开幕', '美食资讯', '<P>&nbsp;&nbsp;&nbsp; 昨晚，炎亭金沙滩上人头攒动，热闹非凡，来自四面八方的客人齐聚炎亭共庆2010’温州炎亭海鲜美食文化节的举行。开幕式上，市旅游局为炎亭镇授予“浙江省旅游强镇”牌匾，县委常委、组织部长陈力同宣布美食文化节开幕。县领导高亚男、章月影、冯兴钱出席开幕式。</P>\r\n<P>&nbsp;&nbsp;&nbsp; 章月影在致辞时指出，苍南山海并利，滨海旅游资源丰富，海洋资源和旅游经济开发潜力大。通过多年来的不懈努力，苍南的滨海旅游和海鲜美食已有相当高的知名度，旅游经济呈现出快速、健康、可持续发展的良好态势。举办2010温州炎亭美食节，就是要以节庆为媒，以美食传情，广交各界朋友，展示苍南形象，使美食节成为苍南人民与各界朋友加深友谊、共谋发展的桥梁和纽带，把美食节办成凝聚人心、振奋精神、扩大开放、提升形象、加快发展的盛会，成为炎亭乃至苍南旅游的一张金名片，成为弘扬渔家文化的载体，更好地促进苍南滨海旅游业的可持续发展。</P><!--advertisement code begin--><!--advertisement code end-->\r\n<P>&nbsp;&nbsp;&nbsp; 开幕式还为观众奉上了精彩的文艺演出，来自“非常6+1”的赵阿光在一曲激情四溢的《怒放的生命》中闪亮登台，并分别用葫芦丝、唢呐、竖笛、萨克斯演绎了各种类型曲目，精彩的演出不时赢得现场阵阵掌声，歌舞表演《好日子》更是给现场观众送上了美好生活的祝福。</P>\r\n<P>&nbsp;&nbsp;&nbsp; 据了解，炎亭海洋资源丰富，盛产梭子蟹、黄鱼、鲳鱼、丁香、虾蛄等海产品，尤其以有“御蟹”和“中国十大名蟹”美誉的炎亭梭子蟹闻名。为大力发展滨海旅游和海鲜美食业，炎亭镇在2003、2007、2008年成功举办了三届温州炎亭海鲜美食文化节。本次美食文化节为期三天，以“御蟹之乡 美食天堂”为主题，在保留往届精彩的文艺演出、苍南民俗表演、海鲜美食和特色小吃板块的基础上，增设自行车吉尼斯挑战、沙滩排球、渔俗竞技、亲子活动、啤酒竞技等饶有趣味的表演性和互动性节目，进一步丰富了海滩旅游内涵，展现苍南绚烂多姿的渔家文化和民俗风情。（记者 方耀星&nbsp; 实习生 陈 君）<BR></P>', 'hsg', '2017-04-03 15:28:39', 'uploadfile/1340070002x47w.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('5', '盘点：15种最IN清肠排毒美食', '美食资讯', '环境污染、负面情绪和不健康的生活方式，都会引起身体新陈代谢系统的紊乱而使体内毒素堆积，这会导致记忆力减退、面色暗沉、便秘和痔疮等系统疾病想为身体做个“大扫除”，可以不用急着到医院去，到菜市场就可以找到既方便又安全的排毒方案……\r\n\r\n地瓜（图片来源：资料图）\r\n1.地瓜 \r\n地瓜所含的纤维质松软易消化，可促进肠胃蠕动，有助排便最好的吃法是烤地瓜，而且连皮一起烤、一起吃掉，味道爽口甜美。\r\n\r\n2.绿豆 \r\n绿豆具清热解毒、除湿利尿、消暑解渴的功效，多喝绿豆汤有利于排毒、消肿，不过煮的时间不宜过长，以免有机酸、维生素受到破坏而降低作用。\r\n3.燕麦 \r\n燕麦能滑肠通便，促使粪便体积变大、水分增加，配合纤维促进肠胃蠕动，发挥通便排毒的作用将蒸熟的燕麦打成汁当作饮料来喝是不错的选择，搅打时也可加入其它食材，如苹果、葡萄乾，营养又能促进排便！\r\n4.薏仁 \r\n薏仁可促进体内血液循环、水分代谢，发挥利尿消肿的效果，有助于改善水肿型肥胖薏仁水是不错的排毒方法，直接将薏仁用开水煮烂后，适个人口味添加少许的糖，是肌肤美白的天然保养品。\r\n5.小米 \r\n小米不含麸质，不会刺激肠道壁，是属于比较温和的纤维质，容易被消化，因此适合搭配排毒餐食用小米粥很适合排毒，有清热利尿的功效，营养丰富，也有助于美白。\r\n6.糙米 \r\n糙米就是全米，保留米糠，有丰富的纤维，具吸水、吸脂作用及相当的饱足感，能整肠利便，有助于排毒每天早餐一碗吃糙米粥或来一杯糙米豆浆是不错的排毒方法。\r\n\r\n7.红豆\r\n红豆可增加肠胃蠕动，减少便秘，促进排尿可在睡前将红豆用电锅炖煮浸泡一段时间，隔天将无糖的红豆汤水当开水喝，能有效促进排毒。\r\n\r\n8.胡萝卜 \r\n胡萝卜对改善便秘很有帮助，也富含β-胡萝卜素，可中和毒素新鲜的胡萝卜排毒效果比较好，因为它能清热解毒，润肠通便，打成汁再加上蜂蜜、柠檬汁，既好喝又解渴，也有利排毒。\r\n9.山药 \r\n山药可整顿消化系统，减少皮下脂肪沈积，避免肥胖，且增加免疫功能以生食排毒效果最好，可将去皮白山药和菠萝切小块，一起打成汁饮用，有健胃整肠的功能。\r\n10.牛蒡 \r\n牛蒡可促进血液循环、新陈代谢，并有调整肠道功能的效果，所含的膳食纤维可以保有水分、软化粪便，有助排毒、消除便秘可作成牛蒡茶随时饮用，长期服用\r\n\r\n11.芦笋 \r\n芦笋含多种营养素，所含的天门冬素与钾有利尿作用，能排除体内多余的水分，有利排毒绿芦荀的荀尖富含维生素A，料理可将尖端微露水面，能保存最多营养素滋味又用。\r\n12.莲藕 \r\n莲藕的利尿作用，能促进体内废物快速排出藉此净化血液莲藕冷热食用皆宜，将莲藕榨打成汁，可加一点蜂蜜调味直接饮用，也可以小火加温，加一点糖，趁温热时喝。\r\n\r\n13.白萝卜 \r\n萝卜有很好的利尿效果，所含的纤维素也可促进排便，利于减肥如果想利用萝卜来排毒，则适合生食，建议可打成汁或以凉拌、腌渍的方式来食用。\r\n14.山茼蒿 \r\n山茼蒿含丰富维生素A，可维护肝脏，有助体内毒素排出将山茼蒿和柳丁、西红柿、胡萝卜、柚子、苹果、综合坚果等蔬果一起打成精力汤饮用是不错的选择。\r\n15.地瓜叶 \r\n地瓜叶纤维质地柔细、不苦涩，容易有饱足感，又能促进胃肠蠕动、预防便秘把新鲜地瓜叶洗净后用开水烫熟捞起，与剁碎的大蒜及少许盐、油拌匀，就是一道美味爽口的蒜拌地瓜叶！', 'hsg', '2017-04-03 15:28:39', 'uploadfile/1340070029dc64.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('6', '关于对“飞龙农家乐美食店”未经消防审查验收擅自营业的处罚通知', '美食资讯', '', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('7', '古代皇宫里的九大保养美食', '美食资讯', '古代帝王居住的皇宫无疑是天下云集最多美女的地方了，在华贵的皇宫中，有专门为这些美貌嫔妃负责养生美食的人。渐渐地形成了宫廷专有的秘制养生美食。现在这些秘制的美食已经流传出来了，一起来看一下吧!<STRONG></STRONG>\r\n<P><BR>　　清宫茯苓糕</P>\r\n<P>　　原料：茯苓，莲子，芡实，山药，粳米，糯米。</P>\r\n<P>　　制法：茯苓等药各等分共为细粉，粳米、糯米另磨粉。取药粉3份，粳米粉5份，糯米粉2粉，用水和成糕，放入笼内蒸熟，做成小饼。每日早、晚各食1^2个。</P>\r\n<P>　　功效：健脾益肾，宁心安神，延年益寿。</P>\r\n<P>　　说明：此为清宫食疗秘方。茯苓，《神农本草经》列为上品，说它“久服，安魂养神，不饥延年“，是古代医家常用的益寿药。现代研究证明，茯苓主含茯苓聚糖、茯苓酸、卵磷脂、组胺酸、麦角甾醇等，具有镇静和降血糖作用。</P>\r\n<P>　　茯苓聚糖能增强人体的免疫功能，提高机体的抗病能力，并有较强的抗癌作用。莲子，《神农本草经》列为上品，说它“补中养神，益气力，除百疾，久服，轻身耐老，不饥延年“。芡实，《神农本草经》列为上品，说它主治“湿痹，腰背膝痛，补中，除暴疾，益精气，强志，令人耳目聪明，久服轻身不饥，耐老”。</P>\r\n<P><STRONG>　　集灵膏</STRONG></P>\r\n<P>　　原料：人参60g，天冬、麦冬、生地、熟地各120g，牛膝、枸杞各60g。<!-- AFP Control Code/Caption.左下竖幅--><!-- AFP Control Code End/No.--></P>\r\n<P>　　制法：人参研为细粉，余药煎煮后过滤去渣，加人蜂蜜适量，人人参粉，炼成膏。或将诸药共为粉，炼蜜为丸如梧桐子大。药膏每日2次，每次半匙，白开水冲服。药丸每日2次，每次10g，空腹白开水送下。</P>\r\n<P>　　功效：滋肾益肺，健脾养心，填精补髓，强身壮体，延龄益寿。</P>\r\n<P>　　说明：集灵膏是清康熙年间宫廷御医顾松园改进之方。由于方中药物偏于滋阴补血，所以脾虚腹泻者最好不用。 </P>\r\n<P>　　</P>\r\n<P>　　二冬膏</P>\r\n<DIV class=hzh id=hzh_woman>\r\n<STYLE type=text/css>\r\n\r\n#hzh_woman { display: none; }</STYLE>\r\n</DIV>\r\n<P>　　原料：天门冬500g，麦门冬500g，川贝面120g。 </P>\r\n<P>　　制法：加水熬成膏，加川贝面、蜜收成膏。每日早晨用4\"5茶匙、白开水冲服。 </P>\r\n<P>　　功效：此膏清心润肺，止咳化痰，滋阴降火，解渴除烦，除五脏之火，失血劳伤，元阴亏损，不可一日无此药。久服水升火降，阴与阳齐，则无病矣。 </P>\r\n<P>　　说明：方出《清太医院配方》。方中二冬均为甘寒养阴佳品。天门冬是滋补强壮、抗衰老药，《神农本草经》列为上品，长期服用“轻身益气，延年不饥“，《日华子本草》称其“润五脏，益皮肤，悦颜色，补五劳七伤“。这可能与其富含天门冬素、粘液质、甾体皂苷等成分有关。 </P>\r\n<P>　　《神农本草经》将麦门冬列为上品，称它“久服轻身不老，不饥”，《名医别录》日“强阴益精，消谷调中，保心神定肺气，安五脏，令人肥健，美颜色，有子“。本品含有多种甾体皂苷、粘液质，B-谷甾醇等，有较强的抗菌作用。方中川贝是一味很好 </P>\r\n<P><STRONG>　　太和饼</STRONG> </P>\r\n<P>　　原料：山药120g，莲子、白术、芡实、茯苓、神曲、使君子、天南星各120g，炙甘草60g。 <!-- AFP Control Code/Caption.左下竖幅--><!-- AFP Control Code End/No.--></P>\r\n<P>　　制法：上药共为细末，用老米饭干500g，蜜糖为小饼。日服1饼。 </P>\r\n<P>　　功效：健脾和胃，男女小儿脾胃虚弱最宜。 </P>\r\n<P>　　说明：方出《清太医院秘录医方》，是一首食疗保健，健脾益气方剂。方中山药、莲子、白术、芡实、茯苓均为健脾益气佳品，其中芡实兼有固涩之功，茯苓兼有利湿之效，一固一利，固正气利湿邪，颇有配伍之妙。现代研究表明茯苓(见前面)、白术、山药、莲子可提高人体的免疫功能，其中山药可降血糖、降血脂，而莲子、芡实尚有抗癌作用，可见本方养生益寿抗衰作用并非一般。 </P>\r\n<P>　　八珍膏</P>\r\n<DIV class=hzh id=hzh_woman>\r\n<STYLE type=text/css>\r\n\r\n#hzh_woman { display: none; }</STYLE>\r\n</DIV>\r\n<P>　　原料：党参60g，茯苓60g，白术30g，薏苡仁、芡实、扁豆、莲子、山药各90g，白糖240g。 </P>\r\n<P>　　制法：共研细末，同白米粉蒸糕。每服不拘多少，日进二三次，白开水送下。 </P>\r\n<P>　　功效：此方不寒不热，平和温补，扶养脾胃，男女小儿诸虚百损，服此糕，无不神效。 </P>\r\n<P>　　说明：此为食疗补虚佳方，乾隆皇帝自40岁起，便经常服用此糕。此后清代历朝皇帝妃子，包括慈禧太后，亦竞相服食。方中党参大补元气，薏米、扁豆健脾而利湿，诸药配伍药性平和，对于脾胃虚弱，心肾不足之证更为相宜。 </P>\r\n<P><STRONG>　　明目延龄丸(膏)</STRONG> </P>\r\n<P>　　原料：霜桑叶60g，菊花60g，蜂蜜适量。 </P>\r\n<P>　　制法：上药为粗粉，炼蜜为丸如绿豆大。或以水熬透，去渣，再熬成浓汁，兑蜂蜜服膏。每日2^3次，每次6g。 </P>\r\n<P>　　功效：平肝明目，清热散风，降血压。 </P>\r\n<P>　　说明：现代研究表明菊花含有挥发性精油、胆碱、菊苷等成分，能抗菌消炎，还可增强毛细血管的抵抗力，扩张冠脉、有强心降压作用。《神农本草经》把菊花列为上品，称其“久服利气血，轻身耐老延年”。此方为御医张仲元给慈禧开出的处方，此时她已71岁，说明此方对老年人非常适宜。 </P>\r\n<P><STRONG>　　玉肌散</STRONG> </P>\r\n<P>　　原料：白芷、滑石、白附子各6g，绿豆粉120g。 </P>\r\n<P>　　制法：共研极细末，每次少量洗面，或兑人人乳用之，其效甚速。 <!-- AFP Control Code/Caption.左下竖幅--><!-- AFP Control Code End/No.--></P>\r\n<P>　　功效：此散专治面部粗涩不润，黑暗无光，雀斑污子。常洗能润肌肤，悦颜色，光洁如玉，面如凝脂。 </P>\r\n<P>　　说明：方出《太医院秘藏膏丸散方剂》。白芷气味芳香，能滋润肌肤，使它变得白嫩，面色红润，可用来做化妆品，所以宫中常作为美容药使用。现代科学证实白芷含有芳香性挥发油，外用可使局部血管扩张，改善血液循环，从而促进皮肤色素吸收并滋润皮肤。 </P>\r\n<P>　　《本草纲目》载：“白附子主面上百病，治面黑干黑曾瘢疵。“药理研究表明，本品对皮肤有刺激作用，能使表皮剥脱，从而剥蚀黑干黑曾瘢疵。另外本品外用可使局部血管扩张，改善血液循环，从而使色素得以吸收。 </P>\r\n<P>　　</P>\r\n<P><STRONG>　　五味子膏</STRONG> </P>\r\n<P>　　原料：五味子240g。 </P>\r\n<P>　　制法：将五味子洗净，水浸半日，煮烂去渣，再熬成饴，少兑蜂蜜收膏。每日口服1^2次，每次1匙，开水冲服。 </P>\r\n<P>　　功效：补肾健脑，滋阴益气，养心。 </P>\r\n<P>　　说明：此方收录在《慈禧光绪医方选议》中，用来给慈禧补身体和养心神的。本品性温，味甘酸，入肝、肾、心、肺诸经。历代医药学家认为有“养五脏，壮筋骨”等滋补强壮作用。 </P>\r\n<P>　　现代研究表明它含有五味子素、枸椽酸、挥发油等多种物质，对大脑皮层功能有调节作用，可改善人的智力和体力，增强机体非特异性抵抗力和肾上腺皮质功能;具有保肝、解毒、降低谷丙转氨酶作用等。可称此膏为健脑益寿佳品。 </P>\r\n<P><STRONG>　　阳春白雪糕</STRONG> </P>\r\n<P>　　原料：白茯苓(去皮)60g，山药60g，芡实90g，莲子肉(去心、皮)150g，神曲(炒)30g，麦芽(炒)30g，大米、糯米各500g，白砂糖500g。 </P>\r\n<P>　　制法：将诸药捣粉，与大米、糯米共放布袋内，再放到笼内蒸极熟取出，放簸箕(或大木盘)内，掺入白砂糖同搅极匀，揉成小块，晒(或烘)干贮存，备用。老年人每日2^3次，每次1~2块。 </P>\r\n<DIV class=hzh_botleft><!-- AFP Control Code/Caption.左下竖幅-->　　功效：健脾胃，益肾养元气，宁心安神，延年益寿。 </DIV>\r\n<P>　　说明：这是明代宫廷食疗验方，出自《鲁府禁方》。茯苓作用见前“茯苓糕”。《神农本草经》将山药列为上品，说它“益气力，长肌肉。久服，耳目聪明，轻身，不饥延年。 </P>\r\n<P>　　“清代名医张锡纯说山药是滋补药中无尚之品。现代医学研究阐明山药含有淀粉酶、氨基酸、胆碱、皂苷等，有增加白细胞吞噬功能，降低血糖等作用，所含淀粉酶能分解蛋白质和糖，所以有滋补生肌的效果。</P><!--function: content() parse end  0ms cost! -->', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('8', '刘利民率团赴美出席教师职业国际峰会并作发言', '美食资讯', '　　中国教育报讯（记者 焦新）应美国教育部长邀请，教育部副部长刘利民率团出席了3月16日、17日在美国纽约市举行的教师职业国际峰会并在会上作了主题发言。 \r\n<P>　　他说，当前中国教育事业进入从规模发展转向质量提升的新阶段。教育大计，教师为本。实现全民教育目标，提升教育质量，关键在教师。中国政府在教育全局中一直把教师放在重要突出位置，采取一系列重大政策措施，包括提高教师社会地位、经济地位，为教师职业发展创造条件，着力加强农村教师队伍建设，促进义务教育均衡发展等。 </P>\r\n<P>　　他指出，按照中国政府去年颁布的教育规划纲要的精神，今后一段时期，中国将把教师队伍建设摆在教育改革的优先议程，坚持办学以教师为本，积极借鉴吸收国外的先进经验和做法，为教师专业发展提供支持，提高中小学教师的整体素质和水平。 </P>\r\n<P>　　此次峰会由美国教育部、经济合作与发展组织、国际教育工作者联盟共同主办，来自美国、英国、日本、中国等16个国家的教育部长、官员、教师协会代表共400人出席。&nbsp;</P>\r\n<P>　　《中国教育报》2011年3月23日第1版</P>\r\n<META name=ContentEnd>', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('9', '首都各高校慰问帮助逾1.6万日籍在华留学生', '美食资讯', '　3月11日下午2时30分，正在宿舍上网的北京师范大学日本留学生东乡（化名）得知：日本东北海域发生大地震。他在震惊之余，马上往日本宫城县仙台市的家里打电话，却怎么也打不通。东乡心急如焚，他知道此时自己的母亲和年仅一岁的弟弟都在家里。\r\n<P>　　十几分钟后，东乡接到北师大留学生办公室的问询电话。得知东乡的情况后，学校立即为他提供国际电话及网络支持，并一直与他保持联系，安抚他的情绪……在经历了100个小时的煎熬和等待后，东乡终于得到来自日本方面的讯息：母亲和弟弟正在医院就诊，双双平安。</P>\r\n<P>　　日本强震发生当天，北师大对127名日本留学生展开全面排查后发现，有3人分别来自重灾区宫城县、福岛县和岩手县。第二天，学校又逐一与68名短期交换生取得联系，询问其家庭受灾情况，并承诺为暂时无法返国的学生提供免费住宿。</P>\r\n<P>　　据悉，目前日本在华留学生超过1.6万人。地震后，北京各大高校迅速排查本校日本留学生基本情况。</P>\r\n<P>　　清华大学用邮件问询在校100余名日本留学生家庭受灾情况，所幸他们大多家住日本中部、西部地区，没有遭受严重灾害，而部分委培学生因所学专业与救灾相关，迫切希望返回日本。清华大学迅速协助他们订机票，为他们回国开辟绿色通道。</P>\r\n<P>　　北京语言大学是北京地区在校日籍留学生最多的学校，面对500多名日籍留学生，排查工作很有难度，该校对留学生公寓的逐一走访一直持续到深夜。地震发生当晚，北京语言大学全体师生员工向日本留学生发出了一封慰问信，信中说：“此刻，北语师生的心和你们在一起，我们将和你们一起，积极行动起来，竭尽所能为日本震区学生提供帮助。”</P>', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('10', '诱惑!身在亚洲不可不尝美食', '美食资讯', '&nbsp; &nbsp; &nbsp; 俗话说：民以食为天。世界各地的饮食习惯大不相同，大多数的人们都对美食美味充满了浓厚的兴趣，相信你也不例外吧，一样难以抵挡美味的诱惑吧？那么我们先来了解一下这些国家都在吃什么呢，这些美味是不是早就勾起了你的馋虫，吸引你前往大快朵颐呢？<br />\r\n韩国人在吃什么？<br />\r\n<br />\r\n韩式拌饭<br />\r\n&nbsp; &nbsp; &nbsp; 韩国饮食的主要特点：高蛋白、多蔬菜、喜清淡、忌油腻，味觉以凉辣为主。韩国人自古以来把米饭当做主食。菜肴以炖煮和烤制为主，基本上不做炒菜。韩国人喜欢吃面条、牛肉、鸡肉和狗肉，不喜欢吃馒头、羊肉和鸭肉。<br />\r\n韩国人普遍爱吃凉拌菜。凉拌菜是把蔬菜直接切好或用开水焯过后，加上佐料拌成的。还有生拌鱼肉、鱼虾酱等菜肴。生拌鱼肉，是把生肉、生鱼等切成片，加上作料和切成丝的萝卜、梨等，再浇上加醋的酱或辣酱拌成。<br />\r\n&nbsp; &nbsp; &nbsp; 汤也是用餐时必不可少的部分，它通常用蔬菜、山菜、肉类、大酱、咸盐、味素等各种原料烹调而成。<br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;韩国人爱吃辣椒，家常菜里几乎全放辣椒。韩国人有一日四餐的饮食习惯，分别安排在早上、中午、傍晚、夜晚。韩国人就餐用勺和筷子。每个人都有自己的饭碗和汤碗，其他所有的菜则摆在饭桌中间供大家享用。韩国人使用饭碗也很有讲究，分男用、女用和儿童用。韩国人注意节俭，无论是自己食用还是招待穷人，都尽可能把饭菜吃光用净。<br />\r\n<br />\r\n<br />\r\n日本人在吃什么？<br />\r\n<br />\r\n<br />\r\n铁板烧餐厅<br />\r\n&nbsp; &nbsp; &nbsp; 说到饮食，不仅是以大米为主食、蔬菜、鱼与肉为副食的日本式餐点，而且西欧中国餐点一般也很普及，在日本可以品尝到丰富多样的餐食。日本是一个优质水资源非常丰富的国家，卫生设施也很完善，所以自来水在日本的任何地方都可以饮用。现代的日本文化更是多彩多姿。女孩子们在学习自古以来的日本传统文化，如茶道、花道的同时，也跳迪斯科。观览市区、古老寺院和高层建筑相邻而建的情景并不稀奇。故而现代的日本文化是结合了古老的、新兴的、西洋的和东洋的文化而形成。<br />\r\n日本人普遍爱食用生鱼，因而盖着生鱼片的寿司是日本国内最流行的食物。<br />\r\n&nbsp; &nbsp; &nbsp;日本料理非常讲究保持食物的原味，不提倡加入过多调料，以清淡为主。对菜肴的色面尤其有着很高的要求，不但使用各式各样非常精致的盛器来装食物，对食物的形状、排列、颜色搭配也都有很细腻的考虑。看着那一道道精细得有如风景画一般的日式料理，初到日本的游客往往不忍破坏那份美丽。<br />\r\n日本的酒类<br />', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('11', '闻堰被命名为省内首个\"中国江鲜美食之乡\"', '美食资讯', '<STRONG><FONT face=Arial>　杭州日报</FONT>讯（萧山记者站 郑丽华 通讯员 孔耀祥）</STRONG>28日，中国烹饪协会命名闻堰镇为“中国江鲜美食之乡”，成为省内首个“中国江鲜美食之乡”镇乡。 <BR><BR>　　作为闻堰的特色经济，江鲜美食吸引了各地游客，在集聚人气的同时，也打响了闻堰休闲文化靓“名片”。目前，闻堰已经形成了“江鲜一条街”、“三江美食节”等特色品牌，旨在提升现代服务业发展水平，打造魅力新城。 <BR><BR>　　闻堰地处三江交汇处，水产资源丰富。作为特色经济，近年来，江鲜餐饮业在闻堰已成规模。目前，闻堰已有大小餐馆91家，浙江省餐饮名店7家，浙江省级名菜15道，现有浙江烹饪大师、名师8名，浙江餐饮服务大师3名。2009年，实现餐饮业营业额1.5亿元。 <BR><BR>　　为此，闻堰向中国烹饪协会申请认定“中国江鲜美食之乡”品牌，重点发展区域经济，打造特色经济品牌。此次申报，共有7家企业申报省级餐饮名店，通过现场认定，专家组当场出具评审意见，申报的企业全部达到认定标准。同时，该镇的3家饭店和3道名菜1道小吃分别被认定为中华餐饮名店及中国名菜、名小吃。 <BR>', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('12', '郝平出席上海纽约大学签约和奠基仪式', '美食资讯', '　探索引进国外优质教育资源方式</MOEBT> <BR><BR>　　中国教育报上海3月28日讯（记者 唐景莉 沈祖芸 董少校）华东师范大学与纽约大学合作创办上海纽约大学的协议今天在上海正式签署。这是国内第一所中美合作的国际化大学。签约仪式后举行了奠基仪式。上海市委副书记、市长韩正，教育部副部长郝平等领导参加。 \r\n<P>　　上海纽约大学是落实教育部与上海市共建国家教育综合改革实验区的重要举措，是上海高等教育国际化办学的标志性项目，对于探索多种方式引进国外优质教育资源具有重要意义。上海纽约大学具有独立法人资格，其目标是在较短时间里，成为一所按照现代大学制度运行的一流研究型大学。</P>\r\n<P>　　双方将于2012年起开设高端金融人才培训项目，同时在若干专业开展研究生的双学位联合培养工作。第一届本科生将于2013年9月入学，教学计划和课程体系将参照纽约大学方案，采用高师生比、小班化教学、采用思辨式和讨论式的教学方式，提高学生的批判性分析和创新性思考能力。上海纽约大学将为学生提供全面的通才教育课程体系，使所有学生在深入学习一个主修专业之前，打下坚实的人文科学、社会科学和自然科学基础。课堂教学语言主要是英语。</P>\r\n<P>　　据悉，上海纽约大学未来的发展规模是拥有3000多名本科生、研究生，其中大多数的学生将来自中国本土，与此同时，该校也会借助纽约大学的招收系统，招收相当数量的国际学生，为在校学生创造一个国际化的学习环境。上海纽约大学的学生可利用纽约大学在纽约、阿布扎比等地所建立的全球网络大学,进行最长可达3个学期的游学。</P>\r\n<P>　　对于华东师范大学而言，创建上海纽约大学的目的旨在借鉴世界一流大学的办学理念和实践经验，在人才培养、科学研究、社会服务、大学管理等方面进行一系列积极的探索。</P>\r\n<META name=ContentEnd>', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('13', '墨西哥餐馆里的特色美食(图)', '美食资讯', '看多了墨西哥的风景，今天咱来说说墨西哥的美食。 提起墨西哥菜，你首先想到的是什么：辣椒?或是KFC的墨西哥鸡肉卷?\r\n<P style=\"TEXT-ALIGN: center\" align=center><A href=\"http://news.xinhuanet.com/food/2011-03/10/121171539_31n.jpg\" target=_blank><IMG id={BDDBCA44-0FD5-4A74-BDF0-76108A0DD790} title=墨西哥餐馆里的特色美食 style=\"BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; WIDTH: 399px; BORDER-BOTTOM: #000000 0px solid; HEIGHT: 249px\" height=249 alt=墨西哥餐馆里的特色美食 src=\"http://pic.66wz.com/0/01/20/01/1200134_053210.jpg\" width=399 border=0 relativepic=\"/attachement/2/jpg/20110310/121171539_3.jpg\" relativeid=\"{F3AD44AC-84F9-4656-AE61-6997EEB04A3F}\"></A></P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;的确，墨西哥人的食品离不开辣椒，除了辣椒，墨西哥人每顿都会有玉米。玉米饼、玉米粥、玉米汤。。。。。。品种数不胜数。据说，玉米就是墨西哥人的祖先印第安人培育出来的。而以玉米为原料制成的TACOS是墨西哥最基本也最有特色的食品。你可以花几个比索在路边摊吃到正宗可口的TACOS，也可以花一两百比索在大饭店吃到它。</P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;在墨西哥南方沿海地区，所以今天主要以海鲜为主。 先来看看在路边摊吃的吧。</P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;煎鱼排，在那个绝美的南方小镇TLCTLP就可以吃的。店面虽然不大，可却绝对新鲜美味。</P>\r\n<P style=\"TEXT-ALIGN: center\" align=center><A href=\"http://news.xinhuanet.com/food/2011-03/10/121171539_61n.jpg\" target=_blank><IMG id={24B59FDF-DBFE-473C-82CC-01A8E2DDC76E} style=\"BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; BORDER-BOTTOM: #000000 0px solid\" alt=\"\" src=\"http://pic.66wz.com/0/01/20/01/1200135_869028.jpg\" border=0 relativepic=\"/attachement/2/jpg/20110310/121171539_6.jpg\" relativeid=\"{1A732869-979D-4E92-AF01-003464F72262}\"></A></P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;墨西哥本地人点的。同一种鱼，不同的做法而已。<BR></P>\r\n<P align=center><IMG id={8953CF26-B70D-4142-B580-BE346F73B23F} title=墨西哥餐馆里的特色美食 style=\"WIDTH: 338px; HEIGHT: 485px\" height=485 alt=墨西哥餐馆里的特色美食 src=\"http://pic.66wz.com/0/01/20/01/1200136_885866.jpg\" width=338 align=center></P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;这个当地人叫做COCTEL，就是把虾和一些海鲜泡在一种酱汁里，当做一道开胃小菜吃。</P>\r\n<P align=center><A href=\"http://news.xinhuanet.com/food/2011-03/10/121171539_131n.jpg\" target=_blank><IMG id={DCE53433-2E3E-4D5B-AB06-AE3E52B98A00} style=\"BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; BORDER-BOTTOM: #000000 0px solid\" alt=\"\" src=\"http://pic.66wz.com/0/01/20/01/1200137_088242.jpg\" border=0 relativepic=\"/attachement/2/jpg/20110310/121171539_13.jpg\" relativeid=\"{99E7610B-2362-435F-9BF4-5DB41D96CF28}\"></A></P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>\r\n<P style=\"TEXT-ALIGN: left\" align=left>&nbsp;&nbsp;&nbsp;&nbsp;这是另一个路边餐馆的鱼肉海鲜卷<BR></P>\r\n<P align=center><A href=\"http://news.xinhuanet.com/food/2011-03/10/121171539_111n.jpg\" target=_blank><IMG id={F4EAD33F-E857-4229-8030-6437F2F3D514} style=\"BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; BORDER-BOTTOM: #000000 0px solid\" alt=\"\" src=\"http://pic.66wz.com/0/01/20/01/1200138_790510.jpg\" align=center border=0 relativepic=\"/attachement/2/jpg/20110310/121171539_11.jpg\" relativeid=\"{57292054-399F-4D28-A3ED-8E6ABFDF0DE3}\"></A></P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;把鱼肉卷打开看看里面有什么?鱼肉卷里包着虾、蟹肉、鱿鱼等海鲜。味道一般。</P>\r\n<P align=center><A href=\"http://news.xinhuanet.com/food/2011-03/10/121171539_241n.jpg\" target=_blank><IMG id={E792804A-3D81-4394-9A2B-89F5C4826846} title=墨西哥餐馆里的特色美食 style=\"BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; WIDTH: 400px; BORDER-BOTTOM: #000000 0px solid; HEIGHT: 248px\" height=248 alt=墨西哥餐馆里的特色美食 src=\"http://pic.66wz.com/0/01/20/01/1200139_942472.jpg\" width=400 align=center border=0 relativepic=\"/attachement/2/jpg/20110310/121171539_24.jpg\" relativeid=\"{56C038C6-88A2-41DA-9677-F28FAFAF1B00}\"></A></P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;当地人点的大虾<BR></P>\r\n<P align=center><A href=\"http://news.xinhuanet.com/food/2011-03/10/121171539_201n.jpg\" target=_blank><IMG id={DB311ED8-DE63-4608-B583-5B7F1F7D0095} style=\"BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; BORDER-BOTTOM: #000000 0px solid\" alt=\"\" src=\"http://pic.66wz.com/0/01/20/01/1200140_227928.jpg\" align=center border=0 relativepic=\"/attachement/2/jpg/20110310/121171539_20.jpg\" relativeid=\"{A0EECF80-6363-450B-96BA-95F0FB633AAB}\"></A></P>\r\n<P>&nbsp; &nbsp;&nbsp;墨西哥奶酪卷</P>\r\n<P align=center><A href=\"http://news.xinhuanet.com/food/2011-03/10/121171539_221n.jpg\" target=_blank><IMG id={183E46A2-7CF4-4BB3-B8CE-F5271551BD2D} style=\"BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; BORDER-BOTTOM: #000000 0px solid\" alt=\"\" src=\"http://pic.66wz.com/0/01/20/01/1200141_696171.jpg\" align=center border=0 relativepic=\"/attachement/2/jpg/20110310/121171539_22.jpg\" relativeid=\"{1220E0E1-72C4-4083-8A6D-3223E9DF8F8E}\"></A></P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;猜不到吧!这橙子上面抹的是辣椒。据说是墨西哥吃法哦。图文部分来自“阿米果的图文记事本”</P>', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('14', '汉语风“迷倒”法国 汉语水平考试人数创新高', '美食资讯', '　　据中新社、新华网报道，法国2011年度首轮汉语水平考试(HSK)巴黎的考点设在巴黎东方语言大学内。有记者表示，前来参考的，既有 70多岁的白发老人，也有刚上小学的天真儿童，其中大部分是法国人。由于首轮考试在全法只设3个点，不少人一早赶100多公里路来巴黎赶考。 \r\n<P>　　来自法国93省的女中学生梅兰妮在接受记者采访时说，她和她的同学们一样，已学了3年汉语，并被这门语言及它所承载的文化所深深吸引。她们的带队老师、旅法华人颜玉娴女士说：“这几年在我们学校选择汉语为第一或第二外语的学生越来越多，这在法国中学里算是一个比较普遍的现象。”</P>\r\n<P>　　祖籍浙江温州的黄女士带着两个孩子前来参加考试。她说，现在法国人都把学好中文看成是将来一个不容忽视的竞争优势。作为在国外的中国人，就更要学好自己的语言。参加统一的HSK考试，有利于测试孩子的水平和使用汉语的实际能力，让他们更有信心继续学习。<BR><BR>　　面对这些年龄不一、但热情洋溢的考生，在现场监考的法国汉语总督学白乐桑感叹道，1994年法国第一次举办汉语水平考试时，知道HSK的人寥寥无几，而现在这一测试已经广为人知。今年全法参与HSK考试的人数逾千人，创历史新高。</P>\r\n<P>　　据白乐桑介绍，下个月，法国另外7个考点也将举办HSK考试。“考虑到报考人数日益增长的具体情况，今年5月份还将在巴黎设置第2场考试，这是头一次。足以显现法国汉语热的程度。”白乐桑说。</P>\r\n<P>　　随着中法关系的不断深入，汉语在法国日渐风行。目前在法国正规学校学习中文的人数近5万人，专职汉语教师近450人，共有151所高等院校和530多所中学开设了汉语课。而且该数字还在以每年20%的速度递增。在法国的国民教育体系中，中文正在向第三外语，甚至第二外语过渡。</P>', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('15', '灵二高学生“美食”迎新年（图）', '美食资讯', '<TABLE cellSpacing=20 cellPadding=0 align=center>\r\n<TBODY>\r\n<TR align=middle>\r\n<TD><IMG src=\"http://pic2.66wz.com/0/10/35/61/10356111_043078.jpg\" border=0></TD></TR></TBODY></TABLE>　　 12月28日消息：昨天，灵溪二高举办一场“缤纷二高欢庆元旦”为主题的美食一条街活动，学生们用这种特殊的方式来欢庆元旦，喜迎新年。该活动以班级为单位，一个班级一个摊位，学生通过亲手制作的各种美食，向同学、老师展示自己的烹饪本领，同时也增强了学生们的劳动意识，提高学生的综合素质。（新中） <!--advertisement code begin--><!--advertisement code end--><!--function: content() parse end  0ms cost! -->', 'hsg', '2017-04-03 15:28:39', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('16', '优惠券快过期了也没订到座 “团购饭”要吃到很麻烦', '优惠活动', '&nbsp; &nbsp; &nbsp; “三个多星期不断打电话，眼看优惠券快要过期了，也没在饭店订到座位。”这是一位在某团购网上购买了优惠餐券的网友小静的抱怨。<br />\r\n&nbsp; &nbsp; &nbsp; 今年，团购网站突然红火并拥有了众多粉丝，其中餐饮团购更是热门。记者随机询问了身边十几个朋友，有六七人都在团购网上购买过餐厅的优惠券，或者被人请过此类团购饭。不过，在享受了团购的低价优势之后，团购餐饮优惠券也催生了新烦恼，其中“订位难”更是被许多消费者所诟病。<br />\r\n餐券团购，今年很火<br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;“有那么一个月，我几乎天天在吃团购餐，吃了大大小小很多家饭店。”在杭州某电视台工作的吕洋告诉记者。他从今年9月份知道团购网站这个新事物后，他就成为了铁杆粉丝。<br />\r\n&nbsp; &nbsp; &nbsp; 团购的最大吸引力就是价格便宜。记者昨天在大众点评网上看到，原价292元的私房菜套餐，仅售85元，包括了煮干丝、深水虾等六个热菜两个凉菜和一个猕猴桃汁，相当于3折不到，这个团购单子昨天已有609人报名；而在糯米网的往期团购历史中看到，不少餐饮团购项目都有五六千人购买。<br />\r\n&nbsp; &nbsp; &nbsp; “餐饮团购，在杭州大概是六七月份开始火起来的吧。”团购达人于小南告诉记者，从今年夏天开始她身边就有不少人吃上了团购饭：先在网站上下单买优惠券，然后再根据手中的优惠券安排自己的餐饮计划，乐此不疲。<br />\r\n想吃团购饭，遇到大麻烦<br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;在杭城某出版社工作的杜小姐很喜欢吃日本料理。“9月初，中山路一家日本料理店在糯米网推出团购，我一下子买了八张优惠券。”<br />\r\n&nbsp; &nbsp; &nbsp; 让她想不到的是，她第一次去餐厅，结账时服务生告诉她只有先预约才能使用优惠券。隔几天再打这家餐厅的预约电话，不是忙音就是无人接听，好不容易通了一次，对方告诉她订满了没有位置。餐券快要过期的时候，杜小姐直接杀到餐厅，和工作人员吵了一场，最后工作人员答应让她当天使用餐券，不过要一次性消费掉。看着手里8张双人份优惠券，杜小姐把能叫的朋友都叫上了，合伙大吃一顿，最后把没吃光的寿司都打包回家了。<br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;记者采访的消费者或多或少都遇到过订位难的问题。昨天小静抱怨，她从大众点评网、糯米网上拍下三张优惠券以后，但在预约的时候却怎么也约不上位置。<br />\r\n&nbsp; &nbsp; &nbsp; 餐饮团购的其他问题还有不少。在武林广场一家甜品店团购了甜点的张小姐，在买甜点的时候被告知没货了。而吃团购饭最有经验的吕洋表示：“去吃团购饭的时候，位置往往是大厅里比较差的地方，这也罢了。感觉有时服务员的服务也比较差，上菜速度超慢，好像用优惠券的都是低人一等的。”另外一些饭店对于就餐日也有限制，比如不能在双休日使用等等。<br />\r\n团购消费者，要注意维权<br />', 'hsg', '2017-04-03 15:29:11', 'uploadfile/1340069838pb96.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('17', '明年起老人乘公交更优惠', '优惠活动', '　&nbsp;&nbsp; 温州公交集团昨日（11月26日）介绍，从明年1月1日起，全市（含11个县市区）70周岁以上老年人可免费乘坐温州公交集团公交车；60至69周岁老年人可按8折优惠乘坐公交车。 \r\n<P>　　我市此前已有老年人优惠乘公交车的办法。从2006年10月10日开始，温州公交集团已对鹿城、龙湾、瓯海范围内年满70周岁以上老年人办理免费乘车卡。三个区老年人现已办理免费乘车卡8.5万张。</P>\r\n<P>　　与老政策相比，新政策扩大了70周岁以上老年人免费乘坐公交车的地理范围，即从三个区扩大至全市范围，同时新增全市60至69周岁老年人优惠乘坐公交车的规定。新政策明年执行后，原三个区老年人的免费乘车卡继续使用。</P>\r\n<P>　　老年人办理优惠、免费乘车卡须统一参加由有关保险公司办理的乘车意外事故保险。保险费每人每年25元由个人缴纳。</P>\r\n<P>　　首次办理老人公交优惠卡、老人公交免费卡免收IC卡成本费。60至69周岁老人优惠乘车卡首次办卡，缴80元充值100元，继续充值按8折优惠；70周岁以上老人首次办卡免费充值900元，用完之后继续免费充值。卡内金额不限使用期。老年人持卡乘车，与普通乘客一样根据统一票价刷卡。</P>\r\n<P>　　12月1日起，凡符合条件的老年人可由本人或委托他人代办，携带浙江省人民政府颁发的老龄证书复印件一份、身份证复印件一份、近期免冠照片一张，到户籍所在地街道办事处（乡镇政府）登记。由街道办事处转交市公交集团给予统一办理。</P></FOUNDER-CONTENT>\r\n<META name=ContentEnd><!--ZJEG_RSS.content.end--><!--<$[信息内容]>end-->', 'hsg', '2017-04-03 15:29:11', 'uploadfile/13400699440gw0.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('18', '北京多家银行落实二套房首付六成政策 将取消优惠利率', '优惠活动', '　<STRONG>已有7银行公布执行日期；多家银行取消首套房利率8.5折优惠，执行基准利率</STRONG>\r\n<P>　　昨天，北京市已经开始执行新的住房转让营业税政策，一些区县的办事大厅已经贴出了告示，昨起网签的二手房，不足5年转手交易的，统一按销售收入全额征税，满5年的将免征收营业税。此外，记者从北京市相关部门了解到，北京落实“国八条”的地方调控细则，目前正在研究拟订中，将在下月15日前出台。</P>\r\n<P>　　根据北京房地产交易管理网的数据，1月27日当天北京的二手房网签量突破2000套，达到2093套。比“国八条”出台前的26日突增了86.2%。业内人士分析，春节前北京二手房市场的交易量预计持续走高。</P>\r\n<P style=\"TEXT-ALIGN: left\" align=left><FONT color=navy>　　<STRONG>【政策?营业税】</STRONG></FONT></P>\r\n<P><FONT color=blue>　　<STRONG>新税政以网签时间为准</STRONG></FONT></P>\r\n<P>　　前天，财政部、国家税务总局联合发出《关于调整个人住房转让营业税政策的通知》，明确从28日起，个人将购买不足5年的住房对外销售，全额征收营业税。</P>\r\n<P>　　记者昨天从多家房产中介了解到，昨天一早，朝阳、海淀等区县的房屋交易大厅，办理过户手续的人相比27日有了明显的增加，并公示了地税政策：凡在2011年1月27日之前网签的，按原政策执行，1月28日（含28日）后网签，个人购买住房不足5年转手交易的，统一按销售收入全额征税，满5年的将免征收营业税。</P>\r\n<P>　　办理过户手续的邢先生表示，他新购置的二手房为不满5年的普通住房，虽然已经错过了可以享受差额缴纳营业税的时段，但由于担心新“国八条”中，其他规定细则的出台，所以依然决定尽快办理过户手续。</P>', 'hsg', '2017-04-03 15:29:11', 'uploadfile/1340069970gp0a.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('19', '首届国际设计风格博览会下周举行', '优惠活动', '家装旺季马上到来，为了帮助更多的家装准业主了解最新、最全面的家装流行趋势，量身定制称心如意的居家风格，同时买到货真价实的品牌材料，本报家居工作室联合温州伟业装饰有限公司，将于8月14日推出“温州市首届国际设计风格博览会”。欢迎广大准业主报名参与。\r\n<P>　　本次博览会包括全球设计风格品鉴、家装公益讲座、品牌材料团购三大主题活动。博览会现场将汇集近五百幅全球最具代表性的居家设计风格图片，这些作品皆为国际、国内室内设计大师杰出作品，供广大准业主品味、借鉴 。同时，现场的资深设计师将为广大业主一对一介绍这些图片的风格、适合的人群、造价、工期、用材等。如果你看中哪一种风格，可以要求现场的设计师借鉴这风格，为你家量体裁衣，设计你的专属家居，并参观相关样板房。值得一提的是，本次精选的近五百幅图片，都是目前全球最流行、最具代表性的各种住宅、商业空间的设计作品，包括“全球最具影响力的名人别墅”、“最具有品牌特色的商业空间”、“最经济实用的各种民用装修设计”、“最经典时尚的各种软装饰产品”等， 为即将装修的业主提供全面参考。</P>\r\n<P>　　在整个活动中， 所有现场下定金的意向客户将享受一系列优惠， 并拥有“设计方案不满意无条件退款”的权利。除此之外，包括大自然地板、名家建材、梦天实木门业、顶固移门、帝尚国际灯饰、嘉禾橱柜、光大墙纸等多家品牌材料商集中亮相 ，均以优惠价回馈消费者。活动整场还穿插多轮抽奖，最高奖项是价值3000元材料代金券。</P>\r\n<P>　　在家装公益讲座环节， 伟业装饰设计总监就我市今年上半年已经交付以及下半年即将交付的楼盘主推房型、风格，进行逐一地讲解，同时伟业装饰工程部经理还将在现场“坐堂解疑”，凡需要了解家装过程中水电等隐蔽工程注意事项的业主，都可前来进行免费咨询，这对于准业主在装修过程中做好监工非常有帮助。 本次活动所有准备装修或者正在装修需要购买主材的读者都可以报名。凭报名时留下的联系方式，每人入场时还会获赠一份纪念品。</P>\r\n<P>　　记者 李明锋</P>\r\n<META name=ContentEnd><!--ZJEG_RSS.content.end--><!--<$[信息内容]>end-->', 'hsg', '2017-04-03 15:29:11', 'uploadfile/1340070002x47w.jpg', '2', null);
INSERT INTO `xinwentongzhi` VALUES ('20', '慈禧抗衰驻颜术 常按5个“养生窝”', '养生知识', '据史料记载，每当慈禧出现不适，都会按摩眼窝、腰窝、腋窝等\"养生窝\"，常常收到立竿见影的效果，被称为宫廷养生\"第一窝\"。现代人不妨借鉴宫廷养生按摩\"第一窝\"的方法，可达到良好的抗衰老效果。\r\n<TABLE class=tableImg cellSpacing=0 cellPadding=0 align=center border=0>\r\n<TBODY>\r\n<TR>\r\n<TD style=\"TEXT-ALIGN: center\"><IMG alt=\"\" src=\"http://photocdn.sohu.com/20110201/Img302823381.jpg\" align=middle></TD></TR>\r\n<TR>\r\n<TD style=\"TEXT-ALIGN: center\">&nbsp;</TD></TR></TBODY></TABLE>\r\n<P>　　<STRONG>泻火通便第一窝：腰窝</STRONG></P>\r\n<P>　　腰部脊柱左右凹陷处。按摩腰窝有泻火通便的功效，对大便秘结、痔疮疼痛等疗效显著。</P>\r\n<P>　　<STRONG>怎么按？</STRONG></P>\r\n<P>　　1.两手对搓发热后，紧按腰窝处，稍停片刻后用力向下搓到尾骨部位，连续做50次，每天早晚各1次。</P>\r\n<P>　　2.迅速收缩、放松肛门周围肌肉，持续10秒，间隔10秒，连续做10次。<BR>　<STRONG>止咳利咽第一窝：颈窝</STRONG></P>\r\n<P>　　喉结下方、胸骨上凹陷处。刺激颈窝可减弱神经系统对喉部及呼吸道黏膜刺激的兴奋感，止咳平喘。</P>\r\n<P>　　<STRONG>怎么按？</STRONG></P>\r\n<P>　　用食指的指腹按揉颈窝，每次100圈，一天3～4次，力度以微微酸痛为宜。一般半小时后可缓解咽部不适。<BR><STRONG>宽胸护心第一窝：腋窝</STRONG></P>\r\n<P>　　心脏疾病多为气滞血淤、心脉痹阻所致，刺激腋窝可宽胸理气、调整气血，改善心悸、胸闷、气短等。</P>\r\n<P>　　<STRONG>怎么按？</STRONG></P>\r\n<P>　　醒来仰卧在床上，左手四指并拢(大拇指除外)置于右腋窝内，顺时针和逆时针按摩，每20圈交换1次，共按摩200圈，再换右手以相同的方法按摩左侧腋窝。<BR>　<STRONG>降压安神第一窝：眼窝</STRONG></P>\r\n<P>　　即眼眶之内的柔软区域。中老年人患高血压及失眠均与阴阳平衡失调有关，眼窝是手足太阳、足阳明等交会之处，可调理人体阴阳平衡。</P>\r\n<P>　　<STRONG>怎么按？</STRONG></P>\r\n<P>　　1.轻闭双目，用食指指腹在眼皮上分别顺时针、逆时针缓缓地旋转按摩各10次。</P>\r\n<P>　　2.端坐凝神，先用力迅速地眨眼15～30秒，再紧闭双眼5秒后睁大双眼3～5秒，并将视线移至鼻尖处注视3～5秒。</P>\r\n<P>　　3.双眼分别顺时针和逆时针旋转环视运动6～8次，幅度尽量大。<BR>　<STRONG>降糖调血第一窝：耳后窝</STRONG></P>\r\n<P>　　即耳垂后方的凹陷处。耳后窝深层分布有迷走神经，通过刺激可使迷走神经兴奋，促进胰岛素的分泌，从而有效降低血糖。此外，还可预防糖尿病并发症。</P>\r\n<P>　　<STRONG>怎么按？</STRONG></P>\r\n<P>　　双手拇指缓缓用力按耳后窝，慢慢吐气，持续5秒再松手，如此反复按压10～15秒，每天午饭和晚饭后半小时按摩1次。</P>', 'hsg', '2017-04-03 15:29:32', 'uploadfile/1340069838pb96.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('21', '新浪中医专访：王琦教授谈中医养生', '养生知识', '<STRONG>王琦</STRONG>，著名中医学家，“973”项目首席科学家，国家重点学科中医基础理论学科带头人，享受国务院特殊津贴的有突出贡献专家，国家人事部、卫生部、国家中医药管理局遴选的全国老中医药专家之一，现任北京中医药大学博士生导师。 \r\n<CENTER><IMG alt=\"\" src=\"http://pic.66wz.com/0/01/24/86/1248681_021957.jpg\"></CENTER>\r\n<P align=center>　　王琦教授接受新浪中医频道的专访</P>\r\n<P>　　4月22日在“2011年健康医学与个体化诊疗研讨会”上王琦教授与来自医药卫生界的专家学者一起，围绕健康医学和个体化诊疗这一重大历史性课题分享成功经验，探讨未来发展。</P>\r\n<P>　　近年来，由王琦教授确立的中医体质学通过将人群分为不同的体质类型，探讨了体质与疾病的关系、干预体质防治疾病的作用机理等，这些有可能为个体化诊疗的大面积推广实施提供借鉴与参考。会后王琦教授接受了新浪中医频道的专访。</P>\r\n<P><STRONG>　　新浪中医：</STRONG>王琦教授您好！今天的会议围绕着“健康医学与个体化诊疗”召开的，这次会议和您本人都受到卫生部王国强副部长的高度肯定，您可不可以讲解一下什么是“个体化诊疗”？ <STRONG>　　</STRONG></P>\r\n<P><STRONG>　　王琦教授：</STRONG>人和人的体质是不一样的。你跟我不同，我跟他不同，世上没有两片相同的叶子，也没有完全相同的两个人，这个不相同也就是我们现在所说的个体差异。为什么处在同样的环境下，有些人发病，有些人不发病呢？因为你跟他不一样，所以你容易患的病就不一样，也因为你跟他不一样，所以治疗你的方法也不一样，或者说养生的方法也不一样，这是我们经常强调说的个性化诊疗方式。 </P>\r\n<P>　　个体化诊疗就是基于以人为本、因人制宜的思想，充分注重人的个体差异性，进行个体医疗设计，采取优化的、针对性的治疗干预措施，使之更具有有效性与安全性，并据此拓展到个性化养生保健及包括人类生命前期的生命全过程，从而实现由疾病医学向健康医学的转化。</P>\r\n<P><STRONG>　　新浪中医：</STRONG>很多网友都看了您的著作《解密中国人的九种体质》、《中国人九种体质的发现》，也相对应的了解自己是什么样的体质，应该进行什么样的保健。面对现在这种学习中医的热潮，年轻人应该怎样正确认识中医？ <STRONG>　　</STRONG></P>\r\n<P><STRONG>　　王琦教授：</STRONG>年轻人在现代文明中成长，可能有的人对历史和文化的了解不多，习惯用现代的角度看待问题，传统的东西在他们的脑中没有落脚点，但这并不能说明古老的就是落后的，现代的就是科学的，要正确认识中医，就要了解中华文化，对中华文化和中华文明有认同感。作为年轻人应该认识自身文化的根基，不要违背自然规律和自然法则。中医学是从自然的、无伤害的立场，用整体观看待人的生命现象。世界是多元的、复杂的、不要把这种多元和复杂看成是一种简单的现象。 <STRONG>　　</STRONG></P>\r\n<P><STRONG>　　新浪中医：怎样正确引导人们的养生观念呢？</STRONG> </P>\r\n<P>　　人们对于养生的这种热情，我们一定要保护好，这是一种社会需求，是民众对健康的需求。面对这种需求我们一定要做科学的引导，并且是建立在理论根据、实践根据基础上的科学引导。其次要因人制宜讲究个性化养生，每个人都是不同的，存在着不同的状态，不一样的地域环境、生活方式、文化教养、经济状态等等，这些不一样就构成了种种差异，如果我们抛去这些差异性，用同一个统一的模式，就违背了个性化，因此我们每个人要学会自我判断，找到适合自己的养生方法。</P>\r\n<P><STRONG>　　新浪中医：</STRONG>目前职场白领的健康状况成为大家关注的焦点，针对职场白领的工作特征，您有什么样的建议？ <STRONG>　　</STRONG></P>\r\n<P><STRONG>　　王琦教授：</STRONG>职场白领多属于两种体质，一种是痰湿体质，是由运动少，营养过剩，生活、饮食不规律造成的，这与白领的工作性质有关。另一种是气郁体质，主要是白领的压力大，经常的熬夜、加班，精神焦虑、紧张，并且压力得不到很好的释放的原因。对于这两种体质的人来说，调养的重点是从生活习惯和生活方式上进行调节，选择性的运用适合自己的调理方法。 </P>\r\n<P>　　马上就要进入夏季，室内外温差加大、封闭办公环境，加上辛辣的饮食，白领们要注意:夏季养生最重要的是养\"阳气\"，要少吃生冷食物，空调不要开的过低，时间过长，晚上要适当的散步，合理的调整身体的状态，以顺应夏季的自然规律，保持身体的平和。</P>\r\n<P><STRONG>　　新浪中医：</STRONG>在大家眼里，您是一个养生大家，可不可以跟我们分享一下您的养生心得 <STRONG>　　</STRONG></P>\r\n<P><STRONG>　　王琦教授：</STRONG> <STRONG>　　</STRONG></P>\r\n<P><STRONG>　　一、养生不在养</STRONG> </P>\r\n<P>　　养生如牧羊，不要刻意的把养生看成是一种固定的、程式化的事情，养生不是我们照着一本书，怎么吃，怎么喝，其实养生是一种境界，是一种心理的自我调适。</P><STRONG>　　二、养生不在同</STRONG> \r\n<P>　　人分九种体质，各不相同，要讲究个性化，选择适合自己的养生方式。</P><STRONG>　　三、养生不在补</STRONG> \r\n<P>　　现在很多人认为，养生就是补，其实平衡就是健康，盲目进补只会打破平衡，有需才有求，并不是每个人都需要进补。现在很多讲养生的人都推荐吃什么，补什么，一定要纠正这种错误的认识，要根据个人的需求和各自的身体情况适当的进补。</P><STRONG>　　养生三通：血脉通、肠胃通、心气通</STRONG> \r\n<P>　　第一，血脉要通畅。要适当的注重运动，保持身体血脉畅通，对新陈代谢很有好处。</P>\r\n<P>　　第二，肠胃要通调。要合理的安排饮食结构，保持肠胃通畅。</P>\r\n<P>　　第三，心气要通顺。保持心情舒畅、心态平和是养生专家历来最强调的一点。心情好身体就好，人不可能事事都顺心如意，保持好的心态很重要，我写过一首诗：</P>\r\n<P>　　大道至简不须繁，参悟舍得二字禅，</P>\r\n<P>　　人间处处皆风景，你过这山我那山。</P>\r\n<P>　　养生其实很简单，调节好心态，快乐的生活，找到一个适合自己的养生方式，顺其自然，身体自然就会朝着平和的方向走去。</P><STRONG>　　新浪中医：</STRONG>感谢王琦教授在百忙之中接受我们的采访，并为我们讲解什么是\"个体化诊疗\"，指导我们正确认识中医、学习中医以及为我们分享养生心得。同时也欢迎王琦教授有时间到新浪中医做客。 <!--function: content() parse end  0ms cost! -->', 'hsg', '2017-04-03 15:29:32', 'uploadfile/13400699440gw0.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('22', '产生心理生理障碍的三大因素', '养生知识', '　在现如今，人们越来越多的出现<B>心理生理障碍</B>，很多人都不清楚是什么原因导致心理生理障碍的出现，因而也就不能找到治疗心理生理障碍的方法。对此，专家表示，导致心理生理障碍的原因有很多。但基本上可以归纳为这三点： \r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　(1)社会因素</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　在人类生活的社会中，社会因素对于人类的健康和疾病起着定的作用人对环境的适应不只是被动产生，而且要在实践中主动地改造环境以满足自身的需求。人在一生中，周围环境变化是很的，如领导、家庭、邻居、同事间关系及矛盾接踵而来。而人们对自身生存环境的变化往往是无能力的，被动地适应和主动地适应都是不可抗拒的。适应良好，身心健康;适应不良，以致产生心理生理疾病。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　社会因素对心理生理障碍的作用可以从流行病学调查结果来说明。胃癌与食管癌以日本人患病率为高，冠心病患病率最高者为美国和芬兰，最低为尼日利亚。里有族差异、饮食习惯、人口年龄组成、体力劳动少等因素的作用。但总体上这些疾病的患病率是发达国家高于发展中国家，城市高于农村，脑力劳动者高于体力劳动者;居住拥挤、生活条件恶劣、要做较多努力者患病率较高。另一种心理生理疾病患病率较高的群体是移民，在我国，尤以从条件好的国家如美国或西欧迁来者发病率较高;而从中东地区迁来者，患病率就低一些。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　(2)心理因素</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　心理因素指体本身的心理素质、心理发育和心理反应。而生物因素与社会因素是以心理因素为中介而作用于人体的。不良的心理刺激常可导致机体的心理或生理反应。一般而言，引起人们产生损失感和不安全感的心理刺激最易致病。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　生活事件能引起人们的心理反应，并伴明显的生理应激。研究表明，很多疾病，尤其心理生理疾病常常由于生活事件引起应激而诱发。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　(3)生理因素</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　生理始基与生理中介机制是产生心理生理疾病的两个重要方面。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　生理始基，是指心理生理疾病患者病的生理特点。不同的生理始基，使个体具有不同的相应心理生理疾病的易罹性。例如在溃疡病发病中，由于胃蛋白酶增多，消化了胃的粘膜引发溃疡。溃疡病人病前胃蛋白酶的前体??胃蛋白酶原含量高，就是溃疡病的生理始基。仅有溃疡病的生理始基，也不会直接导致溃疡病。有溃疡病生理始基的人群中，心理社会刺激起“扳机”作用。研究还发现甘油三酯是冠心病的生理始基，高蛋白结合碘是甲状腺机能亢进的生理始基。</SPAN></SPAN></P>', 'hsg', '2017-04-03 15:29:32', 'uploadfile/1340069970gp0a.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('23', '分析初中学生心理的三大特点', '养生知识', '&nbsp; 人的一生，初中是一个比较特殊的阶段，不仅是我们长身体的关键时期，也是我们长知识、长智慧的重要阶段，由于初中生的世界观还没有成熟，面临着生理上与心理上的剧烈变化，也就被俗称为叛逆时期。此时的<B>初中学生心理</B>具有以下三大特点。 \r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 一、好的愿望与心理准备不足</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 几乎每个中学生都有美好的愿望，对未来充满憧憬和向往。他们幻想做一个有学问、受人尊敬的人，而实际上他们往往学习不努力，过一天算一天。虽然他们的愿望是美好的，但追求的全是实现理想后的种种荣誉与享受，而对实现理想需要从现在做起，需要付出艰辛的劳动，却想的不多，做的不够，形成了美好愿望与心理准备的矛盾。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 二、情感与理智的不协调统一</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 初中阶段的学生容易动感情，也重感情。一方面，他们充满热情和激情；另一方面，他们的情感又极易受外界影响，易冲动。他们对自己喜欢的事、积极性高，不感兴趣的事避而远之。这说明他们的情绪、情感处于大起大落的两极状态，而难以及时地用理智控制。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 三、进取心强与自制力弱的矛盾</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 初中阶段的学生大部分是有积极向上的进取心的，这与他们求知欲、自尊心和好胜心强是分不开的。但他们思考问题不周密，往往带有浓厚的感情色彩去看待周围的人和事，因而有时片面坚持已见，对教师的要求，合乎已意的去办，不合已意的就拒绝或顶牛，不能控制自己，凭冲动行事，事过之后又非常后悔。这一切都说明他们意志品质的发展还不成熟，自制力、控制力不强。</SPAN></SPAN></P>', 'hsg', '2017-04-03 15:29:32', 'uploadfile/1340070002x47w.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('24', '金乡镇将举办“植物养生、绿色金乡”选美赛', '养生知识', '&nbsp;&nbsp;&nbsp; 3月23日消息：为贯彻落实县委、县政府提出的“绿色苍南、美丽家园”决策部署，切实推进森林城镇、森林村庄的创建活动，金乡镇决定公开举办“植物养生、绿色金乡”选美大赛，在全镇范围内推荐评选绿化最优美、最具创意的十佳村庄、十佳企业。活动旨在发动全镇“发现绿、寻找美”，引导广大群众积极参与“绿色苍南、美丽家园”绿化造林工作。\r\n<P>&nbsp;&nbsp;&nbsp; 即日起，全镇范围内各村居、企业可根据自身实际，开展一系列植树造林活动，营造爱绿、植绿、护绿、兴绿的浓厚氛围。并将心目中绿化最优美的照片推荐到政府相关网站。金乡镇将组织相关单位人员、群众代表组成评审小组，对照片进行评鉴，并结合实地勘察认定，评选出金乡镇最优美、最具创意的十佳村庄、十佳企业。&nbsp;（通讯员 郭小莹 叶高春）</P>', 'hsg', '2017-04-03 15:29:32', 'uploadfile/1340070029dc64.jpg', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('25', '八旬老人的养生之道??记沿浦镇鼻头村夏礼祥老人', '养生知识', '<P>通讯员 邱新福</P>\r\n<P>&nbsp;&nbsp;&nbsp; 家住沿浦镇鼻头村的80岁老人夏礼祥，脸色红润精神好，看上去像是个60开外的人，他对人和蔼可亲，脸上总是挂着笑容，说起话来细声细语。</P><!--advertisement code begin--><!--advertisement code end-->\r\n<P>&nbsp;&nbsp;&nbsp; 夏礼祥乐于助人。他的针灸医术是祖传，为人治病颇有名气，自己研制的特效药三香解暑散免费送人。每到夏天，只要有人叫他去放痧，不分昼夜，总是随叫随到，从不延误。去年仲夏傍晚，当得知大姑村青年农民林华文干农活中暑昏死在路边，老人及时赶到，拿出银针对准穴位放了几针，不到半小时，林华文渐渐苏醒，安然无恙。类似的事不计其数，老人说做好事虽然辛苦，但乐在其中，心情舒畅，晚上睡得香。</P>\r\n<P>&nbsp;&nbsp;&nbsp; 老人还爱好读诗、写诗。他说，通过吟诗增加肺活量，改善记忆力，又可以开发调动大脑的潜力，激活脑细胞。老人喜欢游山玩水，写了千首诗，并出版3本诗集，诗作在全国报刊上发表，多篇诗作获奖。因诗相识、相聚，广结诗友，交流写作经验。今年八十大寿，四代同堂，下辈送来许多礼物，唯独送诗书让他最为高兴。</P>\r\n<P>&nbsp;&nbsp;&nbsp; 此外，老人对体育锻炼有一套，自创“床上按摩法”，即按准穴位胸至腹按摩200下，揉太阴穴200下，刮耳100下，转头100下，梳头100下，持之以恒，从不间断。</P>\r\n<P>&nbsp;&nbsp;&nbsp; 老人喝水很讲究，并养成习惯，每晚睡前、半夜、天亮各喝一碗开水，久而久之起到清肠道作用。不挑食，有什么吃什么，只要符合口味，物不分东西，味不分南北。他的老伴说，老夏呀，他最好“打发”了，胃口好，我煮什么，他就吃什么，而且吃得津津有味。</P>\r\n<P>&nbsp;&nbsp;&nbsp; 前年县老协举行运动会，老人参加800米跑，获得笫2名，去年被评为县优秀健康老人。</P>', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('26', '咖啡有哪些个养生保健功效？', '养生知识', '&nbsp; &nbsp; &nbsp; 咖啡，是现代白领女性热爱的饮品之一。忙碌的上班日，来上一杯香浓的咖啡，是对生命最好的奖励。人们越来越喜欢咖啡，无论在家中，在办公室，人们饮用咖啡是一种感觉，是一种时尚，是一种休闲，是一种文化。可是你是否听说过，咖啡也能养生。<br />\r\n&nbsp; &nbsp; &nbsp; 浪漫背后的秘密：咖啡的养生功能<br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;日本在江户时代只有掌握解救生命的医师才能品尝到咖啡。当时医师们喝了咖啡后，便将其功效记载下来，譬如《长崎闻见录》就是其中之一。在书中记载着：“咖啡因增加脾脏的运动，帮助消化，降火气，更可利尿，使胸脾舒畅。能够平胃酸，加入茯苓饮用，效果更甚。”将咖啡的健胃作用(使胃能健康地运作)、中枢兴奋作用、利尿作用等，以简洁有力的文字表达出来。<br />\r\n<br />\r\n&nbsp; &nbsp; 《新华本草纲要》中更记载着：“咖啡有兴奋神经、强心(强化心脏)、健胃、利尿等作用。对酒精无法清醒、小便不顺畅、慢性支气管炎、肺气肿(肺部积留空气的疾病)，以及因肺气肿而产生的心脏病、消化不良等皆有帮助。”<br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; 咖啡原豆的主要成份：咖啡原豆富含维他命B、游离脂肪酸、咖啡因、单宁酸、亚油酸、一定含量的不饱和脂肪酸、嘌呤成份和抗氧化物质且烘焙后的咖啡豆含量更高;其中咖啡因作为咖啡的主要成份，可以刺激人脑的中枢神经系统，是各种止疼药、减肥药以及各种兴奋剂的主要成份。<br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;中医的角度看咖啡的17个养生功能<br />\r\n&nbsp; &nbsp; &nbsp; 咖啡豆来取自咖啡树的果实，色红赤属火，入心，气焦苦，并入大肠径。性味辛甘苦涩，炒燥焦。甘醇味有补养及缓和作用，能缓和疼痛，辛味发散行气作用，能通过脑血屏障，治疗表风热、头痛、苦味有燥湿与泻下作用，能治疗热症或湿症。<br />', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('27', '儿童心理障碍产生的诸多原因分析', '养生知识', '相信没有哪个家长不想自己小孩身体健康的，但是大多数家长对小孩的<A class=innerlink href=\"http://www.chinajs120.com/html/xljk/\" target=_blank>心理健康</A>却关心得不多。而目前，越来越多的<B>儿童心理障碍</B>出现在我们周围，如果不及时治疗这对他们今后的生活将会产生比较大的影响。那么儿童的心理障碍是因为什么引起的呢？ \r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　儿童心理障碍产生的原因</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　一、胎教的影响。现在很多母亲给胎儿听胎教磁带，但已发现有些幼儿由于听觉刺激不适当，反而造成失聪。胎儿应该有一个安静的生长环境，不应该受到无端的打扰。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　二、没有经过爬行训练的影响。现在2/3的城市儿童缺乏爬行训练，过早地使用学步车。婴幼儿在爬行的时候，会努力抬头，四肢、手眼的协调能力得到训练。没有爬行经历的孩子，长大以后手可能会不听指挥，注意力不集中，写作业时过慢。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　三、缺少正规教育的影响。进过幼儿园的幼儿，活泼、开朗、易合群、守纪律、讲礼貌。而家居幼儿就显得过分害羞、怕见人，在陌生环境中难以适应。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　四、强制学习的影响。现在有些家长有意识地让几岁的孩子背诗词、字典、地图等，有专家认为，孩子3岁之前，不应该进行这些机械记忆训练。儿童的大脑容量是有限的，3岁之前，应该着重发展孩子的适应能力、语言能力、想像力等，而不是机械记忆。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　五、教育方法的影响，如父母对孩子溺爱迁就、百依百顺，使幼儿形成骄傲、自私、任性等不良性格；另一种是采用打、骂、吓、关等教育。尤其是父母的教养态度矛盾，更会使孩子发生<A class=innerlink href=\"http://www.chinajs120.com/html/xljk/yichangxinli/\" target=_blank>心理问题</A>。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">　　六、家庭气氛的影响，家庭和睦程度越差，儿童心理健康状况越差。不和睦的家庭或父母离异，使幼儿不知所措，或失去应有的爱抚，容易形成自卑、抑郁、性格古怪、急躁等反常心理。</SPAN></SPAN></P>', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('28', '健康养生详细信息', '养生知识', '&nbsp;&nbsp;&nbsp; 现在<STRONG>老年朋友</STRONG>对自己的<STRONG>健康</STRONG>十分在意，毕竟有再多的金钱也买不回健康的身体。&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;某医生在医院上班接诊过程中与社区里许多老年朋友沟通过程中发现，在他们日常健康养生中，存在很多健康误区。这些健康误区他们根本无法留意到，但是却损害他们的健康。 <BR>　　<STRONG>早餐要吃好</STRONG> <BR>　　早餐不可简单对付，早餐不吃或者吃不好容易使中老年朋友感到精力不够、头晕眼花，长时间下去易造成贫血、抵抗力下降影响身体健康。　　 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <STRONG>饮食要清淡</STRONG> <BR>　　饮食过于油腻、过咸容易诱发三高及心血管疾病的发生。饮食过辣容易诱发内火过大，影响身体健康。 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <STRONG>注意肠胃消化</STRONG> <BR>　　中老年朋友健康养生在饮食量上也要进行控制，不要吃过太饱，少抽烟喝酒。进食要细嚼慢咽这样一来可以帮助食物被充分消化吸收，二来帮助牙齿进行咀嚼防治掉牙。&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<STRONG>少吃甜食 <BR></STRONG>　　尽量少吃过甜的食物，食物过甜可抑制身体对蛋白质的充分吸收，使血糖升高。对于糖尿病患者尤其不可吃甜食。另外，食物过甜容易使牙齿发生龋齿。 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <STRONG>关注自己口腔健康 <BR></STRONG>　　重视自己的口腔卫生习惯，许多中老年朋友没有口腔保健意识。大家要坐到早起刷牙、睡前刷牙、饭后漱口、少用牙签、定期洗牙。 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <STRONG>夏天要常洗澡，冬季则要少洗澡 <BR></STRONG>　　夏天要常洗澡，运动后不可马上洗澡防止身体水分流失造成虚脱；冬季则要少洗澡，防止皮肤干燥瘙痒。 <BR>', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('29', '浅谈“薄衣御寒”的冬季养生之道', '养生知识', '冬季养生保健，“薄衣御寒”也是不错的养生保健之道。下面，小编为大家介绍冬季薄衣御寒的具体注意事项，关注养生保健的你千万不要错过。\r\n<P>　　●过度保暖反而会降低身体的免疫力，让人长期处于“温室花朵”的状态，变得脆弱而易病。</P><!--advertisement code begin--><!--advertisement code end-->\r\n<P>　　●“薄衣御寒”也属于养生之道，体质热者、小儿可适当挨冻，但要注意耐寒的同时别受风寒。</P>\r\n<P>　　日子一天天流逝，眼见已悄悄跨过农历“大雪”，朝着“冬至”一步步迈进。</P>\r\n<P>　　防寒保暖??这是西医尤其是心血管科、急诊科、儿科、呼吸科医生们每年冬季必要跟病患们反复念叨的四字箴言。然而也有专家提出，对于体质偏热者，或是没有心血管问题在身的老年人，以及青少年儿童，冬天循序渐进地适当“冻一冻”反而有助于增强免疫力。</P>\r\n<P>　　寒冷并不可怕，对环境的适应是人类的本能。挨冻和保暖并非完全的医学歧义，而是针对不同体质、年龄、身体条件的人群，提出的具体个性化要求，‘冻’并非人人能接受，相应的，‘暖’也不见得对每个人都有好处。过度保暖反而会降低身体的免疫力，让人长期处于‘温室花朵’的状态，变得脆弱而易病。“薄衣御寒”也属于养生之道，但如何在锻炼耐寒的同时别受风寒，确实是门技术活。</P><STRONG>　　小儿</STRONG> <STRONG>　　少穿一件好过多穿一件</STRONG> \r\n<P>　　别说冬天，就是春秋季节，也经常可以看到很多父母喜欢将孩子紧紧‘捂住’，似乎永远都比大人多穿一件或多盖一层，生怕孩子一不小心受凉感冒。</P>\r\n<P>　　日本儿童从很小就开始尝试身着短裤或者超短裙度过秋冬天了，虽然我们不提倡寒冷气候下露出膝关节，但这种观念还是可以借鉴的??婴幼儿脱离母体后，需要逐渐适应外界寒暖的变化，自己调节体温，如果从襁褓中就开始过度保暖不抗冻，日后会更加娇弱，罹患感冒的几率更大。</P>\r\n<P>　　青少年儿童正处于生长发育的高峰期，身体新陈代谢的速度远比成人快，所以体表热能挥发很大，这也是为什么孩子稍一活动就满身大汗的原因。如果衣服穿得过多，出汗不断而又未及时更衣的话，体液过度消耗，寒风一吹冷却下来，反而可能生病。</P>\r\n<P>　　所以对于青少年儿童来说，家长大可不必过于小心呵护，让其衣着轻便一点更好，即使偶尔感冒也不要太过紧张，毕竟广州的冬天并不算寒冷，如果他的机体从小就适应了一定的冷空气刺激，对于其日后习惯性抵御严寒大有裨益。而且这样能逐步提高孩子皮肤和鼻黏膜的耐寒力，对未来强身健体也有好处。</P>\r\n<P>　　不过，儿童的头部、胸部等部位如果“捂”多了容易心烦、内热，但孩子的腹部却一定要注意保暖，这是因为很多儿童存在脾胃较虚现象，当冷空气直接刺激腹部时，可能引起腹痛，从而损伤脾胃功能，使脾胃不能正常稳定运转。所以，“肚暖”依然是孩子冬天保健的重要一环。</P><STRONG>　　老人</STRONG> <STRONG>　　晨练或冬泳别太猛</STRONG> \r\n<P>　　虽然冬泳的确能强身健体，但还没有过此类经验的老人千万别轻易尝试，以免身体适应不了突然的冷刺激而生病。</P>\r\n<P>　　“防寒保暖”并非适用于所有老年人，对于没有心血管疾病如高血压、动脉粥样硬化的老年人而言，同样可以尝试抗寒锻炼。冬泳在我国南北方都有一定的群众基础，经常可以看到年过七旬的老者腊月里依然赤膊畅游。</P>\r\n<P>　　但每年送医的冬泳爱好者也不在少数，这类较为极端的抗寒锻炼，对于游泳技术一般，或是平时都习惯了用热水洗脸洗澡、从未尝试过冷水浴的人来说，实在不宜轻易尝试。专家介绍，耐寒锻炼必须循序渐进，不应随意挑战自己没有把握的极限强度。</P>\r\n<P>　　冬季晨练也要讲究个人条件，夏天每天爬山的人，不见得适合冬天上山。如果曾发生过面瘫或心血管疾病，以及有哮喘、咳嗽在身的老者，最好不要在清晨较寒冷时进行户外锻炼，而且山上温度较低，越发增加患病风险。</P>\r\n<P>　　如想“驯服”低温气候，身体健康的老人可从凉水洗脸、洗手做起，长此以往可增强抵抗力，减少感冒次数。而在“驯服”冷的过程中，老人会自然地增加耗氧量、提高基础代谢率，高水平的产热功能甚至可持续几个月之久，这对于延年益寿都有好处。</P><STRONG>　　体质偏热者</STRONG> <STRONG>　　较气虚阳虚者更适合耐寒训练</STRONG> \r\n<P>　　从中医角度分析，体质偏热的人群，较体质寒凉、气虚阳虚者，显然更适合进行耐寒训练。寒冷对前者是可利用的，对后者却是一种威胁。</P>\r\n<P>　　体质偏热者，受到同等程度的寒冷刺激时不会感到不适，反而会觉得很自在；而对于体质寒凉者来说，一旦稍受冷刺激，就可能产生腹泻、腹痛等诸多消化道反应。</P>\r\n<P>　　但凡本身就属于气虚阳虚的人群，不要违背自身客观条件而苛求耐寒训练，而对于体质偏热者，可以充分通过适当的穿薄衣、用凉水洗脸或擦身、多到冷空气环境锻炼等方式，在冬天进一步增强心肌功能和机体自控能力，人体血管弹性也会由此增强，血液流量增多，从而改善冠状动脉的供血，同时还可借此改善神经系统和内分泌系统的调节功能。</P>', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('30', '大学有必要开设心理健康教育课程', '养生知识', '&nbsp;据统计最近几年大学生自杀事件急剧增加，前几天一所大学又发生了跳楼事件，引起了不小的骚动。这一事件让很多人感触很深，现在有很多人身患疾病还顽强的活下去，为什么这些拥有花样年华的学生要选择自杀来结束生命，这也表明了大学开设<B><A class=innerlink href=\"http://www.chinajs120.com/html/xljk/\" target=_blank>心理健康</A>教育</B>课程的必要性。 \r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 大学生容易出现的心理障碍：</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; （1）自卑心理：自卑是人际交往的大敌。自卑的人悲观、<A class=innerlink href=\"http://www.chinajs120.com/html/yiyuzheng/\">忧郁</A>、孤僻、不敢与人交往，认为自己处处不如别人，性格内向，总觉得别人瞧不起自己。这类人主要是由以下几种原因引起：过多的自我否定、消极的自我暗示、挫折的影响和心理或生理等方面的不足。像有的学生身材矮小、相貌丑陋、出身低微、学习差等等。这种同学在学校中为数不少，这就加大了学生管理的难度和学校教育的管理力度。怎么样才能让学生改正这种心理呢？首先，要教育学生采用积极的态度来面对，让他们正确的认识自己，提高自我评价，自卑心理的形成主要来源于社交中不能正确认识自己和对待自己。其次，要引导学生采用“阿Q”精神胜利法，人无完人、金无足赤，学会积极与人交往，增强自信，任何一个交际高手都不是天生的。</SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; （2）孤独心理：孤独是一种感到与世隔绝、无人与之进行情感或思想交流、孤单寂寞的心理状态。孤独者往往表现出萎靡不振，并产生不合群的悲哀，从而影响正常的学习、交际和生活。这类学生主要由以下几种原因引起：性格、过于自负和自尊、挫折。有句话说的好：水至清则无鱼，人至察则无友。自尊、自负、自傲都会引起孤独的产生；还有一种人比较容易孤独，那就是“喜欢做语言上的巨人、行动上矮子的人！” 怎么样才能够改变这种心理呢？首先要把自己融与集体中，马克思说过：只有在集体中，个人才能获得全面发展的机会！一个拒绝把自己融入集体的人，孤独肯定格外垂青他！其次要克服自负、自尊和自傲的心态，积极参加交往。当一个人真正的感到与他人心理相融、为他人所理解和接受时，就容易摆脱这种孤独误区了！<BR>&nbsp;<BR>&nbsp;&nbsp;&nbsp; （3）嫉妒心理：嫉妒是在人际交往中，因与他人比较发现自己在才能、学习、名誉等方面不如对方而产生的一种不悦、自惭、怨恨甚至带有破坏性的行为。特点是：对他人的长处、成绩心怀不满，抱以嫉妒；看到别人冒尖、出头不甘心，总希望别人落后于自己，嫉妒还有一个特点：就是没有竞争的勇气，往往采取挖苦、讥讽、打击甚至采取不合法的行动给他人造成危害。这种情况严重阻碍了大学生的心理健康和交际能力，给大学生成人和成才带来了莫大的困难，因为嫉妒会吞噬人的理智和灵魂，影响正常思维，造成人格扭曲！有嫉妒心的人应多从提高自身修养方面上下工夫，多转移注意力，积极升华自己的劣势为优势，采取正当、合法和理智的手段来消除这一心理。</SPAN></SPAN></P>', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('31', '摆脱心理障碍的方法有哪些', '养生知识', '&nbsp; 随着社会竞争力的加大，生活压力的倍增，越来越多的人有<B>心理障碍</B>，因此找到一种比较好的摆脱心理障碍的方法很必要也为很多人所需要，那么到底有没有可以缓解心理障碍的方法呢？大家应该怎么去做呢？这些方法真的可以缓解社会压力吗？下面就为您进行简单介绍。 \r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 这是个什么方法呢？其实它是太简单，简单到你可能不会认为它是个好方法，它才会从我们眼前溜走。我们喜欢把问题复杂化，我们的本能使我们认为简单的东西更不正确。所以才有禅宗里的棒喝，就是师父拿着根木棒要逼徒弟领悟，就是说这么简单的东西你还不知道。 </SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 这个方法就是“接纳”。就是诚心接纳你所有的感觉，感受，想法，行为，痛苦，害怕，高兴等等一切。就这么简单。要注意是一切，不管再怎么痛苦，再怎么难受，再怎么不合理，都接受它，接纳了，你就会好。在接纳的同时，你也可以观察自已的心理到底在想什么，去感觉自已的感受，就好象看另外一个人一样。这就好象佛教里的俗语，“观照”和“觉知”。当然，你没去想怎样接纳，你也可以是在接纳。 <BR>这个方法对于正常人，对于有心理障碍的人都是一样有用的。其实所谓正常人和不正常人的区分界限是不大的，甚至就在一念之间。 </SPAN></SPAN></P>\r\n<P><SPAN style=\"FONT-SIZE: 14px\"><SPAN style=\"FONT-FAMILY: 宋体\">&nbsp;&nbsp;&nbsp; 当接纳时，我们的心理反而慢慢不再对抗了，这时我和我们的心理成为一体了，就象“无我”那样。有一个典故，有人问佛，我为什么烦恼呢，佛跟他解释后，他立即顿悟了，佛大概的意思就说，是你自已在烦，是你自已一直在纠缠你的心，本来你是不烦的，你为什么要去纠缠它呢，也就是说你接纳你的烦恼，你就不会烦了。所以也有个典故，神秀说“身是菩提树，心如明镜台，时时勤拂拭，勿使惹尘埃”，惠能就说，“菩提本无树，明镜亦非台，本来无一物，何处惹尘埃”，这样惠能得到了师父的衣钵。勤拂拭正是自已没有必要的纠缠。所以佛教常常以小故事来启发人们。 </SPAN></SPAN></P>', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('32', '养生大师今后上岗将持证 避免“伪专家”的出现', '养生知识', '继新闻出版总署宣布对养生保健类出版物实行资质准入制度之后，从事养生保健工作的人员也将持证上岗。昨日，记者从人力资源和社会保障部中国就业培训技术指导中心(CETTIC)获悉，该中心将于近日推出全国首届食疗养生和养生管理师培训班，学员最终将获该中心颁发的《养生管理师证书》、《食疗养生师证书》，证书将在全国通用。\r\n<P>　　据了解，近年来，养生保健成为很多市民的生活追求，数不清的养生大师、食疗专家借助于书籍、电视、广播等各种媒介，宣讲各类养生之道。但从“盖世华佗”胡万林、“地瓜博士”林光常再到“名医”张悟本等的“神话破灭”，市民们陷入无所适从。同时，记者调查发现，各式各样的养生保健机构依旧过着没有证书，没有监管的悠闲日子。多数美容、保健机构通常会打出“中医”招牌，但这些机构里从事中医项目服务的都是一般美容师，只是对中医懂些“皮毛”，就开始对消费者进行养生方面的“宣讲”。</P>\r\n<P>　　对此，CETTIC相关负责人表示，国家已经下决定出“重拳”对养生保健行业进行整顿。包括保健养生行业规范管理的试行标准有望年底前出台，将对保健养生机构的审批、人员的准入和服务的内容进行规范，包括新闻出版总署也宣布对养生保健类出版物实行资质准入制度。“为了提高我国养生保健从业人员的职业素质和技能水平，使养生管理从业人员培训工作能够规范化、标准化、系统化地展开，我们目前已经编写出养生保健系列(养生管理、食疗养生)职业培训教材，并委托九品源健康养生院在本月推出全国首届食疗养生和养生管理师资培训班。”该负责人说。</P>\r\n<P>　　据悉，培训班对报名者的学历、从业经验皆有要求。报名养生管理师要求具有相关专业专科学历，连续从事养生保健工作2年以上；或具有相关专业中级或以上专业技术职业任职资格；食疗养生师要求具有大专以上学历，或医药相关专业毕业、从事中医养生/营养保健工作1年以上者；在中医养生、饮食营养等领域有突出表现者，级别申报时可以适当放宽学历要求。经统一考试及专家评审团面试审核合格后，由CETTIC颁发相应的《养生管理师证书》或《食疗养生师证书》。而该证书将作为养生保健业从业人员的岗位从业凭证及国家职业技能培训与鉴定的证明，全国通用。<BR>　从业前景</P>\r\n<P>　　养生管理师及食疗养生师的就业方向辐射面都很广，养生管理师要比医生和健康管理师更容易开展工作。而随着餐饮、食品、保健和养生企业都开始着力开发食疗、养生、营养菜系和产品时，食疗养生师则成为抢手人才。</P>\r\n<P>　　据了解，养生管理师在健康保险公司、健康养生管理公司、医院保健及健康管理部门、医院或非医疗机构的养生保健部门、大型企业卫生和保健部门，以及养生保健教育、研究机构和相关产品生产、营销企业等均可谋职。而各类健康产业公司和高级养生会所、政府及部队疗养院、养生餐饮业、医院或非医疗机构的养生保健部门、社区相关食品卫生保健服务中心、幼儿园及大中专院校的营养配餐部门以及健康养生管理公司、养生保健培训教育、相关产品的生产及营销企业、养生文化传播公司等，都属于食疗养生师的就业领域。</P>\r\n<P>　　从事工作</P>\r\n<P>　　养生管理师及食疗养生师均关注于某个个体或某类人群。养生管理师就是利用中医体质养生理论和传统养生保健技术，对个人或群体健康养生分析、咨询、评估、干预、调理，制定针对不同体质类型人群的个性化养生综合服务方案并指导其实施，以有助于实现体质平衡协调，实现提升国人身心健康水平和生活质量。</P>\r\n<P>　　而食疗养生师，结合中医体质学理论和中国传统饮食调养技术，指导不同体质类型的某个人或某类群体如何吃得健康、吃得药效可达到事半功倍。而这些对于预防、减轻慢性病至关重要。<BR></P>\r\n<P>　　对话</P>\r\n<P>　　注重实践确保培训质量</P>\r\n<P>　　出场专家：CETTIC养生管理师、食疗养生师职业培训管理办公室孙昌杰主任</P>\r\n<P>　　记者：CETTIC为何推出养生保健系列职业培训项目？</P>\r\n<P>　　孙昌杰：随着养生保健机构的正规化，社会和市场都急需大批经过系统、全面、专业培训的养生专业人才来规范、支撑健康产业。同时，《中医体质分类与判定》标准正式发布，也为实施个体化诊疗、个性化养生综合服务提供了理论和实践支持。</P>\r\n<P>　　记者：两类证书的出现，是否意味着今后养生保健人员必须持证上岗？</P>\r\n<P>　　孙昌杰：由CETTIC颁发《养生管理师证书》或《食疗养生师证书》，将作为养生保健业从业人员的岗位从业凭证，全国通用。随着保健养生行业规范管理试行标准的出台，从业人员将有望持证方能上岗。</P>\r\n<P>　　记者：养生毕竟是件“慢功出细活”的事，现在已经有这么多的伪专家，那如何保证上述证书的含金量呢？</P>\r\n<P>　　孙昌杰：推出这两个证书，正是为了教会从业者真正的中医养生之道。因此，首先我们严把了教材关。教材中糅合了中医体质养生理论的最新研究成果以及传统的养生保健技术，尤其突出养生管理师实践所需的素质和能力的培训与训练。通过体验式学习，真正感受并掌握养生管理的技能。</P>\r\n<P>　　同时，还将特聘中国中医科学院、北京中医药大学及业内的资深专家执教，包括教材的编写者。此外，学员要通过笔试、面试两关之后，方能取得证书，这都保证了学员所学到的都是真科学。<BR></P>\r\n<P>　　链接</P>\r\n<P>　　“伪专家”代表</P>\r\n<P>　　张悟本</P>\r\n<P>　　著有畅销书《把吃出来的病吃回去》。书中宣扬“绿豆治百病大法”引起争议,2010年5月被指学历造假，之后卫生部否认其“卫生部首批高级营养专家”的身份。2010年6月，张悟本食疗“根据地”的悟本堂被定性为违章建筑，于深夜被摘除牌匾拆迁。</P>\r\n<P>　　林光常</P>\r\n<P>　　台湾人，所出《无毒一身轻》曾风靡一时，大肆推广“牛奶是牛喝的，不是人喝的”，“每天吃一个红薯可以保证不得癌”。忽悠癌症患者别化疗，要吃他的排毒餐。2008年被判入狱。</P>\r\n<P>　　刘太医</P>\r\n<P>　　《刘太医说：病是自家生》的作者，自称是明朝太医刘纯的后裔，是中国唯一的瘤科世家，是科学与医学双博士学位。认为吃肉会老得快，吃豆腐对身体不好，最好不吃晚饭。2008年底被拘押。</P>\r\n<P>　　胡万林</P>\r\n<P>　　1995年起盛极一时的“盖世华佗”，号称人生百病皆因水，病了的人就该用芒硝强行“脱水”，结果导致多人死亡，被捕入狱。</P>', 'hsg', '2017-04-03 15:29:32', '', '1', null);
INSERT INTO `xinwentongzhi` VALUES ('33', 'fdadf', '优惠活动', 'adfafd', 'hsg', '2017-04-03 15:50:35', '', '1', null);

-- ----------------------------
-- Table structure for `yonghuzhuce`
-- ----------------------------
DROP TABLE IF EXISTS `yonghuzhuce`;
CREATE TABLE `yonghuzhuce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(50) DEFAULT NULL,
  `diqu` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `zhaopian` varchar(50) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `issh` varchar(10) DEFAULT '否',
  `shouji` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of yonghuzhuce
-- ----------------------------
INSERT INTO `yonghuzhuce` VALUES ('26', '555', '555', '何升高', '男', '浙江', 'gsgs@163.com', 'uploadfile/13392103902z4y.jpg', '2016-02-19 07:46:56', '是', '32235643');
INSERT INTO `yonghuzhuce` VALUES ('27', 'leejie', 'leejie', '李龙', '男', '湖北', 'fege@126.com', 'uploadfile/1339211863x4s3.jpg', '2016-02-19 07:46:56', '是', '65754745');
INSERT INTO `yonghuzhuce` VALUES ('28', 'mygod', 'mygod', '陈德才', '男', '河南', 'gshf@yahoo.com', 'uploadfile/1339211824lezl.gif', '2016-02-19 07:46:56', '是', '53464373');
INSERT INTO `yonghuzhuce` VALUES ('29', 'xwxxmx', 'xwxxmx', '吴江', '女', '北京', 'jrjtr@163.com', 'uploadfile/1339211786gts3.jpg', '2016-02-19 07:46:56', '否', '52356474');
INSERT INTO `yonghuzhuce` VALUES ('30', '888', '888', '张三', '男', '北京', 'dafd@adfda.com', 'uploadfile/1491205710bedo.jpg', '2017-04-03 15:48:32', '是', null);

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) DEFAULT NULL,
  `wangzhi` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('16', '百度', 'http://www.baidu.com', '2016-02-19 07:46:56', 'uploadfile/baidu.gif');
INSERT INTO `youqinglianjie` VALUES ('17', '谷歌', 'http://www.google.cn', '2016-02-19 07:46:56', 'uploadfile/google.png');
INSERT INTO `youqinglianjie` VALUES ('18', '新浪', 'http://www.sina.com', '2016-02-19 07:46:56', 'uploadfile/sina.gif');
INSERT INTO `youqinglianjie` VALUES ('19', 'QQ', 'http://www.qq.com', '2016-02-19 07:46:56', 'uploadfile/qq.jpg');
INSERT INTO `youqinglianjie` VALUES ('20', '网易', 'http://www.163.com', '2016-02-19 07:46:56', 'uploadfile/163.png');
