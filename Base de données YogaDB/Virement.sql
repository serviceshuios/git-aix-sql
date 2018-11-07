-- Le BEGIN TRANSACTION commence la transaction
BEGIN TRANSACTION
		UPDATE Pratiquants SET Credit=Credit-50
		WHERE Prenom='Penelope'
		-- A partir de ce moment, l'enregistrement de Peneloppe est "Locké"
		-- La donnée est marquée comme non validée
		-- Un autre utilisateur ne pourra pas lire l'enregistrement, sa requête sera en attente
		UPDATE Pratiquants SET Credit=Credit+50
		WHERE Prenom='Toto'

COMMIT
-- Le COMMIT Valide les changements et enlève les verrous
 

