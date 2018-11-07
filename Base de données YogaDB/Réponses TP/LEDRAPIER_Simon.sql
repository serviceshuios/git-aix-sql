--| L'école de Yoga a maintenant plusieurs salles de formation
--| Objectif : Modifier la base de données pour prendre en compte les salles de formation 
--|__________________________________________________________________________________________


--| Information sur les salles : Intitule,surface, prix du loyer
--|
--| Il y a deux salles 
--|  Intitule         Surface       PrixLoyer
--|  Swami Crachra    26.7		   876.60
--|  Swami Chrichri   36.7		   980.00
--|__________________________________________________________________________________________

-- Les sessions passées on eut lieu dans la salle Swami Crachra

-- Ajouter une ou plusieurs sessions dans la salle Swami Chrichri

-- On veut obtenir le CA de chaque salle, ainsi que le nombre d'élèves
-- y ayant fait des cours

-- Copier  ci-dessous les scripts permettant de réaliser ces opérations :

--______________________________
--|                             |
--|       RESULTATS             |
--|_____________________________|


--//1\\ Création de la table Salles

--Placement dans la BDD YogaDB
USE YogaDB

--CREATION DE LA TABLE
CREATE TABLE Salles(
	IdSalle UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Intitule NVARCHAR(250) NOT NULL,
	Surface FLOAT NOT NULL,
	PrixLoyer DECIMAL(9,2) NOT NULL

)

--//2\\AJOUT DE LA RELATION ENTRE LA TABLE "SESSIONS" ET "SALLES"
ALTER TABLE Sessions
ADD IdSalle UNIQUEIDENTIFIER,
	CONSTRAINT Sessions_Salles 
		FOREIGN KEY (IdSalle)
		REFERENCES Salles(IdSalle)


--//3\\ INSERTION DES DEUX ENREGISTREMENTS DANS LA TABLE "SALLES"
INSERT INTO Salles(Intitule,Surface,PrixLoyer)
VALUES('Swami Crachra', 26.7, 876.60)

INSERT INTO Salles(Intitule,Surface,PrixLoyer)
VALUES('Swami Chrichri', 36.7, 980.00)

--VERIFICATION DE L'ENREGISTREMENT DANS LA TABLE "SALLES"
SELECT * FROM Salles


--//4\\ METTRE A JOUR LA TABLE DES SESSIONS DEJA PASSEE EN AJOUTANT LE NOM DE LA SALLE
--L'IDENTIFIANT DE LA SALLE 'SWAMI CRACHRA' EST :C1C472A6-BB06-47F2-AB6B-58D844A3A69F
UPDATE Sessions SET IdSalle ='C1C472A6-BB06-47F2-AB6B-58D844A3A69F'


--//5\\AJOUTER PLUSIEURS SESSION UTILISANT LA NOUVELLE SALLE ('SWAMI CHRICHRI')
INSERT INTO Sessions(Intitule,DateSession,IdProfesseur,IdSalle)
VALUES('Yoga hatha', '31-10-2018 14:30', '3FA66130-76BB-40F4-A369-7C519C8D53C8', '55EB36A6-C524-4A17-8558-C0DA538F3A1E') 

INSERT INTO Sessions(Intitule,DateSession,IdProfesseur,IdSalle)
VALUES('Yoga bandito', '31-10-2018 18:30', 'C352B3B8-86DF-4688-A992-7BFCA76E5A07', '55EB36A6-C524-4A17-8558-C0DA538F3A1E') 

--//6\\CALCUL DU CA DE CHAQUE SALLE
SELECT Sa.Intitule,
COUNT(P.IdPratiquant) as [Nombre Inscrits],
SUM(ISNULL(P.PrixFacture,0)) as [CA par Session]
 FROM Participations AS P
	INNER JOIN Sessions AS S
		ON S.Id = S.Id
	INNER JOIN Salles AS Sa
		ON Sa.IdSalle = S.Id

			GROUP BY Sa.Intitule