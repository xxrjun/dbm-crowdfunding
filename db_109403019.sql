CREATE DATABASE  IF NOT EXISTS `db_109403019` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_109403019`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_109403019
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'科技'),(2,'遊戲'),(3,'教育'),(4,'地方創生'),(5,'空間'),(6,'飲食'),(7,'時尚'),(8,'音樂'),(9,'新春賀喜'),(10,'攝影');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `user_comment` text,
  `proposer_response` text,
  `comment_time` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,5,9,'不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)','2020/11/18 22:12:05'),(2,1,10,'GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～','2020/9/19 14:18:32'),(3,1,3,'請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?','','2021/6/2 07:05:15'),(4,5,4,'讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～','2019/12/8 22:59:25'),(5,4,8,'加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！','2021/2/8 23:12:12'),(6,10,1,'上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )','2020/10/19 15:18:52'),(7,1,2,'我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com','2021/6/2 09:55:13'),(8,2,6,'請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)','2019/12/8 12:59:21'),(9,1,7,'有機會可以早點出貨嗎？6/1要等很久','','2020/11/18 22:12:12'),(10,3,1,'請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收','2020/3/8 02:18:42');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int DEFAULT NULL,
  `last_editor_id` int DEFAULT NULL,
  `question` text,
  `answer` text,
  `updated_at` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-05-24 17:13:00'),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-05-24 15:03:31'),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-05-24 15:03:43'),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-05-23 15:28:00'),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-05-23 15:28:00'),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-05-23 15:18:00'),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-05-24 21:30:00'),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-05-15 14:36:00'),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-05-19 15:06:00'),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-05-19 15:06:00');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followingrecord`
--

DROP TABLE IF EXISTS `followingrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followingrecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followingrecord`
--

