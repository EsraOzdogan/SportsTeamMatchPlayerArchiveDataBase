
 ---TRANSACTION INSERT 
   SELECT COUNT(*) AS Transaction�ncesi FROM tblIl
   DECLARE @hata INT

   BEGIN TRANSACTION

   INSERT tblIl VALUES (69,'Bayburt')
   SET  @hata=@@ERROR
   IF @hata<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) TransactionOrtas� ,@hata AS HataKodu FROM tblIl
   


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

SELECT COUNT(*) AS TransactionSonras� ,@hata AS HataKodu FROM tblIl


---
   SELECT COUNT(*) AS Transaction�ncesi FROM tblIl
   DECLARE @hata2 INT

   BEGIN TRANSACTION

   INSERT tblIl VALUES (69,'Bayburt')
   SET  @hata2=@@ERROR
   IF @hata2<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) AS TransactionOrtas� ,@hata2 AS HataKodu FROM tblIl
   SAVE TRAN saklamanoktas�
   


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
				 PRINT 'Saklama noktas�na geri d�n�ld�'
			END
			ELSE
			  ROLLBACK
	 END

SELECT COUNT(*) AS TransactionSonras� ,@hata2 AS HataKodu FROM tblIl













--INSERT TRANSACTION tblFutbolcuTak�mS�zle�me
 
   SELECT COUNT(*) AS Transaction�ncesi FROM tblFutbolcuTak�mS�zle�me
   DECLARE @hata1 INT

   BEGIN TRANSACTION

   INSERT tblFutbolcuTak�mS�zle�me VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
   SET  @hata1=@@ERROR
   IF @hata1<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) AS TransactionOrtas� ,@hata1 AS HataKodu FROM tblFutbolcuTak�mS�zle�me
 

   INSERT tblFutbolcuTak�mS�zle�me VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
   SET  @hata1=@@ERROR
   IF @hata1<>0 GOTO Hata_Duzeltme
   COMMIT

   Hata_Duzeltme:
   SELECT @@ERROR AS HataKodu
   IF @hata1<>0
	   BEGIN 
		  ROLLBACK
	   END

SELECT COUNT(*) AS TransactionSonras� ,@hata1 AS HataKodu FROM tblFutbolcuTak�mS�zle�me





-----
   SELECT COUNT(*) AS Transaction�ncesi FROM tblFutbolcuTak�mS�zle�me
   DECLARE @hata3 INT

   BEGIN TRANSACTION

   INSERT tblFutbolcuTak�mS�zle�me VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
   SET  @hata3=@@ERROR
   IF @hata3<>0 GOTO Hata_Duzeltme
   SELECT COUNT(*) AS TransactionOrtas� ,@hata3 AS HataKodu FROM tblFutbolcuTak�mS�zle�me
   SAVE TRAN saklamanoktas�

   INSERT tblFutbolcuTak�mS�zle�me VALUES ( 10 ,10,'2020-10-10','2025-10-10',1.000,0,0,0)
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
				 PRINT 'Saklama noktas�na geri d�n�ld�'
			END
			ELSE
			  ROLLBACK
	 END

SELECT COUNT(*) AS TransactionSonras� ,@hata3 AS HataKodu FROM tblFutbolcuTak�mS�zle�me