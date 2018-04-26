-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.21-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para sac-web
CREATE DATABASE IF NOT EXISTS `sac-web` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `sac-web`;

-- Copiando estrutura para tabela sac-web.aparelho
CREATE TABLE IF NOT EXISTS `aparelho` (
  `id_aparelho` bigint(20) NOT NULL AUTO_INCREMENT,
  `descrição` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `disponivel` bit(1) DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_aparelho`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.aparelho: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `aparelho` DISABLE KEYS */;
INSERT INTO `aparelho` (`id_aparelho`, `descrição`, `disponivel`, `nome`) VALUES
	(1, 'heheheh', b'0', 'vcvcvcv'),
	(3, 'cccccc', b'1', 'bíceps'),
	(4, 'ddddd', b'0', 'tríceps'),
	(5, 'eeeeee', b'0', 'pescoço');
/*!40000 ALTER TABLE `aparelho` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.atividadealuno
CREATE TABLE IF NOT EXISTS `atividadealuno` (
  `idatividade` bigint(20) NOT NULL AUTO_INCREMENT,
  `carga` varchar(50) COLLATE utf8_bin NOT NULL,
  `ciclo` varchar(50) COLLATE utf8_bin NOT NULL,
  `periodo` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idatividade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.atividadealuno: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `atividadealuno` DISABLE KEYS */;
INSERT INTO `atividadealuno` (`idatividade`, `carga`, `ciclo`, `periodo`) VALUES
	(2, '320 kilos', '47 vezes', '10 dias'),
	(3, '120 kilos', '45 vezes', '20 dias'),
	(5, '100 kilos', '30 vezes', '15 dias'),
	(6, '50 kilos', '41 vezes', '17 dias');
/*!40000 ALTER TABLE `atividadealuno` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `cpffuncionario` varchar(15) COLLATE utf8_bin NOT NULL,
  `celular` bigint(20) DEFAULT NULL,
  `cep` varchar(50) COLLATE utf8_bin NOT NULL,
  `cidade` varchar(50) COLLATE utf8_bin NOT NULL,
  `datcada` varchar(50) COLLATE utf8_bin NOT NULL,
  `datnasc` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(50) COLLATE utf8_bin NOT NULL,
  `estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `motivo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `rg` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha` varchar(50) COLLATE utf8_bin NOT NULL,
  `sexo` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefone` bigint(20) DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_bin NOT NULL,
  `turno` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cpffuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.funcionario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`cpffuncionario`, `celular`, `cep`, `cidade`, `datcada`, `datnasc`, `email`, `endereco`, `estado`, `motivo`, `nome`, `rg`, `senha`, `sexo`, `telefone`, `tipo`, `turno`) VALUES
	('45445545', 7837878874, '194464646959', 'Chavantes', '19/09/2017', '28/04/1949', 'gççççççfego@hotmail.com', 'Rua das da Ervilha', 'SP', 'Perdeu um dente', 'Xênia', '166778878126', '96llllllej', 'Feminino', 3300000494, 'Guerrreira', 'Manhã');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `pkcpf` varchar(30) COLLATE utf8_bin NOT NULL,
  `celular` bigint(20) DEFAULT NULL,
  `cep` varchar(50) COLLATE utf8_bin NOT NULL,
  `cidade` varchar(50) COLLATE utf8_bin NOT NULL,
  `datcada` varchar(50) COLLATE utf8_bin NOT NULL,
  `datnasc` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(50) COLLATE utf8_bin NOT NULL,
  `estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `rg` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha` varchar(50) COLLATE utf8_bin NOT NULL,
  `sexo` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefone` bigint(20) DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pkcpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`pkcpf`, `celular`, `cep`, `cidade`, `datcada`, `datnasc`, `email`, `endereco`, `estado`, `nome`, `rg`, `senha`, `sexo`, `telefone`, `tipo`) VALUES
	('12345X', 7894, '1945', 'Ourinhos', '15/04/2006', '02/07/1993', 'jeimo@hotmail.com', 'Rua Melchior da Silva', 'SP', 'Lucas', '198526', 'jgfjgijfigjfj', 'Masculino', 33258794, 'Foda'),
	('166445X', 783842323232294, '194943495959', 'Palmital', '19/09/2007', '28/04/1979', 'gegegegekkkkfego@hotmail.com', 'Rua das do Tomate', 'SP', 'Vardomiro', '16654434341212126', '969696969thkkkehej', 'Masculin0', 330003494, 'Curintiano'),
	('1665454545X', 78224343432294, '1949959595', 'Amazônia', '14/09/2012', '27/04/1984', 'jdlll33efedgego@hotmail.com', 'Rua Things', 'AM', 'Eduarda', '166544323235526', 'jgftttghththkkkehej', 'Feminino', 33265794, 'Safada'),
	('16658383545X', 78384433432294, '19494343435', 'Goiânia', '19/09/2010', '28/04/1999', 'jdllgegoooefego@hotmail.com', 'Rua das Rosas', 'GO', 'Stifler', '1665454235526', 'jqwqwqwqghththkkkehej', 'Masculino', 3324343494, 'Otário');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
