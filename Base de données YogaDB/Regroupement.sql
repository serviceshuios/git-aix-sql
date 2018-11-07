-- On veut le nombre de sessions assur�es par professeur
SELECT	
		-- Les colonnes comprises dans le r�sultat
		P.Nom, 
		P.Prenom ,
		-- Les colonnes calcul�es par regroupement
		COUNT(S.DateSession) as NbSessions
		-- La premi�re des tables utilis�es dans la s�lection
		FROM Professeurs P 
		-- Deuxi�me table
		LEFT JOIN Sessions AS S
		-- Crit�re de jointure 
		ON P.Id=S.IdProfesseur
		-- Filtre sur les sessions utilis�es pour le regroupement
		WHERE DateSession < '31/10/2018'
		-- Les colonnes qui servent � d�terminer le regroupement
		GROUP BY P.Id , 
		P.Nom, 
		P.Prenom
		-- Un deuxi�me filtre qui agit sur les donn�es issues du regroupement
		HAVING COUNT(S.DateSession)<2


