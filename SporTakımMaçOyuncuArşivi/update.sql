USE SporTakımMaçOyuncuArşivi;
--Sezon tablosundan Yıl2='1924-12-30 ' olan satırın sezon adını Super loto super lig ve yıl1='2018-09-04' 
--olarak güncelle
UPDATE tblSezon SET Sezon_Ad='Super Loto Super Lig', Yıl1='2018-09-04' WHERE Yıl2='1924-12-30 '

--FutbolcuTAkımSözleşme tablosundan Bit_TAr = NULL olan satırın tarihi Bit_Tar = '2011-05-09'
--olarak güncelle 
UPDATE tblFutbolcuTakımSözleşme SET Bas_Tar='2011-06-09' WHERE Bit_Tar = '2005-12-08'

USE SporTakımMaçOyuncuArşivi;
--Futbolcu tablosundan Futbolcu_Ad='Ander Herrera' ve PozisyonID si ='3' olan satırı PozisyonID='4'
--olarak güncelle

UPDATE tblFutbolcu SET Forma_Num='10' WHERE Futbolcu_Ad='Ander Herrera' AND Forma_Num='21'

--Maç tablosundaki  Saat=17.00 olan ve Tarih=1923-03-10 olan satırın Saat=20.00 olarak güncelle
UPDATE tblMaç SET Saat='20:00' Where Saat='17:00' AND Tarih='1923-03-10'
--TeknikDirektör tablosundaki TekDir_Ad='Julen Lopetegui' olan satırı 
--TekDir_Ad='Zinedine Zidane' olarak güncelle 
UPDATE tblTeknikDirektör SET TekDir_Ad='Zinedine Zidane' WHERE TekDir_Ad='Julen Lopetegui'