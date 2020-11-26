/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : jspmsjjgkcfzjxxtns56a9

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-04-23 21:44:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `allusers`
-- ----------------------------
DROP TABLE IF EXISTS `allusers`;
CREATE TABLE `allusers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `cx` varchar(50) DEFAULT '普通管理员',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allusers
-- ----------------------------
INSERT INTO `allusers` VALUES ('2', 'admin', 'admin', '超级管理员', '2019-04-23 17:31:02');

-- ----------------------------
-- Table structure for `bankuai`
-- ----------------------------
DROP TABLE IF EXISTS `bankuai`;
CREATE TABLE `bankuai` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) DEFAULT NULL,
  `mingcheng` varchar(50) DEFAULT NULL,
  `jianjie` varchar(255) DEFAULT NULL,
  `banzhu` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bankuai
-- ----------------------------
INSERT INTO `bankuai` VALUES ('2', '002', 'B版块', 'grhhh', 'xwxxmx', '2017-03-04 10:42:17');
INSERT INTO `bankuai` VALUES ('3', '003', '学生交流', 'jgoew', 'mygod', '2017-03-04 10:42:30');
INSERT INTO `bankuai` VALUES ('4', '004', '师生交流', 'ogrioeg', 'leejie', '2017-03-04 10:42:49');

-- ----------------------------
-- Table structure for `dx`
-- ----------------------------
DROP TABLE IF EXISTS `dx`;
CREATE TABLE `dx` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `leibie` varchar(50) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx
-- ----------------------------
INSERT INTO `dx` VALUES ('1', '系统公告', '<P>&nbsp;&nbsp;&nbsp; 欢迎大家登陆我站，我站主要是为广大朋友精心制作的一个系统，希望大家能够在我站获得一个好心情，谢谢！</P>\r\n<P>&nbsp;&nbsp;&nbsp; 自强不息，海纳百川，努力学习！</P>');
INSERT INTO `dx` VALUES ('2', '系统简介', '系统简介');
INSERT INTO `dx` VALUES ('3', '课程介绍', '1、尊重孩子的选择<br/>\r\n\r\n家长切记，不要用自己的思想来衡量孩子，不要你认为该学什么就学什么，现在的孩子都有自己的思想和主见，如果家长过度强势，强迫孩子做自己不感兴趣的，会伤害孩子的自尊心，产生逆反心理，得不偿失。<br/>\r\n\r\n2、选择辅导班要有针对性<br/>\r\n\r\n家长可以通过与孩子沟通交流，发现孩子的薄弱之处，适当建议孩子参加合适的辅导班。这样，孩子在沟通中参与家教辅导，事半功倍。<br/>\r\n\r\n3、不要轻信广告<br/>\r\n\r\n各种家教班的宣传单页满天飞，广告诱人。很多辅导班以各种优惠方式吸引家长送孩子去参与辅导班。真正到上课时发现只是一个看孩子的“托儿所”。花了钱还浪费了时间，得不偿失。<br/>\r\n\r\n4、通过实地考察选择家教班<br/>\r\n\r\n家长们完全不需要着急，家教班一般会上课一个月左右，每个辅导班都愿意随时招学生进来，所以家长们完全不需要着急，到家教班正式开课时实地考察一下，甄别是否能真正学到知识。<br/>\r\n\r\n5、看自己的目的选择辅导班<br/>\r\n\r\n如果本就打着让人看孩子的目的，那就不需要怎么刻意选择了。<br/>\r\n\r\n如果是打算让孩子学些知识就要认真选了，不然选错了，自己会有很大的失落感。<br/>\r\n\r\n6、做好长期打算，从小培养某一特长式辅导<br/>\r\n\r\n比如让孩子学习钢琴等，要从小学习，长期锻炼才能形成特长的需要长期打算，从开始就要找到合适的家教班，以后就不用每年找辅导班了。<br/>\r\n\r\n7、选择合适的老师教学<br/>\r\n\r\n有的家教班，教的就是小学课程而已，打出个广告说什么特聘请大学老师授课，有用吗？高射炮打蚊子，不懂行的家长很容易被忽悠，其实老师教学的套路与教学阶段、学生学习知识的方式是分不开的，大学的教学套路肯定不适合小学生的学习。<br/>\r\n\r\n8、选择正规学校<br/>\r\n\r\n一定要选择正规的辅导机构，首先查看这个整个机构有没有办学资质，师资力量如何，在辅导培训行业口碑是否良好。<br/>\r\n\r\n9、选择品牌学校<br/>\r\n\r\n品牌学校因为开办比较久，投入精力和资金比较多，注重教学质量和口碑，不会轻易安排不合格的教师。<br/>\r\n\r\n10、不去“临时班”<br/>\r\n\r\n其实，这种培训班风险很大。培训和学校授课是不同的方式，而且整个课程要进行细致地规划和研究。如果每个老师临时搭配，就算他们都是教学专家，也很难保证很好的教学效果。<br/>\r\n\r\n11、多处打听，亲自核实<br/>\r\n\r\n家长应该多向有过经验的家长多打听哪个机构的老师好，负责任。不少机构存在夸大宣传办学成果问题，家长不要轻易相信，应该亲自查看其宣传材料：如果该机构的成功案例不敢具名，那么多半是虚假宣传。像本校是一直坚持在网站公布详细就读信息的，确保有据可查。<br/>\r\n\r\n12、孩子的辅导是个性化的<br/>\r\n\r\n好的家教班最好是个性化的，能根据孩子的特殊情况进行1对1计划和辅导，同时也是一个循序渐进的过程，过分夸大效果的一般不可信。<br/>\r\n\r\n13、能旁听实时监督孩子学习很重要<br/>\r\n\r\n一般有实力的辅导机构会允许家长旁听，以便家长了解孩子的学习情况和老师的教学学习进度掌握情况。 <br/>');
INSERT INTO `dx` VALUES ('18', '�γ̽���', '�γ̽���');
INSERT INTO `dx` VALUES ('19', '?��????', '?��????');
INSERT INTO `dx` VALUES ('20', '???????', '???????');
INSERT INTO `dx` VALUES ('21', 'ϵͳ����', 'ϵͳ����');
INSERT INTO `dx` VALUES ('22', '??????', '??????');

-- ----------------------------
-- Table structure for `jiaoshizhuce`
-- ----------------------------
DROP TABLE IF EXISTS `jiaoshizhuce`;
CREATE TABLE `jiaoshizhuce` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `gonghao` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(50) DEFAULT NULL,
  `chushengnianyue` varchar(50) DEFAULT NULL,
  `gongling` varchar(50) DEFAULT NULL,
  `zhiji` varchar(50) DEFAULT NULL,
  `shouji` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `dizhi` varchar(255) DEFAULT NULL,
  `touxiang` varchar(50) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jiaoshizhuce
-- ----------------------------
INSERT INTO `jiaoshizhuce` VALUES ('1', '001', '001', '陈卫国', '男', '2017-04-11', '8', '高级', '18988576978', '5837895@qq.com', '浙江宁波', 'upload/1490976932890.jpg', '的萨达萨达发', '2019-04-01 00:15:35');
INSERT INTO `jiaoshizhuce` VALUES ('2', '002', '002', '刘琳琳', '女', '2017-04-11', '5', '高级', '13367752235', '239865@qq.com', '江苏南京', 'upload/1490977011004.jpg', '的盛大发售发送到', '2019-04-01 00:16:53');
INSERT INTO `jiaoshizhuce` VALUES ('3', '004', '004', '王伟', '男', '2017-04-12', '5', '高级', '13858867732', '235@qq.com', '安徽合肥', 'upload/1490977211540.jpg', '是的的飒飒大幅是打发点双方都是', '2019-04-20 14:53:10');
INSERT INTO `jiaoshizhuce` VALUES ('4', '007', '007', '吴芬', '女', '2017-04-03', '10', '高级', '18988576978', '5837895@qq.com', '浙江宁波', 'upload/1490980327210.jpg', '是的发送到防守打法', '2019-04-01 01:12:10');
INSERT INTO `jiaoshizhuce` VALUES ('5', '0077', '123456', '张山峰', '男', '2019-04-01', '9', '高级', '1878343847', '23@qq.com', '', '', '', '2019-04-23 20:07:27');

-- ----------------------------
-- Table structure for `kejianxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `kejianxinxi`;
CREATE TABLE `kejianxinxi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `kejianbianhao` varchar(50) DEFAULT NULL,
  `kejianmingcheng` varchar(255) DEFAULT NULL,
  `leixing` varchar(50) DEFAULT NULL,
  `neirong` varchar(50) DEFAULT NULL,
  `kejianjianjie` varchar(255) DEFAULT NULL,
  `shangchuanren` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `issh` varchar(2) DEFAULT '否',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kejianxinxi
-- ----------------------------
INSERT INTO `kejianxinxi` VALUES ('1', '04010034321621', '[小学四年级语文课件] 2010《鸟的天堂》课件 ', '课件', 'upload/1490978085147.zip', '法规和法国发过火法国高峰', '001', '陈卫国', '是', '2019-04-23 17:59:35');
INSERT INTO `kejianxinxi` VALUES ('2', '04010034551375', '[初中三年级数学课件] 反比例函数的图像与性质', '视频', 'upload/1490978117333.wmv', '法规和法国发过火个', '001', '陈卫国', '是', '2019-04-23 17:59:37');
INSERT INTO `kejianxinxi` VALUES ('3', '04010035211615', '[小学三年级英语课件] UNIT 3, Let\'s lear', '参考资料', 'upload/1490978165340.zip', '和规范化工号发过火规范化个工号不你那么吧', '001', '陈卫国', '是', '2019-04-23 17:59:47');
INSERT INTO `kejianxinxi` VALUES ('4', '04010036137971', '[高中化学课件] 离子浓度大小比较 ', '课件', 'upload/1490978185403.zip', '撒阿萨德撒阿萨德啊阿打算职场资讯在吃', '001', '陈卫国', '是', '2019-04-23 17:59:57');
INSERT INTO `kejianxinxi` VALUES ('5', '04010105201636', '[初中物理课件] 2010年5月电风扇中的物理', '课件', 'upload/1490979931506.zip', '萨达萨达撒地方是的发送到是', '001', '陈卫国', '是', '2019-04-23 18:00:07');
INSERT INTO `kejianxinxi` VALUES ('6', '04010105357813', '亲亲我群二请问', '参考资料', 'upload/1490979944313.zip', '阿达阿萨斯啊萨达', '001', '陈卫国', '是', '2019-04-01 01:05:47');
INSERT INTO `kejianxinxi` VALUES ('7', '04010105471696', '[初中一年级生物课件] 七年级科学新生命的诞生', '参考资料', 'upload/1490979956138.zip', '政策性支持下自治县小区问', '001', '陈卫国', '是', '2019-04-23 18:00:18');
INSERT INTO `kejianxinxi` VALUES ('8', '04010106062146', '[高中二年级历史课件] 八国联军侵华战争 ', '视频', 'upload/1490979982144.wmv', '只负责相册助学自行车行注册萨达撒', '001', '陈卫国', '是', '2019-04-23 18:00:32');
INSERT INTO `kejianxinxi` VALUES ('9', '04010106302050', '[高中一年级政治课件] 2010年5月正确对待金钱 ', '参考资料', 'upload/1490980004575.zip', '的反反复复多过地方梵蒂冈地方给对方', '001', '陈卫国', '是', '2019-04-23 18:00:46');
INSERT INTO `kejianxinxi` VALUES ('10', '04232013401300', '英语第六单元预习', '参考资料', 'upload/1556021652955.png', '这节课主要是学习特殊语法', '0077', '张山峰', '否', '2019-04-23 20:14:30');

-- ----------------------------
-- Table structure for `liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cheng` varchar(50) DEFAULT NULL,
  `xingbie` varchar(2) DEFAULT NULL,
  `QQ` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `neirong` varchar(255) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `huifuneirong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liuyanban
