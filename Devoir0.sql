-- Créer la base de données
CREATE DATABASE Centre_formation;
USE Centre_formation;

-- Créer la table des centres de formation
CREATE TABLE Etudiant (
    NumCINETu INT PRIMARY KEY,
    NomEtu VARCHAR(50),
    PrenomEtu VARCHAR(50),
    DateNaissance DATE,
    AdresseEtu VARCHAR(100),
    VilleEtu VARCHAR(50),
    NiveauEtu VARCHAR(20)
);

CREATE TABLE Session (
    codeSess INT PRIMARY KEY,
    nomSess VARCHAR(50),
    dateDebut DATE,
    dateFin DATE
);

CREATE TABLE Specialite (
    codeSpec INT PRIMARY KEY,
    nomSpec VARCHAR(50),
    descSpec TEXT
);

CREATE TABLE Formation (
    codeForm INT PRIMARY KEY,
    titreForm VARCHAR(50),
    dureeForm INT,
    prixForm DECIMAL(10, 2)
);

CREATE TABLE Inscription (
    NumCINETu INT,
    codeSess INT,
    typeCours VARCHAR(20) NOT NULL, -- Ajout de la contrainte NOT NULL
    PRIMARY KEY (NumCINETu, codeSess),
    FOREIGN KEY (NumCINETu) REFERENCES Etudiant(NumCINETu),
    FOREIGN KEY (codeSess) REFERENCES Session(codeSess)
);

-- Ajouter la contrainte CHECK pour dateFin dans la table Session
ALTER TABLE Session
ADD CONSTRAINT chk_date CHECK (dateFin > dateDebut);

-- Ajouter la colonne Active dans la table Specialite
ALTER TABLE Specialite
ADD Active BOOLEAN DEFAULT TRUE;
