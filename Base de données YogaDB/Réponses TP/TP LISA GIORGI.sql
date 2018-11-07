-- L'�cole de Yoga a maintenant plusieurs salles de formation
-- Objectif : Modifier la base de donn�es pour prendre en compte les salles de formation 


-- Information sur les salles : Intitule,surface, prix du loyer

-- Il y a deux salles 
--  Intitule         Surface       PrixLoyer
--  Swami Crachra    26.7		   876.60
--  Swami Chrichri   36.7		   980.00

-- Les sessions pass�es on eut lieu dans la salle Swami Crachra

-- Ajouter une ou plusieurs sessions dans la salle Swami Chrichri

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'�l�ves
-- y ayant fait des cours

-- Copier  ci-dessous les scripts permettant de r�aliser ces op�rations :

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


-- Dans une salle il y a plusieurs sessions, par contre une session � lieux dans une seule salle
-- Du coup DANS LA CREATION GLOBALE: 
-- Je rajoute l'id-salles FOREIGN KEY en dehors de la table classe mais � la suite:

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


-- Les Sessions pass� ont lieux dans la salle Swami Crachra 
-- On a d�j� ins�r� l'IdSalle dans la table Session
-- On doit maintenant associ� les session � une salle : cad ont doit faire inserer Intitule de Salle � chaque session : 
-- ON cherche � selectionner l'intitule de la salle dans la table salle et inserer dans table session :



INSERT INTO Sessions 
-- peut �tre il faut ajouter que chaque session est dans la salle crachra
SELECT DateSession FROM Salles
WHEN DateSession NOW()
WHERE Intitule_salle='Swami Crachra'
WHEN DateSession DATEADD( MONTH, +1)
WHERE Intitule_salle='Swami Chrichri'

INSERT INTO Sessions 
SELECT Intitule_salle FROM Salles
WHERE Id.Salles


-- On souhaite ensuite obtenir le chiffre d'affaire de chaque salle et le nombre d'�l�ve y ayant fait des cours :


