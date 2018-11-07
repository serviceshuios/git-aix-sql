USE YogaDB

DROP TABLE Participations
CREATE TABLE Participations(

	IdSession UNIQUEIDENTIFIER NOT NULL,
	IdPratiquant INT NOT NULL,
	DateInscription DATETIME NOT NULL DEFAULT Getdate(),
	PrixFacture DECIMAL(9,2) NOT NULL,
	Presence BIT DEFAULT 1,

	CONSTRAINT Participations_Sessions 
		FOREIGN KEY (IdSession)
		REFERENCES [Sessions](Id),
	CONSTRAINT Participations_Pratiquants
		FOREIGN KEY (IdPratiquant)
		REFERENCES Pratiquants(Id),
	CONSTRAINT Pk_Participations PRIMARY KEY(IdSession,IdPratiquant)
)