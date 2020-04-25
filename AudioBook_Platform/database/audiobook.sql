-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: audiobook
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add books',7,'add_books'),(26,'Can change books',7,'change_books'),(27,'Can delete books',7,'delete_books'),(28,'Can view books',7,'view_books'),(29,'Can add types',8,'add_types'),(30,'Can change types',8,'change_types'),(31,'Can delete types',8,'delete_types'),(32,'Can view types',8,'view_types'),(33,'Can add users',9,'add_users'),(34,'Can change users',9,'change_users'),(35,'Can delete users',9,'delete_users'),(36,'Can view users',9,'view_users');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` int NOT NULL,
  `author` varchar(32) DEFAULT NULL,
  `content` varchar(32) NOT NULL,
  `addtime` datetime(6) NOT NULL,
  `goods` varchar(32) NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `novel` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_audio_uindex` (`audio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,2,'施耐庵','好看的小说','2020-03-19 10:10:04.000000','武松打虎',NULL,NULL,'\r\n                                                \r\n                                                只说武松自与宋江分别之後，当晚投客店歇了；次日早，起来打火吃了饭，还了房钱，拴束包裹，提了哨棒，便走上路；寻思道：“江湖上只闻说及时雨宋公明，果然不虚！结识得这般弟兄，也不枉了！”武松在路上行了几日，来到阳谷限地面。此去离县治还远。当日晌午时分，走得肚中饥渴，望见前面有一个酒店，挑着一面招旗在门前，上头写着五个字道：“三碗不过冈”。武松入到里面坐下，把哨棒倚了，叫道：“主人家，快把酒来吃。”只见店主人把三只碗，一双箸，一碟热菜，放在武松面前，满满筛一碗酒来。武松拿起碗一饮而尽，叫道：“这酒好生有气力！主人家，有饱肚的，买些吃酒。”酒家道：“只有熟牛肉。”武松道：“好的切二三斤来吃酒。”店家去里面切出二斤熟牛肉，做一大盘子，将来放在武松面前；随即再筛一碗酒。武松吃了道：“好酒！”又筛下一碗。恰好吃了三碗酒，再也不来筛。武松敲着桌子，叫道：“主人家，怎的不来筛酒？”酒家道：“客官，要肉便添来。”武松道：“我也要酒，也再切些肉来。”酒家道：“肉便切来添与客官吃，酒却不添了。”武松道：“却又作怪！”便问主人家道：“你如何不肯卖酒与我吃？”酒家道：“客官，你须见我门前招旗上面明明写道：‘三碗不过冈’。”武松道：“怎地唤作‘三碗不过冈’？”酒家道：“俺家的酒虽是村酒，却比老酒的滋味；但凡客人，来我店中吃了三碗的，便醉了，过不得前面的山冈去：因此唤作‘三碗不过冈’。若是过往客人到此，只吃三碗，便不再问。”武松笑道：“原来恁地；我却吃了三碗，如何不醉？”酒家道：“我这酒，叫做‘透瓶香’；又唤作‘出门倒’：初入口时，醇浓好吃，少刻时便倒。”武松道：“休要胡说！没地不还你钱！再筛三碗来我吃！”酒家见武松全然不动，又筛三碗。武松吃道：“端的好酒！主人家，我吃一碗还你一碗酒钱，只顾筛来。”酒家道：“客官，休只管要饮。这酒端的要醉倒人，没药医！”武松道：“休得胡鸟说！便是你使蒙汗药在里面，我也有鼻子！”店家被他发话不过，一连又筛了三碗。武松道：“肉便再把二斤来吃。”酒家又切了二斤熟牛肉，再筛了三碗酒。 武松吃得口滑，只顾要吃；去身边取出些碎银子，叫道：“主人家，你且来看我银子！还你酒肉钱够麽？”酒家看了道：“有馀，还有些贴钱与你。”武松道：“不要你贴钱，只将酒来筛。”酒家道：“客官，你要吃酒时，还有五六碗酒哩！只怕你吃不得了。”武松道：“就有五六碗多时，你尽数筛将来。”酒家道：“你这条长汉傥或醉倒了时，怎扶得你住！”武松答道：“要你扶的，不算好汉！”酒家那里肯将酒来筛。武松焦躁，道：“我又不白吃你的！休要饮老爷性发，通教你屋里粉碎！把你这鸟店子倒翻转来！”酒家道：“这厮醉了，休惹他。”再筛了六碗酒与武松吃了。前後共吃了十八碗，绰了哨棒，立起身来，道：“我却又不曾醉！”走出门前来，笑道：“却不说‘三碗不过冈’！”手提哨棒便走。酒家赶出来叫道：“客官，那里去？”武松立住了，问道：“叫我做甚麽？我又不少你酒钱，唤我怎地？”酒家叫道：“我是好意；你且回来我家看抄白官司榜文。”武松道：“甚麽榜文？”酒家道：“如今前面景阳冈上有只吊睛白额大虫，晚了出来伤人，坏了三二十条大汉性命。官司如今杖限猎户擒捉发落。冈子路口都有榜文；可教往来客人结夥成队，於巳午未三个时辰过冈；其馀寅卯申酉戌亥六个时辰不许过冈。更兼单身客人，务要等伴结夥而过。这早晚正是未末申初时分，我见你走都不问人，枉送了自家性命。不如就我此间歇了，等明日慢慢凑得三二十人，一齐好过冈子。”武松听了，笑道：“我是清河县人氏，这条景阳冈上少也走过了一二十遭，几时见说有大虫，你休说这般鸟话来吓我！——便有大虫，我也不怕！”酒家道：“我是好意救你，你不信时，进来看官司榜文。”武松道：“你鸟做声！便真个有虎，老爷也不怕！你留我在家里歇，莫不半夜三更，要谋我财，害我性命，却把鸟大虫唬吓我？”酒家道：“你看麽！我是一片好心，反做恶意，倒落得你恁地！你不信我时，请尊便自行！”一面说，一面摇着头，自进店里去了。这武松提了哨棒，大着步，自过景阳冈来。约行了四五里路，来到冈子下，见一大树，刮去了皮，一片白，上写两行字。武松也颇识几字，抬头看时，上面写道：“近因景阳冈大虫伤人，但有过往客商可於巳午未三个时辰结夥成队过冈，请勿自误。” 武松看了笑道：“这是酒家诡诈，惊吓那等客人，便去那厮家里歇宿。我却怕甚麽鸟！”横拖着哨棒，便上冈子来。那时已有申牌时分，这轮红日厌厌地相傍下山。武松乘着酒兴，只管走上冈子来。走不到半里多路，见一个败落的山神庙。行到庙前，见这庙门上贴着一张印信榜文。武松住了脚读时，上面写道：阳谷县示：为景阳冈上新有一只大虫伤害人命，见今杖限各乡里正并猎户人等行捕未获。如有过往客商人等，可於巳午未三个时辰结伴过冈；其馀时分，及单身客人，不许过冈，恐被伤害性命。各宜知悉。政和……年……月……日。武松读了印信榜文，方知端的有虎；欲待转身再回酒店里来，寻思道：“我回去时须吃他耻笑不是好汉，难以转去。”存想了一回，说道：“怕甚麽鸟！且只顾上去看怎地！” 武松正走，看看酒涌上来，便把毡笠儿掀在脊梁上，将哨棒绾在肋下，一步步上那冈子来；回头看这日色时，渐渐地坠下去了。此时正是十月间天气，日短夜长，容易得晚。武松自言自说道：“那得甚麽大虫！人自怕了，不敢上山。”\r\n　　武松走了一直，酒力发作，焦热起来，一只手提哨棒，一只手把胸膛前袒开，踉踉跄跄，直奔过乱树林来；见一块光挞挞大青石，把那哨棒倚在一边，放翻身体，却待要睡，只\r\n　　见发起一阵狂风。那一阵风过了，只听得乱树背後扑地一声响，跳出一只吊睛白额大虫来。武松见了，叫声“阿呀”，从青石上翻将下来，便拿那条哨棒在手里，闪在青石边。那大虫\r\n　　又饿，又渴，把两只爪在地上略按一按，和身望上一扑，从半空里撺将下来。武松被那一惊，酒都作冷汗出了。\r\n　　说时迟，那时快；武松见大虫扑来，只一闪，闪在大虫背後。那大虫背後看人最难，便\r\n　　把前爪搭在地下，把腰胯一掀，掀将起来。武松只一闪，闪在一边。大虫见掀他不着，吼一\r\n　　声，却似半天里起个霹雳，振得那山冈也动，把这铁棒也似虎尾倒竖起来只一剪。武松却又\r\n　　闪在一边。原来那大虫拿人只是一扑，一掀，一剪；三般捉不着时，气性先自没了一半。那\r\n　　大虫又剪不着，再吼了一声，一兜兜将回来。\r\n　　武松见那大虫复翻身回来，双手轮起哨棒，尽平生气力，只一棒，从半空劈将下来。只\r\n　　听得一声响，簌簌地，将那树连枝带叶劈脸打将下来。定睛看时，一棒劈不着大虫，原来打\r\n　　急了，正打在枯树上，把那条哨棒折做两截，只拿得一半在手里。那大虫咆哮，性发起来，\r\n　　翻身又只一扑扑将来。武松又只一跳，却退了十步远。那大虫恰好把两只前爪搭在武松面\r\n　　前。武松将半截棒丢在一边，两只手就势把大虫顶花皮胳嗒地揪住，一按按将下来。那只大\r\n　　虫急要挣扎，被武松尽力气捺定，那里肯放半点儿松宽。\r\n　　武松把只脚望大虫面门上、眼睛里只顾乱踢。那大虫咆哮起来，把身底下爬起两堆黄泥\r\n　　做了一个土坑。武松把大虫嘴直按下黄泥坑里去。那大虫吃武松奈何得没了些气力。武松把\r\n　　左手紧紧地揪住顶花皮，偷出右手来，提起铁锤般大小拳头，尽平生之力只顾打。打到五七\r\n　　十拳，那大虫眼里，口里，鼻子里，耳朵里，都迸出鲜血来，更动弹不得，只剩口里兀自气\r\n　　喘。\r\n　　武松放了手来，松树边寻那打折的哨棒，拿在手里；只怕大虫不死，把棒橛又打了一\r\n　　回。眼见气都没了，方才丢了棒，寻思道：“我就地拖得这死大虫下冈子去？……”就血泊\r\n　　里双手来提时，那里提得动。原来使尽了气力，手脚都苏软了。\r\n　　武松再来青石上坐了半歇，寻思道：“天色看看黑了，傥或又跳出一只大虫来时，却怎\r\n　　地斗得他过？且挣扎下冈子去，明早却来理会。”就石头边寻了毡笠儿，转过乱树林边，一\r\n　　步步捱下冈子来。走不到半里多路，只见枯草中又钻出两只大虫来。武松道：“阿呀！我今\r\n　　番罢了！”只见那两只大虫在黑影里直立起来。\r\n　　武松定睛看时，却是两个人，把虎皮缝作衣裳，紧紧绷在身上，手里各拿着一条五股\r\n　　叉，见了武松，吃一惊道：“你……你……你……吃了□□【“忽聿”二字俱加“反犬”\r\n　　旁】心，豹子胆，狮子腿，胆倒包着身躯！如何敢独自一个，昏黑将夜，又没器械，走过冈\r\n　　子来！你……你……你……是人？是鬼？”武松道：“你两个是甚麽人？”那个人道：“我\r\n　　们是本处猎户。”武松道：“你们上岭上来做甚麽？”两个猎户失惊道：“你兀自不知哩！\r\n　　今景阳冈上有一只极大的大虫，夜夜出来伤人！只我们猎户也折了七八个，过往客人不记其\r\n　　数，都被这畜生吃了！本县知县着落当乡里正和我们猎户人等捕捉。那业畜势大难近，谁敢\r\n　　向前！我们为他，正不知吃了多少限棒，只捉他不得！今夜又该我们两个捕猎，和十数个乡\r\n　　夫在此，上上下下放了窝弓药箭等他，正在这里埋伏，却见你大剌剌地从冈子上走将下来，\r\n　　我两个吃了一惊。你却正是甚人？曾见大虫麽？”武松道：“我是清河县人氏，姓武，排行\r\n　　第二。却才冈子上乱树林边，正撞见那大虫，被我一顿拳脚打死了。”两个猎户听得，痴呆\r\n　　了，说道：“怕没这话？”武松道：“你不信时，只看我身上兀自有血迹。”两个道：“怎\r\n　　地打来？”\r\n　　武松把那打大虫的本事再说了一遍。两个猎户听了，又喜又惊，叫拢那十个乡夫来。只\r\n　　见这十个乡夫都拿着钢叉、踏弩、刀枪，随即拢来。武松问道：“他们众人如何不随你两个\r\n　　上山？”猎户道：“便是那畜生利害，他们如何敢上来！”一夥十数个人都在面前。两个猎\r\n　　户叫武松把打大虫的事说向众人。众人都不肯信。武松道：“你众人不信时，我和你去看便\r\n　　了。”众人身边都有火刀、火石，随即发出火来，点起五七个火把。众人都跟着武松一同再\r\n　　上冈子来，看见那大虫做一堆儿死在那里。众人见了大喜，先叫一个去报知本县里正并该管\r\n　　上户。\r\n　　这里五七个乡夫自把大虫缚了，抬下冈子来。到得岭下，早有七八十人都哄将起来，先\r\n　　把死大虫抬在前面，将一乘兜轿抬了武松，投本处一个上户家来。那上户里正都在庄前迎\r\n　　接。把这大虫扛到草厅上。却有本乡上户，本乡猎户，三二十人，都来相探武松。众人问\r\n　　道：“壮士高姓大名？贵乡何处？”武松道：“小人是此间邻郡清河县人氏。姓武，名松，\r\n　　排行第二。因从沧州回乡来，昨晚在冈子那边酒店吃得大醉了，上冈子来，正撞见这畜\r\n　　生。”把那打虎的身分拳脚细说了一遍。众上户道：“真乃英雄好汉！”众猎户先把野味将\r\n　　来与武松把杯。\r\n　　武松因打大虫困乏了，要睡。大户便叫庄客打并客房，且教武松歇息。到天明，上户先\r\n　　使人去县里报知，一面合具虎床，安排端正，迎接县里去。\r\n　　天明，武松起来，洗漱罢，众多上户牵一□【字形左“羊”右“空”】羊，挑一担酒，\r\n　　都在厅前伺候。武松穿了衣裳，整顿巾帻，出到前面，与众人相见。众上户把盏，说道：\r\n　　“被这畜生正不知害了多少人性命，连累猎户吃了几顿限棒！今日幸得壮士来到，除了这个\r\n　　大害！第一，乡中人民有福，第二，客侣通行，实出壮士之赐！”武松谢道：“非小子之\r\n　　能，托赖众长上福荫。”\r\n　　众人都来作贺。吃了一早晨酒食，抬出大虫，放在虎床上。众乡村上户都把段匹花红来\r\n　　挂与武松。武松有些行李包裹，寄在庄上。一齐都出庄门前来。\r\n　　早有阳谷县知县相公使人来接武松。都相见了，叫四个庄客将乘凉轿来抬了武松，把那\r\n　　大虫扛在前面，也挂着花红段匹，迎到阳谷县里来。\r\n　　那阳谷县人民听得说一个壮士打死了景阳冈上大虫，迎喝了来，皆出来看，哄动了那个\r\n　　县治。武松在轿上看时，只见亚肩叠背，闹闹攘攘，屯街塞巷，都来看迎大虫。到县前衙门\r\n　　口，知县已在厅上专等，武松下了轿。扛着大虫，都到厅前，放在甬道上。\r\n　　知县看了武松这般模样，又见了这个老大锦毛大虫，心中自忖道：“不是这个汉，怎地\r\n　　打得这个虎！”便唤武松上厅来。\r\n　　武松去厅前声了喏。知县问道：“你那打虎的壮士，你却说怎生打了这个大虫？”武松\r\n　　就厅前将打虎的本事说了一遍。厅上厅下众多人等都惊得呆了。知县就厅上赐了几杯酒，将\r\n　　出上户凑的赏赐钱一千贯给与武松，武松禀道：“小人托赖相公的福荫，偶然侥幸打死了这\r\n　　个大虫，非小人之能，如何敢受赏赐。小人闻知这众猎户因这个大虫受了相公的责罚，何不\r\n　　就把这一千贯给散与众人去用？”知县道：“既是如此，任从壮士。”\r\n　　武松就把这赏钱在厅上散与众人，——猎户。知县见他忠厚仁德，有心要抬举他，便\r\n　　道：“虽你原是清河县人氏，与我这阳谷县只在咫尺。我今日就参你在本县做个都头，如\r\n　　何？”武松跪谢道：“若蒙恩相抬举，小人终身受赐。”\r\n　　知县随即唤押司立了文案，当日便参武松做了步兵都头。众上户都来与武松作庆贺喜，\r\n　　连连吃了三五日酒。武松自心中想道：“我本要回清河县去看望哥哥，谁想倒来做了阳谷县\r\n　　都头。”自此上官见爱，乡里闻名。\r\n　　又过了三二日，那一日，武松走出县前来闲玩，只听得背後一个人叫声：“武都头，你\r\n　　今日发迹了，如何不看觑我则个？”武松回头来看了，叫声：“阿呀！你如何却在这里？”\r\n　　不是武松见了这个人，有分教阳谷县中，尸横血染；直教钢刀响处人头滚，宝剑挥时热血\r\n　　流。毕竟叫唤武都头的正是甚人，且听下回分解。\r\n                                            \r\n                                            '),(5,2,'施耐庵','一本小说（音频图片）','2020-04-12 08:02:15.000000','武松打虎','1587802790.9266434.jpg','1587802814.4271686.mp3','\r\n                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                \r\n                                                只说武松自与宋江分别之後，当晚投客店歇了；次日早，起来打火吃了饭，还了房钱，拴束包裹，提了哨棒，便走上路；寻思道：“江湖上只闻说及时雨宋公明，果然不虚！结识得这般弟兄，也不枉了！”武松在路上行了几日，来到阳谷限地面。此去离县治还远。当日晌午时分，走得肚中饥渴，望见前面有一个酒店，挑着一面招旗在门前，上头写着五个字道：“三碗不过冈”。武松入到里面坐下，把哨棒倚了，叫道：“主人家，快把酒来吃。”只见店主人把三只碗，一双箸，一碟热菜，放在武松面前，满满筛一碗酒来。武松拿起碗一饮而尽，叫道：“这酒好生有气力！主人家，有饱肚的，买些吃酒。”酒家道：“只有熟牛肉。”武松道：“好的切二三斤来吃酒。”店家去里面切出二斤熟牛肉，做一大盘子，将来放在武松面前；随即再筛一碗酒。武松吃了道：“好酒！”又筛下一碗。恰好吃了三碗酒，再也不来筛。武松敲着桌子，叫道：“主人家，怎的不来筛酒？”酒家道：“客官，要肉便添来。”武松道：“我也要酒，也再切些肉来。”酒家道：“肉便切来添与客官吃，酒却不添了。”武松道：“却又作怪！”便问主人家道：“你如何不肯卖酒与我吃？”酒家道：“客官，你须见我门前招旗上面明明写道：‘三碗不过冈’。”武松道：“怎地唤作‘三碗不过冈’？”酒家道：“俺家的酒虽是村酒，却比老酒的滋味；但凡客人，来我店中吃了三碗的，便醉了，过不得前面的山冈去：因此唤作‘三碗不过冈’。若是过往客人到此，只吃三碗，便不再问。”武松笑道：“原来恁地；我却吃了三碗，如何不醉？”酒家道：“我这酒，叫做‘透瓶香’；又唤作‘出门倒’：初入口时，醇浓好吃，少刻时便倒。”武松道：“休要胡说！没地不还你钱！再筛三碗来我吃！”酒家见武松全然不动，又筛三碗。武松吃道：“端的好酒！主人家，我吃一碗还你一碗酒钱，只顾筛来。”酒家道：“客官，休只管要饮。这酒端的要醉倒人，没药医！”武松道：“休得胡鸟说！便是你使蒙汗药在里面，我也有鼻子！”店家被他发话不过，一连又筛了三碗。武松道：“肉便再把二斤来吃。”酒家又切了二斤熟牛肉，再筛了三碗酒。 武松吃得口滑，只顾要吃；去身边取出些碎银子，叫道：“主人家，你且来看我银子！还你酒肉钱够麽？”酒家看了道：“有馀，还有些贴钱与你。”武松道：“不要你贴钱，只将酒来筛。”酒家道：“客官，你要吃酒时，还有五六碗酒哩！只怕你吃不得了。”武松道：“就有五六碗多时，你尽数筛将来。”酒家道：“你这条长汉傥或醉倒了时，怎扶得你住！”武松答道：“要你扶的，不算好汉！”酒家那里肯将酒来筛。武松焦躁，道：“我又不白吃你的！休要饮老爷性发，通教你屋里粉碎！把你这鸟店子倒翻转来！”酒家道：“这厮醉了，休惹他。”再筛了六碗酒与武松吃了。前後共吃了十八碗，绰了哨棒，立起身来，道：“我却又不曾醉！”走出门前来，笑道：“却不说‘三碗不过冈’！”手提哨棒便走。酒家赶出来叫道：“客官，那里去？”武松立住了，问道：“叫我做甚麽？我又不少你酒钱，唤我怎地？”酒家叫道：“我是好意；你且回来我家看抄白官司榜文。”武松道：“甚麽榜文？”酒家道：“如今前面景阳冈上有只吊睛白额大虫，晚了出来伤人，坏了三二十条大汉性命。官司如今杖限猎户擒捉发落。冈子路口都有榜文；可教往来客人结夥成队，於巳午未三个时辰过冈；其馀寅卯申酉戌亥六个时辰不许过冈。更兼单身客人，务要等伴结夥而过。这早晚正是未末申初时分，我见你走都不问人，枉送了自家性命。不如就我此间歇了，等明日慢慢凑得三二十人，一齐好过冈子。”武松听了，笑道：“我是清河县人氏，这条景阳冈上少也走过了一二十遭，几时见说有大虫，你休说这般鸟话来吓我！——便有大虫，我也不怕！”酒家道：“我是好意救你，你不信时，进来看官司榜文。”武松道：“你鸟做声！便真个有虎，老爷也不怕！你留我在家里歇，莫不半夜三更，要谋我财，害我性命，却把鸟大虫唬吓我？”酒家道：“你看麽！我是一片好心，反做恶意，倒落得你恁地！你不信我时，请尊便自行！”一面说，一面摇着头，自进店里去了。这武松提了哨棒，大着步，自过景阳冈来。约行了四五里路，来到冈子下，见一大树，刮去了皮，一片白，上写两行字。武松也颇识几字，抬头看时，上面写道：“近因景阳冈大虫伤人，但有过往客商可於巳午未三个时辰结夥成队过冈，请勿自误。” 武松看了笑道：“这是酒家诡诈，惊吓那等客人，便去那厮家里歇宿。我却怕甚麽鸟！”横拖着哨棒，便上冈子来。那时已有申牌时分，这轮红日厌厌地相傍下山。武松乘着酒兴，只管走上冈子来。走不到半里多路，见一个败落的山神庙。行到庙前，见这庙门上贴着一张印信榜文。武松住了脚读时，上面写道：阳谷县示：为景阳冈上新有一只大虫伤害人命，见今杖限各乡里正并猎户人等行捕未获。如有过往客商人等，可於巳午未三个时辰结伴过冈；其馀时分，及单身客人，不许过冈，恐被伤害性命。各宜知悉。政和……年……月……日。武松读了印信榜文，方知端的有虎；欲待转身再回酒店里来，寻思道：“我回去时须吃他耻笑不是好汉，难以转去。”存想了一回，说道：“怕甚麽鸟！且只顾上去看怎地！” 武松正走，看看酒涌上来，便把毡笠儿掀在脊梁上，将哨棒绾在肋下，一步步上那冈子来；回头看这日色时，渐渐地坠下去了。此时正是十月间天气，日短夜长，容易得晚。武松自言自说道：“那得甚麽大虫！人自怕了，不敢上山。” 　　武松走了一直，酒力发作，焦热起来，一只手提哨棒，一只手把胸膛前袒开，踉踉跄跄，直奔过乱树林来；见一块光挞挞大青石，把那哨棒倚在一边，放翻身体，却待要睡，只 　　见发起一阵狂风。那一阵风过了，只听得乱树背後扑地一声响，跳出一只吊睛白额大虫来。武松见了，叫声“阿呀”，从青石上翻将下来，便拿那条哨棒在手里，闪在青石边。那大虫 　　又饿，又渴，把两只爪在地上略按一按，和身望上一扑，从半空里撺将下来。武松被那一惊，酒都作冷汗出了。 　　说时迟，那时快；武松见大虫扑来，只一闪，闪在大虫背後。那大虫背後看人最难，便 　　把前爪搭在地下，把腰胯一掀，掀将起来。武松只一闪，闪在一边。大虫见掀他不着，吼一 　　声，却似半天里起个霹雳，振得那山冈也动，把这铁棒也似虎尾倒竖起来只一剪。武松却又 　　闪在一边。原来那大虫拿人只是一扑，一掀，一剪；三般捉不着时，气性先自没了一半。那 　　大虫又剪不着，再吼了一声，一兜兜将回来。 　　武松见那大虫复翻身回来，双手轮起哨棒，尽平生气力，只一棒，从半空劈将下来。只 　　听得一声响，簌簌地，将那树连枝带叶劈脸打将下来。定睛看时，一棒劈不着大虫，原来打 　　急了，正打在枯树上，把那条哨棒折做两截，只拿得一半在手里。那大虫咆哮，性发起来， 　　翻身又只一扑扑将来。武松又只一跳，却退了十步远。那大虫恰好把两只前爪搭在武松面 　　前。武松将半截棒丢在一边，两只手就势把大虫顶花皮胳嗒地揪住，一按按将下来。那只大 　　虫急要挣扎，被武松尽力气捺定，那里肯放半点儿松宽。 　　武松把只脚望大虫面门上、眼睛里只顾乱踢。那大虫咆哮起来，把身底下爬起两堆黄泥 　　做了一个土坑。武松把大虫嘴直按下黄泥坑里去。那大虫吃武松奈何得没了些气力。武松把 　　左手紧紧地揪住顶花皮，偷出右手来，提起铁锤般大小拳头，尽平生之力只顾打。打到五七 　　十拳，那大虫眼里，口里，鼻子里，耳朵里，都迸出鲜血来，更动弹不得，只剩口里兀自气 　　喘。 　　武松放了手来，松树边寻那打折的哨棒，拿在手里；只怕大虫不死，把棒橛又打了一 　　回。眼见气都没了，方才丢了棒，寻思道：“我就地拖得这死大虫下冈子去？……”就血泊 　　里双手来提时，那里提得动。原来使尽了气力，手脚都苏软了。 　　武松再来青石上坐了半歇，寻思道：“天色看看黑了，傥或又跳出一只大虫来时，却怎 　　地斗得他过？且挣扎下冈子去，明早却来理会。”就石头边寻了毡笠儿，转过乱树林边，一 　　步步捱下冈子来。走不到半里多路，只见枯草中又钻出两只大虫来。武松道：“阿呀！我今 　　番罢了！”只见那两只大虫在黑影里直立起来。 　　武松定睛看时，却是两个人，把虎皮缝作衣裳，紧紧绷在身上，手里各拿着一条五股 　　叉，见了武松，吃一惊道：“你……你……你……吃了□□【“忽聿”二字俱加“反犬” 　　旁】心，豹子胆，狮子腿，胆倒包着身躯！如何敢独自一个，昏黑将夜，又没器械，走过冈 　　子来！你……你……你……是人？是鬼？”武松道：“你两个是甚麽人？”那个人道：“我 　　们是本处猎户。”武松道：“你们上岭上来做甚麽？”两个猎户失惊道：“你兀自不知哩！ 　　今景阳冈上有一只极大的大虫，夜夜出来伤人！只我们猎户也折了七八个，过往客人不记其 　　数，都被这畜生吃了！本县知县着落当乡里正和我们猎户人等捕捉。那业畜势大难近，谁敢 　　向前！我们为他，正不知吃了多少限棒，只捉他不得！今夜又该我们两个捕猎，和十数个乡 　　夫在此，上上下下放了窝弓药箭等他，正在这里埋伏，却见你大剌剌地从冈子上走将下来， 　　我两个吃了一惊。你却正是甚人？曾见大虫麽？”武松道：“我是清河县人氏，姓武，排行 　　第二。却才冈子上乱树林边，正撞见那大虫，被我一顿拳脚打死了。”两个猎户听得，痴呆 　　了，说道：“怕没这话？”武松道：“你不信时，只看我身上兀自有血迹。”两个道：“怎 　　地打来？” 　　武松把那打大虫的本事再说了一遍。两个猎户听了，又喜又惊，叫拢那十个乡夫来。只 　　见这十个乡夫都拿着钢叉、踏弩、刀枪，随即拢来。武松问道：“他们众人如何不随你两个 　　上山？”猎户道：“便是那畜生利害，他们如何敢上来！”一夥十数个人都在面前。两个猎 　　户叫武松把打大虫的事说向众人。众人都不肯信。武松道：“你众人不信时，我和你去看便 　　了。”众人身边都有火刀、火石，随即发出火来，点起五七个火把。众人都跟着武松一同再 　　上冈子来，看见那大虫做一堆儿死在那里。众人见了大喜，先叫一个去报知本县里正并该管 　　上户。 　　这里五七个乡夫自把大虫缚了，抬下冈子来。到得岭下，早有七八十人都哄将起来，先 　　把死大虫抬在前面，将一乘兜轿抬了武松，投本处一个上户家来。那上户里正都在庄前迎 　　接。把这大虫扛到草厅上。却有本乡上户，本乡猎户，三二十人，都来相探武松。众人问 　　道：“壮士高姓大名？贵乡何处？”武松道：“小人是此间邻郡清河县人氏。姓武，名松， 　　排行第二。因从沧州回乡来，昨晚在冈子那边酒店吃得大醉了，上冈子来，正撞见这畜 　　生。”把那打虎的身分拳脚细说了一遍。众上户道：“真乃英雄好汉！”众猎户先把野味将 　　来与武松把杯。 　　武松因打大虫困乏了，要睡。大户便叫庄客打并客房，且教武松歇息。到天明，上户先 　　使人去县里报知，一面合具虎床，安排端正，迎接县里去。 　　天明，武松起来，洗漱罢，众多上户牵一□【字形左“羊”右“空”】羊，挑一担酒， 　　都在厅前伺候。武松穿了衣裳，整顿巾帻，出到前面，与众人相见。众上户把盏，说道： 　　“被这畜生正不知害了多少人性命，连累猎户吃了几顿限棒！今日幸得壮士来到，除了这个 　　大害！第一，乡中人民有福，第二，客侣通行，实出壮士之赐！”武松谢道：“非小子之 　　能，托赖众长上福荫。” 　　众人都来作贺。吃了一早晨酒食，抬出大虫，放在虎床上。众乡村上户都把段匹花红来 　　挂与武松。武松有些行李包裹，寄在庄上。一齐都出庄门前来。 　　早有阳谷县知县相公使人来接武松。都相见了，叫四个庄客将乘凉轿来抬了武松，把那 　　大虫扛在前面，也挂着花红段匹，迎到阳谷县里来。 　　那阳谷县人民听得说一个壮士打死了景阳冈上大虫，迎喝了来，皆出来看，哄动了那个 　　县治。武松在轿上看时，只见亚肩叠背，闹闹攘攘，屯街塞巷，都来看迎大虫。到县前衙门 　　口，知县已在厅上专等，武松下了轿。扛着大虫，都到厅前，放在甬道上。 　　知县看了武松这般模样，又见了这个老大锦毛大虫，心中自忖道：“不是这个汉，怎地 　　打得这个虎！”便唤武松上厅来。 　　武松去厅前声了喏。知县问道：“你那打虎的壮士，你却说怎生打了这个大虫？”武松 　　就厅前将打虎的本事说了一遍。厅上厅下众多人等都惊得呆了。知县就厅上赐了几杯酒，将 　　出上户凑的赏赐钱一千贯给与武松，武松禀道：“小人托赖相公的福荫，偶然侥幸打死了这 　　个大虫，非小人之能，如何敢受赏赐。小人闻知这众猎户因这个大虫受了相公的责罚，何不 　　就把这一千贯给散与众人去用？”知县道：“既是如此，任从壮士。” 　　武松就把这赏钱在厅上散与众人，——猎户。知县见他忠厚仁德，有心要抬举他，便 　　道：“虽你原是清河县人氏，与我这阳谷县只在咫尺。我今日就参你在本县做个都头，如 　　何？”武松跪谢道：“若蒙恩相抬举，小人终身受赐。” 　　知县随即唤押司立了文案，当日便参武松做了步兵都头。众上户都来与武松作庆贺喜， 　　连连吃了三五日酒。武松自心中想道：“我本要回清河县去看望哥哥，谁想倒来做了阳谷县 　　都头。”自此上官见爱，乡里闻名。 　　又过了三二日，那一日，武松走出县前来闲玩，只听得背後一个人叫声：“武都头，你 　　今日发迹了，如何不看觑我则个？”武松回头来看了，叫声：“阿呀！你如何却在这里？” 　　不是武松见了这个人，有分教阳谷县中，尸横血染；直教钢刀响处人头滚，宝剑挥时热血 　　流。毕竟叫唤武都头的正是甚人，且听下回分解。\r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            ');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'common','books'),(8,'common','types'),(9,'common','users'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-19 08:44:55.361125'),(2,'auth','0001_initial','2020-03-19 08:44:55.694233'),(3,'admin','0001_initial','2020-03-19 08:44:56.935445'),(4,'admin','0002_logentry_remove_auto_add','2020-03-19 08:44:57.200736'),(5,'admin','0003_logentry_add_action_flag_choices','2020-03-19 08:44:57.212704'),(6,'contenttypes','0002_remove_content_type_name','2020-03-19 08:44:57.571744'),(7,'auth','0002_alter_permission_name_max_length','2020-03-19 08:44:57.702394'),(8,'auth','0003_alter_user_email_max_length','2020-03-19 08:44:57.735306'),(9,'auth','0004_alter_user_username_opts','2020-03-19 08:44:57.746277'),(10,'auth','0005_alter_user_last_login_null','2020-03-19 08:44:57.877925'),(11,'auth','0006_require_contenttypes_0002','2020-03-19 08:44:57.882912'),(12,'auth','0007_alter_validators_add_error_messages','2020-03-19 08:44:57.896875'),(13,'auth','0008_alter_user_username_max_length','2020-03-19 08:44:58.049466'),(14,'auth','0009_alter_user_last_name_max_length','2020-03-19 08:44:58.185608'),(15,'auth','0010_alter_group_name_max_length','2020-03-19 08:44:58.215039'),(16,'auth','0011_update_proxy_permissions','2020-03-19 08:44:58.237977'),(17,'common','0001_initial','2020-03-19 09:10:27.250911'),(18,'sessions','0001_initial','2020-03-19 09:10:27.318239');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cbqletn4u8vjztclywii8unsxeohpxx7','Yjk2YmY3ODYxNmY2MTZjMWYyMzBhYjRhYjAwMmIwOGQyNGYxZjVkMjp7ImFkbWluIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIyMTIzMmYyOTdhNTdhNWE3NDM4OTRhMGU0YTgwMWZjMyIsInBob25lIjoiMTExMTExMSIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwic3RhdGUiOjB9fQ==','2020-04-04 06:58:46.004825'),('vs6yum0f2egersvzl0ufw4dlizqaqj8f','Yjk2YmY3ODYxNmY2MTZjMWYyMzBhYjRhYjAwMmIwOGQyNGYxZjVkMjp7ImFkbWluIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIyMTIzMmYyOTdhNTdhNWE3NDM4OTRhMGU0YTgwMWZjMyIsInBob25lIjoiMTExMTExMSIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwic3RhdGUiOjB9fQ==','2020-04-26 05:54:57.893905');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `pid` int NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'玄幻',0,'0,'),(2,'东方玄幻',1,'0,1,');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `state` int NOT NULL,
  `addtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,'1111111','admin@admin.com',0,'2020-03-19 09:16:33.000000');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-25 16:21:30
