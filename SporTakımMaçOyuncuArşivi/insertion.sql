USE SporTak�mMa�OyuncuAr�ivi;

INSERT INTO tblIl VALUES ('1','�ngiltere');
INSERT INTO tblIl VALUES ('2','Almanya');
INSERT INTO tblIl VALUES ('3','�spanya');
INSERT INTO tblIl VALUES ('4','A�r�');
INSERT INTO tblIl VALUES ('5','Amasya');
INSERT INTO tblIl VALUES ('6','Ankara');
INSERT INTO tblIl VALUES ('7','Antalya');
INSERT INTO tblIl VALUES ('8','Artvin');
INSERT INTO tblIl VALUES ('34','�stanbul');
INSERT INTO tblIl VALUES ('35','�zmir');
INSERT INTO tblIl VALUES ('53','Rize');
INSERT INTO tblIl VALUES ('54','Sakarya');
INSERT INTO tblIl VALUES ('77','Yalova');

INSERT INTO tblIlce VALUES('Manchester','1'),('�ngiltere','1'), ('Luverkusen','2'),('Bilbao','3'),
('Dortmund','2'), ('Madrid','3'), ('Diyadin','4'), ('Do�ubayaz�t','4'), ('G�yn�cek','5'), ('G�m��hac�k�y','5'),
('�ankaya','6'),
 ('Etimesgut','6'), ('Akseki','7'), ('Alanya','7'), ('Bor�ka','8'),('Hopa','8'), ('Ata�ehir','34'),
 ('Maltepe','34'),('Bornova','35'), ('Buca','35'),('Arde�en','53'), ('�aml�hem�in','53'),('Adapazar�','54'),
 ('Hendek','54'),
 ('��narc�k','77'), ( 'Termal','77');

INSERT INTO tblPozisyon VALUES ('Kaleci');
 INSERT INTO tblPozisyon VALUES ('Defans');
 INSERT INTO tblPozisyon VALUES ('OrtaSaha');
 INSERT INTO tblPozisyon VALUES ('Forvet');
 INSERT INTO tblPozisyon VALUES ('SolBek');
INSERT INTO tblPozisyon VALUES ('Stoper');
INSERT INTO tblPozisyon VALUES ('Libero');
 INSERT INTO tblPozisyon VALUES ('Sa�Bek');




INSERT INTO tblUyruk VALUES ('�spanya');
INSERT INTO tblUyruk VALUES ('Arjantin');
INSERT INTO tblUyruk VALUES ('Portekiz');
INSERT INTO tblUyruk VALUES ('�talya');
INSERT INTO tblUyruk VALUES ('Fransa');
INSERT INTO tblUyruk VALUES ('Almanya');
INSERT INTO tblUyruk VALUES ('Avusturya');
INSERT INTO tblUyruk VALUES ('S�rbistan');
INSERT INTO tblUyruk VALUES ('H�rvatistan');
INSERT INTO tblUyruk VALUES ('T�rk');
INSERT INTO tblUyruk VALUES ('Kazak');


INSERT INTO tblTeknikDirekt�r VALUES ('1','Julen Lopetegui');
INSERT INTO tblTeknikDirekt�r VALUES ('2','Santiago Solari');
INSERT INTO tblTeknikDirekt�r VALUES ('3','Jos� Mourinho');
INSERT INTO tblTeknikDirekt�r VALUES ('4','Antonio Conte');
INSERT INTO tblTeknikDirekt�r VALUES ('5','Laurent Blanc');
INSERT INTO tblTeknikDirekt�r VALUES ('3','Heiko Herrlich');
INSERT INTO tblTeknikDirekt�r VALUES ('6','Peter St�ger');
INSERT INTO tblTeknikDirekt�r VALUES ('9','Claude Puel');
INSERT INTO tblTeknikDirekt�r VALUES ('1','Slavisa Jokanovic');
INSERT INTO tblTeknikDirekt�r VALUES ('7','Slaven Bilic');
INSERT INTO tblTeknikDirekt�r VALUES ('9','Cuco Ziganda');
INSERT INTO tblTeknikDirekt�r VALUES ('1','Luis Garc�a');





