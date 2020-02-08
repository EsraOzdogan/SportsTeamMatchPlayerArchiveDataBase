USE SporTakýmMaçOyuncuArþivi;
--Sezon tablosundan Yýl2='1924-12-30 ' olan satýrýn sezon adýný Super loto super lig ve yýl1='2018-09-04' 
--olarak güncelle
UPDATE tblSezon SET Sezon_Ad='Super Loto Super Lig', Yýl1='2018-09-04' WHERE Yýl2='1924-12-30 '

--FutbolcuTAkýmSözleþme tablosundan Bit_TAr = NULL olan satýrýn tarihi Bit_Tar = '2011-05-09'
--olarak güncelle 
UPDATE tblFutbolcuTakýmSözleþme SET Bas_Tar='2011-06-09' WHERE Bit_Tar = '2005-12-08'

USE SporTakýmMaçOyuncuArþivi;
--Futbolcu tablosundan Futbolcu_Ad='Ander Herrera' ve PozisyonID si ='3' olan satýrý PozisyonID='4'
--olarak güncelle

UPDATE tblFutbolcu SET Forma_Num='10' WHERE Futbolcu_Ad='Ander Herrera' AND Forma_Num='21'

--Maç tablosundaki  Saat=17.00 olan ve Tarih=1923-03-10 olan satýrýn Saat=20.00 olarak güncelle
UPDATE tblMaç SET Saat='20:00' Where Saat='17:00' AND Tarih='1923-03-10'
--TeknikDirektör tablosundaki TekDir_Ad='Julen Lopetegui' olan satýrý 
--TekDir_Ad='Zinedine Zidane' olarak güncelle 
UPDATE tblTeknikDirektör SET TekDir_Ad='Zinedine Zidane' WHERE TekDir_Ad='Julen Lopetegui'