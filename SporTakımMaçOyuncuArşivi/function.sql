--1)
 --KONTROL 
 IF OBJECT_ID('TeknikDirektörBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirektörBilgi;
	PRINT 'SİLİNDİ'
  END
ELSE
 PRINT 'KAYIT YOK'


 --FONKSİYON:Karşılaşmada kazanan takım
ALTER FUNCTION kazananTakım(@misafir INT,@evsahibi INT)
RETURNS VARCHAR(50)
 AS
  BEGIN
   DECLARE @kazanan VARCHAR(50);
   IF @misafir = @evsahibi
   SET @kazanan= 'BERABERE'
   ELSE IF   @misafir > @evsahibi
   SET @kazanan='MİSAFİR KAZANDI !'
   ELSE
   SET @kazanan='EV SAHİBİ KAZANDI!'
   RETURN @kazanan
 END

 --TEST
 print dbo.kazananTakım(1,3)
 SELECT dbo.kazananTakım(MisafirTakımSkor,EvSahibiTakımSkor) AS Kazanan, MisafirTakımSkor,EvSahibiTakımSkor,MisafirTakımID,EvSahibiTakımID  FROM dbo.tblMaç
 SELECT dbo.kazananTakım(MisafirTakımSkor,EvSahibiTakımSkor) AS Kazanan, MisafirTakımSkor,EvSahibiTakımSkor,MisafirTakımID,EvSahibiTakımID ,T.Takım_Ad
 FROM dbo.tblMaç AS M
 INNER JOIN tblTakım AS T
 ON T.ID=M.EvSahibiTakımID AND T.ID=MisafirTakımID



  ----

 --2) 
 --futbolcuOynadığıTakımPozisyonUyruk fonksiyonu var mı varsa silmek için kod 
IF OBJECT_ID('futbolcuOynadığıTakımPozisyonUyruk') IS NOT NULL
  BEGIN 
    DROP FUNCTION futbolcuOynadığıTakımPozisyonUyruk;
	PRINT 'SİLİNDİ'
  END
ELSE
 PRINT 'KAYIT YOK'

 --FONKSİYON:FutbolcuIDsi verilen futbolcununoynadığı takımın adı,Uyruğu,maçta oynadığı pozisyonu ve futbolcunun forma numarasını veren fonksiyon
ALTER FUNCTION futbolcuOynadığıTakımPozisyonUyruk(@futbolcuID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.ID, 
         T.Takım_Ad,
		 U.Uyruk_Ad,
		 P.poz_Ad,
		 F.Forma_Num
  FROM tblFutbolcu F INNER JOIN tblTakım T 
  ON F.TakımID=T.ID INNER JOIN tblPozisyon P
  ON F.PozisyonID=P.ID INNER JOIN tblUyruk u
  ON F.UyrukID=U.ID
  WHERE F.ID=@futbolcuID)

--TEST
  Select * From futbolcuOynadığıTakımPozisyonUyruk(5)
  Go




 -- 3)
 --KONTROL 
 IF OBJECT_ID('olayFutbolcuTakımSezon') IS NOT NULL
  BEGIN 
    DROP FUNCTION olayFutbolcuTakımSezon;
	PRINT 'SİLİNDİ'
  END
ELSE
 PRINT 'KAYIT YOK'
  
 --FONKSİYON : Sezonda yaşanan olayID'sine göre olayı gerçekleştiren futbolcunun forma numarası,futbolcunun adı,olayın gerçekleştiği sezonun adı, 
 --bu sezonda kazanan takımın adı,bu sezondaki takımın teknikdirektörünün adı ve teknikdirektörün uyruğu