INSERT INTO tblTak�m VALUES ('Real Madrid','1902-03-06 ','1');
INSERT INTO tblTak�m VALUES ('Atletico Madrid','1903-04-26 ','3');
INSERT INTO tblTak�m VALUES ('Manchester United','1878-03-05','4');
INSERT INTO tblTak�m VALUES ('Chelsea ','1905-03-10','7');
INSERT INTO tblTak�m VALUES ('Bayern Leverkusen','1904-07-01','6');
INSERT INTO tblTak�m VALUES ('Bor Dortmund ','1902-03-06','11');
INSERT INTO tblTak�m VALUES ('Fulham','1879-04-01','8');
INSERT INTO tblTak�m VALUES ('Athletic Bilbao','1898-11-30','7');
INSERT INTO tblTak�m VALUES ('Villarreal ','1923-03-10','5');

INSERT INTO tblSezon VALUES ('�ampiyonlar Ligi ','1923-03-10','1924-12-30','1');
INSERT INTO tblSezon VALUES ('Uluslararas� �ampiyonlar Kupas� ','1928-03-10','1929-11-16','3');
INSERT INTO tblSezon VALUES ('Avrupa Ligi ','1930-03-10','1931-08-02','4');
INSERT INTO tblSezon VALUES ('UEFA Super Kupa ','1963-05-20','1964-10-05','6');
INSERT INTO tblSezon VALUES ('FA Cup ','1999-06-10','2000-05-01','7');




INSERT INTO tblMa� VALUES ('1','1923-03-10','17:00',6,'3','2','1','9',6);
INSERT INTO tblMa� VALUES ('6','1923-02-11','20:00',10,'3','2','2','9',4);
INSERT INTO tblMa� VALUES ('2','1928-09-14','19:00',8,'2','3','3','9',3);
INSERT INTO tblMa� VALUES ('3','1928-11-10','21:00',9,'2','3','4','4',NULL);
INSERT INTO tblMa� VALUES ('4','1928-07-12','21:00',10,'3','2','6','1',2);
INSERT INTO tblMa� VALUES ('2','1928-06-28','20:00',12,'3','2','6','9',3);
INSERT INTO tblMa� VALUES ('3','1930-03-21','19:45',5,'1','1','4','2',5);
INSERT INTO tblMa� VALUES ('1','1930-05-19','20:45',4,'1','1','9','2',1);


INSERT INTO tblMa�Sezon VALUES ('2','2');
INSERT INTO tblMa�Sezon VALUES ('2','5');
INSERT INTO tblMa�Sezon VALUES ('8','2');
INSERT INTO tblMa�Sezon VALUES ('6','3');
INSERT INTO tblMa�Sezon VALUES ('5','4');
INSERT INTO tblMa�Sezon VALUES ('6','2');
INSERT INTO tblMa�Sezon VALUES ('7','5');
INSERT INTO tblMa�Sezon VALUES ('4','3');
INSERT INTO tblMa�Sezon VALUES ('7','5');
INSERT INTO tblMa�Sezon VALUES ('7','5');
INSERT INTO tblMa�Sezon VALUES ('7','5');
INSERT INTO tblMa�Sezon VALUES ('4','3');



INSERT INTO tblOlay VALUES ('K�rm�z�kart');
INSERT INTO tblOlay VALUES ('Sar�Kart');
INSERT INTO tblOlay VALUES ('Penalt�');
INSERT INTO tblOlay VALUES ('Korner');
INSERT INTO tblOlay VALUES ('Yaralanma');
INSERT INTO tblOlay VALUES ('Ertelenme');
INSERT INTO tblOlay VALUES ('OyuncuDe�i�ikli�i');



