
--1)INSERT SP(SP1)
----KONTROL
IF OBJECT_ID('SP1') IS NOT NULL
  DROP TABLE SP1
GO

--SP1 tablosu
CREATE TABLE SP1(
   id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   tarih_saat DATETIME,
   islem VARCHAR(10) NOT NULL,
   yeni_deger VARCHAR(10),
   eski_deger VARCHAR(10),
)
GO
--Baþlangýç test
SELECT * FROM tblIl--il tablosuna eklenmemiþ hali
SELECT * FROM SP1 --içinde veri olmayan SP1


INSERT INTO tblIl
VALUES(69,'Bayburt')

INSERT INTO tblIl
 OUTPUT GETDATE(), 'INSERT', INSERTED.Ad,NULL 
 INTO SP1
VALUES(69,'Bayburt')
GO

--TEST
SELECT * FROM tblIl
SELECT * FROM SP1
GO 
WAITFOR DELAY '00:00:05'
GO




--2)UPDATE SP(SP2)
----KONTROL

IF OBJECT_ID('SP2') IS NOT NULL
  DROP TABLE SP2
GO


CREATE TABLE SP2(
   id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   tarih_saat DATETIME,
   islem VARCHAR(10) NOT NULL,
   yeni_deger VARCHAR(10),
   eski_deger VARCHAR(10),
)
GO
--Baþlangýç test
SELECT * FROM tblIl--Güncellenmeden öncekii il tablosu
SELECT * FROM SP2 --Güncellenme eklenmemiþ SP2 tablosu

UPDATE tblIl 
SET Ad='RÝZE'
  OUTPUT GETDATE(), 'UPDATE' , INSERTED.Ad , DELETED.Ad 
INTO SP2
WHERE Kod=69
GO

--TEST
SELECT * FROM tblIl
SELECT * FROM SP2
GO 
WAITFOR DELAY '00:00:05'
GO





--3) DELETE SP(SP3)
--KONTROL
IF OBJECT_ID('SP3') IS NOT NULL
  DROP TABLE SP2
GO


CREATE TABLE SP3(
     id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   tarih_saat DATETIME,
   islem VARCHAR(10) NOT NULL,
   yeni_deger VARCHAR(10),
   eski_deger VARCHAR(10),
)
GO

--Baþlangýç test
SELECT * FROM tblIl
SELECT * FROM SP3

DELETE FROM  tblIl 
  OUTPUT GETDATE() , 'DELETE', NULL ,DELETED.Ad
INTO SP3
WHERE Kod=69
GO
--TEST
SELECT * FROM tblIl
SELECT * FROM SP3
GO

--KONTROL
IF OBJECT_ID('Futbolcu_cursor') IS NOT NULL
  DROP TABLE Futbolcu_cursor
GO

--Futbolcu Forma Numarasý ve AdSoyadýný getiren cursor
DECLARE @FormaNum INT
DECLARE @AdSoyad VARCHAR (50)
DECLARE Futbolcu_cursor CURSOR FOR SELECT Forma_Num,Futbolcu_Ad FROM tblFutbolcu

OPEN  Futbolcu_cursor
FETCH NEXT FROM Futbolcu_cursor INTO @FormaNum,@AdSoyad
WHILE @@FETCH_STATUS=0
BEGIN
	PRINT CONVERT(VARCHAR,@FormaNum)+ '-' +  @AdSoyad
	FETCH NEXT FROM Futbolcu_cursor INTO @FormaNum,@AdSoyad
END

CLOSE Futbolcu_cursor
DEALLOCATE Futbolcu_cursor
SELECT Takým_Ad ,KurulusTar FROM tblTakým
-----

--KONTROL
IF OBJECT_ID('Maç_cursor') IS NOT NULL
  DROP TABLE Maç_cursor
GO

---------Maç sayýsý, tarihi ,saati, haftasý ve kýrmýzý kart sayýsýný veren cursor
DECLARE Maç_cursor CURSOR FOR
SELECT MacSayýsý, Tarih, Saat, Hafta,KýrmzýKartSayýsý FROM tblMaç

DECLARE @macs INT;
DECLARE @tarih DATETIME;
DECLARE @saat TIME;
DECLARE @hafta INT;
DECLARE @kkartsayýsý INT;
DECLARE Maç_cursor CURSOR FOR
SELECT MacSayýsý, Tarih, Saat, Hafta,KýrmzýKartSayýsý FROM tblMaç

