-- Correction TP 
-- Obtenir les données intéressantes avant le regroupement
SELECT Pr.id,Pr.nom, Pr.prenom, 
		P.PrixFacture, P.IdSession 
		FROM Pratiquants Pr
LEFT JOIN Participations P
ON P.IdPratiquant=Pr.id
ORDER BY Pr.Nom, Pr.Prenom

-- Regroupement
SELECT Pr.id,
		CONCAT(Pr.Nom,Pr.Prenom) as NomComplet,
		SUM(ISNULL(P.PrixFacture,0)) CA,
		COUNT( P.IdSession ) as NombreSessions
		FROM Pratiquants Pr LEFT JOIN Participations P
ON P.IdPratiquant=Pr.id
GROUP BY Pr.id,CONCAT(Pr.Nom,Pr.Prenom) 

-- En tenant compte de la date de session
SELECT Pr.id,Pr.nom, Pr.prenom, 
		P.PrixFacture, P.IdSession,
		S.DateSession
		FROM Pratiquants Pr

LEFT JOIN Participations P
ON P.IdPratiquant=Pr.id

LEFT JOIN Sessions S
ON P.IdSession=S.Id

WHERE S.DateSession 
	BETWEEN  DATEADD(Month,-1,GETDATE()) AND GETDATE()

--UPDATE Sessions SET DateSession='10/09/2018 14:30'
--WHERE Id='9F4326DA-B11C-434B-998F-D8FF49821255'

-- Regroupement 2
SELECT Pr.id,
		CONCAT(Pr.Nom,Pr.Prenom) as NomComplet,
		SUM(ISNULL(P.PrixFacture,0)) CA,
		COUNT( P.IdSession ) as NombreSessions
		FROM Pratiquants Pr LEFT JOIN Participations P
ON P.IdPratiquant=Pr.id
LEFT JOIN Sessions S
ON P.IdSession=S.Id
WHERE S.DateSession 
BETWEEN  DATEADD(Month,-1,GETDATE()) AND GETDATE()
GROUP BY Pr.id,CONCAT(Pr.Nom,Pr.Prenom) 