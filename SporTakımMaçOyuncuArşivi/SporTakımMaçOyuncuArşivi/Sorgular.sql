Use SporTak�mMa�OyuncuAr�ivi;
--1.soru A oyuncusunun ��kt��� B oyuncusunun girdi�i ma�larda toplam g�sterilen k�rm�z� kart
--say�s�


Select Olay_Ad, COUNT(k�rm�z�kartsay�s�) 
FROM tblOlay  INNER JOIN tblFutbolcuOlayMa� 
 ON OlayID =tblFutbolcuOlayMa�.OlayID
 WHERE Ma�ID
       IN ( SELECT Ma�ID
          FROM tblFutbolcuOlayMa� FOM INNER JOIN  tblMa� M
		   ON tblFutbolcuOlayMa�.Ma�ID=Ma�ID
		   WHERE  GirenFutbolcuID
		    IN( 
			   Select Futbolcu_ad
			   FROM tblFutbolcuOlayMa�  INNER JOIN tblFutbolcu AS GF 
			   ON tblFutbolcuOlayMa�.ID=GF.ID
			   WHERE Futbolcu_Ad ='Kepa'
			   )AND ��kanFutbolcuID IN 
			   (Select Futbolcu_ad
			   FROM tblFutbolcuOlayMa� FOM INNER JOIN tblFutbolcu AS �F 
			   ON FOM.ID=�F.ID
			   WHERE Futbolcu_Ad ='Ander Herrera'		   
               )
			  
   ) GROUP BY Olay_Ad
----2.soru  Son 3 sezonda hi� k�rm�z� kart yememi� oyunculardan hangileri hem X hem de Y
--tak�m�nda oynam��t�r
SELECT TOP 3 y�l1
FROM tblSezon
WHERE SezonID NOT IN (SELECT SezonID FROM tblSezon INNER JOIN tblSezonOlay
  ON SezonID=tblSezonOlay.SezonID INNER JOIN tblOlay
    ON OlayID=tblSezonOlay.OlayID
WHERE Olay_Ad='K�rm�z�Kart' AND FutbolcuID IN(
		SELECT FutbolcuID,Futbolcu_Ad 
		FROM tblFutbolcu INNER JOIN tblFutbolcuTak�mS�zle�me
		 ON FutbolcuID=tblFutbolcuTak�mS�zle�me.FutbolcuID INNER JOIN tblTak�m
		  ON tblFutbolcuTak�mS�zle�me.Tak�mID=Tak�mID
		WHERE Tak�m_Ad='X'
		INTERSECT
		SELECT  FutbolcuID,Futbolcu_Ad 
		FROM tblFutbolcu INNER JOIN tblFutbolcuTak�mS�zle�me
		 ON FutbolcuID=tblFutbolcuTak�mS�zle�me.FutbolcuID INNER JOIN tblTak�m
		  ON tblFutbolcuTak�mS�zle�me.Tak�mID=Tak�mID
		WHERE Tak�m_Ad='Y'
       )
)
ORDER BY y�l1 DESC



---Maa�� 2000den y�ksek olan iki teknik direkt�r�n ad�
SELECT TekDir_Ad
FROM tblTeknikDirekt�r
WHERE Tc IN(SELECT TOP 2 TC
FROM tblTeknikDirekt�r INNER JOIN tblTeknikDirekt�rTak�mS�zle�me
ON Tc=tblTeknikDirekt�r.Tc INNER JOIN tblTak�m
ON Tak�mID=tblTeknikDirekt�rTak�mS�zle�me.Tak�mID
WHERE Maa�>=2000
ORDER BY maa� DESC)

--Sergio Romeronun oynad��� ma�lar�n haftalar�n�n ortalamas�

Select Avg(hafta) 
FROM tblMa� INNER JOIN tblFutbolcuMa�
  ON Ma�ID=tblFutbolcuMa�.Ma�ID INNER JOIN tblFutbolcu
    ON tblFutbolcuMa�.FutbolcuID=FutbolcuID