OPEN Maç_cursor;
FETCH NEXT FROM Maç_cursor INTO @macs,@tarih,@saat,@hafta,@kkartsayýsý
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT  CONVERT(VARCHAR,@macs)+ '-' + CONVERT(VARCHAR,@tarih)+ '-' + CONVERT(VARCHAR,@saat)+ '-'  + CONVERT(VARCHAR,@hafta)+ '-'  +CONVERT(VARCHAR,@kkartsayýsý) 
FETCH NEXT FROM Maç_cursor INTO  @macs,@tarih,@saat,@hafta,@kkartsayýsý
END;
CLOSE Maç_cursor;
DEALLOCATE Maç_cursor;



--
--KONTROL
IF OBJECT_ID('Stadyum_cursor') IS NOT NULL
  DROP TABLE Stadyum_cursor
GO

--UPDATE CURSOR
--Stadyum
DECLARE @Dahili VARCHAR(50)
DECLARE @StadyumAd VARCHAR(50)

DECLARE Stadyum_cursor CURSOR FOR SELECT Stadyum_Ad , IlceID FROM tblStadyum
FOR UPDATE OF IlceID

OPEN Stadyum_cursor 
FETCH NEXT FROM Stadyum_cursor INTO @StadyumAd,@Dahili
WHILE @@FETCH_STATUS=0
BEGIN
	UPDATE tblStadyum SET IlceID= LEFT(IlceID,10)
	PRINT @StadyumAd+ ' '+@Dahili
	FETCH NEXT FROM Stadyum_cursor INTO @StadyumAd,@Dahili
END

CLOSE Stadyum_cursor
DEALLOCATE Stadyum_cursor

--TEST
SELECT Stadyum_Ad , ID FROM tblStadyum














--SELECT SP
--Bir sezondaki ortalama puan veya bir maçtaki ortalama kýrmýzý kart sayýsý




CREATE PROCEDURE SezonPuanMaçKýrmýzýKart (@yil AS INT,@Sorgu AS INT=1) AS
SET NOCOUNT ON
IF(@Sorgu=1)
   BEGIN
     SELECT AVG(Puan) AS puan,
	        S.Sezon_Ad,
			T.Takým_Ad
	 FROM tblSezon AS S INNER JOIN tblTakýmSezon AS TS
	 ON S.TakýmID=TS.TakýmID INNER JOIN tblTakým T 
	 ON T.ID=TS.TakýmID
	 WHERE Yýl1 =@yil
	 GROUP BY Puan
  END
ELSE IF(@Sorgu=2)
    BEGIN 
		SELECT count(KýrmzýKartSayýsý) AS KýrmýzýKartSayýsý
		FROM tblMaç
		WHERE Tarih=@yil
		GROUP BY KýrmzýKartSayýsý 
		ORDER BY KýrmýzýKartSayýsý DESC
    END
SET NOCOUNT OFF
GO
--TEST
EXEC SezonPuanMaçKýrmýzýKart 1930,2


---SELECT SP
--KONTROL
IF OBJECT_ID('spFutbolcuListesi') ID NOT NULL
  DROP PROCEDURE spFutbolcuListesi
GO

---KOD
CREATE PROCEDURE spFutbolcuListesi(@FutbolcuAd VARCHAR(25)=NULL,@FormaID VARCHAR (10)= NULL,@Bool AS VARCHAR (3)=NULL) AS

DECLARE @sqlsorgusu NVARCHAR(2000)='SELECT * FROM tblFutbolcu'
DECLARE @sayac INT=0

