IF DB_ID('SporTakımMaçOyuncuArşivi') IS NOT NULL
BEGIN 
ALTER DATABASE [SporTakımMaçOyuncuArşivi] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
Use master 
DROP DATABASE SporTakımMaçOyuncuArşivi
END
GO

Create Database SporTakımMaçOyuncuArşivi
	On primary (Name='SporTakımMaçOyuncuArşividb',
	FileName='c:\database\SporTakımMaçOyuncuArşivi_db.mdf',
	Size=5MB,
	Maxsize= 100MB,
	FileGrowth=5MB)
	LOG ON(Name='SporTakımMaçOyuncuArşivi_log',
	FileName='c:\database\SporTakımMaçOyuncuArşivi_log.ldf',
	Size=2MB,
	Maxsize= 50MB,
	FileGrowth=1MB)
GO

USE SporTakımMaçOyuncuArşivi
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
Create Table tblTeknikDirektör
(
    UyrukID int FOREIGN KEY REFERENCES tblUyruk(ID),
    TC int Identity(1,1) Primary Key,
	TekDir_Ad VarChar(40)  NOT NULL,
	
)
Go
Create Table tblTakım
(
    ID int Identity(1,1) Primary Key,
	Takım_Ad VarChar(40) Unique NOT NULL,
	KurulusTar Date NOT NULL,
	TC int FOREIGN KEY REFERENCES tblTeknikDirektör(TC),
)

Go
Create Table tblSezon
(
    ID int Identity(1,1) Primary Key,
	Sezon_Ad VarChar(80) Unique NOT NULL,
	Yıl1 Date NOT NULL, --decimal(4,0) default NULL,	
	Yıl2 Date NOT NULL,
	TakımID int FOREIGN KEY REFERENCES tblTakım(ID),
)
Go
Create Table tblMaç
(
    ID int Identity(1,1) Primary Key,
	MacSayısı int,
	Tarih DATE NOT NULL,
	Saat Time NOT NULL,
	Hafta int NOT NULL,
	MisafirTakımSkor  int default NULL,
	EvSahibiTakımSkor int default NULL,
	EvSahibiTakımID int FOREIGN KEY REFERENCES tblTakım(ID),
	MisafirTakımID int FOREIGN KEY REFERENCES tblTakım(ID),
	KırmzıKartSayısı int NULL,
)
Create Table tblMaçSezon
(
    ID int Identity(1,1) Primary Key,
	MaçID int FOREIGN KEY REFERENCES tblMaç(ID),
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
	TakımID int FOREIGN KEY REFERENCES tblTakım(ID),
)
GO
Create Table tblFutbolcuMaç
(
    OynamaID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	MaçID int FOREIGN KEY REFERENCES tblMaç(ID),
	
)
GO
Create Table tblFutbolcuOlayMaç
(
    ID int Identity(1,1) Primary Key,
	GirenFutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID) NOT NULL,
	ÇıkanFutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID) NULL,
	MaçID int FOREIGN KEY REFERENCES tblMaç(ID),
	OlayID int FOREIGN KEY REFERENCES tblOlay(ID),
	Dk smallint NOT NULL,
	kırmızıkartsayısı int NULL
	
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
Create Table tblTakımSezon
(
    ID int Identity(1,1) Primary Key,
	SezonID int FOREIGN KEY REFERENCES tblSezon(ID),
	TakımID int FOREIGN KEY REFERENCES tblTakım(ID),
	OynadığıHafta_Say int NOT NULL,
	Averaj decimal(4,0) default NULL,
	Mağlubiyet_Say int NOT NULL,
	Galibiyet_Say int NOT NULL,
	Berabere_Say int NOT NULL,
	AttığıGol_Say int NOT NULL,
	YediğiGol_Say int NOT NULL,
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
Create Table tblFutbolcuTakımSözleşme
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	TakımID int FOREIGN KEY REFERENCES tblTakım(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maaş money NOT NULL,

)
GO

Create Table tblTeknikDirektörTakımSözleşme
(
    ID int Identity(1,1) Primary Key,
	TC int FOREIGN KEY REFERENCES tblTeknikDirektör(TC),
	TakımID int FOREIGN KEY REFERENCES tblTakım(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maaş Money NOT NULL,

)
GO
Create Table tblFutbolcuTakım
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	TakımID int FOREIGN KEY REFERENCES tblTakım(ID),
)

