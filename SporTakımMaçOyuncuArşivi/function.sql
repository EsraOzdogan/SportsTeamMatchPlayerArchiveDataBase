--1)
 --KONTROL 
 IF OBJECT_ID('TeknikDirekt�rBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirekt�rBilgi;
	PRINT 'S�L�ND�'
  END
ELSE
 PRINT 'KAYIT YOK'


 --FONKS�YON:Kar��la�mada kazanan tak�m
ALTER FUNCTION kazananTak�m(@misafir INT,@evsahibi INT)
RETURNS VARCHAR(50)
 AS
  BEGIN
   DECLARE @kazanan VARCHAR(50);
   IF @misafir = @evsahibi
   SET @kazanan= 'BERABERE'
   ELSE IF   @misafir > @evsahibi
   SET @kazanan='M�SAF�R KAZANDI !'
   ELSE
   SET @kazanan='EV SAH�B� KAZANDI!'
   RETURN @kazanan
 END

 --TEST
 print dbo.kazananTak�m(1,3)
 SELECT dbo.kazananTak�m(MisafirTak�mSkor,EvSahibiTak�mSkor) AS Kazanan, MisafirTak�mSkor,EvSahibiTak�mSkor,MisafirTak�mID,EvSahibiTak�mID  FROM dbo.tblMa�
 SELECT dbo.kazananTak�m(MisafirTak�mSkor,EvSahibiTak�mSkor) AS Kazanan, MisafirTak�mSkor,EvSahibiTak�mSkor,MisafirTak�mID,EvSahibiTak�mID ,T.Tak�m_Ad
 FROM dbo.tblMa� AS M
 INNER JOIN tblTak�m AS T
 ON T.ID=M.EvSahibiTak�mID AND T.ID=MisafirTak�mID



  ----

 --2) 
 --futbolcuOynad���Tak�mPozisyonUyruk fonksiyonu var m� varsa silmek i�in kod 
IF OBJECT_ID('futbolcuOynad���Tak�mPozisyonUyruk') IS NOT NULL
  BEGIN 
    DROP FUNCTION futbolcuOynad���Tak�mPozisyonUyruk;
	PRINT 'S�L�ND�'
  END
ELSE
 PRINT 'KAYIT YOK'

 --FONKS�YON:FutbolcuIDsi verilen futbolcununoynad��� tak�m�n ad�,Uyru�u,ma�ta oynad��� pozisyonu ve futbolcunun forma numaras�n� veren fonksiyon
ALTER FUNCTION futbolcuOynad���Tak�mPozisyonUyruk(@futbolcuID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.ID, 
         T.Tak�m_Ad,
		 U.Uyruk_Ad,
		 P.poz_Ad,
		 F.Forma_Num
  FROM tblFutbolcu F INNER JOIN tblTak�m T 
  ON F.Tak�mID=T.ID INNER JOIN tblPozisyon P
  ON F.PozisyonID=P.ID INNER JOIN tblUyruk u
  ON F.UyrukID=U.ID
  WHERE F.ID=@futbolcuID)

--TEST
  Select * From futbolcuOynad���Tak�mPozisyonUyruk(5)
  Go




 -- 3)
 --KONTROL 
 IF OBJECT_ID('olayFutbolcuTak�mSezon') IS NOT NULL
  BEGIN 
    DROP FUNCTION olayFutbolcuTak�mSezon;
	PRINT 'S�L�ND�'
  END
ELSE
 PRINT 'KAYIT YOK'
  
 --FONKS�YON : Sezonda ya�anan olayID'sine g�re olay� ger�ekle�tiren futbolcunun forma numaras�,futbolcunun ad�,olay�n ger�ekle�ti�i sezonun ad�, 
 --bu sezonda kazanan tak�m�n ad�,bu sezondaki tak�m�n teknikdirekt�r�n�n ad� ve teknikdirekt�r�n uyru�u
