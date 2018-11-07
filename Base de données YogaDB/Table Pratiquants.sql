-- Changement de contexte (de BDD)
-- Spécifique SQL SERVER
USE YogaDB

-- Suppression de table
DROP TABLE Pratiquants

-- CREATION DE TABLE
CREATE TABLE Pratiquants(
	-- Clé primaire (not null et unicité des valeurs)
	id INT PRIMARY KEY IDENTITY, -- BIGINT SMALLINT TINYINT -- AUTO_INCREMENT mySQL AUTOINCREMENT Access
	prenom NVARCHAR(50) NULL,
	nom NVARCHAR(50)  NULL,
	CP NVARCHAR(20) NULL ,	
	Rue NVARCHAR(250) NULL,
	Ville NVARCHAR(50) NULL,
	NumeroSecu VARCHAR(50) NULL,
	Credit DECIMAL(18,2) NOT NULL DEFAULT 0, -- Type précis (lent lors des calculs)
	Poids Float NULL, --Imprécis : plus rapide mais données stockées approximativement (mais avec beaucoup de chiffres après la virgule)
	-- Ajout d'une contrainte sur le crédit
	CONSTRAINT CreditPositif CHECK (Credit >=0)
	)


	-- Ajout d'une contrainte sur une table existante
	-- WITH NOCHECK : Ne pas vérifier la contrainte sur les données existantes
	ALTER TABLE Pratiquants WITH NOCHECK ADD
		CONSTRAINT NomOuPrenonFourni CHECK (prenom IS NOT null OR nom IS NOT null)

	-- Comparaison à null (null= valeur non précisée)
	-- Une valeur non connue (null) n'est ni égale ni différente à une autre valeur non connue (null)
	-- null <> null => false;
	-- null = null => false;
	-- Comparaison : prenom IS null
IF(null = null)
	PRINT 'nul' -- PRINT 'nul' n'est pas executé

	-- Ajout de colonne à une table existante
	-- Si colonne non nullable et données existantes, une valeur par défaut doit être fournie
	ALTER TABLE Pratiquants ADD  Taille Float NOT NULL DEFAULT 0


-- ! Insertion en donnant toujours explicitement le nom des colonnes 
-- Ici, l'id ne doit pas être fourni car IDENTITY (Compteur)

INSERT INTO Pratiquants(nom,prenom,cp,ville,rue,NumeroSecu,poids, credit)
VALUES(null,'Dominique','66000','Perpignan',
			'Rue du Pardal','198798797898',78,1)


SELECT * FROM Pratiquants FOR XML AUTO
