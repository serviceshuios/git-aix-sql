-- connaitre le chiffre daffaire le nombre de session par eleve sur le mois passer
SELECT Pr.Nom,
      COUNT(DISTINCT S.Id) NombreSessions,
	  COUNT(Pa.IdPratiquant) NombreInscritsMoispasser,
	  SUM(ISNULL(Pa.PrixFacture,0)) CA FROM 
	   Professeurs Pr LEFT JOIN Sessions S ON Pr.Id=S.IdProfesseur 
	   GROUP BY Pr.Nom