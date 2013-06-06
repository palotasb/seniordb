DROP TABLE IF EXISTS rendszerbeallitasok;
    
CREATE TABLE rendszerbeallitasok (
  id VARCHAR(100),
  ertek_int INT,
  ertek_szoveg TEXT,
  megjegyzes TEXT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXSITS seniorok;

CREATE TABLE seniorok (
  id INT AUTO_INCREMENT,
  teljes_nev VARCHAR(100),
  becenev VARCHAR(100),
  szuletesnap DATE,
  diakigazolvany_szam VARCHAR(12),
  hivatalos_lakcim_elerhetoseg_id INT,
  fo_email_elerhetoseg_id INT,
  fo_telefon_elerhetoseg_id INT,
  polomeret VARCHAR(20),
  infok_aktualisak DATE,
  egyeb_leiras TEXT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS login_adatok;
    
CREATE TABLE login_adatok (
  senior_id INT,
  login_nev VARCHAR(50),
  jelszo_hash VARCHAR(50),
  PRIMARY KEY (senior_id),
  UNIQUE KEY (login_nev)
);

DROP TABLE IF EXISTS gardak;
    
CREATE TABLE gardak (
  id INT AUTO_INCREMENT,
  varur_senior_pozicio_id INT,
  nev VARCHAR(50),
  szin VARCHAR(50),
  leiras TEXT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS elerhetoseg_tipusok;

CREATE TABLE elerhetoseg_tipusok (
  id INT AUTO_INCREMENT,
  tipusleiras VARCHAR(200),
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS senior_elerhetosegek;
    
CREATE TABLE senior_elerhetosegek (
  id INT AUTO_INCREMENT,
  senior_id INT,
  elerhetoseg VARCHAR(200),
  elerhetoseg_tipus_id INT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS egyetem_adatok;
    
CREATE TABLE egyetem_adatok (
  id INT AUTO_INCREMENT,
  senior_id INT,
  egyetem_kar_nev VARCHAR(20),
  szak_nev VARCHAR(50),
  kezdes_eve YEAR,
  vegzes_eve YEAR,
  elvegezte BOOL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS esemeny_kategoriak;
    
CREATE TABLE esemeny_kategoriak (
  id INT AUTO_INCREMENT,
  nev VARCHAR(100),
  leiras TEXT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS esemenyek;
    
CREATE TABLE esemenyek (
  id INT AUTO_INCREMENT,
  fo_esemeny_id INT,
  nev VARCHAR(100),
  leiras TEXT,
  esemeny_kategoria_id INT,
  datum_mikortol DATE,
  datum_meddig DATE,
  nyilvanos_weboldal VARCHAR(200),
  helyszin VARCHAR(200),
  kp_pontertek INT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS pozicio_kategoriak;
    
CREATE TABLE pozicio_kategoriak (
  id INT AUTO_INCREMENT,
  nev VARCHAR(100),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS poziciok;
    
CREATE TABLE poziciok (
  id INT  AUTO_INCREMENT,
  nev VARCHAR(50),
  leiras TEXT,
  esemeny_id INT,
  kategoria_id INT,
  lehet_ra_jelentkezni BOOL,
  esemeny_fonoki_poszt BOOL,
  kp_szorzo DECIMAL(4,2),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS senior_poziciok;
    
CREATE TABLE senior_poziciok (
  id INT  AUTO_INCREMENT,
  senior_id INT,
  pozicio_id INT,
  datum_mikortol DATE,
  datum_meddig DATE,
  kapcsolodo_esemeny_id INT,
  kapcsolodo_senior_id INT,
  kapcsolodo_garda_id INT,
  egyeb_leiras TEXT,
  jelentkezes_jovahagyva BOOL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS pozicio_mezok;
    
CREATE TABLE pozicio_mezok (
  id INT AUTO_INCREMENT,
  pozicio_id INT,
  nev VARCHAR(200),
  tipus ENUM('szoveg','szam','senior','esemeny','lista','pipa'),
  minta VARCHAR(200),
  nyilvanossag ENUM('esemeny_szervezo','senior','nyilvanos'),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS pozicio_mezo_ertekek;
    
CREATE TABLE pozicio_mezo_ertekek (
  senior_pozicio_id INT,
  pozicio_mezo_id INT,
  ertek_int INT,
  ertek_szoveg VARCHAR(200),
  PRIMARY KEY (senior_pozicio_id, pozicio_mezo_id)
);

DROP TABLE IF EXISTS senior_garda_infok;
    
CREATE TABLE senior_garda_infok (
  senior_id INT AUTO_INCREMENT,
  garda_id INT,
  rang_senior_pozicio_id INT,
  aktiv BOOL,
  oregtag BOOL,
  PRIMARY KEY (senior_id)
);

DROP TABLE IF EXISTS kp_idoszakok;
    
CREATE TABLE kp_idoszakok (
  id INT AUTO_INCREMENT,
  idoszak_nev VARCHAR(100),
  idoszak_kezdet DATE,
  idoszak_vege DATE,
  megjegyzesek TEXT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS kp_pontok;
    
CREATE TABLE kp_pontok (
  id INT AUTO_INCREMENT,
  senior_id INT,
  kapcsolodo_pozicio_id INT,
  kapcsolodo_esemeny_id INT,
  kp_idoszak_id INT,
  kp_pont INT,
  megjegyzes VARCHAR(200),
  PRIMARY KEY (id)
);

ALTER TABLE seniorok ADD FOREIGN KEY (hivatalos_lakcim_elerhetoseg_id) REFERENCES senior_elerhetosegek (id);
ALTER TABLE seniorok ADD FOREIGN KEY (fo_email_elerhetoseg_id) REFERENCES senior_elerhetosegek (id);
ALTER TABLE seniorok ADD FOREIGN KEY (fo_telefon_elerhetoseg_id) REFERENCES senior_elerhetosegek (id);
ALTER TABLE gardak ADD FOREIGN KEY (varur_senior_pozicio_id) REFERENCES senior_poziciok (id);
ALTER TABLE senior_elerhetosegek ADD FOREIGN KEY (senior_id) REFERENCES seniorok (id);
ALTER TABLE senior_elerhetosegek ADD FOREIGN KEY (elerhetoseg_tipus_id) REFERENCES elerhetoseg_tipusok (id);
ALTER TABLE poziciok ADD FOREIGN KEY (esemeny_id) REFERENCES esemenyek (id);
ALTER TABLE poziciok ADD FOREIGN KEY (kategoria_id) REFERENCES pozicio_kategoriak (id);
ALTER TABLE senior_poziciok ADD FOREIGN KEY (senior_id) REFERENCES seniorok (id);
ALTER TABLE senior_poziciok ADD FOREIGN KEY (pozicio_id) REFERENCES poziciok (id);
ALTER TABLE senior_poziciok ADD FOREIGN KEY (kapcsolodo_esemeny_id) REFERENCES esemenyek (id);
ALTER TABLE senior_poziciok ADD FOREIGN KEY (kapcsolodo_senior_id) REFERENCES seniorok (id);
ALTER TABLE senior_poziciok ADD FOREIGN KEY (kapcsolodo_garda_id) REFERENCES gardak (id);
ALTER TABLE esemenyek ADD FOREIGN KEY (fo_esemeny_id) REFERENCES esemenyek (id);
ALTER TABLE esemenyek ADD FOREIGN KEY (esemeny_kategoria_id) REFERENCES esemeny_kategoriak (id);
ALTER TABLE senior_garda_infok ADD FOREIGN KEY (senior_id) REFERENCES seniorok (id);
ALTER TABLE senior_garda_infok ADD FOREIGN KEY (garda_id) REFERENCES gardak (id);
ALTER TABLE senior_garda_infok ADD FOREIGN KEY (rang_senior_pozicio_id) REFERENCES senior_poziciok (id);
ALTER TABLE kp_pontok ADD FOREIGN KEY (senior_id) REFERENCES seniorok (id);
ALTER TABLE kp_pontok ADD FOREIGN KEY (kapcsolodo_pozicio_id) REFERENCES senior_poziciok (id);
ALTER TABLE kp_pontok ADD FOREIGN KEY (kapcsolodo_esemeny_id) REFERENCES esemenyek (id);
ALTER TABLE kp_pontok ADD FOREIGN KEY (kp_idoszak_id) REFERENCES kp_idoszakok (id);
ALTER TABLE pozicio_mezok ADD FOREIGN KEY (pozicio_id) REFERENCES poziciok (id);
ALTER TABLE pozicio_mezo_ertekek ADD FOREIGN KEY (senior_pozicio_id) REFERENCES senior_poziciok (id);
ALTER TABLE pozicio_mezo_ertekek ADD FOREIGN KEY (pozicio_mezo_id) REFERENCES pozicio_mezok (id);
ALTER TABLE login_adatok ADD FOREIGN KEY (senior_id) REFERENCES seniorok (id);
ALTER TABLE egyetem_adatok ADD FOREIGN KEY (senior_id) REFERENCES seniorok (id);