INSERT INTO tblFutbolcu VALUES ('1','David de Gea','1','1','3');
INSERT INTO tblFutbolcu VALUES ('22','Sergio Romero','1','4','3');
INSERT INTO tblFutbolcu VALUES ('21','Ander Herrera','3','1','3');
INSERT INTO tblFutbolcu VALUES ('1','Kepa','1','1','4');
INSERT INTO tblFutbolcu VALUES ('13','Willy Caballero','1','1','4');
INSERT INTO tblFutbolcu VALUES ('30','David Luiz','6','3','4');
INSERT INTO tblFutbolcu VALUES ('3','Marcos Alonso','5','1','4');
INSERT INTO tblFutbolcu VALUES ('25','Sergio Rico','1','1','9');
INSERT INTO tblFutbolcu VALUES ('31','Fabri','1','1','9');

INSERT INTO tblFutbolcuMa� VALUES ('1','3');
INSERT INTO tblFutbolcuMa� VALUES ('2','6');
INSERT INTO tblFutbolcuMa� VALUES ('3','5');
INSERT INTO tblFutbolcuMa� VALUES ('1','4');
INSERT INTO tblFutbolcuMa� VALUES ('2','7');
INSERT INTO tblFutbolcuMa� VALUES ('3','3');
INSERT INTO tblFutbolcuMa� VALUES ('8','3');
INSERT INTO tblFutbolcuMa� VALUES ('4','2');
INSERT INTO tblFutbolcuMa� VALUES ('5','6');
INSERT INTO tblFutbolcuMa� VALUES ('1','4');
INSERT INTO tblFutbolcuMa� VALUES ('8','6');
INSERT INTO tblFutbolcuMa� VALUES ('6','4');
INSERT INTO tblFutbolcuMa� VALUES ('2','3');	

INSERT INTO tblStadyum VALUES ('Old Trafford','2','3');
INSERT INTO tblStadyum VALUES ('Craven Cottage','2','3');
INSERT INTO tblStadyum VALUES ('Bayarena','2','3');
INSERT INTO tblStadyum VALUES ('San Mam�s Stadyumu','2','3');
INSERT INTO tblStadyum VALUES ('Signal Iduna Park','2','3');

INSERT INTO tblStadyum VALUES ('Wanda Metropolitano','2','3');
INSERT INTO tblStadyum VALUES ('Santiago Bernab�u Stadyumu','2','3');
INSERT INTO tblStadyum VALUES ('Stamford Bridge','2','3');
INSERT INTO tblStadyum VALUES ('��kr� Sara�o�lu Stad�','2','3');
INSERT INTO tblStadyum VALUES ('Ali Samiyan Stad�','2','3');
INSERT INTO tblStadyum VALUES ('T�rk Telekom Arena','2','3');


INSERT INTO tblTak�mSezon VALUES ('2','3','6','2','1','2','3','7','5','2');
INSERT INTO tblTak�mSezon VALUES ('1','3','4','2','2','2','0','6','4','2');
INSERT INTO tblTak�mSezon VALUES ('3','4','4','3','1','3','0','7','4','3');
INSERT INTO tblTak�mSezon VALUES ('4','9','3','6','0','3','0','6','0','6');
INSERT INTO tblTak�mSezon VALUES ('2','9','2','0','1','1','0','2','2','0');
INSERT INTO tblTak�mSezon VALUES ('3','8','3','4','0','3','0','9','5','4');
INSERT INTO tblTak�mSezon VALUES ('2','8','1','0','0','0','1','5','5','0');
INSERT INTO tblTak�mSezon VALUES ('1','4','5','4','2','3','0','9','5','4');
INSERT INTO tblTak�mSezon VALUES ('3','7','4','4','1','1','2','8','4','4');
INSERT INTO tblTak�mSezon VALUES ('2','8','1','0','0','0','1','5','5','0');
INSERT INTO tblTak�mSezon VALUES ('1','4','5','4','2','3','0','9','5','4');
INSERT INTO tblTak�mSezon VALUES ('3','7','4','4','1','1','2','8','4','4');



INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('3','7','2016-11-10','2018-12-16',$1.000000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('6','4','2000-10-19','2014-06-03',$2.000000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('8','7','1996-04-03','2000-04-08',$500000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('5','9','2013-10-02','2015-05-06',$800000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('4','7','1997-03-04','2001-07-08',$600000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('8','6','1998-01-05','2002-06-09',$400000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('3','2','1997-05-04','1999-04-07',$500000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('9','1','1995-11-07','1998-09-15',$600000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('1','7','2002-11-08','2004-08-09',$7000000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('2','3','2003-06-19','2005-12-08',$600000);
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES ('3','9','2001-05-09',NULL,$900000);

INSERT INTO tblTeknikDirekt�rTak�mS�zle�me VALUES ('1','9','2001-05-09',NULL,$90000000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me VALUES ('2','8','2003-11-14','2013-11-14',$6000000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me VALUES ('3','6','2009-10-17',NULL,$7500000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me VALUES ('4','7','2005-03-27','2009-11-24',$1000000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me VALUES ('5','1','2016-05-16',NULL,$6500000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me  VALUES ('6','2','2018-11-15',NULL,$2500000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me  VALUES ('7','9','2006-12-19','2019-12-24',$6000000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me  VALUES ('8','6','2004-08-19',NULL,$1500000);
INSERT INTO tblTeknikDirekt�rTak�mS�zle�me VALUES ('9','7','2002-09-09','2006-01-19',$2900000);


INSERT INTO tblFutbolcuOlayMa� VALUES ('3','2','2','2','16','2');
INSERT INTO tblFutbolcuOlayMa� VALUES ('3','6','1','3','28','1');
INSERT INTO tblFutbolcuOlayMa� VALUES ('2','3','3','4','36','0');
INSERT INTO tblFutbolcuOlayMa� VALUES ('6','2','5','6','19','5');
INSERT INTO tblFutbolcuOlayMa� VALUES ('4','5','6','2','45','4');
INSERT INTO tblFutbolcuOlayMa� VALUES ('6','2','8','6','20','4');
INSERT INTO tblFutbolcuOlayMa� VALUES ('8','9','2','5','39','1');
INSERT INTO tblFutbolcuOlayMa� VALUES ('9','2','8','4','56','2');
INSERT INTO tblFutbolcuOlayMa� VALUES ('6','2','2','2','89','3');
INSERT INTO tblFutbolcuOlayMa� VALUES ('3','6','4','1','25','4');
INSERT INTO tblFutbolcuOlayMa� VALUES ('5','4','5','3','13','6');

INSERT INTO tblFutbolcuTak�m VALUES ('5','4');
INSERT INTO tblFutbolcuTak�m VALUES ('6','8');
INSERT INTO tblFutbolcuTak�m VALUES ('4','9');
INSERT INTO tblFutbolcuTak�m VALUES ('7','8');
INSERT INTO tblFutbolcuTak�m VALUES ('5','9');
INSERT INTO tblFutbolcuTak�m VALUES ('1','2');
INSERT INTO tblFutbolcuTak�m VALUES ('5','3');
INSERT INTO tblFutbolcuTak�m VALUES ('8','6');
INSERT INTO tblFutbolcuTak�m VALUES ('6','4');
INSERT INTO tblFutbolcuTak�m VALUES ('5','1');
INSERT INTO tblFutbolcuTak�m VALUES ('9','6');
INSERT INTO tblFutbolcuTak�m VALUES ('8','4');

INSERT INTO tblSezonOlay VALUES ('1','4','5');
INSERT INTO tblSezonOlay VALUES ('2','5','6');
INSERT INTO tblSezonOlay VALUES ('3','6','1');
INSERT INTO tblSezonOlay VALUES ('4','7','4');
INSERT INTO tblSezonOlay VALUES ('5','1','1');
INSERT INTO tblSezonOlay VALUES ('5','1','3');
INSERT INTO tblSezonOlay VALUES ('4','1','4');
INSERT INTO tblSezonOlay VALUES ('4','1','6');
INSERT INTO tblSezonOlay VALUES ('3','1','2');
INSERT INTO tblSezonOlay VALUES ('2','1','5');
INSERT INTO tblSezonOlay VALUES ('1','1','9');
