-- L'école de Yoga a maintenant plusieurs salles de formation
-- Objectif : Modifier la base de données pour prendre en compte les salles de formation 


-- Information sur les salles : Intitule,surface, prix du loyer

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

-- Les sessions passées on eut lieu dans la salle Swami Crachra

-- ajouter une ou plusieurs sessions dans la salle swami chrichri

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours

-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :



USE YogaDB
GO

CREATE TABLE Salle(

--dans une salle il y a plusieurs sessions , plusieurs pratiquants, plusieurs professeurs
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Intitule NVARCHAR(250) NOT NULL,
	Surface FLOAT NOT NULL,
	PrixLoyer Decimal(9,2) NOT NULL,
	IdSalle UNIQUEIDENTIFIER NOT NULL,
	-- Contrainte d'intégrité référencielle
	-- La valeur de IdSalle dans la table doit correspondre à un session existant dans la table Sessions
	CONSTRAINT Sessions_Salle 
		FOREIGN KEY (IdSalle)
		REFERENCES Sessions(Id)
	
	)
-- Les sessions passées on eut lieu dans la salle Swami Crachra
		ALTER TABLE sessions
			ADD salles NVARCHAR(250)

Select * FROM sessions

UPDATE Sessions
SET salles= 'Swami Crachra'

--INSERT INTO Sessions(salles)
--VALUES(isnull(salles,'swami crachra'))


--ajouter une ou plusieurs sessions dans la salle swami chrichri
UPDATE Salle
SET Salle = 'nouvelle valeur'
WHERE condition
