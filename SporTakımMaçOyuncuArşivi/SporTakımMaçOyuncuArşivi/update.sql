USE SporTak�mMa�OyuncuAr�ivi;
--Sezon tablosundan Y�l2='1924-12-30 ' olan sat�r�n sezon ad�n� Super loto super lig ve y�l1='2018-09-04' 
--olarak g�ncelle
UPDATE tblSezon SET Sezon_Ad='Super Loto Super Lig', Y�l1='2018-09-04' WHERE Y�l2='1924-12-30 '

--FutbolcuTAk�mS�zle�me tablosundan Bit_TAr = NULL olan sat�r�n tarihi Bit_Tar = '2011-05-09'
--olarak g�ncelle 
UPDATE tblFutbolcuTak�mS�zle�me SET Bas_Tar='2011-06-09' WHERE Bit_Tar = '2005-12-08'

USE SporTak�mMa�OyuncuAr�ivi;
--Futbolcu tablosundan Futbolcu_Ad='Ander Herrera' ve PozisyonID si ='3' olan sat�r� PozisyonID='4'
--olarak g�ncelle

UPDATE tblFutbolcu SET Forma_Num='10' WHERE Futbolcu_Ad='Ander Herrera' AND Forma_Num='21'

--Ma� tablosundaki  Saat=17.00 olan ve Tarih=1923-03-10 olan sat�r�n Saat=20.00 olarak g�ncelle
UPDATE tblMa� SET Saat='20:00' Where Saat='17:00' AND Tarih='1923-03-10'
--TeknikDirekt�r tablosundaki TekDir_Ad='Julen Lopetegui' olan sat�r� 
--TekDir_Ad='Zinedine Zidane' olarak g�ncelle 
UPDATE tblTeknikDirekt�r SET TekDir_Ad='Zinedine Zidane' WHERE TekDir_Ad='Julen Lopetegui'