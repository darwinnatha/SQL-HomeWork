#------------------------------------------------------------
# Table: Producteur
#------------------------------------------------------------

CREATE TABLE Producteur(
        NomProducteur Varchar (50) NOT NULL ,
        adresseProd   Varchar (50) NOT NULL
	,CONSTRAINT Producteur_PK PRIMARY KEY (NomProducteur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Revenus Annuels
#------------------------------------------------------------

CREATE TABLE Revenus_Annuels(
        annee Date NOT NULL
	,CONSTRAINT Revenus_Annuels_PK PRIMARY KEY (annee)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Acteur
#------------------------------------------------------------

CREATE TABLE Acteur(
        nomActeur     Varchar (50) NOT NULL ,
        prenomActeur  Varchar (50) NOT NULL ,
        taille        Numeric NOT NULL ,
        poids         Numeric NOT NULL ,
        dateNaissance Date NOT NULL ,
        revenus       Int NOT NULL ,
        annee         Date
	,CONSTRAINT Acteur_PK PRIMARY KEY (nomActeur,prenomActeur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Film
#------------------------------------------------------------

CREATE TABLE Film(
        titreFilm        Varchar (50) NOT NULL ,
        anneeSortie      Date NOT NULL ,
        realisateur      Varchar (50) NOT NULL ,
        scenariste       Varchar (50) NOT NULL ,
        titreFilm_Remake Varchar (50) NOT NULL
	,CONSTRAINT Film_PK PRIMARY KEY (titreFilm)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Finance
#------------------------------------------------------------

CREATE TABLE Finance(
        titreFilm     Varchar (50) NOT NULL ,
        NomProducteur Varchar (50) NOT NULL ,
        MontantFin    Numeric NOT NULL
	,CONSTRAINT Finance_PK PRIMARY KEY (titreFilm,NomProducteur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Est remunere
#------------------------------------------------------------

CREATE TABLE Est_remunere(
        nomActeur    Varchar (50) NOT NULL ,
        prenomActeur Varchar (50) NOT NULL ,
        titreFilm    Varchar (50) NOT NULL ,
        cachet       Varchar (50) NOT NULL ,
        pourcentage  Int NOT NULL
	,CONSTRAINT Est_remunere_PK PRIMARY KEY (nomActeur,prenomActeur,titreFilm)
)ENGINE=InnoDB;




ALTER TABLE Acteur
	ADD CONSTRAINT Acteur_Revenus_Annuels0_FK
	FOREIGN KEY (annee)
	REFERENCES Revenus_Annuels(annee);

ALTER TABLE Film
	ADD CONSTRAINT Film_Film0_FK
	FOREIGN KEY (titreFilm_Remake)
	REFERENCES Film(titreFilm);

ALTER TABLE Film 
	ADD CONSTRAINT Film_Film0_AK 
	UNIQUE (titreFilm_Remake);

ALTER TABLE Finance
	ADD CONSTRAINT Finance_Film0_FK
	FOREIGN KEY (titreFilm)
	REFERENCES Film(titreFilm);

ALTER TABLE Finance
	ADD CONSTRAINT Finance_Producteur1_FK
	FOREIGN KEY (NomProducteur)
	REFERENCES Producteur(NomProducteur);

ALTER TABLE Est_remunere
	ADD CONSTRAINT Est_remunere_Acteur0_FK
	FOREIGN KEY (nomActeur,prenomActeur)
	REFERENCES Acteur(nomActeur,prenomActeur);

ALTER TABLE Est_remunere
	ADD CONSTRAINT Est_remunere_Film1_FK
	FOREIGN KEY (titreFilm)
	REFERENCES Film(titreFilm);
