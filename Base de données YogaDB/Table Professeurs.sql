USE YogaDB
DROP TABLE Professeurs
CREATE TABLE Professeurs(
	-- UniqueIdentifier : Identifiant g�n�r� al�atoirement
	-- avec une probabilit� de doublon infime
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
	Nom NVARCHAR(50) NOT NULL,
	Prenom NVARCHAR(50) NOT NULL,
	Taux_Horaire DECIMAL(9,2) NOT NULL DEFAULT 0
)
-- Suppression des professeurs
DELETE FROM Professeurs

-- Ajout d'un professeur avec un id donn� de fa�on fixe
INSERT INTO Professeurs(id,nom,prenom,taux_horaire)
VALUES('BE4F2FC1-C6B2-4219-85F6-5EC171E9E7F8','Mauras','Dominique',1556)

-- Ajout d'un professeur avec id g�n�r� par la fonction newid()
INSERT INTO Professeurs(id,nom,prenom,taux_horaire)
VALUES(newid(),'Dalton','Jo',1556)

-- Ajout d'un professeur en utilisant la valeur par d�faut
INSERT INTO Professeurs(nom,prenom,taux_horaire)
VALUES('Chadok','Jack',1556)

-- Ajout d'un professeur
INSERT INTO Professeurs(nom,prenom,taux_horaire)
VALUES('Chadok','Juliette',1556)



