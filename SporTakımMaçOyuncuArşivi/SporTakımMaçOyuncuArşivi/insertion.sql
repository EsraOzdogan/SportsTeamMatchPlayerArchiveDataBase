USE SporTakýmMaçOyuncuArþivi;

INSERT INTO tblIl VALUES ('1','Ýngiltere');
INSERT INTO tblIl VALUES ('2','Almanya');
INSERT INTO tblIl VALUES ('3','Ýspanya');
INSERT INTO tblIl VALUES ('4','Aðrý');
INSERT INTO tblIl VALUES ('5','Amasya');
INSERT INTO tblIl VALUES ('6','Ankara');
INSERT INTO tblIl VALUES ('7','Antalya');
INSERT INTO tblIl VALUES ('8','Artvin');
INSERT INTO tblIl VALUES ('34','Ýstanbul');
INSERT INTO tblIl VALUES ('35','Ýzmir');
INSERT INTO tblIl VALUES ('53','Rize');
INSERT INTO tblIl VALUES ('54','Sakarya');
INSERT INTO tblIl VALUES ('77','Yalova');

INSERT INTO tblIlce VALUES('Manchester','1'),('Ýngiltere','1'), ('Luverkusen','2'),('Bilbao','3'),
('Dortmund','2'), ('Madrid','3'), ('Diyadin','4'), ('Doðubayazýt','4'), ('Göynücek','5'), ('Gümüþhacýköy','5'),
('Çankaya','6'),
 ('Etimesgut','6'), ('Akseki','7'), ('Alanya','7'), ('Borçka','8'),('Hopa','8'), ('Ataþehir','34'),
 ('Maltepe','34'),('Bornova','35'), ('Buca','35'),('Ardeþen','53'), ('Çamlýhemþin','53'),('Adapazarý','54'),
 ('Hendek','54'),
 ('Çýnarcýk','77'), ( 'Termal','77');

INSERT INTO tblPozisyon VALUES ('Kaleci');
 INSERT INTO tblPozisyon VALUES ('Defans');
 INSERT INTO tblPozisyon VALUES ('OrtaSaha');
 INSERT INTO tblPozisyon VALUES ('Forvet');
 INSERT INTO tblPozisyon VALUES ('SolBek');
INSERT INTO tblPozisyon VALUES ('Stoper');
INSERT INTO tblPozisyon VALUES ('Libero');
 INSERT INTO tblPozisyon VALUES ('SaðBek');




INSERT INTO tblUyruk VALUES ('Ýspanya');
INSERT INTO tblUyruk VALUES ('Arjantin');
INSERT INTO tblUyruk VALUES ('Portekiz');
INSERT INTO tblUyruk VALUES ('Ýtalya');
INSERT INTO tblUyruk VALUES ('Fransa');
INSERT INTO tblUyruk VALUES ('Almanya');
INSERT INTO tblUyruk VALUES ('Avusturya');
INSERT INTO tblUyruk VALUES ('Sýrbistan');
INSERT INTO tblUyruk VALUES ('Hýrvatistan');
INSERT INTO tblUyruk VALUES ('Türk');
INSERT INTO tblUyruk VALUES ('Kazak');


INSERT INTO tblTeknikDirektör VALUES ('1','Julen Lopetegui');
INSERT INTO tblTeknikDirektör VALUES ('2','Santiago Solari');
INSERT INTO tblTeknikDirektör VALUES ('3','José Mourinho');
INSERT INTO tblTeknikDirektör VALUES ('4','Antonio Conte');
INSERT INTO tblTeknikDirektör VALUES ('5','Laurent Blanc');
INSERT INTO tblTeknikDirektör VALUES ('3','Heiko Herrlich');
INSERT INTO tblTeknikDirektör VALUES ('6','Peter Stöger');
INSERT INTO tblTeknikDirektör VALUES ('9','Claude Puel');
INSERT INTO tblTeknikDirektör VALUES ('1','Slavisa Jokanovic');
INSERT INTO tblTeknikDirektör VALUES ('7','Slaven Bilic');
INSERT INTO tblTeknikDirektör VALUES ('9','Cuco Ziganda');
INSERT INTO tblTeknikDirektör VALUES ('1','Luis García');





