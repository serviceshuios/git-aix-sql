-- L'école de Yoga a maintenant plusieurs salles de formation
 CREATE TABLE Salles (
 IdSalle UNIQUEIDENTIFIER NOT NULL,
 Intitule NVARCHAR(250) NOT NULL,
 Suraface Float NOT NULL,
 Prix DECIMAL(18,2) NOT NULL DEFAULT 0


 )
-- Objectif : Modifier la base de données pour prendre en compte les salles de formation 
 
 CONSTRAINT Salles_Sessions
		FOREIGN KEY (IdSessions)
		REFERENCES Sessions(Id)
)
--WHERE Id='9F4326DA-B11C-434B-998F-D8FF49821255'
-- Information sur les salles : Intitule,surface, prix du loyer

INSERT INTO Sessions(Intitule,IdSalles)
VALUES('Swami Crachra  ','BE4F2FC1-C6B2-4219-85F6-5EC171E9E7F8')

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

-- Les sessions passées on eut lieu dans la salle Swami Crachra

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours
SELECT Pr.Intitule,
	
	SUM(ISNULL(Pa.PrixFacture,0)) CA FROM 
	Salles Pr LEFT JOIN Sessions S ON Pr.Id=S.IdSalles
	LEFT JOIN Participations Pa ON S.Id=Pa.IdSession
GROUP BY Pr.Intitule
WITH ROLLUP


-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :


