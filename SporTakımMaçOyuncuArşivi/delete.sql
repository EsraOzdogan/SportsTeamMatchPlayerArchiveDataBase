Use SporTakımMaçOyuncuArşivi;
--FutbolcuTakımSözleşme tablosundan bastarihi 200-10-19 olan satırı siler 

DELETE FROM tblFutbolcuTakımSözleşme 
WHERE Bas_tar= '2000-10-19'
--TRUNCATE TABLE tblFutbolcuTakımSözleşme
--FutbolcuTakımSözleşme tablosundan başlangıç tarigi 1998-01-05 olan satırı siler
DELETE FROM tblFutbolcuTakımSözleşme WHERE Bas_tar='1998-01-05'

--TakımSezon tablosundan attıpı gol sayısı 5 ten büyük olanları siler 
DELETE FROM tblTakımSezon WHERE AttığıGol_Say>5


--TeknikDirektörTakımSözleşme tablosunda maaşı 1500000.0000den büyük olanları sil
DELETE FROM tblTeknikDirektörTakımSözleşme WHERE Maaş>'1500000.0000'

--Stadyum tablosundaki stadyum adı Craven Cottage olan satırı sil
DELETE FROM tblStadyum WHERE Stadyum_Ad='Craven Cottage'