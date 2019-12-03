/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : ebuy

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-10-07 21:38:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES ('1', '服饰', '服装');
INSERT INTO `t_bigtype` VALUES ('2', '数码', null);
INSERT INTO `t_bigtype` VALUES ('3', '美食', null);
INSERT INTO `t_bigtype` VALUES ('4', '家电', null);
INSERT INTO `t_bigtype` VALUES ('5', '电脑', '试试');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `nickName` varchar(30) DEFAULT NULL,
  `replyContent` varchar(100) DEFAULT NULL,
  `replyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('2', '积分大返利，机不可失失不再来', '2014-01-02 00:00:00', '会员VIP', '会员特惠月开始', '2014-01-02 00:00:00');
INSERT INTO `t_comment` VALUES ('3', '开始配货开始配货开始配货开始配货', '2014-01-03 00:00:00', '阿木木', null, '2014-01-01 00:00:00');
INSERT INTO `t_comment` VALUES ('4', '小米4发布了 1999 16G 3200W像素', '2014-01-04 00:00:00', '雷军', '假的！！', '2014-01-03 00:00:00');
INSERT INTO `t_comment` VALUES ('6', '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '22', '2014-09-13 18:11:51');
INSERT INTO `t_comment` VALUES ('12', '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题啊', '2014-09-13 18:02:52');
INSERT INTO `t_comment` VALUES ('13', '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题。', '2014-09-13 18:04:45');
INSERT INTO `t_comment` VALUES ('14', '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题。', '2014-09-13 18:05:03');
INSERT INTO `t_comment` VALUES ('17', '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题。111', '2014-09-13 18:09:52');
INSERT INTO `t_comment` VALUES ('18', '什么时候发货？', '2014-09-14 00:00:00', '小华', '块了', '2014-09-14 21:26:46');
INSERT INTO `t_comment` VALUES ('21', '这个网站不错。', '2014-10-13 08:10:13', '哈哈', null, null);
INSERT INTO `t_comment` VALUES ('22', '啥时候', '2019-09-27 16:46:17', '无知', null, null);
INSERT INTO `t_comment` VALUES ('23', '同仁堂', '2019-09-27 16:46:33', '无知', null, null);

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `createTime` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '大家国庆快乐，国庆假期玩的开心', '2013-01-01 00:00:00', '国庆七天乐');
INSERT INTO `t_news` VALUES ('2', '”你相信一见钟情吗？要不我再从你身边路过一次？”', '2013-01-01 00:00:00', '情话一');
INSERT INTO `t_news` VALUES ('3', '“你知道，通往幸福的门是什么门吗？”“啊？是什么”“是我们”', '2013-01-01 00:00:00', '情话二');
INSERT INTO `t_news` VALUES ('4', '如果你得罪了老板，失去的只是一份工作；如果你得罪了客户，失去的不过是一份订单；是的，世上只有一个人可以得罪：你给她脸色看，你冲她发牢骚，你大声顶撞她，甚至当 着她的面摔碗，她都不会记恨你，原因很简单，因为她是你的母亲。', '2013-01-01 00:00:00', '人生');
INSERT INTO `t_news` VALUES ('5', '悟空和唐僧一起上某卫视非诚勿扰,悟空上台,24盏灯全灭。理由:1.没房没车只有一根破棍. 2.保镖职业危险.3.动不动打妖精,对女生不温柔. 4.坐过牢,曾被压五指山下500年。唐僧上台，哗!灯全亮。 理由:1.公务员； 2.皇上兄弟，后台最硬 3.精通梵文等外语 4.长得帅 5.最关键一点：有宝马！', '2013-01-01 00:00:00', '搞笑段子');
INSERT INTO `t_news` VALUES ('6', '单例的好处\n单例模式适合于应用中频繁创建的对象，如果是重量级的对象，更应该使用单例模式。比如配置文件，如果不采用单例模式的话，每个配置文件对象的内容都是一样的，创建重复的对象就会浪费宝贵的内存，所以有必要使用单例模式，达到性能的提升，减小了内存的开销和GC的压力。本文会一步一步由浅入深的讨论如何实现正确的单例模式。\n\n单例模式的一般写法\n饿汉式\npublic class HungryMode {\n\n    private static HungryMode sHungryMode = new HungryMode();\n\n    private HungryMode() {\n        System.out.println(\"create \" + getClass().getSimpleName());\n    }\n\n    public static void fun(){\n        System.out.println(\"call fun in HungryMode\");\n    }\n\n    public static HungryMode getInstance(){\n        return sHungryMode;\n    }\n\n    public static void main(String[] args) {\n        HungryMode.fun();\n    }\n\n}\r\n————————————————\r\n版权声明：本文为CSDN博主「soda211」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n', '2013-01-01 00:00:00', '单例模式');
INSERT INTO `t_news` VALUES ('7', '懒汉式\npublic class LazyMode {\n\n    private static LazyMode sLazyMode;\n\n    private LazyMode() {\n        System.out.println(\"create \" + getClass().getSimpleName());\n    }\n\n    public static LazyMode getInstance(){\n        if (sLazyMode == null) {\n            sLazyMode = new LazyMode();\n        }\n        return sLazyMode;\n    }\n\n    public static void main(String[] args) {\n        LazyMode.getInstance();\n    }\n\n}\r\n————————————————\r\n版权声明：本文为CSDN博主「soda211」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n', '2013-01-01 00:00:00', '懒汉式');
INSERT INTO `t_news` VALUES ('8', null, '2013-01-01 00:00:00', '新闻八');
INSERT INTO `t_news` VALUES ('9', null, null, '1');
INSERT INTO `t_news` VALUES ('10', null, null, '2');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `createTime` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '哈哈1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '2014-10-01 00:00:00', '公告一');
INSERT INTO `t_notice` VALUES ('2', '国庆放假8天，大家玩的开心', '2014-10-01 00:00:00', '国庆放假通知');
INSERT INTO `t_notice` VALUES ('3', '国庆回来即将进入高级课程，大家继续努力', '2014-10-01 00:00:00', '课程安排');
INSERT INTO `t_notice` VALUES ('4', null, '2014-10-01 00:00:00', '公告四');
INSERT INTO `t_notice` VALUES ('5', null, '2014-10-01 00:00:00', '公告五');
INSERT INTO `t_notice` VALUES ('6', null, '2014-10-01 00:00:00', '公告六');
INSERT INTO `t_notice` VALUES ('7', null, '2014-10-01 00:00:00', '公告七');
INSERT INTO `t_notice` VALUES ('8', null, '2014-10-01 00:00:00', '公告八');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `orderNo` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kh19wisaki6acmrs36vcmboj3` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '964', '2014-10-22 07:57:09', '20141022075709', '3', '4');
INSERT INTO `t_order` VALUES ('2', '7896', '2014-10-22 07:59:51', '20141022075951', '3', '4');
INSERT INTO `t_order` VALUES ('3', '23190', '2014-10-22 08:04:24', '20141022080424', '3', '4');
INSERT INTO `t_order` VALUES ('4', '499', '2019-01-23 20:23:05', '20190123082305', '3', '10');
INSERT INTO `t_order` VALUES ('5', '297', '2019-09-27 15:30:57', '201909270330057', '1', '1');
INSERT INTO `t_order` VALUES ('6', '99', '2019-09-27 19:52:09', '201909270752009', '1', '11');
INSERT INTO `t_order` VALUES ('7', '168', '2019-09-27 19:52:15', '201909270752015', '1', '11');

