USE YogaDB
GO
DELETE FROM Participations
DELETE FROM Sessions
DELETE FROM Professeurs
DELETE FROM Pratiquants

-- Insertion des professeurs
INSERT INTO Professeurs(Nom, Prenom, Taux_Horaire)
VALUES('Mauras','Dominique',15)

INSERT INTO Professeurs(Nom, Prenom, Taux_Horaire)
VALUES('Dalton','Jo',12)

INSERT INTO Professeurs(Nom, Prenom, Taux_Horaire)
VALUES('Chadok','doc',18)

INSERT INTO Professeurs(Nom, Prenom, Taux_Horaire)
VALUES('Black','Jack',19)

INSERT INTO Professeurs(Nom, Prenom, Taux_Horaire)
VALUES('Gable','Clark',19)

-- Insertion des sessions
INSERT INTO Sessions(Intitule,DateSession,IdProfesseur)
SELECT 'Yoga hatha','30-10-2018 14:30', Id 
	FROM Professeurs WHERE Nom='Mauras'

INSERT INTO Sessions(Intitule,DateSession,IdProfesseur)
SELECT 'Yoga bandito','30-10-2018 16:30', Id 
	FROM Professeurs WHERE Nom='Dalton'

INSERT INTO Sessions(Intitule,DateSession,IdProfesseur)
SELECT 'Yoga nidra','30-10-2018 18:30', Id 
	FROM Professeurs	WHERE Nom='Black'

INSERT INTO Sessions(Intitule,DateSession,IdProfesseur)
SELECT 'Yoga hatha','31-10-2018 11:30', Id 
	FROM Professeurs	WHERE Nom='Mauras'

INSERT INTO Sessions(Intitule,DateSession,IdProfesseur)
SELECT 'Yoga bandito','31-10-2018 16:30', Id 
	FROM Professeurs	WHERE Nom='Gable'

INSERT INTO Sessions(Intitule,DateSession,IdProfesseur)
SELECT 'Yoga bidule','31-10-2018 18:30', Id 
	FROM Professeurs	WHERE Nom='Mauras'

INSERT INTO Sessions(Intitule,DateSession,IdProfesseur)
SELECT 'Yoga bandito','31-10-2018 20:30', Id 
	FROM Professeurs	WHERE Nom='Gable'



-- Pratiquants

INSERT INTO Pratiquants(Nom)
VALUES('Brat')

INSERT INTO Pratiquants(Prenom)
VALUES('Angelina')

INSERT INTO Pratiquants(Nom,Prenom)
VALUES('Cruz','Penelope')

INSERT INTO Pratiquants(Prenom)
VALUES('Toto')

INSERT INTO Pratiquants(Nom,Prenom)
VALUES('LeGrand','Alexandre')


-- Participations

-- 30-10-2018 14:30 => Brat, Cruz, Toto
-- 30-10-2018 16:30 => Brat, Toto, Angelina
-- 30-10-2018 18:30 => alexandre
-- 31-10-2018 11:30 => toto, angelina
-- 31-10-2018 16:30 =>
-- 31-10-2018 18:30

-- 30-10-2018 14:30 => Brat, Cruz, Toto
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='30-10-2018 14:30'),	
(SELECT Id FROM Pratiquants WHERE Nom='Brat'),
22)
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='30-10-2018 14:30'),	
(SELECT Id FROM Pratiquants WHERE Nom='Cruz'),
21)
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='30-10-2018 14:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Toto'),
0)

-- 30-10-2018 16:30 => Brat, Toto, Angelina
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='30-10-2018 16:30'),	
(SELECT Id FROM Pratiquants WHERE Nom='Brat'),
12)
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='30-10-2018 16:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Toto'),
15)
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='30-10-2018 16:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Angelina'),
13)


-- 30-10-2018 18:30 => Alexandre
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='30-10-2018 18:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Alexandre'),
22)

-- 31-10-2018 11:30 => Toto, Angelina
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='31-10-2018 11:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Toto'),
13)
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='31-10-2018 11:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Angelina'),
10)

-- 31-10-2018 18:30 = > toto, angelina

INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='31-10-2018 18:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Toto'),
10)
INSERT INTO Participations(IdSession,IdPratiquant, PrixFacture)
VALUES(
-- Requête imbriquée
-- On utilise un select à la place d'une valeur en dur
(SELECT Id FROM Sessions WHERE DateSession='31-10-2018 18:30'),	
(SELECT Id FROM Pratiquants WHERE Prenom='Angelina'),
11)



SELECT * FROM Professeurs
SELECT * FROM Sessions
SELECT * FROM Pratiquants
SELECT * FROM Participations