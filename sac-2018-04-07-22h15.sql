-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para sac
CREATE DATABASE IF NOT EXISTS `sac` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `sac`;

-- Copiando estrutura para tabela sac.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `cpfaluno` int(10) unsigned NOT NULL,
  `status` varchar(50) COLLATE utf8_bin NOT NULL,
  `fkcpfusuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cpfaluno`),
  KEY `ifkcpfusuario` (`fkcpfusuario`),
  CONSTRAINT `fkalunocpfusuario` FOREIGN KEY (`fkcpfusuario`) REFERENCES `usuario` (`cpfusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.aluno: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.aparelho
CREATE TABLE IF NOT EXISTS `aparelho` (
  `idaparelho` int(10) unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `descricao` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `disponivel` blob,
  `fkidplanoaparelho` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idaparelho`),
  KEY `ifkplanoaparelho` (`fkidplanoaparelho`),
  CONSTRAINT `fkaparelhoidplanoaparelho` FOREIGN KEY (`fkidplanoaparelho`) REFERENCES `planoaparelho` (`idplanoaparelho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.aparelho: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aparelho` DISABLE KEYS */;
/*!40000 ALTER TABLE `aparelho` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.atende
CREATE TABLE IF NOT EXISTS `atende` (
  `fkcpffuncionario` int(10) unsigned NOT NULL,
  `fkcpfaluno` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fkcpffuncionario`),
  KEY `ifkcpffuncionario` (`fkcpffuncionario`),
  KEY `ifkcpfaluno` (`fkcpfaluno`),
  CONSTRAINT `fkatendecpfaluno` FOREIGN KEY (`fkcpfaluno`) REFERENCES `aluno` (`cpfaluno`),
  CONSTRAINT `fkatendecpffuncionario` FOREIGN KEY (`fkcpffuncionario`) REFERENCES `funcionario` (`cpffuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.atende: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `atende` DISABLE KEYS */;
/*!40000 ALTER TABLE `atende` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.atividadealuno
CREATE TABLE IF NOT EXISTS `atividadealuno` (
  `idatividade` int(10) unsigned NOT NULL,
  `periodo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ciclo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `carga` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fkidplano` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idatividade`),
  KEY `ifkidplano` (`fkidplano`),
  CONSTRAINT `fkatividadealunoidplano` FOREIGN KEY (`fkidplano`) REFERENCES `plano` (`idplano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.atividadealuno: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `atividadealuno` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividadealuno` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `cpffuncionario` int(10) unsigned NOT NULL,
  `turno` varchar(50) COLLATE utf8_bin NOT NULL,
  `motivo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fkcpfusuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cpffuncionario`),
  KEY `ifkcpfusuario` (`fkcpfusuario`),
  CONSTRAINT `fkfuncionariocpfusuario` FOREIGN KEY (`fkcpfusuario`) REFERENCES `usuario` (`cpfusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.funcionario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.medidas
CREATE TABLE IF NOT EXISTS `medidas` (
  `idmedidas` int(10) unsigned NOT NULL,
  `data` date NOT NULL,
  `horario` time NOT NULL,
  `imc` double NOT NULL,
  `idademetabolica` double NOT NULL,
  `metabolismobasal` double NOT NULL,
  `ingestaocaloricadiaria` double NOT NULL,
  `peso` double NOT NULL,
  `gorduracorporal` double NOT NULL,
  `massamuscular` double NOT NULL,
  `adiposidadevisceral` double NOT NULL,
  `coeficiente` double NOT NULL,
  `pescoco` double NOT NULL,
  `biceps` double NOT NULL,
  `antebraco` double NOT NULL,
  `peito` double NOT NULL,
  `cintura` double NOT NULL,
  `quadris` double NOT NULL,
  `panturrilha` double NOT NULL,
  `fkidplano` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmedidas`),
  KEY `ifkidplano` (`fkidplano`),
  CONSTRAINT `fkmedidasidplano` FOREIGN KEY (`fkidplano`) REFERENCES `plano` (`idplano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.medidas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `medidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `medidas` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.plano
CREATE TABLE IF NOT EXISTS `plano` (
  `idplano` int(11) unsigned NOT NULL,
  `datinicial` date NOT NULL,
  `datfinal` date NOT NULL,
  `fkcpffuncionario` int(11) unsigned NOT NULL,
  `fkcpfaluno` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idplano`),
  KEY `ifkcpffuncionario` (`fkcpffuncionario`),
  KEY `ifkcpfaluno` (`fkcpfaluno`),
  CONSTRAINT `fkplanocpfaluno` FOREIGN KEY (`fkcpfaluno`) REFERENCES `aluno` (`cpfaluno`),
  CONSTRAINT `fkplanocpffuncionario` FOREIGN KEY (`fkcpffuncionario`) REFERENCES `funcionario` (`cpffuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.plano: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.planoaparelho
CREATE TABLE IF NOT EXISTS `planoaparelho` (
  `idplanoaparelho` int(10) unsigned NOT NULL,
  `ciclos` varchar(50) COLLATE utf8_bin NOT NULL,
  `cargas` varchar(50) COLLATE utf8_bin NOT NULL,
  `fkidplano` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idplanoaparelho`),
  KEY `ifkidplano` (`fkidplano`),
  CONSTRAINT `fkplanoaparelhoidplano` FOREIGN KEY (`fkidplano`) REFERENCES `plano` (`idplano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.planoaparelho: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `planoaparelho` DISABLE KEYS */;
/*!40000 ALTER TABLE `planoaparelho` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.presenca
CREATE TABLE IF NOT EXISTS `presenca` (
  `idpresenca` int(10) unsigned NOT NULL,
  `datentrada` date NOT NULL,
  `datsaida` date NOT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time NOT NULL,
  `fkcpfusuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpresenca`),
  KEY `ifkcpfusuario` (`fkcpfusuario`),
  CONSTRAINT `fkpresencafuncionario` FOREIGN KEY (`fkcpfusuario`) REFERENCES `usuario` (`cpfusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.presenca: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `presenca` DISABLE KEYS */;
/*!40000 ALTER TABLE `presenca` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.pressao
CREATE TABLE IF NOT EXISTS `pressao` (
  `idpressao` int(10) unsigned NOT NULL,
  `data` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `pressaomin` int(11) DEFAULT NULL,
  `pressaomax` int(11) DEFAULT NULL,
  `maxentrada` int(11) DEFAULT NULL,
  `minsaida` int(11) DEFAULT NULL,
  `fkidplano` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpressao`),
  KEY `ifkidplano` (`fkidplano`),
  CONSTRAINT `fkpressaoidplano` FOREIGN KEY (`fkidplano`) REFERENCES `plano` (`idplano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.pressao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pressao` DISABLE KEYS */;
/*!40000 ALTER TABLE `pressao` ENABLE KEYS */;

-- Copiando estrutura para tabela sac.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `cpfusuario` int(10) unsigned NOT NULL,
  `tipo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(50) COLLATE utf8_bin NOT NULL,
  `cep` int(11) NOT NULL,
  `cidade` varchar(50) COLLATE utf8_bin NOT NULL,
  `estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefone` varchar(50) COLLATE utf8_bin NOT NULL,
  `celular` int(11) NOT NULL,
  `sexo` varchar(50) COLLATE utf8_bin NOT NULL,
  `rg` int(11) NOT NULL,
  `ufrg` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `datnasc` date NOT NULL,
  `datcad` date NOT NULL,
  `senha` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cpfusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