-- ----------------------------

-- ----------------------------
-- Table structure for `tiezi`
-- ----------------------------
DROP TABLE IF EXISTS `tiezi`;
CREATE TABLE `tiezi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bankuai` varchar(50) DEFAULT NULL,
  `biaoti` varchar(50) DEFAULT NULL,
  `leixing` varchar(50) DEFAULT NULL,
  `neirong` varchar(50) DEFAULT NULL,
  `faburen` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fid` int(11) DEFAULT '0',
  `fujian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tiezi
-- ----------------------------
INSERT INTO `tiezi` VALUES ('21', '师生交流', 'sdfsd dsf ', 'putong', 'sdff sdf dsf ', '001', '2019-04-01 01:01:58', '0', '');
INSERT INTO `tiezi` VALUES ('24', '师生交流', '的飒飒大幅方的说法是到', 'qiuzhu', '豆腐干豆腐地方的丰富的', '555', '2019-04-01 01:12:38', '0', '');
INSERT INTO `tiezi` VALUES ('25', 'B板块', '大家好，我需要四年级数学教材，请问谁有？', 'putong', '大家好，我需要四年级数学教材，请问谁有？大家好，我需要四年级数学教材，请问谁有？', 'student', '2019-04-23 20:59:00', '0', '');
INSERT INTO `tiezi` VALUES ('26', 'B板块', '2342', 'putong', 'asdf ', 'student', '2019-04-23 20:59:02', '0', '');

