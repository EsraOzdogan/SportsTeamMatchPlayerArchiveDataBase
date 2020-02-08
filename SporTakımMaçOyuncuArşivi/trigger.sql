IF OBJECT_ID ('ConstBakiye','D') IS NOT NULL
  ALTER TABLE tblFutbolcuTakýmSözleþme DROP CONSTRAINT ConstBakiye
GO
IF COL_LENGTH ('Futbolcu','Bakiye') IS NOT NULL
  ALTER TABLE tblFutbolcuTakýmSözleþme DROP COLUMN Bakiye
GO
IF COL_LENGTH ('Futbolcu','BasTar') IS NOT NULL
  ALTER TABLE tblFutbolcuTakýmSözleþme DROP COLUMN CreatedDate
GO
IF COL_LENGTH ('Futbolcu','DegTar') IS NOT NULL
  ALTER TABLE tblFutbolcuTakýmSözleþme DROP COLUMN ModifiedDate
GO
IF OBJECT_ID ('trgFutbolcuInsert','TR') IS NOT NULL
    DROP TRIGGER trgFutbolcuInsert
GO
IF OBJECT_ID ('trgFutbolcuUpdate','TR') IS NOT NULL
    DROP TRIGGER trgFutbolcuUpdate
GO
IF OBJECT_ID ('trgFutbolcuDelete','TR') IS NOT NULL
    DROP TRIGGER trgFutbolcuDelete
GO

IF OBJECT_ID ('FutbolcuDeleted','U') IS NOT NULL
    DROP TABLE FutbolcuDeleted
GO

DELETE FROM tblFutbolcuTakýmSözleþme WHERE FutbolcuID IN ('1','3')
ALTER TABLE tblFutbolcuTakýmSözleþme ADD Bakiye MONEY CONSTRAINT ConstBakiye DEFAULT 0  WITH VALUES 
GO
ALTER TABLE tblFutbolcuTakýmSözleþme ADD CreatedDate DATETIME 
GO
ALTER TABLE tblFutbolcuTakýmSözleþme ADD ModifiedDate DATETIME 
GO


Create Table tblFutbolcuDeleted
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	TakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maaþ money NOT NULL,
	Bakiye MONEY,
	CreatedDate DATETIME,
	ModifiedDate DATETIME,
	DeletedDate DATETIME
)
GO

CREATE TRIGGER trgFutbolcuInsert ON tblFutbolcuTakýmSözleþme AFTER INSERT AS
   DECLARE @FutID NVARCHAR(20)=(SELECT FutbolcuID FROM Inserted)
   ALTER TABLE tblFutbolcuTakýmSözleþme DISABLE TRIGGER  trgFutbolcuUpdate
   UPDATE tblFutbolcuTakýmSözleþme SET CreatedDate=GETDATE() WHERE FutbolcuID=@FutID
   ALTER TABLE tblFutbolcuTakýmSözleþme ENABLE TRIGGER trgFutbolcuUpdate
GO


CREATE TRIGGER trgFutbolcuUpdate ON tblFutbolcuTakýmSözleþme AFTER UPDATE AS
   DECLARE @FutID TABLE(ID NVARCHAR(20))
   INSERT INTO @FutID SELECT FutbolcuID FROM inserted
   IF UPDATE (FutbolcuID)
     BEGIN
	     RAISERROR('!!! DUTBOLCU ID GÜNCELLENEMEZ !!! GÜNCELLEME ÝÞLEMÝ ÝPTAL EDÝLDÝ',16,1)
		 ROLLBACK
	 END
   ELSE 
      UPDATE tblFutbolcuTakýmSözleþme Set ModifiedDate=GETDATE() WHERE FutbolcuID IN (SELECT ID FROM @FutID)        

GO
CREATE TRIGGER trgFutbolcuDelete ON tblFutbolcuTakýmSözleþme AFTER DELETE AS
   INSERT INTO tblFutbolcuDeleted SELECT  *,GETDATE()FROM deleted
GO
--TEST
SELECT * FROM tblFutbolcuTakýmSözleþme
SELECT Bakiye,CreatedDate,ModifiedDate, * FROM tblFutbolcuTakýmSözleþme
INSERT INTO tblFutbolcuTakýmSözleþme VALUES( 'TEST1','KORSAN','KORSAN8',NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO 
WAITFOR DELAY '00:00:02'
INSERT INTO tblFutbolcuTakýmSözleþme VALUES( 'TEST2','KORSAN2','KORSAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO 
WAITFOR DELAY '00:00:02'














