/* creare baza de date cu numele bdcurs5; */
CREATE DATABASE bdcurs5;

/* instructiune pentru setare ca baza de date curenta (activa) a BD bdcurs5 */
USE bdcurs5;

/* creare tabela departamente */
CREATE TABLE departamente(
	id_departament int(5) AUTO_INCREMENT PRIMARY KEY,
	denumire varchar(100)
);

/* creare tabela angajati */
CREATE TABLE angajati(
	id_angajat int(5) AUTO_INCREMENT PRIMARY KEY,
	nume varchar(100),
	prenume varchar(100),
	data_nasterii date,
	data_angajarii date,
	salariu double(7,2),
	manager int(5),
	id_departament int(5),
	FOREIGN KEY (id_departament) REFERENCES departamente(id_departament)
);

/* inserare inregistrari in tabela departamente */
INSERT INTO departamente (denumire) VALUES
('Financiar'),
('Juridic'),
('IT'),
('Logistica');

/* inserare inregistrari in tabela angajati */
INSERT INTO angajati (nume,prenume,data_nasterii,data_angajarii,salariu,manager,id_departament) VALUES
('Ionescu','Ioana','1984-10-20','2013-05-01',1500,2,1),
('Popescu','Maria','1981-07-05','2012-11-10',2900,7,1),
('Georgescu','Adrian','1975-02-11','2011-08-14',2300,2,1),
('Vlad','Adrian','1980-01-20','2015-02-01',1500,2,3),
('Ionescu','Alexandru','1968-03-02','2013-09-01',1800,4,3),
('Popescu','Ioana','1984-10-01','2015-05-18',1200,2,1),
('Stefan','Marian','1970-06-11','2010-08-23',3500,7,2),
('Ionescu','Ion','1971-11-22','2013-06-19',1500,2,1),
('Cristea','Andreea','1989-01-20','2015-06-01',1200,4,3),
('Gheorgiu','Alin','1978-08-14','2010-11-01',2300,7,2),
('Teodorescu','Maria','1980-10-20','2013-05-24',1500,2,1),
('Ionescu','Alina','1989-10-22','2015-06-01',2100,2,1),
('Popescu','Alina','1989-01-01','2015-06-01',1850,4,4),
('Stefan','Cristian','1978-01-14','2010-03-01',1450,4,4),
('Teodorescu','Teodor','1986-10-20','2014-08-01',1500,4,4);