LOCK TABLES `followingrecord` WRITE;
/*!40000 ALTER TABLE `followingrecord` DISABLE KEYS */;
INSERT INTO `followingrecord` VALUES (1,6,9),(2,1,10),(3,1,3),(4,5,4),(5,4,8),(6,10,1),(7,1,2),(8,2,6),(9,1,7),(10,3,1);
/*!40000 ALTER TABLE `followingrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `phone` text,
  `email` text,
  `salt` text,
  `address` text,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'毛若穎','0921003614','in.consequat@yahoo.com','0oplfZ16tyLX','366 苗栗縣銅鑼鄉民權路31號'),(2,'林芳岑','0988008346','adipiscing.enim.mi@outlook.com','7gB%z9Svg8EW','600 嘉義市東區世賢路24號'),(3,'胡素芝','0922830125','nullam.velit@yahoo.com','JJQF0j%tkx3i','325 桃園市龍潭區淮子埔一路29號'),(4,'童雅婷','0958351743','sed.auctor@hotmail.com','Rv$uGmL&C!%g','540 南投縣南投市三和一路14號'),(5,'賴麗萍','0912587773','sagittis.nullam@google.com','XcZg6Be^cU2y','508 彰化縣和美鎮潭北路15號'),(6,'黃志斌','0960105109','nec.leo.morbi@protonmail.com','aZjy*GvZt@s*','711 臺南市歸仁區崙頂二街11號'),(7,'廖松白','0961749001','sociosqu.ad@yahoo.com','j8tI5!wG88PM','411 臺中市太平區北田路14號'),(8,'徐嘉柏','0928735721','proin.non@protonmail.com','n7UDOe0uspZk','801 高雄市前金區自立二路18號'),(9,'李麗珠','0968169143','arcu.vel.quam@hotmail.com','wlmM33nAD@SR','201 基隆市信義區義四路22號'),(10,'施泓音','0970691667','dui.quis.accumsan@google.com','&@^ODhk0MH&l','622 嘉義縣大林鎮早知31號');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membercredential`
--

DROP TABLE IF EXISTS `membercredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membercredential` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hashed_user_id` int DEFAULT NULL,
  `hashed_pwd_string` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membercredential`
--

LOCK TABLES `membercredential` WRITE;
/*!40000 ALTER TABLE `membercredential` DISABLE KEYS */;
INSERT INTO `membercredential` VALUES (1,1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(2,2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(3,3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(4,4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538'),(5,5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(6,6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(7,7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(8,8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(9,9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(10,10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802');
/*!40000 ALTER TABLE `membercredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal`
--

DROP TABLE IF EXISTS `proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `title` text,
  `content` text,
  `amount` int DEFAULT NULL,
  `goal` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `viewed_num` int DEFAULT NULL,
  `create_date` text,
  `due_date` text,
  `is_deactivated` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal`
--

LOCK TABLES `proposal` WRITE;
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
INSERT INTO `proposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',2393696,100000,2,1150,'2022/04/06','2022/07/05',0),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ? Kimoo 情緒平衡軟糖 ? 日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\"\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！\"',377200,200000,2,251,'2022/03/23','2022/06/21',0),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',3737138,500000,2,641,'2022/05/04','2022/08/02',0),(4,7,'『Organs without body 2014 S/S 服裝秀』','「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',5050,100000,3,4,'2013/08/21','2013/11/19',1),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',852482,50000,3,194,'2021/12/12','2022/03/12',1),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待','',282244,943038,2,63,'2022/05/25','2022/08/23',0),(7,3,'謎路?Way of Puzzle 2022【It\'s All I Have】專輯發?企劃','',45651,400000,2,31,'2022/05/23','2022/08/21',0),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,100000,1,0,'2022/03/22','',0),(9,10,'SIRUI 75mm ?變形鏡頭','還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',532600,100000,3,200,'2021/07/20','2021/10/18',1),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',1556942,100000,3,3148,'2022/5/24','2022/08/22',1);
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposalmember`
--

DROP TABLE IF EXISTS `proposalmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposalmember` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposalmember`
--

LOCK TABLES `proposalmember` WRITE;
/*!40000 ALTER TABLE `proposalmember` DISABLE KEYS */;
INSERT INTO `proposalmember` VALUES (1,4,8),(2,1,7),(3,2,6),(4,7,3),(5,3,4),(6,10,1),(7,6,4),(8,6,3),(9,5,9),(10,8,2),(11,9,10),(12,10,8);
/*!40000 ALTER TABLE `proposalmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposaloption`
--

DROP TABLE IF EXISTS `proposaloption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposaloption` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int DEFAULT NULL,
  `title` text,
  `price` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposaloption`
--

LOCK TABLES `proposaloption` WRITE;
/*!40000 ALTER TABLE `proposaloption` DISABLE KEYS */;
INSERT INTO `proposaloption` VALUES (1,1,'247 早鳥超值組',2290,'內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。'),(2,3,'單組 體驗初學',1790,'Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ '),(3,9,'【好評追加！超早鳥衣褲組合】',3899,'Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 '),(4,5,'小資支持 12個月每月茶包禮',800,'【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物'),(5,10,'75mm 超級早鳥價格',18800,'75mm F1.8 Anamorphic 1.33X Lens X1 '),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元',1490,'金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款'),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』',1888,'想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕'),(8,7,'【只想聽歌組】',720,'【謎路人 2022 It\'s All I Have】 概念專輯 1張 '),(9,4,'原畫畫作一件10號',15000,'原畫畫作'),(10,2,'【嘖嘖價】1 入 83 折',690,'Kimoo情緒平衡軟糖 1 盒');
/*!40000 ALTER TABLE `proposaloption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorrecord`
--

DROP TABLE IF EXISTS `sponsorrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsorrecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `proposal_option_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorrecord`
--

LOCK TABLES `sponsorrecord` WRITE;
/*!40000 ALTER TABLE `sponsorrecord` DISABLE KEYS */;
INSERT INTO `sponsorrecord` VALUES (1,9,4,800),(2,10,1,2290),(3,3,1,2290),(4,4,4,800),(5,8,9,15000),(6,1,5,18800),(7,2,1,2290),(8,6,10,690),(9,7,1,2290),(10,1,2,1790);
/*!40000 ALTER TABLE `sponsorrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_109403019'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateProposal`(
	IN in_member_id INT,
    IN in_title VARCHAR(120),
    IN in_content TEXT,
    IN in_goal INT,
    IN in_category_id INT,
    OUT out_affected_row_num int
)
BEGIN
	-- Declare a variable to store affected_row_num
	DECLARE temp INT DEFAULT 0;

	-- Check whether the input member exists in our member table
	IF EXISTS (SELECT member_id FROM member
				WHERE member_id = in_member_id)
	THEN
		-- Check whether the input category is valid
		IF EXISTS (SELECT id FROM category
					WHERE id = in_category_id)
		THEN
			-- Insert new proposal into proposal table
			INSERT INTO proposal (category_id, title, content, amount, goal, status, viewed_num, create_date, due_date, is_deactivated)
			VALUES (in_category_id, in_title, in_content, 0, in_goal, 1, 0, NOW(), NULL, 0);
			
			-- update affected_row_num
			SELECT ROW_COUNT() INTO temp;
            
			-- Insert new data into proposalmember table
			INSERT INTO proposalmember(proposal_id, member_id)
			VALUES ((SELECT MAX(id) FROM proposal), in_member_id);
			
            -- update affected_row_num
			SELECT ROW_COUNT() + temp INTO temp;
            
			-- Show result
			SELECT pp.id as proposal_id, pp.title as proposal_title, 
					pp.content as proposal_content, pp.amount, pp.goal,
					pp.status, pp.viewed_num, pp.create_date, pp.due_date, 
					catg.category_name as category
			FROM
				proposal as pp
			JOIN
				category catg ON pp.category_id = catg.id
			ORDER BY pp.id DESC
            LIMIT 1;

		END IF;
    END IF;
    
     -- put temp to out_affected_row_num
	SELECT temp INTO out_affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN in_member_id INT,
    OUT outNumFound int
)
BEGIN
	SELECT fr.member_id, pp.title as proposal_title,
			pp.amount as proposal_amount, pp.goal as proposal_goal
	FROM
		followingrecord fr
	JOIN
		proposal pp ON pp.id = fr.proposal_id
	WHERE
		member_id = in_member_id;
	
	SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN in_member_id INT,
    OUT outNumFound int
)
BEGIN
	SELECT sr.member_id as member_id, ppo.proposal_id as proposal_id, 
			pp.title as proposal_title, ppo.title as proposal_option_title, 
            sr.amount, pp.status
	FROM 
		sponsorrecord sr
    JOIN 
		proposaloption ppo ON sr.proposal_option_id = ppo.id
	JOIN
		proposal pp ON pp.id = ppo.proposal_id
	WHERE
		sr.member_id = in_member_id;
        
	SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN in_ratio FLOAT,
    OUT outNumFound int
)
BEGIN
	SELECT id as proposal_id, title as proposal_title, amount, 
			goal, amount / goal as ratio
	FROM proposal
    WHERE amount / goal >= in_ratio
    ORDER BY amount / goal DESC;
    
    SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalsByKeyword`(
	IN in_keyword VARCHAR(64),
    OUT outNumFound int
)
BEGIN
	SELECT id as proposal_id, title as proposal_title, 
			due_date, amount
    FROM proposal
    WHERE title LIKE CONCAT('%', in_keyword, '%');
    
    SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetRecommendedProposals`(
	IN in_member_id INT
)
BEGIN
	IF in_member_id NOT IN (SELECT member_id FROM member)
    THEN
		SELECT pp.id as proposal_id, pp.title as proposal_title,
				pp.status as status, pp.viewed_num as viewed_num
		FROM
			proposal as pp
		ORDER BY pp.viewed_num
        LIMIT 5;
	ELSE
		SELECT pp.id as proposal_id, pp.title as proposal_title,
				pp.status as status, pp.viewed_num as viewed_num
		FROM
			proposal as pp
		ORDER BY pp.viewed_num
        LIMIT 5;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetUnrepliedComments`(
	IN in_member_id INT,
    OUT outNumFound int
)
BEGIN
	SELECT c.member_id, c.proposal_id, pp.title as proposal_title,
			c.id as comment_id, c.user_comment as member_comment,
            c.comment_time, c.proposer_response
	FROM 
		comment c
	JOIN proposal pp ON pp.id = c.proposal_id
    WHERE c.member_id = in_member_id
    AND c.proposer_response = '' OR c.proposer_response IS NULL;
    
	SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Login`(
	IN in_email VARCHAR(64),
    IN in_hashedpwd VARCHAR(200),
    OUT status_code INT
)
BEGIN
	-- Check whether the input email is exists and the hashed_pwd_string is correct
	IF EXISTS (SELECT email, hashed_pwd_string FROM member 
    JOIN membercredential mc ON member_id = mc.id
    WHERE email = in_email AND hashed_pwd_string = in_hashedpwd)
    THEN
		-- Login Successfully
		SET status_code = 1;
	ELSEIF 
    EXISTS (SELECT email, hashed_pwd_string FROM member 
    JOIN membercredential mc ON member_id = mc.id
    WHERE email = in_email AND hashed_pwd_string != in_hashedpwd)
    THEN
		-- Email exists, but password is wrong
		SET status_code = 2;
	ELSE
		-- Email is not exists
		SET status_code = 3;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegisterMember`(
	IN in_email VARCHAR(64),
    IN in_hashedPwd VARCHAR(200),
    IN in_salt CHAR(64),
    IN in_name VARCHAR(64),
    IN in_address VARCHAR(255),
    IN in_phone VARCHAR(64),
    OUT out_affected_row_num int
)
BEGIN
	DECLARE temp INT DEFAULT 0;
    
	IF NOT EXISTS(SELECT email FROM member WHERE email = in_email)
	THEN
		INSERT INTO member(name, phone, email, salt, address)
        VALUES (in_name, in_phone, in_email, in_salt, in_address);
        
        SELECT ROW_COUNT() INTO temp;
        
        INSERT INTO membercredential(
			id,
			hashed_user_id,
            hashed_pwd_string
        )
        SELECT
			member_id,
			member_id,
            in_hashedPwd
		FROM
			member
        WHERE
			email = in_email;
            
		SELECT ROW_COUNT() + temp INTO temp;
            
		SELECT m.member_id, m.name, m.email, mc.hashed_pwd_string as password,
				m.salt, m.phone, m.address
		FROM
			member m
		JOIN
			membercredential mc ON m.member_id = mc.hashed_user_id
		WHERE m.email = in_email;
	END IF;
    
	-- Get affected_row_num
	SELECT temp INTO out_affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateProposalStatus`(
	IN in_proposal_id INT,
    IN in_status INT,
    OUT out_affected_row_num int
)
BEGIN
	-- Declare a variable to store affected_row_num
	DECLARE temp INT DEFAULT 0;
    
    IF (in_status <= 3 AND in_status >= 1) 
    THEN
		UPDATE proposal
		SET 
			status = in_status,
            due_date = IF(in_status = 2, DATE_ADD(create_date, INTERVAL +90 DAY), due_date)
		WHERE id = in_proposal_id AND status = in_status - 1;
			
		-- update affected_row_num
		SELECT ROW_COUNT() INTO temp;
        
        -- show result if the change is valid
        IF ROW_COUNT() > 0
        THEN
			SELECT id as proposal_id, status
			FROM
				proposal
			WHERE id = in_proposal_id;
		END IF;
	END IF;
    
    -- put temp to out_affected_row_num
	SELECT temp INTO out_affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdatePwd`(
	IN in_member_id INT,
    IN in_hashedPwd VARCHAR(200),
    IN in_salt CHAR(64),
    OUT out_affected_row_num int
)
BEGIN
	-- Declare a variable to store affected_row_num
	DECLARE temp INT DEFAULT 0;
    
	-- check whether the salt and the password is same as before
    IF NOT EXISTS(SELECT * FROM member
			JOIN membercredential ON hashed_user_id = member_id
			WHERE member_id = in_member_id
            AND (salt = in_salt OR hashed_pwd_string = in_hashedPwd)
            )
    THEN
		-- update salt in member
		UPDATE 
			member
		SET
			salt = in_salt
		WHERE
			member_id = in_member_id;
            
		-- update affected_row_num
		SELECT ROW_COUNT() INTO temp;

		-- update hashed password in membercredential
		UPDATE
			membercredential
		SET
			hashed_pwd_string = in_hashedPwd
		WHERE
			hashed_user_id = in_member_id;
            
		-- update affected_row_num
		SELECT ROW_COUNT() + temp INTO temp;
		END IF;

		-- show result if the update is valid
		IF ROW_COUNT() > 0
		THEN
		SELECT member_id, name, email, hashed_pwd_string as password, 
				salt, phone, address
		FROM member
		JOIN membercredential mc ON member_id = mc.hashed_user_id
		WHERE 
			member_id = in_member_id
		LIMIT 1;
	END IF;
    
    -- put temp to out_affected_row_num
	SELECT temp INTO out_affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 14:37:20