IF @FutbolcuAd IS NOT NULL OR @FormaID IS NOT NULL
 SET @sqlsorgusu+='WHERE'

 IF @FutbolcuAd IS NOT NULL
   BEGIN
      SET @sqlsorgusu+= 'Futbolcu_Ad='''+@FutbolcuAd+''' '
	  SET @sayac+=1
   END

IF @FormaID IS NOT NULL
   BEGIN
      IF @sayac=0
		  SET @sqlsorgusu+= 'Forma_Num='''+@FormaID+''' '
     ELSE 
	   SET @sqlsorgusu+=@bool+'Forma_Num='''+@FormaID+''' '
	 SET @sayac+=1
   END

EXEC sp_executesql @sqlsorgusu
GO


--TEST
EXEC spFutbolcuListesi
EXEC spFutbolcuListesi 'NULL','2'
EXEC spFutbolcuListesi 'David de Gea','6'
















--ÖRNEKLER

IF OBJECT_ID('spTumFutbolcular') IS NOT NULL
  BEGIN 
     DROP PROCEDURE spTumFutbolcular
  END 
GO

ALTER PROCEDURE spTumFutbolcular AS
SELECT * FROM tblFutbolcu
GO
--Test
spTumFutbolcular
EXEC spTumFutbolcular
---
IF OBJECT_ID ('spFutbolcular') IS NOT NULL
BEGIN
DROP PROCEDURE spFutbolcular
END
GO
ALTER PROCEDURE spFutbolcular(@futbolcu_id AS NVARCHAR(20) = NULL)
AS
SELECT * FROM tblFutbolcu WHERE ID=ISNULL(@futbolcu_id,ID)
GO
EXEC spFutbolcular -- Parametre verilmediðinden tüm müþteriler listelenecek
EXEC spFutbolcular '1' -- Sadece KEPA kodlu müþteri listelenecek

-----2parametreli

IF OBJECT_ID ('spFutbolcu') IS NOT NULL
BEGIN
DROP PROCEDURE spFutbolcu
END
GO
CREATE PROCEDURE spFutbolcu(@futbolcu_id AS NVARCHAR(20) = NULL, @futbolcu_ad AS NVARCHAR(100) = NULL)
AS
SELECT * FROM tblFutbolcu WHERE ID=ISNULL(@futbolcu_id,ID) AND Futbolcu_Ad LIKE '%' + ISNULL(@futbolcu_ad,Futbolcu_Ad)+ '%'
GO
EXEC spFutbolcu -- Parametre verilmediðinden tüm müþteriler listelenecek
EXEC spFutbolcu '1','Kepa' -- Sadece KEPA kodlu müþteri listelenecek Kesiþimi yok


----OUTPUTLU

IF OBJECT_ID ('spFutbolcu2') IS NOT NULL
BEGIN
DROP PROCEDURE spFutbolcu2
END
GO
ALTER PROCEDURE spFutbolcu2(@futbolcu_id AS NVARCHAR(20) = NULL, @futbolcu_ad AS NVARCHAR(100) = NULL,@SatirSayisi INT OUTPUT)
AS
SELECT * FROM tblFutbolcu WHERE ID=ISNULL(@futbolcu_id,ID) AND Futbolcu_Ad LIKE '%' + ISNULL(@futbolcu_ad,Futbolcu_Ad)+ '%'
SELECT @SatirSayisi=@@ROWCOUNT
GO
DECLARE @c INT
EXEC spFutbolcu2 '1','Kepa',@c OUTPUT
SELECT @c



----WITH RESULT SETS
CREATE PROCEDURE spWithResultSet AS
   SELECT Futbolcu_Ad,Forma_Num FROM tblFutbolcu
   SELECT  Olay_Ad FROM tblOlay
EXEC spWithResultSet WITH RESULT SETS
(
   (AD VARCHAR(50),FORMANUMARA INT),
   (OLAYAD VARCHAR(25))

)

--INSERT SP 
ALTER PROCEDURE spFutbolcuInsert AS
SELECT Futbolcu_Ad,Forma_Num FROM tblFutbolcu
GO
DECLARE @Sonuclar TABLE ( AD VARCHAR(50), FormaNumarasý INT )
INSERT INTO @Sonuclar EXEC spFutbolcuInsert
SELECT * FROM @Sonuclar


   









--TRANSACTION EXAMPLE (transaction birden fazla iþlemi yapan þeydir)
insert into tblIl VALUES (69,'Bayburt')  /*5i ekleme*/
delete from tblIl WHERE Kod=69 /*silme*/
select * from tblIl  /*tabloyu çalýþtýrma*/



 --CURSOR
declare region_cusor cursor
    SCROLL
	for select Kod, Ad from tblIl

declare @kod int
declare @ad varchar(255)
open region_cursor
   fetch last from region_cursor into @kod , @ad
   while(@@FETCH_STATUS=0)
   begin 
     print Cast(@kod as varchar(10)) + '-'+ @ad
	 fetch prior from region_cursor into @kod, @ad
  end
close region_cursor
deallocate region_cursor

select* from tblIl