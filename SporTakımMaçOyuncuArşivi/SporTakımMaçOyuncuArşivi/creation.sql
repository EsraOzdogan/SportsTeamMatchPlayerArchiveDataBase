IF DB_ID('SporTak�mMa�OyuncuAr�ivi') IS NOT NULL
BEGIN 
ALTER DATABASE [SporTak�mMa�OyuncuAr�ivi] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
Use master 
DROP DATABASE SporTak�mMa�OyuncuAr�ivi
END
GO

Create Database SporTak�mMa�OyuncuAr�ivi
	On primary (Name='SporTak�mMa�OyuncuAr�ividb',
	FileName='c:\database\SporTak�mMa�OyuncuAr�ivi_db.mdf',
	Size=5MB,
	Maxsize= 100MB,
	FileGrowth=5MB)
	LOG ON(Name='SporTak�mMa�OyuncuAr�ivi_log',
	FileName='c:\database\SporTak�mMa�OyuncuAr�ivi_log.ldf',
	Size=2MB,
	Maxsize= 50MB,
	FileGrowth=1MB)
GO

USE SporTak�mMa�OyuncuAr�ivi
Create Table tblIl
(
	Kod Char(2) Primary key,
	Ad VarChar(20) NOT NULL
)
Go
Create Table tblIlce
(
   ID int Identity(1,1) Primary Key,
	Ad VarChar(20) NOT NULL,
	IlKodu Char(2) FOREIGN KEY REFERENCES tblIl(Kod)
	   ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
)
GO
Create Table tblPozisyon
(
    ID int Identity(1,1) Primary Key NOT NULL,
	poz_Ad VarChar(20)  NOT NULL,
)
GO
Create Table tblUyruk
(
  ID int Identity(1,1) Primary Key,
   Uyruk_Ad VarChar(70)  NOT NULL
)
Go
Create Table tblTeknikDirekt�r
(
    UyrukID int FOREIGN KEY REFERENCES tblUyruk(ID),
    TC int Identity(1,1) Primary Key,
	TekDir_Ad VarChar(40)  NOT NULL,
	
)
Go
Create Table tblTak�m
(
    ID int Identity(1,1) Primary Key,
	Tak�m_Ad VarChar(40) Unique NOT NULL,
	KurulusTar Date NOT NULL,
	TC int FOREIGN KEY REFERENCES tblTeknikDirekt�r(TC),
)

Go
Create Table tblSezon
(
    ID int Identity(1,1) Primary Key,
	Sezon_Ad VarChar(80) Unique NOT NULL,
	Y�l1 Date NOT NULL, --decimal(4,0) default NULL,	
	Y�l2 Date NOT NULL,
	Tak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
)
Go
Create Table tblMa�
(
    ID int Identity(1,1) Primary Key,
	MacSay�s� int,
	Tarih DATE NOT NULL,
	Saat Time NOT NULL,
	Hafta int NOT NULL,
	MisafirTak�mSkor  int default NULL,
	EvSahibiTak�mSkor int default NULL,
	EvSahibiTak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
	MisafirTak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
	K�rmz�KartSay�s� int NULL,
)
Create Table tblMa�Sezon
(
    ID int Identity(1,1) Primary Key,
	Ma�ID int FOREIGN KEY REFERENCES tblMa�(ID),
	SezonID int FOREIGN KEY REFERENCES tblSezon(ID),
)


GO
Create Table tblOlay
(
    ID int Identity(1,1) Primary Key,
	Olay_Ad VarChar(40) Unique NOT NULL
)
Create Table tblFutbolcu
(
    ID int Identity(1,1) Primary Key,
	Forma_Num int NOT NULL,
    Futbolcu_Ad VarChar(50) Unique NOT NULL,
	PozisyonID int FOREIGN KEY REFERENCES tblPozisyon(ID),
	UyrukID int FOREIGN KEY REFERENCES tblUyruk(ID),
	Tak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
)
GO
Create Table tblFutbolcuMa�
(
    OynamaID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	Ma�ID int FOREIGN KEY REFERENCES tblMa�(ID),
	
)
GO
Create Table tblFutbolcuOlayMa�
(
    ID int Identity(1,1) Primary Key,
	GirenFutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID) NOT NULL,
	��kanFutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID) NULL,
	Ma�ID int FOREIGN KEY REFERENCES tblMa�(ID),
	OlayID int FOREIGN KEY REFERENCES tblOlay(ID),
	Dk smallint NOT NULL,
	k�rm�z�kartsay�s� int NULL
	
)
GO
Create Table tblStadyum
(
   ID int Identity(1,1) Primary Key,
	Stadyum_Ad VarChar(40) Unique NOT NULL,
	IlKodu char(2) FOREIGN KEY REFERENCES tblIl(kod),
	IlceID int FOREIGN KEY REFERENCES tblIlce(ID),
	
)
GO
Create Table tblTak�mSezon
(
    ID int Identity(1,1) Primary Key,
	SezonID int FOREIGN KEY REFERENCES tblSezon(ID),
	Tak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
	Oynad���Hafta_Say int NOT NULL,
	Averaj decimal(4,0) default NULL,
	Ma�lubiyet_Say int NOT NULL,
	Galibiyet_Say int NOT NULL,
	Berabere_Say int NOT NULL,
	Att���Gol_Say int NOT NULL,
	Yedi�iGol_Say int NOT NULL,
	Puan int NOT NULL
)
GO
Create Table tblSezonOlay
(
    ID int Identity(1,1) Primary Key,
	SezonID int FOREIGN KEY REFERENCES tblSezon(ID),
	OlayID int FOREIGN KEY REFERENCES tblOlay(ID),
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),

)
GO
Create Table tblFutbolcuTak�mS�zle�me
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	Tak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maa� money NOT NULL,

)
GO

Create Table tblTeknikDirekt�rTak�mS�zle�me
(
    ID int Identity(1,1) Primary Key,
	TC int FOREIGN KEY REFERENCES tblTeknikDirekt�r(TC),
	Tak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maa� Money NOT NULL,

)
GO
Create Table tblFutbolcuTak�m
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	Tak�mID int FOREIGN KEY REFERENCES tblTak�m(ID),
)

