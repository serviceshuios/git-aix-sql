-- On veut le nombre de sessions assurées par professeur
SELECT	
		-- Les colonnes comprises dans le résultat
		P.Nom, 
		P.Prenom ,
		-- Les colonnes calculées par regroupement
		COUNT(S.DateSession) as NbSessions
		-- La première des tables utilisées dans la sélection
		FROM Professeurs P 
		-- Deuxième table
		LEFT JOIN Sessions AS S
		-- Critère de jointure 
		ON P.Id=S.IdProfesseur
		-- Filtre sur les sessions utilisées pour le regroupement
		WHERE DateSession < '31/10/2018'
		-- Les colonnes qui servent à déterminer le regroupement
		GROUP BY P.Id , 
		P.Nom, 
		P.Prenom
		-- Un deuxième filtre qui agit sur les données issues du regroupement
		HAVING COUNT(S.DateSession)<2


