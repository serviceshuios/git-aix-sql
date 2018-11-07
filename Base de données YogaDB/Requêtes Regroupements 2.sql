SELECT * FROM SessionsRentables

ALTER VIEW SessionsRentables AS
SELECT Id, DateSession,[Chiffre Affaire] FROM CAParSession
WHERE [Chiffre Affaire]>20



ALTER VIEW CAParSession AS
SELECT S.Id, S.DateSession
		,COUNT( P.IdPratiquant) [Nombre Inscrits]
		,  SUM(ISNULL(P.PrixFacture,0)) [Chiffre Affaire]
		, SUM(ISNULL(CASE P.Presence  WHEN 0 THEN 0 WHEN 1 THEN 1 END,0)) [Nombre présences]
		
FROM Participations AS P
RIGHT JOIN Sessions AS S
ON S.Id=P.IdSession
GROUP BY S.Id,S.DateSession
