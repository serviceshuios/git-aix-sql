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

-- je cree la table SalleFormation
USE YogaDB
GO
CREATE TABLE SalleFormation (
IdSalleFormation INT PRIMARY  KEY IDENTITY, -- incrementation automatique pour ma clé primaire 
Intitule NVARCHAR(50) NULL,
Surface DECIMAL(9,2) NULL,
PrixLoyer DECIMAL(9,2) NOT NULL DEFAULT 900,
)
GO

-- je dois ALLER Rajouter Une ligne dans ma table SESSIOn avec un lien vers l'ID de la table SALLE de FORMATION
ALTER TABLE Sessions 
	ADD IdSalle INT 

ALTER TABLE Sessions ADD
		CONSTRAINT Sessions_SalleFormation 
		FOREIGN KEY (IdSalle)
		REFERENCES SalleFormation(IdSalleFormation)





	-- 	INSERER dans les SESSIONS PASSEES LES La SALLE SWAMI Crachra 
	-- je dois aller CHERCHER  DANS LA TABLE SESSION TOUTES LES SESSIONS PASSEES ET INSERER  LA SALLE SWAMI
	-- je dois AVANT CREER LA SALLE SWAMI DANS LA TABLE SALLE

	INSERT INTO SalleFormation(Intitule,Surface,PrixLoyer)
    VALUES('Swami Crachra',26.7,876.60)
	-- je cree dans ma table SalleFormation Ma Salle Chrichri
	INSERT INTO SalleFormation(Intitule,Surface,PrixLoyer)
    VALUES('Swami Chrichri',36.7,980.00)

	-- je veux creer une vue avec le contenu de mon tableau Salle de formation 
	CREATE VIEW LES_Salles_FORMATIONS AS
	SELECT * FROM SalleFormation
	-- JE vois que l' ID de MA SALLE DE SWAMI Cracha est 1

	-- SELECTION DANS LA TABLE SESSION DE TOUTES LES SELECTIONS PASSEES
	SELECT * FROM Sessions AS S 
	WHERE S.DateSession < GETDATE()

	--FAIRE LA MODIFICATION DANS LA TABLE OU LA DATE DE SESSION SONT PASSEES 
	INSERT INTO SESSION(IdSalle)
SELECT -----
	FROM SESSION	WHERE S.DateSession < GETDATE()

	---- je veux afficher le chiffre d'affaire de chaque salle , il va falloir faire une requete en joignant les autres TABLES SESSIONS et PARTICIPATION
	SELECT * FROM SalleFormation
	INNER JOIN 

