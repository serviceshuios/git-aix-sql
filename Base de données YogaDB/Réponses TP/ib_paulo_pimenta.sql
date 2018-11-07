-- L'école de Yoga a maintenant plusieurs salles de formation
-- Objectif : Modifier la base de données pour prendre en compte les salles de formation 


-- Information sur les salles : Intitule,surface, prix du loyer

USE YogaDB2

-- Remove Table Lieux, si besoin
--ALTER TABLE Sessions DROP CONSTRAINT SessionLieux
--ALTER TABLE Sessions DROP COLUMN idLieux
--DROP TABLE Lieux

CREATE TABLE Lieux(
	id INT PRIMARY KEY IDENTITY,
	intitule VARCHAR(50) NOT NULL,
	surface DECIMAL (18,2) NOT NULL,
	prix DECIMAL (18,2) NOT NULL
	)

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

INSERT INTO Lieux (intitule,surface, prix) VALUES('Swami Crachra',26.7,876.60)
INSERT INTO Lieux (intitule,surface, prix) VALUES('Swami Chrichri',36.7,980.00)

ALTER TABLE Sessions ADD idLieux INT DEFAULT 0
ALTER TABLE Sessions ADD CONSTRAINT SessionLieux FOREIGN KEY(idLieux) REFERENCES Lieux(id)

-- Les sessions passées on eut lieu dans la salle Swami Crachra
UPDATE Sessions SET idLieux = l.id FROM Lieux l 
WHERE l.intitule = 'Swami Crachra'

-- Ajouter une ou plusieurs sessions dans la salle Swami Chrichri
INSERT INTO Sessions (Intitule,DateSession,NombreMaxParticipants,IdProfesseur,idLieux)
VALUES ('TaiChi','2018-08-15 20:30:00.0000000',20,'BD472825-A1BC-4E22-B3FA-DA1337C7BD08',2)
INSERT INTO Sessions (Intitule,DateSession,NombreMaxParticipants,IdProfesseur,idLieux)
VALUES ('TaiChi','2018-08-20 19:00:00.0000000',20,'F7C954C8-7619-4F4A-BDDD-6B69C61ED5978',2)

-- *J'ai du ajouter deux praticants d'une session taichi.
-- Le deuxieme praticant (Penelope Cruz) ne sera pris en compte car elle est absente
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES( (SELECT id FROM Sessions WHERE DateSession='2018-08-20 19:00:00.0000000'),	
		(SELECT id FROM Pratiquants WHERE nom='LeGrand'), 22)
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture,Presence)
VALUES( (SELECT id FROM Sessions WHERE DateSession='2018-08-15 20:30:00.0000000'),	
		(SELECT id FROM Pratiquants WHERE nom='Cruz'), 22,0)


-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours
SELECT COUNT(Pr.id) 'Nombre Eleves', 
	   SUM(Pa.PrixFacture) 'Chiffre DAffair', 
	   L.intitule 'NomDeLaSalle', 
	   SUM(Pa.PrixFacture) / COUNT(Pr.id)  'Moyenne par eleve' 
FROM Lieux L 
LEFT JOIN Sessions S ON s.idLieux = L.id
LEFT JOIN Participations Pa ON Pa.IdSession = S.Id
LEFT JOIN Pratiquants Pr ON Pr.id = Pa.IdPratiquant
-- * Essayer sans la clause 'WHERE' pour prendre en compte 'Penelope Cruz' qui est absente 
-- dans la session de tai chi dans la sale 'Swami Chrichri'
WHERE Pa.Presence > 0 
GROUP BY L.intitule

-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :


