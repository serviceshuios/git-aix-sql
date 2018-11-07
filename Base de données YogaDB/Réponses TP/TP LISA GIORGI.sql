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

USE YogaDB
GO

DELETE FROM Salles
-- CREATION DE LA TABLE SALLES
CREATE TABLE Salles(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Intitule_salle NVARCHAR (50) NOT NULL,
	Surface NVARCHAR (50) NOT NULL,
	Prix_loyer DECIMAL(9,2) NOT NULL,
)


-- Dans une salle il y a plusieurs sessions, par contre une session à lieux dans une seule salle
-- Du coup DANS LA CREATION GLOBALE: 
-- Je rajoute l'id-salles FOREIGN KEY en dehors de la table classe mais à la suite:

-- ALTER TABLE Sessions ADD
--	IdSalle UNIQUEIDENTIFIER NOT NULL

--ALTER TABLE Sessions ADD
--	CONSTRAINT Sessions_Salles
--		FOREIGN KEY (IdSalle)
--		REFERENCES Salles(Id)


--INSERTION DES DEUX SALLES
GO
INSERT INTO Salles (Intitule_salle, Surface, Prix_loyer)
VALUES('Swami Crachra','26.7',876.60)

INSERT INTO Salles (Intitule_salle, Surface, Prix_loyer)
VALUES('Swami Chrichri','36.7',980.00)

SELECT * FROM Salles


-- Les Sessions passé ont lieux dans la salle Swami Crachra 
-- On a déjà inséré l'IdSalle dans la table Session
-- On doit maintenant associé les session à une salle : cad ont doit faire inserer Intitule de Salle à chaque session : 
-- ON cherche à selectionner l'intitule de la salle dans la table salle et inserer dans table session :



INSERT INTO Sessions 
-- peut être il faut ajouter que chaque session est dans la salle crachra
SELECT DateSession FROM Salles
WHEN DateSession NOW()
WHERE Intitule_salle='Swami Crachra'
WHEN DateSession DATEADD( MONTH, +1)
WHERE Intitule_salle='Swami Chrichri'

INSERT INTO Sessions 
SELECT Intitule_salle FROM Salles
WHERE Id.Salles


-- On souhaite ensuite obtenir le chiffre d'affaire de chaque salle et le nombre d'élève y ayant fait des cours :