-- ----------------------------
-- Table structure for `xinwentongzhi`
-- ----------------------------
DROP TABLE IF EXISTS `xinwentongzhi`;
CREATE TABLE `xinwentongzhi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) DEFAULT NULL,
  `leibie` varchar(50) DEFAULT NULL,
  `neirong` longtext,
  `tianjiaren` varchar(50) DEFAULT NULL,
  `shouyetupian` varchar(50) DEFAULT NULL,
  `dianjilv` int(11) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinwentongzhi
-- ----------------------------
INSERT INTO `xinwentongzhi` VALUES ('1', 'BIM等级考试课程（二级建筑）--所用素材', '辅助资料', '个人资本跨境投资的冲动逐渐浓郁。\r\n<P>　　温州与上海，两大不同级别的城市，亦就此展开“比拼”式格局。</P><!--advertisement code begin--><!--advertisement code end-->\r\n<P>　　温州暂缓</P>\r\n<P>　　“还有一道手续要补办，据说试点需国务院审批通过。”2月28日，参与制订《温州市个人境外直接投资试点方案》(下称“方案”)的某政府机构官员向记者透露。</P>\r\n<P>　　早在1月7日，方案已对外公布并实施，使得温州成为我国第一个放开个人境外直接投资试点的城市。“只要条件允许的温州户籍市民，都可申请报名个人境外直接投资。”方案表示，单项境外投资额不超过等值300万美元，实施一项境外直接投资，多个投资者联合的总额不超过等值1000万美元。</P>\r\n<P>　　更引人关注的是，仅10余天后，方案“被叫停”的传言四起(见本报1月25日《“第一单难产”：温州个人境外直投试点调查》)。</P>\r\n<P>　　事实上，该方案的出台以地方外经贸系统和金融办主导。方案规定，个人境外投资资金需向外经贸局和外汇管理局同时备份，外汇支局实施资金进出的监管功能。</P>\r\n<P>　　“方案引起了国家外汇管理局的注意，他们打电话到浙江和温州的外汇管理部门，表示方案未经国家外管局批准。”外汇管理系统人士称。</P>\r\n<P>　　央行副行长、国家外汇管理局局长易纲也于近日在中国发展研究基金会“人民币汇率制度改革影响评估”课题成果发布会上公开回应称，该方案“没有履行完程序，目前还处于没有赋予实施的状态”。</P>\r\n<P>　　上海“冲刺”</P>\r\n<P>　　“温州只是补办一个手续而已，有一套正式的批文，”某地外经贸系统官员透露，“而上海据说都没上报。”</P>\r\n<P>　　记者就此向上海金融办核实，相关人士并不否认上海的试点“冲刺”计划，但对于具体进展情况，该人士则表示，“还需中央有关部门批准。”</P>\r\n<P>　　此前已有公开消息称，监管人士曾在“2011年上海市推进国际金融中心建设工作推进小组工作会议”上透露，争取今年上半年在上海试点居民个人境外直接投资。</P>\r\n<P>　　事实上，上海国际金融的配套资源优势，远是温州发达的草根金融无法比拟的。</P>\r\n<P>　　来自上海金融监管机构的数据显示，2009年7月，上海在全国率先开展跨境贸易人民币结算试点。2010年，上海金融市场(不含外汇市场)交易总额386万亿元。个人本外币兑换特许业务试点扩大，试点机构增至4家，网点增至20个。</P>\r\n<P>　　不过，两个城市在个人资金跨境投资方面的“冲动”显得十分统一。</P>\r\n<P>　　温州市外经贸局统计显示，截至2010年底，温州企业境外投资项目635个，总投资额4.54亿美元。</P>\r\n<P>　　上海市商务委公布的最新数据显示，“十一五”(2006~2010年)期间，上海对外投资累计完成58.4亿美元，年均增长28.6%，对外投资的增速已大幅超过实到外资18.4个百分点。</P>\r\nSubstance Painter  中文软件,\r\n\r\n百度网盘下载链接\r\n\r\nhttps://pan.baidu.com/s/1EdBZaXKnipDGuN-ZmwlIpQ\r\n\r\n\r\n3DMAX2018  中文软件，\r\n\r\n百度网盘下载链接\r\n\r\nhttps://pan.baidu.com/s/18rtxQr1n5JENzHcLTLkXGg\r\n\r\n\r\nmaya  中文软件，\r\n\r\n百度网盘下载链接\r\n\r\nhttps://pan.baidu.com/s/1vflf1tZ71hQ7ExQYZCU8OQ\r\n\r\n \r\n\r\n \r\n\r\n－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－\r\n备注 ：\r\n\r\n如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。\r\n\r\n《如何用百度网盘下载文件》：http://n44.51zxw.net/help_loadsc.html', 'hsg', 'upload/1317085910921.jpg', '40', '2019-04-23 17:43:35');
INSERT INTO `xinwentongzhi` VALUES ('2', 'C#入门教程板书', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', 'upload/1317086069593.jpg', '19', '2019-04-23 17:46:47');
INSERT INTO `xinwentongzhi` VALUES ('3', '次世代游戏场景制作教程---所用软件', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', 'upload/1317086056687.jpg', '61', '2019-04-23 17:46:48');
INSERT INTO `xinwentongzhi` VALUES ('4', 'Flotherm散热仿真教程素材', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', 'upload/1317085936937.jpg', '55', '2019-04-23 17:46:49');
INSERT INTO `xinwentongzhi` VALUES ('5', 'vue移动旅游网课程源码', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', 'upload/1317085922265.jpg', '62', '2019-04-23 17:46:49');
INSERT INTO `xinwentongzhi` VALUES ('6', 'SSM框架开发课程板书及源码', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '11', '2019-04-23 17:46:49');
INSERT INTO `xinwentongzhi` VALUES ('7', 'UI交互app及axure设计教程素材', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '65', '2019-04-23 17:46:50');
INSERT INTO `xinwentongzhi` VALUES ('8', '温州两大国资集团开局之年齐发力', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '50', '2019-04-23 17:46:50');
INSERT INTO `xinwentongzhi` VALUES ('9', '焊工\"十不烧\"原则', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '43', '2019-04-23 17:46:50');
INSERT INTO `xinwentongzhi` VALUES ('10', 'SSM框架开发课程板书及源码', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '85', '2019-04-23 17:46:50');
INSERT INTO `xinwentongzhi` VALUES ('11', 'vue移动旅游网课程源码', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '88', '2019-04-23 17:46:51');
INSERT INTO `xinwentongzhi` VALUES ('12', 'C#入门教程板书', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '90', '2019-04-23 17:46:51');
INSERT INTO `xinwentongzhi` VALUES ('13', 'Flotherm散热仿真教程素材', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '100', '2019-04-23 17:46:52');
INSERT INTO `xinwentongzhi` VALUES ('14', '次世代游戏场景制作教程---所用软件', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '95', '2019-04-23 17:46:52');
INSERT INTO `xinwentongzhi` VALUES ('15', 'BIM等级考试课程（二级建筑）--所用素材', '辅助资料', '如果没有使用过百度云盘或不知道如何下载，请先观看这个视频，再下载。', 'hsg', null, '85', '2019-04-23 17:46:54');

-- ----------------------------
-- Table structure for `xueshengdati`
-- ----------------------------
DROP TABLE IF EXISTS `xueshengdati`;
CREATE TABLE `xueshengdati` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `zuoyebianhao` varchar(50) DEFAULT NULL,
  `biaoti` varchar(50) DEFAULT NULL,
  `zuoyeyaoqiu` varchar(50) DEFAULT NULL,
  `tijiaoqixian` varchar(50) DEFAULT NULL,
  `faburen` varchar(50) DEFAULT NULL,
  `datiriqi` varchar(50) DEFAULT NULL,
  `xueshengzuoye` varchar(50) DEFAULT NULL,
  `xuesheng` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `zuoyepigai` varchar(50) DEFAULT NULL,
  `zuoyedianping` varchar(255) DEFAULT NULL,
  `issh` varchar(2) DEFAULT '否',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xueshengdati
-- ----------------------------
INSERT INTO `xueshengdati` VALUES ('1', '04010034016431', '梵蒂冈发', '刚回家工号', '2017-04-05 00:34:22', '001', '2019-04-05', 'upload/1490978399187.zip', '555', '何升高', '无', '', '否', '2019-04-20 16:59:20');
INSERT INTO `xueshengdati` VALUES ('3', '04010107471314', '让他一人头羊肉汤', '认同与云托园', '2017-04-19 01:08:04', '001', '2019-04-05', 'upload/1490980200815.zip', '555', '何升高', '中等', '士大夫士大夫是打发', '是', '2019-04-20 16:59:20');
INSERT INTO `xueshengdati` VALUES ('4', '04010106591525', '梵蒂冈电风扇官方的高峰电饭锅', '挂号费过刚回家 ', '2017-04-25 01:07:14', '001', '2019-04-05', 'upload/1490980390925.zip', '555', '何升高', '无', '', '否', '2019-04-20 16:59:20');
INSERT INTO `xueshengdati` VALUES ('5', '04232010311887', '2019-04-23把课后英语单词抄写3遍', '注意写音标', '2019-05-24 20:11:22', '0077', '2019-04-19 20:27:42', 'upload/1556022474209.txt', 'student', '胡阿尤', '优秀', '完成得非常好', '是', '2019-04-23 20:38:05');

-- ----------------------------
-- Table structure for `yonghuzhuce`
-- ----------------------------
DROP TABLE IF EXISTS `yonghuzhuce`;
CREATE TABLE `yonghuzhuce` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(2) DEFAULT NULL,
  `chushengnianyue` varchar(50) DEFAULT NULL,
  `QQ` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `shenfenzheng` varchar(50) DEFAULT NULL,
  `touxiang` varchar(50) DEFAULT NULL,
  `dizhi` varchar(255) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issh` varchar(2) DEFAULT '否',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yonghuzhuce
