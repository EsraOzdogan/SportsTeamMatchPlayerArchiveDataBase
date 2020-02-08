IF OBJECT_ID ('ConstBakiye','D') IS NOT NULL
  ALTER TABLE tblFutbolcuTak�mS�zle�me DROP CONSTRAINT ConstBakiye
GO
IF COL_LENGTH ('Futbolcu','Bakiye') IS NOT NULL
  ALTER TABLE tblFutbolcuTak�mS�zle�me DROP COLUMN Bakiye
GO
IF COL_LENGTH ('Futbolcu','BasTar') IS NOT NULL
  ALTER TABLE tblFutbolcuTak�mS�zle�me DROP COLUMN CreatedDate
GO
IF COL_LENGTH ('Futbolcu','DegTar') IS NOT NULL
  ALTER TABLE tblFutbolcuTak�mS�zle�me DROP COLUMN ModifiedDate
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

DELETE FROM tblFutbolcuTak�mS�zle�me WHERE FutbolcuID IN ('1','3')
ALTER TABLE tblFutbolcuTak�mS�zle�me ADD Bakiye MONEY CONSTRAINT ConstBakiye DEFAULT 0  WITH VALUES 
GO
ALTER TABLE tblFutbolcuTak�mS�zle�me ADD CreatedDate DATETIME 
GO
ALTER TABLE tblFutbolcuTak�mS�zle�me ADD ModifiedDate DATETIME 
GO


Create Table tblFutbolcuDeleted
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	Tak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maa� money NOT NULL,
	Bakiye MONEY,
	CreatedDate DATETIME,
	ModifiedDate DATETIME,
	DeletedDate DATETIME
)
GO

CREATE TRIGGER trgFutbolcuInsert ON tblFutbolcuTak�mS�zle�me AFTER INSERT AS
   DECLARE @FutID NVARCHAR(20)=(SELECT FutbolcuID FROM Inserted)
   ALTER TABLE tblFutbolcuTak�mS�zle�me DISABLE TRIGGER  trgFutbolcuUpdate
   UPDATE tblFutbolcuTak�mS�zle�me SET CreatedDate=GETDATE() WHERE FutbolcuID=@FutID
   ALTER TABLE tblFutbolcuTak�mS�zle�me ENABLE TRIGGER trgFutbolcuUpdate
GO


CREATE TRIGGER trgFutbolcuUpdate ON tblFutbolcuTak�mS�zle�me AFTER UPDATE AS
   DECLARE @FutID TABLE(ID NVARCHAR(20))
   INSERT INTO @FutID SELECT FutbolcuID FROM inserted
   IF UPDATE (FutbolcuID)
     BEGIN
	     RAISERROR('!!! DUTBOLCU ID G�NCELLENEMEZ !!! G�NCELLEME ��LEM� �PTAL ED�LD�',16,1)
		 ROLLBACK
	 END
   ELSE 
      UPDATE tblFutbolcuTak�mS�zle�me Set ModifiedDate=GETDATE() WHERE FutbolcuID IN (SELECT ID FROM @FutID)        

GO
CREATE TRIGGER trgFutbolcuDelete ON tblFutbolcuTak�mS�zle�me AFTER DELETE AS
   INSERT INTO tblFutbolcuDeleted SELECT  *,GETDATE()FROM deleted
GO
--TEST
SELECT * FROM tblFutbolcuTak�mS�zle�me
SELECT Bakiye,CreatedDate,ModifiedDate, * FROM tblFutbolcuTak�mS�zle�me
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES( 'TEST1','KORSAN','KORSAN8',NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO 
WAITFOR DELAY '00:00:02'
INSERT INTO tblFutbolcuTak�mS�zle�me VALUES( 'TEST2','KORSAN2','KORSAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL)
GO 
WAITFOR DELAY '00:00:02'














