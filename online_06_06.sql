



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'seniorok'
-- A seniorok alapadatait tartalmazó tábla.
-- ---

DROP TABLE IF EXISTS `seniorok`;
    
CREATE TABLE `seniorok` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `teljes_nev` VARCHAR(100) NULL DEFAULT NULL,
  `becenev` VARCHAR(100) NULL DEFAULT NULL,
  `szuletesnap` DATE NULL DEFAULT NULL,
  `diakigazolvany_szam` VARCHAR(12) NULL DEFAULT NULL,
  `hivatalos_lakcim_elerhetoseg_id` INT NULL DEFAULT NULL,
  `fo_email_elerhetoseg_id` INT NULL DEFAULT NULL,
  `fo_telefon_elerhetoseg_id` INT NULL DEFAULT NULL,
  `polomeret` VARCHAR(20) NULL DEFAULT NULL,
  `infok_aktualisak` DATE NOT NULL DEFAULT 'NULL',
  `egyeb_leiras` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
KEY (),
KEY ()
) COMMENT 'A seniorok alapadatait tartalmazó tábla.';

-- ---
-- Table 'gardak'
-- A gárdák táblája.
-- ---

DROP TABLE IF EXISTS `gardak`;
    
CREATE TABLE `gardak` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `varur_senior_pozicio_id` INT NULL DEFAULT NULL,
  `nev` VARCHAR(50) NULL DEFAULT NULL,
  `szin` VARCHAR(50) NULL DEFAULT NULL,
  `leiras` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'A gárdák táblája.';

-- ---
-- Table 'senior_elerhetosegek'
-- A seniorok különböző elérhetőségeit tároló tábla.
-- ---

DROP TABLE IF EXISTS `senior_elerhetosegek`;
    
CREATE TABLE `senior_elerhetosegek` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `senior_id` INT NOT NULL DEFAULT NULL,
  `elerhetoseg` VARCHAR(200) NULL DEFAULT NULL,
  `tipus` ENUM('szoba','cim','email','tel','www','egyeb') NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'A seniorok különböző elérhetőségeit tároló tábla.';

-- ---
-- Table 'poziciok'
-- 
-- ---

DROP TABLE IF EXISTS `poziciok`;
    