ALTER FUNCTION olayFutbolcuTak�mSezon(@olayID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.Forma_Num AS FutbolcuFormaNumaras�,
         F.Futbolcu_Ad AS Futbolcu,
         S.Sezon_Ad AS SezonAd,
		 T.Tak�m_Ad AS SezondaKazananTak�m,
         TD.TekDir_Ad AS TeknikDirekt�r,
		 U.Uyruk_Ad AS TeknikDirekt�rUyruk
  FROM tblFutbolcu AS F INNER JOIN tblSezonOlay AS SO
  ON F.ID=SO.FutbolcuID INNER JOIN tblSezon AS S
  ON S.ID=SO.SezonID INNER JOIN tblTak�m AS T
  ON S.Tak�mID=T.ID INNER JOIN tblTeknikDirekt�r AS TD
  ON T.TC=TD.TC INNER JOIN tblUyruk AS U
  ON TD.UyrukID=U.ID
  WHERE OlayID=@olayID)
  go


  --TEST
  Select *From olayFutbolcuTak�mSezon(5) 
  Select *,SUBSTRING(TeknikDirekt�rUyruk,0,3) AS K�saltma From olayFutbolcuTak�mSezon(5) 


  --
  --4)
 
 --KONTROL 
 IF OBJECT_ID('TeknikDirekt�rBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirekt�rBilgi;
	PRINT 'S�L�ND�'
  END
ELSE
 PRINT 'KAYIT YOK'

 --FONKS�YON:ismi verilen teknik direkt�r�n tak�mla s�zle�me yapt��� tarih
 ALTER FUNCTION TeknikDirekt�rBilgi(@tekdirAD VARCHAR(50))
 RETURNS INT
 AS
   BEGIN 
     DECLARE @yil AS INT;
	 SELECT @yil=YEAR(Bas_tar) FROM tblTeknikDirekt�rTak�mS�zle�me TDTS INNER JOIN tblTeknikDirekt�r TD
	 ON TDTS.TC=TD.TC 
	 WHERE TekDir_Ad=@tekdirAD
	RETURN @yil
   END
   GO

  --TEST
 print dbo.TeknikDirekt�rBilgi('Laurent Blanc')
SELECT  TekDir_Ad, dbo.TeknikDirekt�rBilgi('Laurent Blanc') AS S�zle�meTarihi,* From tblTeknikDirekt�rTak�mS�zle�me TDTS INNER JOIN tblTeknikDirekt�r TD ON TDTS.TC=TD.TC  



--
  --5)
 
 --KONTROL 
 IF OBJECT_ID('TeknikDirekt�rBilgi') IS NOT NULL
  BEGIN 
    DROP FUNCTION TeknikDirekt�rBilgi;
	PRINT 'S�L�ND�'
  END
ELSE
 PRINT 'KAYIT YOK'
--FONKS�YON :Uyrugu verilen teknik direkt�r�n tak�mla s�zle�me yapt��� tarih
 ALTER FUNCTION TeknikDirekt�rBilgiID(@UyrukID INT)
 RETURNS INT
 AS
   BEGIN 
     DECLARE @yil AS INT;
	 SELECT @yil=YEAR(Bas_tar) FROM tblTeknikDirekt�rTak�mS�zle�me TDTS INNER JOIN tblTeknikDirekt�r TD
	 ON TDTS.TC=TD.TC INNER JOIN tblUyruk U
	 ON TD.UyrukID=U.ID
	 WHERE UyrukID=@UyrukID
	RETURN @yil
   END
   --TEST
    print dbo.TeknikDirekt�rBilgi('2')
   SELECT  TOP 1 TekDir_Ad, dbo.TeknikDirekt�rBilgiID('2') AS  S�zle�meTarihi From tblTeknikDirekt�rTak�mS�zle�me TDTS INNER JOIN tblTeknikDirekt�r TD ON TDTS.TC=TD.TC  

 --6)

 
--FutbolcuOynad���Tak�m fonksiyonu var m� varsa silmek i�in kod 
IF OBJECT_ID('FutbolcuOynad���Tak�m') IS NOT NULL
  BEGIN 
    DROP FUNCTION FutbolcuOynad���Tak�m;
	PRINT 'S�L�ND�'
  END
ELSE
 PRINT 'KAYIT YOK'

--FONKS�YON:FutbolcuID'si verilen futbolcunun oynad��� tak�m� g�steren fonksiyon
ALTER FUNCTION futbolcuOynad���Tak�m(@futbolcuID int)
RETURNS TABLE
AS
RETURN(
  SELECT F.ID,
         T.Tak�m_Ad
  FROM tblFutbolcu F INNER JOIN tblTak�m T
  ON F.ID=T.ID
  WHERE F.ID=@futbolcuID)

  --TEST
  Select * From futbolcuOynad���Tak�m(9)



