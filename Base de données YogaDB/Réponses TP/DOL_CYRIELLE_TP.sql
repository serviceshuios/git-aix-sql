-- L'école de Yoga a maintenant plusieurs salles de formation
-- Objectif : Modifier la base de données pour prendre en compte les salles de formation 


-- Information sur les salles : Intitule,surface, prix du loyer

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

-- Les sessions passées on eut lieu dans la salle Swami Crachra
--ajouter une ou plusieurs sessions dans la salle Swami Chrichri

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours

-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :

USE MASTER

GO

USE YogaDB

GO

CREATE TABLE SalleFormation(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newId(),
	Intitule NVARCHAR(250) NOT NULL,
	Surface FLOAT NOT NULL,
	PrixLoyer DECIMAL(9,2) NOT NULL DEFAULT 0,
)

GO

INSERT INTO SalleFormation (Intitule, Surface, PrixLoyer)
	VALUES ('Swami Crachra', 26.7, 876.60), ('Swami Chrichri', 36.7, 980.00)

GO

ALTER TABLE Sessions ADD IdSalle UNIQUEIDENTIFIER
	CONSTRAINT Sessions_SalleFormation
		FOREIGN KEY (IdSalle)
		REFERENCES SalleFormation(Id)

GO

SELECT*FROM SalleFormation

GO

UPDATE Sessions SET IdSalle='742CD4D9-B741-4F9B-A501-2F9D8C264740'

GO

INSERT INTO Sessions (Intitule, IdProfesseur, IdSalle)
	VALUES ('YogaTruc', '97FE83F3-6A8D-47A1-96EF-30F914881BFE', '9C579318-4FA7-49CF-93CF-98E42949D323')

GO

SELECT Sf.Intitule,
	Sf.Id,
	COUNT(Pa.IdPratiquant) [NombreEleve],
	SUM(ISNULL(Pa.PrixFacture,0)) [ChiffreAffaire]

	FROM Sessions AS S
		RIGHT JOIN SalleFormation AS Sf
			ON S.IdSalle=Sf.Id
		LEFT JOIN Participations AS Pa
			ON Pa.IdSession=S.Id

	GROUP BY Sf.Intitule, Sf.Id


-- Entre parenthèses
SELECT*FROM SalleFormation
SELECT*FROM Sessions
SELECT*FROM Professeurs
SELECT*FROM Participations
DROP TABLE SalleFormation

