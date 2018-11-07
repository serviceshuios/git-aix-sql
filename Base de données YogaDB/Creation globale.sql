CREATE DATABASE YogaDB

GO

USE YogaDB
GO
CREATE TABLE Pratiquants(
	-- Cl� primaire (not null et unicit� des valeurs)
	id INT PRIMARY KEY IDENTITY, -- BIGINT SMALLINT TINYINT -- AUTO_INCREMENT mySQL AUTOINCREMENT Access
	prenom NVARCHAR(50) NULL,
	nom NVARCHAR(50)  NULL,
	CP NVARCHAR(20) NULL ,	
	Rue NVARCHAR(250) NULL,
	Ville NVARCHAR(50) NULL,
	NumeroSecu VARCHAR(50) NULL,
	Credit DECIMAL(18,2) NOT NULL DEFAULT 0, -- Type pr�cis (lent lors des calculs)
	Poids Float NULL, --Impr�cis : plus rapide mais donn�es stock�es approximativement (mais avec beaucoup de chiffres apr�s la virgule)
	-- Ajout d'une contrainte sur le cr�dit
	CONSTRAINT CreditPositif CHECK (Credit >=0)
	)


	-- Ajout d'une contrainte sur une table existante
	-- WITH NOCHECK : Ne pas v�rifier la contrainte sur les donn�es existantes
	ALTER TABLE Pratiquants WITH NOCHECK ADD
		CONSTRAINT NomOuPrenonFourni CHECK (prenom IS NOT null OR nom IS NOT null)

GO

CREATE TABLE Professeurs(
	-- UniqueIdentifier : Identifiant g�n�r� al�atoirement
	-- avec une probabilit� de doublon infime
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Nom NVARCHAR(50) NOT NULL,
	Prenom NVARCHAR(50) NOT NULL,
	Taux_Horaire DECIMAL(9,2) NOT NULL DEFAULT 0
)

GO

CREATE TABLE Sessions(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Intitule NVARCHAR(250) NOT NULL,
	DateSession DATETIME2 DEFAULT getdate() NOT NULL,
	NombreMaxParticipants INT DEFAULT 10 NOT NULL,
	IdProfesseur UNIQUEIDENTIFIER NOT NULL
	-- Contrainte d'int�grit� r�f�rencielle
	-- La valeur de IdProfesseur dans la table
	-- doit correspondre � un professeur existant dans la table
	-- Professeurs
	CONSTRAINT Sessions_Professeurs 
		FOREIGN KEY (IdProfesseur)
		REFERENCES Professeurs(Id)
)

GO

CREATE TABLE Participations(

	IdSession UNIQUEIDENTIFIER NOT NULL,
	IdPratiquant INT NOT NULL,
	DateInscription DATETIME NOT NULL DEFAULT Getdate(),
	PrixFacture DECIMAL(9,2) NOT NULL,
	Presence BIT DEFAULT 1,

	CONSTRAINT Participations_Sessions 
		FOREIGN KEY (IdSession)
		REFERENCES [Sessions](Id),
	CONSTRAINT Participations_Pratiquants
		FOREIGN KEY (IdPratiquant)
		REFERENCES Pratiquants(Id),
	CONSTRAINT Pk_Participations PRIMARY KEY(IdSession,IdPratiquant)
)