-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.21-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
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

-- Copiando estrutura para tabela sac-web.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `cpfaluno` varchar(30) COLLATE utf8_bin NOT NULL,
  `ativo` bit(1) NOT NULL,
  `celular` bigint(20) DEFAULT NULL,
  `cep` varchar(50) COLLATE utf8_bin NOT NULL,
  `cidade` varchar(50) COLLATE utf8_bin NOT NULL,
  `datcada` date NOT NULL,
  `datnasc` date NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(50) COLLATE utf8_bin NOT NULL,
  `estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `rg` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha` varchar(50) COLLATE utf8_bin NOT NULL,
  `sexo` char(1) COLLATE utf8_bin NOT NULL,
  `telefone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cpfaluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.aluno: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`cpfaluno`, `ativo`, `celular`, `cep`, `cidade`, `datcada`, `datnasc`, `email`, `endereco`, `estado`, `nome`, `rg`, `senha`, `sexo`, `telefone`) VALUES
	('112', b'1', 998741205, '112', 'Botucatu', '2018-06-21', '2018-06-10', 'lucassilva@hotmail.com', 'Rua das Rosas', 'SP', 'Lucas', '499886552', 'lucas', 'F', 33261487),
	('122', b'0', 998410526, '122', 'Salto Grande', '2018-06-14', '2018-06-14', 'aninhac@gmail.com', 'Avenida Via Venito', 'SP', 'Ana Claire', '987412365', 'ana', 'F', 33264587),
	('123', b'1', 998745266, '123', 'Ourinhos', '2018-06-18', '2018-06-20', 'itallochamp@hotmail.com', 'Rua Melchior', 'SP', 'Itallo', '498712658', 'itallo', 'M', 33258741),
	('144', b'1', 998412653, '144', 'Ourinhos', '2018-06-15', '2018-06-20', 'jhonbento@gmail.com', 'Avenida Limeira', 'SP', 'João', '984102578', 'joao', 'M', 33254879),
	('455', b'1', 998415632, '455', 'Santa Cruz do Rio Pardo', '2018-06-13', '2018-06-20', 'abibesildes@outlook.com', 'Rua Moraes', 'SP', 'Abibe', '458712056', 'abibe', 'M', 33258974),
	('488', b'0', 998526547, '488', 'Londrina', '2018-06-21', '2018-06-13', 'joaquinaaa@gmail.com', 'Rua Benedito Alves', 'SP', 'Joaquina', '458712365', 'joaq', 'F', 33254897);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.aparelho
CREATE TABLE IF NOT EXISTS `aparelho` (
  `id_aparelho` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8_bin NOT NULL,
  `disponivel` char(1) COLLATE utf8_bin NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_aparelho`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.aparelho: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `aparelho` DISABLE KEYS */;
INSERT INTO `aparelho` (`id_aparelho`, `descricao`, `disponivel`, `nome`) VALUES
	(1, 'Fortalecer pernas', 'S', 'Cadeira Flexora e Extensora'),
	(3, 'Fortelcer peito', 'S', 'Peitoral'),
	(4, 'Fortalecer abdômen', 'S', 'Abdominal'),
	(5, 'Fortalecer braços', 'S', 'Supino'),
	(6, 'Fortalecer pernas', 'S', 'Agachamento'),
	(7, 'Fortalecer costas', 'S', 'Lombar'),
	(8, 'Fortalecer panturrilhas', 'S', 'Panturrilha sentado');
/*!40000 ALTER TABLE `aparelho` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.atividadealuno
CREATE TABLE IF NOT EXISTS `atividadealuno` (
  `id_atividade` bigint(20) NOT NULL AUTO_INCREMENT,
  `carga` varchar(50) COLLATE utf8_bin NOT NULL,
  `ciclo` varchar(50) COLLATE utf8_bin NOT NULL,
  `datinicio` date NOT NULL,
  `periodo` varchar(50) COLLATE utf8_bin NOT NULL,
  `cpfalunos` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `id_aparelhos` bigint(20) DEFAULT NULL,
  `cpffuncionarios` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `FK_n268si777780k5rcvw7rrtld5` (`cpfalunos`),
  KEY `FK_76blmh47pv5ayvgfb3bfsf18x` (`id_aparelhos`),
  KEY `FK_gpumjduf0snx3ap2ok32llv3x` (`cpffuncionarios`),
  CONSTRAINT `FK_76blmh47pv5ayvgfb3bfsf18x` FOREIGN KEY (`id_aparelhos`) REFERENCES `aparelho` (`id_aparelho`),
  CONSTRAINT `FK_gpumjduf0snx3ap2ok32llv3x` FOREIGN KEY (`cpffuncionarios`) REFERENCES `funcionario` (`cpffuncionario`),
  CONSTRAINT `FK_n268si777780k5rcvw7rrtld5` FOREIGN KEY (`cpfalunos`) REFERENCES `aluno` (`cpfaluno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.atividadealuno: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `atividadealuno` DISABLE KEYS */;
