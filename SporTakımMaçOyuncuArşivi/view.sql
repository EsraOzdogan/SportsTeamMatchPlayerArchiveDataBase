--1) 
--KONTROL
 IF OBJECT_ID ('vTeknikD') IS NOT NULL
BEGIN
 DROP VIEW vTeknikD;
 PRINT 'SÝLÝNDÝ'
END
ELSE
 PRINT 'KAYIT YOK'

--VIEW:Teknik direktör adý, teknikdirektör TCsi,teknik direktörün takým ile sözleþme tarihi, sözleþmeden bu zaman kadar geçen zaman ,teknik direktör uyruðu ve 
--uyruklarýn harflerinin büyük  ve soldan 3 tanesi
CREATE VIEW dbo.vTeknikD AS
SELECT  TekDir_Ad,
       TD.TC ,
       YEAR(Bas_tar) AS SözleþmeBaþlangýcý, 
	   DATEDIFF(YEAR,Bas_tar,Bit_tar) AS ÇalýþtýðýSüre,  
	   U.Uyruk_Ad AS Uyruk,
	   UPPER(U.Uyruk_Ad) AS UyrukKýsaltma	   
 FROM tblTeknikDirektörTakýmSözleþme TDTS INNER JOIN tblTeknikDirektör TD
 ON TDTS.TC=TD.TC INNER JOIN tblUyruk U
 ON TD.UyrukID=U.ID
 GO
 --TEST
 --1)Takýmadýna göre küçükten büyüðe gidiyor Takýmadlarýndaki kurulustarihne göre ise büyükten küçüðe doðru sýralanýyor
SELECT ROW_NUMBER() OVER(PARTITION BY Takým_Ad ORDER BY KurulusTar DESC) AS Sýra, 
       *, 
	   LEFT(UyrukKýsaltma,3) AS UyrukKýsaltma 
FROM vTeknikD AS TekD INNER JOIN tblTakým AS T
 ON TekD.TC=T.TC
 ORDER BY KurulusTar DESC


 --2)Kuruluþ Tarihi 19 ile baþlayan takýmlarýn adý,kuruluþ tarihi ,futbolcuadý,Forma numarasý
SELECT   T.Takým_Ad AS TakýmAd,
         T.KurulusTar AS TakýmKuruluþTarihi,
	    F.Futbolcu_Ad AS FutbolcuAd,
		F.Forma_Num AS FormaNumarasý
FROM vTeknikD AS TEKD INNER JOIN tblTakým T
ON TekD.TC=T.TC INNER JOIN tblFutbolcuTakým AS FT
ON FT.TakýmID=T.ID INNER JOIN tblFutbolcu AS F
ON F.ID= FT.FutbolcuID
WHERE  KurulusTar LIKE '19%'




 
 --2) 
--KONTROL
 IF OBJECT_ID ('vWFutbolcuTakýmSözleþmeDetay') IS NOT NULL
BEGIN
 DROP VIEW vWFutbolcuTakýmSözleþmeDetay;
 PRINT 'SÝLÝNDÝ'
END
ELSE
 PRINT 'KAYIT YOK'

--VIEW: FutbolcuTakýmSözleþme tablosunda futbolcuadý,takýmadý, ve bu takým için sözleþme yapýlan tarih ve 
--sözleþmenin bittiði tarih ayrý sütunlardadýr. Bunlarý birleþtirip Sözleþme Tarihini gösteren bir view 
CREATE VIEW vWFutbolcuTakýmSözleþmeDetay 
AS
SELECT FutbolcuID AS FutbolcuID, 
       Takým_Ad AS TakýmAd, 
	   T.KurulusTar,
	   DATEDIFF(YEAR,Bas_tar,Bit_tar) AS SözleþmeTarihi 
FROM tblFutbolcuTakýmSözleþme AS FTS INNER JOIN tblTakým AS T
ON T.ID=FTS.TakýmID
GO
--TEST
SELECT * FROM vWFutbolcuTakýmSözleþmeDetay

SELECT F.Futbolcu_Ad AS FutbolcuAdý,
       F.Forma_Num AS FormaNumarasý,
	   P.poz_Ad AS Pozisyon,
	   FTSD.KurulusTar,
	   FTSD.SözleþmeTarihi,
	   U.Uyruk_Ad
FROM vWFutbolcuTakýmSözleþmeDetay AS FTSD INNER JOIN tblFutbolcu AS F
ON FTSD.FutbolcuID = F.ID INNER JOIN tblPozisyon AS P
ON F.PozisyonID=p.ID INNER JOIN tblFutbolcu AS FT
ON FT.ID=p.ID INNER JOIN tblUyruk AS U
ON U.ID=FT.ID



---3)
------KONTROL
IF OBJECT_ID ('vWFutbolcuTakýmSözleþmeDetay2') IS NOT NULL
BEGIN
 DROP VIEW vWFutbolcuTakýmSözleþmeDetay2;
 PRINT 'SÝLÝNDÝ'
END
ELSE
 PRINT 'KAYIT YOK'
--FutbolcuTakýmSözleþmede Futbolcu ismi ve takým adý mevcut deðildir.Bunun yerine ID deðerleri vardýr.
--Bu isimlerle beraber FutbolcuTakýmSözleþmeDetaylarýný gösteren view
CREATE VIEW vWFutbolcuTakýmSözleþmeDetay2 AS
SELECT Futbolcu_Ad AS Futbolcu, 
       Takým_Ad AS Takým, 
	   DATEDIFF(YEAR,Bas_tar,Bit_tar) AS SözleþmeTarihi 
FROM tblFutbolcu F INNER JOIN tblTakým T
ON F.TakýmID=T.ID INNER JOIN tblFutbolcuTakýmSözleþme FTS 
ON FTS.FutbolcuID=F.ID
GO
--TEST
SELECT * FROM vWFutbolcuTakýmSözleþmeDetay2


----

---4)
------KONTROL
IF OBJECT_ID ('vwTakýmTakýmSezon') IS NOT NULL
BEGIN
 DROP VIEW vwTakýmTakýmSezon;
 PRINT 'SÝLÝNDÝ'
END
ELSE

--VIEW
CREATE VIEW vwTakýmTakýmSezon 
AS
SELECT DISTINCT Takým_Ad AS TakýmAd,
      AttýðýGol_Say-YediðiGol_Say AS AVERAJ,
	  count(*) AS MaðlubiyetSayýsý,
	  count(*) AS GalibiyetSayýsý,
	  count(OynadýðýHafta_Say) AS OynadýðýHaftaSayýsý
FROM tblTakým AS T INNER JOIN tblTakýmSezon AS TS
ON T.ID=TS.TakýmID
GROUP BY Takým_Ad,AttýðýGol_Say,YediðiGol_Say
GO

--TEST
 SELECT * FROM vwTakýmTakýmSezon

 SELECT count(*) GalibiyetSayýsý
 FROM vwTakýmTakýmSezon
 ORDER BY GalibiyetSayýsý DESC
