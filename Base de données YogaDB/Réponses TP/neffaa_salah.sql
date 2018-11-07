-- L'école de Yoga a maintenant plusieurs salles de formation
-- Objectif : Modifier la base de données pour prendre en compte les salles de formation 


-- Information sur les salles : Intitule,surface, prix du loyer

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

-- Les sessions passées on eut lieu dans la salle Swami Crachra

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours

-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :


use YogaDB2
GO

-- Creation table Salles
CREATE TABLE Salles(
	IdLieu UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Intitule NVARCHAR(250) NOT NULL DEFAULT 'Swami Crachra',
	Surface DECIMAL(9,1) NOT NULL DEFAULT 0,
	Loyer DECIMAL(9,2) NOT NULL DEFAULT 876.60
)
GO

-- Insertion valeurs dans Salles
INSERT INTO Salles(Intitule,Surface,Loyer)
VALUES('Swami Crachra',26.7,876.60)

INSERT INTO Salles(Intitule,Surface,Loyer)
VALUES('Swami Crichri',36.7,980.60)
GO


-- Ajout colonne dans Session correspondant au lieu
ALTER TABLE Sessions
ADD IdSalle UNIQUEIDENTIFIER
CONSTRAINT Sessions_Salles
FOREIGN KEY (IdSalle)
REFERENCES [Salles](IdLieu)
GO

-- lieu par défaut swami crachra pour les sessions existantes
UPDATE Sessions
SET idSalle=(SELECT idLieu FROM Salles WHERE Intitule='Swami Crachra')

GO


INSERT INTO Sessions(Intitule,DateSession,NombreMaxParticipants,IdProfesseur,IdSalle)
SELECT  'Yoga Ashtanga',
		'03-11-2018 18:00',
		10, 
		(SELECT Id FROM Professeurs WHERE Nom='Dalton'),
		(SELECT IdLieu FROM Salles WHERE Intitule='Swami Crichri')

INSERT INTO Sessions(Intitule,DateSession,NombreMaxParticipants,IdProfesseur,IdSalle)
SELECT  'Yoga nidra',
		'07-11-2018 14:30',
		8, 
		(SELECT Id FROM Professeurs WHERE Nom='Gable'),
		(SELECT IdLieu FROM Salles WHERE Intitule='Swami Crichri')

GO

INSERT INTO Participations(IdSession,IdPratiquant,DateInscription,PrixFacture)
VALUES('888BF698-0BD3-4098-9C1F-4B0A61577DBB','6',getdate(),15)

INSERT INTO Participations(IdSession,IdPratiquant,DateInscription,PrixFacture)
VALUES('888BF698-0BD3-4098-9C1F-4B0A61577DBB','5',getdate(),15)

INSERT INTO Participations(IdSession,IdPratiquant,DateInscription,PrixFacture)
VALUES('888BF698-0BD3-4098-9C1F-4B0A61577DBB','8',getdate(),15)

INSERT INTO Participations(IdSession,IdPratiquant,DateInscription,PrixFacture)
VALUES('6EF2275C-F77B-4215-B835-EE388D08AE59','4',getdate(),35)



SELECT SL.Intitule, PR.IdPratiquant, PR.PrixFacture FROM Sessions SS RIGHT JOIN Salles SL
ON SS.idSalle = SL.IdLieu
INNER JOIN Participations PR
ON SS.Id = PR.IdSession

