Use SporTak�mMa�OyuncuAr�ivi;
--FutbolcuTak�mS�zle�me tablosundan bastarihi 200-10-19 olan sat�r� siler 

DELETE FROM tblFutbolcuTak�mS�zle�me 
WHERE Bas_tar= '2000-10-19'
--TRUNCATE TABLE tblFutbolcuTak�mS�zle�me
--FutbolcuTak�mS�zle�me tablosundan ba�lang�� tarigi 1998-01-05 olan sat�r� siler
DELETE FROM tblFutbolcuTak�mS�zle�me WHERE Bas_tar='1998-01-05'

--Tak�mSezon tablosundan att�p� gol say�s� 5 ten b�y�k olanlar� siler 
DELETE FROM tblTak�mSezon WHERE Att���Gol_Say>5


--TeknikDirekt�rTak�mS�zle�me tablosunda maa�� 1500000.0000den b�y�k olanlar� sil
DELETE FROM tblTeknikDirekt�rTak�mS�zle�me WHERE Maa�>'1500000.0000'

--Stadyum tablosundaki stadyum ad� Craven Cottage olan sat�r� sil
DELETE FROM tblStadyum WHERE Stadyum_Ad='Craven Cottage'