CREATE TABLE `poziciok` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `nev` VARCHAR(50) NULL DEFAULT NULL,
  `leiras` MEDIUMTEXT NULL DEFAULT NULL,
  `esemeny_id` INT NULL DEFAULT NULL,
  `kategoria_id` INT NULL DEFAULT NULL,
  `lehet_ra_jelentkezni` bit NULL DEFAULT NULL,
  `esemeny_fonoki_poszt` bit NULL DEFAULT NULL,
  `kp_szorzo` DECIMAL(4,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'senior_poziciok'
-- 
-- ---

DROP TABLE IF EXISTS `senior_poziciok`;
    
CREATE TABLE `senior_poziciok` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `senior_id` INT NOT NULL DEFAULT NULL,
  `pozicio_id` INT NOT NULL DEFAULT NULL,
  `datum_mikortol` DATE NULL DEFAULT NULL,
  `datum_meddig` DATE NULL DEFAULT NULL,
  `kapcsolodo_esemeny_id` INT NULL DEFAULT NULL,
  `kapcsolodo_senior_id` INT NULL DEFAULT NULL,
  `kapcsolodo_garda_id` INT NULL DEFAULT NULL,
  `egyeb_leiras` MEDIUMTEXT NULL DEFAULT NULL,
  `jelentkezes_jovahagyva` bit NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'esemenyek'
-- 
-- ---

DROP TABLE IF EXISTS `esemenyek`;
    
CREATE TABLE `esemenyek` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `fo_esemeny_id` TINYINT NULL DEFAULT NULL,
  `nev` VARCHAR(100) NULL DEFAULT NULL,
  `leiras` MEDIUMTEXT NULL DEFAULT NULL,
  `esemeny_kategoria_id` TINYINT NULL DEFAULT NULL,
  `datum_mikortol` DATE NULL DEFAULT NULL,
  `datum_meddig` DATE NULL DEFAULT NULL,
  `nyilvanos_weboldal` VARCHAR(200) NULL DEFAULT NULL,
  `helyszin` VARCHAR(200) NULL DEFAULT NULL,
  `kp_pontertek` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'senior_garda_infok'
-- A seniorok gárdával kapcsolatos információi.
-- ---

DROP TABLE IF EXISTS `senior_garda_infok`;
    
CREATE TABLE `senior_garda_infok` (
  `senior_id` INT NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `garda_id` INT NULL DEFAULT NULL,
  `rang_senior_pozicio_id` INT NULL DEFAULT NULL,
  `aktiv` bit NULL DEFAULT NULL,
  `oregtag` bit NULL DEFAULT NULL,
  PRIMARY KEY (`senior_id`)
) COMMENT 'A seniorok gárdával kapcsolatos információi.';

-- ---
-- Table 'pozicio_kategoriak'
-- 
-- ---

DROP TABLE IF EXISTS `pozicio_kategoriak`;
    
CREATE TABLE `pozicio_kategoriak` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `nev` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'esemeny_kategoriak'
-- 
-- ---

DROP TABLE IF EXISTS `esemeny_kategoriak`;
    
CREATE TABLE `esemeny_kategoriak` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `nev` VARCHAR(50) NULL DEFAULT NULL,
  `leiras` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'kp_idoszakok'
-- 
-- ---

DROP TABLE IF EXISTS `kp_idoszakok`;
    
CREATE TABLE `kp_idoszakok` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `idoszak_nev` VARCHAR(100) NULL DEFAULT NULL,
  `idoszak_kezdet` DATE NULL DEFAULT NULL,
  `idoszak_vege` DATE NULL DEFAULT NULL,
  `megjegyzesek` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'kp_pontok'
-- 
-- ---

DROP TABLE IF EXISTS `kp_pontok`;
    
CREATE TABLE `kp_pontok` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `senior_id` INT NULL DEFAULT NULL,
  `kapcsolodo_pozicio_id` INT NULL DEFAULT NULL,
  `kapcsolodo_esemeny_id` INT NULL DEFAULT NULL,
  `kp_idoszak_id` INT NULL DEFAULT NULL,
  `kp_pont` TINYINT NULL DEFAULT NULL,
  `megjegyzes` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'pozicio_mezok'
-- 
-- ---

DROP TABLE IF EXISTS `pozicio_mezok`;
    
CREATE TABLE `pozicio_mezok` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `pozicio_id` INT NULL DEFAULT NULL,
  `nev` VARCHAR(200) NULL DEFAULT NULL,
  `tipus` ENUM('szoveg','szam','senior','esemeny','lista','pipa') NULL DEFAULT NULL,
  `minta` VARCHAR(200) NULL DEFAULT NULL,
  `nyilvanossag` ENUM('esemeny_szervezo','senior','nyilvanos') NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'pozicio_mezo_ertekek'
-- 
-- ---

DROP TABLE IF EXISTS `pozicio_mezo_ertekek`;
    
CREATE TABLE `pozicio_mezo_ertekek` (
  `senior_pozicio_id` INT NOT NULL DEFAULT NULL,
  `pozicio_mezo_id` INT NOT NULL DEFAULT NULL,
  `ertek_int` INT NULL DEFAULT NULL,
  `ertek_szoveg` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`senior_pozicio_id`, `pozicio_mezo_id`)
);

-- ---
-- Table 'rendszerbeallitasok'
-- 
-- ---

DROP TABLE IF EXISTS `rendszerbeallitasok`;
    
CREATE TABLE `rendszerbeallitasok` (
  `id` VARCHAR(100) NULL AUTO_INCREMENT DEFAULT NULL,
  `ertek_int` INT NULL DEFAULT NULL,
  `ertek_szoveg` MEDIUMTEXT NULL DEFAULT NULL,
  `megjegyzes` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'login_adatok'
-- 
-- ---

DROP TABLE IF EXISTS `login_adatok`;
    
CREATE TABLE `login_adatok` (
  `senior_id` INT NOT NULL DEFAULT NULL,
  `login_nev` VARCHAR(50) NULL DEFAULT NULL,
  `jelszo_hash` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`senior_id`),
  UNIQUE KEY (`login_nev`)
);

