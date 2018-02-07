create database scoala_s4;
use scoala_s4;

CREATE TABLE profesori (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nume VARCHAR (100) NOT NULL,
prenume VARCHAR (100) NOT NULL,
localitate VARCHAR (100) NOT NULL,
data_angajare DATE NOT NULL,
salariu FLOAT NOT NULL


);

CREATE TABLE cursuri (

id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
denumire VARCHAR (100) NOT NULL UNIQUE,
durata TINYINT NOT NULL
);

CREATE TABLE cursuri_predate (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_profesor INT NOT NULL,
id_curs INT NOT NULL,
CONSTRAINT fk_id_profesor FOREIGN KEY (id_profesor) REFERENCES profesori (id),
CONSTRAINT fk_id_curs FOREIGN KEY (id_curs) REFERENCES cursuri(id)

);