INSERT INTO tblTakým VALUES ('Real Madrid','1902-03-06 ','1');
INSERT INTO tblTakým VALUES ('Atletico Madrid','1903-04-26 ','3');
INSERT INTO tblTakým VALUES ('Manchester United','1878-03-05','4');
INSERT INTO tblTakým VALUES ('Chelsea ','1905-03-10','7');
INSERT INTO tblTakým VALUES ('Bayern Leverkusen','1904-07-01','6');
INSERT INTO tblTakým VALUES ('Bor Dortmund ','1902-03-06','11');
INSERT INTO tblTakým VALUES ('Fulham','1879-04-01','8');
INSERT INTO tblTakým VALUES ('Athletic Bilbao','1898-11-30','7');
INSERT INTO tblTakým VALUES ('Villarreal ','1923-03-10','5');

INSERT INTO tblSezon VALUES ('Þampiyonlar Ligi ','1923-03-10','1924-12-30','1');
INSERT INTO tblSezon VALUES ('Uluslararasý Þampiyonlar Kupasý ','1928-03-10','1929-11-16','3');
INSERT INTO tblSezon VALUES ('Avrupa Ligi ','1930-03-10','1931-08-02','4');
INSERT INTO tblSezon VALUES ('UEFA Super Kupa ','1963-05-20','1964-10-05','6');
INSERT INTO tblSezon VALUES ('FA Cup ','1999-06-10','2000-05-01','7');




INSERT INTO tblMaç VALUES ('1','1923-03-10','17:00',6,'3','2','1','9',6);
INSERT INTO tblMaç VALUES ('6','1923-02-11','20:00',10,'3','2','2','9',4);
INSERT INTO tblMaç VALUES ('2','1928-09-14','19:00',8,'2','3','3','9',3);
INSERT INTO tblMaç VALUES ('3','1928-11-10','21:00',9,'2','3','4','4',NULL);
INSERT INTO tblMaç VALUES ('4','1928-07-12','21:00',10,'3','2','6','1',2);
INSERT INTO tblMaç VALUES ('2','1928-06-28','20:00',12,'3','2','6','9',3);
INSERT INTO tblMaç VALUES ('3','1930-03-21','19:45',5,'1','1','4','2',5);
INSERT INTO tblMaç VALUES ('1','1930-05-19','20:45',4,'1','1','9','2',1);


INSERT INTO tblMaçSezon VALUES ('2','2');
INSERT INTO tblMaçSezon VALUES ('2','5');
INSERT INTO tblMaçSezon VALUES ('8','2');
INSERT INTO tblMaçSezon VALUES ('6','3');
INSERT INTO tblMaçSezon VALUES ('5','4');
INSERT INTO tblMaçSezon VALUES ('6','2');
INSERT INTO tblMaçSezon VALUES ('7','5');
INSERT INTO tblMaçSezon VALUES ('4','3');
INSERT INTO tblMaçSezon VALUES ('7','5');
INSERT INTO tblMaçSezon VALUES ('7','5');
INSERT INTO tblMaçSezon VALUES ('7','5');
INSERT INTO tblMaçSezon VALUES ('4','3');



INSERT INTO tblOlay VALUES ('Kýrmýzýkart');
INSERT INTO tblOlay VALUES ('SarýKart');
INSERT INTO tblOlay VALUES ('Penaltý');
INSERT INTO tblOlay VALUES ('Korner');
INSERT INTO tblOlay VALUES ('Yaralanma');
INSERT INTO tblOlay VALUES ('Ertelenme');
INSERT INTO tblOlay VALUES ('OyuncuDeðiþikliði');



