-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ToyTechBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ToyTechBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ToyTechBD` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `ToyTechBD` ;

-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `cliente_cnpj` VARCHAR(14) NOT NULL,
  `cliente_nome` VARCHAR(60) NOT NULL,
  `cliente_tel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_clientes`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fornecedor` (
  `id_Fornecedor` INT NOT NULL AUTO_INCREMENT,
  `cnpj_fornecedor` VARCHAR(14) NOT NULL,
  `nome_fornecedor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_Fornecedor`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Mapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mapa` (
  `id_Mapa` INT NOT NULL AUTO_INCREMENT,
  `nome_mapa` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Mapa`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtos` (
  `id_Produtos` INT NOT NULL AUTO_INCREMENT,
  `nome_produtos` VARCHAR(100) NOT NULL,
  `preco_produtos` DECIMAL(10,2) NOT NULL,
  `quantidade_produtos` INT NOT NULL,
  `categoria_produtos` VARCHAR(50) NOT NULL,
  `descricao_produto` VARCHAR(100) NOT NULL,
  `fornecedor_id` INT NOT NULL,
  `localização_id` INT NOT NULL,
  PRIMARY KEY (`id_Produtos`),
  CONSTRAINT `fk_id_Fornecedor`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `Fornecedor` (`id_Fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_Mapa`
    FOREIGN KEY (`localização_id`)
    REFERENCES `Mapa` (`id_Mapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS`Notificacao` (
  `id_Notificacao` INT NOT NULL AUTO_INCREMENT,
  `notificacao_data` DATE NOT NULL,
  `notificacao_sobre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_Notificacao`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos` (
  `id_Pedidos` INT NOT NULL AUTO_INCREMENT,
  `Valor_Pedidos` DECIMAL(10,2) NOT NULL,
  `Quantidade_Pedidos` INT NOT NULL,
  `Data_pedidos` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_produtos` INT NOT NULL,
  `Notificacao_id` INT NOT NULL,
  PRIMARY KEY (`id_Pedidos`),
  CONSTRAINT `id_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_produtos`
    FOREIGN KEY (`id_produtos`)
    REFERENCES `Produtos` (`id_Produtos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Notificacao1`
    FOREIGN KEY (`Notificacao_id`)
    REFERENCES `Notificacao` (`id_Notificacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funcionario` (
  `id_Funcionario` INT NOT NULL AUTO_INCREMENT,
  `senha_funcionario` VARCHAR(8) NOT NULL,
  `email_funcionario` VARCHAR(30) NOT NULL,
  `cargo_funcionario` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_Funcionario`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movimentacao` (
  `movimentacao_id` INT NOT NULL AUTO_INCREMENT,
  `enum_movimentacao` INT NOT NULL,
  `nome_movimentacao` VARCHAR(30) NOT NULL,
  `id_produtos` INT NOT NULL,
  `funcionario_id` INT NOT NULL,
  PRIMARY KEY (`movimentacao_id`),
  CONSTRAINT `id_produtos`
    FOREIGN KEY (`id_produtos`)
    REFERENCES `Produtos` (`id_Produtos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `funcionario_id`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Empilhadeira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Empilhadeira` (
  `id_Empilhadeira` INT NOT NULL AUTO_INCREMENT,
  `nome_Empilhadeira` VARCHAR(100) NOT NULL,
  `id_funcionario` INT NOT NULL,
  PRIMARY KEY (`id_Empilhadeira`),
  CONSTRAINT `id_funcionarios`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