-- ----------------------------
INSERT INTO `yonghuzhuce` VALUES ('1', '555', '555', '何升高', '男', '2012-07-08', '429489354', 'gsgs@163.com', '13186835580', '52353253262', 'upload/1333961148718.jpg', '龙港龙翔路1170号', 'mfgmfgmfg', '2019-04-05 00:00:00', '是');
INSERT INTO `yonghuzhuce` VALUES ('2', 'leejie', 'leejie', '李龙', '男', '2012-05-21', '851781333', 'fege@126.com', '63474337', '623632153', 'upload/1333963398718.gif', '温州飞翔路2号', 'htrjrtjr', '2019-04-05 00:00:00', '是');
INSERT INTO `yonghuzhuce` VALUES ('3', 'mygod', 'mygod', '陈德才', '男', '2012-02-02', '870538338', 'gshf@yahoo.com', '9696556', '33253636', 'upload/1333963445546.gif', '杭州四季青广场3号', 'hdhffd', '2019-04-05 00:00:00', '是');
INSERT INTO `yonghuzhuce` VALUES ('4', 'xwxxmx', 'xwxxmx', '吴江', '女', '2012-03-14', '609577616', 'jrjtr@163.com', '34437754', '215323262', 'upload/1333963661093.jpg', '上海浦东区22号', 'gfdhth', '2019-04-05 00:00:00', '是');
INSERT INTO `yonghuzhuce` VALUES ('5', '111', '111', '陈卫国', '男', '2017-04-12', '2558', '5837895@qq.com', '0563-5887978', '330302198406032236', 'upload/1490980295190.jpg', '浙江宁波', 'sdfds sddf d', '2019-04-05 00:00:00', '是');
INSERT INTO `yonghuzhuce` VALUES ('6', 'student', '123456', '胡阿尤', '男', '2019-04-24', '', '', '', '', '', '', '', '2019-04-23 17:09:52', '是');

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) DEFAULT NULL,
  `wangzhi` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '百度', 'http://www.baidu.com', '2019-04-05 00:00:00');
