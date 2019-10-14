# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.27)
# Database: db_persediaan_barang
# Generation Time: 2019-10-14 06:48:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tb_barang_keluar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_barang_keluar`;

CREATE TABLE `tb_barang_keluar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_barang_keluar` WRITE;
/*!40000 ALTER TABLE `tb_barang_keluar` DISABLE KEYS */;

INSERT INTO `tb_barang_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `jumlah`)
VALUES
	(1,'WG-201713067948','8/11/2017','11/11/2017','NTB','8888166995215','Ciki Walens','Dus','50'),
	(2,'WG-201713067948','8/11/2017','11/12/2017','NTB','8888166995215','Ciki Walens','Dus','6'),
	(3,'WG-201713549728','4/11/2017','11/11/2017','Banten','1923081008002','Buku Hiragana','Pack','3'),
	(4,'WG-201774896520','9/11/2017','12/11/2017','Yogyakarta','60201311121008264','Battery ZTE','Dus','3'),
	(5,'WG-201727134650','05/12/2017','20/12/2017','Jakarta','29312390203','Susu','Dus','17'),
	(6,'WG-201810974628','15/01/2018','16/01/2018','Lampung','1923081008002','Buku Nihongo','Dus','50'),
	(7,'WG-201781267543','7/11/2017','17/01/2018','Yogyakarta','97897952889','Buku Framework Codeigniter','Dus','1'),
	(8,'WG-201832570869','15/01/2018','17/01/2018','Bali','1923081008002','test','Dus','10'),
	(9,'WG-201893850472','15/01/2018','18/01/2018','Bali','1923081008002','lumpur nartugo','Pcs','11'),
	(10,'WG-201781267543','7/11/2017','15/01/2018','Yogyakarta','97897952889','Buku Framework Codeigniter','Dus','1'),
	(11,'WG-201727134650','05/12/2017','15/01/2018','Jakarta','29312390203','Susu','Dus','3'),
	(12,'WG-201774896520','9/11/2017','15/01/2018','Yogyakarta','60201311121008264','Battery ZTE','Dus','3'),
	(13,'WG-201727134650','05/12/2017','16/01/2018','Jakarta','29312390203','Susu','Dus','1'),
	(14,'WG-201727134650','05/12/2017','17/01/2018','Jakarta','29312390203','Susu','Dus','1'),
	(15,'WG-201885472106','18/01/2018','19/01/2018','Riau','8996001600146','Teh Pucuk','Dus','50'),
	(16,'WG-201871602934','18/01/2018','16/03/2018','Papua','312212331222','Kopi Hitam','Dus','10');

/*!40000 ALTER TABLE `tb_barang_keluar` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `TG_BARANG_KELUAR` AFTER INSERT ON `tb_barang_keluar` FOR EACH ROW BEGIN
 UPDATE tb_barang_masuk SET jumlah=jumlah-NEW.jumlah
 WHERE kode_barang=NEW.kode_barang;
 DELETE FROM tb_barang_masuk WHERE jumlah = 0;

END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table tb_barang_masuk
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_barang_masuk`;

CREATE TABLE `tb_barang_masuk` (
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_barang_masuk` WRITE;
/*!40000 ALTER TABLE `tb_barang_masuk` DISABLE KEYS */;

INSERT INTO `tb_barang_masuk` (`id_transaksi`, `tanggal`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `jumlah`)
VALUES
	('WG-201871602934','18/01/2018','Papua','312212331222','Kopi Hitam','Dus','90');

/*!40000 ALTER TABLE `tb_barang_masuk` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_satuan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_satuan`;

CREATE TABLE `tb_satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_satuan` varchar(100) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_satuan` WRITE;
/*!40000 ALTER TABLE `tb_satuan` DISABLE KEYS */;

INSERT INTO `tb_satuan` (`id_satuan`, `kode_satuan`, `nama_satuan`)
VALUES
	(1,'Dus','Dus'),
	(2,'Pcs','Pcs'),
	(5,'Pack','Pack');

/*!40000 ALTER TABLE `tb_satuan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_upload_gambar_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_upload_gambar_user`;

CREATE TABLE `tb_upload_gambar_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username_user` varchar(100) NOT NULL,
  `nama_file` varchar(220) NOT NULL,
  `ukuran_file` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_upload_gambar_user` WRITE;
/*!40000 ALTER TABLE `tb_upload_gambar_user` DISABLE KEYS */;

INSERT INTO `tb_upload_gambar_user` (`id`, `username_user`, `nama_file`, `ukuran_file`)
VALUES
	(1,'zahidin','nopic5.png','6.33'),
	(2,'test','nopic4.png','6.33'),
	(3,'coba','logo.jpg','16.69'),
	(4,'admin','nopic2.png','6.33');

/*!40000 ALTER TABLE `tb_upload_gambar_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `last_login` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `last_login`)
VALUES
	(11,'user1','user1@ymail.com','$2y$10$WZYOZcN05JHriS09.C6o7evdWIJ3Obj7vNHzuLunFIAZCDJtG6W1C',1,'17-03-2018 11:47'),
	(12,'user2','user2@gmail.com','$2y$10$MXbWRsLw6S6xpyQu2/ZiEeB7oTCLrfEPpDcXWaszFVoYj.Yv51wG.',0,'12-10-2019 22:57'),
	(16,'test','test@gmail.com','$2y$10$CTjzvmT5B.dxojKZOxsjTeMc4E7.Gwl9slAgX.0lozwGrKSMxzWdO',1,'16-03-2018 4:46'),
	(17,'admin2','admin2@gmail.com','$2y$10$WRMyjAi8nnkr3J3QvzvyHuEoqay5dYd5NgMJKxsxtXKCp8.JCxZm.',1,'15-01-2018 15:41'),
	(20,'admin','admin@gmail.com','$2y$10$3HNkMOtwX8X88Xb3DIveYuhXScTnJ9m16/rPDF1/VTa/VTisxVZ4i',1,'14-10-2019 6:46');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
