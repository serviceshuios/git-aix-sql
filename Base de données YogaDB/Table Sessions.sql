USE YogaDB

DROP TABLE Sessions
CREATE TABLE Sessions(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Intitule NVARCHAR(250) NOT NULL,
	DateSession DATETIME2 DEFAULT getdate() NOT NULL,
	NombreMaxParticipants INT DEFAULT 10 NOT NULL,
	IdProfesseur UNIQUEIDENTIFIER NOT NULL
	-- Contrainte d'intégrité référencielle
	-- La valeur de IdProfesseur dans la table
	-- doit correspondre à un professeur existant dans la table
	-- Professeurs
	CONSTRAINT Sessions_Professeurs 
		FOREIGN KEY (IdProfesseur)
		REFERENCES Professeurs(Id)
)



-- Suppression des lignes de session
DELETE FROM Sessions

-- Insertion de session en fournissant des données
INSERT INTO Sessions(Intitule,idProfesseur)
VALUES('Yoga bidule','BE4F2FC1-C6B2-4219-85F6-5EC171E9E7F8')

-- Recherche des données dans la table des professeurs
SELECT 'Yoga bidule',Id  FROM Professeurs WHERE Nom='Mauras'

-- Insertion de données provenant d'une requète SELECT
INSERT INTO Sessions(Intitule,idProfesseur)
SELECT 'Yoga machin',Id  FROM Professeurs WHERE Nom='Dalton'


SELECT * FROM Sessions