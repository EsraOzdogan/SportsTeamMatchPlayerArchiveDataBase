IF DB_ID('SporTakýmMaçOyuncuArþivi') IS NOT NULL
BEGIN 
ALTER DATABASE [SporTakýmMaçOyuncuArþivi] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
Use master 
DROP DATABASE SporTakýmMaçOyuncuArþivi
END
GO

Create Database SporTakýmMaçOyuncuArþivi
	On primary (Name='SporTakýmMaçOyuncuArþividb',
	FileName='c:\database\SporTakýmMaçOyuncuArþivi_db.mdf',
	Size=5MB,
	Maxsize= 100MB,
	FileGrowth=5MB)
	LOG ON(Name='SporTakýmMaçOyuncuArþivi_log',
	FileName='c:\database\SporTakýmMaçOyuncuArþivi_log.ldf',
	Size=2MB,
	Maxsize= 50MB,
	FileGrowth=1MB)
GO

USE SporTakýmMaçOyuncuArþivi
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
Create Table tblTakým
(
    ID int Identity(1,1) Primary Key,
	Takým_Ad VarChar(40) Unique NOT NULL,
	KurulusTar Date NOT NULL,
	TC int FOREIGN KEY REFERENCES tblTeknikDirektör(TC),
)

Go
Create Table tblSezon
(
    ID int Identity(1,1) Primary Key,
	Sezon_Ad VarChar(80) Unique NOT NULL,
	Yýl1 Date NOT NULL, --decimal(4,0) default NULL,	
	Yýl2 Date NOT NULL,
	TakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
)
Go
Create Table tblMaç
(
    ID int Identity(1,1) Primary Key,
	MacSayýsý int,
	Tarih DATE NOT NULL,
	Saat Time NOT NULL,
	Hafta int NOT NULL,
	MisafirTakýmSkor  int default NULL,
	EvSahibiTakýmSkor int default NULL,
	EvSahibiTakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
	MisafirTakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
	KýrmzýKartSayýsý int NULL,
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
	TakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
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
	ÇýkanFutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID) NULL,
	MaçID int FOREIGN KEY REFERENCES tblMaç(ID),
	OlayID int FOREIGN KEY REFERENCES tblOlay(ID),
	Dk smallint NOT NULL,
	kýrmýzýkartsayýsý int NULL
	
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
Create Table tblTakýmSezon
(
    ID int Identity(1,1) Primary Key,
	SezonID int FOREIGN KEY REFERENCES tblSezon(ID),
	TakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
	OynadýðýHafta_Say int NOT NULL,
	Averaj decimal(4,0) default NULL,
	Maðlubiyet_Say int NOT NULL,
	Galibiyet_Say int NOT NULL,
	Berabere_Say int NOT NULL,
	AttýðýGol_Say int NOT NULL,
	YediðiGol_Say int NOT NULL,
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
Create Table tblFutbolcuTakýmSözleþme
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	TakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maaþ money NOT NULL,

)
GO

Create Table tblTeknikDirektörTakýmSözleþme
(
    ID int Identity(1,1) Primary Key,
	TC int FOREIGN KEY REFERENCES tblTeknikDirektör(TC),
	TakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
	Bas_tar Date NOT NULL,
	Bit_tar Date NULL,
	Maaþ Money NOT NULL,

)
GO
Create Table tblFutbolcuTakým
(
    ID int Identity(1,1) Primary Key,
	FutbolcuID int FOREIGN KEY REFERENCES tblFutbolcu(ID),
	TakýmID int FOREIGN KEY REFERENCES tblTakým(ID),
)

