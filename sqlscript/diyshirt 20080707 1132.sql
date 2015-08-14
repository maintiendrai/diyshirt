-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema diy_t_shirt
--

CREATE DATABASE IF NOT EXISTS diy_t_shirt;
USE diy_t_shirt;

--
-- Definition of table `administratorinfo`
--

DROP TABLE IF EXISTS `administratorinfo`;
CREATE TABLE `administratorinfo` (
  `AdminID` int(10) unsigned NOT NULL auto_increment COMMENT '管理员ID',
  `AdminAccount` varchar(30) NOT NULL COMMENT '帐号（身份证）',
  `Password` varchar(50) NOT NULL COMMENT '密码',
  `Authority` int(10) unsigned NOT NULL default '0' COMMENT '权限',
  PRIMARY KEY  (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administratorinfo`
--

/*!40000 ALTER TABLE `administratorinfo` DISABLE KEYS */;
INSERT INTO `administratorinfo` (`AdminID`,`AdminAccount`,`Password`,`Authority`) VALUES 
 (1,'12345','123',1),
 (3,'350402198611236778','aaaaaa',0),
 (4,'wyz','123456',0);
/*!40000 ALTER TABLE `administratorinfo` ENABLE KEYS */;


--
-- Definition of table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `UserID` varchar(30) character set utf8 NOT NULL COMMENT '会员ID',
  `FeedBack` bigint(20) unsigned NOT NULL COMMENT '信用度',
  `Integral` bigint(20) unsigned NOT NULL COMMENT '积分',
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` (`UserID`,`FeedBack`,`Integral`) VALUES 
 ('a',10,50),
 ('aaa@1.1',10,50),
 ('aaa@163.com',34,89),
 ('aaa@163.l',45,76),
 ('ad@j.k',78,100),
 ('adsf@4.8',1,10),
 ('asd@5.k',1,11),
 ('asd@h.j',1,11),
 ('dsaf@l.p',1,11),
 ('feng@163.com',50000,50000),
 ('ff@fdf.dfsd',10,50),
 ('qwer@l.l',11,11),
 ('reerqe@k.k',12,12),
 ('sss@s.s',12,12),
 ('wyz@163.com',10,100);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Definition of table `manufacturersinfo`
--

DROP TABLE IF EXISTS `manufacturersinfo`;
CREATE TABLE `manufacturersinfo` (
  `MF_ID` int(10) unsigned NOT NULL auto_increment COMMENT '厂商ID',
  `MF_Name` varchar(50) character set utf8 NOT NULL COMMENT '厂商名称',
  `MF_Tel` varchar(50) character set utf8 NOT NULL COMMENT '联系电话',
  `MF_Add` varchar(200) character set utf8 NOT NULL COMMENT '厂商地址',
  `MF_Post` varchar(20) character set utf8 NOT NULL COMMENT '厂商邮编',
  PRIMARY KEY  (`MF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturersinfo`
--

/*!40000 ALTER TABLE `manufacturersinfo` DISABLE KEYS */;
INSERT INTO `manufacturersinfo` (`MF_ID`,`MF_Name`,`MF_Tel`,`MF_Add`,`MF_Post`) VALUES 
 (1,' 杭州兴隆服装有限公司','0571-86493838','杭州市江干区彭埠镇明月桥路8号','310000'),
 (2,'北京华阳服装有限公司','010-52793369/3370','北京市平谷区夏各庄镇夏各庄村北街84号','101200'),
 (3,'北京市金蓝服装厂','010-61432016 ','北京市顺义区大孙各庄镇','101308'),
 (4,'斯蒂芬','0535441','是对方挂断','36004');
/*!40000 ALTER TABLE `manufacturersinfo` ENABLE KEYS */;


--
-- Definition of table `memberinfo`
--

DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE `memberinfo` (
  `UserID` varchar(30) character set utf8 NOT NULL COMMENT '会员ID',
  `Password` varchar(50) character set utf8 NOT NULL COMMENT '密码',
  `NickName` varchar(50) character set utf8 NOT NULL COMMENT '昵称',
  `Age` int(10) unsigned default NULL COMMENT '年龄',
  `Sex` smallint(5) unsigned default NULL COMMENT '性别',
  `Telephone` varchar(30) default NULL COMMENT '固定电话',
  `Mobilephone` varchar(30) default NULL COMMENT '移动电话',
  `Status` tinyint(1) unsigned default NULL COMMENT '状态0正常1冻结',
  `Address` varchar(200) default NULL COMMENT '地址',
  `Post` varchar(20) default NULL COMMENT '邮编',
  `QQ` varchar(30) default NULL COMMENT 'QQ',
  `RegeditTime` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memberinfo`
--

/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
INSERT INTO `memberinfo` (`UserID`,`Password`,`NickName`,`Age`,`Sex`,`Telephone`,`Mobilephone`,`Status`,`Address`,`Post`,`QQ`,`RegeditTime`) VALUES 
 ('a','a','a',65,0,'4545','55151',0,'ggg','4544','5151','2008-07-02 10:19:40'),
 ('aaa@1.1','e10adc3949ba59abbe56e057f20f883e','wyx',0,0,'','',0,'','','','2008-06-23 15:28:49'),
 ('aaa@163.com','0b4e7a0e5fe84ad35fb5f95b9ceeac79','aa',0,0,'','',1,'','','','2008-04-30 20:21:58'),
 ('aaa@163.l','0b4e7a0e5fe84ad35fb5f95b9ceeac79','aaa',0,0,'','',0,'','','','2008-04-30 20:22:36'),
 ('ad@j.k','0b4e7a0e5fe84ad35fb5f95b9ceeac79','用户',12,0,'','',0,'','','','2008-04-27 22:22:56'),
 ('adsf@4.8','0b4e7a0e5fe84ad35fb5f95b9ceeac79','aa',0,0,'','',0,'','','','2008-04-30 21:33:42'),
 ('asd@5.k','0b4e7a0e5fe84ad35fb5f95b9ceeac79','12',0,0,'','',0,'','','','2008-04-30 21:32:07'),
 ('asd@h.j','af15d5fdacd5fdfea300e88a8e253e82','ss',0,0,'','',0,'','','','2008-04-27 22:31:53'),
 ('dsaf@l.p','0b4e7a0e5fe84ad35fb5f95b9ceeac79','aa',0,0,'','',0,'','','','2008-04-30 19:35:42'),
 ('feng@163.com','e10adc3949ba59abbe56e057f20f883e','feng',0,0,'','',0,'','','','2008-07-02 13:51:13'),
 ('ff@fdf.dfsd','0b4e7a0e5fe84ad35fb5f95b9ceeac79','a',0,0,'','',0,'','','','2008-07-02 13:49:53'),
 ('qwer@l.l','0b4e7a0e5fe84ad35fb5f95b9ceeac79','21',12,1,'','',0,'','','','2008-05-05 15:45:55'),
 ('reerqe@k.k','0b4e7a0e5fe84ad35fb5f95b9ceeac79','12',0,1,'','',0,'','','','2008-04-28 17:04:50'),
 ('sss@s.s','af15d5fdacd5fdfea300e88a8e253e82','用户',23,0,'1234567','2345678',0,'sgfsfga','12345','3456565','2008-05-06 15:22:48'),
 ('wyz@163.com','0b4e7a0e5fe84ad35fb5f95b9ceeac79','wyz',45,1,'4534643','',0,'','','','2008-06-23 17:31:59');
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;


--
-- Definition of table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `MesID` bigint(20) unsigned NOT NULL auto_increment COMMENT '资讯ID',
  `MesTitle` varchar(100) character set utf8 NOT NULL COMMENT '资讯标题',
  `MesContent` varchar(2000) character set utf8 NOT NULL COMMENT '资讯内容',
  `PubTime` datetime NOT NULL COMMENT '发布时间',
  `AdminID` int(10) unsigned NOT NULL COMMENT '发布人ID',
  `FocTime` datetime default NULL COMMENT '生效时间',
  `FaiTime` datetime default NULL COMMENT '失效时间',
  `Authority` char(2) default NULL COMMENT '浏览权限',
  PRIMARY KEY  (`MesID`),
  KEY `AdminID` (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`MesID`,`MesTitle`,`MesContent`,`PubTime`,`AdminID`,`FocTime`,`FaiTime`,`Authority`) VALUES 
 (1,'T恤文化衫图案采用的印制方法','T恤、文化衫印花工艺 \r\n　　T恤、文化衫印花基本上分三类，丝网印花，转移印花和手绘三种。 \r\n　　丝网印花是印制T恤、文化衫应用最多的印花工艺。丝网印花技术相对复杂，主要有设计，出菲林，晒版，印花，烘干几个步骤。 \r\n　　转移印花技术是这几年风行的一种印花技术，就是先将图案打印（印刷）到转印纸上，再通过高温高压把图案印在T恤面料上，相对丝网印花来说，转移印花有迅速便捷，色彩逼真的优点，但是也有色牢度相对较低，批量定制成本高等缺点。 \r\n　　手绘：现在多数手绘的T恤、文化衫都是用喷绘来完成，当然也有很多用笔画的，用的颜料一般是丙稀颜料和纺织染料，手绘T恤、文化衫的成本也相对较高，不适合批量制作。 \r\n\r\n\r\n选择印花图案时要注意的几点： \r\n\r\n尽量避免特别大的色块，特别是胸口这里，大色块不管你用胶浆还是油墨印花都会在出汗的时候造成印花的位置不透气。 \r\nT恤、文化衫印花有前身，后身和袖口三个位置，避免你的图案一直从袖窿连到肩的位置，因为小批量的印花多数是成衣印花，这些位置有拼缝会影响印刷效果也会增加成本。 \r\n选择丝网印花，要控制颜色，因为颜色的数目越多，成本也就越高。 \r\n丝网印花应避免用颜色的渐变，因为印出来的渐变和屏幕里面显示的会有很大的差异，毕竟印在面料上和印在纸上是不同的。 \r\n','2008-06-10 11:46:05',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','1'),
 (2,'面料的染色','面 料 的 染 色：面料染色通常采用普通染料和活性染料两种染色方法。\r\n\r\n普通染料的特点：颜色亮丽，但色牢度较低，洗涤及穿着时易褪色,不易制作有配色的服装，\r\n                但成本较活性染料低。 \r\n\r\n活性染料的特点：颜色亮丽、鲜艳，色牢度高，不褪色，多用于有深浅配色的服装，但\r\n                成本很高。 \r\n\r\n','2008-06-10 16:14:14',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','0'),
 (3,'针织面料知识','一、针织面料的纱支\r\n    纯棉纱线是由棉花纺制的具有一定细度、长度无限的单纱或股线，适用于梭织、针织、制线、制绳等。其规格常用英制支数表示，棉纱英制支数（Ne）的定义为：公定重量为一磅重的棉纱所具有的长度码数。棉纱的英制 支数计算：公定重量一磅重的棉纱，有几个840码，称为几英支。如：含32个840码，就称为32英支，以此类推。 \r\n\r\n二、纱支分类 \r\n    粗支纱：18英支及以下的纯棉纱线，主要用于织造粗厚织物或起绒起圈棉织物。 \r\n    中支纱：19-29英支的纯棉纱线。主要用于一般要求的针织服装。 \r\n    细支纱：30-60英支的纯棉纱线。主要用于高档针棉织品。 \r\n    较细支纱：60英支以上的纯棉纱线，用于高档针棉织品。 \r\n\r\n三、普梳与精梳\r\n    普梳纱：指用普梳纺纱工艺纺出的纱线，也称未精梳纱。 \r\n    精梳纱：指用品质优良的棉纤维作原料，纺制时比普梳纱增加精梳工序而生产的纱线。 \r\n\r\n四、针织面料的克重\r\n    一般为平方米面料重量的克数。克重是针织面料的一个重要的技术指标。 \r\n    针织产品中，一般来讲，克重越重，面料质地越厚实。 \r\n','2008-06-10 16:18:58',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','0'),
 (4,'T恤、文化衫的面料选择','　　用于T恤、文化衫制作的常用面料包括：纯棉汗布、涤棉单双面以及纯棉、涤棉六角、四角网眼、人字纹、复合罗纹、提条网眼等。 \r\n\r\n　　涤棉面料的特点：手感柔软厚实，洗涤不易变形，但穿着舒适度较纯棉稍差。常见的涤棉为80%棉，20%涤或65%棉，35%涤的比例。\r\n\r\n　　纯棉面料的特点：手感较好，穿着舒适环保，克重一般在160克到300克之间，太薄会很透，太厚会闷热，一般选择180-260克重之间为佳，支数一般为21支和32支，是指的棉纤维长度的平均数，越高越柔软，而面纱又分为普纱，半精纱和精纱，普纱面料表面会比较粗糙，特别是深色面料会有白色的纱点。精纱的面料表面比较整洁，手感也很柔软。 \r\n\r\n','2008-06-10 16:19:40',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','0'),
 (5,'T恤/文化衫图案设计要求','T恤/文化衫图案设计要求\r\n\r\n\r\n由于制作工艺的局限性和材料加工方法的制约，决定了T恤/文化衫图案设计的特殊性\r\n\r\n一、色彩\r\n     从装饰图案的美学原则看，一个图案的色彩一般控制在四色之内为佳;从加工设备来说，要求同一图案不可超过六色；从成本控制上看，为达到最佳性价比，颜色也不宜太复杂。\r\n\r\n二、大小\r\n     受印刷设备的限制，图案最大不超过40厘米范围内；受T恤质地限制最小字不小于2毫米。小图案不宜用彩色阶调网版印刷，图案小使网点无法发挥表现细腻的优势。通常彩色阶调网版印刷表现层次丰富的30－40厘米的大图案效果非常之好。\r\n\r\n三、位置\r\n       由于是成衣印刷，所以只要把握一个原则，即印刷位置能放平，任何位置都可设计图案，如:前胸，下摆，袖子，后领，后背等，平常的图案哪怕换个印刷位置立即会变得有新意起来。\r\n','2008-06-10 16:20:25',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','0'),
 (6,'喷绘织物洗涤说明','丝网印洗涤标准\r\n\r\n \r\n\r\n          1．  请勿与其他深浅色衣服混洗，防止褪色\r\n\r\n          2．  请用中性洗涤剂在水中手洗，禁止浸泡\r\n\r\n          3．  尽量不要用洗衣机洗涤，用洗衣机洗时要将图案那面翻到反面再洗。\r\n\r\n          4．  清勿用力搓洗和撕扯图案部分\r\n\r\n          5．  请勿用有漂白作用的洗衣粉\r\n\r\n          6．  可用40℃以下温水洗涤\r\n\r\n          7．  请勿用力拧干\r\n\r\n          8．  在阴凉地方吊架晾干\r\n\r\n          9．  可用中温整烫140℃\r\n\r\n \r\n\r\n热转印洗涤标准\r\n\r\n \r\n\r\n          1．  请勿与其他衣物混洗\r\n\r\n          2．  请勿用热水洗涤，可用40℃以下温水洗涤\r\n\r\n          3．  请勿用手搓洗热转印图案部分\r\n\r\n          4．  请勿用有漂白作用的洗衣粉\r\n\r\n          5．  请勿干洗\r\n\r\n \r\n\r\n注： 衣物长时间不穿着，请叠好摊平，尽量不要使图案部分折叠。\r\n','2008-06-10 16:21:09',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','0'),
 (7,'丝网印刷与丝网印花技术','以丝网材料作为印版支承体的孔版印刷称为“丝网印”，丝网印技术在印刷行业称为“丝网印刷”；在纺织印染行业则称之“丝网印花”。虽然两者在英文中都是“SCREEN PRINTNG”，但由于我国的行业习惯往往分得很清楚，一时不易改变。“印刷”与“印花”突出的共性是“印”，尽管它们的生产工艺设备及印料等有许多不同之处，但它们“印”的基本原理和印版材质，制版工艺是相似或一致的。\r\n\r\n   共同点与差异\r\n\r\n \r\n\r\n印前处理\r\n\r\n \r\n\r\n纺织品丝网印花。图案设计、描黑白分色稿（即阳片）、一般采用连拍工艺感光制版，除独立花形外，主要以手工操作为主，对工人技术素质要求高，工效较低。制版感光材料需用耐水型的。\r\n\r\n \r\n\r\n非纺织品丝网印刷。图案一般以照相或扫描完成，分色以四色居多，印制图案绝大部分是独立的，没有接版工序，感光材料多为耐溶剂型。\r\n\r\n \r\n\r\n丝网材料\r\n\r\n \r\n\r\n它是网印的主体材料，用蚕丝编织的丝网早已被尼龙丝网取代，尼龙丝网虽具有很高的强度、耐磨性及弹性，但易受温湿度变化的影响，伸缩性较大，影响套版的准确性，因此在印制高档产品时，普遍采用聚酯（涤纶）丝网。另外还有金属丝网，如圆网印花用的镍网和电路板用的不锈钢丝网。丝网规格品种繁多，其幅宽为36～90英寸，网目从80-500目／英寸，可根据不同的用途选用。\r\n\r\n \r\n\r\n丝网印设备\r\n\r\n \r\n\r\n纺织品丝网印花有圆网和平网之分,平网设备有印花台板、自动化平网印花机和转盘印花机等。其中自动平网机最大幅宽为 3.2m，长度约60m，最多套色为24色，属于大型设备；纺织品网印一般为连续式印花，即使是独立图案的手帕、桌布等也是连续印好后裁剪而成的，服装衣片和T恤衫以转盘印花居多。\r\n\r\n \r\n\r\n非纺织品丝网印刷的设备比较复杂,由于承印物不同而拥有独特的印刷方式和特殊的印刷效果，要根据承印对象来选择印刷设备。大体上有案台式手动、半自动、全自动平网印刷机和滚筒式、曲面、立体式印刷机等，而且专用设备居多，印制面积大小的差距也很大，它们的共同特点是以独立印制方式为主（即一个工件一个工件单独印刷）。\r\n\r\n \r\n\r\n印料的差异\r\n\r\n \r\n\r\n纺织品印花一般以染料为主，尤其在丝绸织物上，需按不同纤维性质采用相应的染料。技术工艺及配套设备比较复杂，印花用涂料印花浆为印料，有人称之为“水性油墨”。因实用性的需要，纺织品丝网印花的色泽必须具有一定的坚牢度（不易褪色），同时它色泽变化大，所以浆料与色料一般要分别销售和储存，使用时按要求配成印花浆。另外还有众多特种功能性涂料印花浆，它往往不受织物纤维性质的限制，因此涂料丝网印花占有一定的位置。\r\n\r\n \r\n\r\n非纺织品网印油墨。这类油墨几乎都是溶剂性的，它最大的特点是“专用性”，就是印制什么材料使用什么油墨；其次油墨的色泽大部分有成品出售，如四色油墨等。另外还有一些特种功能性油墨，如发泡油墨、光亮油墨、荧光油墨等。近年来网印油墨品种不断增多，恕不评述。\r\n\r\n \r\n\r\n印后加工处理\r\n\r\n　　\r\n\r\n    纺织品丝网印花工艺中，印后处理十分重要，必须经过高温蒸化或培烘进行固色，使染料与纺织纤维结合，以确保色泽的牢度。固色后还要水洗，清除印浆中的载体和未固着的染料，使色泽艳亮。即使采用涂料工艺也要高温培烘，但可以不水洗。而非纺织品网印的后序处理，一般来说比较简单，但是也要按照印制产品的质量要求采取一些必要的处理，如UV油墨的光固化处理等。\r\n','2008-06-10 16:46:35',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','0'),
 (8,'针织服装选购方法','    现在的针织衣服有很多都是化纤质地，因此在买的时候最好先闻一下，如果没有异味才能购买，否则会对皮肤有害。 \r\n\r\n \r\n\r\n    针织衫的弹性非常重要，购买时拉抻一下衣服的表面，检查针织的弹性如何，弹性差的针织衫水洗后容易变形。\r\n\r\n \r\n\r\n    一定要翻开衣服的里侧看水洗说明，问清导购人员是否需要干洗，能否在阳光下曝晒等问题，便于以后打理。\r\n\r\n \r\n\r\n    检查针织衫表面所有纱线的接头是否平顺，针织的纹路是否一致，纱线的色泽是否匀称，仔细看好挑选后才会买得放心。\r\n','2008-06-10 16:49:53',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','1'),
 (9,'服装材料基本性能','1.吸湿性能。吸湿性是服装材料必备的基本性能之一。良好的吸湿性能可以使人穿着时感到舒适，及时吸附人体排出的汗液，调节体温。从服装材料的组织结构来看，针织材料比梭织材料的吸湿性能好，其中经编针织为最佳。在实际使用时，外衣材料的吸湿性应比内衣材料的吸湿性差。\r\n \r\n 　　2.保温性能。保温性是服装材料必备的基本性能之一。纺织纤维中所含的静止空气越多，保温性能就越强。比如，毛线比棉线更蓬松，保温性就更好。质地疏松的织物比质地紧密的织物保温性强，例如：粗纺呢绒的保温性比精纺呢绒强。此外，天然纤维比化学纤维的保温性好。\r\n \r\n 　　3.弹性和强度。弹性是指服装材料受挤压变形后恢复原状的能力。通常，天然纤维的弹性较好，但恢复原状的能力也较弱。合成纤维，尤其是涤纶，其恢复原状的能力很强，制成的服装更为挺括。强度是指使用时的坚牢程度。一般来说，合成纤维的强度要比天然纤维的强度大得多，不易破损。\r\n \r\n 　　4.透气性能。透气性能是调节人体舒适感的性能，与人体健康密切相关。透气性能的强弱，取决于材料组织的密度、厚度及其表面形状，选用时，应根据设计意图，慎重挑选。\r\n','2008-06-10 16:50:33',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','1'),
 (10,'服装洗涤与保养方法','水洗的衣服浸湿后及时洗涤，不要浸泡，避免用碱性较大的洗衣粉。 \r\n    人造纤维类面料和各类绒线水洗时只宜轻轻搓揉，清水漂净后，不能用力拧绞，\r\n可用洗衣机甩干。\r\n    合成纤维类面料遇水温过高时，会出现收缩、发粘和表面皱巴等情况，故不可用\r\n大于30℃的水洗涤。\r\n    棉印染布初次水洗时如发现染料有浮色，属于正常现象。\r\n    牛仔面料因其所用染料的特殊性，遇水会有褪色现象，属正常情况。\r\n    羊毛、丝和人造纤维类面料存放时要避免受压。\r\n    颜色深浅不同的衣服要分开存放，防止染色或变黄。\r\n    牛仔服装应与其他衣服分开洗涤及存放，以免染色。 ','2008-06-10 16:50:59',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','1'),
 (11,'针织面料介绍','   针织面料具有质地柔软、吸湿透气、优良的弹性与延伸性及其可生产性。针织服饰穿着舒适、贴身和体、无拘紧感、能充分体现人体曲线。\r\n现代针织面料更加丰富多彩，已经进入多功能化和高档化的发展阶段，各种肌理效应、不同功能的新型针织面料开发出来，给针织品带来前所未有的感官效果和视觉效果。\r\n\r\n\r\n醋酸纤维（Acetel）针织面料\r\n\r\n\r\n    醋酸纤维具有真丝一样的独特性能，纤维光泽及颜色鲜艳，悬垂性及手感优良。用其生产的针织面料手感滑爽、穿着舒适、吸湿透气、质地轻、回潮率低、不易起球、抗静电。采用醋酸纤维编织的针织乔其纱、玉米花等面料，得到消费者的偏爱。\r\n\r\n\r\n莫黛尔（Modal）纤维针织面料\r\n\r\n\r\n    莫黛尔（Modal）纤维是一种新型环保性纤维，它集棉的舒适性、粘胶的悬垂性、涤纶的强度、真丝的手感于一体，而且具有经过多次洗涤以后，仍然保持其柔软和光亮的色泽。针织工艺仍然将纤维与针织本身柔软蓬松、高弹舒适等特点相结合，使二者的优越性能相得益彰。在针织圆纬机（大圆机）上，采用莫黛尔和氨纶裸丝交织的单、双面针织面料，柔软滑爽、富有弹性、悬垂飘然、光泽艳丽、吸湿透气，并具有丝绸般的手感，用该种面料设计的时尚服饰，能最大限度的体现人体曲线，雕塑出女性胴体的性感和魅力，是前卫时尚族青睐的高品位针织服饰。 \r\n\r\n\r\n强捻精梳纱针织面料\r\n\r\n\r\n    强捻的精梳纱制成的凉爽麻型的针织面料不仅具有麻纱感，而且凉爽吸湿性好特别是真丝加捻，是一种比较理想的高档针织面料，除了具有真丝的优良性能外，面料手感更丰满，而且较硬挺有身骨，尺寸稳定性好，具有较好的抗绉性，是高档职业装、休闲装的理想面料。 \r\n\r\n\r\nCoolmax纤维针织面料\r\n\r\n\r\n    具有四沟槽的Coolmax纤维 ，能将人体活动时所产生的汗水迅速排至服装表层蒸发，保持肌肤清爽，令活动倍感舒适。它有着良好的导湿性，与棉纤维交织的针织面料具有良好的导湿效果，广泛的用来缝制T恤衫、运动装等。 \r\n\r\n\r\n再生绿色纤维Lyocel针织面料\r\n\r\n\r\n    再生绿色纤维Lyocell、天丝与氨纶裸丝交织的针织平针组织（汗布）、罗纹、双罗纹（棉毛）及其变化组织的面料，质地柔软、布面平整光滑、弹性好，产品风格飘逸，具有丝绸的外观，悬垂性、透气性和水洗稳定性良好，都是设计流行性紧身时装、休闲装、运动装的理想高档面料。 \r\n\r\n\r\n闪光针织面料\r\n\r\n    具有闪光的效果，一直是服装设计师的宠爱。在针织圆纬机（大圆机）上，采用金丝和银丝原料与其他纺织原料交织，在面料的表面具有强烈的反光闪色效应或采用镀金方法，在针织面料上出现各种图案的闪光效应，而面料的反面平整、柔软舒适，是比较好的针织服装面料。用这种针织面料设计的紧身女时装及晚礼服，会透过闪光面料耀眼、浪漫的风格，展示出针织面料光彩照人、华贵亮丽的韵味，全方位的表现针织服饰的风采，为产品开发提供了广泛的前景。\r\n \r\n   \r\n  \r\n','2008-06-10 16:51:27',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','1'),
 (12,'圆领文化衫的由来','文章转载自 http://www.rmtd.com.cn/Article/2006/200612/2006-12-13/20061213091116.html\r\n\r\n    第一次世界大战期间，法国士兵就把圆领衫作为内衣穿在军装里面。不论工作、休息、作战，他们都觉得很方便。英国士兵知道后，纷纷效仿。\r\n\r\n    但圆领衫在当时仅仅是一种内衣，它是如何登上大雅之堂的呢？这要归功于美国影星马龙·白兰度。他在影片《欲望号街车》中，把圆领衫当作外衣穿起来，看上去十分潇洒。\r\n\r\n    在他的影响下，圆领衫在整个美国流行起来，成为最大众化、最经济的服装。20世纪50年代，在一次赛车比赛中，运动员的圆领衫都印上了鲜艳的图案。从此，圆领衫开始加上各种鲜艳夺目的图案和文字，成为圆领文化衫。\r\n\r\n    圆领文化衫上的文字有英文、中文、日文、阿拉伯文等等，穿者不一定都知道文化衫上文字的具体含义，只是图个新鲜、有趣。\r\n\r\n\r\n    小 悠  辑   \r\n    \r\n  来源:《人民铁道》报2006-12-13第7版     作者:小悠\r\n','2008-06-10 16:52:03',0,'2008-06-10 00:00:00','2008-06-30 00:00:00','1'),
 (13,'??','??????????????? ','2008-06-17 15:03:26',0,'2008-06-25 00:00:00','2008-06-30 00:00:00','0');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `OrderID` bigint(50) unsigned NOT NULL auto_increment COMMENT '订单ID',
  `CustomID` bigint(20) unsigned NOT NULL COMMENT '定制ID',
  `Number` bigint(50) unsigned NOT NULL COMMENT '订购数量',
  `BookTime` datetime NOT NULL COMMENT '订购时间',
  `BookStatus` tinyint(1) unsigned NOT NULL COMMENT '订单状态：0未处理1已处理',
  `UserID` varchar(30) NOT NULL COMMENT '会员ID',
  `AllPrice` float unsigned NOT NULL COMMENT '总价格',
  `MF_Name` varchar(50) character set utf8 default ' ' COMMENT '厂商名称',
  `Size` varchar(20) NOT NULL,
  PRIMARY KEY  (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `PicID` bigint(20) unsigned NOT NULL auto_increment COMMENT '图片ID',
  `PicName` varchar(30) character set utf8 NOT NULL COMMENT '图片名称',
  `UserID` varchar(30) NOT NULL COMMENT '会员ID',
  `PicCate` tinyint(3) unsigned NOT NULL COMMENT '图片类别',
  `PicPath` varchar(200) character set utf8 NOT NULL COMMENT '图片路径',
  `PicTime` datetime NOT NULL COMMENT '上传时间',
  `Status` tinyint(3) unsigned NOT NULL COMMENT '0：正常；1：已删',
  PRIMARY KEY  (`PicID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `picture`
--

/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` (`PicID`,`PicName`,`UserID`,`PicCate`,`PicPath`,`PicTime`,`Status`) VALUES 
 (40,'撒旦法','feng@163.com',0,'20086914115167.jpg','2008-07-09 14:11:52',0),
 (41,'飞','feng@163.com',0,'2008691412395.jpg','2008-07-09 14:12:03',0),
 (42,'方法','feng@163.com',0,'2008691412162.bmp','2008-07-09 14:12:17',0),
 (43,'凤飞飞','feng@163.com',0,'20086914122937.jpg','2008-07-09 14:12:30',0),
 (44,'形成vxv','feng@163.com',0,'20086914124227.jpg','2008-07-09 14:12:42',0),
 (45,'额','feng@163.com',0,'20086914125467.jpg','2008-07-09 14:12:54',0),
 (46,'不能','feng@163.com',0,'20086914131756.jpg','2008-07-09 14:13:17',0),
 (47,'何故','feng@163.com',0,'20086914133683.jpg','2008-07-09 14:13:36',0),
 (48,'呵呵','feng@163.com',0,'20086914134656.jpg','2008-07-09 14:13:46',0),
 (49,'哈哈哈','feng@163.com',0,'2008691413585.jpg','2008-07-09 14:13:58',0),
 (50,'广告','feng@163.com',0,'200869141483.jpg','2008-07-09 14:14:09',0),
 (51,'灌灌灌灌','feng@163.com',0,'20086914142122.jpg','2008-07-09 14:14:22',0),
 (52,'个','feng@163.com',0,'20086914143584.jpg','2008-07-09 14:14:36',0);
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;


--
-- Definition of table `picturefavourites`
--

DROP TABLE IF EXISTS `picturefavourites`;
CREATE TABLE `picturefavourites` (
  `Pic_FavID` int(10) unsigned NOT NULL auto_increment COMMENT '收藏ID',
  `PicID` bigint(20) unsigned NOT NULL COMMENT '图片ID',
  `UserID` varchar(30) NOT NULL COMMENT '会员ID',
  `Pic_Fav_Time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY  (`Pic_FavID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `picturefavourites`
--

/*!40000 ALTER TABLE `picturefavourites` DISABLE KEYS */;
INSERT INTO `picturefavourites` (`Pic_FavID`,`PicID`,`UserID`,`Pic_Fav_Time`) VALUES 
 (6,6,'aaa@1.l','2008-05-14 13:20:31'),
 (15,5,'aaa@1.l','2008-05-14 13:33:12'),
 (26,4,'aaa@1.l','2008-06-05 10:03:08'),
 (27,5,'feng@163.com','2008-07-03 13:13:56');
/*!40000 ALTER TABLE `picturefavourites` ENABLE KEYS */;


--
-- Definition of table `picturerecommended`
--

DROP TABLE IF EXISTS `picturerecommended`;
CREATE TABLE `picturerecommended` (
  `Pic_RM_ID` int(10) unsigned NOT NULL auto_increment COMMENT '推荐ID',
  `PicID` bigint(20) unsigned NOT NULL COMMENT '图片ID',
  `Pic_RM_Order` int(10) unsigned default NULL COMMENT '推荐顺序',
  PRIMARY KEY  (`Pic_RM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `picturerecommended`
--

/*!40000 ALTER TABLE `picturerecommended` DISABLE KEYS */;
INSERT INTO `picturerecommended` (`Pic_RM_ID`,`PicID`,`Pic_RM_Order`) VALUES 
 (15,40,0),
 (16,41,16),
 (17,42,17),
 (18,43,18),
 (19,44,19),
 (20,45,20),
 (21,46,21);
/*!40000 ALTER TABLE `picturerecommended` ENABLE KEYS */;


--
-- Definition of table `reportinfo`
--

DROP TABLE IF EXISTS `reportinfo`;
CREATE TABLE `reportinfo` (
  `ReportID` int(10) unsigned NOT NULL auto_increment COMMENT '举报ID',
  `PicID` bigint(20) unsigned NOT NULL COMMENT '图片ID',
  `UserID` varchar(30) NOT NULL COMMENT '会员ID',
  `ReportTime` datetime NOT NULL COMMENT '举报时间',
  PRIMARY KEY  (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reportinfo`
--

/*!40000 ALTER TABLE `reportinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportinfo` ENABLE KEYS */;


--
-- Definition of table `t_shirt`
--

DROP TABLE IF EXISTS `t_shirt`;
CREATE TABLE `t_shirt` (
  `T_ShirtID` int(10) unsigned NOT NULL auto_increment COMMENT '文化衫ID',
  `CateID` tinyint(3) unsigned NOT NULL COMMENT '类别名称',
  `Price` float NOT NULL COMMENT '价格',
  `Intro` text character set utf8 COMMENT '介绍',
  `Sex` tinyint(3) unsigned NOT NULL COMMENT '0：男；1：女',
  `T_ShirtPath_1` varchar(200) character set utf8 NOT NULL COMMENT '文化衫正面路径',
  `T_ShirtPath_2` varchar(200) character set utf8 NOT NULL COMMENT '文化衫反面路径',
  `ShirtName` varchar(30) character set utf8 NOT NULL COMMENT '文化衫名称',
  `Status` tinyint(3) unsigned NOT NULL COMMENT '0：正常；1：断货',
  PRIMARY KEY  (`T_ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_shirt`
--

/*!40000 ALTER TABLE `t_shirt` DISABLE KEYS */;
INSERT INTO `t_shirt` (`T_ShirtID`,`CateID`,`Price`,`Intro`,`Sex`,`T_ShirtPath_1`,`T_ShirtPath_2`,`ShirtName`,`Status`) VALUES 
 (43,0,100,'100',0,'/upload/temp/20086101425054.jpg','/upload/temp/20086101425079.jpg','男人',0),
 (44,0,111,'111',0,'/upload/temp/20086101441914.jpg','/upload/temp/20086101441942.jpg','搞活',0),
 (45,0,11,'11',0,'/upload/temp/2008610144386.jpg','/upload/temp/20086101443837.jpg','时光',0),
 (46,0,11,'11',0,'/upload/temp/20086101451795.jpg','/upload/temp/20086101451733.jpg','力量',0),
 (47,0,44,'44',0,'/upload/temp/20086101453114.jpg','/upload/temp/20086101453153.jpg','地方',0),
 (48,0,44,'44',0,'/upload/temp/20086101454418.jpg','/upload/temp/2008610145447.jpg','飞过海',0),
 (49,0,44,'44',0,'/upload/temp/20086101455972.jpg','/upload/temp/20086101455950.jpg','44',0),
 (50,0,44,'44',0,'/upload/temp/2008610146118.jpg','/upload/temp/20086101461158.jpg','4444',0),
 (51,0,44,'11',0,'/upload/temp/20086101462377.jpg','/upload/temp/20086101462347.jpg','发射点法',0),
 (52,0,584,'4545',0,'/upload/temp/20086101463579.jpg','/upload/temp/20086101463572.jpg','士大夫上',0),
 (53,0,4542,'4545',0,'/upload/temp/20086101464680.jpg','/upload/temp/2008610146469.jpg','仍然',0),
 (54,0,452,'4545',0,'/upload/temp/20086101465822.jpg','/upload/temp/20086101465892.jpg','共和国',0),
 (55,0,45,'4545',0,'/upload/temp/20086101471299.jpg','/upload/temp/20086101471260.jpg','各个',0);
/*!40000 ALTER TABLE `t_shirt` ENABLE KEYS */;


--
-- Definition of table `t_shirtcategories`
--

DROP TABLE IF EXISTS `t_shirtcategories`;
CREATE TABLE `t_shirtcategories` (
  `CateID` int(10) unsigned NOT NULL auto_increment COMMENT '类别ID',
  `CateName` varchar(50) NOT NULL COMMENT '类别名称',
  `Price` float NOT NULL COMMENT '价格',
  `Intro` text COMMENT '介绍',
  `Color` varchar(50) NOT NULL COMMENT '颜色',
  PRIMARY KEY  (`CateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_shirtcategories`
--

/*!40000 ALTER TABLE `t_shirtcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shirtcategories` ENABLE KEYS */;


--
-- Definition of table `t_shirtcustom`
--

DROP TABLE IF EXISTS `t_shirtcustom`;
CREATE TABLE `t_shirtcustom` (
  `CustomID` bigint(20) unsigned NOT NULL auto_increment COMMENT '定制ID',
  `PosPic` varchar(30) default NULL COMMENT '正面图片',
  `NegPic` varchar(30) default NULL COMMENT '反面图片',
  `PosLoc_1` int(10) unsigned default NULL COMMENT '正面水平位置',
  `NegLoc_1` int(10) unsigned default NULL COMMENT '反面水平位置',
  `CustomTime` datetime NOT NULL COMMENT '定制时间',
  `UserID` varchar(30) NOT NULL COMMENT '会员ID',
  `T_ShirtID` int(10) unsigned NOT NULL COMMENT '文化衫ID',
  `PosLoc_2` int(10) unsigned default NULL COMMENT '正面垂直位置',
  `NegLoc_2` int(10) unsigned default NULL COMMENT '反面垂直位置',
  `PosSize` int(10) unsigned default NULL COMMENT '正面大小',
  `NegSize` int(10) unsigned default NULL COMMENT '反面大小',
  `T_ShirtName` varchar(45) character set utf8 NOT NULL COMMENT '文化衫名称',
  PRIMARY KEY  (`CustomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_shirtcustom`
--

/*!40000 ALTER TABLE `t_shirtcustom` DISABLE KEYS */;
INSERT INTO `t_shirtcustom` (`CustomID`,`PosPic`,`NegPic`,`PosLoc_1`,`NegLoc_1`,`CustomTime`,`UserID`,`T_ShirtID`,`PosLoc_2`,`NegLoc_2`,`PosSize`,`NegSize`,`T_ShirtName`) VALUES 
 (16,'20086914115167.jpg','20086914131756.jpg',130,156,'2008-07-10 15:10:48','null',44,300,277,142,117,'????????'),
 (17,'20086914133683.jpg','20086914133683.jpg',130,130,'2008-07-10 15:15:19','feng@163.com',49,300,300,150,150,'????'),
 (18,'20086914131756.jpg','20086914124227.jpg',130,130,'2008-07-10 15:23:22','feng@163.com',44,300,300,150,150,'???ê'),
 (19,'20086914131756.jpg','20086914133683.jpg',130,130,'2008-07-10 15:24:39','feng@163.com',44,300,300,150,150,'????'),
 (20,'20086914131756.jpg','20086914133683.jpg',130,130,'2008-07-10 15:32:58','null',47,300,300,150,150,'测试'),
 (21,'2008691413585.jpg','2008691413585.jpg',130,130,'2008-07-10 15:36:36','anonymous',53,300,300,150,150,'中文'),
 (22,'20086914125467.jpg','20086914131756.jpg',130,130,'2008-07-11 09:51:51','anonymous',44,300,300,150,150,'豆豆'),
 (23,'20086914131756.jpg','20086914133683.jpg',130,130,'2008-07-11 11:27:44','feng@163.com',44,300,300,150,150,'可以啊没'),
 (24,'200869141483.jpg','20086914142122.jpg',130,130,'2008-07-11 11:29:01','feng@163.com',49,300,300,150,150,'黑色');
/*!40000 ALTER TABLE `t_shirtcustom` ENABLE KEYS */;


--
-- Definition of table `t_shirtfavourites`
--

DROP TABLE IF EXISTS `t_shirtfavourites`;
CREATE TABLE `t_shirtfavourites` (
  `T_FavID` int(10) unsigned NOT NULL auto_increment COMMENT '收藏ID',
  `T_ShirtID` bigint(20) unsigned NOT NULL COMMENT '文化衫ID',
  `UserID` varchar(30) NOT NULL COMMENT '会员ID',
  `T_Fav_Time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY  (`T_FavID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_shirtfavourites`
--

/*!40000 ALTER TABLE `t_shirtfavourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shirtfavourites` ENABLE KEYS */;


--
-- Definition of table `t_shirtrecommended`
--

DROP TABLE IF EXISTS `t_shirtrecommended`;
CREATE TABLE `t_shirtrecommended` (
  `T_RM_ID` int(10) unsigned NOT NULL auto_increment COMMENT '推荐ID',
  `T_ShirtID` bigint(20) unsigned NOT NULL COMMENT '文化衫ID',
  `T_RM_Order` int(10) unsigned default NULL COMMENT '推荐顺序',
  PRIMARY KEY  (`T_RM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_shirtrecommended`
--

/*!40000 ALTER TABLE `t_shirtrecommended` DISABLE KEYS */;
INSERT INTO `t_shirtrecommended` (`T_RM_ID`,`T_ShirtID`,`T_RM_Order`) VALUES 
 (29,43,56),
 (30,44,56),
 (31,45,56),
 (32,46,56),
 (33,47,56),
 (34,48,56),
 (35,51,56),
 (36,50,56);
/*!40000 ALTER TABLE `t_shirtrecommended` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