INSERT INTO tblFutbolcu VALUES ('1','David de Gea','1','1','3');
INSERT INTO tblFutbolcu VALUES ('22','Sergio Romero','1','4','3');
INSERT INTO tblFutbolcu VALUES ('21','Ander Herrera','3','1','3');
INSERT INTO tblFutbolcu VALUES ('1','Kepa','1','1','4');
INSERT INTO tblFutbolcu VALUES ('13','Willy Caballero','1','1','4');
INSERT INTO tblFutbolcu VALUES ('30','David Luiz','6','3','4');
INSERT INTO tblFutbolcu VALUES ('3','Marcos Alonso','5','1','4');
INSERT INTO tblFutbolcu VALUES ('25','Sergio Rico','1','1','9');
INSERT INTO tblFutbolcu VALUES ('31','Fabri','1','1','9');

INSERT INTO tblFutbolcuMaç VALUES ('1','3');
INSERT INTO tblFutbolcuMaç VALUES ('2','6');
INSERT INTO tblFutbolcuMaç VALUES ('3','5');
INSERT INTO tblFutbolcuMaç VALUES ('1','4');
INSERT INTO tblFutbolcuMaç VALUES ('2','7');
INSERT INTO tblFutbolcuMaç VALUES ('3','3');
INSERT INTO tblFutbolcuMaç VALUES ('8','3');
INSERT INTO tblFutbolcuMaç VALUES ('4','2');
INSERT INTO tblFutbolcuMaç VALUES ('5','6');
INSERT INTO tblFutbolcuMaç VALUES ('1','4');
INSERT INTO tblFutbolcuMaç VALUES ('8','6');
INSERT INTO tblFutbolcuMaç VALUES ('6','4');
INSERT INTO tblFutbolcuMaç VALUES ('2','3');	

INSERT INTO tblStadyum VALUES ('Old Trafford','2','3');
INSERT INTO tblStadyum VALUES ('Craven Cottage','2','3');
INSERT INTO tblStadyum VALUES ('Bayarena','2','3');
INSERT INTO tblStadyum VALUES ('San Mamés Stadyumu','2','3');
INSERT INTO tblStadyum VALUES ('Signal Iduna Park','2','3');

INSERT INTO tblStadyum VALUES ('Wanda Metropolitano','2','3');
INSERT INTO tblStadyum VALUES ('Santiago Bernabéu Stadyumu','2','3');
INSERT INTO tblStadyum VALUES ('Stamford Bridge','2','3');
INSERT INTO tblStadyum VALUES ('Þükrü Saraçoðlu Stadý','2','3');
INSERT INTO tblStadyum VALUES ('Ali Samiyan Stadý','2','3');
INSERT INTO tblStadyum VALUES ('Türk Telekom Arena','2','3');


INSERT INTO tblTakýmSezon VALUES ('2','3','6','2','1','2','3','7','5','2');
INSERT INTO tblTakýmSezon VALUES ('1','3','4','2','2','2','0','6','4','2');
INSERT INTO tblTakýmSezon VALUES ('3','4','4','3','1','3','0','7','4','3');
INSERT INTO tblTakýmSezon VALUES ('4','9','3','6','0','3','0','6','0','6');
INSERT INTO tblTakýmSezon VALUES ('2','9','2','0','1','1','0','2','2','0');
INSERT INTO tblTakýmSezon VALUES ('3','8','3','4','0','3','0','9','5','4');
INSERT INTO tblTakýmSezon VALUES ('2','8','1','0','0','0','1','5','5','0');
INSERT INTO tblTakýmSezon VALUES ('1','4','5','4','2','3','0','9','5','4');
INSERT INTO tblTakýmSezon VALUES ('3','7','4','4','1','1','2','8','4','4');
INSERT INTO tblTakýmSezon VALUES ('2','8','1','0','0','0','1','5','5','0');
INSERT INTO tblTakýmSezon VALUES ('1','4','5','4','2','3','0','9','5','4');
INSERT INTO tblTakýmSezon VALUES ('3','7','4','4','1','1','2','8','4','4');



INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('3','7','2016-11-10','2018-12-16',$1.000000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('6','4','2000-10-19','2014-06-03',$2.000000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('8','7','1996-04-03','2000-04-08',$500000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('5','9','2013-10-02','2015-05-06',$800000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('4','7','1997-03-04','2001-07-08',$600000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('8','6','1998-01-05','2002-06-09',$400000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('3','2','1997-05-04','1999-04-07',$500000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('9','1','1995-11-07','1998-09-15',$600000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('1','7','2002-11-08','2004-08-09',$7000000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('2','3','2003-06-19','2005-12-08',$600000);
INSERT INTO tblFutbolcuTakýmSözleþme VALUES ('3','9','2001-05-09',NULL,$900000);

INSERT INTO tblTeknikDirektörTakýmSözleþme VALUES ('1','9','2001-05-09',NULL,$90000000);
INSERT INTO tblTeknikDirektörTakýmSözleþme VALUES ('2','8','2003-11-14','2013-11-14',$6000000);
INSERT INTO tblTeknikDirektörTakýmSözleþme VALUES ('3','6','2009-10-17',NULL,$7500000);
INSERT INTO tblTeknikDirektörTakýmSözleþme VALUES ('4','7','2005-03-27','2009-11-24',$1000000);
INSERT INTO tblTeknikDirektörTakýmSözleþme VALUES ('5','1','2016-05-16',NULL,$6500000);
INSERT INTO tblTeknikDirektörTakýmSözleþme  VALUES ('6','2','2018-11-15',NULL,$2500000);
INSERT INTO tblTeknikDirektörTakýmSözleþme  VALUES ('7','9','2006-12-19','2019-12-24',$6000000);
INSERT INTO tblTeknikDirektörTakýmSözleþme  VALUES ('8','6','2004-08-19',NULL,$1500000);
INSERT INTO tblTeknikDirektörTakýmSözleþme VALUES ('9','7','2002-09-09','2006-01-19',$2900000);


INSERT INTO tblFutbolcuOlayMaç VALUES ('3','2','2','2','16','2');
INSERT INTO tblFutbolcuOlayMaç VALUES ('3','6','1','3','28','1');
INSERT INTO tblFutbolcuOlayMaç VALUES ('2','3','3','4','36','0');
INSERT INTO tblFutbolcuOlayMaç VALUES ('6','2','5','6','19','5');
INSERT INTO tblFutbolcuOlayMaç VALUES ('4','5','6','2','45','4');
INSERT INTO tblFutbolcuOlayMaç VALUES ('6','2','8','6','20','4');
INSERT INTO tblFutbolcuOlayMaç VALUES ('8','9','2','5','39','1');
INSERT INTO tblFutbolcuOlayMaç VALUES ('9','2','8','4','56','2');
INSERT INTO tblFutbolcuOlayMaç VALUES ('6','2','2','2','89','3');
INSERT INTO tblFutbolcuOlayMaç VALUES ('3','6','4','1','25','4');
INSERT INTO tblFutbolcuOlayMaç VALUES ('5','4','5','3','13','6');

INSERT INTO tblFutbolcuTakým VALUES ('5','4');
INSERT INTO tblFutbolcuTakým VALUES ('6','8');
INSERT INTO tblFutbolcuTakým VALUES ('4','9');
INSERT INTO tblFutbolcuTakým VALUES ('7','8');
INSERT INTO tblFutbolcuTakým VALUES ('5','9');
INSERT INTO tblFutbolcuTakým VALUES ('1','2');
INSERT INTO tblFutbolcuTakým VALUES ('5','3');
INSERT INTO tblFutbolcuTakým VALUES ('8','6');
INSERT INTO tblFutbolcuTakým VALUES ('6','4');
INSERT INTO tblFutbolcuTakým VALUES ('5','1');
INSERT INTO tblFutbolcuTakým VALUES ('9','6');
INSERT INTO tblFutbolcuTakým VALUES ('8','4');

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
