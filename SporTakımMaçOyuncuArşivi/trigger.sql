IF OBJECT_ID ('ConstBakiye','D') IS NOT NULL
  ALTER TABLE tblFutbolcuTakımSözleşme DROP CONSTRAINT ConstBakiye
GO
IF COL_LENGTH ('Futbolcu','Bakiye') IS NOT NULL
  ALTER TABLE tblFutbolcuTakımSözleşme DROP COLUMN Bakiye
GO
IF COL_LENGTH ('Futbolcu','BasTar') IS NOT NULL
  ALTER TABLE tblFutbolcuTakımSözleşme DROP COLUMN CreatedDate
GO
IF COL_LENGTH ('Futbolcu','DegTar') IS NOT NULL
  ALTER TABLE tblFutbolcuTakımSözleşme DROP COLUMN ModifiedDate
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

DELETE FROM tblFutbolcuTakımSözleşme WHERE FutbolcuID IN ('1','3')
ALTER TABLE tblFutbolcuTakımSözleşme ADD Bakiye MONEY CONSTRAINT ConstBakiye DEFAULT 0  WITH VALUES 
GO
ALTER TABLE tblFutbolcuTakımSözleşme ADD CreatedDate DATETIME 
GO
ALTER TABLE tblFutbolcuTakımSözleşme ADD ModifiedDate DATETIME 
GO


Create Table tblFutbolcuDeleted
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	TakımID int FOREIGN KEY REFERENCES tblTakım(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maaş money NOT NULL,
	Bakiye MONEY,
	CreatedDate DATETIME,
	ModifiedDate DATETIME,
	DeletedDate DATETIME
)
GO

CREATE TRIGGER trgFutbolcuInsert ON tblFutbolcuTakımSözleşme AFTER INSERT AS
   DECLARE @FutID NVARCHAR(20)=(SELECT FutbolcuID FROM Inserted)
   ALTER TABLE tblFutbolcuTakımSözleşme DISABLE TRIGGER  trgFutbolcuUpdate
   UPDATE tblFutbolcuTakımSözleşme SET CreatedDate=GETDATE() WHERE FutbolcuID=@FutID
   ALTER TABLE tblFutbolcuTakımSözleşme ENABLE TRIGGER trgFutbolcuUpdate
GO


CREATE TRIGGER trgFutbolcuUpdate ON tblFutbolcuTakımSözleşme AFTER UPDATE AS
   DECLARE @FutID TABLE(ID NVARCHAR(20))
   INSERT INTO @FutID SELECT FutbolcuID FROM inserted
   IF UPDATE (FutbolcuID)
     BEGIN
	     RAISERROR('!!! DUTBOLCU ID GÜNCELLENEMEZ !!! GÜNCELLEME İŞLEMİ İPTAL EDİLDİ',16,1)
		 ROLLBACK
	 END
   ELSE 
      UPDATE tblFutbolcuTakımSözleşme Set ModifiedDate=GETDATE() WHERE FutbolcuID IN (SELECT ID FROM @FutID)        

GO
CREATE TRIGGER trgFutbolcuDelete ON tblFutbolcuTakımSözleşme AFTER DELETE AS
   INSERT INTO tblFutbolcuDeleted SELECT  *,GETDATE()FROM deleted
GO
--TEST
SELECT * FROM tblFutbolcuTakımSözleşme
SELECT Bakiye,CreatedDate,ModifiedDate, * FROM tblFutbolcuTakımSözleşme
INSERT INTO tblFutbolcuTakımSözleşme VALUES( 'TEST1','KORSAN','KORSAN8',NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO 
WAITFOR DELAY '00:00:02'
INSERT INTO tblFutbolcuTakımSözleşme VALUES( 'TEST2','KORSAN2','KORSAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO 
WAITFOR DELAY '00:00:02'














