-- L'école de Yoga a maintenant plusieurs salles de formation
-- Objectif : Modifier la base de données pour prendre en compte les salles de formation 


-- Information sur les salles : Intitule,surface, prix du loyer

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

-- Les sessions passées on eu lieu dans la salle Swami Crachra

-- Ajouter une ou plusieurs sessions dans la salle Swami Chrichri

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours

-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :

USE YogaDB
GO

CREATE TABLE Salles(
	id INT PRIMARY KEY IDENTITY, 
	Intitule NVARCHAR(250) NOT NULL,
	Surface DECIMAL(20, 2) NOT NULL,
	PrixDuLoyer DECIMAL(20, 2) NOT NULL DEFAULT 100,
	-- Ajout d'une contrainte sur le loyer
	CONSTRAINT LoyerPositif CHECK (PrixDuLoyer >= 0)

)
GO

ALTER TABLE Sessions
ADD IdSalles INT NOT NULL
GO

ALTER TABLE Sessions 
ADD FOREIGN KEY (IdSalles) REFERENCES Salles(Id);
GO

-- SELECT * FROM Sessions;

-- Inserstion des données
INSERT INTO Salles(Intitule, Surface, PrixDuLoyer)
VALUES('Swami_Crachra', 26.7, 876.60)

INSERT INTO Salles(Intitule, Surface, PrixDuLoyer)
VALUES('Swami_Chrichri', 36.7, 980.00)
GO

-- Les sessions passées on eu lieu dans la salle Swami Crachra
UPDATE Salles SET Intitule = 'Swami Crachra'
--SELECT * FROM Salles


SELECT * FROM Salles AS sal LEFT JOIN Sessions AS ses ON sal.id = ses.IdSalles 

SELECT PrixDuLoyer, Intitule FROM Salles 

