use backup_diana_06_10;

alter table fazenda
add column codTanque varchar(36),
add column codQualidade varchar(36);
ALTER TABLE `backup_diana_06_10`.`fazenda` 
CHANGE COLUMN `codQualidade` `codQualidade` VARCHAR(36) NULL DEFAULT NULL AFTER `codTanque`;
ALTER TABLE `backup_diana_06_10`.`fazenda` 
ADD COLUMN `prodMedia` DOUBLE NULL AFTER `codQualidade`;

ALTER TABLE `backup_diana_06_10`.`produtor` 
DROP COLUMN `producaoMedia`,
DROP COLUMN `qualidade`;

alter table tanque 
drop column codFazenda,
add column posLat double,
add column posLng double,
add column codRota varchar(36),
add column codQualidade varchar(36);
ALTER TABLE `backup_diana_06_10`.`tanque` 
CHANGE COLUMN `codRota` `codRota` VARCHAR(36) NULL DEFAULT NULL AFTER `CodTanque`,
CHANGE COLUMN `codQualidade` `codQualidade` VARCHAR(36) NULL DEFAULT NULL AFTER `codRota`,
CHANGE COLUMN `posLat` `posLat` DOUBLE NOT NULL AFTER `Capacidade`,
CHANGE COLUMN `posLng` `posLng` DOUBLE NOT NULL AFTER `posLat`;

CREATE TABLE `backup_diana_06_10`.`qualidade` (
  `codQualidade` VARCHAR(36) NOT NULL,
  `CCS` DOUBLE NULL,
  `CBT` DOUBLE NULL,
  `%LACTOSE` DOUBLE NULL,
  `%ESD` DOUBLE NULL,
  `%EST` DOUBLE NULL,
  `%PROTEINA` DOUBLE NULL,
  `%GORDURA` DOUBLE NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXCLUIDO` TINYINT(4) NOT NULL DEFAULT '0',
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastSend` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`codQualidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE `backup_diana_06_10`.`rota` (
  `codRota` VARCHAR(36) NOT NULL,
  `codTransportador` VARCHAR(36) NOT NULL,
  `jsonRota` JSON NULL,
  PRIMARY KEY (`codRota`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
ALTER TABLE `backup_diana_06_10`.`rota` 
ADD COLUMN `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `jsonRota`,
ADD COLUMN `EXCLUIDO` TINYINT(4) NOT NULL DEFAULT '0' AFTER `created_at`,
ADD COLUMN `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `EXCLUIDO`,
ADD COLUMN `LastSend` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `updated_at`;
ALTER TABLE `backup_diana_06_10`.`rota` 
CHANGE COLUMN `jsonRota` `jsonRota` JSON NOT NULL ;

CREATE TABLE `backup_diana_06_10`.`transportador` (
  `codTransportador` VARCHAR(36) NOT NULL,
  `codUsuario` VARCHAR(36) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXCLUIDO` TINYINT(4) NOT NULL DEFAULT '0',
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastSend` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`codTransportador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
ALTER TABLE `backup_diana_06_10`.`transportador` 
CHANGE COLUMN `codUsuario` `codUsuario` VARCHAR(36) NOT NULL ;

CREATE TABLE `backup_diana_06_10`.`coleta` (
  `codColeta` VARCHAR(36) NOT NULL,
  `codTanque` VARCHAR(36) NOT NULL,
  `codTransportador` VARCHAR(36) NOT NULL,
  `volumeLeite` DOUBLE NOT NULL,
  `temperatura` DECIMAL(5,2) NOT NULL,
  `resultadoTeste` TINYINT NOT NULL,
  `obs` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXCLUIDO` TINYINT(4) NOT NULL DEFAULT '0',
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastSend` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`codColeta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE TABLE `backup_diana_06_10`.`registroProducao` (
  `codProducao` VARCHAR(36) NOT NULL,
  `codColeta` VARCHAR(36) NULL,
  `codFazenda` VARCHAR(36) NULL,
  PRIMARY KEY (`codProducao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;




