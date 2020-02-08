--1)
 --KONTROL 
 IF OBJECT_ID('TeknikDirektörBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirektörBilgi;
	PRINT 'SÝLÝNDÝ'
  END
ELSE
 PRINT 'KAYIT YOK'


 --FONKSÝYON:Karþýlaþmada kazanan takým
ALTER FUNCTION kazananTakým(@misafir INT,@evsahibi INT)
RETURNS VARCHAR(50)
 AS
  BEGIN
   DECLARE @kazanan VARCHAR(50);
   IF @misafir = @evsahibi
   SET @kazanan= 'BERABERE'
   ELSE IF   @misafir > @evsahibi
   SET @kazanan='MÝSAFÝR KAZANDI !'
   ELSE
   SET @kazanan='EV SAHÝBÝ KAZANDI!'
   RETURN @kazanan
 END

 --TEST
 print dbo.kazananTakým(1,3)
 SELECT dbo.kazananTakým(MisafirTakýmSkor,EvSahibiTakýmSkor) AS Kazanan, MisafirTakýmSkor,EvSahibiTakýmSkor,MisafirTakýmID,EvSahibiTakýmID  FROM dbo.tblMaç
 SELECT dbo.kazananTakým(MisafirTakýmSkor,EvSahibiTakýmSkor) AS Kazanan, MisafirTakýmSkor,EvSahibiTakýmSkor,MisafirTakýmID,EvSahibiTakýmID ,T.Takým_Ad
 FROM dbo.tblMaç AS M
 INNER JOIN tblTakým AS T
 ON T.ID=M.EvSahibiTakýmID AND T.ID=MisafirTakýmID



  ----

 --2) 
 --futbolcuOynadýðýTakýmPozisyonUyruk fonksiyonu var mý varsa silmek için kod 
IF OBJECT_ID('futbolcuOynadýðýTakýmPozisyonUyruk') IS NOT NULL
  BEGIN 
    DROP FUNCTION futbolcuOynadýðýTakýmPozisyonUyruk;
	PRINT 'SÝLÝNDÝ'
  END
ELSE
 PRINT 'KAYIT YOK'

 --FONKSÝYON:FutbolcuIDsi verilen futbolcununoynadýðý takýmýn adý,Uyruðu,maçta oynadýðý pozisyonu ve futbolcunun forma numarasýný veren fonksiyon
ALTER FUNCTION futbolcuOynadýðýTakýmPozisyonUyruk(@futbolcuID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.ID, 
         T.Takým_Ad,
		 U.Uyruk_Ad,
		 P.poz_Ad,
		 F.Forma_Num
  FROM tblFutbolcu F INNER JOIN tblTakým T 
  ON F.TakýmID=T.ID INNER JOIN tblPozisyon P
  ON F.PozisyonID=P.ID INNER JOIN tblUyruk u
  ON F.UyrukID=U.ID
  WHERE F.ID=@futbolcuID)

--TEST
  Select * From futbolcuOynadýðýTakýmPozisyonUyruk(5)
  Go




 -- 3)
 --KONTROL 
 IF OBJECT_ID('olayFutbolcuTakýmSezon') IS NOT NULL
  BEGIN 
    DROP FUNCTION olayFutbolcuTakýmSezon;
	PRINT 'SÝLÝNDÝ'
  END
ELSE
 PRINT 'KAYIT YOK'
  
 --FONKSÝYON : Sezonda yaþanan olayID'sine göre olayý gerçekleþtiren futbolcunun forma numarasý,futbolcunun adý,olayýn gerçekleþtiði sezonun adý, 
 --bu sezonda kazanan takýmýn adý,bu sezondaki takýmýn teknikdirektörünün adý ve teknikdirektörün uyruðu