-- ---
-- Table 'egyetem_adatok'
-- 
-- ---

DROP TABLE IF EXISTS `egyetem_adatok`;
    
CREATE TABLE `egyetem_adatok` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `senior_id` INT NULL DEFAULT NULL,
  `egyetem_kar_nev` VARCHAR(10) NULL DEFAULT NULL,
  `szak_nev` VARCHAR(50) NULL DEFAULT NULL,
  `kezdes_eve` YEAR NULL DEFAULT NULL,
  `vegzes_eve` YEAR NULL DEFAULT NULL,
  `elvegezte` bit NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `seniorok` ADD FOREIGN KEY (hivatalos_lakcim_elerhetoseg_id) REFERENCES `senior_elerhetosegek` (`id`);
ALTER TABLE `seniorok` ADD FOREIGN KEY (fo_email_elerhetoseg_id) REFERENCES `senior_elerhetosegek` (`id`);
ALTER TABLE `seniorok` ADD FOREIGN KEY (fo_telefon_elerhetoseg_id) REFERENCES `senior_elerhetosegek` (`id`);
ALTER TABLE `gardak` ADD FOREIGN KEY (varur_senior_pozicio_id) REFERENCES `senior_poziciok` (`id`);
ALTER TABLE `senior_elerhetosegek` ADD FOREIGN KEY (senior_id) REFERENCES `seniorok` (`id`);
ALTER TABLE `poziciok` ADD FOREIGN KEY (esemeny_id) REFERENCES `esemenyek` (`id`);
ALTER TABLE `poziciok` ADD FOREIGN KEY (kategoria_id) REFERENCES `pozicio_kategoriak` (`id`);
ALTER TABLE `senior_poziciok` ADD FOREIGN KEY (senior_id) REFERENCES `seniorok` (`id`);
ALTER TABLE `senior_poziciok` ADD FOREIGN KEY (pozicio_id) REFERENCES `poziciok` (`id`);
ALTER TABLE `senior_poziciok` ADD FOREIGN KEY (kapcsolodo_esemeny_id) REFERENCES `esemenyek` (`id`);
ALTER TABLE `senior_poziciok` ADD FOREIGN KEY (kapcsolodo_senior_id) REFERENCES `seniorok` (`id`);
ALTER TABLE `senior_poziciok` ADD FOREIGN KEY (kapcsolodo_garda_id) REFERENCES `gardak` (`id`);
ALTER TABLE `esemenyek` ADD FOREIGN KEY (fo_esemeny_id) REFERENCES `esemenyek` (`id`);
ALTER TABLE `esemenyek` ADD FOREIGN KEY (esemeny_kategoria_id) REFERENCES `esemeny_kategoriak` (`id`);
ALTER TABLE `senior_garda_infok` ADD FOREIGN KEY (senior_id) REFERENCES `seniorok` (`id`);
ALTER TABLE `senior_garda_infok` ADD FOREIGN KEY (garda_id) REFERENCES `gardak` (`id`);
ALTER TABLE `senior_garda_infok` ADD FOREIGN KEY (rang_senior_pozicio_id) REFERENCES `senior_poziciok` (`id`);
ALTER TABLE `kp_pontok` ADD FOREIGN KEY (senior_id) REFERENCES `seniorok` (`id`);
ALTER TABLE `kp_pontok` ADD FOREIGN KEY (kapcsolodo_pozicio_id) REFERENCES `senior_poziciok` (`id`);
ALTER TABLE `kp_pontok` ADD FOREIGN KEY (kapcsolodo_esemeny_id) REFERENCES `esemenyek` (`id`);
ALTER TABLE `kp_pontok` ADD FOREIGN KEY (kp_idoszak_id) REFERENCES `kp_idoszakok` (`id`);
ALTER TABLE `pozicio_mezok` ADD FOREIGN KEY (pozicio_id) REFERENCES `poziciok` (`id`);
ALTER TABLE `pozicio_mezo_ertekek` ADD FOREIGN KEY (senior_pozicio_id) REFERENCES `senior_poziciok` (`id`);
ALTER TABLE `pozicio_mezo_ertekek` ADD FOREIGN KEY (pozicio_mezo_id) REFERENCES `pozicio_mezok` (`id`);
ALTER TABLE `login_adatok` ADD FOREIGN KEY (senior_id) REFERENCES `seniorok` (`id`);
ALTER TABLE `egyetem_adatok` ADD FOREIGN KEY (senior_id) REFERENCES `seniorok` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `seniorok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `gardak` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `senior_elerhetosegek` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `poziciok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `senior_poziciok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `esemenyek` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `senior_garda_infok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `pozicio_kategoriak` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `esemeny_kategoriak` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `kp_idoszakok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `kp_pontok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `pozicio_mezok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `pozicio_mezo_ertekek` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `rendszerbeallitasok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `login_adatok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `egyetem_adatok` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `seniorok` (`id`,`teljes_nev`,`becenev`,`szuletesnap`,`diakigazolvany_szam`,`hivatalos_lakcim_elerhetoseg_id`,`fo_email_elerhetoseg_id`,`fo_telefon_elerhetoseg_id`,`polomeret`,`infok_aktualisak`,`egyeb_leiras`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `gardak` (`id`,`varur_senior_pozicio_id`,`nev`,`szin`,`leiras`) VALUES
-- ('','','','','');
-- INSERT INTO `senior_elerhetosegek` (`id`,`senior_id`,`elerhetoseg`,`tipus`) VALUES
-- ('','','','');
-- INSERT INTO `poziciok` (`id`,`nev`,`leiras`,`esemeny_id`,`kategoria_id`,`lehet_ra_jelentkezni`,`esemeny_fonoki_poszt`,`kp_szorzo`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `senior_poziciok` (`id`,`senior_id`,`pozicio_id`,`datum_mikortol`,`datum_meddig`,`kapcsolodo_esemeny_id`,`kapcsolodo_senior_id`,`kapcsolodo_garda_id`,`egyeb_leiras`,`jelentkezes_jovahagyva`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `esemenyek` (`id`,`fo_esemeny_id`,`nev`,`leiras`,`esemeny_kategoria_id`,`datum_mikortol`,`datum_meddig`,`nyilvanos_weboldal`,`helyszin`,`kp_pontertek`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `senior_garda_infok` (`senior_id`,`garda_id`,`rang_senior_pozicio_id`,`aktiv`,`oregtag`) VALUES
-- ('','','','','');
-- INSERT INTO `pozicio_kategoriak` (`id`,`nev`) VALUES
-- ('','');
-- INSERT INTO `esemeny_kategoriak` (`id`,`nev`,`leiras`) VALUES
-- ('','','');
-- INSERT INTO `kp_idoszakok` (`id`,`idoszak_nev`,`idoszak_kezdet`,`idoszak_vege`,`megjegyzesek`) VALUES
-- ('','','','','');
-- INSERT INTO `kp_pontok` (`id`,`senior_id`,`kapcsolodo_pozicio_id`,`kapcsolodo_esemeny_id`,`kp_idoszak_id`,`kp_pont`,`megjegyzes`) VALUES
-- ('','','','','','','');
-- INSERT INTO `pozicio_mezok` (`id`,`pozicio_id`,`nev`,`tipus`,`minta`,`nyilvanossag`) VALUES
-- ('','','','','','');
-- INSERT INTO `pozicio_mezo_ertekek` (`senior_pozicio_id`,`pozicio_mezo_id`,`ertek_int`,`ertek_szoveg`) VALUES
-- ('','','','');
-- INSERT INTO `rendszerbeallitasok` (`id`,`ertek_int`,`ertek_szoveg`,`megjegyzes`) VALUES
-- ('','','','');
-- INSERT INTO `login_adatok` (`senior_id`,`login_nev`,`jelszo_hash`) VALUES
-- ('','','');
-- INSERT INTO `egyetem_adatok` (`id`,`senior_id`,`egyetem_kar_nev`,`szak_nev`,`kezdes_eve`,`vegzes_eve`,`elvegezte`) VALUES
-- ('','','','','','','');

