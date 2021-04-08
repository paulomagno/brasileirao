-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para brasileirao
CREATE DATABASE IF NOT EXISTS `brasileirao` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `brasileirao`;

-- Copiando estrutura para tabela brasileirao.classificacao
CREATE TABLE IF NOT EXISTS `classificacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id único da tabela',
  `id_time` int(11) NOT NULL DEFAULT '0' COMMENT 'id da equipe',
  `pontos` int(11) NOT NULL DEFAULT '0' COMMENT 'número de pontos da equipe',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='Tabela que registra a classificação de cada equipe no campeonato\r\n';

-- Copiando dados para a tabela brasileirao.classificacao: 20 rows
/*!40000 ALTER TABLE `classificacao` DISABLE KEYS */;
INSERT IGNORE INTO `classificacao` (`id`, `id_time`, `pontos`) VALUES
	(26, 2, 2),
	(0, 1, 12),
	(3, 3, 17),
	(4, 4, 18),
	(5, 5, 0),
	(6, 6, 4),
	(7, 7, 4),
	(8, 8, 3),
	(9, 9, 0),
	(10, 10, 0),
	(11, 11, 1),
	(12, 12, 3),
	(13, 13, 10),
	(14, 14, 0),
	(15, 15, 1),
	(16, 16, 0),
	(17, 17, 0),
	(18, 18, 0),
	(19, 19, 0),
	(20, 20, 3);
/*!40000 ALTER TABLE `classificacao` ENABLE KEYS */;

-- Copiando estrutura para view brasileirao.classificacaobrasileirao
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `classificacaobrasileirao` (
	`nome` VARCHAR(100) NOT NULL COMMENT 'Nome da Equipe' COLLATE 'utf8_general_ci',
	`uf` CHAR(2) NULL COMMENT 'Sigla da unidade federativa (UF) da equipe' COLLATE 'utf8_general_ci',
	`escudo` VARCHAR(100) NULL COMMENT 'Caminho/nome da imagem que representa o escudo da equipe' COLLATE 'utf8_general_ci',
	`pontos` INT(11) NOT NULL COMMENT 'número de pontos da equipe',
	`totalJogos` BIGINT(22) NULL,
	`totalVitorias` DECIMAL(24,0) NOT NULL,
	`totalEmpates` DECIMAL(24,0) NOT NULL,
	`totalDerrotas` DECIMAL(24,0) NOT NULL,
	`totalGolsMarcados` DECIMAL(33,0) NOT NULL,
	`totalGolsSofridos` DECIMAL(33,0) NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para tabela brasileirao.confrontos
CREATE TABLE IF NOT EXISTS `confrontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id único do confronto',
  `id_mandante` int(11) NOT NULL COMMENT 'id equipe mandante',
  `id_visitante` int(11) NOT NULL COMMENT 'id equipe visitante',
  `golsMandante` int(11) DEFAULT NULL COMMENT 'gols marcados pelo mandante',
  `golsVisitante` int(11) DEFAULT NULL COMMENT 'gols marcados pelo visitante',
  PRIMARY KEY (`id`),
  KEY `FK__equipe_mandante` (`id_mandante`),
  KEY `FK__equipe_visitante` (`id_visitante`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Tabela que registra as informações dos confrontos de cada equipe';

-- Copiando dados para a tabela brasileirao.confrontos: 28 rows
/*!40000 ALTER TABLE `confrontos` DISABLE KEYS */;
INSERT IGNORE INTO `confrontos` (`id`, `id_mandante`, `id_visitante`, `golsMandante`, `golsVisitante`) VALUES
	(2, 1, 2, 1, 1),
	(3, 1, 20, 2, 1),
	(4, 1, 3, 2, 3),
	(5, 6, 1, 1, 0),
	(6, 3, 13, 1, 1),
	(7, 8, 3, 2, 0),
	(8, 4, 9, 1, 0),
	(9, 4, 12, 4, 0),
	(10, 9, 3, 0, 1),
	(11, 4, 7, 1, 0),
	(12, 3, 14, 1, 0),
	(13, 4, 16, 1, 0),
	(14, 13, 14, 2, 1),
	(15, 13, 10, 1, 0),
	(16, 12, 5, 1, 0),
	(17, 3, 15, 1, 0),
	(18, 11, 1, 1, 1),
	(19, 4, 19, 2, 0),
	(20, 3, 10, 4, 0),
	(21, 1, 20, 1, 0),
	(22, 6, 3, 0, 0),
	(23, 2, 7, 0, 0),
	(24, 1, 15, 0, 0),
	(25, 5, 20, 0, 1),
	(26, 4, 15, 1, 0),
	(27, 7, 1, 1, 0),
	(28, 13, 1, 1, 0),
	(29, 1, 14, 1, 0);
/*!40000 ALTER TABLE `confrontos` ENABLE KEYS */;

-- Copiando estrutura para tabela brasileirao.equipes
CREATE TABLE IF NOT EXISTS `equipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeEquipe` varchar(100) NOT NULL COMMENT 'Nome da Equipe',
  `ufEquipe` char(2) DEFAULT '' COMMENT 'Sigla da unidade federativa (UF) da equipe',
  `escudoEquipe` varchar(100) DEFAULT NULL COMMENT 'Caminho/nome da imagem que representa o escudo da equipe',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Tabela com a representação da estrutura para o cadastro de equipes.';

-- Copiando dados para a tabela brasileirao.equipes: 20 rows
/*!40000 ALTER TABLE `equipes` DISABLE KEYS */;
INSERT IGNORE INTO `equipes` (`id`, `nomeEquipe`, `ufEquipe`, `escudoEquipe`) VALUES
	(1, 'América', 'MG', 'https://s.glbimg.com/es/sde/f/organizacoes/2019/02/28/America-MG-VERDE-fev2019-01.svg'),
	(2, 'Athletico', 'PR', 'https://s.glbimg.com/es/sde/f/organizacoes/2019/09/09/Athletico-PR.svg'),
	(3, 'Atlético', 'MG', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/10/atletico-mg.svg'),
	(4, 'Bahia', 'BA', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/11/bahia.svg'),
	(5, 'Bragantino', 'SP', 'https://s.glbimg.com/es/sde/f/organizacoes/2019/12/30/svg.svg'),
	(6, 'Ceará', 'CE', 'https://s.glbimg.com/es/sde/f/organizacoes/2019/10/10/ceara.svg'),
	(7, 'Chapecoense', 'SC', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/11/chapecoense.svg'),
	(8, 'Corinthians', 'SP', 'https://s.glbimg.com/es/sde/f/organizacoes/2019/09/30/Corinthians.svg'),
	(9, 'Cuiabá', 'MT', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/12/26/Cuiaba_EC.svg'),
	(10, 'Flamengo', 'RJ', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/04/10/Flamengo-2018.svg'),
	(11, 'Fluminense', 'RJ', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/11/fluminense.svg'),
	(12, 'Fortaleza', 'CE', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/06/10/optimised.svg'),
	(13, 'Grêmio', 'RS', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/12/gremio.svg'),
	(14, 'Internacional', 'RS', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/11/internacional.svg'),
	(15, 'Juventude', 'RS', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/11/juventude.svg'),
	(16, 'Palmeiras', 'SP', 'https://s.glbimg.com/es/sde/f/organizacoes/2019/07/06/Palmeiras.svg'),
	(17, 'Santos', 'SP', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/12/santos.svg'),
	(18, 'São Paulo\r\n', 'SP', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/11/sao-paulo.svg'),
	(19, 'Sport', 'PE', 'https://s.glbimg.com/es/sde/f/organizacoes/2018/03/11/sport.svg'),
	(20, 'Atlético', 'GO', 'https://s.glbimg.com/es/sde/f/organizacoes/2020/07/02/atletico-go-2020.svg');
/*!40000 ALTER TABLE `equipes` ENABLE KEYS */;

-- Copiando estrutura para view brasileirao.classificacaobrasileirao
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `classificacaobrasileirao`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `classificacaobrasileirao` AS select `equipes`.`nomeEquipe` AS `nome`,`equipes`.`ufEquipe` AS `uf`,`equipes`.`escudoEquipe` AS `escudo`,`classificacao`.`pontos` AS `pontos`,((select count(`confrontos`.`id_mandante`) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)) + (select count(`confrontos`.`id_visitante`) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`))) AS `totalJogos`,(ifnull((select sum((case when (`confrontos`.`golsMandante` > `confrontos`.`golsVisitante`) then 1 else 0 end)) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum((case when (`confrontos`.`golsVisitante` > `confrontos`.`golsMandante`) then 1 else 0 end)) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0)) AS `totalVitorias`,(ifnull((select sum((case when (`confrontos`.`golsMandante` = `confrontos`.`golsVisitante`) then 1 else 0 end)) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum((case when (`confrontos`.`golsVisitante` = `confrontos`.`golsMandante`) then 1 else 0 end)) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0)) AS `totalEmpates`,(ifnull((select sum((case when (`confrontos`.`golsMandante` < `confrontos`.`golsVisitante`) then 1 else 0 end)) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum((case when (`confrontos`.`golsVisitante` < `confrontos`.`golsMandante`) then 1 else 0 end)) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0)) AS `totalDerrotas`,(ifnull((select sum(`confrontos`.`golsMandante`) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum(`confrontos`.`golsVisitante`) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0)) AS `totalGolsMarcados`,(ifnull((select sum(`confrontos`.`golsVisitante`) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum(`confrontos`.`golsMandante`) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0)) AS `totalGolsSofridos` from (`classificacao` join `equipes` on((`equipes`.`id` = `classificacao`.`id_time`))) order by `classificacao`.`pontos` desc,((ifnull((select sum(`confrontos`.`golsMandante`) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum(`confrontos`.`golsVisitante`) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0)) - (ifnull((select sum(`confrontos`.`golsVisitante`) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum(`confrontos`.`golsMandante`) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0))) desc,(ifnull((select sum(`confrontos`.`golsMandante`) from `confrontos` where (`confrontos`.`id_mandante` = `equipes`.`id`)),0) + ifnull((select sum(`confrontos`.`golsVisitante`) from `confrontos` where (`confrontos`.`id_visitante` = `equipes`.`id`)),0)) desc;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