WHERE Futbolcu_Ad='Sergio Romero'

--Avrupa liginde oynam�� tak�mlar�n adlar� ve puanlar�n�n toplamlar�n�n b�y�kten 
--k����e s�ralanmas�
select Tak�m_Ad, SUM(Puan) toplam
From tblTak�m INNER JOIN tblTak�mSezon
ON Tak�mID=tblTak�mSezon.Tak�mID INNER JOIN tblSezon
ON tblTak�mSezon.SezonID=SezonID
WHERE Sezon_Ad='Avrupa L�G�'
Group BY  Tak�m_AD 
ORDER BY toplam Desc
---Teknikdirekt�r Jos� Mourinhonun maa�� 
select Maa�
From tblTeknikDirekt�r INNER JOIN tblTeknikDirekt�rTak�mS�zle�me
  ON  TC=tblTeknikDirekt�rTak�mS�zle�me.TC INNER JOIN tblTak�m
   ON tblTeknikDirekt�rTak�mS�zle�me.Tak�mID=Tak�mID
WHERE TekDir_Ad='Jos� Mourinho'

---6 nolu ma�ta oynayan futbolcunun forma numaras� ve ad�
SELECT Forma_Num,Futbolcu_Ad
FROM tblFutbolcu 
WHERE FutbolcuID IN(
SELECT FutbolcuID
FROM tblFutbolcu INNER JOIN tblFutbolcuMa�
  ON FutbolcuID=tblFutbolcuMa�.FutbolcuID INNER JOIN tblMa�
    ON tblFutbolcuMa�.Ma�ID=Ma�ID
WHERE Ma�ID='6'
)


---tak�mla s�zle�mesi belli olamayan teknik direkt�rlerin listesi
SELECT TekDir_Ad
From tblTeknikDirekt�r INNER JOIN tblTeknikDirekt�rTak�mS�zle�me
  ON  TC=tblTeknikDirekt�rTak�mS�zle�me.TC INNER JOIN tblTak�m
   ON tblTeknikDirekt�rTak�mS�zle�me.Tak�mID=Tak�mID
WHERE Bit_tar IS NULL
GROUP BY TekDir_Ad


----10 numaral� ma�ta oynay�p ve forma numaras� 30 olmayan futbolcular�n adlar�
Select Futbolcu_Ad 
From tblFutbolcu
WHERE FutbolcuID IN(
SELECT FutbolcuID
FROM tblFutbolcu INNER JOIN tblFutbolcuMa�
  ON FutbolcuID=tblFutbolcuMa�.FutbolcuID INNER JOIN tblMa�
    ON tblFutbolcuMa�.Ma�ID=Ma�ID
WHERE Ma�ID='10' AND  NOT Forma_Num='30'
)



--

Select Avg(puan) 
FROM tblTak�mSezon 











Select Olay_Ad, COUNT(*) k�rm�z�kart
FROM tblOlay O INNER JOIN tblFutbolcuOlayMa� FOM
 ON  O.ID =FOM.ID
 WHERE OLAY_AD='K�rm�z�Kart' AND  Ma�ID
       IN ( SELECT Ma�ID
            FROM tblMa� M INNER JOIN  tblFutbolcuOlayMa� FOM
		    ON FOM.ID=M.ID
			)


			

		    ( Select Futbolcu_ad
			   FROM tblFutbolcuOlayMa� FOM INNER JOIN tblFutbolcu AS GF 
			   ON FOM.ID=GF.ID
			   WHERE Futbolcu_Ad ='b'
			 )
			 (
			   
			   Select Futbolcu_ad
			   FROM tblFutbolcuOlayMa� FOM INNER JOIN tblFutbolcu AS �F 
			   ON FOM.ID=�F.ID
			   WHERE Futbolcu_Ad ='A'
			  )

--GROUP BY Olay_Ad






