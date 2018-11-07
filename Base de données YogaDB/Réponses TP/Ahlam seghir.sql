
USE YogaDB



CREATE TABLE Salles(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	Intitule NVARCHAR(250) NOT NULL,
	surface float  NOT NULL,
	prix_loyer DECIMAL(18,2) NOT NULL DEFAULT 0,

	CONSTRAINT prix_loyer_positive CHECK (prix_loyer >0)
)

	-- Insertion de session en fournissant des données
INSERT INTO Salles(Intitule,Surface,prix_loyer)
VALUES(' Swami Crachra ',26.7,876.60)

INSERT INTO Salles(Intitule,Surface,prix_loyer)
VALUES(' Swami Chrichri ',36.7,980.00)

SELECT * FROM Salles

ALTER TABLE session  
ALTER COLUMN IDsession NVARCHAR

SELECT salle.id,
		CONCAT(Pratiquants.Nom,Pratiquants.Prenom) as NomComplet,
		SUM(ISNULL(prix_loyer,0)) CA,
		COUNT( P.IdSession ) as NombreSessions
		FROM Pratiquants Pr LEFT JOIN Participations P
ON P.IdPratiquant=Pr.id
LEFT JOIN Salles S
