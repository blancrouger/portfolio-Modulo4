-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio_1` DEFAULT CHARACTER SET utf8 ;
USE `portfolio_1` ;

-- -----------------------------------------------------
-- Table `portfolio_1`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Proyecto` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Proyecto-Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Proyecto-Usuario` (
  `Proyectos_idProyectos` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`Proyectos_idProyectos`, `Usuario_idUsuario`),
  INDEX `fk_Proyectos_has_Usuario_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Proyectos_has_Usuario_Proyectos1_idx` (`Proyectos_idProyectos` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_has_Usuario_Proyectos1`
    FOREIGN KEY (`Proyectos_idProyectos`)
    REFERENCES `portfolio_1`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyectos_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_1`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Educacion` (
  `idEducacion` INT NOT NULL AUTO_INCREMENT,
  `nombre_educacion` VARCHAR(120) NULL,
  PRIMARY KEY (`idEducacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Usuario-Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Usuario-Educacion` (
  `Usuario_idUsuario` INT NOT NULL,
  `Educacion_idEducacion` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Educacion_idEducacion`),
  INDEX `fk_Usuario_has_Educacion_Educacion1_idx` (`Educacion_idEducacion` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Educacion_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Educacion_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_1`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Educacion_Educacion1`
    FOREIGN KEY (`Educacion_idEducacion`)
    REFERENCES `portfolio_1`.`Educacion` (`idEducacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Experiencia` (
  `idExperiencia` INT NOT NULL AUTO_INCREMENT,
  `nombre_experiencia` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idExperiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Usuario-Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Usuario-Experiencia` (
  `Usuario_idUsuario` INT NOT NULL,
  `Experiencia_idExperiencia` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Experiencia_idExperiencia`),
  INDEX `fk_Usuario_has_Experiencia_Experiencia1_idx` (`Experiencia_idExperiencia` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Experiencia_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Experiencia_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_1`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Experiencia_Experiencia1`
    FOREIGN KEY (`Experiencia_idExperiencia`)
    REFERENCES `portfolio_1`.`Experiencia` (`idExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Proyecto` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_1`.`Proyecto-Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_1`.`Proyecto-Usuario` (
  `Proyectos_idProyectos` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`Proyectos_idProyectos`, `Usuario_idUsuario`),
  INDEX `fk_Proyectos_has_Usuario_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Proyectos_has_Usuario_Proyectos1_idx` (`Proyectos_idProyectos` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_has_Usuario_Proyectos1`
    FOREIGN KEY (`Proyectos_idProyectos`)
    REFERENCES `portfolio_1`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyectos_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_1`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