INSERT INTO `atividadealuno` (`id_atividade`, `carga`, `ciclo`, `datinicio`, `periodo`, `cpfalunos`, `id_aparelhos`, `cpffuncionarios`) VALUES
	(1, '40,45,50 kilos', '12,10,8 vezes', '2018-06-08', '2 semanas', '123', 1, '456'),
	(2, '25,30,35 kilos', '12,10,8 vezes', '2018-06-15', '1 semana', '112', 3, '300'),
	(3, '60,65,70 kilos', '12,10,8 vezes', '2018-06-01', '3 semanas', '122', 4, '362'),
	(4, '50,55,60 kilos', '10,8,8 vezes', '2018-06-02', '2 semanas', '144', 5, '677'),
	(5, '10,15,20 kilos', '10,10,10 vezes', '2018-06-07', '1 semana', '455', 6, '822'),
	(6, '40,45,50 kilos', '12,10,8 vezes', '2018-06-14', '4 semanas', '123', 4, '456');
/*!40000 ALTER TABLE `atividadealuno` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.avaliacao
CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id_avaliacao` bigint(20) NOT NULL AUTO_INCREMENT,
  `adiposidadeVisceral` varchar(50) COLLATE utf8_bin NOT NULL,
  `antebraco` varchar(50) COLLATE utf8_bin NOT NULL,
  `biceps` varchar(50) COLLATE utf8_bin NOT NULL,
  `cintura` varchar(50) COLLATE utf8_bin NOT NULL,
  `coeficiente` varchar(50) COLLATE utf8_bin NOT NULL,
  `coxa` varchar(50) COLLATE utf8_bin NOT NULL,
  `data` date NOT NULL,
  `gorduraCorporal` varchar(50) COLLATE utf8_bin NOT NULL,
  `horario` time NOT NULL,
  `idadeMetabolica` varchar(50) COLLATE utf8_bin NOT NULL,
  `imc` varchar(50) COLLATE utf8_bin NOT NULL,
  `ingestaoCaloricaDiaria` varchar(50) COLLATE utf8_bin NOT NULL,
  `massaMuscular` varchar(50) COLLATE utf8_bin NOT NULL,
  `metabolismoBasal` varchar(50) COLLATE utf8_bin NOT NULL,
  `panturrilha` varchar(50) COLLATE utf8_bin NOT NULL,
  `peito` varchar(50) COLLATE utf8_bin NOT NULL,
  `pescoco` varchar(50) COLLATE utf8_bin NOT NULL,
  `peso` varchar(50) COLLATE utf8_bin NOT NULL,
  `cpfalunos` varchar(30) COLLATE utf8_bin,
  `cpffuncionarios` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `FK_j3tiksuc2vea3auogtg354jby` (`cpfalunos`),
  KEY `FK_d93okkbj87g7denr7qhr5g41s` (`cpffuncionarios`),
  CONSTRAINT `FK_d93okkbj87g7denr7qhr5g41s` FOREIGN KEY (`cpffuncionarios`) REFERENCES `funcionario` (`cpffuncionario`),
  CONSTRAINT `FK_j3tiksuc2vea3auogtg354jby` FOREIGN KEY (`cpfalunos`) REFERENCES `aluno` (`cpfaluno`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.avaliacao: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` (`id_avaliacao`, `adiposidadeVisceral`, `antebraco`, `biceps`, `cintura`, `coeficiente`, `coxa`, `data`, `gorduraCorporal`, `horario`, `idadeMetabolica`, `imc`, `ingestaoCaloricaDiaria`, `massaMuscular`, `metabolismoBasal`, `panturrilha`, `peito`, `pescoco`, `peso`, `cpfalunos`, `cpffuncionarios`) VALUES
	(5, '14', '94', '85', '30', '87', '14', '2018-06-08', '47', '20:11:26', '50', '30', '59', '62', '48', '15', '12', '96', '25', '112', '300'),
	(6, '89', '84', '96', '35', '57', '85', '2018-06-22', '63', '20:11:55', '62', '47', '74', '41', '98', '96', '96', '58', '52', '122', '362'),
	(7, '59', '41', '25', '32', '87', '54', '2018-06-10', '63', '20:12:23', '97', '48', '84', '20', '56', '79', '96', '63', '97', '123', '456'),
	(8, '48', '78', '41', '68', '79', '79', '2018-06-06', '78', '20:12:54', '78', '49', '25', '95', '63', '45', '95', '62', '14', '144', '677'),
	(9, '85', '49', '52', '63', '21', '21', '2018-06-09', '74', '20:13:18', '87', '59', '63', '95', '49', '25', '87', '48', '58', '455', '822'),
	(10, '87', '45', '97', '55', '63', '99', '2018-06-02', '12', '20:13:42', '78', '49', '25', '59', '63', '77', '33', '25', '94', '488', '456');
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `cpffuncionario` varchar(15) COLLATE utf8_bin NOT NULL,
  `celular` bigint(20) DEFAULT NULL,
  `cep` varchar(50) COLLATE utf8_bin NOT NULL,
  `cidade` varchar(50) COLLATE utf8_bin NOT NULL,
  `datcada` date NOT NULL,
  `datnasc` date NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(50) COLLATE utf8_bin NOT NULL,
  `estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `motivo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `rg` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha` varchar(50) COLLATE utf8_bin NOT NULL,
  `sexo` char(1) COLLATE utf8_bin NOT NULL,
  `telefone` bigint(20) DEFAULT NULL,
  `tipo` char(1) COLLATE utf8_bin NOT NULL,
  `turno` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cpffuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.funcionario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`cpffuncionario`, `celular`, `cep`, `cidade`, `datcada`, `datnasc`, `email`, `endereco`, `estado`, `motivo`, `nome`, `rg`, `senha`, `sexo`, `telefone`, `tipo`, `turno`) VALUES
	('300', 998521496, '300', 'Chavantes', '2018-06-16', '2018-06-20', 'keilamello@hotmail.com', 'Rua das Araras', 'SP', 'filha pequena', 'Keila', '452036874', 'keila', 'F', 33254879, 'P', 'M'),
	('362', 998526784, '362', 'Cambará', '2018-06-21', '2018-06-20', 'luanzinho@hotmail.com', 'Rua dos Desastrados', 'PR', 'mulher com fome', 'Luan', '459871206', 'luan', 'M', 33261547, 'P', 'N'),
	('456', 998745626, '456', 'Piraju', '2018-06-20', '2018-06-20', 'fredsantos@gmail.com', 'Rua Antônio Silva', 'SP', 'dinheiro', 'Frederico', '498712036', 'fred', 'M', 33258497, 'P', 'N'),
	('555', 998412578, '555', 'Ourinhos', '2018-06-21', '2018-06-20', 'jujusp@gmail.com', 'Rua Aparecido Silva', 'SP', 'chefe da porra toda', 'Juliano', '458712365', 'juliano', 'M', 33265874, 'R', 'V'),
	('677', 998416578, '677', 'Ipaussu', '2018-06-21', '2018-06-20', 'vitinhoalegre@hotmail.com', 'Rua dos Arrombados', 'SP', 'filho pequeno', 'Vitor', '458712365', 'vitor', 'M', 33258479, 'P', 'V'),
	('822', 996258741, '822', 'Salto Grande', '2018-06-01', '2018-06-04', 'dianazanutto@outlook.com', 'Rua Maravilha', 'SP', 'filha pequena', 'Diana', '487123658', 'diana', 'F', 33265487, 'P', 'N');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela sac-web.pressao
CREATE TABLE IF NOT EXISTS `pressao` (
  `id_pressao` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `horario` time NOT NULL,
  `pressoaMinimaMaximaEntrada` varchar(50) COLLATE utf8_bin NOT NULL,
  `pressoaMinimaMaximaSaida` varchar(50) COLLATE utf8_bin NOT NULL,
  `cpfalunos` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `cpffuncionarios` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_pressao`),
  KEY `FK_ma8agte31trsy9pjyasrtu22r` (`cpfalunos`),
  KEY `FK_f6b8a5c0xvtuu98scr7pwad61` (`cpffuncionarios`),
  CONSTRAINT `FK_f6b8a5c0xvtuu98scr7pwad61` FOREIGN KEY (`cpffuncionarios`) REFERENCES `funcionario` (`cpffuncionario`),
  CONSTRAINT `FK_ma8agte31trsy9pjyasrtu22r` FOREIGN KEY (`cpfalunos`) REFERENCES `aluno` (`cpfaluno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela sac-web.pressao: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `pressao` DISABLE KEYS */;
INSERT INTO `pressao` (`id_pressao`, `data`, `horario`, `pressoaMinimaMaximaEntrada`, `pressoaMinimaMaximaSaida`, `cpfalunos`, `cpffuncionarios`) VALUES
	(1, '2018-06-08', '15:51:58', '12/80', '13/60', '123', '456'),
	(2, '2018-06-06', '20:08:53', '11/80', '12/75', '112', '300'),
	(3, '2018-06-22', '20:09:14', '13/65', '12/80', '122', '362'),
	(4, '2018-06-14', '20:09:37', '09/80', '12/70', '144', '677'),
	(5, '2018-06-15', '20:09:55', '12/80', '13/85', '488', '822'),
	(6, '2018-06-14', '20:10:23', '11/85', '14/60', '455', '362');
/*!40000 ALTER TABLE `pressao` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