ALTER FUNCTION olayFutbolcuTakımSezon(@olayID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.Forma_Num AS FutbolcuFormaNumarası,
         F.Futbolcu_Ad AS Futbolcu,
         S.Sezon_Ad AS SezonAd,
		 T.Takım_Ad AS SezondaKazananTakım,
         TD.TekDir_Ad AS TeknikDirektör,
		 U.Uyruk_Ad AS TeknikDirektörUyruk
  FROM tblFutbolcu AS F INNER JOIN tblSezonOlay AS SO
  ON F.ID=SO.FutbolcuID INNER JOIN tblSezon AS S
  ON S.ID=SO.SezonID INNER JOIN tblTakım AS T
  ON S.TakımID=T.ID INNER JOIN tblTeknikDirektör AS TD
  ON T.TC=TD.TC INNER JOIN tblUyruk AS U
  ON TD.UyrukID=U.ID
  WHERE OlayID=@olayID)
  go


  --TEST
  Select *From olayFutbolcuTakımSezon(5) 
  Select *,SUBSTRING(TeknikDirektörUyruk,0,3) AS Kısaltma From olayFutbolcuTakımSezon(5) 


  --
  --4)
 
 --KONTROL 
 IF OBJECT_ID('TeknikDirektörBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirektörBilgi;
	PRINT 'SİLİNDİ'
  END
ELSE
 PRINT 'KAYIT YOK'

 --FONKSİYON:ismi verilen teknik direktörün takımla sözleşme yaptığı tarih
 ALTER FUNCTION TeknikDirektörBilgi(@tekdirAD VARCHAR(50))
 RETURNS INT
 AS
   BEGIN 
     DECLARE @yil AS INT;
	 SELECT @yil=YEAR(Bas_tar) FROM tblTeknikDirektörTakımSözleşme TDTS INNER JOIN tblTeknikDirektör TD
	 ON TDTS.TC=TD.TC 
	 WHERE TekDir_Ad=@tekdirAD
	RETURN @yil
   END
   GO

  --TEST
 print dbo.TeknikDirektörBilgi('Laurent Blanc')
SELECT  TekDir_Ad, dbo.TeknikDirektörBilgi('Laurent Blanc') AS SözleşmeTarihi,* From tblTeknikDirektörTakımSözleşme TDTS INNER JOIN tblTeknikDirektör TD ON TDTS.TC=TD.TC  



--
  --5)
 
 --KONTROL 
 IF OBJECT_ID('TeknikDirektörBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirektörBilgi;
	PRINT 'SİLİNDİ'
  END
ELSE
 PRINT 'KAYIT YOK'
--FONKSİYON :Uyrugu verilen teknik direktörün takımla sözleşme yaptığı tarih
 ALTER FUNCTION TeknikDirektörBilgiID(@UyrukID INT)
 RETURNS INT
 AS
   BEGIN 
     DECLARE @yil AS INT;
	 SELECT @yil=YEAR(Bas_tar) FROM tblTeknikDirektörTakımSözleşme TDTS INNER JOIN tblTeknikDirektör TD
	 ON TDTS.TC=TD.TC INNER JOIN tblUyruk U
	 ON TD.UyrukID=U.ID
	 WHERE UyrukID=@UyrukID
	RETURN @yil
   END
   --TEST
    print dbo.TeknikDirektörBilgi('2')
   SELECT  TOP 1 TekDir_Ad, dbo.TeknikDirektörBilgiID('2') AS  SözleşmeTarihi From tblTeknikDirektörTakımSözleşme TDTS INNER JOIN tblTeknikDirektör TD ON TDTS.TC=TD.TC  

 --6)

 
--FutbolcuOynadığıTakım fonksiyonu var mı varsa silmek için kod 
IF OBJECT_ID('FutbolcuOynadığıTakım') IS NOT NULL
  BEGIN 
    DROP FUNCTION FutbolcuOynadığıTakım;
	PRINT 'SİLİNDİ'
  END
ELSE
 PRINT 'KAYIT YOK'

--FONKSİYON:FutbolcuID'si verilen futbolcunun oynadığı takımı gösteren fonksiyon
ALTER FUNCTION futbolcuOynadığıTakım(@futbolcuID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.ID,
         T.Takım_Ad
  FROM tblFutbolcu F INNER JOIN tblTakım T
  ON F.ID=T.ID
  WHERE F.ID=@futbolcuID)

  --TEST
  Select * From futbolcuOynadığıTakım(9)