ALTER FUNCTION olayFutbolcuTakýmSezon(@olayID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.Forma_Num AS FutbolcuFormaNumarasý,
         F.Futbolcu_Ad AS Futbolcu,
         S.Sezon_Ad AS SezonAd,
		 T.Takým_Ad AS SezondaKazananTakým,
         TD.TekDir_Ad AS TeknikDirektör,
		 U.Uyruk_Ad AS TeknikDirektörUyruk
  FROM tblFutbolcu AS F INNER JOIN tblSezonOlay AS SO
  ON F.ID=SO.FutbolcuID INNER JOIN tblSezon AS S
  ON S.ID=SO.SezonID INNER JOIN tblTakým AS T
  ON S.TakýmID=T.ID INNER JOIN tblTeknikDirektör AS TD
  ON T.TC=TD.TC INNER JOIN tblUyruk AS U
  ON TD.UyrukID=U.ID
  WHERE OlayID=@olayID)
  go


  --TEST
  Select *From olayFutbolcuTakýmSezon(5) 
  Select *,SUBSTRING(TeknikDirektörUyruk,0,3) AS Kýsaltma From olayFutbolcuTakýmSezon(5) 


  --
  --4)
 
 --KONTROL 
 IF OBJECT_ID('TeknikDirektörBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirektörBilgi;
	PRINT 'SÝLÝNDÝ'
  END
ELSE
 PRINT 'KAYIT YOK'

 --FONKSÝYON:ismi verilen teknik direktörün takýmla sözleþme yaptýðý tarih
 ALTER FUNCTION TeknikDirektörBilgi(@tekdirAD VARCHAR(50))
 RETURNS INT
 AS
   BEGIN 
     DECLARE @yil AS INT;
	 SELECT @yil=YEAR(Bas_tar) FROM tblTeknikDirektörTakýmSözleþme TDTS INNER JOIN tblTeknikDirektör TD
	 ON TDTS.TC=TD.TC 
	 WHERE TekDir_Ad=@tekdirAD
	RETURN @yil
   END
   GO

  --TEST
 print dbo.TeknikDirektörBilgi('Laurent Blanc')
SELECT  TekDir_Ad, dbo.TeknikDirektörBilgi('Laurent Blanc') AS SözleþmeTarihi,* From tblTeknikDirektörTakýmSözleþme TDTS INNER JOIN tblTeknikDirektör TD ON TDTS.TC=TD.TC  



--
  --5)
 
 --KONTROL 
 IF OBJECT_ID('TeknikDirektörBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirektörBilgi;
	PRINT 'SÝLÝNDÝ'
  END
ELSE
 PRINT 'KAYIT YOK'
--FONKSÝYON :Uyrugu verilen teknik direktörün takýmla sözleþme yaptýðý tarih
 ALTER FUNCTION TeknikDirektörBilgiID(@UyrukID INT)
 RETURNS INT
 AS
   BEGIN 
     DECLARE @yil AS INT;
	 SELECT @yil=YEAR(Bas_tar) FROM tblTeknikDirektörTakýmSözleþme TDTS INNER JOIN tblTeknikDirektör TD
	 ON TDTS.TC=TD.TC INNER JOIN tblUyruk U
	 ON TD.UyrukID=U.ID
	 WHERE UyrukID=@UyrukID
	RETURN @yil
   END
   --TEST
    print dbo.TeknikDirektörBilgi('2')
   SELECT  TOP 1 TekDir_Ad, dbo.TeknikDirektörBilgiID('2') AS  SözleþmeTarihi From tblTeknikDirektörTakýmSözleþme TDTS INNER JOIN tblTeknikDirektör TD ON TDTS.TC=TD.TC  

 --6)

 
--FutbolcuOynadýðýTakým fonksiyonu var mý varsa silmek için kod 
IF OBJECT_ID('FutbolcuOynadýðýTakým') IS NOT NULL
  BEGIN 
    DROP FUNCTION FutbolcuOynadýðýTakým;
	PRINT 'SÝLÝNDÝ'
  END
ELSE
 PRINT 'KAYIT YOK'

--FONKSÝYON:FutbolcuID'si verilen futbolcunun oynadýðý takýmý gösteren fonksiyon
ALTER FUNCTION futbolcuOynadýðýTakým(@futbolcuID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.ID,
         T.Takým_Ad
  FROM tblFutbolcu F INNER JOIN tblTakým T
  ON F.ID=T.ID
  WHERE F.ID=@futbolcuID)

  --TEST
  Select * From futbolcuOynadýðýTakým(9)