-- ----------------------------
-- Table structure for t_order_product
-- ----------------------------
DROP TABLE IF EXISTS `t_order_product`;
CREATE TABLE `t_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8k7n3hmcgwvrs3ljx47u8l5w6` (`orderId`),
  KEY `FK_1orhyavyw8w5a8cj5tmtqfpd2` (`productId`),
  CONSTRAINT `FK_1orhyavyw8w5a8cj5tmtqfpd2` FOREIGN KEY (`productId`) REFERENCES `t_product` (`id`),
  CONSTRAINT `FK_8k7n3hmcgwvrs3ljx47u8l5w6` FOREIGN KEY (`orderId`) REFERENCES `t_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_product
-- ----------------------------
INSERT INTO `t_order_product` VALUES ('1', '1', '1', '21');
INSERT INTO `t_order_product` VALUES ('2', '1', '1', '15');
INSERT INTO `t_order_product` VALUES ('3', '3', '1', '87');
INSERT INTO `t_order_product` VALUES ('4', '1', '2', '38');
INSERT INTO `t_order_product` VALUES ('5', '1', '2', '125');
INSERT INTO `t_order_product` VALUES ('6', '2', '2', '87');
INSERT INTO `t_order_product` VALUES ('7', '1', '3', '25');
INSERT INTO `t_order_product` VALUES ('8', '1', '3', '40');
INSERT INTO `t_order_product` VALUES ('9', '2', '3', '92');
INSERT INTO `t_order_product` VALUES ('10', '1', '4', '291');
INSERT INTO `t_order_product` VALUES ('11', '2', '5', '8');
INSERT INTO `t_order_product` VALUES ('12', '3', '5', '9');
INSERT INTO `t_order_product` VALUES ('13', '1', '6', '87');
INSERT INTO `t_order_product` VALUES ('14', '1', '7', '25');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `hot` int(11) NOT NULL,
  `hotTime` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `proPic` varchar(255) DEFAULT NULL,
  `specialPrice` int(11) NOT NULL,
  `specialPriceTime` datetime DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `bigTypeId` int(11) DEFAULT NULL,
  `smallTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2vciohqujaeij91ujm5va2xs4` (`bigTypeId`),
  KEY `FK_qexns4el8esjqbdrqfys82ih8` (`smallTypeId`),
  CONSTRAINT `FK_2vciohqujaeij91ujm5va2xs4` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`),
  CONSTRAINT `FK_qexns4el8esjqbdrqfys82ih8` FOREIGN KEY (`smallTypeId`) REFERENCES `t_smalltype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('8', '乐库优2014春装新款中腰蓝色刺绣修身', '1', '2014-01-01 00:00:00', '乐库优2014春装新款中腰蓝色刺绣修身', '78', 'images/product/5.jpg', '0', '2014-01-01 00:00:00', '65', '1', '8');
INSERT INTO `t_product` VALUES ('9', '缪佳 春装新款2014女士牛仔裤女小脚', '1', '2014-01-01 00:00:00', '缪佳 春装新款2014女士牛仔裤女小脚', '99', 'images/product/6.jpg', '0', null, '152', '1', '8');
INSERT INTO `t_product` VALUES ('10', '2014春装新款 韩版修身显瘦小脚裤休', '1', '2014-01-01 00:00:00', '2014春装新款 韩版修身显瘦小脚裤休', '79', 'images/product/7.jpg', '0', null, '52', '1', '8');
INSERT INTO `t_product` VALUES ('14', '名驭 牛仔裤女小脚裤韩版潮2014春装', '1', '2014-01-01 00:00:00', '名驭 牛仔裤女小脚裤韩版潮2014春装', '79', 'images/product/8.jpg', '0', null, '55', '1', '8');
INSERT INTO `t_product` VALUES ('15', '皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ', '1', '2014-01-01 00:00:00', '皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ', '199', 'images/product/9.jpg', '0', null, '125', '1', '8');
INSERT INTO `t_product` VALUES ('16', 'Le hondies2014男士白色牛仔裤韩版', '1', '2014-01-01 00:00:00', 'Le hondies2014男士白色牛仔裤韩版', '129', 'images/product/10.jpg', '0', null, '129', '1', '8');
INSERT INTO `t_product` VALUES ('17', '夏装新品 唐狮正品男基本修身小脚牛仔', '1', '2014-01-01 00:00:00', '夏装新品 唐狮正品男基本修身小脚牛仔', '129', 'images/product/11.jpg', '0', null, '129', '1', '8');
INSERT INTO `t_product` VALUES ('18', 'gxg.1978男装2014新款春装休闲修身', '1', '2014-01-01 00:00:00', 'gxg.1978男装2014新款春装休闲修身', '229', 'images/product/12.jpg', '0', null, '229', '1', '7');
INSERT INTO `t_product` VALUES ('19', '罗蒙 休闲西服男士小西装外套商务正装', '1', '2013-01-01 00:00:00', '罗蒙 休闲西服男士小西装外套商务正装', '449', 'images/product/13.jpg', '0', null, '125', '1', '7');
INSERT INTO `t_product` VALUES ('20', '领般【新品】男士西服套装 商务休闲修身西装 男款职业正装结婚礼服 黑色斜纹 外', '1', null, '领般【新品】男士西服套装 ', '318', 'images/product/14.jpg', '1', '2013-01-01 00:00:00', '318', '1', '7');
INSERT INTO `t_product` VALUES ('21', '货到付款Mr.TA 西服 2014新款男士礼服套 经典 黑色西装 英伦商务修身西服套装 黑', '1', null, '货到付款Mr.TA 西服 ', '468', 'images/product/15.jpg', '1', '2014-01-02 00:00:00', '468', '1', '7');
INSERT INTO `t_product` VALUES ('25', '【货到付款】圣贝琪　2014韩版夏装黑白经典百搭腰肩花边美观又时尚新款连衣裙 ', '0', null, '经典百搭腰肩花边美观又时尚新款连衣裙 ', '168', 'images/product/16.jpg', '1', '2014-01-01 00:00:00', '99', '1', '6');
INSERT INTO `t_product` VALUES ('26', '蒲洛妃2014春季新款女装 韩版修身两件套秋款连衣裙 L189 粉色 M', '0', null, '蒲洛妃2014春季新款女装 ', '139', 'images/product/17.jpg', '1', '2014-01-01 00:00:00', '11', '1', '6');
INSERT INTO `t_product` VALUES ('27', '媞沫 2014春夏品质女装新款圆领桑蚕丝连衣裙大牌真丝连衣裙（支持货到付款)', '0', null, '2014春夏品质女装新款圆领桑蚕丝连衣裙', '169', 'images/product/18.jpg', '1', '2014-01-01 00:00:00', '55', '1', '6');
INSERT INTO `t_product` VALUES ('38', '佳能（Canon） EOS 600D 单反套机（EF-S 18-55mm f/3.5-5.6 IS II 镜头）', '0', null, '佳能（Canon） EOS 600D 单反套机', '3599', 'images/product/19.jpg', '1', '2014-01-01 00:00:00', '25', '2', '9');
INSERT INTO `t_product` VALUES ('39', '尼康（Nikon） D3200 单反相机套机（AF-S DX 18-55mm f/3.5-5.6G VR尼克尔镜', '0', null, '尼康（Nikon） D3200 单反相机套机', '6099', 'images/product/20.jpg', '1', '2014-01-01 00:00:00', '45', '2', '9');
INSERT INTO `t_product` VALUES ('40', '佳能（Canon） EOS 5D Mark III 单反机身', '0', null, '佳能（Canon） EOS 5D Mark III 单反机身', '22988', 'images/product/21.jpg', '1', '2014-01-01 00:00:00', '123', '2', '9');
INSERT INTO `t_product` VALUES ('41', '尼康（Nikon） D3300 单反套机（AF-S DX 18-55mm f/3.5-5.6G VRII尼克尔镜头）', '0', null, '尼康（Nikon） D3300 单反套机', '6389', 'images/product/22.jpg', '1', '2014-01-01 00:00:00', '123', '2', '9');
INSERT INTO `t_product` VALUES ('42', '佳能（Canon） EOS 1D X 单反机身', '0', null, '佳能（Canon） EOS 1D X 单反机身', '5699', 'images/product/23.jpg', '0', null, '123', '2', '9');
INSERT INTO `t_product` VALUES ('43', '佳能（Canon） EOS 700D 单反机身', '0', null, '佳能（Canon） EOS 700D 单反机身', '3199', 'images/product/24.jpg', '0', null, '485', '2', '9');
INSERT INTO `t_product` VALUES ('44', '佳能（Canon） 1200D 双镜头套装', '0', null, '佳能（Canon） 1200D 双镜头套装', '8999', 'images/product/25.jpg', '0', null, '875', '2', '9');
INSERT INTO `t_product` VALUES ('45', '宾得（PENTAX） K-50/DA L 18-55mmWR 单反套机', '0', null, '宾得（PENTAX） K-50/DA L 18-55mmWR ', '4499', 'images/product/26.jpg', '0', null, '165', '2', '9');
INSERT INTO `t_product` VALUES ('46', '佳能（Canon） EOS 6D 单反套机（EF 24-70mm f/4L IS USM 镜头）', '0', null, '佳能（Canon） EOS 6D 单反套机', '3199', 'images/product/27.jpg', '0', null, '52', '2', '9');
INSERT INTO `t_product` VALUES ('47', '尼康（Nikon） D3100 单反套机（AF-S DX 18-55mm f/3.5-5.6G VR尼克尔镜头）', '0', null, '尼康（Nikon） D3100 单反套机', '5299', 'images/product/28.jpg', '0', null, '641', '2', '9');
INSERT INTO `t_product` VALUES ('48', '佳能（Canon） EOS 100D 单反机身', '0', null, '佳能（Canon） EOS 100D 单反机身', '4280', 'images/product/29.jpg', '0', null, '46', '2', '9');
INSERT INTO `t_product` VALUES ('49', '漫步者（EDIFIER） R101V 2.1声道多媒体音箱 黑色', '0', null, '漫步者R101V 2.1声道多媒体音箱 黑色', '119', 'images/product/30.jpg', '0', null, '465', '2', '29');
INSERT INTO `t_product` VALUES ('50', '惠威（HiVi）多媒体音箱 M200MKIII 2.0声道HI-FI品质 豪华原木做工', '0', null, '惠威（HiVi）多媒体音箱  豪华原木做工', '1785', 'images/product/31.jpg', '0', null, '213', '2', '29');
INSERT INTO `t_product` VALUES ('51', '魅动e族MD-5110音箱 音响 蓝牙音箱 蓝牙音响 无线音箱 低音炮 NFC配对 黑色', '0', null, '魅动e族MD-5110音箱 音响 蓝牙音箱', '149', 'images/product/32.jpg', '0', null, '456', '2', '29');
INSERT INTO `t_product` VALUES ('52', '漫步者（EDIFIER） R1600TIII 性能超强大的4吋2.0音箱', '0', null, '漫步者R1600TIII性能超强大的4吋2.0音箱', '399', 'images/product/33.jpg', '0', null, '55', '2', '29');
INSERT INTO `t_product` VALUES ('53', '哈曼卡顿harmankardon SoundSticks III 3代 水晶 音箱', '0', null, '哈曼卡顿 III 3代 水晶 音箱', '1098', 'images/product/34.jpg', '0', null, '331', '2', '29');
INSERT INTO `t_product` VALUES ('54', '惠威（HiVi）多媒体音箱 M200MKII 2.0声道HI-FI品质', '0', null, '惠威（HiVi）多媒体音箱 2.0声道HI-FI品质', '1096', 'images/product/35.jpg', '0', null, '456', '2', '29');
INSERT INTO `t_product` VALUES ('55', '全微（transwin） 全微T-200N 2.1有源多媒体音响 电脑音箱笔记本迷你小重低音炮', '0', null, '全微 全微T-200N 2.1有源多媒体音响 ', '69', 'images/product/36.jpg', '0', null, '12389', '2', '29');
INSERT INTO `t_product` VALUES ('56', '漫步者（EDIFIER） R10U 2.0声道 多媒体音箱 黑色', '0', null, '漫步者 R10U 2.0声道 多媒体音箱 黑色', '65', 'images/product/37.jpg', '0', null, '789', '2', '29');
INSERT INTO `t_product` VALUES ('57', 'dostyle SD306重低音2.1电脑音箱低音炮音响子夜黑', '0', null, 'dostyle SD306重低音2.1电脑音箱低音炮音响', '239', 'images/product/38.jpg', '0', null, '4156', '2', '29');
INSERT INTO `t_product` VALUES ('59', '漫步者（EDIFIER） R201T12 2.1声道 多媒体音箱 黑色', '0', null, '漫步者 R201T12 2.1声道 多媒体音箱 黑色', '198', 'images/product/40.jpg', '0', null, '965', '2', '29');
INSERT INTO `t_product` VALUES ('60', '麦博（microlab） M100(10) 多媒体有源音响 黑色', '0', null, '麦博 M100(10) 多媒体有源音响 黑色', '99', 'images/product/41.jpg', '0', null, '66', '2', '29');
INSERT INTO `t_product` VALUES ('62', '漫步者（EDIFIER） R201T08 2.1声道 多媒体音箱 黑色', '0', null, '漫步者 R201T08 2.1声道 多媒体音箱 黑色', '189', 'images/product/43.jpg', '0', null, '998', '2', '29');
INSERT INTO `t_product` VALUES ('63', 'JBL ONBEATVENLTWHTCN 城市节拍 音乐底座/音箱 全新闪电接口 内置蓝牙 白色', '0', null, 'JBL  城市节拍 音乐底座/音箱 全新闪电接口', '998', 'images/product/44.jpg', '0', null, '651', '2', '29');
INSERT INTO `t_product` VALUES ('64', '飞利浦(Philips) SBM120SLV/93 便携式插卡音响 FM收音机（银色）', '0', null, '飞利浦 SBM120SLV/93 便携式插卡音响', '199', 'images/product/45.jpg', '0', null, '456', '2', '29');
INSERT INTO `t_product` VALUES ('65', '漫步者（EDIFIER） R101T06 2.1声道 多媒体音箱 黑银', '0', null, '漫步者 R101T06 2.1声道 多媒体音箱 黑银', '139', 'images/product/46.jpg', '0', null, '12376', '2', '29');
INSERT INTO `t_product` VALUES ('66', 'JBL PULSE–炫彩360度LED灯 NFC 便携蓝牙音箱 音乐脉动 黑色', '0', null, 'JBL PULSE–炫彩360度LED灯 便携蓝牙音箱', '1699', 'images/product/47.jpg', '0', null, '8554', '2', '29');
INSERT INTO `t_product` VALUES ('67', '漫步者（EDIFIER）C2X 外置功放 全木质音箱 黑色', '0', null, '漫步者 C2X 外置功放 全木质音箱 黑色', '569', 'images/product/48.jpg', '0', null, '66247', '2', '29');
INSERT INTO `t_product` VALUES ('68', '飞利浦（PHILIPS）DC295/93 iphone5/ipad4/mini/ipod 专用苹果充电底座音响 银', '0', null, '飞利浦 DC295 iphone5/ipad4/mini/ipod 专用', '799', 'images/product/49.jpg', '0', null, '6245', '2', '29');
INSERT INTO `t_product` VALUES ('70', '苹果（Apple）iPod touch 4代 16G ME179CH/A 多媒体播放器 白色', '0', null, '苹果（Apple）iPod 16G 多媒体播放器 白色', '898', 'images/product/50.jpg', '0', null, '1154', '2', '30');
INSERT INTO `t_product` VALUES ('71', '苹果（APPLE）MD775CH/A IPOD SHUFFLE 2GB/BLUE 蓝色', '0', null, '苹果（APPLE）MD775CH/A 2GB/BLUE 蓝色', '328', 'images/product/51.jpg', '0', null, '456', '2', '30');
INSERT INTO `t_product` VALUES ('72', '索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色', '0', null, '索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色', '239', 'images/product/52.jpg', '0', null, '675', '2', '30');
INSERT INTO `t_product` VALUES ('73', '苹果（APPLE）MD773CH/A IPOD SHUFFLE 2GB/ PINK粉色', '0', null, '苹果（APPLE）MD773CH/A IPOD 2GB/ PINK粉色', '328', 'images/product/53.jpg', '0', null, '12', '2', '30');
INSERT INTO `t_product` VALUES ('74', '苹果（Apple） iPod Nano 7代 16G MD480CH/A 多媒体播放器 银白色', '0', null, '苹果（Apple）16G 多媒体播放器 银白色', '998', 'images/product/54.jpg', '0', null, '545', '2', '30');
INSERT INTO `t_product` VALUES ('75', '苹果（APPLE）MD778CH/A IPOD SHUFFLE 2GB/SILVER 银白', '0', null, '苹果（APPLE）MD778CH/A   2GB/SILVER 银白', '328', 'images/product/55.jpg', '0', null, '85', '2', '30');
INSERT INTO `t_product` VALUES ('76', '苹果（APPLE）MD776CH/A IPOD SHUFFLE 2GB/GREEN 绿色', '0', null, '苹果（APPLE）MD776CH/A2GB/GREEN 绿色', '328', 'images/product/56.jpg', '0', null, '65', '2', '30');
INSERT INTO `t_product` VALUES ('77', '苹果（Apple） iPod Nano 7代 16G MD477CH/A 多媒体播放器 蓝色', '0', null, '苹果（Apple） Nano 7代 16G 多媒体播放器', '998', 'images/product/57.jpg', '0', null, '123', '2', '30');
INSERT INTO `t_product` VALUES ('78', '飞利浦（PHILIPS） SA2SPK04SFZ/93 MP3 播放器 4G 银色', '0', null, '飞利浦 SA2SPK04SFZ/93 MP3 播放器 4G 银色', '279', 'images/product/58.jpg', '0', null, '456', '2', '30');
INSERT INTO `t_product` VALUES ('79', '苹果（APPLE）MD777CH/A IPOD SHUFFLE 2GB/PURPLE 紫色', '0', null, '苹果（APPLE）MD777CH/A IPOD 2GB/PURPLE 紫色', '328', 'images/product/59.jpg', '0', null, '456', '2', '30');
INSERT INTO `t_product` VALUES ('80', '索尼（ SONY）NWZ-B172F MP3 纯白', '0', null, '索尼（ SONY）NWZ-B172F MP3 纯白', '239', 'images/product/60.jpg', '0', null, '54', '2', '30');
INSERT INTO `t_product` VALUES ('81', '苹果（Apple） iPod Nano 7代 16G MD476CH/A 多媒体播放器 黄色', '0', null, '苹果（Apple） iPod 16G 多媒体播放器 黄色', '998', 'images/product/61.jpg', '0', null, '56', '2', '30');
INSERT INTO `t_product` VALUES ('82', '苹果（Apple） iPod Nano 7代 16G MD479CH/A 多媒体播放器 紫色', '0', null, '苹果（Apple） iPod 16G  多媒体播放器 紫色', '998', 'images/product/62.jpg', '0', null, '34', '2', '30');
INSERT INTO `t_product` VALUES ('83', '昂达（onda） VX330 双无损音乐格式+超便携纯音乐夹子+4G MP3 黑色', '0', null, '昂达 VX330 双无损音乐格式+超便携纯音乐夹', '99', 'images/product/63.jpg', '0', null, '62', '2', '30');
INSERT INTO `t_product` VALUES ('84', '苹果（Apple） iPod Nano 7代 16GB ME971CH/A 多媒体播放器 深空灰色', '0', null, '苹果（Apple）iPod 7代 16GB 多媒体播放器', '998', 'images/product/64.jpg', '0', null, '89', '2', '30');
INSERT INTO `t_product` VALUES ('86', '德国 进口牛奶 欧德堡（Oldenburger）超高温处理全脂纯牛奶1L*12', '0', null, '德国 欧德堡 超高温处理全脂纯牛奶1L*12', '199', 'images/product/66.jpg', '0', null, '45', '3', '31');
INSERT INTO `t_product` VALUES ('87', '澳大利亚 进口牛奶 德运（Devondale）全脂牛奶礼盒装 1L*6', '0', null, '澳大利亚  德运 全脂牛奶礼盒装 1L*6', '99', 'images/product/67.jpg', '0', null, '66', '3', '31');
INSERT INTO `t_product` VALUES ('88', '德国 进口牛奶 德亚（Deyatur）全脂牛奶200ml*30盒', '0', null, '德国 德亚 全脂牛奶200ml*30盒', '129', 'images/product/68.jpg', '0', null, '199', '3', '31');
INSERT INTO `t_product` VALUES ('89', '德国 进口牛奶 欧德堡（Oldenburger）超高温处理全脂纯牛奶200ml*20盒', '0', null, '德国 欧德堡超高温处理全脂纯牛奶200ml*20', '99', 'images/product/69.jpg', '0', null, '299', '3', '31');
INSERT INTO `t_product` VALUES ('90', '丹麦进口 Kjeldsens 蓝罐 曲奇 礼盒 908g 盒装', '0', null, '丹麦进口  蓝罐 曲奇 礼盒 908g 盒装', '89', 'images/product/70.jpg', '0', null, '399', '3', '31');
INSERT INTO `t_product` VALUES ('91', '丹麦进口 Kjeldsens 蓝罐 曲奇 礼盒 454g 盒装', '0', null, '丹麦进口  蓝罐 曲奇 礼盒 454g 盒装', '58', 'images/product/71.jpg', '0', null, '145', '3', '31');
INSERT INTO `t_product` VALUES ('92', '中国 台湾 蜜兰诺 松塔 12粒装 192克（新老包装随机发送） 盒装', '0', null, '蜜兰诺 松塔 12粒装 192克', '17', 'images/product/72.jpg', '0', null, '451', '3', '31');
INSERT INTO `t_product` VALUES ('93', '丹麦进口 Kjeldsens 蓝罐 曲奇 125g 盒装', '0', null, '丹麦进口 Kjeldsens 蓝罐 曲奇 125g 盒装', '10', 'images/product/73.jpg', '0', null, '34', '3', '31');
INSERT INTO `t_product` VALUES ('94', '丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g', '0', null, '丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g', '31', 'images/product/74.jpg', '0', null, '415', '3', '31');
INSERT INTO `t_product` VALUES ('95', '意大利进口FerreroRocher费列罗榛果威化巧克力96粒婚礼装1200g', '0', null, '意大利进口费列罗榛果威化巧克力96粒婚礼装1200g', '149', 'images/product/75.jpg', '0', null, '3541', '3', '31');
INSERT INTO `t_product` VALUES ('96', '意大利进口FerreroRocher费列罗榛果威化巧克力16粒装200g', '0', null, '意大利进口费列罗榛果威化巧克力16粒装200g', '35', 'images/product/76.jpg', '0', null, '4142', '3', '31');
INSERT INTO `t_product` VALUES ('97', '意大利进口FerreroRocher费列罗榛果威化巧克力32粒钻石装400g', '0', null, '意大利进口费列罗榛果威化巧克力32粒钻石400g', '77', 'images/product/77.jpg', '0', null, '547', '3', '31');
INSERT INTO `t_product` VALUES ('98', '进口食品 非国内分装 费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g', '0', null, '费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g', '125', 'images/product/78.jpg', '0', null, '265', '3', '31');
INSERT INTO `t_product` VALUES ('99', '新疆特产 一品玉和田大枣四星450g*3袋', '0', null, '新疆特产 一品玉和田大枣四星450g*3袋', '75', 'images/product/79.jpg', '0', null, '25', '3', '32');
INSERT INTO `t_product` VALUES ('100', '新疆特产 一品玉和田大枣六星450g*3袋', '0', null, '新疆特产 一品玉和田大枣六星450g*3袋', '109', 'images/product/80.jpg', '0', null, '45', '3', '32');
INSERT INTO `t_product` VALUES ('101', '新疆特产 和田玉枣 四星 500g*3袋', '0', null, '新疆特产 和田玉枣 四星 500g*3袋', '105', 'images/product/81.jpg', '0', null, '123', '3', '32');
INSERT INTO `t_product` VALUES ('102', '新疆特产 味正品新疆和田大枣箱装2000g', '0', null, '新疆特产 味正品新疆和田大枣箱装2000g', '99', 'images/product/82.jpg', '0', null, '45', '3', '32');
INSERT INTO `t_product` VALUES ('103', '稻香村京八件糕点礼盒 北京礼物1200g 北京特产', '0', null, '稻香村京八件糕点礼盒 北京礼物1200g 北京特产', '78', 'images/product/83.jpg', '0', null, '85', '3', '32');
INSERT INTO `t_product` VALUES ('104', '北京特产御食园3号大礼包1800g', '0', null, '北京特产御食园3号大礼包1800g', '68', 'images/product/84.jpg', '0', null, '999', '3', '32');
INSERT INTO `t_product` VALUES ('105', '北京特产御食园4号大礼包800g', '0', null, '北京特产御食园4号大礼包800g', '24', 'images/product/85.jpg', '0', null, '456', '3', '32');
INSERT INTO `t_product` VALUES ('106', '北京特产 御食园大礼包1500g 休闲食品小吃零食', '0', null, '北京特产 御食园大礼包1500g 休闲食品小吃零食', '60', 'images/product/86.jpg', '0', null, '54', '3', '32');
INSERT INTO `t_product` VALUES ('107', null, '0', null, '山西特产 维之王山楂凉果408g*2袋', '39', 'images/product/87.jpg', '0', null, '65', '3', '32');
INSERT INTO `t_product` VALUES ('108', '冠云 中华老字号 山西特产 平遥牛肉家庭装(200gX3袋)600g', '0', null, '中华老字号 平遥牛肉家庭装(200gX3袋)600g', '88', 'images/product/88.jpg', '0', null, '65', '3', '32');
INSERT INTO `t_product` VALUES ('109', '冠云 中华老字号 山西特产 平遥牛肉礼盒(158gX6袋)948g', '0', null, '中华老字号 平遥牛肉礼盒(158gX6袋)948g', '152', 'images/product/89.jpg', '0', null, '654', '3', '32');
INSERT INTO `t_product` VALUES ('110', '山西特产 维之王山楂片268g*2袋', '0', null, '山西特产 维之王山楂片268g*2袋', '32', 'images/product/90.jpg', '0', null, '214', '3', '32');
INSERT INTO `t_product` VALUES ('111', '武汉特产 周黑鸭鸭脖210g', '0', null, '武汉特产 周黑鸭鸭脖210g', '26', 'images/product/91.jpg', '0', null, '55', '3', '33');
INSERT INTO `t_product` VALUES ('112', '中华老字号 重庆老四川金角五香牛肉干138g', '0', null, '中华老字号 重庆老四川金角五香牛肉干138g', '25', 'images/product/92.jpg', '0', null, '112', '3', '33');
INSERT INTO `t_product` VALUES ('113', '武汉特产 周黑鸭锁骨300g', '0', null, '武汉特产 周黑鸭锁骨300g', '28', 'images/product/93.jpg', '0', null, '6211', '3', '33');
INSERT INTO `t_product` VALUES ('114', '重庆特产 有友泡凤爪山椒味100g*5袋', '0', null, '重庆特产 有友泡凤爪山椒味100g*5袋', '22', 'images/product/94.jpg', '0', null, '445', '3', '33');
INSERT INTO `t_product` VALUES ('115', '百草味靖江猪肉脯200g×2袋装靖江特产蜜汁精致猪肉干', '0', null, '百草味靖江猪肉脯200g×2袋装', '39', 'images/product/95.jpg', '0', null, '123', '3', '33');
INSERT INTO `t_product` VALUES ('116', '食塘薄皮核桃1000g', '0', null, '食塘薄皮核桃1000g', '53', 'images/product/96.jpg', '0', null, '415', '3', '33');
INSERT INTO `t_product` VALUES ('117', '三只松鼠夏威夷果265gx2包奶油味送开口器坚果炒货春季热卖AB1', '0', null, '夏威夷果265gx2包奶油味', '37', 'images/product/97.jpg', '0', null, '119', '3', '33');
INSERT INTO `t_product` VALUES ('118', '黄飞红麻辣花生210g', '0', null, '黄飞红麻辣花生210g', '9', 'images/product/98.jpg', '0', null, '6513', '3', '33');
INSERT INTO `t_product` VALUES ('119', '楼兰蜜语 新疆纯野生无漂白 薄皮核桃500gx2包 新包装送夹子', '0', null, '楼兰蜜语 新疆薄皮核桃500gx2包', '50', 'images/product/99.jpg', '0', null, '1341', '3', '33');
INSERT INTO `t_product` VALUES ('120', '福建特产 友臣 金丝肉松饼208g', '0', null, '福建特产 友臣 金丝肉松饼208g', '10', 'images/product/100.jpg', '0', null, '4115', '3', '33');
INSERT INTO `t_product` VALUES ('121', '【包邮】友臣金丝肉松饼整箱2.5kg 约70个 休闲零食品', '0', null, '【包邮】友臣金丝肉松饼整箱2.5kg 约70个', '67', 'images/product/101.jpg', '0', null, '4141', '3', '33');
INSERT INTO `t_product` VALUES ('122', '食塘薄皮核桃1000g', '0', null, '食塘薄皮核桃1000g', '52', 'images/product/102.jpg', '0', null, '123', '3', '33');
INSERT INTO `t_product` VALUES ('123', '越南进口利葡面包干300g*2袋（Lipo商品名称更换中随机发货）', '0', null, '越南进口利葡面包干300g*2袋', '26', 'images/product/103.jpg', '0', null, '463', '3', '33');
INSERT INTO `t_product` VALUES ('124', '索尼（SONY） KDL-47R500A 47英寸 全高清3D LED液晶电视 黑色', '0', null, '索尼（SONY） KDL-47R500A 47英寸 全高清3D', '4099', 'images/product/104.jpg', '0', null, '78', '4', '34');
INSERT INTO `t_product` VALUES ('125', '海尔模卡（MOOKA） U50H7 50英寸 4K极高清8核3D安卓智能电视', '0', null, '海尔模卡（MOOKA） U50H7 50英寸 4K极高清8核', '4099', 'images/product/105.jpg', '0', null, '654', '4', '34');
INSERT INTO `t_product` VALUES ('126', '海尔模卡（MOOKA） 48A5 48英寸 窄边框安卓智能电视', '0', null, '海尔模卡（MOOKA）48英寸 窄边框安卓智能电视', '3999', 'images/product/106.jpg', '0', null, '123', '4', '34');
INSERT INTO `t_product` VALUES ('127', 'F3301B 32英寸 窄边蓝光USB播放LED电视(黑色）', '0', null, 'TCL 32英寸 窄边蓝光USB播放LED电视(黑色）', '2999', 'images/product/107.jpg', '0', null, '456', '4', '34');
INSERT INTO `t_product` VALUES ('128', '飞利浦（PHILIPS） 50PFL3040/T3 50英寸 全高清LED液晶电视(黑色）', '0', null, '飞利浦 50PFL3040/T3 50英寸 全高清LED液晶', '1298', 'images/product/108.jpg', '0', null, '123', '4', '34');
INSERT INTO `t_product` VALUES ('129', '夏普（SHARP）LCD-40DS20A 40英寸日本原装面板', '0', null, '夏普 40英寸日本原装面板', '3699', 'images/product/109.jpg', '0', null, '11', '4', '34');
INSERT INTO `t_product` VALUES ('130', '飞利浦（PHILIPS） 32PFL3045/T3 32英寸 高清LED液晶电视（黑色）', '0', null, '飞利浦 32PFL3045/T3 32英寸 高清LED液晶电视', '2799', 'images/product/110.jpg', '0', null, '61', '4', '34');
INSERT INTO `t_product` VALUES ('131', '康佳（KONKA） LED49K70A KKTV 49英寸网络安卓智能液晶电视(黑色)', '0', null, '康佳 LED49K70A KKTV 49英寸网络安卓智能液晶', '2999', 'images/product/111.jpg', '0', null, '651', '4', '34');
INSERT INTO `t_product` VALUES ('132', '康佳（KONKA） LED32E330C 32英寸 高清窄边LED（银色）', '0', null, '康佳 LED32E330C 32英寸 高清窄边LED（银色）', '1298', 'images/product/112.jpg', '0', null, '654', '4', '34');
INSERT INTO `t_product` VALUES ('133', '长虹（CHANGHONG） 3D51C2280 51英寸 3D护眼电视（黑色）', '0', null, '长虹 3D51C2280 51英寸 3D护眼电视（黑色）', '3699', 'images/product/113.jpg', '0', null, '65', '4', '34');
INSERT INTO `t_product` VALUES ('134', '乐视TV 超级电视（Letv） S50 50英寸 3D 智能LED液晶电视 黑色', '0', null, '乐视TV 超级电视（Letv） S50 50英寸 3D', '2799', 'images/product/114.jpg', '0', null, '134', '4', '34');
INSERT INTO `t_product` VALUES ('135', '夏普（SHARP）LCD-46DS20A 46英寸日本原装面板', '0', null, '夏普（SHARP）LCD-46DS20A 46英寸日本原装', '1399', 'images/product/115.jpg', '0', null, '76', '4', '34');
INSERT INTO `t_product` VALUES ('136', '索尼（SONY） KDL-60R520A 60英寸 全高清网络 LED液晶电视（黑色）', '0', null, '索尼 KDL-60R520A 60英寸 全高清网络', '2999', 'images/product/116.jpg', '0', null, '878', '4', '34');
INSERT INTO `t_product` VALUES ('137', '海信（Hisense）LED50EC310JD 50英寸全网Vision 智能电视（黑色）', '0', null, '海信 LED50EC310JD 50英寸全网Vision ', '1298', 'images/product/117.jpg', '0', null, '45', '4', '34');
INSERT INTO `t_product` VALUES ('139', 'TCL XQB50-1678NS 5公斤 全自动洗衣机（浅灰色）', '0', null, 'TCL XQB50-1678NS 5公斤 全自动洗衣机', '818', 'images/product/118.jpg', '0', null, '51', '4', '35');
INSERT INTO `t_product` VALUES ('140', '松下(panasonic) XQB65-Q76201 6.5公斤 全自动波轮洗衣机（灰色）', '0', null, '松下 XQB65-Q76201 6.5公斤 全自动', '1499', 'images/product/119.jpg', '0', null, '456', '4', '35');
INSERT INTO `t_product` VALUES ('141', 'LG WD-N12435D 6公斤 静音系列滚筒洗衣机（白色）', '0', null, 'LG WD-N12435D 6公斤 静音系列滚筒洗衣机', '2349', 'images/product/120.jpg', '0', null, '1327', '4', '35');
INSERT INTO `t_product` VALUES ('142', '小天鹅（Little Swan） TB55-V1068 5.5公斤 波轮全自动洗衣机（灰色）', '0', null, '小天鹅（Little Swan） TB55-V1068 5.5公斤', '998', 'images/product/121.jpg', '0', null, '189', '4', '35');
INSERT INTO `t_product` VALUES ('143', '海尔（Haier） XQB60-M1269 6公斤 波轮全自动洗衣机', '0', null, '海尔 6公斤 波轮全自动洗衣机', '1498', 'images/product/122.jpg', '0', null, '1626', '4', '35');
INSERT INTO `t_product` VALUES ('144', 'LG WD-N12430D 6公斤 静音系列滚筒洗衣机（白色）', '0', null, 'LG WD-N12430D 6公斤 静音系列滚筒洗衣机', '1299', 'images/product/123.jpg', '0', null, '741', '4', '35');
INSERT INTO `t_product` VALUES ('145', '海尔（Haier） XQG60-1000J 6公斤 1000转滚筒洗衣机（瓷白）', '0', null, '海尔 6公斤 1000转滚筒洗衣机（瓷白）', '2599', 'images/product/124.jpg', '0', null, '1134', '4', '35');
INSERT INTO `t_product` VALUES ('146', null, '0', null, '容声 BCD-202M/TX6-GF61-C 202升 三门冰箱', '1549', 'images/product/125.jpg', '0', null, '85', '4', '36');
INSERT INTO `t_product` VALUES ('147', null, '0', null, '康佳 BCD-138UTS-GY 138升 双门冰箱', '898', 'images/product/126.jpg', '0', null, '415', '4', '36');
INSERT INTO `t_product` VALUES ('148', null, '0', null, '美的 BCD-185QM 185升 双门冰箱', '1699', 'images/product/127.jpg', '0', null, '160', '4', '36');
INSERT INTO `t_product` VALUES ('289', '极致优雅气质/轻薄垂坠/耗料三层荷叶边大摆/蕾丝拼接封腰式显瘦设计/轻盈旋转梦幻般的清新/精品推荐！', '0', null, '阿卡春装新款蕾丝绣花收腰显瘦中长袖', '298', 'images/product/1.jpg', '0', null, '99', '1', '6');
INSERT INTO `t_product` VALUES ('291', 'Vero Moda透视拼接修身包边圆领蕾', '1', '2014-11-23 08:54:58', 'Vero Moda透视拼接修身包边圆领蕾', '499', 'images/product/2.jpg', '1', '2014-11-23 08:55:12', '99', '1', '6');
INSERT INTO `t_product` VALUES ('294', '爱丽缇 2014夏装新款韩版七分袖圆领', '1', '2014-11-23 08:54:58', '爱丽缇 2014夏装新款韩版七分袖圆领', '138', 'images/product/3.jpg', '1', '2014-11-23 08:55:12', '120', '1', '6');
INSERT INTO `t_product` VALUES ('296', '太平鸟男装男士休闲格子西装/西服修身', '1', '2014-09-12 18:32:53', '太平鸟男装男士休闲格子西装/西服修身', '529', 'images/product/4.jpg', '1', '2014-09-12 18:33:10', '15', '1', '7');

-- ----------------------------
-- Table structure for t_shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `t_shoppingcar`;
CREATE TABLE `t_shoppingcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_shoppingcar
-- ----------------------------

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `bigTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a9rcrieyoywpcgb1luxsbir8s` (`bigTypeId`),
  CONSTRAINT `FK_a9rcrieyoywpcgb1luxsbir8s` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES ('6', '连衣裙', '1', '1');
