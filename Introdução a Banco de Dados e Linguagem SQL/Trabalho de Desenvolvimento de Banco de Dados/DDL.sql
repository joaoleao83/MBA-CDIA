-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbprf1` DEFAULT CHARACTER SET utf8 ;
USE `dbprf1` ;

-- -----------------------------------------------------
-- Table ``.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`Pessoa` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `naturalidade` VARCHAR(45) NULL,
  `profissao` VARCHAR(45) NULL,
  `contato` VARCHAR(45) NULL,
  `dataNascimento` DATE NULL,
  `numeroDocumentoPrincipal` VARCHAR(45) NULL,
  `dataObito` DATE NULL,
  `nomeGenitor` VARCHAR(45) NULL,
  `nomeGenitora` VARCHAR(45) NULL,
  `modalidade` ENUM('FISICA', 'JURIDICA') NULL,
  `modalidadeDocumentoPrincipal` ENUM("CPF", "CNPJ") NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`ProcessoJudicial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`ProcessoJudicial` (
  `id` INT NOT NULL,
  `numero` VARCHAR(45) NULL,
  `numeroFormatado` VARCHAR(45) NULL,
  `numeroAlternativo` VARCHAR(45) NULL,
  `classeNacional` VARCHAR(45) NULL,
  `orgaoJulgador` VARCHAR(45) NULL,
  `dataHoraAjuizamento` DATETIME NULL,
  `dataHoraCitacao` DATETIME NULL,
  `dataHoraTransitoJulgado` DATETIME NULL,
  `intervencaoMP` TINYINT NULL,
  `eletronico` TINYINT NULL,
  `valorCausa` FLOAT NULL,
  `criadoEm` DATETIME NULL,
  `atualizadoEm` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`Processo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`Processo` (
  `id` INT NOT NULL,
  `valorEconomico` FLOAT NULL,
  `protocoloEletronico` TINYINT NULL,
  `NUP` VARCHAR(45) NULL,
  `NUPFormatado` VARCHAR(45) NULL,
  `especieProcesso` ENUM('JUDICIAL', 'ADMINISTRATIVO') NULL,
  `dataHoraAbertura` DATETIME NULL,
  `dataHoraEncerramento` DATETIME NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `outroNumero` VARCHAR(45) NULL,
  `descricao` VARCHAR(255) NULL,
  `procedencia` INT NOT NULL,
  `setorAtual` VARCHAR(45) NULL,
  `setorInicial` VARCHAR(45) NULL,
  `acessoRestrito` TINYINT NULL,
  `criadoEm` DATETIME NULL,
  `atualizadoEm` DATETIME NULL,
  `ProcessoJudicial_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Processo_ProcessoJudicial1_idx` (`ProcessoJudicial_id` ASC) VISIBLE,
  INDEX `fk_procedencia_Pessoa_idx` (`procedencia` ASC) VISIBLE,
  CONSTRAINT `fk_Processo_ProcessoJudicial1`
    FOREIGN KEY (`ProcessoJudicial_id`)
    REFERENCES ``.`ProcessoJudicial` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedencia_Pessoa`
    FOREIGN KEY (`procedencia`)
    REFERENCES ``.`Pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`Volume`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`Volume` (
  `id` INT NOT NULL,
  `Processo_id` INT NOT NULL,
  `encerrado` TINYINT NULL,
  `numeracaoSequencial` INT NULL,
  `criadoEm` DATETIME NULL,
  `atualizadoEm` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Volume_Processo1_idx` (`Processo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Volume_Processo1`
    FOREIGN KEY (`Processo_id`)
    REFERENCES ``.`Processo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`Juntada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`Juntada` (
  `id` INT NOT NULL,
  `Volume_id` INT NOT NULL,
  `numeracaoSequencial` INT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Juntada_Volume1_idx` (`Volume_id` ASC) VISIBLE,
  CONSTRAINT `fk_Juntada_Volume1`
    FOREIGN KEY (`Volume_id`)
    REFERENCES ``.`Volume` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`PessoaInteressada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`PessoaInteressada` (
  `ProcessoJudicial_id` INT NOT NULL,
  `Pessoa_id` INT NOT NULL,
  `modalidadeParte` ENUM('POLO ATIVO', 'POLO PASSIVO', 'TERCEIRO INTERESSADO') NULL,
  PRIMARY KEY (`ProcessoJudicial_id`, `Pessoa_id`),
  INDEX `fk_ProcessoJudicial_has_Pessoa_Pessoa1_idx` (`Pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_ProcessoJudicial_has_Pessoa_ProcessoJudicial1`
    FOREIGN KEY (`ProcessoJudicial_id`)
    REFERENCES ``.`ProcessoJudicial` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProcessoJudicial_has_Pessoa_Pessoa1`
    FOREIGN KEY (`Pessoa_id`)
    REFERENCES ``.`Pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`PessoaRepresentada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`PessoaRepresentada` (
  `Pessoa_id` INT NOT NULL,
  `ProcessoJudicial_id` INT NOT NULL,
  `modalidadeRepresentada` ENUM('FUNDACAO PUBLICA', 'AUTARQUIA') NULL,
  PRIMARY KEY (`Pessoa_id`, `ProcessoJudicial_id`),
  INDEX `fk_Pessoa_has_ProcessoJudicial_ProcessoJudicial1_idx` (`ProcessoJudicial_id` ASC) VISIBLE,
  INDEX `fk_Pessoa_has_ProcessoJudicial_Pessoa1_idx` (`Pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_has_ProcessoJudicial_Pessoa1`
    FOREIGN KEY (`Pessoa_id`)
    REFERENCES ``.`Pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_has_ProcessoJudicial_ProcessoJudicial1`
    FOREIGN KEY (`ProcessoJudicial_id`)
    REFERENCES ``.`ProcessoJudicial` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`Documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`Documento` (
  `id` INT NOT NULL,
  `Juntada_id` INT NOT NULL,
  `numeroFolhas` VARCHAR(45) NULL,
  `dataHoraProducao` DATETIME NULL,
  `assinado` TINYINT NULL,
  `semEfeito` TINYINT NULL DEFAULT 0,
  `temAnexos` TINYINT NULL,
  `autor` VARCHAR(45) NULL,
  `destinatario` VARCHAR(45) NULL,
  `tipoDocumento` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `observacao` VARCHAR(45) NULL,
  `setorOrigem` VARCHAR(45) NULL,
  `acessoRestrito` TINYINT NULL,
  `conteudo` VARCHAR(1024) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Documento_Juntada1_idx` (`Juntada_id` ASC) VISIBLE,
  CONSTRAINT `fk_Documento_Juntada1`
    FOREIGN KEY (`Juntada_id`)
    REFERENCES ``.`Juntada` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ``.`ProcessoVinculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprf1`.`ProcessoVinculado` (
  `Processo` INT NOT NULL,
  `processoVinculado` INT NOT NULL,
  `observacao` VARCHAR(255) NULL,
  PRIMARY KEY (`Processo`, `processoVinculado`),
  INDEX `fk_Processo_has_Processo_Processo2_idx` (`processoVinculado` ASC) VISIBLE,
  INDEX `fk_Processo_has_Processo_Processo1_idx` (`Processo` ASC) VISIBLE,
  CONSTRAINT `fk_Processo_has_Processo_Processo1`
    FOREIGN KEY (`Processo`)
    REFERENCES ``.`Processo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Processo_has_Processo_Processo2`
    FOREIGN KEY (`processoVinculado`)
    REFERENCES ``.`Processo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
