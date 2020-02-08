--1) 
--KONTROL
 IF OBJECT_ID ('vTeknikD') IS NOT NULL
BEGIN
 DROP VIEW vTeknikD;
 PRINT 'S�L�ND�'
END
ELSE
 PRINT 'KAYIT YOK'

--VIEW:Teknik direkt�r ad�, teknikdirekt�r TCsi,teknik direkt�r�n tak�m ile s�zle�me tarihi, s�zle�meden bu zaman kadar ge�en zaman ,teknik direkt�r uyru�u ve 
--uyruklar�n harflerinin b�y�k  ve soldan 3 tanesi
CREATE VIEW dbo.vTeknikD AS
SELECT  TekDir_Ad,
       TD.TC ,
       YEAR(Bas_tar) AS S�zle�meBa�lang�c�, 
	   DATEDIFF(YEAR,Bas_tar,Bit_tar) AS �al��t���S�re,  
	   U.Uyruk_Ad AS Uyruk,
	   UPPER(U.Uyruk_Ad) AS UyrukK�saltma	   
 FROM tblTeknikDirekt�rTak�mS�zle�me TDTS INNER JOIN tblTeknikDirekt�r TD
 ON TDTS.TC=TD.TC INNER JOIN tblUyruk U
 ON TD.UyrukID=U.ID
 GO
 --TEST
 --1)Tak�mad�na g�re k���kten b�y��e gidiyor Tak�madlar�ndaki kurulustarihne g�re ise b�y�kten k����e do�ru s�ralan�yor
SELECT ROW_NUMBER() OVER(PARTITION BY Tak�m_Ad ORDER BY KurulusTar DESC) AS S�ra, 
       *, 
	   LEFT(UyrukK�saltma,3) AS UyrukK�saltma 
FROM vTeknikD AS TekD INNER JOIN tblTak�m AS T
 ON TekD.TC=T.TC
 ORDER BY KurulusTar DESC


 --2)Kurulu� Tarihi 19 ile ba�layan tak�mlar�n ad�,kurulu� tarihi ,futbolcuad�,Forma numaras�
SELECT   T.Tak�m_Ad AS Tak�mAd,
         T.KurulusTar AS Tak�mKurulu�Tarihi,
	    F.Futbolcu_Ad AS FutbolcuAd,
		F.Forma_Num AS FormaNumaras�
FROM vTeknikD AS TEKD INNER JOIN tblTak�m T
ON TekD.TC=T.TC INNER JOIN tblFutbolcuTak�m AS FT
ON FT.Tak�mID=T.ID INNER JOIN tblFutbolcu AS F
ON F.ID= FT.FutbolcuID
WHERE  KurulusTar LIKE '19%'




 
 --2) 
--KONTROL
 IF OBJECT_ID ('vWFutbolcuTak�mS�zle�meDetay') IS NOT NULL
BEGIN
 DROP VIEW vWFutbolcuTak�mS�zle�meDetay;
 PRINT 'S�L�ND�'
END
ELSE
 PRINT 'KAYIT YOK'

--VIEW: FutbolcuTak�mS�zle�me tablosunda futbolcuad�,tak�mad�, ve bu tak�m i�in s�zle�me yap�lan tarih ve 
--s�zle�menin bitti�i tarih ayr� s�tunlardad�r. Bunlar� birle�tirip S�zle�me Tarihini g�steren bir view 
CREATE VIEW vWFutbolcuTak�mS�zle�meDetay 
AS
SELECT FutbolcuID AS FutbolcuID, 
       Tak�m_Ad AS Tak�mAd, 
	   T.KurulusTar,
	   DATEDIFF(YEAR,Bas_tar,Bit_tar) AS S�zle�meTarihi 
FROM tblFutbolcuTak�mS�zle�me AS FTS INNER JOIN tblTak�m AS T
ON T.ID=FTS.Tak�mID
GO
--TEST
SELECT * FROM vWFutbolcuTak�mS�zle�meDetay

SELECT F.Futbolcu_Ad AS FutbolcuAd�,
       F.Forma_Num AS FormaNumaras�,
	   P.poz_Ad AS Pozisyon,
	   FTSD.KurulusTar,
	   FTSD.S�zle�meTarihi,
	   U.Uyruk_Ad
FROM vWFutbolcuTak�mS�zle�meDetay AS FTSD INNER JOIN tblFutbolcu AS F
ON FTSD.FutbolcuID = F.ID INNER JOIN tblPozisyon AS P
ON F.PozisyonID=p.ID INNER JOIN tblFutbolcu AS FT
ON FT.ID=p.ID INNER JOIN tblUyruk AS U
ON U.ID=FT.ID



---3)
------KONTROL
IF OBJECT_ID ('vWFutbolcuTak�mS�zle�meDetay2') IS NOT NULL
BEGIN
 DROP VIEW vWFutbolcuTak�mS�zle�meDetay2;
 PRINT 'S�L�ND�'
END
ELSE
 PRINT 'KAYIT YOK'
--FutbolcuTak�mS�zle�mede Futbolcu ismi ve tak�m ad� mevcut de�ildir.Bunun yerine ID de�erleri vard�r.
--Bu isimlerle beraber FutbolcuTak�mS�zle�meDetaylar�n� g�steren view
CREATE VIEW vWFutbolcuTak�mS�zle�meDetay2 AS
SELECT Futbolcu_Ad AS Futbolcu, 
       Tak�m_Ad AS Tak�m, 
	   DATEDIFF(YEAR,Bas_tar,Bit_tar) AS S�zle�meTarihi 
FROM tblFutbolcu F INNER JOIN tblTak�m T
ON F.Tak�mID=T.ID INNER JOIN tblFutbolcuTak�mS�zle�me FTS 
ON FTS.FutbolcuID=F.ID
GO
--TEST
SELECT * FROM vWFutbolcuTak�mS�zle�meDetay2


----

---4)
------KONTROL
IF OBJECT_ID ('vwTak�mTak�mSezon') IS NOT NULL
BEGIN
 DROP VIEW vwTak�mTak�mSezon;
 PRINT 'S�L�ND�'
END
ELSE

--VIEW
CREATE VIEW vwTak�mTak�mSezon 
AS
SELECT DISTINCT Tak�m_Ad AS Tak�mAd,
      Att���Gol_Say-Yedi�iGol_Say AS AVERAJ,
	  count(*) AS Ma�lubiyetSay�s�,
	  count(*) AS GalibiyetSay�s�,
	  count(Oynad���Hafta_Say) AS Oynad���HaftaSay�s�
FROM tblTak�m AS T INNER JOIN tblTak�mSezon AS TS
ON T.ID=TS.Tak�mID
GROUP BY Tak�m_Ad,Att���Gol_Say,Yedi�iGol_Say
GO

--TEST
 SELECT * FROM vwTak�mTak�mSezon

 SELECT count(*) GalibiyetSay�s�
 FROM vwTak�mTak�mSezon
 ORDER BY GalibiyetSay�s� DESC
