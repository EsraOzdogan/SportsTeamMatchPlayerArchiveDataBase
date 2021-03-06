
 ---TRANSACTION INSERT 
   SELECT COUNT(*) AS TransactionÖncesi FROM tblIl
   DECLARE @hata INT

   BEGIN TRANSACTION

   INSERT tblIl VALUES (69,'Bayburt')
   SET  @hata=@@ERROR
   IF @hata<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) TransactionOrtası ,@hata AS HataKodu FROM tblIl
   


   INSERT tblIl VALUES (69,'Bayburt')
   SET  @hata=@@ERROR
   IF @hata<>0 GOTO Hata_Duzeltme
   COMMIT

   Hata_Duzeltme:
   SELECT @@ERROR AS HataKodu
   IF @hata<>0
	   BEGIN 
		  ROLLBACK
	   END

SELECT COUNT(*) AS TransactionSonrası ,@hata AS HataKodu FROM tblIl


---
   SELECT COUNT(*) AS TransactionÖncesi FROM tblIl
   DECLARE @hata2 INT

   BEGIN TRANSACTION

   INSERT tblIl VALUES (69,'Bayburt')
   SET  @hata2=@@ERROR
   IF @hata2<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) AS TransactionOrtası ,@hata2 AS HataKodu FROM tblIl
   SAVE TRAN saklamanoktası
   


   INSERT tblIl VALUES (69,'Bayburt')
   SET  @hata2=@@ERROR
   IF @hata2<>0 GOTO Hata_Duzeltme
   COMMIT

   Hata_Duzeltme:
   IF @hata2<>0
	   BEGIN 
		   IF XACT_STATE()<>1
		   BEGIN
				 ROLLBACK TRAN
				 COMMIT
				 PRINT 'Saklama noktasına geri dönüldü'
			END
			ELSE
			  ROLLBACK
	 END

SELECT COUNT(*) AS TransactionSonrası ,@hata2 AS HataKodu FROM tblIl













--INSERT TRANSACTION tblFutbolcuTakımSözleşme
 
   SELECT COUNT(*) AS TransactionÖncesi FROM tblFutbolcuTakımSözleşme
   DECLARE @hata1 INT

   BEGIN TRANSACTION

   INSERT tblFutbolcuTakımSözleşme VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
   SET  @hata1=@@ERROR
   IF @hata1<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) AS TransactionOrtası ,@hata1 AS HataKodu FROM tblFutbolcuTakımSözleşme
 

   INSERT tblFutbolcuTakımSözleşme VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
   SET  @hata1=@@ERROR
   IF @hata1<>0 GOTO Hata_Duzeltme
   COMMIT

   Hata_Duzeltme:
   SELECT @@ERROR AS HataKodu
   IF @hata1<>0
	   BEGIN 
		  ROLLBACK
	   END

SELECT COUNT(*) AS TransactionSonrası ,@hata1 AS HataKodu FROM tblFutbolcuTakımSözleşme





-----
   SELECT COUNT(*) AS TransactionÖncesi FROM tblFutbolcuTakımSözleşme
   DECLARE @hata3 INT

   BEGIN TRANSACTION

   INSERT tblFutbolcuTakımSözleşme VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
   SET  @hata3=@@ERROR
   IF @hata3<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) AS TransactionOrtası ,@hata3 AS HataKodu FROM tblFutbolcuTakımSözleşme
   SAVE TRAN saklamanoktası

   INSERT tblFutbolcuTakımSözleşme VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
   SET  @hata3=@@ERROR
   IF @hata3<>0 GOTO Hata_Duzeltme
   COMMIT

   Hata_Duzeltme:
     IF @hata3<>0
	   BEGIN 
		   IF XACT_STATE()<>1
		   BEGIN
				 ROLLBACK TRAN
				 COMMIT
				 PRINT 'Saklama noktasına geri dönüldü'
			END
			ELSE
			  ROLLBACK
	 END

SELECT COUNT(*) AS TransactionSonrası ,@hata3 AS HataKodu FROM tblFutbolcuTakımSözleşme