INSERT INTO `youqinglianjie` VALUES ('2', '谷歌', 'http://www.google.cn', '2019-04-05 00:00:00');
INSERT INTO `youqinglianjie` VALUES ('3', '新浪', 'http://www.sina.com', '2019-04-05 00:00:00');
INSERT INTO `youqinglianjie` VALUES ('4', '雅虎', 'http://www.yahoo.cn', '2019-04-05 00:00:00');
INSERT INTO `youqinglianjie` VALUES ('5', '腾讯', 'http://www.qq.com', '2019-04-05 00:00:00');

-- ----------------------------
-- Table structure for `zuoyexinxi`
-- ----------------------------
DROP TABLE IF EXISTS `zuoyexinxi`;
CREATE TABLE `zuoyexinxi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `zuoyebianhao` varchar(50) DEFAULT NULL,
  `biaoti` varchar(255) DEFAULT NULL,
  `zuoyeyaoqiu` varchar(255) DEFAULT NULL,
  `zuoye` varchar(50) DEFAULT NULL,
  `kechengzhangjie` varchar(50) DEFAULT NULL,
  `zhangjiemingcheng` varchar(255) DEFAULT NULL,
  `tijiaoqixian` varchar(50) DEFAULT NULL,
  `faburen` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `issh` varchar(2) DEFAULT '否',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zuoyexinxi
-- ----------------------------
INSERT INTO `zuoyexinxi` VALUES ('1', '04010025351985', '小学生优美句子摘抄', '做完之后提交班长统一上交', 'upload/1490977550467.zip', '第一章', '第一章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:28');
INSERT INTO `zuoyexinxi` VALUES ('2', '04010032521174', '英语课后习题做完之后打印', '在线做作业', 'upload/1490977982404.zip', '第二章', '第二章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:29');
INSERT INTO `zuoyexinxi` VALUES ('3', '04010033351118', '辅导资料课前预习', '写预习报告', 'upload/1490978025265.zip', '第三章', '第三章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:29');
INSERT INTO `zuoyexinxi` VALUES ('4', '04010034016431', '古诗文背诵', '上课后检查', 'upload/1490978050356.zip', '第四章', '第四章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:30');
INSERT INTO `zuoyexinxi` VALUES ('5', '04010106591525', '写一篇不少于1000字论文', '写到信纸上', 'upload/1490980027221.zip', '第三章', '第三章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:30');
INSERT INTO `zuoyexinxi` VALUES ('6', '04010107201967', '历史课文预习', '写预习报告', 'upload/1490980054465.zip', '第四章', '第四章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:30');
INSERT INTO `zuoyexinxi` VALUES ('7', '04010107471314', '英语单词背诵', '背诵单词，上课默写', 'upload/1490980077303.zip', '第一章', '第一章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:31');
INSERT INTO `zuoyexinxi` VALUES ('8', '04010108131483', '数学公式相关习题', '上课黑板秀', 'upload/1490980102267.zip', '第四章', '第四章', '2019-04-15', '001', '陈卫国', '请按时交作业', '是', '2019-04-23 17:56:31');
INSERT INTO `zuoyexinxi` VALUES ('9', '04232010311887', '2019-04-23把课后英语单词抄写3遍', '注意写音标', 'upload/1556021469266.sql', '5', '游览动物园', '2019-05-24 20:11:22', '0077', '张山峰', '', '是', '2019-04-23 20:16:48');
