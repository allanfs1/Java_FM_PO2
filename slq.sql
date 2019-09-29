-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.16 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para tx
CREATE DATABASE IF NOT EXISTS `tx` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tx`;

-- Copiando estrutura para tabela tx.tb_endereco
CREATE TABLE IF NOT EXISTS `tb_endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(25) NOT NULL,
  `UF` char(2) NOT NULL,
  `CEP` char(9) NOT NULL,
  `cidade` varchar(25) NOT NULL,
  `numero_ed` tinyint(10) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tx.tb_endereco: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` (`id_endereco`, `bairro`, `UF`, `CEP`, `cidade`, `numero_ed`) VALUES
	(1, 'Jardim', 'SP', '12350-000', 'São Paulo', 10),
	(2, 'Jardim', 'SP', '12350-000', 'São Paulo', 50),
	(3, 'Paulista', 'SP', '12430-000', 'São Paulo', 40);
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela tx.tb_pessoas
CREATE TABLE IF NOT EXISTS `tb_pessoas` (
  `is_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `id_tel` int(11) DEFAULT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  `dt_data` date DEFAULT NULL,
  `rg` double NOT NULL,
  `cpf` double NOT NULL,
  `natura_ld` char(2) DEFAULT NULL,
  `na_mae` varchar(45) DEFAULT NULL,
  `na_pai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`is_pessoa`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `rg` (`rg`),
  KEY `FK_endereco` (`id_endereco`),
  KEY `FK_telefone` (`id_tel`),
  CONSTRAINT `FK_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`),
  CONSTRAINT `FK_telefone` FOREIGN KEY (`id_tel`) REFERENCES `tb_telefone` (`id_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tx.tb_pessoas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_pessoas` DISABLE KEYS */;
INSERT INTO `tb_pessoas` (`is_pessoa`, `id_tel`, `id_endereco`, `nome`, `dt_data`, `rg`, `cpf`, `natura_ld`, `na_mae`, `na_pai`) VALUES
	(1, 3, 1, 'David F de Souza', '1966-12-12', 116677, 223242, 'SP', 'Luciene', 'David'),
	(2, 1, 2, 'Allan F de Souza', '1994-04-01', 6677, 323442, 'SP', 'Luciene', 'David');
/*!40000 ALTER TABLE `tb_pessoas` ENABLE KEYS */;

-- Copiando estrutura para tabela tx.tb_telefone
CREATE TABLE IF NOT EXISTS `tb_telefone` (
  `id_tel` int(11) NOT NULL AUTO_INCREMENT,
  `tel_celular` varchar(25) NOT NULL,
  `tel_residen` varchar(25) DEFAULT NULL,
  `dd` char(2) NOT NULL,
  PRIMARY KEY (`id_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tx.tb_telefone: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_telefone` DISABLE KEYS */;
INSERT INTO `tb_telefone` (`id_tel`, `tel_celular`, `tel_residen`, `dd`) VALUES
	(1, '9999999', '19393939', '11'),
	(2, '6666666', '11111111', '11'),
	(3, '646636', '24567711', '11');
/*!40000 ALTER TABLE `tb_telefone` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
