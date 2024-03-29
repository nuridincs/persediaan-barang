# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.27)
# Database: db_persediaan_barang
# Generation Time: 2019-10-19 16:07:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table master_barang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `master_barang`;

CREATE TABLE `master_barang` (
  `kode_barang` char(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `no_po` char(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `id_status_barang` int(11) DEFAULT '3',
  `id_supplier` char(50) CHARACTER SET utf8mb4 DEFAULT '',
  `nama_barang` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `spesifikasi` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'ok',
  `stok` int(11) NOT NULL,
  `sisa_stok` int(11) DEFAULT NULL,
  `stok_minimum` int(11) NOT NULL DEFAULT '20',
  `tanggal` date DEFAULT NULL,
  `satuan` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`kode_barang`),
  KEY `status` (`id_status_barang`),
  CONSTRAINT `status` FOREIGN KEY (`id_status_barang`) REFERENCES `status_barang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `master_barang` WRITE;
/*!40000 ALTER TABLE `master_barang` DISABLE KEYS */;

INSERT INTO `master_barang` (`kode_barang`, `no_po`, `id_status_barang`, `id_supplier`, `nama_barang`, `spesifikasi`, `stok`, `sisa_stok`, `stok_minimum`, `tanggal`, `satuan`)
VALUES
	('A55-1000-29','PO001',1,'SUP-001','chasis','ok',200,150,20,'2019-10-10','Pcs'),
	('A55-1000-31','PO002',2,'SUP-001','sheet','ok',500,15,20,'2019-10-11','Pcs'),
	('A55-1000-32','PO003',1,'SUP-001','damper','ok',200,12,20,'2019-10-12','Pcs'),
	('A55-1000-33','PO004',2,'SUP-001','kabel ffc','riject',300,20,20,'2019-10-13','Pcs'),
	('A55-5000-94','PO005',3,'SUP-002','front panel','ok',400,100,20,'2019-10-15','Pcs'),
	('AB-1232323','PO-201957890312',1,'SUP-001','test','ok',130,80,20,'2019-11-08','Dus'),
	('B1200022','PO-201979058461',1,'SUP-002','kabel','ok',30,20,20,'2019-11-01','Pcs'),
	('B1200055','PO-201930982547',1,'SUP-002','Speaker','ok',100,5,20,'2019-10-18','Dus');

/*!40000 ALTER TABLE `master_barang` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table status_barang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status_barang`;

CREATE TABLE `status_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `status_barang` WRITE;
/*!40000 ALTER TABLE `status_barang` DISABLE KEYS */;

INSERT INTO `status_barang` (`id`, `keterangan`)
VALUES
	(1,'available'),
	(2,'not available'),
	(3,'on proccess');

/*!40000 ALTER TABLE `status_barang` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id_supplier` char(50) NOT NULL DEFAULT '',
  `nama` varchar(50) DEFAULT NULL,
  `kontak` varchar(15) DEFAULT NULL,
  `no_telp` int(15) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;

INSERT INTO `supplier` (`id_supplier`, `nama`, `kontak`, `no_telp`, `alamat`)
VALUES
	('SUP-001','PT.Subur Jaya Indah','bpk subur',812445555,'kawasan mm'),
	('SUP-002','PT. EIC','Ibu Dewi',819343434,'kawasan mm');

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_barang_keluar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_barang_keluar`;

CREATE TABLE `tb_barang_keluar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `kode_barang` char(50) NOT NULL DEFAULT '',
  `jumlah` varchar(10) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_barang_keluar` WRITE;
/*!40000 ALTER TABLE `tb_barang_keluar` DISABLE KEYS */;

INSERT INTO `tb_barang_keluar` (`id`, `id_transaksi`, `tanggal_keluar`, `kode_barang`, `jumlah`, `keterangan`)
VALUES
	(5,'BK-201907532918','2019-10-23','A55-1000-29','10','diambil'),
	(6,'BK-201964572139','2019-10-25','AB-1232323','50','packing'),
	(7,'BK-201978523106','2019-10-28','A55-1000-29','50','diambil');

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
  `id_transaksi` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `kode_barang` char(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `jumlah` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `keterangan` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `kode_barang_masuk` (`kode_barang`),
  CONSTRAINT `kode_barang_masuk` FOREIGN KEY (`kode_barang`) REFERENCES `master_barang` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_barang_masuk` WRITE;
/*!40000 ALTER TABLE `tb_barang_masuk` DISABLE KEYS */;

INSERT INTO `tb_barang_masuk` (`id_transaksi`, `kode_barang`, `jumlah`, `keterangan`, `tanggal`)
VALUES
	('BM-201915867294','AB-1232323','80','ok','2019-10-10'),
	('BM-201983051927','A55-1000-29','150','ok','2019-10-14'),
	('BM-201984967135','A55-1000-29','60','ok','2019-10-09');

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
	(1,'admin2','nopic5.png','6.33'),
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
  `role` int(4) NOT NULL DEFAULT '1' COMMENT '1=admin, 2=gudang, 3=purchasing',
  `last_login` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `last_login`)
VALUES
	(11,'user1','user1@ymail.com','$2y$10$WZYOZcN05JHriS09.C6o7evdWIJ3Obj7vNHzuLunFIAZCDJtG6W1C',1,'17-03-2018 11:47'),
	(12,'userp','userp@gmail.com','$2y$10$MXbWRsLw6S6xpyQu2/ZiEeB7oTCLrfEPpDcXWaszFVoYj.Yv51wG.',3,'12-10-2019 22:57'),
	(16,'test','test@gmail.com','$2y$10$CTjzvmT5B.dxojKZOxsjTeMc4E7.Gwl9slAgX.0lozwGrKSMxzWdO',1,'16-03-2018 4:46'),
	(17,'admin2','admin2@gmail.com','$2y$10$WRMyjAi8nnkr3J3QvzvyHuEoqay5dYd5NgMJKxsxtXKCp8.JCxZm.',2,'15-01-2018 15:41'),
	(20,'admin','admin@gmail.com','$2y$10$3HNkMOtwX8X88Xb3DIveYuhXScTnJ9m16/rPDF1/VTa/VTisxVZ4i',1,'19-10-2019 16:05'),
	(22,'purchasing','purchasing@gmail.com','$2y$10$5gwQGT0FCs91vKlJqeGifuQlgRCsU.v2aF44qVoArrqvExxq3TM7K',2,'19-10-2019 16:06'),
	(23,'manager','manager@gmail.com','$2y$10$vOy2icy7PNmVOef8U0cwZe5t/lWkycKpRp.8A37xiuxDfROfpH5Qu',3,'19-10-2019 16:02');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
