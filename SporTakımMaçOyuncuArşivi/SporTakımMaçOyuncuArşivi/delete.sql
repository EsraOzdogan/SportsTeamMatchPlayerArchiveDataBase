Use SporTakýmMaçOyuncuArþivi;
--FutbolcuTakýmSözleþme tablosundan bastarihi 200-10-19 olan satýrý siler 

DELETE FROM tblFutbolcuTakýmSözleþme 
WHERE Bas_tar= '2000-10-19'
--TRUNCATE TABLE tblFutbolcuTakýmSözleþme
--FutbolcuTakýmSözleþme tablosundan baþlangýç tarigi 1998-01-05 olan satýrý siler
DELETE FROM tblFutbolcuTakýmSözleþme WHERE Bas_tar='1998-01-05'

--TakýmSezon tablosundan attýpý gol sayýsý 5 ten büyük olanlarý siler 
DELETE FROM tblTakýmSezon WHERE AttýðýGol_Say>5


--TeknikDirektörTakýmSözleþme tablosunda maaþý 1500000.0000den büyük olanlarý sil
DELETE FROM tblTeknikDirektörTakýmSözleþme WHERE Maaþ>'1500000.0000'

--Stadyum tablosundaki stadyum adý Craven Cottage olan satýrý sil
DELETE FROM tblStadyum WHERE Stadyum_Ad='Craven Cottage'