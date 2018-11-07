-- Changement de contexte (de BDD)
-- Sp�cifique SQL SERVER
USE YogaDB

-- Suppression de table
DROP TABLE Pratiquants

-- CREATION DE TABLE
CREATE TABLE Pratiquants(
	-- Cl� primaire (not null et unicit� des valeurs)
	id INT PRIMARY KEY IDENTITY, -- BIGINT SMALLINT TINYINT -- AUTO_INCREMENT mySQL AUTOINCREMENT Access
	prenom NVARCHAR(50) NULL,
	nom NVARCHAR(50)  NULL,
	CP NVARCHAR(20) NULL ,	
	Rue NVARCHAR(250) NULL,
	Ville NVARCHAR(50) NULL,
	NumeroSecu VARCHAR(50) NULL,
	Credit DECIMAL(18,2) NOT NULL DEFAULT 0, -- Type pr�cis (lent lors des calculs)
	Poids Float NULL, --Impr�cis : plus rapide mais donn�es stock�es approximativement (mais avec beaucoup de chiffres apr�s la virgule)
	-- Ajout d'une contrainte sur le cr�dit
	CONSTRAINT CreditPositif CHECK (Credit >=0)
	)


	-- Ajout d'une contrainte sur une table existante
	-- WITH NOCHECK : Ne pas v�rifier la contrainte sur les donn�es existantes
	ALTER TABLE Pratiquants WITH NOCHECK ADD
		CONSTRAINT NomOuPrenonFourni CHECK (prenom IS NOT null OR nom IS NOT null)

	-- Comparaison � null (null= valeur non pr�cis�e)
	-- Une valeur non connue (null) n'est ni �gale ni diff�rente � une autre valeur non connue (null)
	-- null <> null => false;
	-- null = null => false;
	-- Comparaison : prenom IS null
IF(null = null)
	PRINT 'nul' -- PRINT 'nul' n'est pas execut�

	-- Ajout de colonne � une table existante
	-- Si colonne non nullable et donn�es existantes, une valeur par d�faut doit �tre fournie
	ALTER TABLE Pratiquants ADD  Taille Float NOT NULL DEFAULT 0


-- ! Insertion en donnant toujours explicitement le nom des colonnes 
-- Ici, l'id ne doit pas �tre fourni car IDENTITY (Compteur)

INSERT INTO Pratiquants(nom,prenom,cp,ville,rue,NumeroSecu,poids, credit)
VALUES(null,'Dominique','66000','Perpignan',
			'Rue du Pardal','198798797898',78,1)


SELECT * FROM Pratiquants FOR XML AUTO