INSERT INTO `t_smalltype` VALUES ('7', '男士西装', null, '1');
INSERT INTO `t_smalltype` VALUES ('8', '牛仔裤', null, '1');
INSERT INTO `t_smalltype` VALUES ('9', '相机', null, '2');
INSERT INTO `t_smalltype` VALUES ('29', '音箱', null, '2');
INSERT INTO `t_smalltype` VALUES ('30', 'MP3/MP4', null, '2');
INSERT INTO `t_smalltype` VALUES ('31', '进口食品', null, '3');
INSERT INTO `t_smalltype` VALUES ('32', '地方特产', null, '3');
INSERT INTO `t_smalltype` VALUES ('33', '休闲食品', null, '3');
INSERT INTO `t_smalltype` VALUES ('34', '平板电视', null, '4');
INSERT INTO `t_smalltype` VALUES ('35', '洗衣机', null, '4');
INSERT INTO `t_smalltype` VALUES ('36', '冰箱', null, '4');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('1', '音乐', 'http://www.pxcoder.com');
INSERT INTO `t_tag` VALUES ('2', '影视', 'http://quntao.epizy.com');
INSERT INTO `t_tag` VALUES ('3', '少儿', 'http://quntao.epizy.com');
INSERT INTO `t_tag` VALUES ('4', '运动鞋', 'http://quntao.epizy.com');
INSERT INTO `t_tag` VALUES ('5', '美容护肤', 'http://quntao.epizy.com');
INSERT INTO `t_tag` VALUES ('6', '家纺用品', 'http://quntao.epizy.com');
INSERT INTO `t_tag` VALUES ('7', '婴幼奶粉', 'http://quntao.epizy.com');
INSERT INTO `t_tag` VALUES ('8', '饰品', 'http://quntao.epizy.com');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `dentityCode` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '郑州22', '2014-09-04 00:00:00', '411522199407254576', 'admin@qq.com', '13523902576', '123', '女', '2', '张三3', 'admin');
INSERT INTO `t_user` VALUES ('2', '江苏南京', '1989-01-01 00:00:00', '411522199407254572', '123@qq.com', '13523902572', '123', '女', '1', '', 'marry');
INSERT INTO `t_user` VALUES ('3', null, '2014-08-05 00:00:00', '1', '2', '3', '1', '女', '1', null, 'f1');
INSERT INTO `t_user` VALUES ('4', '好地方33', '2014-09-17 00:00:00', '213213', '1213@123.com', '32132132135', '1234', '女', '1', '张三3', 'jack');
INSERT INTO `t_user` VALUES ('5', '2321', '2014-09-14 00:00:00', '411522199407254576', 'abc@qq.com', '13523902576', '123', '男', '1', null, 'tom');
INSERT INTO `t_user` VALUES ('6', '江苏南京六合', '2014-08-31 00:00:00', '411522199407254576', '123@qq.com', '13523902576', '123', '男', '1', '王二小', 'jerry');
INSERT INTO `t_user` VALUES ('7', '江苏南京六合', '2009-09-29 00:00:00', '321321', '123@qq.com', '13523902576', '123', '女', '1', null, 'jack2');
INSERT INTO `t_user` VALUES ('8', '打理及2', '2010-02-03 00:00:00', '213213212', '212@qq.com', '23213212', '1232', '女', '1', '赵六2', 'zhaoliu2');
INSERT INTO `t_user` VALUES ('9', '3211', '2014-11-07 00:00:00', '21321', '21@qq.com', '321', '2321321', '男', '1', '李四222', '21321');
INSERT INTO `t_user` VALUES ('11', '南昌市', '2019-09-09 00:00:00', '1578521548', '1376282084@qq.com', '147147741', '123456', '男', '1', '吴撒花瓣', '吴姿');
INSERT INTO `t_user` VALUES ('14', '南昌市天涯海角', '2019-10-01 00:00:00', '1578521548', '13148524', '1444511212', '123456', '男', '1', '憨憨', '谢宝');
