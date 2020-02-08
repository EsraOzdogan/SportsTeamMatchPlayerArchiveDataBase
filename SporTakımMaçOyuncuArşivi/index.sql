IF OBJECT_ID ('IndeksUyruk1') IS NOT NULL
  DROP TABLE IndeksÝlçe1
GO
IF OBJECT_ID ('IndeksUyruk2') IS NOT NULL
  DROP TABLE IndeksÝlçe1
GO
IF OBJECT_ID ('IndeksUyruk3') IS NOT NULL
  DROP TABLE IndeksÝlçe1
GO


CREATE TABLE IndeksUyruk1 (x INT,y VARCHAR (50))
GO
CREATE TABLE IndeksUyruk2 (x INT PRIMARY KEY,y VARCHAR (50))
GO
CREATE TABLE IndeksUyruk3 (x INT PRIMARY KEY,y VARCHAR (50))
GO


CREATE NONCLUSTERED INDEX idxIndeksUyruk3 ON IndeksUyruk3(y)
WITH (PAD_INDEX=ON, FILLFACTOR=90, DROP_EXISTING=OFF) 
/*CREATE NONCLUSTERED INDEX idxIndeksÝlçe3 ON IndeksÝlçe3(y)
WHERE y='Ýzlandalý' WITH (PAD_INDEX=ON, FILLFACTOR=90, DROP_EXISTING=OFF) */

DECLARE @degerler TABLE (id INT IDENTITY(1,1),deger VARCHAR(20))
INSERT INTO @degerler VALUES ('Alman'),('Rus'),('Kazak'),('Ýspanyol'),('Ýtalyan'),('Kenyalý'),('Amerikalý'),('Portekizli'),('Ýzlandalý'),('Japon')

DECLARE @x INT=1,@y INT
DECLARE @deger VARCHAR(20)

WHILE @x<15
BEGIN
  IF @x>7
    SET @deger='Türk'
   ELSE
	  BEGIN 
	     SET @y =(CONVERT(INT,ROUND(RAND()*10,0))%10) +1
		 SELECT @deger=deger FROM @degerler WHERE id=@y
      END
   INSERT INTO IndeksUyruk1 VALUES(@x,@deger)
   INSERT INTO IndeksUyruk2 VALUES(@x,@deger)
   INSERT INTO IndeksUyruk3 VALUES(@x,@deger)
   SET @x+=1
END
GO

SET STATISTICS IO ON 
SELECT * FROM IndeksUyruk1 WHERE x>7
SELECT * FROM IndeksUyruk1 WHERE y='TÜRK'
SELECT * FROM IndeksUyruk2 WHERE x>7
SELECT * FROM IndeksUyruk2 WHERE y='TÜRK'
SELECT * FROM IndeksUyruk3 WHERE x>7
SELECT * FROM IndeksUyruk3 WHERE y='TÜRK'






