CREATE DATABASE university;

USE university;
-- creazione tabella Dipartimenti
CREATE TABLE dipartimenti(

	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	indirizzo VARCHAR(50),
	direttore VARCHAR(30) NOT NULL,
	PRIMARY KEY (`id`)

);
-- creazione tabella Corsi di Laurea
CREATE TABLE corsi_di_laurea(

	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	sede VARCHAR(50) NOT NULL,
	classe VARCHAR(6),
	PRIMARY KEY (`id`)

);
-- creazione tabella Corsi
CREATE TABLE corsi(

	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	ore_previste INT NOT NULL,
	PRIMARY KEY (`id`)

);
-- creazione tabella Studenti
CREATE TABLE Studenti(

	Matricola BIGINT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	cognome VARCHAR(30) NOT NULL,
	codice_fiscale VARCHAR(16) NOT NULL,
	email VARCHAR(40) NOT NULL,
	PRIMARY KEY (`Matricola`)

);
-- modifica il tipo di variabile della colonna Matricola nella tabella Studente
ALTER TABLE university.studenti MODIFY COLUMN Matricola BIGINT auto_increment NOT NULL;
-- creazione tabella Insegnanti
CREATE TABLE insegnanti(

	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	cognome VARCHAR(30) NOT NULL,
	indirizzo_ufficio VARCHAR(16),
	email VARCHAR(40) NOT NULL,
	ricevimento VARCHAR(15) NOT NULL,
	PRIMARY KEY (`id`)

);
-- aggiunta colonne foreign key
ALTER TABLE studenti ADD COLUMN id_corso_di_laurea INT NOT NULL;
ALTER TABLE corsi_di_laurea ADD COLUMN id_dipartimento INT NOT NULL;

ALTER TABLE studenti ADD FOREIGN KEY(id_corso_di_laurea) REFERENCES corsi_di_laurea(id);
ALTER TABLE corsi_di_laurea ADD FOREIGN KEY(id_dipartimento) REFERENCES dipartimenti(id);
-- creazione tabella ponte tra corsi e corsi di laurea per il collegamento many-to-many
CREATE TABLE corsi_di_laurea_corsi(

	id_corsi_di_laurea INT NOT NULL,
	id_corsi INT NOT NULL,
	FOREIGN KEY (id_corsi_di_laurea) REFERENCES corsi_di_laurea(id),
	FOREIGN KEY (id_corsi) REFERENCES corsi(id)

);
-- creazione tabella ponte tra insegnanti e corsi per il collegamento many-to-many
CREATE TABLE insegnanti_corsi(

	id_insegnanti INT NOT NULL,
	id_corsi INT NOT NULL,
	FOREIGN KEY (id_insegnanti) REFERENCES insegnanti(id),
	FOREIGN KEY (id_corsi) REFERENCES corsi(id)

);
-- inserimento dati
INSERT INTO university.dipartimenti
(nome, indirizzo, direttore)
VALUES('Dipartimento di Ingegneria', 'piazzale Tecchio', 'Bob');

INSERT INTO university.corsi_di_laurea
(nome, sede, classe, id_dipartimento)
VALUES('Ingegneria informatica', 'San Giovanni', 'Ml-01', 1);

INSERT INTO university.corsi
(nome, ore_previste)
VALUES('Analisi', 25);

INSERT INTO university.corsi 
(nome, ore_previste)
VALUES('Fisica', 25);

INSERT INTO university.corsi_di_laurea_corsi
(id_corsi_di_laurea, id_corsi)
VALUES(1, 1);

INSERT INTO university.corsi_di_laurea_corsi
(id_corsi_di_laurea, id_corsi)
VALUES(1, 2);