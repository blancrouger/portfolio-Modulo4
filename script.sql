-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio_2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio_2` DEFAULT CHARACTER SET utf8 ;
USE `portfolio_2` ;

-- -----------------------------------------------------
-- Table `portfolio_2`.`Foto_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Foto_usuario` (
  `idFoto` INT NOT NULL AUTO_INCREMENT,
  `url_foto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFoto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NULL,
  `e-mail` VARCHAR(45) NULL,
  `telefono` VARCHAR(35) NULL,
  `fecha_nacimiento` DATE NULL,
  `acerca_de` VARCHAR(300) NULL,
  `Foto_usuario_idFoto` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `Foto_usuario_idFoto`),
  INDEX `fk_Usuario_Foto_usuario1_idx` (`Foto_usuario_idFoto` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Foto_usuario1`
    FOREIGN KEY (`Foto_usuario_idFoto`)
    REFERENCES `portfolio_2`.`Foto_usuario` (`idFoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Proyecto` (
  `idProyecto` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Usuario-proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Usuario-proyecto` (
  `Usuario_idUsuario` INT NOT NULL,
  `Proyecto_idProyecto` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Proyecto_idProyecto`),
  INDEX `fk_Usuario_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyecto` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Proyecto_Usuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Proyecto_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyecto`)
    REFERENCES `portfolio_2`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`ImagenEducacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`ImagenEducacion` (
  `idImagenEducacion` INT NOT NULL AUTO_INCREMENT,
  `url_imagen_edu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idImagenEducacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Educacion` (
  `idEducacion` INT NOT NULL AUTO_INCREMENT,
  `nombre_establecimiento` VARCHAR(45) NOT NULL,
  `nivel_educacion` VARCHAR(45) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `ImagenEducacion_idImagenEducacion` INT NOT NULL,
  PRIMARY KEY (`idEducacion`, `ImagenEducacion_idImagenEducacion`),
  INDEX `fk_Educacion_ImagenEducacion1_idx` (`ImagenEducacion_idImagenEducacion` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_ImagenEducacion1`
    FOREIGN KEY (`ImagenEducacion_idImagenEducacion`)
    REFERENCES `portfolio_2`.`ImagenEducacion` (`idImagenEducacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Usuario-Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Usuario-Educacion` (
  `Usuario_idUsuario` INT NOT NULL,
  `Educacion_idEducacion` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Educacion_idEducacion`),
  INDEX `fk_Usuario_has_Educacion_Educacion1_idx` (`Educacion_idEducacion` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Educacion_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Educacion_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Educacion_Educacion1`
    FOREIGN KEY (`Educacion_idEducacion`)
    REFERENCES `portfolio_2`.`Educacion` (`idEducacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Foto_Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Foto_Experiencia` (
  `idFoto_Experiencia` INT NOT NULL AUTO_INCREMENT,
  `url_imagen_exp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFoto_Experiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Experiencia` (
  `idExperiencia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `anio_desde` DATE NULL,
  `anio_hasta` DATE NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `Foto_Experiencia_idFoto_Experiencia` INT NOT NULL,
  PRIMARY KEY (`idExperiencia`, `Foto_Experiencia_idFoto_Experiencia`),
  INDEX `fk_Experiencia_Foto_Experiencia1_idx` (`Foto_Experiencia_idFoto_Experiencia` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Foto_Experiencia1`
    FOREIGN KEY (`Foto_Experiencia_idFoto_Experiencia`)
    REFERENCES `portfolio_2`.`Foto_Experiencia` (`idFoto_Experiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Usuario-Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Usuario-Experiencia` (
  `Usuario_idUsuario` INT NOT NULL,
  `Experiencia_idExperiencia` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Experiencia_idExperiencia`),
  INDEX `fk_Usuario_has_Experiencia_Experiencia1_idx` (`Experiencia_idExperiencia` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Experiencia_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Experiencia_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Experiencia_Experiencia1`
    FOREIGN KEY (`Experiencia_idExperiencia`)
    REFERENCES `portfolio_2`.`Experiencia` (`idExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`skill` (
  `idskill` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nivel` INT NOT NULL,
  PRIMARY KEY (`idskill`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`skill-usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`skill-usuario` (
  `skill_idskill` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`skill_idskill`, `Usuario_idUsuario`),
  INDEX `fk_skill_has_Usuario_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_skill_has_Usuario_skill1_idx` (`skill_idskill` ASC) VISIBLE,
  CONSTRAINT `fk_skill_has_Usuario_skill1`
    FOREIGN KEY (`skill_idskill`)
    REFERENCES `portfolio_2`.`skill` (`idskill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skill_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Profesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Profesion` (
  `idProfesion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfesion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_2`.`Profesion-Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_2`.`Profesion-Usuario` (
  `Usuario_idUsuario` INT NOT NULL,
  `Profesion_idProfesion` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Profesion_idProfesion`),
  INDEX `fk_Usuario_has_Profesion_Profesion1_idx` (`Profesion_idProfesion` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Profesion_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Profesion_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio_2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Profesion_Profesion1`
    FOREIGN KEY (`Profesion_idProfesion`)
    REFERENCES `portfolio_2`.`Profesion` (`idProfesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
