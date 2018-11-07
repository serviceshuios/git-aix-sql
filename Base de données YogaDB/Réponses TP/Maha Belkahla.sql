-- L'école de Yoga a maintenant plusieurs salles de formation
-- Objectif : Modifier la base de données pour prendre en compte les salles de formation 


-- Information sur les salles : Intitule,surface, prix du loyer

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

-- Les sessions passées on eut lieu dans la salle Swami Crachra

-- Ajouter une ou plusieurs sessions dans la salle Swami Chrichri

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours

-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :


--Création de la table Salle
CREATE TABLE Salles(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Intitule NVARCHAR(250) NOT NULL,
	Surface	Float NULL,
	PrixLoyer DECIMAL(9,2) NOT NULL,
	IdSession UNIQUEIDENTIFIER NOT NULL

		CONSTRAINT Sessions_Salles 
		FOREIGN KEY (IdSession)
		REFERENCES Sessions(Id)
)

SELECT*FROM Salles

--Insertion des Salles
INSERT INTO Salles(Intitule,Surface,PrixLoyer,IdSession)
SELECT 'Swami Crachra','26.7 ', 876.60, Id 
	FROM Sessions WHERE DateSession < GETDATE()

INSERT INTO Salles(Intitule,Surface,PrixLoyer,IdSession)
SELECT 'Swami Chrichri','36.7 ', 980.00, Id='6691CEF6-25FE-4563-A882-052819A31973'

INSERT INTO Salles(Intitule,Surface,PrixLoyer,IdSession)
SELECT 'Swami Chrichri','36.7 ', 980.00, Id= '2CFB8C21-7215-4F6C-9F1A-4E917DF41118'

INSERT INTO Salles(Intitule,Surface,PrixLoyer,IdSession)
SELECT 'Swami Chrichri','36.7 ', 980.00, Id= 'F3F2922B-7918-46E1-B907-38F3A0B6A89E'

---- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours



SELECT Sa.Intitule,
		SUM(ISNULL(P.PrixFacture,0)) CA,
		COUNT( Pa.IdPratiquant ) as Nombreleves
		FROM Salles Sa LEFT JOIN Sessions S ON Sa.IdSession=S.id
LEFT JOIN Participations Pa ON S.Id=Pa.IdSession 
GROUP BY Sa.Intitule