Use SporTakýmMaçOyuncuArþivi;
--1.soru A oyuncusunun çýktýðý B oyuncusunun girdiði maçlarda toplam gösterilen kýrmýzý kart
--sayýsý


Select Olay_Ad, COUNT(kýrmýzýkartsayýsý) 
FROM tblOlay  INNER JOIN tblFutbolcuOlayMaç 
 ON OlayID =tblFutbolcuOlayMaç.OlayID
 WHERE MaçID
       IN ( SELECT MaçID
          FROM tblFutbolcuOlayMaç FOM INNER JOIN  tblMaç M
		   ON tblFutbolcuOlayMaç.MaçID=MaçID
		   WHERE  GirenFutbolcuID
		    IN( 
			   Select Futbolcu_ad
			   FROM tblFutbolcuOlayMaç  INNER JOIN tblFutbolcu AS GF 
			   ON tblFutbolcuOlayMaç.ID=GF.ID
			   WHERE Futbolcu_Ad ='Kepa'
			   )AND ÇýkanFutbolcuID IN 
			   (Select Futbolcu_ad
			   FROM tblFutbolcuOlayMaç FOM INNER JOIN tblFutbolcu AS ÇF 
			   ON FOM.ID=ÇF.ID
			   WHERE Futbolcu_Ad ='Ander Herrera'		   
               )
			  
   ) GROUP BY Olay_Ad
----2.soru  Son 3 sezonda hiç kýrmýzý kart yememiþ oyunculardan hangileri hem X hem de Y
--takýmýnda oynamýþtýr
SELECT TOP 3 yýl1
FROM tblSezon
WHERE SezonID NOT IN (SELECT SezonID FROM tblSezon INNER JOIN tblSezonOlay
  ON SezonID=tblSezonOlay.SezonID INNER JOIN tblOlay
    ON OlayID=tblSezonOlay.OlayID
WHERE Olay_Ad='KýrmýzýKart' AND FutbolcuID IN(
		SELECT FutbolcuID,Futbolcu_Ad 
		FROM tblFutbolcu INNER JOIN tblFutbolcuTakýmSözleþme
		 ON FutbolcuID=tblFutbolcuTakýmSözleþme.FutbolcuID INNER JOIN tblTakým
		  ON tblFutbolcuTakýmSözleþme.TakýmID=TakýmID
		WHERE Takým_Ad='X'
		INTERSECT
		SELECT  FutbolcuID,Futbolcu_Ad 
		FROM tblFutbolcu INNER JOIN tblFutbolcuTakýmSözleþme
		 ON FutbolcuID=tblFutbolcuTakýmSözleþme.FutbolcuID INNER JOIN tblTakým
		  ON tblFutbolcuTakýmSözleþme.TakýmID=TakýmID
		WHERE Takým_Ad='Y'
       )
)
ORDER BY yýl1 DESC



---Maaþý 2000den yüksek olan iki teknik direktörün adý
SELECT TekDir_Ad
FROM tblTeknikDirektör
WHERE Tc IN(SELECT TOP 2 TC
FROM tblTeknikDirektör INNER JOIN tblTeknikDirektörTakýmSözleþme
ON Tc=tblTeknikDirektör.Tc INNER JOIN tblTakým
ON TakýmID=tblTeknikDirektörTakýmSözleþme.TakýmID
WHERE Maaþ>=2000
ORDER BY maaþ DESC)

--Sergio Romeronun oynadýðý maçlarýn haftalarýnýn ortalamasý

Select Avg(hafta) 
FROM tblMaç INNER JOIN tblFutbolcuMaç
  ON MaçID=tblFutbolcuMaç.MaçID INNER JOIN tblFutbolcu
    ON tblFutbolcuMaç.FutbolcuID=FutbolcuID
WHERE Futbolcu_Ad='Sergio Romero'

--Avrupa liginde oynamýþ takýmlarýn adlarý ve puanlarýnýn toplamlarýnýn büyükten 
--küçüðe sýralanmasý
select Takým_Ad, SUM(Puan) toplam
From tblTakým INNER JOIN tblTakýmSezon
ON TakýmID=tblTakýmSezon.TakýmID INNER JOIN tblSezon
ON tblTakýmSezon.SezonID=SezonID
WHERE Sezon_Ad='Avrupa LÝGÝ'
Group BY  Takým_AD 
ORDER BY toplam Desc
---Teknikdirektör José Mourinhonun maaþý 
select Maaþ
From tblTeknikDirektör INNER JOIN tblTeknikDirektörTakýmSözleþme
  ON  TC=tblTeknikDirektörTakýmSözleþme.TC INNER JOIN tblTakým
   ON tblTeknikDirektörTakýmSözleþme.TakýmID=TakýmID
WHERE TekDir_Ad='José Mourinho'

---6 nolu maçta oynayan futbolcunun forma numarasý ve adý
SELECT Forma_Num,Futbolcu_Ad
FROM tblFutbolcu 
WHERE FutbolcuID IN(
SELECT FutbolcuID
FROM tblFutbolcu INNER JOIN tblFutbolcuMaç
  ON FutbolcuID=tblFutbolcuMaç.FutbolcuID INNER JOIN tblMaç
    ON tblFutbolcuMaç.MaçID=MaçID
WHERE MaçID='6'
)


---takýmla sözleþmesi belli olamayan teknik direktörlerin listesi
SELECT TekDir_Ad
From tblTeknikDirektör INNER JOIN tblTeknikDirektörTakýmSözleþme
  ON  TC=tblTeknikDirektörTakýmSözleþme.TC INNER JOIN tblTakým
   ON tblTeknikDirektörTakýmSözleþme.TakýmID=TakýmID
WHERE Bit_tar IS NULL
GROUP BY TekDir_Ad


----10 numaralý maçta oynayýp ve forma numarasý 30 olmayan futbolcularýn adlarý
Select Futbolcu_Ad 
From tblFutbolcu
WHERE FutbolcuID IN(
SELECT FutbolcuID
FROM tblFutbolcu INNER JOIN tblFutbolcuMaç
  ON FutbolcuID=tblFutbolcuMaç.FutbolcuID INNER JOIN tblMaç
    ON tblFutbolcuMaç.MaçID=MaçID
WHERE MaçID='10' AND  NOT Forma_Num='30'
)



--

Select Avg(puan) 
FROM tblTakýmSezon 











Select Olay_Ad, COUNT(*) kýrmýzýkart
FROM tblOlay O INNER JOIN tblFutbolcuOlayMaç FOM
 ON  O.ID =FOM.ID
 WHERE OLAY_AD='KýrmýzýKart' AND  MaçID
       IN ( SELECT MaçID
            FROM tblMaç M INNER JOIN  tblFutbolcuOlayMaç FOM
		    ON FOM.ID=M.ID
			)


			

		    ( Select Futbolcu_ad
			   FROM tblFutbolcuOlayMaç FOM INNER JOIN tblFutbolcu AS GF 
			   ON FOM.ID=GF.ID
			   WHERE Futbolcu_Ad ='b'
			 )
			 (
			   
			   Select Futbolcu_ad
			   FROM tblFutbolcuOlayMaç FOM INNER JOIN tblFutbolcu AS ÇF 
			   ON FOM.ID=ÇF.ID
			   WHERE Futbolcu_Ad ='A'
			  )

--GROUP BY Olay_Ad






