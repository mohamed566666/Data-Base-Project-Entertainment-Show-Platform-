-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Entiertenment_Show
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Entiertenment_Show` ;

-- -----------------------------------------------------
-- Schema Entiertenment_Show
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Entiertenment_Show` DEFAULT CHARACTER SET utf8 ;
USE `Entiertenment_Show` ;

-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`production_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`production_company` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`production_company` (
  `companyID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(45) NULL,
  `founded_year` INT NULL,
  PRIMARY KEY (`companyID`),
  UNIQUE INDEX `companyID_UNIQUE` (`companyID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Person` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Person` (
  `SSN` VARCHAR(10) NOT NULL,
  `Fname` VARCHAR(25) NULL,
  `Lname` VARCHAR(15) NULL,
  `Gender` VARCHAR(10) NULL,
  `Bdate` DATE NULL,
  `Nationality` VARCHAR(25) NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE INDEX `SSN_UNIQUE` (`SSN` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Director` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Director` (
  `Person_SSN` VARCHAR(10) NOT NULL,
  INDEX `fk_Director_Person1_idx` (`Person_SSN` ASC),
  PRIMARY KEY (`Person_SSN`),
  CONSTRAINT `fk_Director_Person1`
    FOREIGN KEY (`Person_SSN`)
    REFERENCES `Entiertenment_Show`.`Person` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Entertainment_show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Entertainment_show` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Entertainment_show` (
  `idshow` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(55) NULL,
  `year` INT NULL,
  `release date` DATE NULL,
  `country` VARCHAR(45) NULL,
  `language` VARCHAR(20) NULL,
  `Duration` INT NULL,
  `production budget` DOUBLE NULL,
  `Age_restricted(+)` INT NULL,
  `type` VARCHAR(20) NULL,
  `production company_companyID` VARCHAR(10) NOT NULL,
  `Director_Person_SSN` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idshow`),
  UNIQUE INDEX `idmovie_UNIQUE` (`idshow` ASC),
  INDEX `fk_movie_production company1_idx` (`production company_companyID` ASC),
  INDEX `fk_movie_Director1_idx` (`Director_Person_SSN` ASC),
  CONSTRAINT `fk_movie_production company1`
    FOREIGN KEY (`production company_companyID`)
    REFERENCES `Entiertenment_Show`.`production_company` (`companyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_Director1`
    FOREIGN KEY (`Director_Person_SSN`)
    REFERENCES `Entiertenment_Show`.`Director` (`Person_SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`viewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`viewer` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`viewer` (
  `idviewer` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(25) NULL,
  `B_date` DATE NULL,
  PRIMARY KEY (`idviewer`),
  UNIQUE INDEX `idviewer_UNIQUE` (`idviewer` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`profile` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`profile` (
  `Nick_Name` VARCHAR(20) NOT NULL,
  `e-mail` VARCHAR(30) NULL,
  `password` INT NULL,
  `subscription-type` VARCHAR(25) NULL,
  `method of payment` VARCHAR(25) NULL,
  `viewer_idviewer` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Nick_Name`),
  UNIQUE INDEX `Nick_Name_UNIQUE` (`Nick_Name` ASC),
  INDEX `fk_profile_viewer1_idx` (`viewer_idviewer` ASC),
  CONSTRAINT `fk_profile_viewer1`
    FOREIGN KEY (`viewer_idviewer`)
    REFERENCES `Entiertenment_Show`.`viewer` (`idviewer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Actor` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Actor` (
  `Person_SSN` VARCHAR(10) NOT NULL,
  INDEX `fk_Director_Person1_idx` (`Person_SSN` ASC),
  PRIMARY KEY (`Person_SSN`),
  CONSTRAINT `fk_Director_Person10`
    FOREIGN KEY (`Person_SSN`)
    REFERENCES `Entiertenment_Show`.`Person` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Announcer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Announcer` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Announcer` (
  `Person_SSN` VARCHAR(10) NOT NULL,
  INDEX `fk_Director_Person1_idx` (`Person_SSN` ASC),
  PRIMARY KEY (`Person_SSN`),
  CONSTRAINT `fk_Director_Person11`
    FOREIGN KEY (`Person_SSN`)
    REFERENCES `Entiertenment_Show`.`Person` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Movie` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Movie` (
  `Entertainment_show_idmovie` VARCHAR(10) NOT NULL,
  INDEX `fk_table1_Entertainment_show1_idx` (`Entertainment_show_idmovie` ASC),
  PRIMARY KEY (`Entertainment_show_idmovie`),
  CONSTRAINT `fk_table1_Entertainment_show1`
    FOREIGN KEY (`Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`Entertainment_show` (`idshow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Seires`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Seires` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Seires` (
  `Entertainment_show_idmovie` VARCHAR(10) NOT NULL,
  `seasons` INT NULL,
  `episodes` INT NULL,
  INDEX `fk_table1_Entertainment_show1_idx` (`Entertainment_show_idmovie` ASC),
  PRIMARY KEY (`Entertainment_show_idmovie`),
  CONSTRAINT `fk_table1_Entertainment_show10`
    FOREIGN KEY (`Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`Entertainment_show` (`idshow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`TV_show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`TV_show` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`TV_show` (
  `Entertainment_show_idmovie` VARCHAR(10) NOT NULL,
  `seasons` INT NULL,
  `episodes` INT NULL,
  INDEX `fk_table1_Entertainment_show1_idx` (`Entertainment_show_idmovie` ASC),
  PRIMARY KEY (`Entertainment_show_idmovie`),
  CONSTRAINT `fk_table1_Entertainment_show100`
    FOREIGN KEY (`Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`Entertainment_show` (`idshow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Acts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Acts` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Acts` (
  `Actor_Person_SSN` VARCHAR(10) NOT NULL,
  `Movie_Entertainment_show_idmovie` VARCHAR(10) NULL,
  `Seires_Entertainment_show_idmovie` VARCHAR(10) NULL,
  PRIMARY KEY (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`),
  INDEX `fk_Actor_has_Movie_Movie1_idx` (`Movie_Entertainment_show_idmovie` ASC),
  INDEX `fk_Actor_has_Movie_Actor1_idx` (`Actor_Person_SSN` ASC),
  INDEX `fk_Acts_Seires1_idx` (`Seires_Entertainment_show_idmovie` ASC),
  CONSTRAINT `fk_Actor_has_Movie_Actor1`
    FOREIGN KEY (`Actor_Person_SSN`)
    REFERENCES `Entiertenment_Show`.`Actor` (`Person_SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actor_has_Movie_Movie1`
    FOREIGN KEY (`Movie_Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Acts_Seires1`
    FOREIGN KEY (`Seires_Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`Seires` (`Entertainment_show_idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`present`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`present` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`present` (
  `Announcer_Person_SSN` VARCHAR(10) NOT NULL,
  `TV_show_Entertainment_show_idmovie` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`),
  INDEX `fk_Announcer_has_TV_show_TV_show1_idx` (`TV_show_Entertainment_show_idmovie` ASC),
  INDEX `fk_Announcer_has_TV_show_Announcer1_idx` (`Announcer_Person_SSN` ASC),
  CONSTRAINT `fk_Announcer_has_TV_show_Announcer1`
    FOREIGN KEY (`Announcer_Person_SSN`)
    REFERENCES `Entiertenment_Show`.`Announcer` (`Person_SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Announcer_has_TV_show_TV_show1`
    FOREIGN KEY (`TV_show_Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`TV_show` (`Entertainment_show_idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Watch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Watch` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Watch` (
  `Entertainment_show_idmovie` VARCHAR(10) NOT NULL,
  `viewer_idviewer` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Entertainment_show_idmovie`, `viewer_idviewer`),
  INDEX `fk_Entertainment_show_has_viewer_viewer1_idx` (`viewer_idviewer` ASC),
  INDEX `fk_Entertainment_show_has_viewer_Entertainment_show1_idx` (`Entertainment_show_idmovie` ASC),
  CONSTRAINT `fk_Entertainment_show_has_viewer_Entertainment_show1`
    FOREIGN KEY (`Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`Entertainment_show` (`idshow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entertainment_show_has_viewer_viewer1`
    FOREIGN KEY (`viewer_idviewer`)
    REFERENCES `Entiertenment_Show`.`viewer` (`idviewer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entiertenment_Show`.`Rate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entiertenment_Show`.`Rate` ;

CREATE TABLE IF NOT EXISTS `Entiertenment_Show`.`Rate` (
  `Entertainment_show_idmovie` VARCHAR(10) NOT NULL,
  `viewer_idviewer` VARCHAR(10) NOT NULL,
  `Rating` DOUBLE NULL,
  PRIMARY KEY (`Entertainment_show_idmovie`, `viewer_idviewer`),
  INDEX `fk_Entertainment_show_has_viewer1_viewer1_idx` (`viewer_idviewer` ASC),
  INDEX `fk_Entertainment_show_has_viewer1_Entertainment_show1_idx` (`Entertainment_show_idmovie` ASC),
  CONSTRAINT `fk_Entertainment_show_has_viewer1_Entertainment_show1`
    FOREIGN KEY (`Entertainment_show_idmovie`)
    REFERENCES `Entiertenment_Show`.`Entertainment_show` (`idshow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entertainment_show_has_viewer1_viewer1`
    FOREIGN KEY (`viewer_idviewer`)
    REFERENCES `Entiertenment_Show`.`viewer` (`idviewer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`production_company`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('MA123', 'Marvel', 1998);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('D111', 'Disney', 1923);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('WA321', 'Warner Bros', 1923);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('H432', 'HBO', 1972);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('U225', 'Universal Picture', 1912);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('S777', 'Sony Entertainment', 1987);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('F098', 'Fox', 1994);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('C442', 'CW', 2006);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('N476', 'Nordisk Film', 1906);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('S843', 'Synergy', 2003);
INSERT INTO `Entiertenment_Show`.`production_company` (`companyID`, `Name`, `founded_year`) VALUES ('M6969', 'Brothers', 2010);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Person`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('10', 'Christian', 'Bale', 'Male', '1974-10-20', 'American');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('11', 'Cilian', 'Murphy', 'Male', '1960-12-23', 'Irish');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('12', 'Tom', 'Hiddelston', 'Male', '1971-11-03', 'British');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('13', 'Danielle', 'Rose', 'Female', '2000-10-06', 'American');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('14', 'Scarlet', 'Johnson', 'Female', '1980-11-12', 'British');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('15', 'Anne', 'Hathway', 'Female', '1982-11-12', 'Candian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('16', 'Chris', 'Evans', 'Male', '1967-10-07', 'British');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('17', 'Anthony', 'Gonzalez', 'Male', '1989-03-11', 'Barazilian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('18', 'Robert', 'Downey', 'Male', '1950-02-12', 'American');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('19', 'Ronald', 'Muller', 'Male', '1980-10-10', 'Danish');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('20', 'Emilia', 'Clarck', 'Female', '1986-10-23', 'American');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('21', 'Jason', 'Moama', 'Male', '1970-10-10', 'Spanish');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('22', 'Joseph', 'Morgen', 'Male', '1977-02-11', 'British');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('23', 'Christopher', 'Nolan', 'Male', '1944-12-10', 'American');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('24', 'Amir', 'Karara', 'Male', '1977-02-01', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('25', 'Emma', 'Stone', 'Female', '1987-12-01', 'Frensh');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('26', 'Asmaa', 'Galal', 'Female', '1997-07-06', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('27', 'Ana', 'De Armas', 'Female', '1990-03-03', 'Cuban');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('28', 'Kareem', 'Mohamed', 'Male', '2003-10-06', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('29', 'Mohamed', 'Gamal', 'Male', '2004-06-07', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('30', 'Eyad', 'Mostafa', 'Male', '2004-09-12', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('31', 'Ismail', 'Salah', 'Male', '2004-11-09', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('32', 'Mustafa', 'Ihab', 'Male', '2004-07-17', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('33', 'Abobakr', 'Mohamed', 'Male', '2004-08-01', 'Indian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('34', 'Margot', 'Robbie', 'Female', '1990-06-02', 'Australian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('35', 'Beter', 'Meme', 'Male', '1968-09-12', 'Egyptian');
INSERT INTO `Entiertenment_Show`.`Person` (`SSN`, `Fname`, `Lname`, `Gender`, `Bdate`, `Nationality`) VALUES ('36', 'Robert', 'Lee', 'Male', '198-05-15', 'Chinesee');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Director`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('23');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('22');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('19');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('13');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('21');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('35');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('17');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('18');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('33');
INSERT INTO `Entiertenment_Show`.`Director` (`Person_SSN`) VALUES ('36');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Entertainment_show`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('M1111', 'Dark Knight', 2008, '2008-07-14', 'USA', 'English', 153, 185000000, 13, 'Action', 'WA321', '13');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('M2222', 'Interstellar', 2014, '2014-11-07', 'UK', 'English', 169, 165000000, 13, 'Fantasy', 'WA321', '23');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('M3333', 'Avengers', 2012, '2012-04-14', 'USA', 'English', 143, 220000000, 12, 'Action', 'MA123', '22');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('M4444', 'Oppenheimer', 2023, '2023-07-21', 'USA', 'English', 180, 100000000, 17, 'Biography', 'U225', '23');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('M5555', 'Coco', 2017, '2017-11-22', 'France', 'Frensh', 105, 175000000, 8, 'Anime', 'D111', '17');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('M6666', 'Land of mine', 2015, '2015-12-03', 'Denmark', 'Danish', 100, 35000000, 16, 'Action', 'N476', '19');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('M7777', 'Me Before You', 2016, '2016-06-03', 'UK', 'British', 110, 34561002, 17, 'Romantic', 'F098', '13');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('S1111', 'Game Of Thrones', 2011, '2011-04-11', 'USa', 'English', 60, 65000000, 20, 'Drama', 'H432', '19');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('S2222', 'The Originals', 2013, '2013-10-03', 'UK', 'British', 43, 15000000, 16, 'Drama', 'C442', '22');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('S3333', 'Breaking Bad', 2008, '2008-01-20', 'Italia', 'Itialian', 50, 14500000, 17, 'Drama', 'S777', '18');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('S4444', 'Loki', 2021, '2021-07-09', 'Germany', 'Deutsch', 45, 13200000, 16, 'Fantasy', 'MA123', '18');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('S5555', 'Elekhtiar', 2020, '2020-04-20', 'Egypt', 'Arabic', 33, 80000000, 12, 'Biography', 'S843', '35');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('S6666', 'Vampire Diaries', 2009, '2009-09-09', 'USA', 'English', 53, 7650000, 18, 'Romantic', 'H432', '17');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('T1111', 'Tonight\'s Show', 2019, '2019-10-10', 'Saudi Arabia', 'Arabic', 29, 1200040, 10, 'Comedy', 'M6969', '33');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('T2222', 'Massaao', 2023, '2023-07-10', 'Egypt', 'Arabic', 40, 600050, 6, 'Sport', 'M6969', '35');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('T3333', 'Rick and Morty', 2013, '2013-11-11', 'Spain', 'Spanish', 55, 1235000, 13, 'Anime', 'WA321', '23');
INSERT INTO `Entiertenment_Show`.`Entertainment_show` (`idshow`, `Name`, `year`, `release date`, `country`, `language`, `Duration`, `production budget`, `Age_restricted(+)`, `type`, `production company_companyID`, `Director_Person_SSN`) VALUES ('T4444', 'Schema Squad', 2020, '2020-09-11', 'Egypt', 'Arabic', 36, 30000, 8, 'Scientific', 'M6969', '33');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`viewer`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V123', 'Kareem', '2003-10-06');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V321', 'Nada', '2005-01-02');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V111', 'Fadel', '2004-07-16');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V222', 'Zizo', '2002-10-10');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V999', 'Mustafa', '2004-07-17');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V998', 'Salma', '2004-10-06');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V997', 'Hayat', '2016-09-09');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V010', 'Eyad', '2004-09-12');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V376', 'James', '1992-09-12');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V442', 'John Snow', '1988-03-16');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V243', 'Mohamed', '1999-11-21');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V100', 'Dr Wael', '1978-02-09');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V768', 'Hager', '2000-11-12');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V778', 'Alaa', '1999-08-04');
INSERT INTO `Entiertenment_Show`.`viewer` (`idviewer`, `Name`, `B_date`) VALUES ('V050', 'Mayada', '2018-09-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Ka123', 'k123@gmail.com', 123456, 'Monthly', 'Visa', 'V123');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Na321', 'n321@yahoo.com', 33456, 'Yearly', 'Fawry', 'V321');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Fa111', 'f111@gmail.com', 112099, 'Weekly', 'Vfcash', 'V111');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Zi22', 'z22@hotmail.com', 44921, 'Monthly', 'Fawry', 'V222');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Mu9', 'm999@gmail.com', 209910, 'Yearly', 'Vfcash', 'V999');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Sa9', 's998@gmail.com', 209911, 'Yearly', 'Visa', 'V998');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Hy9', 'h99@yahoo.com', 209912, 'Weekly', 'Visa', 'V997');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Ey10', 'ey1@hotmail.com', 112221, 'Monthly', 'Fawry', 'V010');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Ja3', 'ja73@gmail.com', 44457, 'Weekly', 'Fawry', 'V376');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('JS4', 'js2@hotmail.com', 49002, 'Monthly', 'Vfcash', 'V442');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('M32', 'm21@yahoo.com', 77791, 'Yearly', 'Visa', 'V243');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('DRW1', 'wa12@gmail.com', 10011, 'Weekly', 'Visa', 'V100');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Hg8', 'hg7@hotmail.com', 334433, 'Weekly', 'Fawry', 'V768');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('Al7', 'al77@gmail.com', 888990, 'Monthly', 'Vfcash', 'V778');
INSERT INTO `Entiertenment_Show`.`profile` (`Nick_Name`, `e-mail`, `password`, `subscription-type`, `method of payment`, `viewer_idviewer`) VALUES ('MY50', 'myd2@yahoo.com', 12275, 'Yearly', 'Fawry', 'V050');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Actor`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('10');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('11');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('12');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('16');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('14');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('15');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('18');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('20');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('24');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('25');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('26');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('27');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('34');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('13');
INSERT INTO `Entiertenment_Show`.`Actor` (`Person_SSN`) VALUES ('21');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Announcer`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('28');
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('30');
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('29');
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('32');
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('31');
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('34');
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('33');
INSERT INTO `Entiertenment_Show`.`Announcer` (`Person_SSN`) VALUES ('26');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Movie`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`) VALUES ('M1111');
INSERT INTO `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`) VALUES ('M2222');
INSERT INTO `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`) VALUES ('M3333');
INSERT INTO `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`) VALUES ('M4444');
INSERT INTO `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`) VALUES ('M5555');
INSERT INTO `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`) VALUES ('M6666');
INSERT INTO `Entiertenment_Show`.`Movie` (`Entertainment_show_idmovie`) VALUES ('M7777');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Seires`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Seires` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('S1111', 8, 87);
INSERT INTO `Entiertenment_Show`.`Seires` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('S2222', 5, 50);
INSERT INTO `Entiertenment_Show`.`Seires` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('S3333', 7, 72);
INSERT INTO `Entiertenment_Show`.`Seires` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('S4444', 8, 79);
INSERT INTO `Entiertenment_Show`.`Seires` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('S5555', 3, 32);
INSERT INTO `Entiertenment_Show`.`Seires` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('S6666', 5, 30);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`TV_show`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`TV_show` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('T1111', 4, 40);
INSERT INTO `Entiertenment_Show`.`TV_show` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('T2222', 5, 52);
INSERT INTO `Entiertenment_Show`.`TV_show` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('T3333', 1, 20);
INSERT INTO `Entiertenment_Show`.`TV_show` (`Entertainment_show_idmovie`, `seasons`, `episodes`) VALUES ('T4444', 2, 40);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Acts`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('10', 'M1111', 'S2222');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('11', 'M4444', 'S4444');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('11', 'M1111', NULL);
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('12', 'M3333', 'S2222');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('14', 'M3333', 'S6666');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('15', 'M2222', NULL);
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('16', 'M5555', 'S4444');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('18', 'M3333', NULL);
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('20', 'M7777', 'S1111');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('21', 'M6666', 'S6666');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('24', 'M1111', 'S5555');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('25', 'M4444', 'S3333');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('26', 'M2222', 'S5555');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('27', 'M6666', 'S1111');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('34', 'M1111', 'S6666');
INSERT INTO `Entiertenment_Show`.`Acts` (`Actor_Person_SSN`, `Movie_Entertainment_show_idmovie`, `Seires_Entertainment_show_idmovie`) VALUES ('34', 'M7777', 'S3333');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`present`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('26', 'T1111');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('32', 'T1111');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('28', 'T1111');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('30', 'T2222');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('31', 'T2222');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('29', 'T2222');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('28', 'T2222');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('32', 'T2222');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('30', 'T3333');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('31', 'T3333');
INSERT INTO `Entiertenment_Show`.`present` (`Announcer_Person_SSN`, `TV_show_Entertainment_show_idmovie`) VALUES ('29', 'T4444');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Watch`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M1111', 'V100');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M1111', 'V123');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M2222', 'V997');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('T2222', 'V997');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S1111', 'V999');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M4444', 'V999');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('T3333', 'V050');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S6666', 'V010');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S5555', 'V010');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M7777', 'V222');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M3333', 'V111');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M3333', 'V243');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S1111', 'V998');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S1111', 'V442');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S6666', 'V050');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S5555', 'V321');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S4444', 'V778');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S3333', 'V376');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S2222', 'V222');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('S1111', 'V768');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M7777', 'V999');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M6666', 'V997');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M5555', 'V010');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M4444', 'V123');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M3333', 'V321');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M2222', 'V100');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('M1111', 'V442');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('T1111', 'V111');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('T2222', 'V050');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('T3333', 'V100');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('T4444', 'V222');
INSERT INTO `Entiertenment_Show`.`Watch` (`Entertainment_show_idmovie`, `viewer_idviewer`) VALUES ('T222', 'V243');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Entiertenment_Show`.`Rate`
-- -----------------------------------------------------
START TRANSACTION;
USE `Entiertenment_Show`;
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M1111', 'V222', 7);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M1111', 'V123', 9);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M2222', 'V999', 10);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M7777', 'V998', 7);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('S6666', 'V321', 5);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('S1111', 'V999', 9);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('S1111', 'V222', 10);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('S1111', 'V111', 7);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M2222', 'V998', 10);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M2222', 'V243', 9);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M2222', 'V778', 8);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M5555', 'V100', 10);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('T2222', 'V050', 10);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('T2222', 'V768', 8);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('T2222', 'V010', 8);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('T1111', 'V123', 4);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('T3333', 'V768', 9);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M4444', 'V442', 2);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('S5555', 'V997', 6);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('S5555', 'V010', 5);
INSERT INTO `Entiertenment_Show`.`Rate` (`Entertainment_show_idmovie`, `viewer_idviewer`, `Rating`) VALUES ('M3333', 'V111', 4);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
