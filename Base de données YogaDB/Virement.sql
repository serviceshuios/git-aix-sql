-- Le BEGIN TRANSACTION commence la transaction
BEGIN TRANSACTION
		UPDATE Pratiquants SET Credit=Credit-50
		WHERE Prenom='Penelope'
		-- A partir de ce moment, l'enregistrement de Peneloppe est "Lock�"
		-- La donn�e est marqu�e comme non valid�e
		-- Un autre utilisateur ne pourra pas lire l'enregistrement, sa requ�te sera en attente
		UPDATE Pratiquants SET Credit=Credit+50
		WHERE Prenom='Toto'

COMMIT
-- Le COMMIT Valide les changements et enl�ve les verrous
 

