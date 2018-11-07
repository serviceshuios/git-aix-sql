CREATE VIEW CAParProf AS
SELECT Pr.Nom,
	COUNT(DISTINCT S.Id) NombreSessions, 
	COUNT(Pa.IdPratiquant) NombreInscrits,
	ISNULL(SUM(Pa.PrixFacture)/COUNT(DISTINCT S.Id),0) as Moyenne,
	SUM(ISNULL(Pa.PrixFacture,0)) CA FROM 
	Professeurs Pr LEFT JOIN Sessions S ON Pr.Id=S.IdProfesseur 
	LEFT JOIN Participations Pa ON S.Id=Pa.IdSession
GROUP BY Pr.Nom
WITH ROLLUP

SELECT Pr.Nom,S.id as IdSession,Pa.IdPratiquant FROM Professeurs PR
LEFT JOIN Sessions S ON Pr.Id=S.IdProfesseur
LEFT JOIN Participations Pa ON S.Id=Pa.IdSession